Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39B09A48AE
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 12:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbfIAKJ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Sep 2019 06:09:26 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:42279 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728390AbfIAKJ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 06:09:26 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 4MnRilJbTDqPe4MnUiYBOO; Sun, 01 Sep 2019 12:09:25 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] ext-ctrls-flash.rst: fix typo
Message-ID: <c6f601c6-237b-de6d-0fe2-190ee968995c@xs4all.nl>
Date:   Sun, 1 Sep 2019 12:09:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNuGMkdGb9Jp0QY/0oi0oO4hieMc3NM0XWPiHMFfzzKEmiihtwlvqQowJsZtRpMIc9ad2ffyNuEevoTTPN5mCYFTu4VeJsbyMSgFSir1x49wydr9T4eU
 889HceeLVfDaXG5g2iske2bBD6mejGscHWrj8Ue0u+D8prJhYZkD7sz3mDIw7bkXg26zZ1f5e/3pjA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

to synchronises -> to synchronise

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-flash.rst b/Documentation/media/uapi/v4l/ext-ctrls-flash.rst
index eff056b17167..b9a6b08fbf32 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-flash.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-flash.rst
@@ -98,7 +98,7 @@ Flash Control IDs
 	V4L2_CID_FLASH_STROBE control.
     * - ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``
       - The flash strobe is triggered by an external source. Typically
-	this is a sensor, which makes it possible to synchronises the
+	this is a sensor, which makes it possible to synchronise the
 	flash strobe start to exposure start.


