Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787CE44D566
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 11:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbhKKK7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 05:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhKKK7k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 05:59:40 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B24C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 02:56:51 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id l7krmrrxtfwDFl7lAmHty9; Thu, 11 Nov 2021 11:56:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636628208; bh=eLzjNAz4PZm6YrhedqV2ssy0JGdYRnUC6ljcFlEBIew=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iNjLiWaq4jbF11Tyov6fznfG7y7c6geCpooWQgiRVcKp911AJVgqDKnDBzURXkZYx
         jzJCEAL1bCahTWSlxiWaVgWKE4G578fdFg6FHKfFfCAfeGK2CaKVmzxQjCyzJQRkSg
         hcxFIjr9pB7rWsgRHNQwVR2nS5xdDZrukp95EtAXDmoM+Xe6ct6KXCHpOPugBHc38s
         6WWSb6gornLqJRc+mBuYXeW18XbPfhrS8HuXXEXOuAO8TLUwB6ePDn2aDpvTdLz+7b
         fOtAAB03Mu0M0sgAMa8OE+TEBijehfth3XGHwseGutAtY4cq4pm3uw42Vpg1LmSgli
         /xOHPlccPyqFw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] vb2: frame_vector.c: don't overwrite error code
Message-ID: <d34a5c7d-a0ba-f5ef-6cde-2ba12ec05219@xs4all.nl>
Date:   Thu, 11 Nov 2021 11:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMpPs2qoFfAWhbt/LvVN2CjOJj5+8ladBsLC2ixj8BWI8f+Ha3EFhhCXT/Tc78tEliTcpwLofe26YMBhnOERPlvduAGVqSHgfu0PrM0B0uE4OQ+BlZt6
 DKLpoqwycvCOY+1W+AxTzGHjaCzegmjsXpHhP43Om8vDqoWeg9YBM6mHzeYKLi/l8bVkJWRHhZmyEFbFI0QqWhRcm2z7uZTTkN0Zw+8olJfGTGkYkQsigJMs
 +tzCd1v1Uz/msFZ2BvZqtb6BV8/YGuhNTJzNptagMBa3JFtwcbwBPUW8fPi+XbQ/ZM9xCXiWVVE73Ow23tavYA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

get_vaddr_frames() first calls pin_user_pages_fast() and if
that fails tries follow_pfn(). But if that also fails, then
the error code from pin_user_pages_fast() is overwritten with
the error code from follow_pfn().

Specifically if pin_user_pages_fast() returns -ENOMEM, then
follow_pfn() will overwrite that with -EINVAL, which is very
confusing.

So store the error code from pin_user_pages_fast() and return
that if follow_pfn() returns -EINVAL. -EINVAL indicates that
the page is unsuitable for follow_pfn, so pin_user_pages_fast()
was the correct call to make, and that error code should be
returned instead.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/videobuf2/frame_vector.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
index ce879f6f8f82..542dde9d2609 100644
--- a/drivers/media/common/videobuf2/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -37,6 +37,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
+	int ret_pin_user_pages_fast = 0;
 	int ret = 0;
 	int err;

@@ -56,6 +57,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 		vec->is_pfns = false;
 		goto out_unlocked;
 	}
+	ret_pin_user_pages_fast = ret;

 	mmap_read_lock(mm);
 	vec->got_ref = false;
@@ -71,7 +73,18 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 		while (ret < nr_frames && start + PAGE_SIZE <= vma->vm_end) {
 			err = follow_pfn(vma, start, &nums[ret]);
 			if (err) {
-				if (ret == 0)
+				if (ret)
+					goto out;
+				// If follow_pfn() returns -EINVAL, then this
+				// is not an IO mapping or a raw PFN mapping.
+				// In that case, return the original error from
+				// pin_user_pages_fast(). Otherwise this
+				// function would return -EINVAL when
+				// pin_user_pages_fast() returned -ENOMEM,
+				// which makes debugging hard.
+				if (err == -EINVAL && ret_pin_user_pages_fast)
+					ret = ret_pin_user_pages_fast;
+				else
 					ret = err;
 				goto out;
 			}
-- 
2.33.0

