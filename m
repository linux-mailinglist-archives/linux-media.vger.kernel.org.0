Return-Path: <linux-media+bounces-66891-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZllvMl0zTWoHwgEAu9opvQ
	(envelope-from <linux-media+bounces-66891-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:11:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF1271E283
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:11:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=n0bHEXPg;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66891-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66891-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29256302D4F7
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E474E47F2D5;
	Tue,  7 Jul 2026 17:06:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932F1453495
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443993; cv=none; b=oRHBLmd6lEijhQzSBMGriZZi9JZVI5lUqrPsWHc2EhDg78UeoLbfXAkgzZggbDpdcx/2tcm06Ephoo6QhUPRJRDYeFeArHWkifPtoAbsX8XjIcqK6TZTP3EtN0qy05BEgWGWxvoCeOWRz4SVMxYP3qa9JCyTks3RTj4f/8KizC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443993; c=relaxed/simple;
	bh=qP+DPJti1jKsgKlSfGLcOlJHTnyH75umCFOgSa6F+LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4cGAAs5bvZ3KB94XmUGIMJt4zdVFSa3qS4nAHYYFc5LlceC5gd4dENCzhDMhTaIIZ/I1U3F1QAGFk70Eg1vDUYP/g7cz5cS2EpWqYbZ9VjjHZnTv9Km2vkWVDElmAaNS124nmntkI4ZySomRDRyZLKDM6/txnzfgjS/ZfNwHIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=n0bHEXPg; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so41789005e9.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443989; x=1784048789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUXgmt+brDO+VXfPJ0GjEwdbcLx8ty7pJnYbPnr2SCs=;
        b=n0bHEXPgxIzA2HBeDMzkKsxBkGATdAHhjf3UfE8lJS6jam14mSbECJJGedy3YSCj2o
         w6hkrY2GUeS9IBfisrmSPcObhh8jLP/w9lqp25Pyc1AtllXVS618/Is1vRe7S4lrDFkN
         bYn862l6nKo8ndRirU5bc9DvbQEbNPTfVqIy84PlLwKXah484aQsbwkutJQ45WL8hdZI
         XCactM0nTw1BogRTajFIizeF9a14c/jZJ7t1+1dJ0x2TGaxSPklKOPR6pz9EyiPd4Grl
         OLTwDGO+HQ2GJhNlCefuWcYO9INGTIzgxBySQTZRpafO4BAGLccSkoiPuHvkqz8WxvpI
         QMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443989; x=1784048789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUXgmt+brDO+VXfPJ0GjEwdbcLx8ty7pJnYbPnr2SCs=;
        b=V4fbaeheIjTpafbAQPWpKUoo/1jHp7Q5tp67Di+pr6iKAF7gctx2ySepqqojJ3eUH4
         6T8Zghzw+PnTE2i/paAYdw3DK5fJ6QK9hgxtntbekzPiGT5oVIEFzpQwjOvb3TIcaOG0
         uOuRQCdxP7ynOPuIEZKrWQ0iJavefiAWvLD53fsciqEiE/HYjyPZ07z3vOdkahu5CJOC
         cOl8yzUGR3DBBzQGR7WjAXkn2ImQWG6rD230PZVFosKCAw8pGBVNT/YSyCfSCu6s2D5P
         0WpftLgxgvY3X8dxoHiZuM1EqrCM1i9f+HQsQkYiSY0U7efSPAci6l23hqjEx11LVnsv
         ucjg==
X-Gm-Message-State: AOJu0Yyi0JrDpLuDJ7snbsovWAhcTVWnooLrZLIrWOzOmv5H2ytezU+N
	THsfoRwp28veQqcREpe5P6CevuWkGaumGx4sDqrm8AzNGOrEyulF4ojnNOIc7UL7aRs=
X-Gm-Gg: AfdE7cm17lrtQfS4mvWJ1wGx0ZIiGUKG6mh7CVla1n45UZ9N01qs6UQ0N1o7Jpj8UZH
	ts01P0ijuI3oev6FQBvNc90JodsNUtQ54ZbcgfvDxf8h8PeSbxe3CGa8Ed5yY/rd9esJCSkcD3D
	luH6tRM0IVXipokpZT3XZ6OEpDvmjlfrlwdoxbuZ2mRq4z4aji7JSRoTgelX08XJF97tQQCtcqr
	QHaFLabYH6/drm17+R5fU6bEYZmBmk+clBG/WKQetB2iBFwJOQbPsH1biDQJ+FlV1Plp6zj6J6u
	BC0OxHpd45IW2TxW5DLskiNsasd2dKmgEYHC+EfHeZsR6IISrejpT3iP+6RVm99DoMS6g8ceMn7
	ojSjsRTcxkgfrd7mfhVB9sN+1JMjTUUyGe5h8/cWXVAIgitm91jXsyGWH4ggzDpohzVGL7D0CYL
	2nIEaANxbf0NS8H2zBbSKjmPmJ5IPx1fVHMOvde5NmIpaMW3xJaHmFGUEAMlOuOjLL
X-Received: by 2002:a05:600c:4747:b0:493:be3e:cc3 with SMTP id 5b1f17b1804b1-493df093146mr71079705e9.21.1783443988776;
        Tue, 07 Jul 2026 10:06:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:28 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:48 +0100
Subject: [PATCH v2 16/20] media: imx355: Use NULL ctrl_ops for HBLANK as it
 is a read-only control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-16-1683ec07b897@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66891-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAF1271E283

This avoids the set_ctrl handler being called under any
circumstances, as it will return an error for the unhandled
ctrl.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 0b95027983a7..cff87c6ea789 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1112,9 +1112,8 @@ static int imx355_init_controls(struct imx355 *imx355)
 					   1, vblank_def);
 
 	hblank = mode->llp - mode->width;
-	imx355->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
-					   V4L2_CID_HBLANK, hblank, hblank,
-					   1, hblank);
+	imx355->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
+					   hblank, hblank, 1, hblank);
 	if (imx355->hblank)
 		imx355->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 

-- 
2.34.1


