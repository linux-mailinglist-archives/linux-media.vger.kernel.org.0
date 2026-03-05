Return-Path: <linux-media+bounces-54574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LibMQs8qWkd3QAAu9opvQ
	(envelope-from <linux-media+bounces-54574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 09:17:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAE120D540
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 09:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 485EF3015B4A
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 08:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13321372B40;
	Thu,  5 Mar 2026 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="rnCTp5Kw"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic314-21.consmr.mail.ir2.yahoo.com (sonic314-21.consmr.mail.ir2.yahoo.com [77.238.177.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8CB372B2A
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 08:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698630; cv=none; b=pQYLWtyLy5mwNIzbNPl8kdCnsXVLB2Vj0zpqnMaPu+0wKKYIiaSdxfSHsg/Jyb5Z0Y37cxkfZ5qVTE8wAuXUmCQlzXH+e+rqRPD8UCKHL9qyXussgIwQTtsQPWFc/x0czNcOV/jUn1Is2YYRLiBzPjfEuaxFiLJZ2fwYz86Fny0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698630; c=relaxed/simple;
	bh=YCa/TJQBt96jMvpwMqcm7weSxOOkzA7Fy2jkcpLJVik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=NdJKb2Vxkzq1I2GyUdwM4a+2So/NU4oxGYXQGn7MdC1DIQrLstttB8SA52A99Yej2LSX5fvdsQopFrY/DRdNooHRW4lxAXm7224Icfh8uih0FSamYvn1A+kiCfnj3g81c3mMKiTreaWETlctgNCqvJDRcyEUeFNYaw6WI80fPQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=rnCTp5Kw; arc=none smtp.client-ip=77.238.177.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1772698626; bh=PdDOFFB2I5onOmV6EB3F5buviiEtkMpLIexbjAIWTkY=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=rnCTp5KwLddAXSwHzSNwDwdi/TEmxjuatYYvTQ/gJdrUjdL99M58AWrV7nBSEoPsAuqnjzmWdNfUwYpqcodXJ4+9wcLRxZhYP6MsYM4faxkL+6n2nVHcPUAVBTdpyK2/Og1WE2G8L4eggiW2HNeYGbGz5NsQUlh2K4KF3Ox7oMfCq04UppRYP3ASAANcWx4T6aFquTxE7ZgMjzkbv9sd/fLx+sqAa/guSVKqEvahBxms7MxdgBiSTYC90+wSngEHGUqp9RfppeV8y+Zg0WwUUOe20B++rQBSQ33+8GELAwg+dhj1mxmBFEfr/EG02ktNc8sIe2zB/rZtrt569UdYcw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772698626; bh=LopXSQqr7w0I/YYOcASI7lBBOsMUd3zxcenfdgTPK0Y=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=tzM86072G/OTb/DkrgrkWPm9R1YfDreg/2GXL8bMA2cVIgABqUrQ5V15EjuU3hUxikBUDdD+oItVpTCZ1lt4wgP9Jvzw0lScCP1KM6qPOO+4WKf71TR2WwxVsVTD+pcnzND18fI0EIskAvovXexHiar/aClqmlsRHEpb0u2LrM3o9QDAD26jE3ocqhSp2Xs9AvjB6A+1+qRg85ZW8qtuwQNG2WpiMjFjP1FxCc17SsQWaaNPnoZudqEjr4qfDVTmwophmAq0hQAhkBYSo8Y8ptMY803NVDXU4WAEihn4Bprb/a9klm50vHVB+6TZcy13aUEv2y69p32BneeJQ5LH/w==
X-YMail-OSG: Z6.kg5EVM1l6wk5tkHJcp7O1187KVlB_PhrAE3yCaxViTvZx4bJQH.DDpxLcHjE
 d_NrH3Hg17VtE.djbXNYwU4UmL2du0AtdcHG8V_MjwUuveuReDBXX2i8Hw4UsBsmhP.VZPwT9z6b
 X7bEKdlFt3sVZTS5v4PDGX7G8movw0X9S3k3nLnv3HKE8YY16yqktqhn3XqtwBEm23.MJeSC9OEI
 PN0dQYWg6yn57XfrRpCpQOJ5AAhp_azWvsloLBoPcAX6p0RY7C5Ge4cYzIdsszHy5r2MEanps_IC
 L1vTniBfqYMaKsn_Rr.abVj_HaSfCn9najk8mqSD01GIaigAwUaVGSP5x3CCQIAA0yycAGGQn2lZ
 k7Hy2woblnTbPltNULIjq7w8hOxWay4moZtBHQcGIjh0FIlhMhmmtVWAipGY5z7KoclChEzQJ3L0
 VxSyHSb7S9TIeGpF6IBw3TlJrK8AikzLX9lGGRwrItV.LVIQyMSLWqesvZtxOhYsIJOAwy2XeY5J
 rvbwpCJyiKDdG9oxNK9u7W9mYJHPtTvU2FikMMxxqmVyg8PMOZPy3.SSWHjMAg76_Wp6eVlrnTCY
 F322pfJaOG.pKSHDURqb416xAkAgpblQ4QvORQXFPSDf8MQjzOKKUYQ.FDeZhAJDgvvvsNjG30ac
 Ye7Md2vkChQRJTVhIdVtkMqMf7yYJd32PuzLk54OSF_htgfpcyfFpqFbeUE5n7zki_5ZIL_Wt5bZ
 P9EZeMOaTeD6bKtiqsg06VInIUPrhyXziwAFICmkppOtG1fyjqAleR6dAxMQa_GqXoVDPArHdaMV
 47MvydvuYF9TMFHD8AJo1qQw79caRXlECvAgflvqk3khEea59nJGWa8BQKvwk6H9sChYaw_WlbpJ
 sMvv0oVEbysu86dTRVkkUBZQzFAe9MQTVGfAXpQrj23.Z_K5xpP65ToIcKEIrsHahwlxxidlKocQ
 3l2WWgMDZbiWuZUNXwYn_B0qV7nHr0.Z_erYGmcr96CNmY0Ii95ADR0rwbDQLYTlrR5hCwFIXznM
 nffFBQYuQZj7VARrC9YwLjIJ04ZekL0W2MdENtdjQd4HegvQkSwcvUlvLqwqr6L9C29kwkfGIXGR
 O11_F5vmoUNlly__Q9hmDfH0R.1UGUXD5s_FOKZ_5DXvh5Ai5JmXs1BmRQ85YmBph1GoBCPGSSi2
 LcW4Jzzx.wPGKNU251Jew2086teOszxKXQtup_gcr8L_RCXVCiREGNdjsHeSqz2HHCCKa9pIeHFK
 2F.GcagPbuQhaqaenoyQ_qns8TRvrKFY0MeITzDyW.e5R9k53FQcEGwzdNBtxzPKfSZf.B4pRC8C
 cs7c8FezKQEfDv3fWzUz6ocHwDWPrTgHSHAhAv5NcQGI5W.hJWAzdIpBUY7BX1Tqa74tVMfuoy7V
 aQTkU7KYWjeFylMc_s3WlrRtGXP7bKK.hlmQMccH.iVRu36TKWzqWPZGS8QAmXBkFgbdp4YUMsfx
 vAlxo3SoWVTIIIKrb.xK5fdAjnFWc4yMcJBS7aRIRUtWu3zqiwq121LEQKUswBqn0UkMMyCYe7GY
 HnbY0U4FCZ.RjOS2PmZzhw1MgxblZeC0sB8y.u4.QYo8mgy3gYvwYQKvP1dXb1_Gt5eupkw_XHA8
 xF25_7I4K0vgy89rbIzwI2NkEVZmfmr2rjXdw4qGSL3ovEImp4ounGPqA9KDI9dpdOvXSUWjuiUg
 3UgIjQm41CGlPXCo8qHQKDcKAt1twUmfwisL1TNz7xurfUGR_6mOPvz8HKFI9139I3C5MkYek6IE
 dEll9XpdAzKbtCsxKn6AJq4WjdK0_FcGaSPb3BPOc6hepwHW_o9TUFAf6IuAzCqWZuFYcgIWDTHL
 .BK9r.7102xIjUEB0DpT_9lnr1OA8xL8ojxHHYVjzPyJsIvrh1sPb2cl5psePdkV2o9d_VvHU38P
 ILGt16wFvwLR0JKpLRSI5C3hTNf_LyqdcNtcUcuLguRMXBmPmUJx.hy_IVVYKMcUeCUCF0tz6ffF
 TqwmBAjCdNZCPctsbIj61q7w4Dhd6rW37Ou17rBYSNwcIK8SxXOfLrgirJVXhKHUkPfQbETNj3H1
 SVn_Fi9MYAH8PqVOkJ9Q5VDo0gDLhU1eA5GD1Ss4D8EwvMzr8Am077G3xjxcTVs8tMY4aDmVbBcX
 nfucyGYBieC76GDcoGaNyOLrvWetp6A1Fyvo.WGsdkE1w0UkzTBiKROiDLWQ7QCMy.Kxv.SyleXP
 sCcUOCWhPjnMzWIWzSliFShTVTT3_MyWyg_Zry.xRkYtzL2uQJyi5JIGAi275Y_GwWcGX7PVMhN5
 4t5rNM0usRNKziPxyGF1LWWs7lh4z
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: fa912505-ab7b-482a-9ee0-e1ab69e5c18b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ir2.yahoo.com with HTTP; Thu, 5 Mar 2026 08:17:06 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d2d86c5442443a9a53b79688de94805a;
          Thu, 05 Mar 2026 08:17:02 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 05 Mar 2026 09:16:41 +0100
Subject: [PATCH] staging: atomisp: Remove unnecessary return statement in
 void function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-atomisp-remove-void-return-v1-1-9f8672949f1b@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ5AMBBA0avIrE1SRIWriEW1g1loZUojEXfX2
 P23+Q9EEqYIQ/GAUOLIwWdUZQF2M34lZJcNtaq1alSL5gw7xwOF9pAIU2CX+7zEo9XOzY22XWV
 6yINDaOH7n4/T+36rHE1SbAAAAA==
X-Change-ID: 20260305-atomisp-remove-void-return-c6ddb36c71a9
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
References: <20260305-atomisp-remove-void-return-v1-1-9f8672949f1b.ref@yahoo.pl>
X-Rspamd-Queue-Id: 6FAE120D540
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-54574-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,checkpatch.pl:url]
X-Rspamd-Action: no action

Remove redundant 'return;' at the end of void function
ia_css_dvs_statistics_get(). Void functions do not need an explicit
return statement at the end. No other occurrences in this file.

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

---
base-commit: 6c2f9cfe611cf4ea666b8fa1153b3c4979ea4fa0
change-id: 20260305-atomisp-remove-void-return-c6ddb36c71a9

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>


