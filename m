Return-Path: <linux-media+bounces-23853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4AA9F8EDA
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 10:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0523F18964A3
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 09:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3624D1AAE01;
	Fri, 20 Dec 2024 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v1ghjJ8J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A35588F;
	Fri, 20 Dec 2024 09:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734686534; cv=none; b=TzMU28x/GkOLKqT4jybpdLI7jQRhUi7qcc96VN6jjELmhrJ0F4/o812WyieSfc0OGOWyxOp7gXNySkGNe1o1qqF1NNSeFwGJjKo/ougvN7s2wdjBKzo8Hv1EO+Uit3bAvJLpTuQRB7t6kqiZYxcrp8qEK+AUmBS0UZ9JYVGPGJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734686534; c=relaxed/simple;
	bh=J6VNNIgWE4fu7QNg1aHqIA1trhBXmGLYUKuGW1+J5oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ptEsEexx9rU+w9B+3yEu3G4cYoXqJADb+4a3T2GLNwKFz3Pss6pY+MPPfU/in3K4EN6v5iGbY8u2TvSHE5agje5aJ5D7FAFd9SV6VJL4giUGWXcjAIP0XpN71BbQyUlyWMcRwwQuOT+Gbf/P8uX5zN83X3m1wxpO7FtxRwWGyuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v1ghjJ8J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.105] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6778ABE;
	Fri, 20 Dec 2024 10:21:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734686491;
	bh=J6VNNIgWE4fu7QNg1aHqIA1trhBXmGLYUKuGW1+J5oo=;
	h=From:Date:Subject:To:Cc:From;
	b=v1ghjJ8JSFa/85dKWMbRHdeeesj0NdBp6haWXvRaYirDNoN56MLOzXCY+9T3+FGee
	 B7Qx+OcVEkrFdZF6Y75ApLVe7asGOYswCana5SSxPSKP7LCBFyAnvVT00sFo59cP+o
	 HiLOr2QKoIxMAjygtiX/n3lEVRzEv9UA/WcKJ2Do=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Fri, 20 Dec 2024 10:22:01 +0100
Subject: [PATCH v2] media: renesas: vsp1: Add support for VSPX
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-v4-vspx-id-v2-1-5cf05c7352df@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIADg3ZWcC/22MMQ7CMAwAv1J5xqgx6QAT/0AdktqhHmiqBEVFV
 f5O6Mx4J93tkCWpZLh1OyQpmjUuDejUwTS75Smo3BioJ2vIXLFYLHndmkbDTN5bJxwYWrAmCbo
 ds8fYeNb8julzvIv52b+bYtCg2IFo8D35cLkri8tx8dElPk/xBWOt9QvVKueOqwAAAA==
X-Change-ID: 20241219-v4-vspx-id-1dd2bb4aedfd
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2407;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=J6VNNIgWE4fu7QNg1aHqIA1trhBXmGLYUKuGW1+J5oo=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZTdBfI6bqIpMCl0QYgHAtCMj1grQpf58yNmJX
 twTvwZNdLGJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2U3QQAKCRByNAaPFqFW
 PHpyEACQ+mhMd5tBbOGVBXLpWxSfjnl4CU4WaYYvyCQsWBH46vIMG2IfqdbhBI8U2I7pI7P/BhE
 LVHHK4krgLyrbCX3FRePPZB/RaRSd+zAbgXcfHOWDmslFD8rs7l86TUPfGfZJdbCg12wP3lw9SK
 wkubTHmqhNs10y1VAyCNKu/vpe7Xzkyzkqf6ruESmhg6qgH0g44gAShgqFi5WQ+c16QLgjnB1Il
 JHnfUJDJ/6nl967MtFhzdHoS6QmkOy/b/7Js1vDFP+BwR1ZlPlgxO0cDfVUrYTHClIPZVBLVrP2
 wy1d9p2+pjFP8VVHODoPq5WJThX90tEGCkU9NuL2nV+ME6bTsTfAVTYu8VGrBaY60NqBQAvLDdA
 9r3FqhSz2ag3l0a3xEELXwfD6EKWDJVLuCNoNAWQf/CzNZYQvSA/K6Mqsm/HA00RAt6gcZ7Idw/
 FvPBjT6k1ZFo3v3xx1QqXR6rxT9rssAWn1SXZJNDuFvBmmZM92PtNBBOVFIyk8veUPq9vxbX6Gv
 m0zG75R+DsrkYCX8XITgTE5ooUXpMQt7C/kmpT0IsIP6qjyKtpzwY9v9mghjak06hzo9JYwi557
 7CFlWJYlu7YU7mBMMChpyHKDWdKRdcU5M7+AJdPEJ63DJr3r6xwE/LkBzxm6YWvB//XfatHgG95
 7qcDG5si0vtWtXw==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add support for VSPX to the vsp1 driver.

VSPX is an instance of Renesas VSP2 IP found on R-Car gen4 SoCs
that performs external memory access on behalf of the ISP.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Add an vsp1_device_info entry for Gen4 VSPX.

VSPX will likely need custom features, hence do no set any feature
for the time being to prepare to expand later on.
---
Changes in v2:
- Changed the patch authorship to my +renesas address
- Collect tags
- Link to v1: https://lore.kernel.org/r/20241219-v4-vspx-id-v1-1-e45225b02bf3@ideasonboard.com
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
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


