Return-Path: <linux-media+bounces-55257-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAgVIzGSsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55257-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:50:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEBA2587FF
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1B1330378C4
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE563F20F5;
	Tue, 10 Mar 2026 21:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="fT3yo6c6"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic302-21.consmr.mail.ir2.yahoo.com (sonic302-21.consmr.mail.ir2.yahoo.com [87.248.110.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2379D3F20E5
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179379; cv=none; b=p33ahRaDr7i6ewJJcooYdwg5LMj+KkFLXCD7CMgtOQAIh/2kcYHXa/5M0XeYff75GQw06+DRx05h7etgmMppFXEFaqK61s1wF2Q9H6J+8guQGiEwk1DiLzvWjvTsDipIeSXK0CJpcCybMiOaBlAfCAQVgIsJY1eqwGvPCW6yvDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179379; c=relaxed/simple;
	bh=1DzWBXV+5vLr1+lFWI2z0dwlPsLcjghaOa2oh9ikV2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HWPs6RIOnH/b43HqB4bFAmsdChXOFTRy6twj9Gpe6bAT8naBjpFzROfq//8/jjakg0SCxX79A24IeVaDnqp3oXfpHuCMpUf+zXj9kuImcDaPeQAdXjDD/EGKTT167vg72Pj7yJPlWDDOVMlkSAjMjCILiAB1YglL4GVB30cGbI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=fT3yo6c6; arc=none smtp.client-ip=87.248.110.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179376; bh=CcJpLln/UALF9Xv/bHXjoYQTA+Mm4SxzjCixW/swsKo=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=fT3yo6c6nW6mBUr8l6sn9h+Ppldkeut87VxEILByI2bKr2yHsfL1ra5veANlkdi2dPWXIQBe6kdSp7uiOyh/o6DE+wgCnjO28ng3YLGjnnAezLtUa9hjg1PR7HVPNgX/8OzRB1i6fRTWA5qlcmLgllOlb4xnj8/K4qpY/O9bO0vaKuuKcFlrA+K/vKT+w8a52Yr+8HnA8H129bvzIP/qX/JsG+ILmm1GHefDDCUFPqzlmsXKabvGaouvpOZxkGMOZZXd1deCWe/BHRGt0WG1uwbsTcWwZHgbZ2m3JMOqV2WgyMXPjg9CQWLDJS29b0qoe7SPv6ScciMQG20EYlFgyg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179376; bh=lt6T09KeSJg5l14iFTPYRbf3aBEd1CTZlBD2gHwYg6m=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=JOAoLcBO1hKSjI5s3h/wEcer1T7TeoR1idvbe1NjStACjZT0Qo2sQaHmNCDL9cBmCYfcCRbnHpeyrLV0pb8lkyRg3Xjrb4S4YSVisWanAqdDsRFkzVk1/++RXlovCbBXG61KEGTFHSJC+RrIGNKOxgmPG5Ef5dXx0pmFoCfJezsdAgsQpTP7Qi3adPwmPJbzA9f+GzKsL2MzAwRU9GiD81BlSjO40gGh7EbZ+9DUcu/8nloHo+boS4D1NRcchoJ5j+XUYQcHYhJqMQHYy4VczS+maGVAlp6FA57apopFIAdO+XcLVu2ow7/f/WYb2cRYRof52RTMqxBEYgvrdILyzg==
X-YMail-OSG: h4t5tEwVM1lIjU2J5gUiTAmr46HGBcAjQg937rDt62wznh0FAch1vitzQy6Hq7j
 s_neWOF6XZ5u2_8x15UBwlfEug.HjnGcqJpyt9N2SPS3Chlb90GwhThbXa_nH1vY3y4Xhwm7Wz3H
 dR7rj8g3Aj7uiQ6haLZyav9.UnNpTnAg_d4JWczrl.U3lNPz2qVfsnPc6aijspBXjgu3KAENXrmt
 0DrB8G3EXY8mO24rmfxBqirgebJJMKDRJQ1MVb.31LkXj6m2pXAmO5wd6dagrJbrqtUCxxxEsEW4
 1xKsDKd1t79e.R4yVHr6ftv6KKTyd2exdIWuL8_M7fDQs.7j0aP4MudFdTfEB1qVivpfDWLinDRf
 DV4CEkwNF07IyG6o3CwomZ9BEOXBEy8uHRQQhYdId3NdAiyJEGzF9q9e0ykumzHLHsGAm3euAmbb
 gsMET1EOcoCBKkewLPh3SbEEnVp1y3BAqf0omjbA13RbQT61QMxQl2dQbOFEhjeLmyNvinccoZ0K
 jxDPVOHkz2HJYgaKwtb.lqM7T2CZ3uhHMELwtsuptR8WL8cQAffoXVGT7iHe4W5Vu8Pu_cnVHQGp
 D6hEYe6kkyqjm1tWNispbhpWG7sZTFFW1FX_9d0vBLnV2TiXItwvYnhZAe3sfQHONyjt8PDPuGcl
 cklz3JC8_jqkOWb_R7C_wuzi44oEaTUv2uFe.qxmchUeLSbWtgHsEHjR9sa9MxaZiI4ors6TPBQ4
 lfcPAvUn38M_KuOSyRUQHOc5Pg1ZQDI967aj4QX_VrJC3xiYOiDzwmuLXkw5Cob4bgljxTK5Fiwj
 Jc4MBUPUcX41dxw76dDWdkaXd5BXoAO.59gulXZyu1kOsyGyS4Cvg94cmlBtE2omFrLcR4vAAAcv
 Ue86K0ePJKxVLNJWcYXo.ckvcTqHLEjODW3hJEk7Zy5KGjrrDltzVNUK8Tpiwkf8u171xNhduEXW
 ZULdyoLoqGAIIjXVT6pgd1B_e69PoT78jua2LwtnS6VpY1ZOwpvd6dxCtnRso3jRZo.wlbp3rwCD
 nTSuEItgPTUATXCJiAcTTORWa3fYdyergyqsUb3ikU.K7YK0jlXGUhHdob807Ee2P1_A9DfP9r6s
 cA35NRLZJWnZVW971bGkbrNsXJ7V8iQDDGbtiat6WW96b_IgKckt9mactc1hJQ3LKqZlRqW7V0Xl
 SxRs0KQ5cTTBdrPVRtpzYgw4tMSkshufpED1J7ZkaY95xvS85Pj_eObQl6s_t6MLRN8aOu_yrJBS
 70TT802WBjgVKLx0w5a1n2DizPFe.57BjQMVG35kYS05.zb.x3c.z819UwROlNnrZK9fotcylHwl
 NuK.dJLLmdolfG5P4f1oRDDYu00YaOmnXO__F3023U4iZucuwpRgXDQ2r.5zwE2PYqEx.OoLtQGB
 8x5BTXEIDaLwYJeTOCbmup7JznpuQs94_e9idsSJaSxg2yHhiM8VcGn8k8hfX8YJE.cyYItjyNWu
 hEOxp7XlKQVaYEPwaC2Gfe3oNP2Rfou.B0yM17Z.aP.XAmzUpYHSo1FOw9fbAwKLxwbPDHZ0hM6a
 0P0oCk6zBGFEQpCopYxDpFaN.4SdZMO6DBj7ERi1rcolnJ8X29PKnsqgYUAYMreVIB23iDh4Lfvh
 viarQdLsWhodZthZNG5kNg2WyFK8T0l4.l.AEIwTmP72pNXT5WFcGrtIs8oVR3oj81RQXE5NeQQi
 xQYgvaAKny3n5NxEkVeOmzH2bRowZNzUI8Rpiz1hPibLxGORuTfh4Iskoe8c29nbrxgftIw97ds2
 1TCRqxmJxC5XvnKDmlrnrg3rkUBgYtjTgXf06FrQzTl3uWDfAfU3fsob.nOo4IyovE.qYi69d0km
 IrPOxm0hJ2Lie_Ykgr._DPUo1PQij1e1P2qK68ff6UF_lka_sxmDegn_YlhjsX0vIRqRFecEuku0
 oOBxcfsGbTaT.rdl9bRb43R_QSjnvG8ECWsHHlDKxyJN5j4EsB.qN5paS6MTtNibqCOJ7X3J8vtU
 35UFJ49qp80vk2gmcuM1UNYzpC6eQSmnvFEHkRl6z1wX66VIUbqfvMh0gnXsn9z72HTouQzinzsI
 IIwrQbmIu4BEd2Xr1qHnB3C6VUVenLQczBfOPqR8SbgEe2SYebtCICJqgvVTcSOX8IvqwIcIQ33B
 laJ8PRS8rZ1HX.cmajfvIQWFJDx2TX3JcWBqcssbFQEnsNk5dJyoS0SsE6EB7c8PoYGYO539KE8Z
 Epff3GmgSOAzIXEzuYq0laY.iiIKHjNu7fiz8pEhRX6CPC4lRrHGtAGw4zFlomU_7dk6D01_50t1
 5ZgGVlfQ2bN.47VVpwqjkPos-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: c50d3d1c-e5f0-42eb-ae2a-a680a6df5068
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:49:36 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:24 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:20 +0100
Subject: [PATCH v3 09/28] media: staging: atomisp: Remove unnecessary
 return statement in mmu_public.h
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-9-3fdddab41271@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 8BEBA2587FF
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
	TAGGED_FROM(0.00)[bounces-55257-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Action: no action

Remove redundant 'return;' statement at the end of void function
mmu_reg_store(). Void functions do not need an explicit return
statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 1a435a348318..2fc137ef46da 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -63,7 +63,6 @@ static inline void mmu_reg_store(
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 /*! Read from a control register of MMU[ID]

-- 
2.53.0


