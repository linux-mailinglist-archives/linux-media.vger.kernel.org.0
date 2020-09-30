Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E2F27E135
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 08:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgI3Gg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 02:36:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:59278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727761AbgI3GgH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 02:36:07 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 271F0207C3;
        Wed, 30 Sep 2020 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601447766;
        bh=6xPjWQx4pdqPWhe57hN7t0TY4FqQaqlHz6FS3YcZ3GM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m7M3sku51uQsGUSfTgJbTNtAV2y1nJu3vIM/pXwnkqhy3ANGeimegLgZHVnr6Xuyp
         GGSkZkq0/2OrbSlRt1Ob+VFR8du2JDBPa+MDXRNgSFTeoBZB5fAYFYiLXa9EF5xB5k
         dh8ODelL+VY+xTvXqZ9oc4iwFYL0lQdqvXuT3ci0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNVid-001QmQ-Ri; Wed, 30 Sep 2020 08:36:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] media: glossary.rst: use the right case for glossary entries
Date:   Wed, 30 Sep 2020 08:35:55 +0200
Message-Id: <1c16b009018debb34d2abc4525fd5ad434831343.1601447236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601447236.git.mchehab+huawei@kernel.org>
References: <cover.1601447236.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sphinx 3.x is pedantic with glossary entries:

    Documentation/userspace-api/media/glossary.rst:17: WARNING: term device driver not found in case sensitive match.made a reference to Device Driver instead.
    Documentation/userspace-api/media/glossary.rst:59: WARNING: term media hardware not found in case sensitive match.made a reference to Media Hardware instead.
    Documentation/userspace-api/media/glossary.rst:59: WARNING: term IP block not found in case sensitive match.made a reference to IP Block instead.
    Documentation/userspace-api/media/glossary.rst:64: WARNING: term hardware component not found in case sensitive match.made a reference to Hardware Component instead.
    Documentation/userspace-api/media/glossary.rst:64: WARNING: term ip block not found in case sensitive match.made a reference to IP Block instead.
    Documentation/userspace-api/media/glossary.rst:70: WARNING: term peripheral not found in case sensitive match.made a reference to Peripheral instead.
    Documentation/userspace-api/media/glossary.rst:130: WARNING: term V4L2 hardware not found in case sensitive match.made a reference to V4L2 Hardware instead.
    Documentation/userspace-api/media/glossary.rst:151: WARNING: term hardware peripheral not found in case sensitive match.made a reference to Hardware Peripheral instead.
    Documentation/userspace-api/media/glossary.rst:183: WARNING: term device node not found in case sensitive match.made a reference to Device Node instead.
    Documentation/userspace-api/media/glossary.rst:191: WARNING: term bridge driver not found in case sensitive match.made a reference to Bridge Driver instead.

While it works with case-insensitive entires, it complains.

Let's fix it, in order to cleanup the warnings. Also, I won't
doubt that a later change on Sphinx will end breaking support
for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/glossary.rst          | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
index 59a95dba5909..cb165d7176b7 100644
--- a/Documentation/userspace-api/media/glossary.rst
+++ b/Documentation/userspace-api/media/glossary.rst
@@ -14,7 +14,7 @@ Glossary
 .. glossary::
 
     Bridge Driver
-	A :term:`device driver` that implements the main logic to talk with
+	A :term:`Device Driver` that implements the main logic to talk with
 	media hardware.
 
     CEC API
@@ -56,18 +56,18 @@ Glossary
 	See https://en.wikipedia.org/wiki/Field-programmable_gate_array.
 
     Hardware Component
-	A subset of the :term:`media hardware`. For example an :term:`I²C` or
-	:term:`SPI` device, or an :term:`IP block` inside an
+	A subset of the :term:`Media Hardware`. For example an :term:`I²C` or
+	:term:`SPI` device, or an :term:`IP Block` inside an
 	:term:`SoC` or :term:`FPGA`.
 
     Hardware Peripheral
-	A group of :term:`hardware components <hardware component>` that
+	A group of :term:`hardware components <Hardware Component>` that
 	together make a larger user-facing functional peripheral. For
-	instance, the :term:`SoC` :term:`ISP` :term:`IP block <ip block>`
+	instance, the :term:`SoC` :term:`ISP` :term:`IP Block`
 	and the external camera sensors together make a camera hardware
 	peripheral.
 
-	Also known as :term:`peripheral`.
+	Also known as :term:`Peripheral`.
 
     I²C
 	**Inter-Integrated Circuit**
@@ -127,7 +127,7 @@ Glossary
 	See :ref:`media_controller`.
 
     MC-centric
-	:term:`V4L2 hardware` device driver that requires :term:`MC API`.
+	:term:`V4L2 Hardware` device driver that requires :term:`MC API`.
 
 	Such drivers have ``V4L2_CAP_IO_MC`` device_caps field set
 	(see :ref:`VIDIOC_QUERYCAP`).
@@ -148,7 +148,7 @@ Glossary
 	instructions on a single integrated circuit.
 
     Peripheral
-	The same as :term:`hardware peripheral`.
+	The same as :term:`Hardware Peripheral`.
 
     RC API
 	**Remote Controller API**
@@ -180,7 +180,7 @@ Glossary
 	control a V4L2 hardware.
 
     V4L2 Device Node
-	A :term:`device node` that is associated to a V4L driver.
+	A :term:`Device Node` that is associated to a V4L driver.
 
 	The V4L2 device node naming is specified at :ref:`v4l2_device_naming`.
 
@@ -189,7 +189,7 @@ Glossary
 
     V4L2 Sub-device
 	V4L2 hardware components that aren't controlled by a
-	:term:`bridge driver`. See :ref:`subdev`.
+	:term:`Bridge Driver`. See :ref:`subdev`.
 
     Video-node-centric
 	V4L2 device driver that doesn't require a media controller to be used.
-- 
2.26.2

