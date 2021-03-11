Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34271337369
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 14:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233463AbhCKNHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 08:07:24 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:56843 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233141AbhCKNHP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 08:07:15 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KL1ylP3155C8yKL22leX4Z; Thu, 11 Mar 2021 14:07:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615468034; bh=LQtj31xKqWUzskmx3NImeSVAili3jgFq+vu+BR5DULA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LniU8jKH7/6mSWPHVG4k5O8J2L2o+LS37j+3nqp6BWT5GiJdzy3KseJEK7cTiuXss
         O47vXhyCEIjqJWC34g5kLQOEWq0EdSSBTE7fsupzfh47PIYL+aas4c2Aev+ffb40kQ
         idrmqrPiO+1VZ124ruZ/yNYSBnPx7dgBFPQ6vPLxUqfrLQ6RnNZap6rbotCTWs0/zU
         eCh1iXPuIQWOo+i/IMmo7jABvXPPBsT8DM0GOByorOXm02Ka+RWnc45952efCRg/DU
         m4cAdJHYyRpeO9W5L2Bb38QzN9bsFFGCORhUPjaxpmYrGag0/vsAWS+fJr3zWSnXY1
         hnHj9C2NuYOlA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-ioctl.c: fix timestamp format
Message-ID: <07d93c97-9061-b64d-9419-7fc7324493c8@xs4all.nl>
Date:   Thu, 11 Mar 2021 14:07:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGAmcUpvtNmzOilbQC3mxc0fYq69WOmNeYAYU4cWibToPIvY0FmXbPVx0I444+5m0ibAP/6n/jDSz4YG+TLDYfPwas/ugNHdmWsqHzGEIwJQ8K1NaTED
 NapPvqL238RNUfSZkmT9iUZBkNU/eaLN0Iu+qxmrpc0y57NCcPMnDdP0PCxW9/FbaIg1qAfZpiO275PMBTUVIbnTnR7wI+kqRVc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The timestamp uses microseconds, not nanoseconds, so use %06ld instead of %09ld.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 31d1342e61e8..97013b961924 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -476,7 +476,7 @@ static void v4l_print_buffer(const void *arg, bool write_only)
 	const struct v4l2_plane *plane;
 	int i;

-	pr_cont("%02d:%02d:%02d.%09ld index=%d, type=%s, request_fd=%d, flags=0x%08x, field=%s, sequence=%d, memory=%s",
+	pr_cont("%02d:%02d:%02d.%06ld index=%d, type=%s, request_fd=%d, flags=0x%08x, field=%s, sequence=%d, memory=%s",
 			(int)p->timestamp.tv_sec / 3600,
 			((int)p->timestamp.tv_sec / 60) % 60,
 			((int)p->timestamp.tv_sec % 60),
