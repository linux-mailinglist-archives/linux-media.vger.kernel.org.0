Return-Path: <linux-media+bounces-61315-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KDlKlBtA2rF5gEAu9opvQ
	(envelope-from <linux-media+bounces-61315-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 20:11:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B008526FBC
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 20:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 78149304ABF5
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A446E343D9D;
	Tue, 12 May 2026 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="kco47R04"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic303-21.consmr.mail.ir2.yahoo.com (sonic303-21.consmr.mail.ir2.yahoo.com [77.238.178.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691DC34405B
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 18:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778609467; cv=none; b=Kaxz0byrd7aUrdZTq84J8lXA/fDIN2HNsSAfUe9Jl6J8ESaFjgVUlFgS63fdU9TRIv8uP3FTJejoxp1DtdJpvi1yzzA1KwKxLVefriPJjVWb30oLX0cgZtld9AiyUNPu+cUMRCjPpZETora5QG5LFOXFQhAcpEtMvrJrAMHI3UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778609467; c=relaxed/simple;
	bh=pD5IAKMU+hJyvf0JBKSq+ZFpY5WM5alilEE2IiSusvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=cHtNvdWewo+PvOj/jOh3xtZVRk/W4JIun9jcLgpVZ93NbALyhxYG3FQD9oTjAzNQddsDWVPBmpQOvv6TEL30mDGiLvDHGaFKS07U3btsMrMtVEjeXzsPTltM4ZzetmQfOpupXx/c/Q5+mdPVqOxQz09NcA3aclGEtoKwvU77ZCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=kco47R04; arc=none smtp.client-ip=77.238.178.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1778609458; bh=LCwupOXoEPpLG0CcTG9Y5aJElHYENlyeve1j30MPv34=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=kco47R04ZCrzNRui4u+S22kv5O3slZU8BxsMQtORLc/1207hTLQqB5C2ing5BNk8HcSJS5TTv25J8u4M9UVEoUosV47nfseeIzEmOiXqXHqh/h7d7zCvxsYtDHT1DmfzkNb/Aph4U2J3PUbzISvCc0X+E01CgClBjswJqVwaE56cJI7TFaOvuTtoCY9MpeSljgFIrgb9RWpUa2dSCz3El9M9C1RXbVsFvAART7xSmCAcXG+GQxOdeU6QOZ3QNgKaObqtHLMGHy9g3ngcMv/Sa3SFDYj7FlJANmwCpdbZUf7T25FvuuJgEODmYqyc6zQiT0Ez8y3upxv7F2JphFD0IA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1778609458; bh=w6j72E81zLWV92WujKY5DXG3euPfNF6p1X6uJQm6Gm4=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=oNshfe95BpXbS6USt4m8dsYic0f7bI91m4DwmM80IirzpLUcQivsUdWAcljenvd11ZJcEyqXAtirOD0DB1yZunY1DAUg97uqeGocVlTaHoasH4RueAj1Y7n66oNWhRUg15zzR3TGrGICgOzhN5oVW+ZP+DswLvCLXiDgeDXC8dNCmWYPG+r10i/ypHYHSbVxe/37hAbNjr7pYrhXbPSaYVj0PvBgHdVkb6NXt8Tk3BE9oc+Ijt0LPe8s6moBwcRLKVAoN40GjNwcMAWDgaK07ruNEugb0WRHsaG8pqhLJe54UJPCSbZ1z/ru3nZdy4/jtSaNwSdbiPGdeP45x/2TmA==
X-YMail-OSG: NZaKvlcVM1mXXaknI6fqgR.KckNYKiUMERubXTqJOO5z3ALgBreBr9v_h3TDuJk
 0dCn3rAgrZWKYGZjl3rDKjAYHoY7IxdFDbQWspfjz5jFtsDwrbE6wjZOdd.DK5J0tCnBjpqhvt1.
 v531cTgZ0RM_YkA1wQJJBWJsdj1eeWf6Skqxl0vksUcu_Uvo4lButclI96byg6MVx7QEC0IV458Y
 CYQiFGXsu0WNEis7Cs_ooa9l5d7dtXvrKUUXvGItexGSv4owJcgk0ki56SJuGyaXKzo72IIBNUUi
 qOCBgjn9ZNkISdPgaBvfTZd2T_SF.RJMcYqaeQo1LgvGuUdm5DC1w7HQY59sPpsGbPPBYwLIp1a3
 m3EQsJxCAoAlIH2Slf9UZc.0A2zEnnE5lFoUvgDD3KGSt5StozDcCvUKogrpKAMtJdoq8pSfyxkQ
 ml7OntzTKcgfymIv0SEfHNG6xNW9Q6zAdh7F35pBCOlA7jzzQKVNqzorniyMhGH4QIcPX.MdAKMh
 JKA1RvLkR8xoEwMUA48jVYPYxORA9bQb8VpIHv18MMug46usO9uVKdrynI0kyAhqNyLVUoWUTLP.
 FGXoJVnv.qKdLUNZt4ZGZLV2Nx4ChfSbouzm.ZHzfbgDGlXdbVzG_hapW15cfWNL.gNOzaniXr1L
 gV159hHNXqeA0Aj3YLNcBpU9_f11nlz3HCEDbsFtNofzQpteJjQAH6AlqClFxXPccVwCGNBoW1Rl
 wsxR9E0qtO8OAdZO1j_NvgpDSQ76tqKjDiu._9f4dVE2W_OVJTq7g8alW7xU6z.e0UxT0_NULiXM
 3ntD59sJEVXAHlZ0rjcn3YcXyp0OwbKkVtmwV_W51e8s33tST8edkA82h.8sZy0l8eKomD8ywuML
 0laJpeHgPPcRKRnPmOOwhssLJAtKtXfC3yoVBSqCbdZhIbOhdtfOCYAFgLwZipM9JyuzFpAQcKtp
 elxLLvH9WXFaFkWsdrFMOC4c27Fwc4YEaNd1NUMV2PUz9RfMzMya7YmSRPkBgHi.etj.v2fnhQ_X
 328GR.6Sj1k3JJ.T.4r0Ykld3cbb9npx4l5_9cghQ5YxvqGyxlE_XjHKdpyN8afydEdDirNc7KCQ
 NbC.Lg5GwalyyHEsvGSxITbXxmb_vXeVGfDsi4lqjuVUL5HI1t93zsnTKejbTqm9RYt44ZNhXxOj
 EAMPWsMw4lUFQU7IkJPwX7571nrD3bY0lFJHfuoO9bvaUMlhlFBdzYeffEwgwiP2jbTuyWTVFnT5
 stNx7lJ3jX0cDKj6zABdW3AxuRwhah24h14YNp46uAgjnwQrVlwI5YybYrsnRu8lcy.S3AR5tAQl
 TLNf_8XQV7Sc4qsDYvtdZV7GYZDpMpIsv3s2umrOw8THkf4GKL2dQcMonjKSZP7rtxwnB_adGzq9
 OGwjtG6K9o0g_aq5u_hBBs72hQkGf4NNOm1dMJ1qIwf9W9ORqaRMUqW_l0bBtl4w7h9DBuzDfrMt
 iUUrADeYpUGjAPXfDlYUOjlzxPdgvsMrYTo7lMnscmgzfNiTP6sHl_kOjoEO70BWhIsD.XZtb1lS
 OjF2LjAAbQoeK0ZqwvKsaRjlZtSsLmv2tn8Kbtk_.N.dLt4M9Agjm.6xXJ3uLfOClR0JnVRUZch5
 wIzUcm3VoYRhJF1V6JD9OttW8PRjpbi5yiHY1NoRhDg.4gsUHOQtH0SfFMR6XJE5FGYvEEc3gY9D
 YyMbwhS0DlpPiHFR.2FEMKnjpPQwGJPPAcTxloLmXFms9.9c5wLvYjtASuq1wX8q0vUMfSVMMnjQ
 qGuz_25CRVhyvjVDelnmF_4ztuzq_d7FtmAsDG8P39djh8d6P1XC.nSTeh5NLJpybVXjXDPDmmTx
 qP3yA0OvakQiElsi498yVeOj2YsjbpzY5Ibttw9CSsBHYPFJGWlKwKepjhPvgrEzDqbH1z4R5KXA
 k2abG3WgyIQaPC0_4_wtoWz6zcQGTYN0_90wLN.BDaZFHX0tUgRUJ2RjKTHFZrYj4IqCndbow5lw
 080aUrlohgr6RfyzeiYY9wpmD63bBfjg95eJslGx79PwWSdfiRMm_m60frD23rvzJbr0yqq78XVj
 2sM7BBL5DBcqa5wVgJRlIZru5.71gng0_kMY6miSHkTzQaREOGESrYIAK4GkL_u.7pn08oIGKT8q
 olzhc7Unj4x98iwakomPdR_wvBT0u4hBhQv.duk8tW1YgP3EedMD9hLpbECv49dsic7PhRjk9tNU
 2X.vsU05XNYiPMLFZs32IE99Kl6JRoKl0o3tvxSo8jZBE9TrMaU4qWvshgXbm4Q6NrcF.Rlt6Ol4
 1JivJ14uPkjt.3GcIHOd6fGl8jri8THCbRwGd5y4lkbER
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 01e6215c-5ace-4089-8b06-90e5ddde6620
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ir2.yahoo.com with HTTP; Tue, 12 May 2026 18:10:58 +0000
Received: by hermes--production-ir2-89844b765-wm9qx (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8a5a3516b5bed3069e520a74065c6026;
          Tue, 12 May 2026 18:10:55 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 12 May 2026 20:10:52 +0200
Subject: [PATCH v3] staging: media: atomisp: remove stale "Generated code"
 comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQqDMBBG4avIrDsQUyraq5QuYvJrR0giSZSCe
 Pem7fLbvHdQRhJkujcHJeySJYaK66Uh+zJhBourJq10p26tZlOil7xygo87eEZAMgWObfQeobC
 auqHVzvZ27Klm1oRJ3r/F4/l33sYFtny7dJ4fiUmtOoQAAAA=
X-Change-ID: 20260512-atomisp-remove-generated-comment-0f6912dc8cb8
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778609454; l=3625;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=pD5IAKMU+hJyvf0JBKSq+ZFpY5WM5alilEE2IiSusvU=;
 b=KgIDY+U/6CO9i4nTVskgHncylHGeLU/SK8CUpp931ig62DTL8L37I+tlvE8xPxUUxWQJXnGaV
 YCVsQJ/xFgqD4OhQV9F9Wu1l0qEvE1kQQHcjipcq5C8n3yJuHFQBuDQ
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8.ref@yahoo.pl>
X-Rspamd-Queue-Id: 2B008526FBC
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
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-61315-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Remove the "Generated code: do not edit or commmit." comments and
the resulting double blank lines from five files. This code is coupled
with legacy firmware and will never be re-generated, so the comment
is misleading and should be dropped entirely rather than having its
typo fixed.

Suggested-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/ia_css_isp_configs.c | 2 --
 drivers/staging/media/atomisp/pci/ia_css_isp_params.c  | 1 -
 drivers/staging/media/atomisp/pci/ia_css_isp_params.h  | 2 --
 drivers/staging/media/atomisp/pci/ia_css_isp_states.c  | 1 -
 drivers/staging/media/atomisp/pci/ia_css_isp_states.h  | 1 -
 5 files changed, 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
index 38c9c62366d6..c33d963d9069 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
@@ -4,8 +4,6 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-/* Generated code: do not edit or commmit. */
-
 #define IA_CSS_INCLUDE_CONFIGURATIONS
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_configs.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
index 1cd3322b0da0..96af15f62060 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
@@ -48,7 +48,6 @@
 #include "isp/kernels/eed1_8/ia_css_eed1_8.host.h"
 #include "isp/kernels/bnlm/ia_css_bnlm.host.h"
 #include "isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.h"
-/* Generated code: do not edit or commmit. */
 
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_params.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
index a542f8979905..40ef6e35c30d 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
@@ -4,8 +4,6 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-/* Generated code: do not edit or commmit. */
-
 #ifndef _IA_CSS_ISP_PARAM_H
 #define _IA_CSS_ISP_PARAM_H
 
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
index af1765040464..1ea71477e774 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
@@ -3,7 +3,6 @@
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
  */
-/* Generated code: do not edit or commmit. */
 
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_states.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.h b/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
index d637ea1d13f6..5bd1d4ae1fe4 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
@@ -15,7 +15,6 @@
 #include "isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h"
 #include "isp/kernels/dpc2/ia_css_dpc2.host.h"
 #include "isp/kernels/eed1_8/ia_css_eed1_8.host.h"
-/* Generated code: do not edit or commmit. */
 
 #ifndef _IA_CSS_ISP_STATE_H
 #define _IA_CSS_ISP_STATE_H

---
base-commit: 6abf0b2df0b1c2205a4c0591425e6461afa62edb
change-id: 20260512-atomisp-remove-generated-comment-0f6912dc8cb8

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>


