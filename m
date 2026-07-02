Return-Path: <linux-media+bounces-66392-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wYsHCsSQRmq0YgsAu9opvQ
	(envelope-from <linux-media+bounces-66392-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:24:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7844B6FA229
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:24:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iSmb6Z3q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66392-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66392-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A850030FF382
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 16:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083A8312815;
	Thu,  2 Jul 2026 16:10:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF4B13D8B1
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 16:10:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008645; cv=none; b=qvVGXmoGVtHyWd33298Knu2DsziYrOH4wwYCQcSCYwpAcwmctcHGo2n2oQ+w4hrT0QpAfxuVEmbZX2GZ4fXRrUfKNSzCh+4yddwvT/UbleSW3Ftrda2RuKYWcci+pjsn7zoDGOVGDNow/mubes2pUCKiVjhKHmdkDEJc2e+0bGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008645; c=relaxed/simple;
	bh=Pyw+L85LB94mAYcQwx5lHZB1Ha7l2wuWIhOhjVvXvSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pG0HD1+yyiAnHF5Q58EEv3EIAO9dWTKVUlHBZrLNHh1HQJ9t3QnWpvy12nN2GkBOVAO8exQYUQ8LEPNyWoRQEWW3tkjVkVVQyZPUa+6RIbj4uRRZLPPaRcCv2JlGPw39EAjiZ99vEY642GI1ChYdfFcA0KLfB1Fqg8hXsbN/7uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSmb6Z3q; arc=none smtp.client-ip=209.85.221.171
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bdc6c65e90so1062226e0c.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 09:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783008643; x=1783613443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wi28vtUxrZUhB2X9R/n1ITp9s3/b3dEqcWJTezP5uVU=;
        b=iSmb6Z3q/kYvDjmOmmXA2gy0u7Bh2YIFe5SRjI2NslGJLavbP22FBY2+JQN3wnWUzn
         iJ5NdHxHw471jG6/P4qtZqQuV7QI3x0xtKmodJPdn25i0kCtECwpLjWw3Gx1tLrYCyMU
         YS3vTKknRg+IzMwmuHdhMml9xF/SyqtTPDJb3I6X9K+aeRqCoC+6maZMuVZTGa2oJdfT
         zmpy7QnuAu6XQbO+xCnoEtpko18I8cz9k12bPCre7vPzA7sT7I8IsINviEUpNhS/gjkU
         Gfbe3X5CImt9Gl8YOzRQFkGhDd70mDHkP902BpgFm2zBDkzALoLs+LvX2tQjPusw8QUh
         KVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783008643; x=1783613443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wi28vtUxrZUhB2X9R/n1ITp9s3/b3dEqcWJTezP5uVU=;
        b=ifeUgsDK4B0bCk1vrIdl8m5wQQNQRjPhmgB7VHWFlec6VauINQiGrxHUcXvM6o8k2A
         GptQKW1EqDg/hY1A2hT5/nbsvFwipTjAnUdDy7KA/SO47LOXkemxhh3mQMHSegI1T/1J
         kME9Zu3THXUr2AmbXmUbemxBBOwHCKjgGPcyg4XnO63N87qVfQnqkkcwU7bVxfvNBvih
         7dkalr+nMVmhNgn8SLRxVuHXk/rTxlJHWAFE3A6P1fNJNYI5LaxDY3WfKfCY5ZhEQ+0t
         Kb3yHYaI1EqWOKbb90SzoKGsFvmVhV/rjL/UlKqgdNS9xZtQx4uE5lxRI/VT9ZuSu9tH
         trIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrau54i7dAse3xD4D7xAmGGUR+qqjMBzMGX27WYL39qK5Zwmw+A2qQyxNnFpmDdfI18QGKxKGjXd+o9SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT7xU86rB314L+AmfccBA+sWcQxmxCtFLYcXr2u4JT3nIUUhKk
	2SJ6BaRut+2L6O1eVZJUGj5sP/s/blEnqnOVcZXLwAufz9zcl7SXNVXR
X-Gm-Gg: AfdE7ckL2WnfbEyF8vgPnIzbEKkS3RlbMxR8BWzzJI6Ml/tDYGAXIMJivpEgDg1x8+y
	/acN9TuaucPDP+dkjc0PUBq8Lqam8hsqcjyOT6PJ2VLD4sScCjFhhmMqR2VQDCzKVDOsUpPUUWg
	/nDgVFpvrlg9h/wSGa95aWUJ38mZ82Rdu8P6TZkQPhsy6d/0uxo9kC1yi5Otet9WYihKvOWXcwD
	RjSVhHSatv4KspSMqDB+rmTuXGOkTGVeWhrXWwsBomRRGKEW6hcVwUfF0B5TzfTGcpwVgDodRLw
	Yd38dCC8aAYnxb8J1GgiUijTmtT3bMSgXBKo3n56MunEVxMHfmg7V7kPa/vWsteBuEkSVbmC1qL
	3pfDUZ9soXNuqgRXm/Dx1f+/EFM5ex1HJ6r7jHLpgDvNknG5eiRUbi3q+kEVc1a6VZ5DhomWyNg
	byLAc6ZzM6YYcONGm1
X-Received: by 2002:a05:6122:4589:b0:5bd:9c71:11e with SMTP id 71dfb90a1353d-5bde3a959f2mr2688554e0c.4.1783008643038;
        Thu, 02 Jul 2026 09:10:43 -0700 (PDT)
Received: from worklaptop.. ([47.204.189.236])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdec49cdb0sm1152242e0c.3.2026.07.02.09.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 09:10:41 -0700 (PDT)
From: Ryan Thomas Cragun <ryantcragun@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ryan Thomas Cragun <ryantcragun@gmail.com>
Subject: [PATCH] media: i2c: ov02c10: tolerate a sensor clock other than 19.2 MHz
Date: Thu,  2 Jul 2026 12:10:22 -0400
Message-ID: <20260702161022.5658-1-ryantcragun@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66392-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ryantcragun@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:hansg@kernel.org,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ryantcragun@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryantcragun@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7844B6FA229

The driver requires the sensor's external clock to be exactly 19.2 MHz
(OV02C10_MCLK) and aborts probe with -EINVAL otherwise. This leaves the
camera completely unusable on platforms that clock the sensor
differently.

For example, the Microsoft Surface Laptop 7 (Intel) drives the OV02C10
from a fixed 12 MHz clock (provided by an INT3472 "discrete" clock that
cannot be reprogrammed). The sensor's register/PLL tables assume 19.2
MHz, so at 12 MHz all timings scale by 12/19.2 (the nominal 30 fps mode
runs at ~18.75 fps), but the sensor is otherwise fully functional and
produces a correct image.

Rather than failing probe:

 - Attempt clk_set_rate(OV02C10_MCLK). On platforms whose sensor clock is
   programmable (e.g. a TPS68470 PMIC) this yields the expected 19.2 MHz
   and the native frame rate.
 - If the rate still differs (fixed clock), warn and continue instead of
   aborting, so the camera works.

Platforms that already provide 19.2 MHz are unaffected (no warning, no
rate change). The reduced frame rate on a lower clock can be restored by
shrinking the sensor's vertical blanking (VTS); that can be addressed
separately.

Signed-off-by: Ryan Thomas Cragun <ryantcragun@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index cf93d3603..01cbaedfc 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -892,10 +892,19 @@ static int ov02c10_probe(struct i2c_client *client)
 				     "failed to get imaging clock\n");
 
 	freq = clk_get_rate(ov02c10->img_clk);
+	if (freq != OV02C10_MCLK) {
+		/*
+		 * Some platforms provide the sensor clock via a programmable
+		 * PMIC. Ask for OV02C10_MCLK; if that is not possible (e.g. a
+		 * fixed 12 MHz clock on the Surface Laptop 7) proceed anyway.
+		 */
+		if (clk_set_rate(ov02c10->img_clk, OV02C10_MCLK) == 0)
+			freq = clk_get_rate(ov02c10->img_clk);
+	}
 	if (freq != OV02C10_MCLK)
-		return dev_err_probe(ov02c10->dev, -EINVAL,
-				     "external clock %lu is not supported",
-				     freq);
+		dev_warn(ov02c10->dev,
+			 "external clock %lu differs from expected %u; proceeding anyway\n",
+			 freq, OV02C10_MCLK);
 
 	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
 
-- 
2.43.0


