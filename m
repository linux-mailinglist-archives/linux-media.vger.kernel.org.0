Return-Path: <linux-media+bounces-63920-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kKLzEKrUImqkeAEAu9opvQ
	(envelope-from <linux-media+bounces-63920-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:52:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94367648A8B
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:52:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63920-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63920-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AA683032646
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312632F6910;
	Fri,  5 Jun 2026 13:48:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2624318A93F
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 13:48:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780667285; cv=none; b=XJ6Syvx4nSLoWaEKLNXSMYwq0z8XThK4VoZOH1loiTn3ZR7b+TRAWzTv3NwZAkkWiZ4MMKTqAq1HPlM/VOcza1qG8lKSfdaTuwpTkGAvZd/g8K8rFwqtUj942qSM82RaXlinW2VmAbmmvfI8GjWVGAwYyvAxbvV+bLJu8aKkVTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780667285; c=relaxed/simple;
	bh=jsU58i1TQ8GxtNs26qfV00swSBhq7f6YlSLTjWfxI1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HRLRSCC6+/B0oazY67A3T03Or7lagFQTImgLU5z5lxsXRZNi5Uod43eFPOVaIQV1lSjlwWFYo2kpuBfMeHNgeghHQZm8sHNvQTBOENFr6rbC9ILAQbJNaDSrFJoAI+ZcVs4CHXpIHlh8SyYpHMRRDSlrVa7fVhZ/UC9nV01HIzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVUee-0000cf-1N; Fri, 05 Jun 2026 15:32:08 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 05 Jun 2026 15:32:01 +0200
Subject: [PATCH] media: rockchip: rga: don't change RGB quantization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-spu-fixrga3quantization-v1-1-1059d984dc6e@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBAAv0L2bJMtxmr8ivGwlAXWQ8VuS4iEv
 7vqcZKZ2UA5Cytcmw0yL6LyTAb+0ECcKI3spDeGFtuAAU9O5+oGWfNIx1elVORNxRqHwcdz8OT
 7C4LVc2bTfufb/c9auwfH8t3Bvn8AsZjEBHsAAAA=
X-Change-ID: 20260605-spu-fixrga3quantization-061c761a1d80
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacob-chen@iotwrt.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:nicolas.dufresne@collabora.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:p.zabel@pengutronix.de,m:m.tretter@pengutronix.de,m:s.pueschel@pengutronix.de,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-63920-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,pengutronix.de:mid,pengutronix.de:from_mime,pengutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94367648A8B

Don't change the quantization of an RGB format when converting between
RGB and YUV with the RGA3. As the RGA3 only supports doing conversions
to full range YUV with BT601, it wants to announce it through
try_fmt/s_fmt.

As it is only relevant, when converting between RGB and YUV, it's
guarded by a given condition. But the condition also causes the
RGB format quantization to be adjusted to limited range, which
is incorrect.

Therefore simplify the condition to only apply when the current format
is a YUV format. Also document the reason for checking if the other
format is an RGB format.

Fixes: 24a63d4c9d3c ("media: rockchip: rga: add rga3 support")
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
This patch is a fix to the upcoming RGA3 support. By mistake it'll also
adjust the RGB quantization instead of only adjusting the quantization
of the YUV formats. Therefore remove the incorrect conditions and
document why we also check the format of the other side.

I've just noticed this flawed condition and didn't check/reproduce it in
a practical scenario.

    v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
    ....
    	Card type        : rga3
    ...
    Total for rockchip-rga device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

    v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
    ...
    	Card type        : rga2
    ...
    Total for rockchip-rga device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0
---
 drivers/media/platform/rockchip/rga/rga3-hw.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/media/platform/rockchip/rga/rga3-hw.c
index ca1c268303dd4..c4a71306278ba 100644
--- a/drivers/media/platform/rockchip/rga/rga3-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
@@ -450,10 +450,14 @@ static void *rga3_adjust_and_map_format(struct rga_ctx *ctx,
 	other_format = is_output ? &ctx->out.pix : &ctx->in.pix;
 	other_format_info = v4l2_format_info(other_format->pixelformat);
 
-	if ((v4l2_is_format_rgb(format_info) &&
-	     v4l2_is_format_yuv(other_format_info)) ||
-	    (v4l2_is_format_yuv(format_info) &&
-	     v4l2_is_format_rgb(other_format_info))) {
+	/*
+	 * Only apply the quantization restrictions when we need to
+	 * convert between RGB and YUV. Otherwise there is no point
+	 * to limit the quantization for operations like scaling or
+	 * rotations.
+	 */
+	if (v4l2_is_format_yuv(format_info) &&
+	    v4l2_is_format_rgb(other_format_info)) {
 		/*
 		 * The RGA3 only supports BT601, BT709 and BT2020 RGB<->YUV conversions
 		 * Additionally BT709 and BT2020 only support limited range YUV.

---
base-commit: 6a75e3d4f6428b90f398354212e3a2e0172851d6
change-id: 20260605-spu-fixrga3quantization-061c761a1d80

Best regards,
--  
Sven Püschel <s.pueschel@pengutronix.de>


