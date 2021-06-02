Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFE8398DD4
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 17:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbhFBPHL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 11:07:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:37140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230482AbhFBPHK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 11:07:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E73D6613D0;
        Wed,  2 Jun 2021 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622646327;
        bh=JZH2HyNn+bokqhbpV6owb8yumaHCOUaoiPPXWSuP7RQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kIbwOdIs/E+yLFKzNEl2LI2MTR5H5X78n4NCRWmX8AsPpuUb8wlEsefatwflmFA24
         F6zBT0br9QpX24PG86M1+O4j2VROs2MqZhqPKyzc/qIrT5WbiOYWqdHGws+CzY1Yol
         v36vk9fYduS1S5GujZALtivIqouKBsOT7HASn3TyoWL2KPixaL9VsgpigVXkmXHISE
         imsqAIrXqNrKHlF8YwJDoClDaZ0vQwaH3ag2Tb6D+VzRMRaa3TxIsiA2sQ51B6Vx0L
         CKGos8ja9nuiN5VQl8OQ5pX4Dib65lX4/1KYBZ7cLQJD/9wepJd9YWQPhMb8NKm4Se
         kusLeMktNKLpw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1loSQu-006Waj-Rq; Wed, 02 Jun 2021 17:05:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 3/6] media: allegro-dvt: avoid EN DASH char
Date:   Wed,  2 Jun 2021 17:05:20 +0200
Message-Id: <94f20b3817342ace2ac06057150b73996874c43f.1622646256.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622646256.git.mchehab+huawei@kernel.org>
References: <cover.1622646256.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While there's nothing wrong with EN DASH on C code, this probably
came from some cut-and paste from an ITU-T table.
It sounds better to just an HYPHEN here.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/allegro-dvt/nal-h264.c | 2 +-
 drivers/media/platform/allegro-dvt/nal-hevc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/nal-h264.c
index 94dd9266d850..a02095eb3fcf 100644
--- a/drivers/media/platform/allegro-dvt/nal-h264.c
+++ b/drivers/media/platform/allegro-dvt/nal-h264.c
@@ -25,7 +25,7 @@
 #include "nal-rbsp.h"
 
 /*
- * See Rec. ITU-T H.264 (04/2017) Table 7-1 – NAL unit type codes, syntax
+ * See Rec. ITU-T H.264 (04/2017) Table 7-1 -- NAL unit type codes, syntax
  * element categories, and NAL unit type classes
  */
 enum nal_unit_type {
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/nal-hevc.c
index 5db540c69bfe..15a352e45831 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.c
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.c
@@ -25,7 +25,7 @@
 #include "nal-rbsp.h"
 
 /*
- * See Rec. ITU-T H.265 (02/2018) Table 7-1 – NAL unit type codes and NAL unit
+ * See Rec. ITU-T H.265 (02/2018) Table 7-1 - NAL unit type codes and NAL unit
  * type classes
  */
 enum nal_unit_type {
-- 
2.31.1

