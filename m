Return-Path: <linux-media+bounces-55271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBAyIIGXsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:13:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D0A258C80
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD39E3030DE4
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AF33EBF37;
	Tue, 10 Mar 2026 22:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="DpcU2xgH"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic302-21.consmr.mail.ir2.yahoo.com (sonic302-21.consmr.mail.ir2.yahoo.com [87.248.110.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9CD3F077C
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180766; cv=none; b=bMFngKnyfnewRsi6aPGqwvEfpYPPpOjOvBCI+1UqEFHVH1Zbym0JPmoGtvc4cZotv1FypTFDk98GAqrKdfNljZc1QPAPXYTIVBNuFq9rnm9d6mcFruzCUj4uj4JcNFd6N6n/GyJLP90SkTOgos2ruBQH3yj9h7GJfR+0R5OFGxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180766; c=relaxed/simple;
	bh=JifyJT+p5t9w5q6r31ta2Q0gmx6P4dcOXYbjJ4woNKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hag3roz2Nt8AIDrSt14+VEa5OzG1aDAsYdemZtmc8PveeutEEJwkZk2s6JN08AEWESBltcC3BH+8liW/oM9sJQVK4CAMmyXYLMS/ukt4dXeCWBbYAM1lbETj9hShPWSxf3WQ/Lmx3uYOHVVyAsYkRmnmfIWY2nqOxElQRhStxO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=DpcU2xgH; arc=none smtp.client-ip=87.248.110.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773180755; bh=QQdoynZGLHX2UwaF+Usc6zte4QFc23I8KFJZvZjnDXo=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=DpcU2xgHLKaNRdSK3mjDtqoDlVaeYfB1BvACvM7ApqbCQxJsLDKrPcwwon9A8Lx/Y7G3G+8Ik0KJ9KzWEMvC2orrI01FcjVuC7E7bYZfdidw7l8hthfQxepfLINMegiWsoiVlIDo0jHCGgo3pTH9u8kHfOp4tlQCz4Ld3MLyng7efuq8gUsMJalybkWSkvitNd6pdVUhIcLvxBhaEFyvdP18AW4kHiyTIUdEmkcPZNglUkZrEZ+1TM7Y+D69nbRIbF2vouE0U4QHQxsE4PNpV9VpV6QgYSitB/FnjjI3pBW9PWtms+NMpSwfB23t4u/T/E6pIlF/eyq7IDmjYybv/w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773180755; bh=Ifol2vlVUVmfmZ5JJjWy7fjHKpHzERQC0IMLvYxGPCm=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=uCdmp7MviWW8SGdd2/7cAatsuuwwpkQXyt3TvA3JX64rOf4GWKxfYafcXPa+1j4EH1sp7iULnCIXxCAhV9b+wi+VdyyuRt7v3Scgh2wvJWvwg9020sPgUOPAVaMedJncql3wBcKAGeiGb0KtZCxrO+EivB/e8jx2hFXkLhW2EvbG4EeSHFUQwNmNvrbowU6mVrr6o9UIIMpVA1cWPnrM1em5hvNCqDrp9U/DHPqXoqqwLuoyG3HI6gVNuTTgbAvx9buHKm7nfUb5rbCl1XA4iWag1Rw5i9phaUDk2Ktk0h7/pXVL9YPi4xpwJdXoJy9qxKUWDrn7nCvRSM4hu9E0zQ==
X-YMail-OSG: Qe6.UBwVM1lTAJZ.m.Jt6KqhUqJFj4.qxJA0ZEQ1_uHtOEpx8qCmt_uR1vXsEfW
 Gvjs2FrP9slnnZgPJTD7dZNqf6wB0yF9La3olx0rp7j614uq1Nwy_ZWBTVFYwe5ga4ErJbaha0BQ
 21pniGd_a9.tfJAIbF4YbPeKKwpi3z6rHmgMrMa1ellgKiWWiiiDSbKkoVAznHbt.TW3WV_AQQyA
 o1M8edTUL_HO6g.iokCSOtcYh1mYPpz8vK17P.XkYrnDFHM1UP8eaGPY4XGPwvJn4fXkRtJItqnG
 3ira.X_vMCnOi6Ymx6j3MswQAsiBXagQXuXaVowfIBa97Hwk4izg7rpOXvoz1ye_z1e9nWN.1Wwm
 I_21ihg3zmvdjhCziUMowttSOqe9Akw.NZy9UJxPskkAsv.ZluGRG6OeskP9AleAFqtoG0ImkXy8
 cHEYkEu3Xc7EvTA7s2Zjd9.ZtNntxPJOAwimtxuUZJSjfjlyXWLKettzHmU4o.2yWjnZ8ExbghqH
 qsNc839pM8TbumAEVVOBOBZbjgyek2qll4W6QJAZBMnOxMxZtyqW.3cC_3FOEFUbx.DFxXNCJwcP
 fAOJ5MLZ1RFnQqB6K2zI6sVf0nr3ES.2gDO2g8WhHLFERTtoAdopsFFaY1wJt6r0fC5qAcv5JYzI
 MhZk2uqWPx7vOrJaTyFDeIh_hV3bDJc8YjRV87cdyw7rIK.gy969hTihIG6hBVL9ng3JnasnfqRZ
 RlsCnpn8iMiqez6qsy3AeW6HA9cN06a5sO3E3gK5bkt.J6qdkRiTr9IBaRGW45w5F36.wvf5lZ6_
 kY6U6VOk8UVURi9vR6oFnzLkaC5z3cQxLu2_RzdVX.JvRfTyL.yjrmX8Y4BeVwuu166v5XZ5sR_3
 WgsP8gAs..H4B0Jk6lu7dMWF_wHyH6FmQXeIB8M96lCKUEuI53sCvWEhp8KCAs9ZTcPcg2Hhz.ou
 qbGl2MWN_f6drP8UMaSIRNdJ.LJc7l_VVY8kfe9FxPxpb0b6FE5j3jHNPWI0EUjfIHNz9cBm_ZKi
 jOi2_vY_AZjVi1f8Mib2VKiCMF2PPdWXRu48TgraZYyJUGrlN1K4SU4lepZok_Nx_o1ufDSLHDHm
 0IeT.bWkIZJIvc5ppxc35cuvf4lZRbdOL5MDa3asi_NsNthNgoTPxfdEr.5GxpxkVzuPNL.qv1X8
 am10.hecq.446dkfQrWPaBYffG1n3ZQ1TIZuwUlJXbwnLfg5E4G_q8_RQmdt_N58TNtTyvYUDakc
 e710leNNqy67tfofbvugkBVIvisWHGuCdTPTkPeCPU69J24Ooy8mw8vkDBQvma4JHCbrvlpUwfRT
 ELQz7moRRWlTDphNjFq4sM4hODDBwQ5oXwUZ8emqZzwyjEtiT6Te263uBv.Eesv.XbCCMtuUV1qy
 cZB.KqyDgPJ06lqL69nZHlscrwXpRESCcVbAVTYetPXcUNSd_hE4GRau0kXBSLkI5FI2g_TMlAR9
 WiGe5xJbi8kQQzt1O8x4vp.ngnp4NWtt4CV4q4kUvd.JsxT64kQ8TKsEkMprQMSpASKd2KfC56YD
 fCsn_EOlhAz5bh8yQEY8MMf6IL9Lx5zQP.Vvo90CkqMG095pZl88xwf3qv8r55.lkwULdCYiS_rC
 ia0m2CW3_Qa2YndRykyJV5gWdFF5PMmS0duUvQ72CR74hVDlJDUel6o1dCiO7og.P0DiWTiYwLrl
 SbUyYerM4DqFRcN89QDE54qOHBeMSByKRdGotOZwwvMBPj2nK6ne74Kx6Lb1PXHWaTBofxIsS9zk
 G4CFIqkv2ibsAOEORzhgB0XkbwLtmn4.ooV619gWToC.kruSKsOB1NS8ND67EFn8WkLDZQ73ABb0
 ZgblQrnDsRcuxTVseazjhAGC9U.o5PzZ2y61p_ZIggXh8yPm9PgMbM4MXqpGaEq3_bfm7vLIgY6v
 wkTKAwBOstdPo0XaTYn42VZkAianKOMdLNlfWhoBhx0V55cKk12dQJI4AjFOCOnnMsXEx8Z2VcXa
 kw.UL5abs_.0FcY1hJlLRKqtHd4tD96tRBvB0sq1.trTcNa8jSWFjrXlIGylrsIQx0Pxmkgv10wP
 b8QPP.tuIhlUUhtkg5H.f1qZ.kCjC6u06FKB0a4s0T5pzzaHQYH_I3rLs4vFd6_MdYLaMqC.HJTd
 jZzshdsItfyMjG8Cz.o2kljaPA1yMPdZDMLH8dTz4bPXhvS8ebFlyo9EuwDKPGpRqbCu7EeLdLaI
 OYrEFwZq6W3PMjuM.N9ihvHPzaG44GNZzXYgP801Jgisg4JOvoeJG8_pWGlBcp8b5_wnjmW4Gnla
 ngCTfb1l2qSfG5OapCfbtNmNMfw4a
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: ababd6f3-135e-4ff4-b406-a5fb8d05d2d0
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 22:12:35 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f9947c77cf9e1aeca1b11f9d2e24d774;
          Tue, 10 Mar 2026 22:12:31 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomasz Unger <tomasz.unger@yahoo.pl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 08/28] media: staging: atomisp: Remove unnecessary return statements in ia_css_debug.c
Date: Tue, 10 Mar 2026 23:09:52 +0100
Message-ID: <20260310-atomisp-remove-void-return-v2b-v3-8-f2977db216cc@yahoo.pl>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 84D0A258C80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[yahoo.pl,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-55271-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

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


