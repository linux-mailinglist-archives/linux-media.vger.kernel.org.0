Return-Path: <linux-media+bounces-55250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHQsNm6SsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:51:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F28F258816
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10B16324F3AF
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1310E3F32A0;
	Tue, 10 Mar 2026 21:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="CGCh6gKY"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic313-21.consmr.mail.ir2.yahoo.com (sonic313-21.consmr.mail.ir2.yahoo.com [77.238.179.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E173D3F23B5
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179283; cv=none; b=uC5D7e20QtoqiO3ZzBJc0GcYwwWmxKmH1hkbZdLbmUa85JBdcsfUP2sC186mAG6IPIZO6qWlYiNku+t7Zly/CvgyZ1bQhvg4Se/ACv+U/VLzPl1En2d++9Js426atFwMpmvJT/ry29BYqIATycbjpkDOBeQIrXquVSsrla4o7Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179283; c=relaxed/simple;
	bh=1DzWBXV+5vLr1+lFWI2z0dwlPsLcjghaOa2oh9ikV2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W06PyXr6j+Z2hT8gCfQWvAQAdlW3Ld5XQsrMVZWfZTgG0yAGJn5Wb41mv1z9BfGpMf8VoGmeTxhMx2g3klJ5bVfq0TN/1angAPE5uOPsJGS5cz2BiZ3sJp3Yjm9IJtJOVzoF9VLCtOdkhx5HgdkOmxRqHYclQegxFuRQPAzBBW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=CGCh6gKY; arc=none smtp.client-ip=77.238.179.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179279; bh=CcJpLln/UALF9Xv/bHXjoYQTA+Mm4SxzjCixW/swsKo=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=CGCh6gKYBD68y800Ty4fo3/PMnsxyDNpPGK2xqoDA9J4T/ihICjIpXyxBRKkZYAHE0TnaGipQ2K26OYewT30WuJ38zQ1wdbwBlJf3w5SzG5ekopnZO0NbXn9bY6t8pvtmf9BzGVbXBBFbR4LDseUjMNRrMDpwW39ShM42ggrdddJzQVXphL+Nufl45XW22cbgMTNnmROjivslghl8J4wZvR6P3Y8q5fYZsBYIOFGFOPmKPBj3d06nao6XgHb0da+e0Tk0Fn756vWFlKV+biw//ymMvGsbLhlCyDU7glO3zg1vyeSKsbW2Ry2JJaGpgKq3oaIJgQyV9eMYnxSA/WnGA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179279; bh=OQ9GatYCVChaPLNj44vrN2Bs9RJoVQHoUwd3nbku9Ln=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=c6coAaQNpWrtwozg5k4YqP+74lbQ5dHVcZFE8H7H+UWtObpZfO3k/wr4w5sCunlMNJNILCJL7X8V3KtYvoSC4vkEWeIp5/Z+YEk5UnJwoePiEXc8O4IrVJoYix9y0Fst5lODUDCl9keiq6X50ituAKomlRRLHLnmIcP+OdUJ1mL3O+JGKdiqQg4tnZbjiXPYxlcrm7eCjkSIdcdbUHFg5Uaed4gvwzHVbehR5X88u8sJ5rkjhewaPy67VFREG42iPSQOus++eACMPXISgyawF+O/wcyUenwumInVraH6+dBLeYGjLUHcNoJ0dEh5BHqGXMIJ6qOIR4VKoSeIUiXpLg==
X-YMail-OSG: 9R94NPoVM1n1Z3Ao84pMW0QSnDwQ54fXOlOhzwLCzkO8lw1pzP7.clDFLaYLGa8
 hI7s9t5L5hfThWH7hPIFRQFQgj8sH1LgYuoA823Rx0QfJZrdd8EHY2ZqR.JbwJQ5Wn94VciJz99n
 isfxT.F1Esjeu7oGg2zN2RHNnQvu9q8fTHVCre16PuH4kJwDHs3pLCL0F2jNDgZeHUBTEM5v8mJK
 o.SBW5n53eLKI015Q.gTpIFbZyta9P7be8A5d7uUiqr5oYI7cQWI20HCfbq3uEqR6ePmOkVs20pB
 oEc.Brbe8i4.qxzeoV6nmv2rdkxNL9ZInczoTVtqdy5oCzEiY42neoRz1olEiLnH9rUeHgGQxucv
 d03dzRYwEDk1B4Ge47mQXDT0kBvvI38bRENJFO7bGOGYqNMBxiEFo.YZmeBJVu7d0zCGH6cDHLpt
 PlnDATuZ1j.DxxbdUphIY6ad0LYWvwu1IUWHQKMLQvsnR4OyEmHpM.yvauoI6fiNQita7_QvHLuT
 KanJUAihQ8dfb3OPrlK2XUmn6XHyhyZjFb_CE7.j7kRY08tvr7lwl5zZeRZVhpZKKj2oXQj0TXbP
 GhUMsg.wNuB79ABpPwoIpcf82uHPqjIks5EekiSlfo7bUv44trRs4X0dzrlz8lyzhHyo3F9A3MQv
 L1.IiHHHA44iwR61JmpunYBNIIYW7ksy0Y1HyOWVwxN0HnxbXt6fI84CMo70Hf_ya1mU3a_mQVhg
 to.pklSLWr8zSQ7IsHZRK9BRZaS_4J1xWqqGNglTqBmBH7dhRbrYyQdg5MVk_vUOU9WeZ_xB2jMK
 9gV5PPDWA3_EZYD_wOQ7Zb93e2hE2f_qr9Pf8ZRcFgZi7lgkcBUCLsrXhm2jpkI_hIA8fOupCNYN
 VDAhgNORn1PULtYPK4zdLczH4ESydKdpKuEFs9.7Cg_uI26ZSIG78EZ7snojO8qStaF1RdMMdRMl
 Xm8VT9J4dLhJVNPFB1WtriSIwrzY6c9eUYqzHwUxW5dZ2IzceOwTDM5F6f98rBj3QhGzsgoTB8LI
 kwJ2teZJOcefaTvtRzGneBD6.2GgVxsb8eIGDUzN.YZOjIREzQRc9ctZTXHmGP_VcmZAAVRjPch6
 R0qdWVOHFSxQQqHIIgNefTNR0n3tqcJGrLosNQF_Phjluc7R9XRD9_k1lR4IuFPwLajVdOEKtaw6
 2sMwqTds87k0l5QR838vKeLf_CxZL99AeyXn0Qkx5DN2mxAW2aPcrAqAznksPsB.WNzSzypJXDn9
 pFpy6lHj3ydGFN5SPQL9Gl2xgBgN8xigJy2TTMCmia5GUXmImmCUZewrj5Fv_T3wm5KEURDn7xFJ
 CimcXRHz8umjmx5ozs.ELQXz_KJUOr9CYporF9D3U27ipnRpFqiYHPwKqLUp1ODITM_WFG62sw8e
 tyHXjYlDqkVtcBYyPAgkuVL10n13_3N_SQzFv2MUgq9tkwJUFgjhRgXrb6j5jBgGw8D9Mv6NL2Kr
 9j58a1ln4v9Unn_PzrTJANv3rc28_Jpsu6EjjpiQuhrUCrBxKB2P2ACNCt9A9altMDI2z7Ljwe_B
 juyHh62ImLs9lxiHQrYQZ0WrOCUpYHZ20XHWdZrnjJJGdtpo_O0FIiAp8nrrs7gjVug_JohFu_WU
 R.eEtuolh3e7cs7GQT_WKqwgwiXvNpayFS.q87sP7jQX0tFzoMl8hSxQmOyHOm9flkpq8clNmihY
 xApVieT29k.Uv564CxNYZeSuNpppmyZjDI6jaz6FFowEbVBfSvDeeyP1yhZaiHmnbBp166eY4U.y
 dWuH_MxxbjfVCnvR7UIKbUL4FaHGgNV0UedSGvndoICJ2jS4SeUsliplW_9MyOmD_qy1uyFFCuGN
 ImOAHt5X50IyuHw_L42.f_TbDH3e7CtkpUlFRanaXLP_2JoAIyhcD8RBp6gEXC.Prtm8tbBiiIeh
 FriG1FEqI34c9OxR3iqIdjlz0rzd5cIFSHQsk8piVn7_em96sNg.2GSm9WfTvYyUMWph3QNxL6fO
 aR0wm2rKvjLIrQffVV9KabtAryoZgdd7ps67idWSlTl9EmNhXVZ8phXN4lcXoUWmup6.ej1CdmtO
 KqYXSWXNCAipiOclkXjul4gfn1UXJCQtpN8O.s2Rh2DQRgPh5xbtn9ScybYvaSPoyBmzlu4Z.aMc
 9N9DS2ecv1ndZq68Q3ViZzFT7Xlx2T6vYLyi37iQBYaETSV3yfVEfLfwstjHEIqYgO93dcWBtIGK
 mL_278arvpT8krAAYz2qL0Rb9xntV6mQrQUmHKuNds22SzgEeVSHRSclkzHYzdI9nFfF99KSp2f2
 dQd1VJ.lIeaJ8oWKrlVE9xywtFSb01Dw0
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 7546db35-7e17-4220-b749-826f754b89f3
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:47:59 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 70d8dee74b9581b201e5d1fc2936dba7;
          Tue, 10 Mar 2026 21:47:58 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:46:57 +0100
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
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-9-fd22e1a04cfa@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 7F28F258816
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55250-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
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


