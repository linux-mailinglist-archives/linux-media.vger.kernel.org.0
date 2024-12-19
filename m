Return-Path: <linux-media+bounces-23823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3C49F8280
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABC0F189A3FA
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 17:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553A31BEF7A;
	Thu, 19 Dec 2024 17:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b0p5sXsn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3941AA790;
	Thu, 19 Dec 2024 17:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630028; cv=none; b=ISPSqjz9TT8WZwD/lgFp5rg70dbZUP24ZgztVx9jdWjvklfenD1M1fHi20fYYyGXvnQVmfMU/psBZ6sQ1vYb8K9uWlsb+PbXlai7LpfSHhD+43e1LPH5dnDBtFKQjbA8vHh0ybCrJMQMyjJE2sY2MhtDclUw0p4OY6QBngYAAps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630028; c=relaxed/simple;
	bh=Jd9R60YysaU6TnOWsNhvrOkWh2WcMsYqEX6aR4G19jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Zns4xuDpV/yN4UfXbutjfHgozJ8XSiy7SqifUyShBj0CCnmLsoyI8HwQHzR7KQAevXIqcFW3lR9GyAUr9skL3NLPdGUm/5lx9qjATILZBKDDzNzkq4CMeuLP4j0x7eAAnOU9Ss8+ZFKyqIuuOZTuxJURuIXf7k6MDod8I3qJiSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b0p5sXsn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7281163;
	Thu, 19 Dec 2024 18:39:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734629986;
	bh=Jd9R60YysaU6TnOWsNhvrOkWh2WcMsYqEX6aR4G19jk=;
	h=From:Date:Subject:To:Cc:From;
	b=b0p5sXsnT+IiU0Aafn6hywcFqPR4yunjql4inmlxVS0smngzv6ffE+zewWVbznZqI
	 gvz9AzaKbGsPZYprZz7df/5YiU7gPDrHibjDinP3HjWX/ClRnDlOyiudlLmCEiy8VP
	 pYPb55qmMn9VdEiOJ143L957sLnZy4U8JXDMlbHE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 19 Dec 2024 18:40:13 +0100
Subject: [PATCH] media: renesas: vsp1: Add support for VSPX
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-v4-vspx-id-v1-1-e45225b02bf3@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAHxaZGcC/x2MQQqAIBAAvyJ7TmjFS30lOmi71l5MFEQQ/550n
 IGZDoWzcIFddchcpcgbJ+Ci4HpcvFkLTQazGosGN12triW1qTUSGe+tYwoEM0iZg7R/dpxjfGN
 DBPZcAAAA
X-Change-ID: 20241219-v4-vspx-id-1dd2bb4aedfd
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2128;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Jd9R60YysaU6TnOWsNhvrOkWh2WcMsYqEX6aR4G19jk=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZFqIwHBeAQ12ppbDda1iOotcjt0EJKFwRTVcu
 iTwkHi8e1yJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2RaiAAKCRByNAaPFqFW
 PE95EACsFsfko3QefN2KvDm1bDTgOa4pMucdlbcEI7Rud6SC+kYOxeNktzbzDwZQR8CMSzmsXMh
 bjBwTlKcbuH2VfwOv4Qyqb/Xy9z0e0epMIui2f6GhOAyMP0xgnAJJTNcvgepbiMYqgPpwIxBcvG
 YaJbVYj7T3PbCLe/BttwdHedU8J57zttwhasCtFPHBt1/vFM7crc2AnItrijppEeL47lRnMlwQD
 F/tD3PaHLFsplRKAw7pd8ik0QYyZH5H8djNDYA9fkR7qc7EwOxOcq2h1L1TBUBG+nKMwyFple7e
 36Xb5eUV/TH5+50BudOkA7kjDRe/lm/vL+VgPBW6fO844rfLyNtCG2Zqf1d1Erd5xGTNzujgTh/
 3VCOQYM6umfxNQnnFiyYwlWvGyod8UAugAGRbCmqw2J0UabHQKUhqVZQzeEWOL4FxbLjZoLavOp
 Gpb+K0Fqfo1fcrtL6P1HEfam/7tAOtS5b+eQe4E9j7nbR/VoQb9jh7RjuDkkhqFr+6wFDjABtrb
 2r1jVNNCnhcuKpRDfUQZXrW31GBN0QAuyne637/K7BOt9nq0f6ncF2vSo3Rs+sOfBl/bQy2HcAh
 35b2Dzb4tpiTrYncmCiXVo8EscP7DGH+RgCgUd3aV0e88NmuLZUBfV1M0fTBAgU22hE5KOjs9vo
 AlcXHz83rrpXK1A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add support for VSPX to the vsp1 driver.

VSPX is an instance of Renesas VSP2 IP found on R-Car gen4 SoCs
that performs external memory access on behalf of the ISP.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Add an vsp1_device_info entry for Gen4 VSPX.

VSPX will likely need custom features, hence do no set any feature
for the time being to prepare to expand later on.
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 10 ++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_regs.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 9fc6bf624a520ae38e9c5f30dfa4dfa412eec38e..4dfc5e1640264f23772964f2b48c66d76599cb70 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -835,6 +835,16 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.uif_count = 2,
 		.wpf_count = 1,
 		.num_bru_inputs = 5,
+	}, {
+		.version = VI6_IP_VERSION_MODEL_VSPX_GEN4,
+		.model = "VSP2-X",
+		.gen = 4,
+		.features = 0,
+		.lif_count = 0,
+		.rpf_count = 2,
+		.uif_count = 0,
+		.wpf_count = 0,
+		.num_bru_inputs = 2,
 	},
 };
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index 7eca82e0ba7ec5e02a5f3b9a30ccdcb48db39ed2..75e064429f4e231ecd2e291a10c09931e8096a97 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -791,6 +791,7 @@
 #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
 #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
 #define VI6_IP_VERSION_MODEL_VSPD_GEN4	(0x1c << 8)
+#define VI6_IP_VERSION_MODEL_VSPX_GEN4	(0x1d << 8)
 /* RZ/G2L SoCs have no version register, So use 0x80 as the model version */
 #define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0x80 << 8)
 

---
base-commit: 50d451b19cc58cf374160e30cbf72a5ed5b1b129
change-id: 20241219-v4-vspx-id-1dd2bb4aedfd

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


