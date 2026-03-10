Return-Path: <linux-media+bounces-55268-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJIHDWKYsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55268-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:17:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E35258CEE
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD0A4326083B
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BED33F1648;
	Tue, 10 Mar 2026 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="ipAcWtyn"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic303-21.consmr.mail.ir2.yahoo.com (sonic303-21.consmr.mail.ir2.yahoo.com [77.238.178.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C853F211D
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180760; cv=none; b=eNP/1ZOEAmCmpLrb8yrwwFISE7bZr8uCXJ4v7MaGWPCD0HPBj3hLN2Bsnzr5tq1jk08gqjTWYCfC7ztdl84Wj4a2kHLUwhEShzEhzXuI+IMI0xk7v2VpplPLBcqR7/bPLE+TonUAsnkXtXQTwLdqRdTtCrZ5Y+7yTOyHyP0ee68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180760; c=relaxed/simple;
	bh=FNyw28ONlAor+ndDytxc5XjumrbRaX/KbozNbkds28w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FtRi5O1+LxQmQrSifzZj+vraITb9R/UZrV0hd8C7AzAnZOmBuWYL+mCQb0pqVJnIVjboq7BdHv1qCu2BEUyadbJFyJCbCY2d3Sh1gR8EJOIKmKOa57DTa2Yvl5XBSTJX5e4pitKBKDRCgNp5jxHwc9mV3N4WbtzhXvb+HhcvarE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=ipAcWtyn; arc=none smtp.client-ip=77.238.178.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773180750; bh=FSo7p/S7E0OAOLCrkhvwWTdCWlMHx5SmWYXPqBMXLb4=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=ipAcWtyn5KBVC4MpIH764khP3gYLuRHA5HQoNqV2fPIVAGJkzcyc0ImXug3joroMH3nPsymuGAqfQEDYNKsc1U2BjZ1IYjdKH8W652Vt6d0wV3ZkUPAxpk7j5oPwt9R2q7XZWUrL2R1SggR49mX+gEHHUc2Cf3u9BAcntf3tm2muKr4xLsICnv8sChgS07zWi+RkftTn7HacmCcVHDoS897R0Ck5zhwn2by5fgb/8m3F1GHrzMj86vhmSROPJO7FKJWzlCej9Np36P9XYzPZjz1PYroawat/051tQXZOg/nXIvTjAoMU6rQqFJFm1bDYm+FOjq1ySvG5UojlcYXUeg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773180750; bh=71hwCUu2BsSY3FbH2rzh+Nu9MCAYm5zoxG/EaG5AnQ5=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=uDJjoKPz8CNhaLO67iooCC03+ftLuzAgY55iESf2PT7ky3xgc/v0TwkwousTTG32JJglc34/4s6uF6K0Y2/tESl9VtiPsYnh7oh36xLL7X3qXnwhnikZZRrlsi52vDvWWWQnj3XEoSn5DFS9RM8jPOFE8EiOnxpwv8rRqYlegiJ/RTCcHjY4XRegYxWdCBHE+Qr94Kw0vWZ9gUB1lJr/VU+Ccy6k9EOJPqpLT1p8xAm4wKVac3l2IznS8dd1wOX/Lk6+UjkYGmvt6Dxz5vL2jNpBe6E6cxZ2li2dekPKfEt7GdqSFYNBznhuTC48szOBv5z0zwn58NDLFk3PmI5dWQ==
X-YMail-OSG: O4_E.t0VM1n4jZF1fn3WJJsa0ypvISRhoDLzvuuRkKPIxtymKknwf8YnwRK4xpQ
 cbcpHlFC7u5TNzarVoqr2xQGvG5A2yYr.vTmK0w2_HGuPtSDVHs5n4eEUCgOn0E4ae14YtUqOfkb
 sJWVKm6AFHtGmmvttZcfT.OFS6v3CJG1YIs6V_MCUBfBsgZ6OU9Q3v1VCFJDuja3o45IL_PnoY7A
 0TqGrsoLlsoHhXg0LZX32TMBlZXH2uhSBDzjEfAH7kEtJ3qtr4BVVpSfVJtUDNQL_murJnRgI12d
 8W2dcXQxgfytnTEWkvkhx0b_ipjZo2_Ch.Ek1eOW4xOcL5ub95SAJ6sHnnJKLAy9F0jxoaKgzlZr
 Qmw4RJa.7ze0up4g4dmJ6LHRbWX4M1TvTFRhloF1Dtg3C2lTRNeLbw0fbhhygv9R9hW7coV1GgCO
 6Fag_zlEsMmf6xaJdFRKofAHIj6tMYK170sK4wgnDZy0mu59.C_2ONCFaI2shyPLttzGPZBqS.SX
 VjVuxEEUGD407SsvxUDVFoKlY_u1TowC0pE5UBL1vmccE_azXPZ.Mx8Xwm4Ww2cr.piw2El7tGZB
 okLBRsqcv4eGSReR5YrUY9NVOqleWJTzTT6IAqQlJaPsNtJXu_jscOEQAQcIjsTHqhnwjgrbNRAW
 LAUzoxuLZs9RWRxZQvCDzoiOh3SOFJVatDM0tBggl.1bmoF3kBh4Gzfii_J2Rnj4CXFzGfp3XhLF
 rLzOMLJtW7N_YCsqzTcMRoZuy6dwNAlnaiBD7Cgly56Ec_W5qgTue44Mu8dPx4zQ64SHk3E0TxTC
 OQ2KgPzqhH8DmSTgZ4APiCDZEoclQwhwnml6PE_nOtBFLdpTQ68es0_WOq7OieQm50hY_PY19TDh
 ryuS7gJ8vw93nEmsUwrB7QvImKQSfGUxT4f8Q40AQ2ZigizBbziZ.t3JbJLaXwc0CKIXo1FJFBb9
 qxwbm1ciGmnPwwjLTGmli3CmZR_IZARbVp5dfuI9pVq7O0HhTbfRPcjhNH.AKqnCzkMmb_AeE96.
 WxdrPZFFHxpBDcSY9ZiiGMMeFYP7db9NFzdS4QyqcFXZ06xKuGq1SEEtpLGbaa5d1VxAVKwzJL1m
 3Uq2pAr1pjXC6uPMMFEbKPhqPWep_Hyimz4OitrYGwwQEu7eXGctoq2QxWUaNrLbcpXEfK8DRUVw
 Da.6EjwW_IZNNsznKxFrC0R.AEboJUixaaVe8PjlFa.5LNUrKwqZum7YfstDKocHnBfxMHi46OB4
 o7iXdRyJkAZktyTRsGlCvkxQXZ0pn.r0ycQ25QodgY.GHGD2ShzL03JJGoHqCIl9SIDFjwkNQ029
 JO_E5GdfwyUzZgyEyobTD1mEHvtePd7OZebaYGYQlHTZ.OLbP8OYVALf7fms46fM3j9u9VQ3N_d6
 8OIm5KwzNnUQZR.sQbzkZ.QF5oUQDLlAMTkj1IRi4GHGXP_ALlMKa5cKytG7A9zFXruzdf49_G0o
 lLDJxY7vnSRWXd3Rrw9G6uP9JznAcVPG_wHECWBl7u0301_2HnyW.rtpDz.OJEhzCzawAqJnttbF
 B1KxVA2Qr1A1LTatte9DVYeLuP90iSDY0J.g2LZXjz5Ft.OBa_uBQmw1ibXZU0p8fCJm5ILivHSi
 LtRDxuILtEoIRKA3LpOb2EiC9cfj47SISGdvCYpBxURRdYiB5HNomJXdK8HauMqNWT.Cv_KF.KD2
 UrYFc8B__Fj1YELBU05mzaz28MNIGb2oSX2rA6jIeMtnEDVTGWicGju12lfwMyQdXNSeEqIOsUHz
 a0k6GoiiFgF4uyUDJXxVyTX.NSuSpH9QuPJf0Zr7I2dmF5yMe6RIn24sQGwelp3dH6quFqfDSgY3
 6uis7JFCNVSenPaj_imDe6nFU3lhzNoms5N_UKqLtT9nJH_.H3dPFODDsk.k1KGV6cQWA7tzsfb0
 1Rm8tazWY1famGVezbDetzJp4xBZ5OG_UmS6maXF0eKp52ND4xQyG4HW8QnW8OkXUTEpPZDVycTk
 L5F.xvnku5wfo1gWQeXWrYMnf6Hz_GBSY5l9.EuuYCUVhsi7PZoBQFzA6DCebQLjbPUeqM39ub74
 uCR97JayMHTcXotm6qSJgOip18wy4Dl6R5XiTG4cTNXAOl8_KJRblPulcSxZLYZdlZDuTV0EkElT
 0aVaUTIFa8tJ3ESmXUzYBt2MPe3hLZo1AdY3XwUMFStm8tdI5Y0tMyss0DVRFz1f7cMK1UmIJv2k
 G3AfTwAoypYpt9nxzNQ5teXBrchTsOKI._GrNiW8S2RAx7yWkOzvXxd4V7JrOvQschmTNhpBtQDv
 24idT2ilNcEY0N5mhJqZ1HrOGLQY-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 53ccb250-fb07-426d-aee9-83b8b4b41e4b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 22:12:30 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f9947c77cf9e1aeca1b11f9d2e24d774;
          Tue, 10 Mar 2026 22:12:28 +0000 (UTC)
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
Subject: [PATCH v3 05/28] media: staging: atomisp: Remove unnecessary return statements in frame.c
Date: Tue, 10 Mar 2026 23:09:49 +0100
Message-ID: <20260310-atomisp-remove-void-return-v2b-v3-5-f2977db216cc@yahoo.pl>
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
X-Rspamd-Queue-Id: 92E35258CEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[yahoo.pl,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-55268-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

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


