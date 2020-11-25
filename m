Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860BA2C3E01
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 11:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbgKYKkI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 05:40:08 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:55677 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726284AbgKYKkH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 05:40:07 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id hsDSkIqM9N7XghsDVkVnL5; Wed, 25 Nov 2020 11:40:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606300806; bh=AuDjYfqfUT2M3cPR8dVQmJcd1L4ySwMhqKpCDAFw5+U=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JoOdFOaIOoxcx9z+I4qbBu3TaU599SOmZuQVQFbmVWwy27pJUpFH7ijmbPqVmo5Au
         L9Kf5W9kfKA8fmb67noWl0puQMw4tzVFfP/hd+tfcWeqp7xffnlwZ+jo0jxOYUxPMs
         TWBoGX+lN11cb+CxmH4aRx1yF/aJR1TJOPNudXT39tneCVSSwd1w3r+Tz+Hksf2jPb
         N3MLxv2i6WPKC+9fT/Ec7vjzz1H/4M66TlFHs9GS+5Zf+HlcltKbqwmMQpAKYqWjvu
         hBWtyIha3mTihncQmSXkfnsWsGou2cDURiH/zgxmQQi0Tsa1bL6f6x7miiOa9iWeQC
         zW38/YogV2taQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: vidioc-g-ext-ctrls.rst: document
 V4L2_CTRL_CLASS_DETECT
Message-ID: <120ae30c-483a-e624-ff3b-45a765968981@xs4all.nl>
Date:   Wed, 25 Nov 2020 11:40:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPDibQ4gVkEs4+7vkBRqOi5hpzVo/ZgnyoZcvt+HKaAENEYk8bemb2Ns3a7Z1MmKYIK89GhoD2908rvR8hU96x3AnkwVgRFpmL1x4crw2JYyndThOHB7
 HJkYMbrtoWLdo3nRnuq1Z7E4lDEt3cI9CPx68mXC8gHx1keHj/hmJnseK2jUAa7y4nt+kMdjzDXwiXLiMJA+kjQZOQWUVoL+dH0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2_CTRL_CLASS_DETECT was never documented here, add it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index c7aba1b66b6d..8b2029d1390b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -358,6 +358,10 @@ still cause this situation.
       - 0xa20000
       - The class containing RF tuner controls. These controls are
 	described in :ref:`rf-tuner-controls`.
+    * - ``V4L2_CTRL_CLASS_DETECT``
+      - 0xa30000
+      - The class containing motion or object detection controls. These controls
+        are described in :ref:`detect-controls`.

 Return Value
 ============
