Return-Path: <linux-media+bounces-66407-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4nevDHuuRmoLbgsAu9opvQ
	(envelope-from <linux-media+bounces-66407-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:31:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 949746FC108
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:31:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ajhccwe9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66407-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66407-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB22230B8FA4
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 18:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F363A9870;
	Thu,  2 Jul 2026 18:29:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF1D3A6B82
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 18:29:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783016955; cv=none; b=Jz7wsuFNOFdIPkp2TdqbUzl6wOYcgCrWC3O3sU+co9uPZxbmEBxZqqSaAqhWpcHkQMFYnxLD3viXZ8p2oyMp+Y68rYtaQyT2RaMu6bFbOf+ynfTWVHDppT6dNvLx3vSoqG4j5lKrVQgAWPE0w4Wj17jnKXIjiwV0vs3wBGbU18w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783016955; c=relaxed/simple;
	bh=5e2sEyGr8ZQ8aTHEwreqsM6afows340ubUe6h8rafo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CxE12ALrSb4SUDhg1mxfVfayb0aWqp6qFKhRHBnFDhNU3JaC2ui4FTIrEIwB+hZdJQxYSCGhkofFkXWEDkrgeqijzypw03NhxzYiAliQiDfwxKGWEfyvnuR/kgarMUNmP3vIIWWvxcy9aimaO08oU05g92ux/yMqhD7atVbSb3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajhccwe9; arc=none smtp.client-ip=209.85.222.181
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9204711e831so171952285a.2
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 11:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783016953; x=1783621753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcsRcsJGmZMOhMWhiuKwk24L9Av5D/xJ8HUZ2uB1lXY=;
        b=ajhccwe9i+juMJmkMGNJDG1cV1K7bxKt9Xx55qURdvuZLZLQzHnQwNnHToefej8MYM
         9RO3PI0kNtQRFKQ1zGD7Ae9CJCqiDqPV8qTQzJvPJevkH6GfpdhzAVkp1YtL0ivC55Z5
         NeHXwrgpRDhcgIpE7rm/g/SbXQjNY+bvhpmgvdCiU5veXP5GitXdx1Gpyh/XFF+32Cuv
         4roxiQHuDbGFVG2lWyb7LVJxcwBEEXyVD2XlrUCnJmva8OT7RszOi0e6CpL492kx8mLq
         9UN/flXYqwraBq6ouV2RbJovqfSEEkryvTkbfvR5OSaqMkRHBF3XmcABS/0myppt585L
         3mUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783016953; x=1783621753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JcsRcsJGmZMOhMWhiuKwk24L9Av5D/xJ8HUZ2uB1lXY=;
        b=oyOw4LqxHssfGRInbiHcEDpnO1qLaQlG4ph3yBpQOIyS5zoG+bODbHgavD9zNEYA4Y
         e0rgkDBAtLscY8AZY9ovKPyfY0uF3xD6n3l1D2Q8/XNa2S8l6oXcnTaykOMwSOjTcSIq
         UjKi6IJawejWRzsOapkxuaTcuYdyF9R20Ym56sw6mTb8Y+KyAQ9t3CQD5yoeYO72G3UG
         bBzExCPxSIssF2arLH4RDpBtMoQtMCM3AiAQJbZW5Oi6FoFxut2Kr/if80o1Z1T6GR7g
         vK+/rFcpXC1XPeibQl6l1ird9V+T8yRAPe1KTLMVujYSGI3Wn3udrvhdxjL2mDaErZsE
         FR4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9FiUp2CiFhqs5hTbEByo7r5jdJgxa0SpvWbE6Etfl0TU0G7O4SOVadrSScFUvVmVcOH+0sXWeUQ4o8rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKbt0dpCi2HRr5mRFDGaQzOsX+jHJPOvAlt6s3+leooDNfHsPc
	I2eY+Zpiq/GBbckfSMhXYlB5AiPoMPpKOzkHrrKT+WZ4cHwZ/osPXBHT
X-Gm-Gg: AfdE7clwzqwmy5AemXTvQ7fFeY9jDpS2ZZKgC+pw573NZK+1LCfeZACcknKqP3bUb07
	WaNxcdaf6k1ry/LXysK0dxotcQ4NP1jBs116OGW1N7xsRI7vgXwkkYfK/SN3ch+XZd9HkycN5qX
	o7AawKDISnhTas6b0J4oTUhEhyqM95wDvCLKTVjpPHZ0HJa3wNfIJjKXE0wAitofchhxm3byeGK
	7Tnaaw4yEmbgiOOZdnAEl62pek+WlcHGx9UxZyvbab+KvxEckVEqbQ+K+bbrCh2jYf6VXZKrj/b
	G4rZTOtrZcuDd1rka8sxFN7A9igftB2C5xLJihctnLYuSOYIJ/rbeunatLucx/A/QxP7bqvDIXh
	AHptkLEyKKlL3lRNIcRPhNHFx1MfhlJiqAWJPUG5q74Ofl2nQ+hcYHh6F0gerh2IZn4vXLeQjeY
	cdZY9Ypg0hFxh31afVanbNQPFoGMBcdgS5X1ZLGQgfdg==
X-Received: by 2002:a05:620a:6888:b0:92e:6122:130c with SMTP id af79cd13be357-92e784cb8d5mr1004367385a.34.1783016952777;
        Thu, 02 Jul 2026 11:29:12 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e7ffdff5asm293326585a.3.2026.07.02.11.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:29:12 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: mchehab@kernel.org
Cc: kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Subject: [PATCH] media: ttusb-dec: detach frontend on registration failure
Date: Thu,  2 Jul 2026 14:29:06 -0400
Message-ID: <20260702182906.2613718-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <D1EE37E7-8CCB-4621-8105-0229FADF5855@gmail.com>
References: <D1EE37E7-8CCB-4621-8105-0229FADF5855@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66407-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shuangpeng.kernel@gmail.com,m:shuangpengkernel@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 949746FC108

ttusb_dec_probe() calls dvb_register_frontend() after attaching the
frontend. If dvb_register_frontend() fails after allocating
fe->frontend_priv, the DVB frontend core has initialized the frontend
refcount and drops only the registration reference before returning.

The remaining detach reference must still be released via
dvb_frontend_detach(). Calling the frontend driver release callback
directly frees the ttusbdecfe state, but bypasses the DVB frontend core
cleanup and leaks struct dvb_frontend_private.

Use dvb_frontend_detach() on frontend registration failure.

Fixes: a574359e2e71 ("media: dvb-core: Fix ignored return value in dvb_register_frontend()")
Closes: https://lore.kernel.org/all/D1EE37E7-8CCB-4621-8105-0229FADF5855@gmail.com/
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 825a3875989d..8566fb074092 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -1694,8 +1694,7 @@ static int ttusb_dec_probe(struct usb_interface *intf,
 	} else {
 		if (dvb_register_frontend(&dec->adapter, dec->fe)) {
 			printk("budget-ci: Frontend registration failed!\n");
-			if (dec->fe->ops.release)
-				dec->fe->ops.release(dec->fe);
+			dvb_frontend_detach(dec->fe);
 			dec->fe = NULL;
 		}
 	}
-- 
2.43.0


