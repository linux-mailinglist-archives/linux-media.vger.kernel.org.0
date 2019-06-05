Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6017E35F55
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 16:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbfFEOd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 10:33:27 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:57925 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728026AbfFEOd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 10:33:27 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YWyfhn79Y3qlsYWyjhgqAK; Wed, 05 Jun 2019 16:33:25 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] MAINTAINERS: update email address
Date:   Wed,  5 Jun 2019 16:33:21 +0200
Message-Id: <20190605143321.127220-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190605143321.127220-1-hverkuil-cisco@xs4all.nl>
References: <20190605143321.127220-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfO28EAVMicVZnO6R++85IS9uLchYju5AsNfyPqCF6ACakZcD+GE8WjtnnDbIEoXYtmH09R/QWXuHGC+Z13hwU62XpFMC9+BiF9QPhLkUDf/JY6+vIXCd
 Brg0XkzK+p4tL/sabYwfYhDEKuc97vHejFvoSZk8rF//Sf1moA4Kv/D5HF4SFwqxfTNRbKNMiu3b8tcsvS2mg1Kv3331tH6J/fFZmm/zBu9e7wKVIBGzgwBq
 7RkdWZsK1VRO8gc23FXhCUhw4VVu1pV8ntbqHe1qV4Lz9vJZ4XeIOr2GgXENanIcoCOj6NFFU9Uf+XiyqzitoA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use hverkuil-cisco@xs4all.nl instead of hans.verkuil@cisco.com.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 MAINTAINERS | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8fbf41865c2..16a97ba91874 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -916,7 +916,7 @@ F:	drivers/iio/adc/ad7768-1.c
 F:	Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt
 
 ANALOG DEVICES INC AD9389B DRIVER
-M:	Hans Verkuil <hans.verkuil@cisco.com>
+M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/ad9389b*
@@ -948,19 +948,19 @@ S:	Maintained
 F:	drivers/media/i2c/adv748x/*
 
 ANALOG DEVICES INC ADV7511 DRIVER
-M:	Hans Verkuil <hans.verkuil@cisco.com>
+M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/adv7511*
 
 ANALOG DEVICES INC ADV7604 DRIVER
-M:	Hans Verkuil <hans.verkuil@cisco.com>
+M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/adv7604*
 
 ANALOG DEVICES INC ADV7842 DRIVER
-M:	Hans Verkuil <hans.verkuil@cisco.com>
+M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/adv7842*
@@ -2343,7 +2343,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 
 ARM/TEGRA HDMI CEC SUBSYSTEM SUPPORT
-M:	Hans Verkuil <hans.verkuil@cisco.com>
+M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -3672,7 +3672,7 @@ F:	drivers/crypto/ccree/
 W:	https://developer.arm.com/products/system-ip/trustzone-cryptocell/cryptocell-700-family
 
 CEC FRAMEWORK
-M:	Hans Verkuil <hans.verkuil@cisco.com>
+M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 W:	http://linuxtv.org
@@ -3689,7 +3689,7 @@ F:	Documentation/devicetree/bindings/media/cec.txt
 F:	Documentation/ABI/testing/debugfs-cec-error-inj
 
 CEC GPIO DRIVER
-M:	Hans Verkuil <hans.verkuil@cisco.com>
+M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 W:	http://linuxtv.org
@@ -3965,7 +3965,7 @@ S:	Supported
 F:	drivers/platform/x86/classmate-laptop.c
 
 COBALT MEDIA DRIVER
-M:	Hans Verkuil <hans.verkuil@cisco.com>
+M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 W:	https://linuxtv.org
@@ -6700,7 +6700,7 @@ F:	drivers/gnss/
 F:	include/linux/gnss.h
 
 GO7007 MPEG CODEC
-M:	Hans Verkuil <hans.verkuil@cisco.com>
+M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/usb/go7007/
@@ -16672,7 +16672,7 @@ S:	Maintained
 F:	drivers/net/ethernet/via/via-velocity.*
 
 VICODEC VIRTUAL CODEC DRIVER
-M:	Hans Verkuil <hans.verkuil@cisco.com>
+M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 W:	https://linuxtv.org
-- 
2.20.1

