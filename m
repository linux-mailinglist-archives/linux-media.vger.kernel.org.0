Return-Path: <linux-media+bounces-61156-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCTWF20QAmplngEAu9opvQ
	(envelope-from <linux-media+bounces-61156-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:22:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB12A51357C
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 614F931EF4F9
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 16:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE713F7A86;
	Mon, 11 May 2026 16:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="AMmdyv3+"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic308-18.consmr.mail.ir2.yahoo.com (sonic308-18.consmr.mail.ir2.yahoo.com [77.238.178.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFC543CEDF
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 16:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518547; cv=none; b=QhOt0ka9SsbYCzvGaAbqTi9BTo/GCbc46DQ9qT3QaKuIJdjbF31Pe6H0YBCgju/K0uuiiY/yqnR0Q+qTNN8H9B+APX5itoTGYSY9WA6G//out/7TJfQ7/yEqG8CQwottAXcHYBPAO0PtpYzpzlMSzyLSSSr2Il5p5i3SrUHOfjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518547; c=relaxed/simple;
	bh=22QKvu4z4MQKBl2B3qkLVKJXPL9kAcX7jpKfwOVw2Eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=hl4M+PDdJuZZAmVfDHriZQjX468nBaDObFXV411XqanUbh/yhTyDDgIx0IYAMYKE+vTlqfTdyB/ZlwPGXqKqk6dvGNlQGlHmqlkJ9alfl6mMv5uhed0v/3+3t0T8/AsbhrFn53a5IlI+7HSEaG+4Ky7izSBg4BOnNpF1Ne7AFHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=AMmdyv3+; arc=none smtp.client-ip=77.238.178.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1778518536; bh=pjAlbN0bvKCo4O9UPdGgBS4cGhl0vMEoQn41VMyJCUc=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=AMmdyv3+oDLtHPlekBZEYuAVoJAoviAUBwbzZ7xH6w4XTuO6UP57klBJkIyn6RV8xUlujwSs7kFcBNN/KpZbzUn3InUt3X+ZPtExQXoM++72Zl8WjpY8s++pSiBMDQK4fCZZvProxp8GOdyROXmGC6GSTLVP00Tw8WuuIZ0LKPWn3H443iUKsK4PM6FVEcmaNezx/G8vNE/2xG+G2dJQwnr2HRZhPXS7jQRJPH/jQ6XtbTl9KyyAyRqmDIS3/H1jp5KNZk9Pj7scJfwcil7f3woVnZU/ErUAA+n7VGpV44UEaZipqc0d26U1HTeuAvebvaNoDrFDXNNQoZYkPHvHgQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1778518536; bh=CiNqnceWLximA8zN21T2aFOkjk+WVQ+1Q5qkhEQmFgP=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=rBgJwSwy0x2KrYGYeAUnUaBhCygzZQRKofKyRyLQ2D5ziSO7HY2Vq629/+dm9LVPeYQfNfZ2gk25NqGtFzPWwzRgnaGuLBWz+ypbxDz9W17xaGoMmvpCJyCf5rEWaS2yi2TwsHUqafAAJQLZBJA1Dg9oYqhSJfJ+BKmSyI622/1/pOXoCgQBqgZsfX7sO0HtZPVhQUmQwaJBIEJ3EycMwRdh0AMsh6keXjLsBj65tbq5AnkjWcpF2DDYuHe8XI5xAs06lrDj6XOY7nT8vgnEG8K13IYBz7bP6VOHncyUZFSBIv6vnu+SI7vi2PvWwI9pSFiU85xoOalHomMP39lx+Q==
X-YMail-OSG: 1sgVMOEVM1mfIdniFCUOAHz7i9vhwKcvU9o3uNmf6x4BBuZ0YOrxfT1pgWlVpm_
 kAK_AHO1fD2jzXNQvt1J1fUdrDZ_TwvvHeeSJ3OqGDndlizgAdTC7j4AtLmnGyQFDGhQyrp7slxw
 w6XGhi5CAAKbPlWosxUjMUjT.416B411h2bKnswRnd2uMXOTaMiRxFCkX.ddSjGYOkn4TvpLO2yv
 Z7FuxMAyz8MhX9Sh98BwN9Nc6TqRVWpNifKE81Hkezdk3XgzAKaevbXEegMUWA5vV5B8421zfL2A
 2AbAfcLU0KYqOmkrp0TXiW6Q3CjezUaIYjH2A79lX0fSAUU5sNbMQYd9Dvblj8Q_pYmygdYydaUA
 yWYV.plkW3zAD8khc0No7jsFGnsVgEaMtfAEzwzflQmQvy3IAi9Xgys.K5Q5SV6kXiG9hNtSdAwp
 ._NGK1SJ0SEp6EZ1ltI8dAPza1LE0lXZQ8AH_JxvpPhlz6ycTZzjCaNbHwiY1p_gJaB6ggrxYqfS
 oko7N9LWF.OJNRzcHJDfLjXCFU3nxSxKL2up7GkKX2pQq6JSADzdSF4gQXH3riUgFSpU7FDADZvH
 RrMcSLBlEMcgPNq.o78jyhGTqUy3ULjJU0XwmYWLeHBfqdX3dSGFBTKpoGSvnGB0r9RW6kud6K_0
 8GG2R.Ks_UeNWLfbFq5bKPUEsydfY7.NQy8id9nW2G8w8U5xxaFVy2loAoaEbMDHKBF3jFx22BJJ
 xkXFbcEXthdLC6zSDs6Y5Y5a14YQiKCwVwjzj7WKEgsEE2XsZmQxpa1EWLYuqtJscwxp_g5lLPcW
 a54oROcZHZZf_zzlHkz.t.FHicorZQ7.XVeJ9aKBUoun.herF8UR5AGG4ILlGIEofTk8iEbbO5I3
 7O4aHrN4C0dID1XSEeGnOJO07qtktpjzpMxwHMlqedWN7MN_NmORaYtPg1dzXpGJpeMKdbN66kxf
 _._MLr897mJpR5pEEs3fKpO6zULaCM7LJZOI1BJuARFnH9TQ4nKKa39N8pN0P6Wh4VOnlooO9XZq
 .TMdN2PQ.ncmtsg88ICBEbnxmq6mWuQZaZd1nDNsA8OLmafLwaR72TFIW_5_VSLUvxcg2sCiLFEg
 Kp_hBGu5HZIPoY1d17ikvOWFWHYPRC._LE79ikUGcUXhHI11daVrj3xF59garxF_MN_gp83EIlh_
 db50GrX9Tys8jWvevHgP6IGfW8G41vZ6MxWJhMpVR7HCKmAYdD9UGTGNJkNEqlnwLRXP9WmJWEEs
 CLxZKgrKhtTHJqidKtkhywsaEWKhieegL7JUOGHriviX3q9XsvPnkO9aK6nheOaShf5KssGPurVv
 KayWmgTjGTaXQuaUKnnJwMa82uC66.ybyZRv91SU_fZsOKjw7K19Op5jhXTVmg_3J4aB7YHAOO5Z
 VGitEpl1zc9o9COaVDHh8GmwtSLH0scTm8fG_hQF.zNnfaagxojpKOUDZ_vI8sNOrFbxVNosTqjl
 ismghI8E8cGgDFcIXygGpWErqunvmH.FQTDXpm1qB44KepIM90l1.B35OWqZbM3Xe.TE0xxSGxQw
 7zb9O1NgoL4ZDDh7HR34UTj_1Zu9RKEbgQ9yOLgFSDC7v74JwQMvalZ9987.gsGR2MT_pJBerxKP
 dUfPBdGzK4k2QDHBhWzszyFFxBDpRzd8lLpjibq22A8PdXXLXDgV1tO9IOs2Slac3Kloxtg8_hJ_
 FRFvCHZ5UecqNjyTqSVSKvBKTg7vfQh8FvTFsvy4s5rivf5CYktD3_oHN9mouvVToUFnuv6Ybv06
 9ty..31PzlbRdRDgbuega_FPR1HabLMmGGEhncPFqxdqTC976NauArXbVlC8LQZa1DzNJO.am88J
 m7bf4KWKPrCZyuY0rzIxLJ8vnJVexfJIy3jx38Ws9wv8QQMmeE71AM4m9VwCr4L7iZaw8Jx97W4T
 pwLXpsFhpffG07XeCD1PtLgYj0A3zYpO2WP7SubQMD8_vfr2ZD5zwwG7IsejJsZoOE5rplQCtq_m
 iMZno8gInSITNDQhDmCyMds3fmc.pD00iKsCYmMGM928r0sfVUCIAZgFoLDSSPZWTrZEWsSDaaCh
 12zupf_hOUVUlbFWz8FEKbwnMBhqTeGq9QabpWtdK6.eQPw6jG7TCCMLdCstFa1aLEA9OHloqSL4
 7ZeIdnu2gbSP2bBNoOVv5WDvGsqfkuunssbdxp2qbMlt37Um1X0WmCYsAiWamCsQX7PCwjQOywdk
 hSEgGFrhOViUw5k6zk6Y9RqJ_S0QOQKQOvShjzcTbtPxtixmPD4g.hvCJA4UKDCRt1uW8ayckQ5r
 8IfWWB9v0F9.elts4AZEd2PsjKa9o9kk-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: ec27b788-be00-4e12-b179-92f4c31a9402
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Mon, 11 May 2026 16:55:36 +0000
Received: by hermes--production-ir2-89844b765-6gbsd (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 391c35f7fb4822fbf77df06662b5e3b6;
          Mon, 11 May 2026 16:55:33 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Mon, 11 May 2026 18:55:31 +0200
Subject: [PATCH v2] staging: media: atomisp: remove stale "Generated code"
 comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-atomisp-remove-generated-comment-v2-1-6ebc1b2d988f@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBBG4auUWTvQBhLRq4iLmP6tIyQpmbQIp
 Xc36vLbvLeTogiUrt1OBZuo5NRgTh2Fp08zWMZmMr1xvR0G9jVH0YULYt7AMxKKrxg55BiRKnv
 Yi3PBIpwnapmlYJL3b3G7/63r44VQv106jg9egn/rhAAAAA==
X-Change-ID: 20260511-atomisp-remove-generated-comment-ae5966c5ec7f
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778518532; l=3594;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=22QKvu4z4MQKBl2B3qkLVKJXPL9kAcX7jpKfwOVw2Eo=;
 b=f/8n9FWu9KBoHnX5ZyKjz4sA0Ng97LpIZsAj0tcLYEL3/XUHCwWRSD58x+4OCkrGEGnNcG65O
 wHkbmYM86rsBu4GcjBUypwMVhOSLtRDMRA6t+iVhDCZhFDK/T9lWLjC
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260511-atomisp-remove-generated-comment-v2-1-6ebc1b2d988f.ref@yahoo.pl>
X-Rspamd-Queue-Id: BB12A51357C
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
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,intel.com,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-61156-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,yahoo.pl:email,yahoo.pl:mid,yahoo.pl:dkim]
X-Rspamd-Action: no action

Remove the "Generated code: do not edit or commmit." comments from
five files. As suggested by Andy Shevchenko, this code is coupled
with legacy firmware and will never be re-generated, so the comment
is misleading and should be dropped entirely rather than having its
typo fixed.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/ia_css_isp_configs.c | 1 -
 drivers/staging/media/atomisp/pci/ia_css_isp_params.c  | 1 -
 drivers/staging/media/atomisp/pci/ia_css_isp_params.h  | 1 -
 drivers/staging/media/atomisp/pci/ia_css_isp_states.c  | 1 -
 drivers/staging/media/atomisp/pci/ia_css_isp_states.h  | 1 -
 5 files changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
index 38c9c62366d6..96a8e58cfcee 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
@@ -4,7 +4,6 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-/* Generated code: do not edit or commmit. */
 
 #define IA_CSS_INCLUDE_CONFIGURATIONS
 #include "ia_css_pipeline.h"
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
index a542f8979905..8c9468c5849f 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
@@ -4,7 +4,6 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-/* Generated code: do not edit or commmit. */
 
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
base-commit: ea09c82fbc53aad867541cd2f0bde96c6b228ba0
change-id: 20260511-atomisp-remove-generated-comment-ae5966c5ec7f

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>


