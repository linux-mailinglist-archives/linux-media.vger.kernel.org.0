Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFA9222182
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 13:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbgGPLdC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 07:33:02 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35951 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726515AbgGPLdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 07:33:02 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id w28Hj4PaDNPeYw28KjUqFP; Thu, 16 Jul 2020 13:33:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594899181; bh=qGKghn+Jz9cW0TY0ifVWdQclqum42Ii/yfgDMMeF5Ms=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ci9bRPQdQ3vdWOQKF7/oxkSiSVKrfwUp4xTxSGEqMNAtCgQGjEb6D/lZxDx76gUzH
         XK2YXBm3I8ZqHd0W/j7+fB4L2XnPtUuomwXnn/zNExyZYnytEuqk5SWrfbBgF+ZoyS
         4g8+NLWiTFBpzpAo80pSukkT4NgOspPpqKXn2WLC5lbSduwBQIxLj2UbUp7Qey7biz
         C52hsOY9G+rhbBzUIoiyrx92/mNiUJdMGJOmAyGf2NOSWN6zMnD3JSI8ATkrlQyYI8
         zYzYG/3zIHQLB9s+A3cYGPVdu5Gu4oTcPlZaPFL8R201NNfnH84M7kK2b5j0B2AQDE
         lCh6XIb6PRkaQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] colorspaces-details.rst: fix V4L2_COLORSPACE_JPEG description
Message-ID: <e856930f-a5c9-8f34-61dc-0171b2dd9b95@xs4all.nl>
Date:   Thu, 16 Jul 2020 13:32:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMf/HEdEsaNP6pttEZAGjQ2gVZhIjmYlaeOFXwBh6UgWML3OQ+qApxQMEM2LwkSkI1VhmfXx3D+9VlyZd4gozW1M3CzmbEJxwTtWI97RQitJKEt/vnw4
 tYVHwJ8T8HNO86X9F6jkL87V4NMi/MiUSNta7QO0XtXD8lJoVuv6iZ73pNlER3PYPksdtM+mSeagbA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The description was missing V4L2_XFER_FUNC_SRGB in the description
of what V4L2_COLORSPACE_JPEG stands for.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/colorspaces-details.rst b/Documentation/userspace-api/media/v4l/colorspaces-details.rst
index 79ed6f4f76eb..300c5d2e7d0f 100644
--- a/Documentation/userspace-api/media/v4l/colorspaces-details.rst
+++ b/Documentation/userspace-api/media/v4l/colorspaces-details.rst
@@ -767,8 +767,8 @@ scaled to [-128…128] and then clipped to [-128…127].
    information. So if something other than sRGB is used, then the driver
    will have to set that information explicitly. Effectively
    ``V4L2_COLORSPACE_JPEG`` can be considered to be an abbreviation for
-   ``V4L2_COLORSPACE_SRGB``, ``V4L2_YCBCR_ENC_601`` and
-   ``V4L2_QUANTIZATION_FULL_RANGE``.
+   ``V4L2_COLORSPACE_SRGB``, ``V4L2_XFER_FUNC_SRGB``, ``V4L2_YCBCR_ENC_601``
+   and ``V4L2_QUANTIZATION_FULL_RANGE``.

 ***************************************
 Detailed Transfer Function Descriptions
