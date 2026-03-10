Return-Path: <linux-media+bounces-55246-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BowGemRsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55246-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:49:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE23B2587A5
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81E3031F8F30
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864C13F2103;
	Tue, 10 Mar 2026 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="jFGV4gCv"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic305-21.consmr.mail.ir2.yahoo.com (sonic305-21.consmr.mail.ir2.yahoo.com [77.238.177.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AE03F1674
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179278; cv=none; b=js71KJUopSIXGHssMw4L9e0mEcq7lrx/DY0ywZHhTO1cIwZcQJ+YEey04dHvqW6nMkX62ASaIB+tC5ic1bS2uw5wqs96qlkQpKQjSa/zy5Nt+J0s/98isrjWnNG0STZK01KdOthZfSOfg8JiXCdwAQhjyZhj+teMl+vBCBYXaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179278; c=relaxed/simple;
	bh=YYCRsaRwiL2K/Tso+CYX7zMuw3BozRy37V2Ng5nPtSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxlnmvqxPxC1thqynFzHa4uHOrh6tNVvEJLkkSLKm0l1vcEB68cpaZHfOVtMwI+BJtfu0JdXOroUA8hBDF0I3inlx93yOFXnUflZnFiX6GrKnUWIlLxWWjULAWEM/hXxexE4blIX0+0yuZFvKm3YF4VUB0+GMmL1iDQKJ+7+0Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=jFGV4gCv; arc=none smtp.client-ip=77.238.177.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179275; bh=WpXlPGXKWmqvtwttIuRoYAJYpn1ebnVCHTNkt5DD7RU=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=jFGV4gCvWWQNtjucFWsZ6fLEQDECkXyeJoo8a5iwDRRaIEWA3naLiWkn+8SXTebgpdDkcKanbhQa7EHFkHWBKDcvY8xHIZphwO10dp+CHWH6ZC8lYyK3htkKPKE8aPJwBCF6+FVCfG2NxNB4LTEsiGvw4dSIbzpNXjYCRJEa4pjM8apYMyqcW0dvX2QJdLb8OJqK10cLe9s9sYHo9e9FZhAPqbdCcAFxdME7oEwYtMQEkUoQtTTO8H45SUYDKY2kZeu6vzXP3UaO4YywXBg29Gf7OCkgLzzE9mSwKtUS+G9BiV0M4iohVbOaB83GTzOyYjrKuET9nPN/WltrESrWkw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179275; bh=IpwbbpGApi5eC7OCKWskgptUVr8RHEWLvWg2dUWCswY=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=BWgyigDwHdLcBGglw88tC/fS1WJH7teyfdn1Q7wogJ4YK9aUqYcStC5jYkREGeAq7Zq2ZThy2v1S81tzZjdZbp/1RC1xGOaCHfFfyS30ga8kBeegapa0izE4dmwQ3uys4e2eJcon2rUjPvRw8RmllaCPsH6BQAPMd0o4J3KuKroXBGU/nCf9h22JIMHGQ/n2ySgWRaIwSnYLRvzZEIzi0iTIX9Q8wGNhTdzuUmSSlHdSK7bjFpuR7lqZ1JfhemyiarbnotEFE+hz45b6rJbVftKRgAfEZmQw/EkNPkXsaeCM81uSB49x24Nmv8qEMy9t7UOoSkDE3ayGKrFPY5BH+g==
X-YMail-OSG: v2UCilwVM1keqvhbNZRv33GJNvK.R_IStSRB7sZzI.Hn2oHBe2bZa_Tm6qmKMH8
 DMBbBicRLbGm8FNA9XSBx9Pe_CSNALoG6XyCvjzk6Xz1s99UvdZpvPIoQIJuYSTrQLSaMqXJJCSb
 FAYLAdHMPk8RhDY6Hzzvvx0bcCcJoqyxpGSk3nuLulWag0QV5jlXncyBWwla2YEevY5lPHMy95DO
 jVex9uSPe7npiFhje2Vj4bbIftcBB44C2D.KSC1mSKou_t3f2skjU745rUdM0VKxcCEGAYQlVQXQ
 HxEC41mz23hK5vinXqqC0lbjmliG_de76clJ9sxEjrD1fgKjLJMyUUKy105XPoUoYvEDqHqww6KN
 DHwhLzFCTheXbYMsJUXZx1r3t8kCnGSWdFvkvTdu9m9AzP9NcxuMi7ziypqVss38li.pxZfGnvAp
 OSW.gJWgRhvqdj7kHqHaDMemuTPNepc59GRlphreTjKCComZWtlteW5YKYciKInrhdMp.pBdWTXA
 s8lNUD.6wI5gFl_rc5ygxAzk0iJGjGXylJiyC2xAbimbJ_71Zg87PmYgTHpL0_EdIi9aL0STT82M
 wt6Ay9ZmLpshAWKNDLyxgQXrO8d2i_4LhZHYGY1bciTaQn0yFYa7vWgkPlRm6XsHPAiiL7hatHJJ
 Gi3HQeA7KzcVF2NVqDl.twtroDVeZRg_wJEDszVbfWhHPop5tMXv0PdTWDJD8I3v9aVv6G2BEcYc
 cYfCudKnQEz.rCPcqN4N6TNisx0aBuRA8.618ZKTMPgo44ia9x8J9.Wo8QRrQjs6eDoK.Lgn7pS2
 ghfyZFMBUCAc.ajgh4Aq5_M0gLVouKJANk0we9pjrzxZZlgDLnbGSOgTv3OpomjfiidRlC0KZht5
 .VAytbSnadpg6kE8OIYh43QBjDgBAfxfCF_OYLUKM5A81rfzvsG.edriyhWn2WZWCPj1N5g3UtLg
 4Gav3nJZxfwTSUOHeUY5Nf9eociu3q5lOG16RDcGDN9VXMF9BgpNPISNt0tb5j7cLNi.5UFqiWcY
 JgecK5qo8qw1khjCNQP2Zhhg7r3TYng3WtpCyy6Yg44CUyToaq8z9UjfJRr3z56s3BjJHLEe4V7v
 DZ9N2cgadwmJecJHMjr7sNe1trOyGb0L.sD4GpR9UwRyOkWeuMZC9spOXHn.fSjNZHIUgaRtH6HX
 gIpd0J4ubIDQOyM89ilQfIQyd.F36D4xfQ6TxGX3wsXyaiTOAehEwyHewkvs_6WJ.3STH01z8fys
 vkxFMTfq0unztu3GRhjKIZzqGO3JUb3CqiNY0mjfcfo9H7_jlTMyxOwT3DYGY6GH5eVGF_5n3kjF
 VVQloPsA_gIiagVdDwoYekBaRpsTuvCKSJWmA6wQCkHh16S1sop9htj7Rpzc5Cmr9U_RYqPwrbIw
 vZmY20bTY5pUhs2uSv5V_0g6EWf1s0Dd0avf5NQbpM2.L3ZSOewDcZ7KYoFIYCSD27IWh.XvLdG9
 2JZd6LQAW6DoTyYYsatbimh5ajA38p3CiGlivHvb9jGeJrgFyBg9f4ahX48ATL8Q7NXQdzuBlUWu
 pHHiQ9d8wQYH2Z3G5TNLHq99PtjOgTv2_bdYTVjCWKj6xu8mkGH1KcD.ejqzCMq4ho..k0RNaYzB
 nSCZy1sfBcJpdaFDnWenZTrk5I2k2n3u.N.Za9HEuDB4dxVYn9eDIl4a5b4C50p95MSNT0V1_A7K
 Q.TcqTS9YgpkrQQQh.ZG1dZu1iwuMcCP8wdi6FwY79ltqJVCuJVT32yqkSoaegY2KC2vD96dahxa
 Mjj4c3tU_tG.t8PqVx0wPDicLzN59BsNi.2bHxFWkpTu0Ll4uGcpEtQyqX7up3Kb.OStq5fhkgRF
 zj7BLSauBizKERO5pC7ipF2EX4TCUN1Mn23m5zhyvvQyGibAMyn3zeOTpGAE2FythD0cqqjzx5lC
 kCv0qrrwRFRaPc8WYbUV06i_oDo8PeqLH5_gnI.dpS1bwBp52HxUht1vyvv8gDqoUzZh8dwkDgGb
 RGHOqWgMS.wIBKIJjAomTeHP_ycnyaXa_0Tr5cjnYR3_e_Z5gm41Cy04os9jAO4esAtetrtnKI8x
 NnnLi3gUpT3ZFPuL6z8ziPjWzLIxzNCvvoE9a_6oUAp2fqJnJyoAZFppRfqhDLYnVLu5DNWAyhMR
 uF9DBsUSndwNOi_F6SFLCQLVAjWuXP9PyvEYQZMpwUlDe01VXIteKxQSe.VkmJ7_KOVQycYP9z3Q
 _DhjGisZKMSvPu2KmnXUhFu63BGKEVTy3W_nncaTzNvizyf9Q96FWi69Vek5V_YSpWcs9eiAx_yp
 tCTvwlKdVyDIaz6Px0q0Uv6q3NoXZYVX4
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 7019b782-799f-4f8b-bea9-8f91b8c8208d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:47:55 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 70d8dee74b9581b201e5d1fc2936dba7;
          Tue, 10 Mar 2026 21:47:53 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:46:52 +0100
Subject: [PATCH v3 04/28] media: staging: atomisp: Remove unnecessary
 return statement in ifmtr.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-4-fd22e1a04cfa@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: BE23B2587A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55246-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Action: no action

Remove redundant 'return;' statement at the end of void function
ifmtr_set_if_blocking_mode(). Void functions do not need an explicit
return statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
index 50b0b31d734a..31dd3f99e28e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
@@ -472,7 +472,6 @@ static void ifmtr_set_if_blocking_mode(
 		}
 	}
 
-	return;
 }
 
 static int ifmtr_start_column(

-- 
2.53.0


