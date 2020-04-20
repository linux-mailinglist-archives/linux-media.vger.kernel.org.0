Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0351B0BAB
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 14:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbgDTM5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 08:57:44 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44303 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728461AbgDTM5n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 08:57:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id QVzWj1LO47xncQVzZjHPwQ; Mon, 20 Apr 2020 14:57:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587387462; bh=oyD9pM6t9PoIRmc9zSwyeEoXI879f9HMWGF4aWcHdpg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=o/vAOkzlVFIg0C7svkfnDhzk89tsVaizRr+2p6I06BtNMAbE9jm3P+keOMugwrV8e
         aemzLyrhyZiFr/8HpUhujUg9Mm8VPU3ALNmUf9tMRTvRI05AH+8dR1Hlak1n1XBiwa
         FiDL2BKZrXRPL0pJkMcgcRtD7/AYinJWvaXCnXfOPH9MOsknyPvF/x7mwErbvLnJ/+
         p7iyvJJPSI7ayDfdhV/6KZj8AvHjJOin6sMw/gDhK5/0gPVYYElP+XB4aLfZ93IaJD
         c1i+C4MbYgie5CXEnmWBUeLNfu8UVy8d75+i2woCVoMkV8bISicxez9xroX8juVXD9
         Pxc3jUYCsxO7w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] vidioc-reqbufs/create-bufs.rst: fix typo
Message-ID: <4f3d3be1-3e26-e920-79f1-faafb2246a5e@xs4all.nl>
Date:   Mon, 20 Apr 2020 14:57:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBpmNsclfKmPzsjlU26NSrD/U8arBGfmRIi8/jUXLWQ6Wc3I1VxND+0x8fj9EUVjPXx+VCq9u7hanJdRP5WgsSNL77SSGccRfd2ZhQCxA0iBTBKlKUiB
 vFLG5U5Xp2W5VaWYH7OuhYqbycliyGU5dMaxQCX3e0u6oZNN/+Mw3z/P385bKbA1uT/htksVouQP3Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

any others capabilities -> any other capabilities

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
index bd580232be10..e1afc5b504c2 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
@@ -113,7 +113,7 @@ than the number requested.
       - Set by the driver. If 0, then the driver doesn't support
         capabilities. In that case all you know is that the driver is
 	guaranteed to support ``V4L2_MEMORY_MMAP`` and *might* support
-	other :c:type:`v4l2_memory` types. It will not support any others
+	other :c:type:`v4l2_memory` types. It will not support any other
 	capabilities. See :ref:`here <v4l2-buf-capabilities>` for a list of the
 	capabilities.

diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index 79884bb4893b..b6d52083707b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -104,7 +104,7 @@ aborting or finishing any DMA in progress, an implicit
       - Set by the driver. If 0, then the driver doesn't support
         capabilities. In that case all you know is that the driver is
 	guaranteed to support ``V4L2_MEMORY_MMAP`` and *might* support
-	other :c:type:`v4l2_memory` types. It will not support any others
+	other :c:type:`v4l2_memory` types. It will not support any other
 	capabilities.

 	If you want to query the capabilities with a minimum of side-effects,
