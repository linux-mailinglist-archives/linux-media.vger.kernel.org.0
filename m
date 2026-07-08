Return-Path: <linux-media+bounces-67020-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1k1gFZ9lTmqiLwIAu9opvQ
	(envelope-from <linux-media+bounces-67020-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:58:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CED727AE4
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:58:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=YkGmpBhN;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67020-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67020-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3957B30AD12D
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA57F4C957C;
	Wed,  8 Jul 2026 14:49:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F7444D020
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522171; cv=none; b=IjQXLfIPN7Q9PxYQgH9JkEry2ThgBVUYBylacPVbj3G/mT8fUTnHOlKSGS7oKj5ksDP+uSNDd9X80SHVyqBOOMcOVGev09ssuIc6obbR/mR9Le6tzEy1nlXLGmlm+qXqYgr10FPPU/FZrJnsvASU9KxqkeETtjek+EbIfljmtyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522171; c=relaxed/simple;
	bh=/BY0FHV2ekurjGQiSyljfjnh/9DiTeGY5gSJ9RVi5Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kCtJWhf7ORMZrwIthSW6ls0aVORdRW+cqlAJSK6axK7nl10dJRP0STgjmFdWZzIRxXTiejtx6EFmy0ZREJb8HYTl3GNAREi7k1MFOP1CBZcKIinFANgVkcXf8AXinuyqqbou+JIhO4cJN6KnQ49I9E6s2ZuSTGRffFI20hpv+w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YkGmpBhN; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so4069545e9.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522162; x=1784126962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoCc9OCGhP/RSTGfuXTy0/7DUKmkFEmhCqI4hwhY0I8=;
        b=YkGmpBhN6IJeythTPL5aH3mvCVX920WvMz+wAig3kDJO1SePBZsjgeo44saR6gWdPX
         zgBOVYUkBoPH03FjRx5hbTy+w7fAc8QtNSrtSYq2/HHVDnaByENOFUf3fEoEETdFV+a1
         d+5y53qZD0PZjBVkpvFO9YIQjIVWPb/x+RcvefjUsIkzURPytNr+aRbxV2Sxtbdb9f9R
         qkrWh7PjpGI3oXI4uNbChTlLHiOzjaMOZ4+eihwg67Rp+HRInn3BvsZLybKNYNstHmZk
         FINoY2fyJIJzp/5uta1RijvQ+aLkL1WCcUhKmSxzoXCgZK7DbTL2JyD7jDQgUdTuc38r
         R+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522162; x=1784126962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoCc9OCGhP/RSTGfuXTy0/7DUKmkFEmhCqI4hwhY0I8=;
        b=anmXPi7ezq80Jwf6B4G1HkaYPoVUCQoRxRiRjWsh4/rh/WPG6oIAiJ10mt06DeNNNi
         U7SoZ+0OFQwSnTv8VX+VpUwapiZZOpU6eWIIcvPkqNqR6Jb8nAPwv3kBAQyKSlIrp3nF
         3pmaHn2Cq4/d+0uqDxPMc1Hqc4SH8rIkuodLbDQ8TSdS0voUZ88hBaQQHUYifQrLH08b
         nvmIDBH9czs6hfgrl9i6qIR+jdQIgDhufZeL48ctYH/88UNZCBeoO/sA9ipkdjpFBrJw
         zdPggfSyMnJNdLDuGqzNYopq00+59hSEVM0fox9pLklqqlcavB7/KG07a6IbgqSadxub
         pwAA==
X-Gm-Message-State: AOJu0YwfixHyzMBnVQtcvIY0O4+ZtNvyA/o1bguB6CY+FaM9YFlfUUAE
	yiwsnqH/64FfPgXzWZaBJ8Cfz7hdsBx1JoiEFU5Y84tW2OhRkfV1NgZah+2pC3MUgcs=
X-Gm-Gg: AfdE7ckBBuYbFG4wV8AjdaxXwHcZUgZgvkJviLN4PhXzop0RxSng8SWqi7xyfOcZGMd
	mwnyYLc9bv8kUXelrlEzDCB2xBjmlBp+7d6MAHsfQ1X2UtJt+oBkwZWASLYCGRvDv/NaPmJVKNu
	d+7tz7ZoGlf3Mc7jGLVBuq1+Gw7Hl2oavllKi+sQ5mju4lyTuW9+EKkxcQ/YvP3Mve/shhK6Ie6
	R442DAPPE9FG3B4iWH2xET9XQNAsIAfd2i+sIXEKblOpC30/pOdIJwt7a9vH94+ZvVDl1aObI5u
	jRWvAxTvvrewQaiZ3o9c1tjjlz5+oyC9pDPdTsnLmEg7qXg3Un50khcFmbGQ99Dwt0UNMh4gyk0
	ofzNCgZpe3XbSCWox8hYaLK3SUa9QGDaWH1XfMBr7tG/fWwTtjBOse25EdHAKm9vYqU+mQT+t1Z
	OziMYd9RVDVbQcYiW+InAcKNIjvVVjOUzLMzPrisWz41m3IXPhefpCockqWGkodvCu
X-Received: by 2002:a05:600c:4594:b0:493:bc4a:d5f5 with SMTP id 5b1f17b1804b1-493e68809aamr27570285e9.39.1783522162156;
        Wed, 08 Jul 2026 07:49:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:21 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:52 +0100
Subject: [PATCH v3 16/20] media: imx355: Use NULL ctrl_ops for HBLANK as it
 is a read-only control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-16-9df386a623d7@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67020-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04CED727AE4

This avoids the set_ctrl handler being called under any
circumstances, as it will return an error for the unhandled
ctrl.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 3b86bd2e2e5e..6a779d700a4b 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1123,9 +1123,8 @@ static int imx355_init_controls(struct imx355 *imx355)
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


