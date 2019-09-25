Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF15BDFAC
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 16:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406676AbfIYOJn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 10:09:43 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40383 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730549AbfIYOJn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 10:09:43 -0400
Received: from [IPv6:2001:420:44c1:2577:1424:9b71:fce9:2fcd] ([IPv6:2001:420:44c1:2577:1424:9b71:fce9:2fcd])
        by smtp-cloud9.xs4all.net with ESMTPA
        id D7z8iKrNQz6EAD7zBiBFt2; Wed, 25 Sep 2019 16:09:41 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vidioc-g-fbuf.rst: remove duplicate 'struct'
Message-ID: <0492cb4a-14dd-5dbd-7885-44adb33d7f8d@xs4all.nl>
Date:   Wed, 25 Sep 2019 16:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBxrtd0xwZh9dk2YSMVLubpwzO11ViGH0L1XJ/RtkJXKFlPB9j3+xJz5eFJhayqPeg3YgHfmg/BQ4Hsb4Vi2+qDLsRospoBLLZEIFJFdurRQygPpn3Te
 r1YeDPDjS+DtSliXwiZvoZ3NczsdyrDmuqgi5eYOXu8Qa8xEARyoHX2Bv6k8Z6aqIN2oxMbGrN2HUGqaMDTy+Gk+0ATQ8AnRRnw06q8bnrevCnDcT4aqB7H5
 3SWISvdBTOj3eqw8aMdGEXkW9h6xQOo8PtSTdZWPWfeR+vzQ7FZofjjRq9n5rglg
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

"struct struct" -> "struct"

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/media/uapi/v4l/vidioc-g-fbuf.rst b/Documentation/media/uapi/v4l/vidioc-g-fbuf.rst
index 7b6179627803..2d197e6bba8f 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-fbuf.rst
+++ b/Documentation/media/uapi/v4l/vidioc-g-fbuf.rst
@@ -63,7 +63,7 @@ EINVAL error code when overlays are not supported.

 To set the parameters for a *Video Output Overlay*, applications must
 initialize the ``flags`` field of a struct
-struct :c:type:`v4l2_framebuffer`. Since the framebuffer is
+:c:type:`v4l2_framebuffer`. Since the framebuffer is
 implemented on the TV card all other parameters are determined by the
 driver. When an application calls :ref:`VIDIOC_S_FBUF <VIDIOC_G_FBUF>` with a pointer to
 this structure, the driver prepares for the overlay and returns the
