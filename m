Return-Path: <linux-media+bounces-55245-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNsgO5GRsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55245-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:48:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA280258778
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F235302B187
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E3F3F1662;
	Tue, 10 Mar 2026 21:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="hFKJriqI"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic302-21.consmr.mail.ir2.yahoo.com (sonic302-21.consmr.mail.ir2.yahoo.com [87.248.110.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B15B3F166C
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179277; cv=none; b=qk/TZZXX4U9Qh8uuo06dBpdSr98UmNNT1WQnB3sHFv51nLg0ezGu29Udz3SQVOmsrQ287S7nlbQgusrGeZfaLFmAvDVZBxrXOjLe8xlHO+xXNIrcCim7t7q0w0Nm07rNsiz4rsCd7KYhJJkDJysImjUfzTZI6XoCjodPNCwCHN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179277; c=relaxed/simple;
	bh=XyWA06T3kBzBTCVI4Dk8yjTCqzr5WhEB0SqMVvRSaEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ih6KbIg+twNbDw89t9VUmDjdC2JyXAikzy6NqBn/GGUze6JzexW9LgrF2VsLP7gxe7UYSnlBGZnQNjiKpsUX4VrcR1uP+dyFhKXDgazKVo+5vt1CQ1B83Yup9BS/sw5+zX28NL03wLZj1fImixKIsYvPV7o4wHlINZVTB1zrA7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=hFKJriqI; arc=none smtp.client-ip=87.248.110.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179274; bh=tkSIY6DaKpcZ+5HhblGa1osVp7c64xHZgsVK48nuR5E=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=hFKJriqIPXoeytmdp54uhofugR4b8K+NUmT27wpK8NI31SUTke2ZsNR92RTDNExHz22VCdebhuDYiTznen8SFQxyUgydDsbHj8akK+MsOPIf1gpUZRPgSPiHLApe+IPzl0LPC0nZv3JW3K0W9vbGHUQN3e2YxGV9wtuuZwTHWOm1dgbc46IgXOpaaLum29aSGTcMcDlKhGcZzddOhTVIX/gJ5GvPoE15SrZRictI/sD9QRZfn/wRZRJVRkNIinMlSQ8b9RxwywcZ7k1MSmYUCiNJSSfq0jT+Z5fCWdxTVPXDF4NbRzWpx5DahattbC3QdBf0517hu54WKRTWI4FPPg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179274; bh=ReySaMIXn8J8/Qa3P8cfHkSzhbtBfmYXxE5CMgsitHm=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Bpsj1qEGi19pIpC4iAxqniw4frzcUR1IDDW3451bCm94Xs86FLcv01J1EN8+XoV+TWRaP0RdS2TsH8jbmkrAtTZnbC+A+f3ad18n6Gk42SUOz+AOtnyRe1hhDAliTNJE1uLQQFnADns4r4KrrWiOM954T16alh1u550MlzFLwLjdl9B5wmgh1rP69qQ8dpAdZP1HZeY85fO3Pm7M6eXcWPcpQz0ID6vxtGphimT95K3ITxDH1MtjPnVy2uXjhVPqxuD9m0lI0hqPs9gCN3yKVZ79WTopK2fr7LOOEuJvnz9LphpdPie9S+MWuoOKSicPNYgw1nPjJUFLnp/Gf2LLqA==
X-YMail-OSG: C.z8W1EVM1lH5Ji6wx.f13wfuS2z7arlht8v7Fz3KLO6UuURdY4b_49NpaMzIR2
 rZbU5nmPdTXNGeOQzzloGD1JBmLbFuiB2HwrvGfOJFrND3QEJoIsXira_cCM5SwOIx9z1Yy9RvuH
 XbjU4nbm.wg_MOqjEHPuPb00lc7nQdeIYiu0xgrZ01F5V_JmeSQs4geDKe3TGhn5ZLwAQ6kIcQWr
 3_ysSenltRENQtH2f.0ZPBbkatpgs9sgQeL2aj7bOZVYL_0SPn_zXCJp4fIcleIVsLrENga.XEDS
 JeL9bmlzkcsQbnl8ORBZuWsFwUUGFNouoUUc279D5OASCgMjhA4FtSl4iZzY3kKrN1PvMSvNNHEp
 wOtIelRBJjYBCSsLGjWr7xuUD1nFnk4AnxsCQwIyTBXdpiItNSqpTDmWilH.mKfTnZV84HEMt3RC
 InN6gwXqp7pIyk8EpZj16uhneoR2E428VTxyslDwUN3uXaoXiL_DbU46SJSY.SasBMZ7yzLeKANG
 VaEGy4tGx421Jc4kqN8sh6FP2JDYS8NkLdV1kSh5NOmC43hFMNFXmXUnw1R.Ww3egD2Pm3xxFejb
 t0R983TCR44TgAA_io7D1eUzf9SupWiyJ2YY0XrHbiQY5zvX8zxs3sN.YTeQ5ieSfWdsLlNi9eOD
 z6YkPr1n0jp6hXQ3.gtWJ2YxwAVjEqDGr6IrjUlnAeuS6jhtjX2bSNsH.wtDZQMBArDoi.r5Kuzf
 2x5oMD5m7FSw2QYXUrkeU2Rd81vvO5nxf1rmjBvDyqqru5dPkJ1zMI7CY2io90x9FRTyrAT7_z0_
 0BTzC.QFGCPTXrXDpDP2_O4xb2TJA4SsPyQm6wDhKqmnebRMM97qPGyMnJTVXKDWTlagfuSobHDb
 6ubZeqyOfiOrcJYDK2zeKaou42w91fGUIdpbtH5MdhgaTJDhBjbA4bLzo2q8UHRdSdx7Dbd6LdyG
 EJfFlL6Ov27Me6scTnYmg___3IZ3emBFs9nuMOSZX65jr0H4W1dcziKmAroABzU9q9PI.20Bai_4
 VlMYyyP7o6y4z03J2iDp_c.qKnRuJUXW5vV67H8kIBuBoqE4s8P4aEMtU7cpQYRDhqJu5c7IESoN
 8_1EvS7Z8YkYhxUiiwaoLcrVjvOABOzKKat_z.LJSB1wOT.lJ4ih8Rzfl3cJZFlj3WxeSjyhspRo
 PUJlujzoHuWXnI4rnkjUl02df9JeGlMlbl7_sLeOKeA_5oB7D7z.2BO7l23L6fpB0z_J.XjNMWM8
 W.j8jQiqxyy3DPKbV0lSqoc_j7hCZDAd8jNQKEc4hn9gLYU8oLM.UOlhwtpQJS6iNxSyrdFBugSV
 GYcfZKqYtTsG0B9L4FsWXT1Tj_tZ4qdtacmhCZ0IXkqJFlPLaevWqtBP3B5z71rbCD65BQcWtRQT
 K_ikt.9crUDz4WdUo_nt.CuAuPeeQoLc32z6aAjBdedXa31WQxG8w6MM7gorByUbFh2V96HV6gi5
 ZL0a0xomjQk7zhH6CY_M7G0eVksyGRS7ivHho7qD3wfz4MCNIYiPJwgsXIwYOMBjHB1JVE4mEJLg
 5nLTKDZ_iBA7LUgl5OMlYuEhQoIBEBZSaknu2PPdPSrzYikHysxENQcE0RdHMEweY4h_gDlp0k0P
 vQFh4rZEnh1OswzU_ObAftDAj6PkL1kC4xt0lqWOSbh8ZscBPARsKxegMSJowS1KQPhXkEC__Ksc
 ElIFfQqsQt_dN1GpsDsg36ml8jbHrsdD2tVS5OTAMygrhVQhGAAsKGlLn0H.5jCwayHD02XPOCPz
 frJnipfuhMjrkspxtEJjOj2PUEj4CymuLNAPuIX0huGiE5aD9VCOyePfkpjo3Bo0BnhCpkBEQotR
 W4G9lSCi2I.HX8fti0bbgoVhJn2mGMcCoPGcjY0IGj4Sn1bH9fP7ek5OxjIjZZW.unamZFr7Huy7
 AdJK9uO0qrps2RvBdURrrpOH8bYjgFNyYbywsdASGrRMvyvCvuPEt.sre5.F3ZB9mrOqy_AKHvf.
 BcVg_pAlC.J4uofEVfF6c2efw1W.mEYP4m6qQ7BHxGfw8f_8No5WHVbkLpE3xW.XduTC4TMuUTYJ
 xLbq0D9IFlkWTXmtPoQ9SH_.0NOt5UmhjED0jTHqtSrr1dR8LRh9UaO.m.17jnXXwgTpToOzN5rh
 S4L66AP8uUsHLjw6ScCSPhCBmAu.1me3qU_0mkuN.Uf1dUZwhMUtrh5B_ouRgdvsI5V0pS85EZxq
 ivmO7e407Wl9qyE8XSpNRHB91AQ4cGEzxSfLQ8NhA5ofvrdNV7VWM0UbMaND2KcSePGJASEqmAxE
 k3RI6Zlw4LhBDt44HAg6e9QHlGdwtvem3
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 55a9a364-dc1f-4bb7-9c4f-f46f59650154
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:47:54 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 70d8dee74b9581b201e5d1fc2936dba7;
          Tue, 10 Mar 2026 21:47:52 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:46:51 +0100
Subject: [PATCH v3 03/28] media: staging: atomisp: Remove unnecessary
 return statement in bufq.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-3-fd22e1a04cfa@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: AA280258778
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55245-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Action: no action

Remove redundant 'return;' statement at the end of void function
map_buffer_type_to_queue_id(). Void functions do not need an explicit
return statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
index 0f0d16f4ce7c..51f7c9d6f378 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
@@ -176,7 +176,6 @@ static void map_buffer_type_to_queue_id(
 	}
 
 	assert(i != SH_CSS_MAX_NUM_QUEUES);
-	return;
 }
 
 static void unmap_buffer_type_to_queue_id(

-- 
2.53.0


