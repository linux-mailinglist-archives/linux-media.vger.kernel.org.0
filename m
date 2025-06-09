Return-Path: <linux-media+bounces-34371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAB5AD2657
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 21:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A248D1603EF
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 19:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009FF221262;
	Mon,  9 Jun 2025 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aUfHj1xe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D751021FF55;
	Mon,  9 Jun 2025 19:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495730; cv=none; b=Zkgq8oTlpOssPnJOSmSuoxoUaOmJmzhc7RHqNqe5IXt3YaClyIJ9o88ep3Sfsm/Fh36Pzy3EMoFAB7r8Drp1O4sTD84FIcjXeV+F9AtEyzd0BstLqX3pucQ1KlCjz11WuRUv/Qr84HJ29fso++Tw+mYHhHQtJBkAIC2/B5TV/no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495730; c=relaxed/simple;
	bh=++BxlHXhGOEFxpcEXo1+jaIVKnUzXa+f4K/H8OJ8/Zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D9YC159/zFfHyx/RC/4O6QrhgNKs7n4nsH5NRVg1LLwdeoEZUnninHQsXHN68fsYPLQ4VX0j2ITaIfIxO2hD+/uv+alAhsCAry4piqje83WD01b15MbH1IDKIN+H/g+vEESUnh1PoaUES7gFJFUHPHlNt67eyCTw59p6xm/lKXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aUfHj1xe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F1FD10D4;
	Mon,  9 Jun 2025 21:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749495716;
	bh=++BxlHXhGOEFxpcEXo1+jaIVKnUzXa+f4K/H8OJ8/Zo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aUfHj1xe2p2Om5r7FKPmeHkQs5P5QDkcCCLKKpISkIrDOf7D1ZuNyUjMv2LfNsZaW
	 A4i9b+9OvOw6JnAggu4eMNpDDdg0KGOBt25yC308QbmSG6KUD8xns3XTWOqjHJErYj
	 /up5UALlVPl91eXmVxa42CrEM5Z6x0S7GgjQMvQI=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 09 Jun 2025 21:01:44 +0200
Subject: [PATCH 3/3] media: vsp1: Reset FCP for VSPX
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-vspx-reset-v1-3-9f17277ff1e2@ideasonboard.com>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
In-Reply-To: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=++BxlHXhGOEFxpcEXo1+jaIVKnUzXa+f4K/H8OJ8/Zo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoRy+oZe7ZGnme2/fjNJjZ3R+Vt8Njd5iT1d64j
 PFSBl2wQraJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaEcvqAAKCRByNAaPFqFW
 PN6WEACYKSg2wNAxMuLBXmjMAhfyXN8CPWeuPhlTABtg52NFkvtfWmJ0XPGXKGNPezYEs9uhC4x
 xnP2d49VltCBiBJLgPcPHL7GmdLilslU58BbSekW1iSYbrdfTQ398LWZvw6fTfMPzp6YpDgCCyg
 lvB/GYq58S3El4/8epIbv51TDlvpZFX7CQB+hIxyGrG+V+FqxMgPT7EV17ZdzezDx5JSEamrDtN
 /Jl8CHyVKMRFuqcGPB5wofo7JV3x4pVL6kCnuaCXs+L6tdk8mWBJVlZNvn1WI1f6VpdBmmFTE4G
 nMHNlJYcWc08Q9r0+InyB8oRzsecWH9Clx2izC8XUHLDypuxFjmCBfHpINP7iI3Y2v5xRtQ3Gpi
 cJiIUAdQjqoUUx/EZLhD2WCaKCSMxiExKh0pieZoxfUQ4zn75ucnpCRa5ujTJHEpdc27hprzwEd
 8qDaOKiR0mo05OPgB+ADC+zrs4zPBrdH7Ig4+9wtmQNhAno5+Zs6/Lpv19k+C67yOVnbfObXWOv
 pw1Pjn0mi85aurYQOC6vPK/w7kHoggA23/znjM9sL8cwGbQ5CHOVWbhAHuuQjdKyAsuqn/ilcYu
 HMDNnvUzWWHjTz56Yhuny2SkKQ+K7EowD5G7piov90Zro1Wl8KF9W4oN/4wLOc/AJVMKfM7vzJq
 /iIqNTjjCoH3wMQ==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

According section "62.3.7.1 "Operation Control Setting
IP set VSPX+FCPVX" of the R-Car Gen4 Hardware Manual, FCPX has to
be reset when stopping the image processing.

Softawre reset the FCPX after the vsp1 pipe has stopped.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index a6e5e10f3ef275c1b081c3d957e6cf356332afce..c6f2417aabc479384012ab8ab99556029ede1f44 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -499,6 +499,7 @@ bool vsp1_pipeline_stopped(struct vsp1_pipeline *pipe)
 int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
 {
 	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
+	u32 version = vsp1->version & VI6_IP_VERSION_MODEL_MASK;
 	struct vsp1_entity *entity;
 	unsigned long flags;
 	int ret;
@@ -515,8 +516,7 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
 			spin_unlock_irqrestore(&pipe->irqlock, flags);
 		}
 
-		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
-		    VI6_IP_VERSION_MODEL_VSPD_GEN3)
+		if (version == VI6_IP_VERSION_MODEL_VSPD_GEN3)
 			ret |= rcar_fcp_soft_reset(vsp1->fcp);
 
 	} else {
@@ -529,6 +529,9 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
 		ret = wait_event_timeout(pipe->wq, vsp1_pipeline_stopped(pipe),
 					 msecs_to_jiffies(500));
 		ret = ret == 0 ? -ETIMEDOUT : 0;
+
+		if (version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
+			ret |= rcar_fcp_soft_reset(vsp1->fcp);
 	}
 
 	list_for_each_entry(entity, &pipe->entities, list_pipe) {

-- 
2.49.0


