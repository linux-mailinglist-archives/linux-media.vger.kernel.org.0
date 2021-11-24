Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5E4445CCE0
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351092AbhKXTQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:52524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350958AbhKXTQg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87EBC6104F;
        Wed, 24 Nov 2021 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781206;
        bh=Eevvy6W9YFudWvuEV7p/tKC/syUTBm6/p7JKSRgzf+c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bXRHw01CBVngYyR14Do++R6BzvSB9JP7je96g+iXWBdT+wE/aqtEGa6hdNO4kqBTk
         9yZWATN6OXyU8lp/8J6uc99RUm0r68IbHPDvB7MIcnUXg1koWHj77GgjuYB9Bhvv64
         a3LpiMHUXBO9WqWCegR6Op+aC+HSbaGYhzyLk+PkppKox5YE83Bfb5t7WE0SRab7VS
         aJUaxNh7F0I/RG7GK2GRO/ZWPwtwLWToTw1GgAicKNKAcGwyBiAhG61QcddK/13Igd
         GnFzKMa427xZnVyrdLCe5jb2vVKHgLT7R1wwPqCno2sYz4ZE/uz/NpG8AR3T2dcjAr
         UrcrVxcNAzQTQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q59-GH; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 03/20] media: davinci: get rid of an unused function
Date:   Wed, 24 Nov 2021 20:13:06 +0100
Message-Id: <4e64efe47ed540f3ec60b86c4b1e0ad29a2ddc65.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vpif_get_default_field() seems to be some left-over from a
past code that sets the field order.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/platform/davinci/vpif_capture.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index ae92e2c206d0..aba105fa7ef9 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -618,17 +618,6 @@ static void vpif_calculate_offsets(struct channel_obj *ch)
 	ch->vpifparams.video_params.stdid = vpifparams->std_info.stdid;
 }
 
-/**
- * vpif_get_default_field() - Get default field type based on interface
- * @iface: ptr to vpif interface
- */
-static inline enum v4l2_field vpif_get_default_field(
-				struct vpif_interface *iface)
-{
-	return (iface->if_type == VPIF_IF_RAW_BAYER) ? V4L2_FIELD_NONE :
-						V4L2_FIELD_INTERLACED;
-}
-
 /**
  * vpif_config_addr() - function to configure buffer address in vpif
  * @ch: channel ptr
-- 
2.33.1

