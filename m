Return-Path: <linux-media+bounces-67024-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L02zKa1kTmpmLwIAu9opvQ
	(envelope-from <linux-media+bounces-67024-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:54:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43371727A31
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:54:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=g1aL2E3E;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67024-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67024-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55E03304E0B9
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B357B4CA261;
	Wed,  8 Jul 2026 14:49:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AC6481FA3
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522173; cv=none; b=GZiFbpKhqxrVQl5qc998si/7lG7/poZu6IITTTBr/jbussludvHrOKpo795X94oU7wHLWnntO9f/mVV965CaBjQcbhucx56wuXdEnBP5gpbAIz8fF50fgoIWIeC0fGUwFdjmIvh1CjHUVxIq6HMUN68jRZ1kWywR8IhWM8UXOqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522173; c=relaxed/simple;
	bh=N22ub8y8rxVNpO5t6NfeXqjef5cDmG+VxKvP1KyhEqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4j0t0wcFzhCqzhsSj2cDcwXdlB9sRPIn1jaufAtS6rjWotd9q8n1Q0/W7aNC6R05KNParyIQuo8VaRqUBrwmL6xVBI3UMmJJBffT4fEhB0KokckmoLplnC5/9tpHHJrXVVQ/Czt++sstNx9zIXSlRGdAa0b6y4gL4IPQl3LdHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=g1aL2E3E; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so4455065e9.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522161; x=1784126961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmxbOG7rbE41JtbgC/kLoXXgZ/dEvF+BjHVvArFg/gY=;
        b=g1aL2E3E2VCMl5EZl+mm56PtLoA7f5ff/rFSpvITWgTbMpeIOZzoqy7QS90kJMWkXC
         Bqh0G5s564Ie+o2YL8Wx/i7GIur6KTzQlw08PpjYXje10FSl/wTgj0wFbIGMl6D2TZ+i
         HS7k8qMuw53iAwOYJ4edKlHtqs8ZBjGSHnQfvsL9EJeZ+l5OdDL//zRmvcbv8VRwSp6I
         p8Uj9VFNRIz5YASBcfBo4a6BJZ+aBbWNb/sbNRM828Dvi3PyrZCuJEyzVxghNPj91/6C
         n388e7R0EfEOseltmN4yKXyGkbhIxQG0IPqiHZLyoCi7r2dXRJ2skXjo/Q1IJE/kLzOi
         lzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522161; x=1784126961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmxbOG7rbE41JtbgC/kLoXXgZ/dEvF+BjHVvArFg/gY=;
        b=VAq8OWxsn7iSOAyReXSDe/mm0BI/Ko15VOUeQX+dvZaRahf0x6i+VfpCy255pkM6sW
         0lMPKQlneM3q7/tgnXli2tTH0Mzx/ofdfh4Pjg+tbWEMyDBnGMHt4lIZ48wMockHU8NT
         woRFWRCXq0LlDivMAybc/u1gCG8jpsRBTWkLbJdNiI2xGWtg+UgAZd36bY02cA2VXUJf
         5BY1mJibop/uZ3mze8EN0vRm7KNc8RA6wLrfVzux6SXMEapFcjMb0OAeZkSfmp3OEQpk
         hWQy3VWZ4cAywDDHLTcJc+LZK1z7iyFZPNdONwpP0RBJmLra7kN5gDpBoCum4lvbx52o
         X0mg==
X-Gm-Message-State: AOJu0YxZiNq02kupZWFMjXUh7y/YdnE5ql2RC+3pogJqQZWrSEDbLXcO
	c1l9htXvQs1diyh/ZcFccy8NzT7KkQByi29PHMJRMuK8Jm7NqK1MksTbxKTFYlmv8V4=
X-Gm-Gg: AfdE7cmM0w5T4pxJPVljJ1MBZWW5dwEVxQCczLmd95IwTduG0l25RHNeWYyeJbHgIJa
	jd8G1WNgj0pgHDBPa5hWNeBSccPJzlw2XHARlQvdz++7WEewOU2Q02cP1wIGar+HxVtyhjzqaAu
	rxL6vPgSTYiDIOlcaABaAr7Xcuev4CX5n8St64kVCeg4DH/FWixiqduhCy9KSi7T+fGudS1d/QB
	kUo3l4OCs/1xiUA96RSF6XnjsploG3v6Em7S2ebUNnabX2mn5J1Zz0wPTsZX+McKd0if7XG0AqU
	A678QTszDeHdwS4fnalvyh1prulFjLE7QWRDDL7WCkBWXO0d3Ji1pHfccuV3yZCdtXq5gX7BSRs
	zk8dsL82J/ITs09K6B2Vdoa1quTsyG7/uLc1EIvLLpeRwL33zWoLxZNKNy7dB0kR2zJ63rCaUSK
	v/FGg8YFSrpQWmrva/DAentooqoKRzuNaXAbL8XyVrRwcifWxSBSwZwXBuvtu7rwzY
X-Received: by 2002:a05:600c:628b:b0:493:e947:b24a with SMTP id 5b1f17b1804b1-493e947b27fmr5523075e9.14.1783522161339;
        Wed, 08 Jul 2026 07:49:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:51 +0100
Subject: [PATCH v3 15/20] media: imx355: Define the exposure offset, and
 use that define
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-15-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67024-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43371727A31

The difference between frame length and max exposure time in
lines is 10. That had been used as a bare value in calculations.

Move it to a define, and use that define.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 2bf8da7469fe..3b86bd2e2e5e 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -51,6 +51,7 @@
 #define IMX355_EXPOSURE_MIN		1
 #define IMX355_EXPOSURE_STEP		1
 #define IMX355_EXPOSURE_DEFAULT		0x0282
+#define IMX355_EXPOSURE_OFFSET		10
 
 /* Analog gain control */
 #define IMX355_REG_ANALOG_GAIN		CCI_REG16(0x0204)
@@ -635,7 +636,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max = imx355->cur_mode->height + ctrl->val - 10;
+		max = imx355->cur_mode->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
 		__v4l2_ctrl_modify_range(imx355->exposure,
 					 imx355->exposure->minimum,
 					 max, imx355->exposure->step, max);
@@ -1129,7 +1130,7 @@ static int imx355_init_controls(struct imx355 *imx355)
 		imx355->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* fll >= exposure time + adjust parameter (default value is 10) */
-	exposure_max = mode->fll_def - 10;
+	exposure_max = mode->fll_def - IMX355_EXPOSURE_OFFSET;
 	imx355->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     IMX355_EXPOSURE_MIN, exposure_max,

-- 
2.34.1


