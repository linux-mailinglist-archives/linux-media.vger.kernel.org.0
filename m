Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D3E2DBFA8
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 12:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgLPLqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 06:46:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40548 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgLPLqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 06:46:38 -0500
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C6D02CF;
        Wed, 16 Dec 2020 12:45:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608119156;
        bh=QG2YDAuuLw0bc9GhggjHq8Fa62/+hU124yybIcAWXRE=;
        h=From:To:Cc:Subject:Date:From;
        b=KSUffbTcTbzquCKlj8nzkMEQoxCCKbixj9hACoFr+QGv7GkpP0QBptCu94wJIlAx8
         DKhCN0Ae3masmsM4nRgaxCISpn50hsJjE0E1bvwlccCUvbJsoVVYKXMtnY/qkfvj3U
         aGTPkzk9HkntQUzt7bwjTQ0dwTOFAbuNApe+HBPk=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] media: vsp1: Use BIT macro for feature identification
Date:   Wed, 16 Dec 2020 11:45:48 +0000
Message-Id: <20201216114548.818985-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These entries can only ever be single bits. Make use of the BIT macro
accordingly.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---

A minor trivial patch to convert the features to use BIT.
This is used by a patch I have locally for the upcoming VSPX support
where we introduce a new IIF feature.

That won't be sent for some time, and this update stands on it's own, so
sending here.


 drivers/media/platform/vsp1/vsp1.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1.h b/drivers/media/platform/vsp1/vsp1.h
index 56c62122a81a..37cf33c7e6ca 100644
--- a/drivers/media/platform/vsp1/vsp1.h
+++ b/drivers/media/platform/vsp1/vsp1.h
@@ -44,16 +44,16 @@ struct vsp1_uif;
 #define VSP1_MAX_UIF		2
 #define VSP1_MAX_WPF		4
 
-#define VSP1_HAS_LUT		(1 << 1)
-#define VSP1_HAS_SRU		(1 << 2)
-#define VSP1_HAS_BRU		(1 << 3)
-#define VSP1_HAS_CLU		(1 << 4)
-#define VSP1_HAS_WPF_VFLIP	(1 << 5)
-#define VSP1_HAS_WPF_HFLIP	(1 << 6)
-#define VSP1_HAS_HGO		(1 << 7)
-#define VSP1_HAS_HGT		(1 << 8)
-#define VSP1_HAS_BRS		(1 << 9)
-#define VSP1_HAS_EXT_DL		(1 << 10)
+#define VSP1_HAS_LUT		BIT(1)
+#define VSP1_HAS_SRU		BIT(2)
+#define VSP1_HAS_BRU		BIT(3)
+#define VSP1_HAS_CLU		BIT(4)
+#define VSP1_HAS_WPF_VFLIP	BIT(5)
+#define VSP1_HAS_WPF_HFLIP	BIT(6)
+#define VSP1_HAS_HGO		BIT(7)
+#define VSP1_HAS_HGT		BIT(8)
+#define VSP1_HAS_BRS		BIT(9)
+#define VSP1_HAS_EXT_DL		BIT(10)
 
 struct vsp1_device_info {
 	u32 version;
-- 
2.25.1

