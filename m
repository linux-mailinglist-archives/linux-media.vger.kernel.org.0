Return-Path: <linux-media+bounces-55659-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLLqN1fys2nYdgAAu9opvQ
	(envelope-from <linux-media+bounces-55659-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:17:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 477F9282182
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AEC53226FAB
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939D138F63B;
	Fri, 13 Mar 2026 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k1BWPd/H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BED386C08;
	Fri, 13 Mar 2026 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400457; cv=none; b=bq70yzbFE36Rabn0mdXg9BXRkWRxft14WSlEZZXn43m0LQyOiA54vlJy4ajvLgp02oI8L93OEz39ylRFhh55jWJBAE8yT9yv1OrKTEDW0gM4wIzrakUODfTetjpAzEzP1F3XzoyWv/wbcGG3+IdAfg2lgfDUfrlERALcAgku1hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400457; c=relaxed/simple;
	bh=4ptyeyi5GxSJDM048EQyK7eLv/PzQVuFr5JDpZmhkU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9x+BodnkHztwgnbDy0X/hBPH+7roowf3KutFDh1e1QVKSUfsHzvAM4ALud0mSbSr1glrNZqw4LwK3FEKCdVbKnjdY5HCQxerAkz/uOZGnELelP0iI0PBCkwiUVX15Mji4nFy1J/O0zdZ/SewI21pDpSY23KDbjFNxw1vv/U6yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k1BWPd/H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.92.229])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97E401934;
	Fri, 13 Mar 2026 12:13:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773400385;
	bh=4ptyeyi5GxSJDM048EQyK7eLv/PzQVuFr5JDpZmhkU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k1BWPd/H6J/m/sOA0e1EHG+NtvnLu8bnsVZJiubFViTKtAgJU7uNN4u8BYESNxpU2
	 iPWZcMjaPPokhGiVu6+7baBwQ1k0KNWvnUhhcIXhXV04n/qG7Z18apanMH2jHo9Csd
	 mvlMPAo8j6T2CLEv3b9nXv71K5EM1bftsYjRkzJk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 12:13:59 +0100
Subject: [PATCH 3/7] media: rzv2h-ivc: Write AXIRX_PIXFMT once
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260313-mali-ivc-fixes-v7-0-v1-3-cb0714cd1279@ideasonboard.com>
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2514;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=In3K0Hh5a5VAES6eja5NKesKgsMmiywmEDbrhEQG/vw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps/GAQiXNHQ6D+CGvDeuJ0ni1i2P7tUTFnipur
 Ez/wMWOZZ+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPxgAAKCRByNAaPFqFW
 PCqvEACOM5DLzL/NyB23VkIlPz+lpNzBmBoMaPFZQjkC/JiHYsAGPI79KmYhNTw3T9lsklo3O/C
 bvk5BAOB6KPFEywhc9+6hynVvA2cSngVPFYhjl75+XcFyRAm9zKZTE3jnAvXGM+N/ipx5SDQJKB
 rmbmGOYQyPdrPkbrF3tG4cZpxKmWWc7IKwM/jG62BLkQeKKaGJPnT5H+kl7gHW3BHftaFK/DVVJ
 ziB1bkeHoe38U+Jca2Ug7U1C6tDeVP63jnOcmEFus0+u8ZZO4ppGy/EAKeS9u+T3t8FZnisGlj7
 LSD9Yn8LvzIlNhZTjzfpUxtLLoWCkUqsY99mQreac7GvZEvbwigBEv9Y1mRLakml+w7vdn7VArM
 P2sX0QCIZd65Ai6UxPH0O89e/YC+Hx+49dNHaUuTLW85BrpO6eRK9ZunDExTicyE96jLZ6Jwklg
 I89Zr6B9KHKGu0uOXaTIYJY1JKaAh+5Vh98bj6f26l44jx/z5Zu71EAqHIcCAB7BTyOKU6xiGkC
 8wXZeMlK4dnfQ6ua4hoxsFYyte7YC9vtKDTPbKbGr6CMslhl1QKbMSZqWQtSJ1JVwLW9/DWJ20U
 Vp+Np4Xl82KGSEGq6DV8uuNf6Qj1ExzaW7zmtt1+frLKeOdoDejQwOZnu5iZqVbUbPpFycZXR2b
 ZHTSe+NBlYN7lbA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55659-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 477F9282182
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>

The documentation prescribes that invalid formats should not be set,
so do a single write to ensure that both the CLFMT and DTYPE fields
are set to valid values.

Cc: stable@vger.kernel.org
Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 8 ++++----
 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h       | 7 ++++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
index bfe5b0c7045e..d894a880c33f 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -215,10 +215,10 @@ static void rzv2h_ivc_format_configure(struct rzv2h_ivc *ivc)
 
 	/* Currently only CRU packed pixel formats are supported */
 	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_PXFMT,
-			RZV2H_IVC_INPUT_FMT_CRU_PACKED);
-
-	rzv2h_ivc_update_bits(ivc, RZV2H_IVC_REG_AXIRX_PXFMT,
-			      RZV2H_IVC_PXFMT_DTYPE, fmt->dtype);
+			FIELD_PREP(RZV2H_IVC_AXIRX_PXFMT_FIELD_DTYPE,
+				   fmt->dtype) |
+			FIELD_PREP(RZV2H_IVC_AXIRX_PXFMT_FIELD_CLFMT,
+				   RZV2H_IVC_CLFMT_CRU_PACKED));
 
 	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_HSIZE, pix->width);
 	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_VSIZE, pix->height);
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
index 4ef44c8b4656..54c70de31c1e 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
@@ -24,9 +24,10 @@
 #define RZV2H_IVC_ONE_EXPOSURE				0x00
 #define RZV2H_IVC_TWO_EXPOSURE				0x01
 #define RZV2H_IVC_REG_AXIRX_PXFMT			0x0004
-#define RZV2H_IVC_INPUT_FMT_MIPI			(0 << 16)
-#define RZV2H_IVC_INPUT_FMT_CRU_PACKED			BIT(16)
-#define RZV2H_IVC_PXFMT_DTYPE				GENMASK(7, 0)
+#define RZV2H_IVC_AXIRX_PXFMT_FIELD_CLFMT		GENMASK(17, 16)
+#define RZV2H_IVC_CLFMT_MIPI				0
+#define RZV2H_IVC_CLFMT_CRU_PACKED			1
+#define RZV2H_IVC_AXIRX_PXFMT_FIELD_DTYPE		GENMASK(7, 0)
 #define RZV2H_IVC_REG_AXIRX_SADDL_P0			0x0010
 #define RZV2H_IVC_REG_AXIRX_SADDH_P0			0x0014
 #define RZV2H_IVC_REG_AXIRX_SADDL_P1			0x0018

-- 
2.53.0


