Return-Path: <linux-media+bounces-67215-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jBjIFPUQUGpIswIAu9opvQ
	(envelope-from <linux-media+bounces-67215-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 23:21:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F3A735CCF
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 23:21:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GniOrNO1;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67215-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67215-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A118A30325B2
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 21:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DFE3BB106;
	Thu,  9 Jul 2026 21:19:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334213ACA7E
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 21:19:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631996; cv=none; b=s2IWJTtKmm/9cCmBa3tRuAl304Advl/IdTBbEk9zi08b5jFR0B1+YI+i61zn/f8w7FfjGA6Pq8QG2ZWK8XFaBatAzAAA2O2/ZUUdx4vWk1necfZt1GEexJLsrX78kCE0JDLfx+qu+Grgf3Rey0Ooim321F1LHD4pY6vvbaNOT94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631996; c=relaxed/simple;
	bh=WL+WDeAXpwr8okeKTft+eIkX8+ojuAEemyImlbC0QoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VnLIef7WCMlsCa9gDj5ActvZg86Jhsix7TsnAuzFI6uwj2nsyi1+dmOhljkSGFI9n5VjHwVpOSrRMH0bJfqP1WE/unK9gNF8tHo3NkYJDeEgZWIlHcQEutV6mzL1ZNixWlmC0uWy1wV+he3HwJmD4nxqRKRE7s0URsek+oCpyyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GniOrNO1; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-472326ca506so221732f8f.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 14:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783631993; x=1784236793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9l5tFqdlEDNXOWkGTaqYyD7269Qht5IyG+bgJE83dRo=;
        b=GniOrNO18FOgVRlKr7hcBfXFEgqdRDi7SCRatw44bcV0tn0kiHgsQIR7+ZqGnzU2Kx
         6ZMAf9Q5Q76bm6ICPy3Buk9SOglLOuU4rFTUDYjhTqlL1wjWvMcD0DPXn+qhmXmhV7ms
         IFSts783a2fvMiRLpxt9xXCgWxjWjtxaK5bV7gTaYCDXhn46yM0o4/X6jQtga9tEApgO
         wxo8v0ZHdCWPfXiOqLj/iKzEVwtL7bnAIFw3LvpLuKJGDGZgOkzbGQr7sazo+kW2sCB4
         XSTvTaXOQT4+mPZMhu+Y128Z3IEeK5wM1P/SKFCwxA3bejg5PWH4UI6m+u9bl0oCjD0K
         0EMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783631993; x=1784236793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l5tFqdlEDNXOWkGTaqYyD7269Qht5IyG+bgJE83dRo=;
        b=NkVSRtmi30rrP4DwMXw8hlRTe7/HxEN7T3ku94MVZ7zy/bxjjvU+DyywNgV67QswHy
         JqDgKaAV+kj7qhO0/FejmWiFrf59xo3lCgee6l5i5WTtQa0VdejluGGesDXFUxgWYjp5
         25uew6Xeu5kr+lZXtG5k3fKMtUerBHkbpPV7PoXLpzOtJl+Z53mzne1bcnRuE/dfG7Gp
         jy9kRsBsG0hEFUXEP3wUKHssmoLNW9n2kU0C0UeXw+raZ0YKYVc9wQkFKWOk+86GJf6U
         EQf0JWrrlRViXYFnsifJ+7hZ0CRkYSceyvSX4M388mwBzP1gy2fEleIIoHrguCtfJOAL
         +WQA==
X-Gm-Message-State: AOJu0Yyxg8OBCcGw0VPWKs3BoMdFnCdQcaG+3JA3smLiASK9Ojf6IB9c
	T3TykD7/Cp0fD3NydLWeVtbSla37WCVbanwnDR8rSc/GuZAyKUDh0fAbTpSaAgGae84=
X-Gm-Gg: AfdE7ckM48+c/z1Wak7qzPyfnDgs+4Yg1YJ8ZIiVN3alVV4uDMdIRtE+WqFj0wro7+X
	yKVco4grCalWIIvUq1HfH9J4akffqtn8SkzNacQcl+XBN7HPUnS4LLUvoH/6NN/42kcO2D9mxSB
	SMR71ab0rvGtBW1CGEgPZZrvBnVZiYsvpoeqZyrmgZrkJmEuN8M13rW/8Nlg0lYgRo48OhYVUeL
	LTjtM2gwZxSHeNIN5020t38pl/5sD95mNAWMUyhsd8MLAR2Dvd47kpuNAx44n84sM3ZpQQ+qb3M
	Ig2w+S+ixGqhA+PTSRXTNLsdMP0H8RPJ5qdt++vfGb5P/li7yotZMTPw6kjwqPEm+hYbV4SUkrm
	XtdTGgT2wGzlLrMNnGWT/Ll4B1qkvFtMpYw5Mj2n4v+YLdbzt70xpRVK7ShzV1duMPdq6mh8Gqd
	gTnq3ervXwj3FCePF6RLmIMNw=
X-Received: by 2002:a05:6000:455c:b0:47e:9f16:c0bf with SMTP id ffacd0b85a97d-47e9f16c121mr1050313f8f.30.1783631993384;
        Thu, 09 Jul 2026 14:19:53 -0700 (PDT)
Received: from do-customapps.home ([2a02:587:5fb8:1e00:aefc:2869:e952:16a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa09608d4sm55952458f8f.25.2026.07.09.14.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 14:19:53 -0700 (PDT)
From: Dimitris Kerasiotis <dkerasiotis@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dimitris Kerasiotis <dkerasiotis@gmail.com>
Subject: [PATCH] media: cx231xx: fix si2157 inversion for Hauppauge WinTV-HVR-935C
Date: Fri, 10 Jul 2026 00:19:17 +0300
Message-ID: <20260709211918.958471-1-dkerasiotis@gmail.com>
X-Mailer: git-send-email 2.47.3
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67215-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dkerasiotis@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:dkerasiotis@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dkerasiotis@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7F3A735CCF

On the Hauppauge WinTV-HVR-935C (USB ID 2040:b151) the si2157 tuner
is configured with inversion = true. On at least some hardware
revisions (tested: Hauppauge model 111519, rev G2I6) this is wrong:
tuner and demod probe successfully, firmware loads (si2157 patch
3.0.5, si2168 B 4.0.25), signal strength is reported correctly and
the Si2168 briefly reports FE_HAS_SIGNAL | FE_HAS_CARRIER, but it
never achieves lock on any DVB-T mux, on any frequency, regardless
of signal quality (tested down to -48 dBm, C/N 38 dB). The same
unit works under the vendor's Windows driver.

Setting inversion = false results in immediate lock (FE_HAS_LOCK,
postBER 0) and a successful scan of all eight DVB-T muxes receivable
in Attica, Greece. This matches the configuration already used for
the Evromedia Full Hybrid Full HD, which uses the same
cx231xx + si2168 + si2157 chip combination.

Tested on kernels 6.1 and 6.12 with identical results.

Signed-off-by: Dimitris Kerasiotis <dkerasiotis@gmail.com>
---
 drivers/media/usb/cx231xx/cx231xx-dvb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-dvb.c b/drivers/media/usb/cx231xx/cx231xx-dvb.c
index 472a4405a..a5486bcca 100644
--- a/drivers/media/usb/cx231xx/cx231xx-dvb.c
+++ b/drivers/media/usb/cx231xx/cx231xx-dvb.c
@@ -1014,7 +1014,7 @@ static int dvb_init(struct cx231xx *dev)
 		si2157_config.mdev = dev->media_dev;
 #endif
 		si2157_config.if_port = 1;
-		si2157_config.inversion = true;
+		si2157_config.inversion = false;
 
 		/* perform probe/init/attach */
 		client = dvb_module_probe("si2157", NULL, tuner_i2c,
-- 
2.47.3


