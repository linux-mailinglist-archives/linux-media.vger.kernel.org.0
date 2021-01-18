Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 227042FAB76
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 21:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394156AbhARU3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 15:29:24 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:53875 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389074AbhARKmb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 05:42:31 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 1RyRlHzOYyutM1RyVlYLNK; Mon, 18 Jan 2021 11:41:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610966491; bh=Z81GYA5hCsz9rOR+QBeSuC2HZtYFow62usjSwYgC2W0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WkSUJj+3ebcAfsfqlzwKsMS5l+glvwZsJCa5yM0OeX9fUm7vkCLuv2FwNjufeyn6N
         +wCPT3nt0Ev2PqGmBn6nv5olQtg5oXdTzvurH0foEy5mSqdxV0qZh7tFYAj3/GNXdq
         KNYAKoJJsWJISfhEOywQt896/2Ru155Z8WqxxSKsj9Yqub27hrQVF57aS5+25iufrR
         UC5nZFLWtkfA5bmJo2CUeRMYjYL1zJNWJ5P0R0JJ0aVQBPg8w0VGb/nCc2U+rz5Sya
         jm+16hpuK20oI5rwYJidMmSnnXjgOYXNshiDRli87KCQByiATB081gHpVhjMIbwWco
         J27ovAzSh2gTQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v5.11] v4l2-subdev.h: BIT() is not available in userspace
Message-ID: <c6705331-7a41-1752-8f59-ccc9f487c949@xs4all.nl>
Date:   Mon, 18 Jan 2021 11:41:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAPjrEMmIfF+0m2ORHo1WX4qa0wRbDInTAYJlQ6w2VscfbuLIAksDtLUBi7zg9D9VGts0CiBbN4VrTZzTiUQPnCbK1kI0uwJaTiAbMv6+pjaqLRgUAvL
 4oDkvCjHGuq4pp37EoFqjwiZbOmePAVMiD9YYNM9fz9ktVRfRZIAgivCd/Tqs0NjNeeM5oSGLuC+TkcXSN5wUZ5UxwVvKWQXuok=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The BIT macro is not available in userspace, so replace BIT(0) by
0x00000001.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 6446ec6cbf46 (media: v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl)
---
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 00850b98078a..a38454d9e0f5 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -176,7 +176,7 @@ struct v4l2_subdev_capability {
 };

 /* The v4l2 sub-device video device node is registered in read-only mode. */
-#define V4L2_SUBDEV_CAP_RO_SUBDEV		BIT(0)
+#define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001

 /* Backwards compatibility define --- to be removed */
 #define v4l2_subdev_edid v4l2_edid
