Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C333407D3
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 15:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhCRO2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 10:28:24 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:40167 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230269AbhCRO1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 10:27:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id MtcplQCcy4XAGMtcslJ4xc; Thu, 18 Mar 2021 15:27:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616077670; bh=7d4WRjwjdRhgUzGV4dNC5F9d9OCGLLT4ebg/YkdJFAo=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IqpfU1CZ50bDacYWYaqC4X7U42q0cbo6k6OYHWRwGUpIwIXVzWIdFUZtGhWqd4D3v
         T6u1Cvk+92TCpK4YWNZpB2U5aiAKEHnRyd5FLlX+HYd8Q3E57mAx9GJEAM0hOmV06V
         CJWcBUJXkZzhF3omp+30AqC4sfiS+g0+z6ixOVAg3uHgGU9oXfCeLLuKZj62JdfsbK
         yzzmRTtHHcFsz/BEAHDtRXUoLaDG7unkdzpi47ihfdAYR3Nhl3Z+mKYamA4cmeuEgT
         lKVl2EYpeuNnrW8bz5ZSZKQN4SQ+e5WUMWYk3XYFfFY1gZ0zTnZaeXD42OHuJ7lvDB
         AytPw774q/UGA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] buffer.rst: fix incorrect :c:type
Message-ID: <69475d79-b57d-b820-f02a-d705aef93456@xs4all.nl>
Date:   Thu, 18 Mar 2021 15:27:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFPdgzcSaDifmp8vNEt5iYmq57AbRaAcCCQYPW6I1E12G2jyENve0qKToHouEunWUxo1hHa4yj0UdT8OCkkPkwmh76t5LgCP46Aui6i/DPOjfe2UtUDM
 SP4rgR5GEXQ9T9ZYFiM/ZjUnh22uBFhHxaD4rETOLcb+n2WmyUt8fAHosziuDqbwlPwdH1uK5VhlM+Km9oSpAJAM3Nf3p65UcVQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

:c:type:`struct v4l2_requestbuffers` should be
struct :c:type:`v4l2_requestbuffers`.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 4b2696a392df..e991ba73d873 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -585,7 +585,7 @@ Buffer Flags

       - ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF``
       - 0x00000200
-      - Only valid if :c:type:`struct v4l2_requestbuffers` flag ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` is
+      - Only valid if struct :c:type:`v4l2_requestbuffers` flag ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` is
 	set. It is typically used with stateless decoders where multiple
 	output buffers each decode to a slice of the decoded frame.
 	Applications can set this flag when queueing the output buffer
