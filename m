Return-Path: <linux-media+bounces-55262-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGoCFmWUsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55262-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:00:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D84258959
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CA553033029
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F523F20FC;
	Tue, 10 Mar 2026 21:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="ripWBur3"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic303-21.consmr.mail.ir2.yahoo.com (sonic303-21.consmr.mail.ir2.yahoo.com [77.238.178.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694D83F2113
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179982; cv=none; b=EmE8PQXyqEXbqNo+HpnLT2vZmYFRdF0cvKJl/3JvKj0mom8zqFbosiHxTERJWhc+izOZ8IVRye97qNHtvO6wndKdw08ZPY7FjAdwTq24SWDZ0iA7ck2UCWZj/7gC6eggjuxVgSG0gCtEeYZ7lyYt5Jl2yIXcQbKGJhYsiQfuvx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179982; c=relaxed/simple;
	bh=ME/JxSJvfZy8VyZVzrTwc8gr4BRvjuq7Q0qnFq7wp3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mczFCzsfZPB0PjoxYHjJp17cv5Z35f8Dhe84LBUCs3/U5S+r8VvwJNXOaTBsdt7PxKE4PL6a4XvvaQ6VTC9x1CaiIhqA4M35+l6SbHjtPyIr7BxXhFoDmmplEQzzdkIxu2AiORysBRzlIs/Xde4bsQrRq0/PsIySsGeT6Fsnwuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=ripWBur3; arc=none smtp.client-ip=77.238.178.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179980; bh=+44tMtXJOODYGG11pS21QyoIgBmXYJcVjfCR3CHiglM=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=ripWBur35592qlZ17KGh7O9HRY82kfjEA1AASNlBPlJv1ST1gi3gD8c9W1PYf6u3fjkmOWkFtMI5xN4Td+wMw7XT05KG9SQ1XjJXpmJjYr2AebjSL72SGN23HsSX64AZv5sQoQHFybFVtFaGo5F1WMgHerDx0/7YxODdmlMEYbrpv5v7OUa8rnZewWPqSlo7R3t9ZsHjpRH123brzfjtxNCqE9zJ06OVP3FDnF7R6FKDjqiGC9OoHRW9FHC/cNsB4EkfkLBGp/i9Sy+tP8QoVTy7mCORvc8U3qskIST8OLsZMTzprvps4RLG/0si8LV98sJELaDyuK3Q7ouYNTZ1bA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179980; bh=KI/2C1qWh0wU70YNkTGxkn26WB6sEdB0QJZ8iGOv3O3=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=aOhUiFWCCIMvO6Pqe9oBOjaZz6LY+2fWreJET29w7xLY+vYv+RniawyC0NrqRE4/YRVYxVSQUvJ7P50gI9YAFcWF7hJJYy0KK/L8TlpQ1pNnq+CrBDlUpP5z729IRvIyjrlvMjZrJ9d0NAjl+KJmKe3bezEt3DwogjCGOlnI+x+3fNmgTX0KID1S9Tvft4dHPkk0/rPwgJMGle6M8ANhTZviBXSSX+Tfu2aXtK4RonEm59yjsguQadlz3ouBm8OdgxGJ+vFBMjosf3MxXqrr8+6r9Ooq39j0GOktAz16ECPrFC2NO/J1OXvcMZBjirrjzpsx79/nZsOSHQNq100wJA==
X-YMail-OSG: _i6q9.oVM1lcKuaQ1kGUxgMKwbLkiWimGfzP_7wobUc3YJMLvPhSMc0B1sRu_lE
 CbPICSlpiH17.Sh_dqPXYbjBpgiqaTEPWxGt67xmskdWPJJCX_KqIg49W8cNqOpYBgHVo.VK8zf3
 _mWc_hAtTQd3y.PUKvhc0_YRo8uoNaTx_Xn_ODPaW4W0H.WEwGjLkWYfH.vAaLEhnEVyGdv_.1Ca
 _kmlel39mmJgMxl45ADWcjiAKbi_OrS9QveDYc7bhBKpz2z0jwxEWXHuaveYoLvzFZal1groctyt
 s_KBk4hIoGQFZWW9Atck7uWBnfiAxaJuYZbjrsaayID7cG35iDlIFssnD4GyFPyGvKgPb9xCqmW3
 MruGIkm0RKzNasVKyiCUvKSPjqUX9LWznojQbEVazangaJTkVR1CWDXMXEZ7kphVsTEHtE_dBq.8
 pifTXpGZjWs_bqmC85fjBEbqI_jQj71NHsrsdz9dwqiFvX.OPwAVv8qbc2yBJY8OVJsHKaEDikIG
 jC3UoX3261lKV7YQv5mMNRYDGst_1gXDvHHqV7n8lM5kHMj234f1O_kirfrofR_P0EdFDk4dqkcq
 NTiNVrDsNpvZ0zzJMnBKaeJ8gJpGLjB.pQ2FkgYbbDPBPa06jWQaJLkzKTQj0P8YM9aarhGTa0AP
 NslD8MLJQqkwSGSp470nXpR_zu5FzEAkcH2_IkBmuM5KZdx0h2nbUlx.RIJQVslNGYYbDq0F5Mxg
 g8UK1RcFlu0YY38JmMMrwoAYdap4Ex2Syc1Bi7eziOWdnR1.rG2mwFmLLq5d90PGUt5o_QESY2KS
 WZ2wkR3bepril2muiJ2uRyj1DYG7Vub.RKR.KlzojNRIlLxGGqZs5rheleLrWiWPmvEcnDn6aiOq
 xl0efgRPX2B4IGjzA0DgvuR6rzylIA7sJeQ7jhXiBnNn.GQdn_vOjgoUWjezP2eIm.10_tS0kW8L
 Roy7FuXxaLeGn.0j8c_a5d3eTLrZwmb0Qbl2aBBeZbcWOnNmpbrSmHaQV.l8HFuQD2TKphGqG9XD
 sDjP2OgyY35M6y2q7avyzZ_aaxy4J3xHfaa0XUFX044Ex5gvnBmu.JT.1rB9evmZUNv2brS6zhke
 _5xwYPTXCDGmHhiv4juN12VslnY1KBN_QDw7gAuEmTZkVLR9ouath8L8MAjJGjw_m5T09hjyOCIq
 QYgfkmIXoH_pgnfhSV3YiznxoM4Jj5w0u5gcklfqs75vOTxiIpxMWi4R206MSQ0RwLt9nNGJL0vz
 kFJSY9Ob2lm8zrVhz.NPMHJlDFaUzbJ5.SjWFaERuKIQkzMGOqJNdp0._ePuPf1XIj2Z5BNoqA2q
 rhCJtV2iQaabwx.pKjERFuG9_paFjFSdgfkbswDFUL15BXbtRpsfIeULG0KfRw5LMFZvwrT5uMl3
 EpWfbJW2HnxCqqqWLcmBH095PYHN2MKOn3XnuKG3hcXE_rlVQvaxytEHctxBkYuigBzFtLuVUbJO
 Ve0bOAWPx_fyFL5tRYmCXkpfQlmxVTfdJPFy0dTz4sv.nzOJ059.idF7XhUKVpr00QVtX25KbWnT
 T.BALuGduB_XjpUlvYiTeGQCFaN8G7ewV2ZYmsX_x8ziWKt0n2UEQMxmGx3JUMYcE4QsYO.l1QfE
 jrSlKh6m.BruOOKJgaXfY3frPmTnBU7gIaPgL0dbGa4GQPP4s.yX4sXlNBW4mulu_gQiApV0A7WY
 RCxajTexRhPCx9LEB2hOsB0VMeAUjVpIQM0Hn4mCp1C9Vt8iCVMOxMWtdUfli613CGSJVWa9Bft5
 WgYJeIY42FEnxaevd2l..PxeZas58gx83f9iexzGHXWbZNTvJjFrE8PBxmkzpQvXlKkqRK4zScUL
 sE3UKYTngrCKYVRXSJwG0zNTdHIwbiybVja6ap5fZUnSS2Pf.I0cKdFroaNmbTvEuh00wZOaemwX
 C0bjJi9kJX.cD76w6luoTnbErpPqVkZ5BdNWJa3OgkoNV24FarwFI01T3FixC6AN1wbWfO0_rS5B
 U9b7EZzcmuAmE3.A6FXP7bll_8iQrrO3SyWYM.UneRSMlBja.NXsz1DQic5NK1HVKouiyKBfP.Cv
 ddrGCFZj6tGGegc5Z7psN6SQcCDK5tjSuVixaIejKQWfwGOv3CcLsgKiJEl8bKxOFcVveIkmYj58
 PCG4BS.YA1BO2oX5JsWP4Em5N9NgTYG3QQ2ZaGyS9XpvjKah5v9Cc2MDPjNcEJnW_DKuZRO8vPCR
 I8PwUldo5IpGTWGVAKbjNqORWzdCiBIS6e_dHRvtzhWfVmurBM0oc3drxB5wkf93wQfWYi.Ubnco
 jdPuY6AtWhNEonKD1SRiirQ--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 542d3c3c-f2fa-4e0d-8f01-d0f33a18665b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:59:40 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:20 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:16 +0100
Subject: [PATCH v3 05/28] media: staging: atomisp: Remove unnecessary
 return statements in frame.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-5-3fdddab41271@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: F1D84258959
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
	TAGGED_FROM(0.00)[bounces-55262-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Remove redundant 'return;' statements at the end of void functions
in frame.c. Void functions do not need an explicit return
statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 8614efc28b19..ae952df03cc6 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -525,7 +525,6 @@ static void frame_init_nv_planes(struct ia_css_frame *frame,
 	frame_init_plane(&frame->planes.nv.y, y_width, y_stride, y_height, 0);
 	frame_init_plane(&frame->planes.nv.uv, uv_width,
 			 uv_stride, uv_height, y_bytes);
-	return;
 }
 
 static void frame_init_yuv_planes(struct ia_css_frame *frame,
@@ -558,7 +557,6 @@ static void frame_init_yuv_planes(struct ia_css_frame *frame,
 		frame_init_plane(&frame->planes.yuv.v, uv_width, uv_stride,
 				 uv_height, y_bytes + uv_bytes);
 	}
-	return;
 }
 
 static void frame_init_rgb_planes(struct ia_css_frame *frame,
@@ -575,7 +573,6 @@ static void frame_init_rgb_planes(struct ia_css_frame *frame,
 			 width, stride, height, 1 * bytes);
 	frame_init_plane(&frame->planes.planar_rgb.b,
 			 width, stride, height, 2 * bytes);
-	return;
 }
 
 static void frame_init_qplane6_planes(struct ia_css_frame *frame)
@@ -599,7 +596,6 @@ static void frame_init_qplane6_planes(struct ia_css_frame *frame)
 			 width, stride, height, 4 * bytes);
 	frame_init_plane(&frame->planes.plane6.b_at_r,
 			 width, stride, height, 5 * bytes);
-	return;
 }
 
 static int frame_allocate_buffer_data(struct ia_css_frame *frame)

-- 
2.53.0


