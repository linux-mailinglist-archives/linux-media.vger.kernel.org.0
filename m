Return-Path: <linux-media+bounces-55255-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAojFQqSsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55255-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:50:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C29B52587CD
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63EA830996A9
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007873F20E0;
	Tue, 10 Mar 2026 21:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="MfpKq9EV"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic307-54.consmr.mail.ir2.yahoo.com (sonic307-54.consmr.mail.ir2.yahoo.com [87.248.110.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B0E3F166F
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179375; cv=none; b=X/98SiXBW8ofBRmoUwNSZAKeGlrkwZzZZnKo1u4CF2VPv2bJwXNBhD+k9N+pPIe0qjFgfwE9Ny9jd3eXjlvwJznCXzzrOByFvRGp5WXkF14/nduKRkYgoevxHzJ615NRgsuOMToTtrmOwcxPEfO9NkVq9x0kkGoSrIkZCtvExPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179375; c=relaxed/simple;
	bh=w5SwlclqyXTdbKGjXn6it7SHF2Xr+jHm+FosCZ0szSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9KSvYB0/gDZq+KrDhifNWFsSRAGy0Sc+bXnLCDLo0VvCtfmMKVgeBuZjRBPyVGCmQJWDIHcnZL0VhwL+P+SCmSZhhIXuir8Lj0aOlVX3Z1TT/hkkPqbaWHTgNnt3eI5Vy4ftdYHvLczUwlDCXPZS/1fNAdaUosOkn+1tyfblFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=MfpKq9EV; arc=none smtp.client-ip=87.248.110.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179371; bh=j7EBde1GQXSXhog+I8t8P6zMaGxKlAuOTjo9omb7Eq4=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=MfpKq9EV9jnjwhZ2aQywdGcQDMkqfp5y0JNVVtDZN+8ul8N8+nxNHqEdnXrFKlOY6ylVdhvXQkTLP92s1xo6ZGiDrwDKSuC+7M9qMOg4TXLql76W2lB6lv2Kvn7pmgBLtHwjN5Rne0HIeH9BRiYugu/Y4+DpthBF1GzHNdfseT3+lAspVbFmSUmH2Vq9sjdffk+VzFR496kEZ7ngzwsWW0eeNcARFBltCUJ3GYzc9Isxs92vPuFW01QpKI8TucDBdky5SDTC4mzFc0dTvOeRTW7omY1HrAzWZ/0tiBN7kqOKZd6+H312JNxCF/C++XCIuGSgRkEhRBjHVwLU2mRpAA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179371; bh=8T06+NN9w1BhIp+B0Hgkh/0wC0Dp0xXfWQqLyDMRccr=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=fxrczOqsKdfBDKBJ2F+JymUydJstUu/v3gtnRj2pbE9Llk6OU5tvzLCCCsvyFBFcAPLYce1i9yFvRC7Ir0bBK1OrWi6cp1LKeCwiTWHCkrNZLDJOmXPqG5ONv3HmKe1hkY2R6hb2DwS3u80RvFyNYUJWjKRX50q/siL6GgFmg7Ly9cS0cubYPpBdFyJbzsRB2eWu6gFa+TQA0n/Ke10p0YckIaorUp1REZeAkhRJdLzAjr76ol4qB9WGp2rKpbgkkQEci/0SdIkt0bs47bGo/ZDYpqPSGVb4wd0jgCXjz+MVM9iZFgaWbqZteuyiAO93Bqzg1pcWKcaYyCAUc5LprA==
X-YMail-OSG: IP4VSSwVM1mRbaR4WtO_XfOp3QttJDTKulFjtbqp5S76g6rqho.pKymEgmJ6Ddi
 MHobJibdPsWV0ZQqclgxJHvsgmLL8nljnQM84sObes3Vyttq4MsQ5M0SplWUt4YdfQZHglU1yC6A
 XEfnUaGEVwbtZ_zXWEQvMvfYF6eYe0BP5E1r047n2TJ6OJ3TuT4EHZbeF9eZZg017g0HDBs7NRyP
 hMPBCxn_3sEUMsj5Z1lkWVryop7KJ0XPjxKnX.VQEtZm4Z25AvqTAOgBwhRmS0agiqKiNiLrWwjC
 C2wG5EjzaG_NPVn0Z4JbTiHVVZ3eTHQXtOH5DtfIktxm4KBgv22F6Qnl0VYbgCfZCalvZrx25Z2C
 Es.9OyYo6kkquWAEvpo9QtgvetGH5Cx.oYWJvpU0Adea1OAlHcYtD55WCdgz6yq3lYIUWwU9uvHO
 TBrXa06UGHqIN9WsoFI6rTZfk7M0YvScl1qXZrFMCRlfhb_JFAFNMinrHZxRR0IwD6x8GoZ4jF5C
 2RySN53JaGX_TGicNO3BGIA_MipX6TZEGSSPxfp33ZdGk9OUjiOaNFy24vQwk.exF4G.eHAzpCIN
 xb48hRKYA54BAargtfPNTmQIGn7h77UZUmoCGI8mH.B6sidUjdMcuLmGPAL.2zc80uedu.0vOrow
 lQNmWYYm6Z11vCBm2lJTvyMXl1z0vUXXmdU1xcBI8SPUZOHPbFH7hXCOp2MpcaAUN.nBcVhwMaie
 XsInpz206q98AqhKzFNvTc9AI82XiKe7Z4BodimwSRUIV6NU0s72xpR7i9dWoIUFRWKhwjBITK9U
 I8Pz9NR8Q0DNe8rSPPxZXWb6G2XB7gcFlYs0NjW5_EmNkhVZio6c3L8f0jDSIHtxdX.XOdlQY1qP
 1WVITTICA9huN5VqwKRVHnp6heACLNeBdd6jqVPROl_NpQ2.yljPBxurOeVBmmfVjdiH4yo4tEoz
 X1TlZgEhHyNH3lFXKoydoPlv7Eu.65QjKc7GFaQVU9mWjYdh4fc51j80YXTaFqAWykTpCD1tDxGJ
 FC2FMtKbvTolxFcycVT6T_AYByGfh8ipJU8godM4K5WRszwE.4RUbygkE9QSDGVYu5hWGM9PTIIr
 og_Sn9rGOyP.7muQPYq2QcMmi2rXSfN8koEE4tPwa8RPtMm_uj184h1VMAePOpoJP3wzZdbJvpsn
 6b.N.O9nziFCBjHDY4qEXUogIkTMd2tbew798_n3g7bEJj3AyAEVhv9e5zJhlAlTjZhtZQA.Y3hu
 UZEW0sYxaWFP6jDGzRorI_9Y7v2f5fFLoQ1mrnStwYO3l5BM1BDknTgozPwfibHho1tY6pPJSYp8
 hkiJctN40QJc26XxXrpI8zAes2CqKKEgklbsJNGsi_6zHfJhAUpoOH12D6T67D5epzhgGzMJ9V2.
 bvmaDFQ5np.rKTfupkKkobU4ijvEC.70Dp9.qRsEB1IFlprtgAPM1VUY9ymm4QLJ1.bSbcHjyDAC
 hZpT1o.pMQGolvPO12nfl5RVaQ5jpK2UkjvrVgTS8wRhHcyyhHBVntNj5k_Jo5HOUVWjIzfEMmoK
 4axGyiCHPeb3dh2DSAzSPgbCQ96KaTUhhxf7t1wNOYUcSktK4G84.4jNDYO67.Bc6hT_lvMk0CO5
 FWq_Zariper9vkJuEd0on5EBeoTpZrFbMKBHIOinn.adWHVVASG_2iOHceJfR.RuRECWS_jQ9NW2
 27LBu.uHdbEttYBjSvNUrfgU_WxBAaLn3OJDXZ7IBChQWa3NdkV9nPrViKO65ovtyyMiUVK16H0N
 rTy5nF.mmTYc5sQiLJq2iRma7A2UiIT9VzOfbUNGD3xbDi8xFP7sVPe9TY.SvAB5pDM95d4rpSjn
 Gxiwry3PSlMtvgj7OmCDQgEvdNyTQGsRi7PsJh28bXqNQq9tljbFt5XbLCkKJuVUEgGeTyIVnqaC
 lEIu5xW00MycyJktyAwZzmvCvf9zlrvxwYACg8Lb8aYZ0w7wmb7nDUAvNpjHqIIj43lpPTK1RvnJ
 WNP7tATJ3glP3G15rIDq0k7fZ5daS4TYTCrHQYCbo1v6OPm7rSwt87xn0UEg0QCFPGPpAcopjAhz
 tgRcok0s5x6LQcfAlMD1dyIPENFRASrI.wRfpz4_9b0erZ65bkcxVVe29FyrEAbSZniqTlHUvJsL
 zeNIBh75fh_vazypmaMJTi8VUu2fxW829bUNX60EDw3A3vXz0UTO6fE6bIH9kOsoWvHQB0TjHJTC
 ZDGKKzz906KXZPh6p_UhlFyi6izWnwHthtSf23ZI5uFSmEUs274ihMQEsnsfJPOJuPENerMDK533
 U1gLSxwgM3A9EC8E5ka13IIs-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 08018d20-739c-498a-94c4-4c7e87b17ce1
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:49:31 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:23 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:19 +0100
Subject: [PATCH v3 08/28] media: staging: atomisp: Remove unnecessary
 return statements in ia_css_debug.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-8-3fdddab41271@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: C29B52587CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55255-lists,linux-media=lfdr.de];
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

Remove redundant 'return;' statements at the end of void functions
in ia_css_debug.c. Void functions do not need an explicit return
statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c    | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index b411ca2f415e..2e0a13938d89 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -136,7 +136,6 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
 void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
 {
 	dbg_level = trace_level;
-	return;
 }
 
 unsigned int ia_css_debug_get_dtrace_level(void)
@@ -315,7 +314,6 @@ static void debug_print_fifo_channel_state(const fifo_channel_state_t *state,
 			    state->fifo_valid);
 	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "sink accept",
 			    state->sink_accept);
