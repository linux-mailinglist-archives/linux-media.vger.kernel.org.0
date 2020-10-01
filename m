Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D1027FD03
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 12:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731893AbgJAKNs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 06:13:48 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:42085 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730378AbgJAKNs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 06:13:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id NvaokUdeeTHgxNvarklyyc; Thu, 01 Oct 2020 12:13:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601547226; bh=zeDFG4xpXoR5x7Uwo4zkLiZiGIr9MfeeoXbyaFZiwEI=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=CWv8f1y6GqzXJJLyjxfCu3E45uqU4ZlAnrFybYlIZHuTyscWdzZLgjSGptlBoFQQF
         JxB5eBlI2GgPB8E7JbFVQCzbcnlzANVXIrW2D4eoNmz0lADIoTHFW6oNkiqoZm5YtB
         TJxEtZTwcpuq7T+lYLVcyOMKji2pwDQv0+x3UEjdE7aA9HBa4qPq3txIalmgMhzuo8
         fP9+EPn0gCgOGyff7qWDU351+nrmB11BrQyP6bwmr8uCWKJdB9RIwU7JgEzN1lfnNy
         nU+/QivqVC3MGD8XFY+f3W08S6Rn/spunnn5PPWcY4HaiCbvH6BURfKWPti1MQQTFL
         ARs+u35fQBXqA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] Fix V4L2_COLORSPACE_470_SYSTEM_BG description
Message-ID: <83ce00ac-4688-f2f9-1e8c-00bd4ccab96c@xs4all.nl>
Date:   Thu, 1 Oct 2020 12:13:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEyrJBNXfm68G9UGGe8SHInMWVKpIhHA8/3FUF7U5F+P7/fuEPITw/IzQe8BCAi5WshKx4X60e3S9zTFqiWhLgPyFWUIO8yToh2LSPo2True4tGV+Wtk
 aAFopoRabDMxX18P2WNDyJvGrXFFiytrs7ozD59VWdlmIi+6QSx/QepM7Gx2nfu+rcAGbF2EQLIwTg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The description of the V4L2_COLORSPACE_470_SYSTEM_BG stated that it was
superseded by SMPTE 170M. That is incorrect. The probably root cause of this
is that the HDMI standard does not support this colorspace and, unless otherwise
signaled, will fall back to SMPTE 170M for SDTV.

However, EBU Tech. 3321 states that sources should signal Rec. 709 as the
colorimetry when using HDMI since the difference between Rec. 709 and Tech. 3213
are negligible.

Update the text accordingly.

Also drop a spurious " at the end of the Tech 3213 title in the bibliography.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 7869b6f6ff72..64d241daf63c 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -270,7 +270,17 @@ EBU Tech 3213
 =============


-:title:     E.B.U. Standard for Chromaticity Tolerances for Studio Monitors"
+:title:     E.B.U. Standard for Chromaticity Tolerances for Studio Monitors
+
+:author:    European Broadcast Union (http://www.ebu.ch)
+
+.. _tech3321:
+
+EBU Tech 3321
+=============
+
+
+:title:     E.B.U. guidelines for Consumer Flat Panel Displays (FPDs)

 :author:    European Broadcast Union (http://www.ebu.ch)

diff --git a/Documentation/userspace-api/media/v4l/colorspaces-details.rst b/Documentation/userspace-api/media/v4l/colorspaces-details.rst
index 014e7c9fc655..126f66482a0d 100644
--- a/Documentation/userspace-api/media/v4l/colorspaces-details.rst
+++ b/Documentation/userspace-api/media/v4l/colorspaces-details.rst
@@ -674,8 +674,9 @@ Colorspace EBU Tech. 3213 (V4L2_COLORSPACE_470_SYSTEM_BG)
 =========================================================

 The :ref:`tech3213` standard defines the colorspace used by PAL/SECAM
-in 1975. In practice this colorspace is obsolete and SMPTE 170M should
-be used instead. The default transfer function is
+in 1975. Note that this colorspace is not supported by the HDMI interface.
+Instead :ref:`tech3321` recommends that Rec. 709 is used instead for HDMI.
+The default transfer function is
 ``V4L2_XFER_FUNC_709``. The default Y'CbCr encoding is
 ``V4L2_YCBCR_ENC_601``. The default Y'CbCr quantization is limited
 range. The chromaticities of the primary colors and the white reference
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index b2bc83f37024..58357712cb7e 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -223,9 +223,7 @@ enum v4l2_colorspace {
 	V4L2_COLORSPACE_470_SYSTEM_M  = 5,

 	/*
-	 * EBU Tech 3213 PAL/SECAM colorspace. This only makes sense when
-	 * dealing with really old PAL/SECAM recordings. Superseded by
-	 * SMPTE 170M.
+	 * EBU Tech 3213 PAL/SECAM colorspace.
 	 */
 	V4L2_COLORSPACE_470_SYSTEM_BG = 6,

