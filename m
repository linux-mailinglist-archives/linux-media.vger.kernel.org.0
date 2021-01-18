Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F582FA55B
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 16:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404772AbhARPqs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 10:46:48 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:46153 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405999AbhARPeg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 10:34:36 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 1WXIlJXBSyutM1WXLlZJ1y; Mon, 18 Jan 2021 16:33:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610984027; bh=Z81GYA5hCsz9rOR+QBeSuC2HZtYFow62usjSwYgC2W0=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=p1N+6+33WKE1LwQHBZm0Aq+MWtbEhp3V94eiU9K2/w09DpjL0y3ZuI3/KFzpO7Tfs
         IrIXJ43y1YSJUlKCX69qNPTOr4F7Ua998cZpidDQUId2qiU81Enp5kOgA2a0OBgNwL
         fyV71TTvuGEXLWONYfSytj+wmohWMKZpK7CNfA1h0kZaqIqM35Vhn0Au/dr0ScLfwX
         GL9z3+UQ44ngZdevaHkwj/yMZ9oMDU6TwKE8X217jC751SrCqsS6lo3jbk1+1xr//G
         FJeQ9r+gkyaUcpbP52DwWEH/PZqKh03ZogHIKTTYW2oPCh52jhcgbkPcVAnjB1RoNf
         8idMzAo2Kg6yw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v5.11] v4l2-subdev.h: BIT() is not available in userspace
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <84d5e551-92fe-b9fb-db0f-2840faeb61fd@xs4all.nl>
Date:   Mon, 18 Jan 2021 16:33:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBOFslX2gKL/a/PP611LOlFlCZU6H7ALmMQYhzFgOtCFzycXhqyqKzB5t3yW/Xxd6FGr5lhL9ofBLukTbcTj89AGww87MSUNmIqNRG790v9i9i+5PDS/
 gzehtjm0AZm1HsWrGpMKc5i6LPRBkkn1zhDOKtJl0VX11cqwp8Uw4es/pk8Yz8vztdRvxcxYy+EE9euB+iQ2Xmpf5Eq0Re36umU=
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