-	return;
 }
 
 void ia_css_debug_dump_pif_a_isp_fifo_state(void)
@@ -364,7 +362,6 @@ void ia_css_debug_dump_all_fifo_state(void)
 	for (i = 0; i < N_FIFO_CHANNEL; i++)
 		debug_print_fifo_channel_state(&state.fifo_channels[i],
 					       "squepfstqkt");
-	return;
 }
 
 static void debug_binary_info_print(const struct ia_css_binary_xinfo *info)
@@ -386,7 +383,6 @@ static void debug_binary_info_print(const struct ia_css_binary_xinfo *info)
 	ia_css_debug_dtrace(2, "enable_uds = %d\n", info->sp.enable.uds);
 	ia_css_debug_dtrace(2, "enable ds = %d\n", info->sp.enable.ds);
 	ia_css_debug_dtrace(2, "s3atbl_use_dmem = %d\n", info->sp.s3a.s3atbl_use_dmem);
-	return;
 }
 
 void ia_css_debug_binary_print(const struct ia_css_binary *bi)
@@ -441,7 +437,6 @@ void ia_css_debug_binary_print(const struct ia_css_binary *bi)
 			    bi->sctbl_width_per_color);
 	ia_css_debug_dtrace(2, "s3atbl_width = %d\n", bi->s3atbl_width);
 	ia_css_debug_dtrace(2, "s3atbl_height = %d\n", bi->s3atbl_height);
-	return;
 }
 
 void ia_css_debug_frame_print(const struct ia_css_frame *frame,
@@ -526,7 +521,6 @@ void ia_css_debug_frame_print(const struct ia_css_frame *frame,
 		ia_css_debug_dtrace(2, "  unknown frame type\n");
 		break;
 	}
-	return;
 }
 
 #if SP_DEBUG != SP_DEBUG_NONE
@@ -809,7 +803,6 @@ void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
 
 #if SP_DEBUG != SP_DEBUG_NONE
 
-	return;
 }
 #endif
 
@@ -823,7 +816,6 @@ void ia_css_debug_dump_sp_sw_debug_info(void)
 #endif
 	ia_css_bufq_dump_queue_info();
 	ia_css_pipeline_dump_thread_map_info();
-	return;
 }
 
 /* this function is for debug use, it can make SP go to sleep

-- 
2.53.0


