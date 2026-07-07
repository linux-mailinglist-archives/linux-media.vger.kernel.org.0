Return-Path: <linux-media+bounces-66888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B3ZcEmAzTWoJwgEAu9opvQ
	(envelope-from <linux-media+bounces-66888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:12:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D046F71E28D
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:11:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b="s/4bF+yZ";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66888-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66888-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EB13302960E
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F71478E36;
	Tue,  7 Jul 2026 17:06:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB7444213E
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443991; cv=none; b=pzl7U5bdcoMgW6LmQbMhp7u7ehY/eV29nTbU/TmTLm4gTxUoOAUdjAOHyzqDEbNsjfsisubNkb2qFXkcSt7hWlrkLQRGbYn8AGrT+/XzgvyzoAkV1Og6B0WAXEihjQpZ/2zqU29FZgGTd0xOi/3PLXNdYL4qYHC0h17394teuuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443991; c=relaxed/simple;
	bh=1ncUOOFG8aFwZ1E1ed5HqaMIIZDYZDzkPia0ZCaQGPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukgnlbTkVphIupd+nVrdEs0xqc0y+vYYp/GIeiei9NqC8jqj41uG1RW+fkap7SjOE2fSCU4QRY/wmZ4S82GlGGM3I9FUOWuwV9tkzT27M6oBIhYZPC4p6LO858mmi6HvKDwYfYl7NEFVOkNdjpM81s7jHkiT/PIjmX+/M86GpTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=s/4bF+yZ; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso30747275e9.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443987; x=1784048787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/invQTjEK1SgX9YA4WVxUR62GCT3bwC2Kc2SnLT2WQ=;
        b=s/4bF+yZaE18RKlJ+zzmUMq8pwZcUZAHGNp4B9pWOLJ5onXlg1Rb/JoPGIHwx3hLeE
         raSsnLSKOv/fSZPjK4QQ6K5sUdnNo1HugXlO5wziAblG0bT83a/10ZNRlf6TRUani9GO
         5fiaw2dlGi4oYa+PbDSp5Xm9Hy58sHl+Ce8/N7I835D6iVYgYmyRkL6+1e3ymvyIK8JO
         9Nqh7o4cH1T/JCsvk3iaYSOXexxMBDG7EGT+OnQcxDHXQ5rMExXsm3vvZjkGGifxL+aK
         LjFUaHQ2vkUpzIyLYu6Pi0j0z0XztHKMY21axDk7JdnQcRq6gM9R2mLlGWO2S52AMK9O
         sDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443987; x=1784048787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/invQTjEK1SgX9YA4WVxUR62GCT3bwC2Kc2SnLT2WQ=;
        b=Xyz0TIYDTESHVb/vcVxAgsARM/WdtUoksNvgW+jQrJrfQ+tFv42iDk2PiObnZwKNny
         kqcWKFGKBLLX0+MVmNCFiqhnJiGgO4vIbm4nI9qY9TG73UX2FttC/aRb7qObut6LUoVY
         IL0G/DqYb52sxle7/DuTj4gFyVz2NBvnfzHz+ZLlQz0/SPPy71V2m88Wwlftrb24X9mH
         DemBiehGqFoq+AaHZFPChufA8DWnSzDLZ/WqwuKS+jtGDNzl0345C1c/SE/I53WXhmWd
         YfWyRicuii3+Y50FYrR8keaYz7A8BTpkGI0i6vP71+x8QmUDBmmogQadGanGWQtIm4dH
         YZ7A==
X-Gm-Message-State: AOJu0Yzohgg57bSAEmNuGTutYy0d+GGQXw9nvFdMH2o01wvCa6nXv9eq
	b1qs8BDiAa/qJeKQTRHSgu0SSSjigAxtDghHF6bzZx5OhbhFKPT1ArXxWMJgrNkZZdk=
X-Gm-Gg: AfdE7ckb/ECm1NBt2VDLsEz35IK3jbsB/yIv1y8HoyX5o3ibocbZqO+H/yTmJy1Xwy+
	NIlUXMH/x3277EJTVexwJfXOXfpZswkqhpA40FJD1PL+xW38fDyygB3CRf0BRctv03re3rhzTa5
	Ru51WER30wZXRivfnr0QsC5t5Nmx6y36+C/EPlw21+zCias5nhGPggIh7wICVAHl2cNOmKnwZU7
	ztt7vF4qDE4JHGgXPL2IaOL1Hw7Oho+OwtPAPMH6ExfltITfN//NU1AerR0mh6iy286DIJGWzZS
	asI1kzzXZsfSIXS7yjl4tZXCTkcul25izvTal2qy98vOS/UHEFOm0slnw7PDadoKyDa2rn4ydNc
	a+V3QuH/VTWE+Uut4HYNlr/dzfl+A1EBLJuGvlNztBWY1rQDT6WRtTUUG033UxrjlJG5hw8isyx
	eWeeSrLRSV3Nfl/PXYelqMDY653oq34IA3YA9lswU8pI1bNwnMpZtlBw/b8fCkwjB3
X-Received: by 2002:a05:600c:3e14:b0:493:bc4a:e7d3 with SMTP id 5b1f17b1804b1-493df0a08d1mr67418075e9.39.1783443987256;
        Tue, 07 Jul 2026 10:06:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:26 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:46 +0100
Subject: [PATCH v2 14/20] media: imx355: Set the colorspace in the format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-14-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66888-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D046F71E28D

The colorspace fields were left set to 0 when they should be
set appropriately for a raw image sensor. Add those values.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index c710dda5795b..ff9eaec39fe5 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -737,6 +737,10 @@ static void imx355_update_pad_format(struct imx355 *imx355,
 	fmt->format.height = mode->height;
 	fmt->format.code = imx355_get_format_code(imx355);
 	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
 static int imx355_do_get_pad_format(struct imx355 *imx355,

-- 
2.34.1


