Return-Path: <linux-media+bounces-57060-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA0jIPMAxGmlvQQAu9opvQ
	(envelope-from <linux-media+bounces-57060-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:36:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F25A432822B
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C931304C06E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD06401A18;
	Wed, 25 Mar 2026 14:51:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA69A3FCB29
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450272; cv=none; b=n4RfV+FPsE0rr5VorckMxffeTFXE4t8r4CPGHaLdcaVvM2QD5f3JGX9mS3mqOEHXf2ErgAbtXLihWwcivh15r5KBbrhJ0bGKk7SYaJOwPbEZ0mtGvhh+c7pvS0PfDUDBBT9jnV4hgkafnVKQfOzpIt+jQAFKidryT5Eqyg8+RaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450272; c=relaxed/simple;
	bh=fN+VuIIDFsD+IofRR25yub/nitAW+RD1GEK9qG35KZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8MxlPqwDzcbe98o2VmOTThYdCGSCCDjPW0oFZnWYh8dsSxsWqqFYrcqFRwrAxCdTQWcvDylkWKQ/+IFcyd5gv1jO9LqGC8s6ynWJ4ktmDGUGoJJwMPlqe1XKY8yYaDhhIUjrBH24czulC/b41O19v/s3M2/SXs1ro3pbpXm4WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w5PZV-00050C-BP; Wed, 25 Mar 2026 15:51:01 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 25 Mar 2026 15:50:48 +0100
Subject: [PATCH v4 17/27] media: rockchip: rga: use card type to specify
 rga type
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-spu-rga3-v4-17-e90ec1c61354@pengutronix.de>
References: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
In-Reply-To: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57060-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,pengutronix.de:email,pengutronix.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F25A432822B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation of the RGA3 support add a filed to the rga_hw struct
to specify the desired card type value. This allows the user to
differentiate the RGA2 and RGA3 video device nodes.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 1 +
 drivers/media/platform/rockchip/rga/rga.c    | 4 +++-
 drivers/media/platform/rockchip/rga/rga.h    | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 7a4070665fed7..f6070508b1475 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -577,6 +577,7 @@ static struct rga_fmt formats[] = {
 };
 
 const struct rga_hw rga2_hw = {
+	.card_type = "rga2",
 	.formats = formats,
 	.num_formats = ARRAY_SIZE(formats),
 	.cmdbuf_size = RGA_CMDBUF_SIZE,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 75d05c86b1c00..421a70558c3c7 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -306,8 +306,10 @@ static const struct v4l2_file_operations rga_fops = {
 static int
 vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 {
+	struct rockchip_rga *rga = video_drvdata(file);
+
 	strscpy(cap->driver, RGA_NAME, sizeof(cap->driver));
-	strscpy(cap->card, "rockchip-rga", sizeof(cap->card));
+	strscpy(cap->card, rga->hw->card_type, sizeof(cap->card));
 	strscpy(cap->bus_info, "platform:rga", sizeof(cap->bus_info));
 
 	return 0;
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 454af283b1694..dc6f90b843c32 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -145,6 +145,7 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 };
 
 struct rga_hw {
+	const char *card_type;
 	struct rga_fmt *formats;
 	u32 num_formats;
 	size_t cmdbuf_size;

-- 
2.53.0


