Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E051E4A57B3
	for <lists+linux-media@lfdr.de>; Tue,  1 Feb 2022 08:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbiBAHXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Feb 2022 02:23:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbiBAHXx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Feb 2022 02:23:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AE6C061714
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 23:23:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2876AB80A7C
        for <linux-media@vger.kernel.org>; Tue,  1 Feb 2022 07:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7219AC340EB;
        Tue,  1 Feb 2022 07:23:50 +0000 (UTC)
Message-ID: <d301d968-df95-244d-088e-c11674bb7b36@xs4all.nl>
Date:   Tue, 1 Feb 2022 08:23:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Frank Barchard <fbarchard@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] pixfmt-yuv-planar.rst: fix typo: 'Cr, Cr' -> 'Cr, Cb'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several NV formats incorrectly described the Chroma order as
Cr, Cr when it actually is Cr, Cb.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Frank Barchard <fbarchard@google.com>
---
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 3a09d93d405b..85615981faaa 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -76,7 +76,7 @@ All components are stored with the same number of bits per component.
       - 'NV21'
       - 8
       - 4:2:0
-      - Cr, Cr
+      - Cr, Cb
       - Yes
       - Linear
     * - V4L2_PIX_FMT_NV12M
@@ -90,7 +90,7 @@ All components are stored with the same number of bits per component.
       - 'NM21'
       - 8
       - 4:2:0
-      - Cr, Cr
+      - Cr, Cb
       - No
       - Linear
     * - V4L2_PIX_FMT_NV12MT
@@ -120,7 +120,7 @@ All components are stored with the same number of bits per component.
       - 'NV61'
       - 8
       - 4:2:2
-      - Cr, Cr
+      - Cr, Cb
       - Yes
       - Linear
     * - V4L2_PIX_FMT_NV16M
@@ -134,7 +134,7 @@ All components are stored with the same number of bits per component.
       - 'NM61'
       - 8
       - 4:2:2
-      - Cr, Cr
+      - Cr, Cb
       - No
       - Linear
     * - V4L2_PIX_FMT_NV24
@@ -148,7 +148,7 @@ All components are stored with the same number of bits per component.
       - 'NV42'
       - 8
       - 4:4:4
-      - Cr, Cr
+      - Cr, Cb
       - Yes
       - Linear
 
