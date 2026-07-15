Return-Path: <linux-media+bounces-67650-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZtiPABBzV2r5OAEAu9opvQ
	(envelope-from <linux-media+bounces-67650-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:46:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6C375DB20
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:46:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=Vi1o2TyR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67650-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67650-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04ED230AB7BE
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B1C44B68D;
	Wed, 15 Jul 2026 11:44:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4B5332ED6
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115852; cv=none; b=TeXJhcWM0uSnqZA6iO2kU3P9cxSB5/BnOIy92t8dd0HYwV2N/UePPWHx6Puy2D3vfZU1uJ4BwdtQ8OyT6+atnTe6STcI19snux7Dvf0oJNJKx7SrgRoqrkoRheD6l4Z4ZGHlPJiIcRrZcGlKk4M0079YAxLX7PyVz+NiBTBfkd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115852; c=relaxed/simple;
	bh=TiWHPeDGaPVeBlBGHKihLG/CZfpC4vuLM0PYqJWSqJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=juL3/iyeerxghhkKxreMYRq7+44DI5OxUfHloo3oC/j/DXd1624J+jtPtPJOv+JQk4RKvzdF2sqQDGNqktShxEjDdbeEIC+x96cpbJzdaaxM6aUvUD98WpYzvr5tRFOjQSaHex2938zOHD8yJJ2vl72yUzRZ8Sp0HTQ7DY3S9Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Vi1o2TyR; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47df6a5202bso3403523f8f.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115849; x=1784720649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvLfYd+pvOrvfxKIqJXK3E0FFOSlNO+LlwCAOW1ExY0=;
        b=Vi1o2TyRXB3P/F/zsiNIhDq9FHeLY6vHkvmCZTUINf1iBBFth3nDL8WGpQW4fcodyo
         2+miF+04CTFz6PbVzMoPYyzVLsma2Tw+e88tsve1w/2aI3b0eM4tfqj1qdAuNl2SoBNv
         g+FcJ3HClQuL5TBPlhmH16DUgMMzMTgXW1GjThnDpd5r7gkF2/tgJF+mxubGZ8MbcZ9a
         3TS4q66JAR0IGnnt9kZg8qNNR3hWlL3BvwbB0Or113/4Jo6H/CJnYr8z1D8JauFzJoVb
         blhXa0Xx4Au/m0sVFsnos+oVJt0VB5rb0ppvBa7Q60ZPgFsOKyMaeb8Vy7V5mwlKssbl
         Ofxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115849; x=1784720649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvLfYd+pvOrvfxKIqJXK3E0FFOSlNO+LlwCAOW1ExY0=;
        b=F7qUoKwmuMVXv2YQrFGvK3Mtj7XbF06xdPbBSV5SdL9JuwkBns9/cUu4iSR2ZF8Trk
         vg4ERUUiDWaFDanPKMqqnXQ/9RO3aQx4KgWBJZMC0qiQChKsBjcywlXC3zd1RDeuvU6l
         FXG0IwWlGJOmSbXLrolzEKjVXz25ux0dJ6rws2esWSfY1fqpbsy9uFRipTRSSiP8kOaN
         tHgQ2Zsx/93Xgr8Sn65pEQB5nup0iQ8qwNaIO2bqKIUrbyYNKooy4uRVrmVndPkLOwZZ
         02NRUbiB59I9kADWiOvUqYK7fKxP7TfPG7gJvdRLtE/6CUdwA0ZnjssiIe4ld0bidELK
         rebw==
X-Gm-Message-State: AOJu0YznOVnFc1NuF0dh7FpIkyB2mIpMpq/gdInwQK6u0jjxsX5DHidy
	GXL7gVVTfde0/+LmveT9GBG6BllZMHHenb6EomkVbWTXptoO8HmFRGIuYU98i3tpS4U=
X-Gm-Gg: AfdE7cndvlW+g/7PjRoXNaAc2ni7C5csDIpbAp5OpwTbu07HnDZw0ICR3bjpiq/m+42
	wGjmG5YxK3qdh5zAL44uNniR2nFl4+QKRdd71i+0MZesEK+tJ1z4oeM+BXV2Ye0t8HGRutJgRnW
	dORpCAB8T1bWGCWnj76vgKFGywNBKyJGgZxMjiUlK1O9t+2BtzwJPUR4ZhtO2ou6/+5xRyi180H
	CsLEJnXT4WJX1QAVYVIeNCV3b4E4CEVHrdUAThC5bpNezn4WAk40QZJ14CYIjeQxcWWmnvCC8Hh
	El3sCT2hq1ysJAVp4JLBJYkD2UcuQ0+SnuG0J2Cqrtx59jsz+P7AluT5+6/o/6VYJl3hiBJdU9U
	rEbRfMmxc52BvyxOBYobUwFOKLPSxiY+zAs1Luuqib0LAJBeRQO7znHkWBiz6IeAl1OTy2dIVgP
	SysEl/dr85PscoDvXjq+3q389P1pwhSrzE5sCkPH9SrGk6fgybTphPGVXHyQIcirHV
X-Received: by 2002:a05:6000:612:b0:478:9d9a:d4e1 with SMTP id ffacd0b85a97d-47f4fce484emr2623565f8f.30.1784115849048;
        Wed, 15 Jul 2026 04:44:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:08 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:14 +0100
Subject: [PATCH v4 01/21] media: imx355: Avoid calling imx355_power_off
 twice in error path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-1-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 stable@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
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
	TAGGED_FROM(0.00)[bounces-67650-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:stable@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B6C375DB20

If v4l2_async_register_subdev_sensor failed, then the sensor had
already been powered down by pm_runtime_idle, but the error path
then also explicitly called imx355_power_off as well. That left
an imbalance in the regulator and clock calls.

Call pm_runtime_idle only after v4l2_async_register_subdev_sensor
succeeds to avoid this.

Fixes: efa5fe19c0a9 ("media: imx355: Enable runtime PM before registering async sub-device")
Cc: stable@vger.kernel.org
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 27a5c212a527..ac59908f57aa 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1822,12 +1822,13 @@ static int imx355_probe(struct i2c_client *client)
 	 */
 	pm_runtime_set_active(imx355->dev);
 	pm_runtime_enable(imx355->dev);
-	pm_runtime_idle(imx355->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
 	if (ret < 0)
 		goto error_media_entity_runtime_pm;
 
+	pm_runtime_idle(imx355->dev);
+
 	return 0;
 
 error_media_entity_runtime_pm:

-- 
2.34.1


