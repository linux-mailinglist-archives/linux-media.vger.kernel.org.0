Return-Path: <linux-media+bounces-55200-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDt/O+42sGkKhQIAu9opvQ
	(envelope-from <linux-media+bounces-55200-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:21:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CA0253378
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE3C331FEC1E
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C922FD1B3;
	Tue, 10 Mar 2026 14:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="e+rYNdJw"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic303-20.consmr.mail.ir2.yahoo.com (sonic303-20.consmr.mail.ir2.yahoo.com [77.238.178.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE9E242D97
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 14:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154090; cv=none; b=NgPp/gv6xUTzozZBk2PZzkKvSVlxKA67ZKmon0sI838HB3MMgAXPEvqX6I2UY0G6yZNgeRZWFdydw7f4Uxwq5iAJph8OCx9o2DpUdtiH7WB7zWZHDG172aGajTRxtL2qdR9ffwsJrzZkAGfpAU1ZePb8VesBWCcXr/oV8AVb7CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154090; c=relaxed/simple;
	bh=tnTelSF5Hz+M77Qvixm3LsOQrdz2NZ+cUGRq9e2LkSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=hnHjY1aRw8ZJc6N5/IMD+dOjoKPCrvNWb7TymtSVUPhoNjpaTQfN/nhruAQo8Wki50PKBmk/oksaPf6LIZEtAzONUUdmHX61HxC6EyAfExyla29rsd2yu6YfUfYN8Gvgs22YXFhS8PJMkLr46hvg91ENy8VlnuVWCc9/qK5x+4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=e+rYNdJw; arc=none smtp.client-ip=77.238.178.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773154087; bh=uQSUY86SxNAaCKY2iibBKvrX5LTEOQHxxmOCoPsW7So=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=e+rYNdJwBcAd2Rdsq704o0Q/G2yqg6QQu8oyBSK+E+i0y1bnhWHAvR3g6XWVmWmumoHUO5tVBD2YqSdGadg9kfdaQKpzpg/YJoSd81g8kJRLM47hF4OECsOXUlgbYPN9GVE3OuafqiMXkfZZMV7V4obs5HaKdbf0CLKRE35uKpChVSuzEb+aHVLN2VenZa4Fr3DrksPHNVIDeTyqKcmLS9JjpUQAzQtQXzKSGz1LhvXmr36NC0tLeKZ4t/IYHOVn5ASwmNH16VVATSF4NovfZIQM2xiifTm9v0ylRSMjfFT5kFHupaGnWvTscrM0L6tFOOuJR/PJ358vvg9U8b6Hew==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773154087; bh=rFpEw+6+WGPE7sOZcGgBxpaXcsi+HI7pYabzDPV1a3Z=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=kLHCFLxQ9aJeko2J9o7wMp20Esq9Fftua+TZ+6LwN5ZJcS8LDsw1g6hOR1Y+QK+H308wUclOyNCTW5+pj0QF7XDgS9oWO5GiNmYn4rhMsHBrNVCHG0wdCSGc6RU/UkExu2hlngiu68601O9ps0LoJL5x8qCa0KTnjzM2Y7DORbvmtKio7RBsdsEqCc7Yq6SVz0ijk74bBhVYSsdmiWioproRvBKwvdEktQZRTIVON65Jt1KaeQIkVR+gLXPS/tNUiQHI7WgbDoCxb3bn2sB9bOi2X7uS+jtsMY8RhN36v4gYxD2SzW78XgQoX2MmRmSsQZAmxUiWLHN9CuKGCI6qLQ==
X-YMail-OSG: PL7tpXMVM1kH5ei4bVKsWYPSTt_D7mdl8tYiv_HnWu4ypUpEL9Z0LMH9OW3m.MU
 W3R7pFE0WMrUomTrpqmhyt3oY5pTesOZp.gChKljuumLU5n.Vo2HyqrL8jRVzpLMRdHALIaNkXfR
 4_i1ONt.0NyZyv6x8ZJ8OJ7e83D2cvaZo5MH9SCt1Y4z90E7ikrJW5z0159bq7UYhWvDYiF_in5Y
 XR8SwHp0rvx2cPT6G51pWAcs0LSSpFD0X02yxTwMysY3.7PSTZWBtHLtOko_WXj3_NSr.UfFLLoI
 WFuKL4h3vVGj6UCXS2.1nL5qD0PxXeKjj7SSFFV.YDfAq.j_GSKbcEf1OSnatWL73h15Jdfw0mo4
 kJkr3i6AkiJ20ABD1GARIXiVPu84MnyOx7atzCcwfJGXvry.cea1t.5tIfZLLWcxBGu49DhAmLtW
 Vweb4nBAft_3ICp7YDSlKVmpPjWUjR1odw9aVrXys5BIcVh9N3qiyAKbGWDeacjZbAaNH_vnEYYa
 Ft52G3tiDE8WTHFCNF.ZZuXC.RpTdmmGKq3sZKixLGdKxzRQ9Ulep8i5gloks0nGfsctiCBVlTko
 ryrju64MiyEXAK.iGcxrmZlF6osqe0k4Z2PFCt0AjX6K0G0bh2mO8LA4X0Umgqn2cWntEDk.7vSw
 b_jOJsbjm5eY_wfINyj0pE4GWyT1s4P2pGbgmFSpy17X41ljrrzJmAQ4fQDEPFihzvJLECDBwnEL
 fuxUXzo0EO9SCZykU1fXetNDOaxRbMCA3eog.Tk.IGIjYY2OuX3j6wEDduWsSsy.gwCnV1YcEO7A
 j3S_Im.JzWN1rzbOHOUQInbSh8tjj7E0JCdEXyuq5xlrXATgyhKkJCf8TLbbPMayC2Wc_eMST_fS
 oaWGv5QIJEi..viIWvH.c7z0pMSagOj8Mgr37sWHKUJ5.zw._Ax7zsaoLnDR9tJkaGW4vnHU7e7b
 5_cFb60dHbTcVxE88hu8bwtY3N0V9tB1HYbQB4BJBGE4okCZRkmXz635mFJn_tWWlCpVypQeZX_S
 P4MZ4b6NZS_aOL5BMqYo1lW7Q3Cy.i7_XM96K9YaLoSmBqxRsPMkAnm8wFyto9_mW6UVQ5laXSHz
 tsPgIoBCQ0RCVoH7EFWJCRpNNye2RNaSYVHzTBK.iNoCIK55sB2339Z3UOI2a9_fFip6fpQdrmB4
 uR8Jy7tJsqNUT60AbCvJO6MYoCQmUYzyNWHfOJCtlQ6E1imuzTBMRWTSEEch9IKoAf1YLmYApIPA
 i4jVxz4IJClsB5ghw46K8s6GY3SavqkqrbJo8VyUtjQn8EhCzCuaK.lAKbzsUFaeEbbrX851TTIW
 xyp2gpAQKxRUnR.BQOR0aw8yKxvmGMIvvlmjtS3sak1ECnbdWOpP9stqj9Xm9k6nmTnV09959jgS
 ufdsSzuRkopZ70yAsixowNdclMQS3t6W7pQqTd8LTSwJp9QeEhrwx57HDrIN8Oz70YvGTJlMGzcR
 Se5LD35j8poJ1A3_npR3cYQuMhSvnPyoAGPN.xPoclSXyDwsNjNNRdI7r7xBAFHOdMcpNzFE.xJ_
 M7j1k1aPXX72SRwvXI8wFDOBGAoGcRZoiRQ.4TUQSvjzcujDaJVaqpZJxyblvPnFgw4gkAKXGcn5
 iQQujHyyu0XdqjcHwanIC4Z4S.KRKMxOKPQSU2wD_FP0YGnI8XHpMFJsUX9RFOdldFTlFy9zsN3D
 4f_e5gc0s92IUFkvcDeJFMLeFW5juVBhSVlJvIVE_6jhmujo4XK47DGpo3H2Wna3T6T0wLWYpZuU
 s8lzVx1ZaS0INgOb4JYLlbr6iAgWIOtGCf.E4gIpAanDOLjZSzvzemv59r4HKhW0IMXFoBMPE4Ef
 480CH3jKwdnHodB22T1sV0m0AM7u_gRDK7pJLW2aX6G8M9fCUCslBcmt9lvza.z7FaDWt8hnHats
 OZM4P6ohxV1GPIl0bXwUY2jdMb2ccUHtjDSiQ1Nr1iOf1RPiguXHKQK7KpqoKp1pF5g_ktOVTvNd
 GHE0V9G4wbgLK6GvPJauSwxw4Kct2R.g8mzQvOBh.KX.FLT7Q9XtHVcIvgUmLsYM2CwO0CPZeV9l
 EMSDlbWnKk2dTUiixHRvFkEPKHXDRdrpIOafJ3AbQbdyElVauXgGY65MUSz8T_PmOsKCOuU37J8i
 .EW623MTHDXuTCQO63CD6mKxx3zwlY7687AHjcJY_xuRXzFQY4hx1AMfDXBnytM4rXwzXt2Jqimg
 hlSH74boxUCCtyy549Wv0.Fk9HJWCrULFgqqDGgOIc3_cuc4A9ux2F2k759jNKxS9XGWNFYcoo2R
 jcxjBo4tsFA--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 49c486a6-e0e2-42db-b454-cf4647239d5b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 14:48:07 +0000
Received: by hermes--production-ir2-bbcfb4457-796l5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID e98ade4e868654dcf98b6069c9093805;
          Tue, 10 Mar 2026 14:27:47 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 15:27:44 +0100
Subject: [PATCH v2] media: staging: atomisp: Remove unnecessary return
 statement in void function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v2-1-b0e73f498e25@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7Zh2ACOuuIdhAWWUSYQhLTYSw
 t2tnMDdf3/x3gaBvXCAW7aB5yhBdEpApwzc0E5PRukTAxm6mNyU2C46SpjR86iRMar0aS9vP2G
 kDgvHlaWeyZKDJJk9P+RzBO5N4kHCon49etH+3r/V0aLFyhCXecGuK6712g6q5/kFzb7vX/eb4
 +jLAAAA
X-Change-ID: 20260305-atomisp-remove-void-return-v2b-4ce912de212c
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
References: <20260310-atomisp-remove-void-return-v2b-v2-1-b0e73f498e25.ref@yahoo.pl>
X-Rspamd-Queue-Id: 54CA0253378
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
	TAGGED_FROM(0.00)[bounces-55200-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Action: no action

Remove redundant 'return;' at the end of void function
ia_css_dvs_statistics_get(). Void functions do not need an explicit
return statement at the end. No other occurrences in this file.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2:
- Fixed subject prefix to 'media: staging: atomisp:' (reported by media CI robot)
- Rebased on media-committers/next
- Verified with checkpatch.pl --strict: 0 errors, 0 warnings
- Compiled successfully: make M=drivers/staging/media/atomisp/
- Module loaded successfully in QEMU with Linux 7.0-rc2
- Link to v1: https://lore.kernel.org/r/20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48@yahoo.pl
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
base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
change-id: 20260305-atomisp-remove-void-return-v2b-4ce912de212c

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>


