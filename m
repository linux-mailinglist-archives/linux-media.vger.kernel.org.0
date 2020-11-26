Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4C02C545C
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 14:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389677AbgKZNBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 08:01:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:44534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389522AbgKZNBC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 08:01:02 -0500
Received: from mail.kernel.org (ip5f5ad5d3.dynamic.kabel-deutschland.de [95.90.213.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A590E21D46;
        Thu, 26 Nov 2020 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606395661;
        bh=cSqReo1zoadf+m7GcCeTjo6UFFOpQI8K/iaJIVIFrxc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vaXpwRI8TU+YNUikQ2Hd70M3Kw9rxgOJdSZUnlMEJDyWivUd9g4J4hXmrWUF0flqd
         vXvWZLv2xduCivverfnVKTJIQhNkQ66wh1Qk6SsdyFpcW6K770FjfSLxkliVSDrFrH
         IC30vbj71FPYkA5s4UPx7APoDRQcVRxvP/2Z1Hw0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kiGtN-005rbO-TS; Thu, 26 Nov 2020 14:00:57 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: rc: improve LIRC documentation
Date:   Thu, 26 Nov 2020 14:00:56 +0100
Message-Id: <15a9b87b469095c7f9cb6f6babb9c7b5f462add8.1606395586.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606395586.git.mchehab+huawei@kernel.org>
References: <cover.1606395586.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for enum rc_proto and struct lirc_scancode
at the generated docs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/rc/lirc-dev-intro.rst         | 11 +++++++++--
 include/uapi/linux/lirc.h                             |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/rc/lirc-dev-intro.rst b/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
index 266b646d584e..c88973732282 100644
--- a/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
+++ b/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
@@ -57,12 +57,12 @@ on the following table.
 
     This mode is for both sending and receiving IR.
 
-    For transmitting (aka sending), create a ``struct lirc_scancode`` with
+    For transmitting (aka sending), create a struct lirc_scancode with
     the desired scancode set in the ``scancode`` member, :c:type:`rc_proto`
     set to the :ref:`IR protocol <Remote_controllers_Protocols>`, and all other
     members set to 0. Write this struct to the lirc device.
 
-    For receiving, you read ``struct lirc_scancode`` from the LIRC device.
+    For receiving, you read struct lirc_scancode from the LIRC device.
     The ``scancode`` field is set to the received scancode and the
     :ref:`IR protocol <Remote_controllers_Protocols>` is set in
     :c:type:`rc_proto`. If the scancode maps to a valid key code, this is set
@@ -136,6 +136,13 @@ on the following table.
 
     This mode is used only for IR send.
 
+*************************************
+Data types used by LIRC_MODE_SCANCODE
+*************************************
+
+.. kernel-doc:: include/uapi/linux/lirc.h
+    :identifiers: lirc_scancode rc_proto
+
 ********************
 BPF based IR decoder
 ********************
diff --git a/include/uapi/linux/lirc.h b/include/uapi/linux/lirc.h
index bf0672a6d341..c45a4eaea667 100644
--- a/include/uapi/linux/lirc.h
+++ b/include/uapi/linux/lirc.h
@@ -139,7 +139,7 @@
  */
 #define LIRC_GET_REC_TIMEOUT	       _IOR('i', 0x00000024, __u32)
 
-/*
+/**
  * struct lirc_scancode - decoded scancode with protocol for use with
  *	LIRC_MODE_SCANCODE
  *
-- 
2.28.0

