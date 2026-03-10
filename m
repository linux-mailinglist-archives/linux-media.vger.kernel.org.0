Return-Path: <linux-media+bounces-55249-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNA1Ci+SsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55249-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:50:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDA82587F7
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E2763233D5F
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FB72EB5CD;
	Tue, 10 Mar 2026 21:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="VNDG6AdD"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic312-26.consmr.mail.ir2.yahoo.com (sonic312-26.consmr.mail.ir2.yahoo.com [77.238.178.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4542B3F20E9
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179280; cv=none; b=YsxblwPfJA4pfojXbUkad22DWJHVhVkAhVchHJgm2ga6yxKvZ+adMrXP5Y/tQQiG6sEsNEtyztI4SXb8PIxLmK/rjzVHPqqXsiUo/tXf3NyM5fWQb9vN3WO8T6BRjNj32GBWyhqYM8uhTqBObe6cVFR4XcpVzq8VdZb7nbnnZq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179280; c=relaxed/simple;
	bh=QdUPztcm1AVultvSUbdpohux3NGtBlUJy7fDERjpKEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YAEudQQDWW1oMrL/OzBwtIjt21bLVOZld3PsKQaej5W+uegEO2pSoHWDqlXsGM6kyix/0+x/Y6kx69C8TCU45/rKzGiVgprEKwcyCNXSkRci475u8EhU2LBr0e6t0LxiuCuaQKUTo4vIryYnvvOEE9WwYSyULPaHSf1alwWSKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=VNDG6AdD; arc=none smtp.client-ip=77.238.178.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179276; bh=WP6wzhdb3fhAUqJ5vjXdBaTX6IFc0j1fA37NbkzYOE8=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=VNDG6AdDbLCYq3Xmyo17sSMRoEIrTCcEFgA1jP2RWQArNBvvu5IleNqPpxqvS+MY19VqkXzaXkUGG0sbbslyRVwRATqWf6HTR1thGYDhaz1CWppuRIaPXXCsCKwm6LWA7U+9P/3cxMyLAQa6OjTGjrSvSViUKQi/1B90Dm8eo0WxKl2yqzQzjwY0QpyxpLuVygLH0XTuQKsNUV+jXzsfoNCvF2kwMdRPqMFPun8QX4Ytsa8dGxgld3qCRkRhb3rXKt51KWadRvz7nRK4X7PLNjOezosQc4RZePKmcaovZJKB5f+NLk8q/Hy213Au7RuGIFlSW+qVHLhs+i2Kr0gPNg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179276; bh=sleKHnfE80CGmIzXrZSkSqU7uzdPTEzbNk/UxZ2jbWX=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=GHdGKY6aLsPK0FpMa8QxqiGsIwUck0K/+WqYhrRJnDCyT2slXNlb8vuJ7BJI9o48D/X2w75LSghf/VHsvAxYXfg8lc1HwFcWF+o/KD54hmWZk9Iek2Gx3qKiYGQsk6Tw7ihaBkv1Iv8d4az5GkJnCOH72U0L9Vc9+JBG06FbyJl2kcvS/XkvHzPBbqedrnZfTS5guI/E5VL6b7ewbwhzAyW+CKNxDGxM+CEqyvVjVd/kOOYjEZGcMMa6LwCCvNdBCa4nemOP1gHCEl55lo3/esOaoPW1TLQc9KQnNFUJPZOvb0sKgJJw2ehIQriBKvuUYy/ws81u15Ye3mdWvZ2Mfw==
X-YMail-OSG: vebPLc4VM1mGiPJCePyxGp2y1YFI6MhpRIcx3NehU8AYhIhjXopkrqkefGo07Yw
 4qr8W1euMoR3ZQL2y5L.p2Qt2lRDamXHJtguW1bAjnnuCa.vcFgi6MLsT0R4qrCEUyfEdFw2Rl9r
 Wp9fPNAozTkbNXz59tlE1JKvLVb8.RcSF_mXYRWBU5myX4wJ2OceSesacpnU01nkC66w1qLrBXnv
 TDItTaIwxWk2sGSpzmDf4t4RjQCCgX.Ea7Bzx0Way1kOVd5u.104RQLNwJIZZFxydqny1tpQjAUk
 gC_nqR9AEtfYX.DP8xFRI2d3DeqxYBJBYOQ.JzUvWoH5kq3_hnwG5OTBAFXJKSavaKI.XaHo2Sp9
 .7IZDX_6RBpFEc5UXoNrlDNymcBWAw2wGE9Q6IOd4yMlhZLLwIzeqd0B1kWs_M.WeNoZP5m1xzT4
 CXByMmh5bAI9gdt_M7.MTQ2YTGGz.BecmNdPELyNWk2._OLV0DnIrjnQ.rxn1TNMZFbAn3iGYt9c
 3c2tLD.JrXy1xuMJAPA8F4elLXDuv4p1G8qxZYoWNjhj6wMJYvIHfvCJOb1Q8QKVGHLchIUOG8QD
 ou3L7JiTtTnh8gusBeiPfqHs6RSVp2w9NhOy34CR6Wir_h7parnxwDycpG3xuSYxmQQIt5BYoo3n
 _zaKvR6MeTn7Taq0nS6UUyF0OSGm56Mxi3RN4xyT9Kw_DV7veEYtNlhavzmZhWFTzWEsfxXa8rGu
 tUj5m2_CmHXdLNU4aOboU8GvVYiZh9Ma0KhNyxV5Nyu7.kFlO_XC5Q5l5kQxafjeUW3ZEin_G4B7
 OuE8OJ1Nc53vr7MbyJkIbhCU.OTSrujZro6yuJ8npe23KKwGK0na9gVcNrHguQSYyrnSeAjsUQtN
 cStX9BlAN3vAwICvDPNkEGqCaGuHVKnYoKPw3G60nR0_g62QWd4ZFetg.Ky911E1qqbVL3t0heB2
 MfeREoFFDmQHnQD4zaWuDkN66E9nQRiGzQgUl8XoAhqu0e367O3h7x_432XB3PEZt2kTje6VYliR
 H75Sjza.VG1m8mP5gjlWasx2KS.xp_P_5vzHw28bP5vY8jimGW.z3sSL9RMkymdd0lVuCR1M9i12
 J.3tFhn4UmNQrW916W59OjqtN2p.k1L3ZNsjvH.bjlmDBdvx._RFzOy8HCEjkTnzcehYJjhMPJAn
 40YQK.KWJzKGiiwpuCr1dGXIHcACrjMfE5tEbAeBquq.5w6voAkTJPJeQQLmOQ8rHGTDzJJgIQHt
 1OcEHbeyoYsrKFcgo8rNxHotgGIpa9zFNBzy5MUM7mSJQdP4Ten0_HiVoMZbn3xtQFdKAqhPt3Nn
 sZjDh0YjkUUf3tD9ZH2MVT5aYcS6PkdVXW_ZCfMdJ4KK40xSdC_U1akpxZuVg0jAJlUx1jRusR6q
 9r5jkvafu8LKiOSJs0zzMvwQFoYH2gJJVusUO4tL0fL.gAsuGUCoPr55vtZpnL_XrHkWZeEvwju8
 C5mwBmj0HTPPKVX8rvk8ov6zeV10Y2AtfuH.qoKJdjVt8fEeRoIyu8sj.Sc9ZI55CXUVPOb5x2gH
 4yFwSCsOu7x6XUDVVRnhlkbbgnEpeZxSeGxislmQ2sacYP7W1WdhA52uCO6d8GrcCA24qavm44cW
 V5Wv.kctK1b.pXO_y_xK97RtJDAFEtkCd7YF7KUrDnxHq2oIyB8bVEanzzfyCwu5pUm3MknCA7fn
 JTnLnP_Znmo7coTpXyXex_TSzRx1D2Ap7Civ0iPQbcl6gHHZzCDl9aUgTmi7WhAToZi_fimXVeJ7
 35x5PtF_32JQ5NNOXKips5hH26Ua46MLRwuHV7ty1k_Ao1sejvsXEin7R5GUbSGh15C7Qq0z6em_
 Q_QpV7gMJMvmfyM30yBN2xcxOigjwHFD7Mvf_BeF7XJzJEUbRduBipc6txb4eXOvLYZSLnNskzS1
 KFu.b4JDv_PewsnB5RRdM0crNHxBDoBVhny6_OAGGP4Efdc8yg7yIkBhIjm8jA7m0bTde_q_aU_9
 zmMnu7KGMK.zAAPE1p5Ujg0qt_KHWKDGPTSx5VDlwJ0pS3ttzHiX8e8sbpvdwtYmiAGqJ3i6eS62
 SQ.iiJ6JqeAj0gt0u3PTRyQt1Ah1Ax2pRbLTVMm_xvPnlKc5kBMrUTLKF8nI23yhUiJZvGjuDYul
 w7sH2.Q4F6NlNhKFXWDwK2nCcZYdWYCz.Z22XGFY.J4MScSyGpHJk6hHkpqtKYdGyClJEzth_tRQ
 CL04aeZWEziJ1FdG06BT8UzG__eGJGNFkpLDKUk0gqv5shfsb.aXA_jmZslxbtcu1sIK3ZotLdKF
 FiBX0OtLrs3EFitu.L8bkoL_jfNB_J3dr
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: e49c00e4-b3fb-476e-b1e1-662a707a19a5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:47:56 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 70d8dee74b9581b201e5d1fc2936dba7;
          Tue, 10 Mar 2026 21:47:56 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:46:55 +0100
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
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-7-fd22e1a04cfa@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 7CDA82587F7
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
	TAGGED_FROM(0.00)[bounces-55249-lists,linux-media=lfdr.de];
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


