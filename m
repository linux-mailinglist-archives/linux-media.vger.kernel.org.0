Return-Path: <linux-media+bounces-55256-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OxlNBuSsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55256-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:50:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 702E42587E2
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B52130B50A0
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7013EB80B;
	Tue, 10 Mar 2026 21:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="JrRH5ID6"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic312-26.consmr.mail.ir2.yahoo.com (sonic312-26.consmr.mail.ir2.yahoo.com [77.238.178.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5738B3F1667
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179378; cv=none; b=pWCtffLttHAmEW7MKh66sJYg4Q0wucyTAyvDGM7ci0CrBIx6LD9q7LmGeqGS7AIZjkCgkfuP8QL7ne4B7H3nff1GkYNoGShLQkz3GgpXQi/Acaws3IcbSCjZVnjh80IwaLIx4jmC0x/5Pq8kilJ6p2IHlyewRep97+JTIHxtwJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179378; c=relaxed/simple;
	bh=QdUPztcm1AVultvSUbdpohux3NGtBlUJy7fDERjpKEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z6dvclxWoqx2t0vcN4kRDMGnv9CTl+nZMvtSh6NqN+ExXmlJ/M1CWJu/MQqKzIfAJrRLnR1xWRsD8f3/ILDQLarkS7nWH+2Ha2eUxBA8pZ+uvKecIlhB9jNNmm97taSmr53+TXnd0PRy1Mv412i6EcUPxbN+zx13rHkXXrvhg/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=JrRH5ID6; arc=none smtp.client-ip=77.238.178.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179372; bh=WP6wzhdb3fhAUqJ5vjXdBaTX6IFc0j1fA37NbkzYOE8=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=JrRH5ID63f279fMTWaIa3R83IpStRNPsNxZ8KIyP+UlCoNcmSHVYyD8wD7Bj8N/Tp1Z94qVNi8Fu3Y9D03KgPQmZz+qQ148+D1ejUD1MPFvMUzI+Nw6t717E6p6APfZBFlRE/XEECEJ9CAe6sVeyPUt3abzyHVE5cQavuTYSrFiNboyVkOzquK10s72yZUGdHFu8XO1YJr010sw1utG4QGq4a9n5eQYLMDzPtl5cvCx3093blYJ66Ixd9nLX0DLzi1sHcfgV7woFxXG3+OLsucr1VIQ+Lyq3D/Wei1AnG6yd0TGYDcKdd08K6R8iSO/axr8emU0zAPV6HEIw6xxNaw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179372; bh=Xdkiqhx2Btjtt57kWQXh/5QpsZqQAUAfHg3d6g/9zGt=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=g7O1murm7yAdXBMpTW+4H23VQRGtCvKHFXsa3GommU3wYX2Q/nuvyu4Nx5p3dhN53ITa94SfYfOGBDQ0pJxz7kvxF2Rc5wMZ958r9H9EejyuPXKP2/F4HCt6NRHQxa45vr5tFigH9ljNFmH+xmAIpaujsKJ1pU7yls8QqEtyUxlOncLu663qIL3HdH2amDdgSCXBorVtF5hTqL9Tp+T8JuBdRKu9VtvikXl/feNYJuiT5s31kM71TOTCVQpzHfZOR8E7EuSJLfIloM/Up78/0bjyfAZa/s8RN+5sBpR3kLX4t2GXP09SCpGhS28/vqLdzcq4YbB6dUa+da6tNCeStA==
X-YMail-OSG: cv9yZMkVM1nk.V5sxQMaXMIpg8TECDMhbZtrCFyZ_8J1m6Hya_1v2_xCzhWgViP
 VIt13NFrGcwU3ZN99OaeZH9NkLeuW.VzCG6ktNfgqBeq4s5yiSyuxAfVkidQ8JIvWJjDNj9HXx1s
 KMAIVNPJZWhgxxjMY1TNxfW10nQGtk_PmCjTieKwZf3KxjD8Ar7P6G8hFXuO5oqp3GhaH4IIN0Um
 pbKgahjz7dE4XFon1lJmWtfCPVxJBIvboBlox8H4lh9vYI5do9YvWV1M_dk8_CthmjChcdBqVVRi
 Z9oYeiFUEVkmRtj3i_NT6X16zt81Q6tIsk1C9gP0gFZskN_N3NPOH84dfhwAmBkKbJr6Kkjd9bGc
 NzTEctwQwMcPqrwa8sOE_oxF5gGmQTpQl2KPJ3EosG3zrEWaVWHRkp9tlhBfSHjjwwKg4F.sXo5A
 Di9V.TjHQ17ciTPH_k_SI.pjM3Var_Z0lCBS3ZgvuAQVSwkLxHDaGSH.Lr4rFi5SmRImU7R_7rc3
 WLrW5aO1z6zJl69VgT0z8IECt5VYkvglhMo4twlti6pAwgzkkrKDTsNu4f2y8MnNk4TRQ8.P15UY
 8F57rjxBRZrFsNxDIGUtHAm15wOCBRG16HQjHp8_7sFfex3DZKT4Pn6xghyavfjEyoKR0QRufgj0
 r_kro08fuYX2gMckkh.wydvfx5rjOq9n3VhW3ezCjVposdJmc6l6WREN1P.k71UftMB_MEm1bDFp
 ._A6Ns2pIqImp8lf5JuDv9qdFR2oNAaSrmvcN9H9y23fsZnjCbOf.AALzDax.ulVkanT71552B6M
 SbV5AuNLPIOx3GcGfebPs8.0OtMm5DyHLfQm1IirKKl0aTlb5gr3I_Vghneheajdwk6lhmT7eNcl
 E83kl6kqs0Zs_Kg3Y2XKSukkiOCMasdPL1ApX2rxH3ApDQQaVqCsR59cHsQNPpK8ckNpM.Na.rVi
 7H0N2ljFcK8BDdbll5Qe_RFOFxdXZwjJerPkFGuiSI4VO3BQF4XDZfCkadsFLyr6YL9rrpodkujF
 doSh2gjQXn8Z5l_PfE5Ep8MdOK4y3IS7Zo960Ot.FMTGo6HgYp25ixez9BRJwhhLcA7JTgTysutv
 __qL.Q3QKh0ai4ROCdo13F83BWctzspua_IecuIKN40_1OTk2w.gl_rbzGZF_bZrqihE4WZ6jCPl
 xozrfVCipqwODvII12GKwIWCbk.Mq6eQXc67a3d.TOPNPr0D57mNBJS2QmHZQcUeI847THjYdA1E
 9D2xByIQt5MYyx_2cY7HNh5xJCxJJuUJ6_UlW00iOwEq_Se6LrpWuNnIgCX90KGso729eMZH8l66
 FWjmbMSSO9tao0r8mx_QAPH6wuE8uGRd9URxAKLX1Wt7bQ7WD6TJQSzQmUW.iownG_AVx5bQXPtr
 TGhZViokRbcT4vy4qTSYfIdnuvjd0qbXD.eKX8bdRxXPqcb9cx6klliokK7RHtEPoZ8NO7JKbYnm
 XCe5srFJ7Z_PMeKn80RzoxQWbQzEFZ2J4Zgie9WyM1wNaXjNXsRE_qfO6a46_KfXGBR1OiZURJWp
 dNiZZTxTOFWFTnVMwLe0Rik3DTbDzgXjWK_z1k1d2lYRIjShmQJ_zswA3uzmAR6HS2JNCsKUl1xF
 qcw1t68cTzdNfEaYR8sfwvnmTqF72aviLOqx1K1.6n6YKB77I5SO9q6IqZtur7cILRKYeKI50.o6
 JyGwanJ1cc5EKi.EMq_2t4UlkUvSXL1v0QFALJWE4WoLiB0tq0AzQPUjlw_RgKkGmfZ6R75mWmn6
 041tP7HxuUPkctgx1oytEO4ca4iGvdZ64dqHAsBmHAPDlIxyseUx34DeLDlE9lyTGyGHyTnx3NuT
 kHH17BBbBKq.Pbf.UpFqHbgSpPQ7XrmvBNQ9xKooJVpDBftCd4bjt3nOmGch8UoNiB5GMnGuuhKY
 OOLA4ZykP2onn68rC4FGEYu_repKuYeYTgF57s15t2ymQvze674cp09LsGY1OO6i6sznSLCUWYfW
 XXUDcHIzzyqxK6IcVT2WxsIRQjp_WPetSKOm6di3mJ6Oi3h8QTRva8vKxFtd7.DNk5ETmjoaSdHk
 55..NBzfrB.6aDaMEUYjEWt8VmH.zWV2cDBgt_wJDbqO9f3jx6.W31oPdY.N21cRBGSkvluHhIdh
 cToJP3NolEWmsykzhSYXcy2mNzSOEieCtabfoBz0bO8cuSHxeE.xWJAuRjlwOvz3dUqwo0IJhLT3
 cMWOwtn58xHiSXuWBym4zJl8_hVARvSIChKgFuDLGm3TcjxtBotSVXbIGlZwA3qElTRKTLu03hFx
 oBag7hbvATzPMtJwejYVOTAM-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: b8d9d8e9-fee0-40b0-af29-4c1698e589dd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:49:32 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:22 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:18 +0100
Subject: [PATCH v3 07/28] media: staging: atomisp: Remove unnecessary
 return statement in binary.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-7-3fdddab41271@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 702E42587E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55256-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Action: no action

Remove redundant 'return;' statement at the end of void function
ia_css_binary_dvs_stat_grid_info(). Void functions do not need an
explicit return statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..c3645fc074e4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -344,7 +344,6 @@ ia_css_binary_dvs_stat_grid_info(
 {
 	(void)pipe;
 	sh_css_binary_common_grid_info(binary, info);
-	return;
 }
 
 int

-- 
2.53.0


