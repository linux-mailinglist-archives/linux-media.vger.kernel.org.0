Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFB12FA4EC
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 16:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392837AbhARPiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 10:38:09 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47003 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392357AbhARPh7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 10:37:59 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 1WaSlJYAiyutM1WaVlZJcC; Mon, 18 Jan 2021 16:37:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610984223; bh=WA/Bu0LmM67ooFiYcMgUwSEALlvDZql5Mz4TPaX56Q8=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NX+AY5F+eSVci9m9CT5pn94prGnRXyiSTBITSuceGPbKpBc3ELevN06pYeYFkPT9Q
         9tUkRo8prppz9qeloN/44z5ymyCjWla7Mpm74N0HRoSt7+QXFLixlWPH0JOKjatTOu
         7bZO55+oxnb3ZB1kOMrZ6b39oLIvrKsj+MLKLGg03HiKhDwDNdRqDkuYZaXBvHp4RN
         8StYBz2QkzqQTykxR1Y3sJcrMtix1p6OM5nAGypz2wbzcMF1V3wbZ9VamUuERy/nJx
         OmOojyJSTfFnQAJLx/GilLfTLQY83tnEprMgndHabAs1LRJ53pZ/SGzOAdOTLMg3YP
         /T+wi+n5rr3OA==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.11] v4l2-subdev.h: BIT() is not available in userspace
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <f19ec891-89b9-8277-ea22-ef88dc6c8700@xs4all.nl>
Date:   Mon, 18 Jan 2021 16:37:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfO0cWhYXLmoOmkN9usmswtFwcoIELqJ0eLhDke29l+UZ87Q+EITH37rLw+J8S4pg6rbTQMDcRT+xEOsEr9ZXehnCKoNIYm9skXEbjNAzOYm1ch8+Y0jR
 EkjFXLD8mXOZElhTYjzo7TS8HHq57ZobQ59tgBRQDsrK8I6FQuLweW1qjYTQC3sUWebbKjUzJadoAzUTngg6KzPXL2u+O0u7Q0s=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The BIT macro is not available in userspace, so replace BIT(0) by
0x00000001.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 6446ec6cbf46 ("media: v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl")
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
