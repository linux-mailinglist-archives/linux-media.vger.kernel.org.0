Return-Path: <linux-media+bounces-55259-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMeYJ/uTsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55259-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:58:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB6E2588FA
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B37C030299F9
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101BD3F2100;
	Tue, 10 Mar 2026 21:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="GaHTeANk"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic311-31.consmr.mail.ir2.yahoo.com (sonic311-31.consmr.mail.ir2.yahoo.com [77.238.176.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23AE3EC2FA
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.176.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179887; cv=none; b=K1V/Bi65c0RL6kKm+raapH5lW1LUBidD1diYVUBfhUYzX3tGbECo6SKFydWepHSwl/W0zLI2Cuh3ZS1j9IjHHQVJg8iV/T19ltdd4TDF4pAQTo6t+CyGFx+UY/k7pZeEnLciUhQ/m4nFmUgudnVPKSAdqKlw8K60pyJJkT9MX+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179887; c=relaxed/simple;
	bh=JBcQNqXbiFhPwJCtic7fUUTLp7DIa5Ua5LjNKFKobKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qL++FyAhyQDvIEPKiN7PxbdS1Cx8Xz3LOZm1kcfm3Y108TdAJRN/vvtN86eMeh7/Kv2KKwLOg1ms/F31ZMdwdKRMvUJrAUYKWX7mCSX1erQnQ+gFeyJDQTxhwv6Bno3PrcVtYFsUnbFGnKT2DWHzgziUgdOSlmZ8eXHqng+nE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=GaHTeANk; arc=none smtp.client-ip=77.238.176.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179884; bh=aearU3IfMr8JowATbRtdU71meIMxzkiL51qBeIbhKxw=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=GaHTeANktesxBlhBXpI+OSbxxNCaRnNRf831LM4wESCQcUCUebJGEFUGJsRE9ADMO6bawHbKA2SvYby53qEmIdBowjIa7IRpnb+nRtFtpCrGyk2QX9HhDkDluVJO6ALN92On+qDDOBPB4+CrxnwakZmT9S4n2ZI/gV0kCHEepZx03FIOi3xHvC8f/gCT200aLwQ4W8XFBZ/yIitgR8QN45Susbl9ZI01yjDiWnthATWNkGFp52eyTVA24Mr6jX4ohvH8THaHMlvSdfP+SyNR1H6QeJgnhsxusT7yDKKxYgm0XFrAaVMQTv+8/X28/xTCtY/y7dLLgZ2eRANdx5h03Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179884; bh=q0lbXdqLji0+v4vSFog7eedf6ZA2jVcfP9J1OSAkjXC=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=KLS0neAG2xM5ulCQLKcE6rNO18CShuS1Cfor1jzgbnQV9Iw/UbrDpWixCGFW1VNgAgSv6v1nFsHH86YsyeujTV284yrePZ+wJxhdF9yTDIoVTyXuaReoY0S22K89CEHMojvGMRZvuMbZl9lmGo3GlkZKjwP0sC3yRTNDy+KrHFUjTkVPSxfqAEYO3WI+c/OHoDPKBZJvByNkQJx5w2GSzAJ5kwSejvOwPt+hm0Ma9nbYH7Svf9K61H9wiuBXQZhmhSvyXpDdE1IwXSvbCiSTBylJOcNd5sskdbeiTFD2qQ50k8cXHXVoDry5PyEuKFzFqpJq9eWQ70Uum1ZUQUR9eg==
X-YMail-OSG: zX3NQz4VM1npUm1B1PLS.fkqrtjFEqzh8xenhiwYQVcbX4DKwVnUljUkY8yiliT
 0m8r7YQI8VGu0.HLKS0eQBzlrc93MPpXA8eFub_oZYSZXJaClhJhlkE2NnzkuJSDG6CLmMRcefVQ
 6aK1Wgkpao7Qbb4MEC3S4ubUJ3ChSZ_IC9zBh5aGUfimQnBAOSBgGH9UBRJgi_7sAHf_BjS6lP2n
 TV9NNCXtvrHDHBaPOikZ_fwAtvP4PzvO7Rj6UZ4z81m1iOKn5qVd52JQmBTQRYjFDWQn3_o.riEQ
 rJCgLCw.pgQQPuzCTD.zDLZX0yqnQqCtHlL1PCeNqR.AD5_xjvFFgs_gUrhnTXZnK3N4TwoMHg9P
 ciDo0SXCu5veWaMr9NdaQAHTOlJ6SG5nbGOTHQccJIlRWTKyTpN_.SkB81UIM.lP3w6kof74rhE.
 IQn5dYh0J2TQXtV1LTLIA9zd6iNVM5AtU7lTT5wDrDT_GPR6cuPIB3ziRTQ_y93gw66jkA1q43bP
 dD4nv0DAbbEslIvdSMFGs9sjTKeFaj8mCuMIFDjszX3KpdLncA61kEGcQw3Sjowur9_TMYk7gWjF
 hK3Kp95D2pbPQd9FU_GGbgBHMNEtByIJPcK1rUTwMFm6oMYIA9kR_fL6EY89b5N.B0Fr89dXxI3T
 XYwHf3W2t3eLvuvx.QCIiIOALBT9Dy7SEi9_XO2lIrfjlOdgdUV067BfQIUZao4uF4SstHBfRSvU
 940GjGH9_0Tr8iTtGlPSvCuJOJD8uQXad1sBBs4VwR6VLYcLL39K1SUygZRga_MCp1fy_wCyA0MA
 VE8t99wuepqOMYDuZXMapoeL8_AUrFlu91Dea4KZID2QXX5PPC5NEM9lR558S0fw6DA44ylLMpbL
 Zlufml74THuAkJQNkuSyg2rMuMtQIm5EoPdfNuJfCC89rbmxsyN7m1l06FK5mnkkqWkO66SqaXmZ
 8lHuWQoTgQkrK3rLehtcOkgkIQVd.o_uAALsGULhHZuO5TtIgIxybXXT7ImuyFiscegLIzD_P2Ek
 rTcIbSCJjoCh2Z0X8egRDSFo8vOYu1JenxQECeUQAIDE51hj_knS1jYl.yMwjNncZahkD3uT5NNX
 Wt3Nhx4cj4.g.ltDXeqUJlwN22UqJWbwMQRcjXymu_CfwdXcovaI08ROg1Mg8Avk.TJneDVIKtYd
 cJFbuuvYyewk7wdv7U7lHUigdCZc9Q.phieEw7tCo4h7FSpsGmJnxfouySLFQN8kzv3d8_cBmzXu
 IPfCM9o_xxi7nwkrXbnwTKgLsfCFphSpdzvsf2sbxfgraRKs6bdbiL20ooUipY9J0LmP.xJfQajw
 zVClEdxLASTksK9HGm1zclaOXkhL_wSW2rgdoR0euEPZYXfFrqqIC7Q3REA6NqYRwiFmDIwpl8FT
 uFb4cC.BWtz.F5kL4GbAS40JPoYLQYP4Oo3d9Y.NkGC98mG.X8y9B0RdungW9y0AWZx4Ms8HqBii
 g_bgSXqKlCr1YGXNT.5bh.Hcrvy4bX5IXXG5D_9__5AdTiMbrip2_j6D12KhHBsJzdkuvi1PhRww
 c07rebp7nLE_Jj3zpkpc1asSQvbRL_Djhh7lxcq97EMQa1rdqqVEBTP4rZxeIZ51tjFRiSCiji3Y
 Kbaal59Ljtr2RIicpoDY6OMg5nCX3ps3JlDx1yR4jxGgg6kjhiEcxMJJbB7sLfCVII4xaubbIfVr
 SR0g.t8XpIRQi.igpvJiUv1rb7jBUcBIszVGH.onDbGSumqjCNtnCYMbDGbHtegSXLu.R2Cud3f1
 _dl0TtsMLwDxS9C_IITH_uxbvWyocajVGZyK_UVyG.lr1Sl7zJPzm0V_zKceDiWIwO7bxlXsJsUK
 9htSCfoOxw.rbiNr.EHSdMW5bt_1pbkeN.n17mgx...mMltByVeHG0IaZThZxFdvBH1vC__1OvjW
 6.08JDIjWjasvdSrUffT3JUP91CRHY7mHcBbRAohZDyIumuiMh8zID79j.YOUHoT5XFM657RrayU
 S9obNTXWPwM98FTXpnMiemne9XcebgG1_xs6c8bkxsRDESrq0XNecCeW_QSj2Pqp5WSXwBNPF8rM
 4eXUdPnz_vHyVgy2dUXFz3z8uhRcocXRSy2B4YBXIBQ47q2LEpCQEUuB2UcgnhHijcsBupK4hdXO
 Qmd7jUsK7Mr4bgLTPcogZbZ9yYNTVGsJD9scmodW5WOj4nK6XBFVrziiEcHBUGZf7gEIid55iqfV
 ph85zSB9JuU3dnXNJnAyvosPqeH6yi4oCrTageRshJu_hVDAZgJIrWG0ST2fo8uQxliitgX5GsY7
 4e_4vEm.Q8OPs4eu0Ebe8diOgXTY-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 7ca43f78-0a11-4848-8c93-b8f84e3edb92
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:58:04 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 70d8dee74b9581b201e5d1fc2936dba7;
          Tue, 10 Mar 2026 21:47:51 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:46:49 +0100
Subject: [PATCH v3 01/28] media: staging: atomisp: Remove unnecessary
 return statement in void function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-1-fd22e1a04cfa@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 9DB6E2588FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55259-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

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


