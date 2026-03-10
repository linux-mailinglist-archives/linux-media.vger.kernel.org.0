Return-Path: <linux-media+bounces-55272-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB0zAdCZsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55272-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:23:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF09258E00
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63D9B31A196A
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5902A3A380F;
	Tue, 10 Mar 2026 22:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="WBcVy9Wt"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic307-7.consmr.mail.ir2.yahoo.com (sonic307-7.consmr.mail.ir2.yahoo.com [87.248.110.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DBB391E58
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773181354; cv=none; b=tVqHS3+ckQyjUorr6L3iaf2BbdgjVa42oaadAOJXmcxPWlT9/tlHN5Was6lk2BBfrS5xmXf6f0uVE4ovR3xoK3Doz2Pu2N7YIt14w2ya1dryeTO8sRNTi2OOga6bLqsJZUshsw8QVbYZqJawudYf98PuAb1nQ9/7PRQJ/QdnQaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773181354; c=relaxed/simple;
	bh=uZD/UzAHq6/yCSzhoQAGpGw0t7XJm4al/sD5aeT4sdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xy8Ya9KDci2JAsZ/iippkDorgCWgTzxNlI6IJO5Wx10zBSyashjrcQ7O4riDmr2E2LGT9jPeKhWzG4Ltckk6R0SwcOY8beoeH3ks3HDphRge7dbapsWn3/SSs18JTvZEbtk68pZ795wyGvA7WSLm6hnHjARijPcC/M3zJal/FzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=WBcVy9Wt; arc=none smtp.client-ip=87.248.110.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773181351; bh=y7phk6+RNaKhWHuL08NBQGnZAtiW/SmdQ15PNHMkJ2Y=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=WBcVy9WtQqkqq6uzWJbfudDXfFEQ4MJYEYTJuC5r+UmiUQZAPkrxCMtNTENFJs1vQRRhrSl1wixwa/05SKDc/HVW0W7gERYeZnyV5MiBG2pb9YBlKGrXTsAebu6KApDPpAbsrKHKcGiC9sVo3Acc7xWt8SR84SwiLD/BGr6W5//vzTf2MrZY9+yDDsl35AwpwR5mAyXZCMlArPFD9oIevZn/4lFUuNOuv2vVwR5yOqZAyAFCVvFodCQLnDLnjZyMzYoKLLN+TqIRWIvmlMc4BJIfMuXzhZ31OGzEFvXI6b8CWWqNPbl+DiuMTm+ni6UN9oRMG6dpkht80wv4bnI90w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773181351; bh=VflHhjoOJ3UkJUk002zP1QheJW5GOgI5DGVjc3cMtjv=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=W4F31xNTWbn7NqO8gXFWR144tCiHWfcwJG9rRaLnJj+bMEP1xzocS3+oBXP+VkkuVuZ2nhRdC08FwiMay9TgYVVae2yRgzsMLJrQqkNBRBoOVJptZ/ldiTTgOTvGa2Dk2QHYKaZE8k798LS/Qb8QmE+t0cKdLGLRcFGNIw23sXx9ruozVQ0mk3wEMQdmvdYBvJsJ8hYsWD0DQI3KflbYot1BaiS0qKvdEryU0j4+TEhqPW56VcwoVQCJVgzwQbkaIjVaNuqhnfWPWPOuGtAhzhBlBCW/sRk9zsbVaEWvEFJ1ZHQJxRwH2zTG1gNtOtH7/ht9QRWWyvsP17+Or55bfw==
X-YMail-OSG: ahHoCagVM1mRvwruo_3y95AUlnH_L7az9o9oBuk3ZxzTeGaidyNZakJ8mDynL1E
 X5sT2BpKTJjKw50sc1wP_fjzsSWq8UIu25m31c2lsCycxkdsodWm9xGOfLDECO8SwUIc9ZGyej3x
 OgHF7BCUoLAp3wlZuq4ldW4IGXPSi2jBNex8mHZTj41.wRu5upUkMi5XtS2oTrVyqhecBfibOEbk
 rgSyWxjJbJ5bXDCLYgxANIw9NmVnTT10Mwn3jPUaxq1OWxaZQQ0d.d.Zm0D7uc2m2lYR3lAz6bEr
 z.6QTpoHkhPqT5Yd0osYIZOVwGf6UVFzl1UTNfbU89L8NF0.Gg3PrGgGJsv0vkBL7ifDAP8eF1HG
 ZkhwTgxeLu1ZFDIn8IWLreZY0RKx46e25W4atUsjGgEbBdKo0YPkLzURyUOdxJrtBHs1tce5iT1V
 asjtBAGzz0JONPHIox5oBPJ8VajAhRPNpjxHmguNEL7NvxyrlSvlRbqSxTfCX6o7Lj0j5NWDb0Bo
 7N0jfVza5q8AN_Oa81XE2rgFNODHLLrHiHzQ.I2ZpUhyC8d5yEj49FAUJN3to80zNGyCKXClM0W9
 ejiMlLgLevDgrvRnzlFdx17FLsJcpjwBpUS2I.GFsFVt_169ea.rRsP2_m.VdrgjGyV9HpAcoLwe
 qEbH2AIwZOaiWh4aPy6uH9gcbMTM63OiJ6F_zkzm7ucjC2RcW9ZOCG5ZSt9xBY7l7eoMzs0whtG0
 QrfqRqktRTVw3jppk3bTV_lIAwQLXsKmBR2QX4jJRNxf_EpLNo1OuJdWU5sH_qzbfyqOjzoyd_O1
 _A5BWgBzLSq8aVywfhk1QmWBqknbZXP33fbNsUm91fJmtH1k3Qa8a4GTBvFX0M92JEChgIRq8_3w
 2BFiQIjetv43rO4IYYYr9FHl_x1OtzH257_YDawZhUh2ytnqe.N65bjo2qxnkrp69xVBVmhMJQ7b
 EmJjNAXPCR9Al7Ipl8_hzd42dqz3efSusr5RJ3u4kIoe_Fc2aXivsWtNTklAaoZ7zDCcG1.oAFgS
 RJ.aTdWT4nxtX.YTc3BAjCG2iZbNXap3gdk7ZVAwIM8yK7CDUbtRsumy.dBrRKmXhKYEnhmQFrcC
 WYhuDo3sBJ1JFEy10Yhi6aH57hthjjmS_.Luwf14GbF7tC8m6g_c9UYpdFT1oSp_G.8yfn5m1ZgF
 y0_jI.HrnYwKlObCONFmGyPykQTbkhLw4O9rD7P.xGT1RfOxNzX4stGRnVo1vK8Sf3hEjqbch_Jc
 TPKeVdl1RxW1iI5Z2v09EL1BIcLCz2NMA7HCeERm7Hk7S5uhmK0y6s1MKW6UN_.SNcj1RM2mprZE
 hdQzeDCjQWgMFpd9wGjbjw7kQbvfDSlni8LjLtJs2ejD2zQe70FgxjQk4_tsswxkI13m6weFL0PY
 fXmY0SM3gQU8D6WBiNwXNAiR1EgNJF4oFqsVCH5XvW9mOWgojn6UPsOmiNMEiaG7sHlXFG2Ichn9
 NSSx30ziJuoNRp2BI3iQObYQvJ3gC.iTUwoZXe78Oe4WNjV4Y.MFNEMgrMH35iM1vMZgrBkPA_6d
 gb.LfMQD8lrCcZvFYjctPIels8xQgVXI4jjndVRFzM1A._PCBzhKTBRBPbSNfaKa2rxAydc3tUIJ
 L4NSVdw2i4YDkr4B_sqsRur.Xl29lEQ_H09iHBsj0PHP3sQvm.hVuJtuG81XvZMrmHkaVe58VcoI
 1_umMf5D42qPsit.VnqLX23A4Q05s9BB8U0L3XDzPA_yfxzqzT2C06sEJ2haQl7RfAR9DlJHyBt5
 Hzmoq6u1B1JdY_sQ78ojMyBcYYR2R1LjLSq9ihkswlLBP.a4hIg_DnjBgCUxH53JyjuLL9oYtqRU
 iecnpgFdivN3f8JZJjPN1SiUlx.na_op8LWsPiYr0oD4sAIhTo1ukm6DnZjR0zZoekgAHR_7sKiD
 8UahYYfpeZ3BkwYkBUqzAGNXV59A1HCjptM234F.JHukK1RkdQCSzj21dVsVhbk6.kZhvexZc9Bf
 7VGznYhQRiythmSxjYz3W_uV9yaRPoJbDXNwWhBlJ_ELpt7ZHe99iJD2wOYuydYBtT6otqODNdiW
 em3q1YHjn8yL0ePd9eVSzzdzRyrZnU3Rp4caQncnYtxghi9V_RclBqvTXDZDK8njZLOvD453awBW
 vsgph8gYwUlvYUc6ebKdHGkcVN8bWkZr3Uth7RLB3o5pjyx30xrAg230SmIbmFKXEcP3F6EQj9Wi
 fqpSE5Pj0goCE2POjfD7pjjUCNTosPzWMEP2rr_.cP8eCiclyzRubuIJR..ySxwkul8QFFlW4M5e
 ZL1MwX2RAsZjcloQcxEYO7tdjtYQ-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: b807a68e-a036-4fe9-bd19-6661f501dbaa
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 22:22:31 +0000
Received: by hermes--production-ir2-bbcfb4457-4sf65 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 48b5c4a15ee0780b19eed7b75aa629cc;
          Tue, 10 Mar 2026 22:12:23 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomasz Unger <tomasz.unger@yahoo.pl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 01/28] media: staging: atomisp: Remove unnecessary return statement in void function
Date: Tue, 10 Mar 2026 23:09:45 +0100
Message-ID: <20260310-atomisp-remove-void-return-v2b-v3-1-f2977db216cc@yahoo.pl>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9AF09258E00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[yahoo.pl,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-55272-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,checkpatch.pl:url]
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Remove redundant 'return;' at the end of void function
ia_css_dvs_statistics_get(). There are other similar occurrences
in the driver that will be addressed in follow-up patches.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index 9ccdb66de2df..3d2cb2d25fdb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -269,5 +269,4 @@ ia_css_dvs_statistics_get(enum dvs_statistics_type type,
 		ia_css_get_dvs2_statistics(host_stats->p_dvs2_statistics_host,
 					   isp_stats->p_dvs_statistics_isp);
 	}
-	return;
 }

-- 
2.53.0


