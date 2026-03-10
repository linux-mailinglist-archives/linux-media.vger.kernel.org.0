Return-Path: <linux-media+bounces-55261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BA5IWmUsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:00:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A6258963
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 441DC31F1BCD
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835F13F20F8;
	Tue, 10 Mar 2026 21:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="QUFW1UQh"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic303-21.consmr.mail.ir2.yahoo.com (sonic303-21.consmr.mail.ir2.yahoo.com [77.238.178.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1AC3F210C
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179889; cv=none; b=EV1z514NP4AlN9N4qGHMWjEmLRj3Sz+TuHmrDPsZvrmEkSA/qa/JpYrBVa2vk3f42OfBUBZc37urzqKq818q0jRcYPjg8OvDSU//jBm1WZuCvsSHzvNB5YZ/Ox7FtAvXO/H/QjF0+ShgLh4cS+LXjudFUPVqDGlxezytNSw0J10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179889; c=relaxed/simple;
	bh=ME/JxSJvfZy8VyZVzrTwc8gr4BRvjuq7Q0qnFq7wp3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WF3v19UYNWvzJTnXenpN7GjEcDflmoX9YmludCNWmVowVySLBMkdQLC+Wx4/BffvYnOwY+8dIMPmHt8UuxqYZMuS2sKdyFOEYgJ4Mu6hXG50e1TIqHLZ30fNjJl4RZdT82Iql486V93nj5Qb/AmZXVjxDcXvSNZ6dXBmAX5F09I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=QUFW1UQh; arc=none smtp.client-ip=77.238.178.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179886; bh=+44tMtXJOODYGG11pS21QyoIgBmXYJcVjfCR3CHiglM=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=QUFW1UQheq9PscUaqfpnIk1TDE7e9X03dFBVNYK9aKDO66AuoBlj8SwSQvdoPSLz/oi6djvvjHvi6o6GXhe+sZ6H6CqIIiBkJ3X+x7ESQo0Y/jIQyiEHIS1yDcBwYXECiuD3/UKSyDS4Im0U0bJldJDjAseHt+6mbNxVc/ZRTWXvjr4xWzQF0u0cdtfkssP/+2QDtFdbc1zaxF9CE56/mO6vyxFXrnNvQ7+xBPSHoDH+rJkDS7tttL34jRhMORKDrm3Dkf4HRNTNReA2ZxCw/FmwaXIolYtRP7qVa15mA6vQ4fy9hmfzuBjv+3076iTiFUUWJm0XqTNwQ446SgByXg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179886; bh=Fl3mlBGyxBeCP+UP62wzmXOxgSpM5vJ7zn99asDtfpC=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=c6cYbkDOGKQeJj9bFeslaMgAvVPOhcyVtDljLMHwXJmbvlFdiut9N6NN7V6aE500F5IMCsKfHPX+O72IAwA1HG/VXlS0nJw5rzW8y7oPG8GT9w2AZL+b9RI+Fn+U0XM0YIJkBgjcG2/Qhg9qUEAdMHBkQkfq2OC0P0Hlqm4+hduqRH1I1oFC6SKsGsyXtAj8ytNzeO3yAAB5YI3tYPImku8qXMhr1QJMTHmoN7nGFb0IsByja/pbHg+a7flMvgVUvsWCBlm8jLRD7UZ7bO3263NokR6yFyGIPE9Aucv79QF0vzEGnOJavrWjZ+Liipo9cBeq9a2aK3upZNeZGnn4CQ==
X-YMail-OSG: V7dfGcYVM1mMsc7Vdsr_JO7X4DmKC31dZVXkA.HeIkZRv6aiOcvvIUt9dCpNaLL
 fMMrCnzs8gdbPQL1ysYqQW_ajq.BfJKPhGSVvbaIl8VCqB9Iay9MwmjQSU_DvYxUF6wu3gO2Hghn
 7AEe5voW4o.g7tdvd2sSV9ZxSXp5IiCG3q681GlcsG_q4nRlNCkr0oAqluPR9WXNjjcDwFgO7NmG
 VLFTNf3F15fs5FMG77SbVSoHtcZuhodP1B7yN9zITCxSXPTKqQSzEYM7Eu4KBaIaji7jExPxqNRi
 t.SdQfPmTkd6Op12cXADR6EVYKRbWqV3PMcujJOhKILappVpTSk3qgKiWj80ds1OV91kgQG.CdaN
 cwE7CU0YBjDvGHgfHfAX9beZ6gJEuQEcz_eXyYu8Kd08ZoflkC1GX.oJaWEnExv0Bu4nY7_IDKy.
 Ep0ZuTlQbL0.QUChIEq5URPWVCJhs6tmk1RmGLcfxiTxWAcsRVXqydN4EIx9ktQ8LnztPwx925N8
 U5O7TcA8.ZUC1kV6HEFRGqOuAI3eYjH0C10c12.raNi6072zuIrbgwoJoaAw.w7mY20C9u7tfn8Q
 Ye5Dhk.FbfKkXsayX1RWEdO55hHjJ2bZIck3P8oQQaCEaIrog4hm4_zvWWVUqBCmJX9wveNsRGEd
 V_TAsn3A1bSXByumSill9amTGmkQMKBsKMvALxqPygKw4nCnYU_7eEUdUB_Sz6AslxaCx0f4QKoU
 DfHyD1f1eUu.T8eqGucSmlhvmLzkfroEWziXqSXFsmSLwhBhW4qFuLVN9WRSvylbRDzF35GhvYXd
 fLYaYvzq.pGy9N4b8KnD_P8_5eWNlOLiqkoZlnN_t9LX6EkGavMweL6iFg4xGhuwMwFd2q5pgrW_
 K9VDhaPIsmTOHU0GQZkdc6L1ZBseEWUaHP7Vvpxof3gOVMQkkJOfNPDkdxu.C6hXJw.Z4lSQ3pVM
 ndL_dnEyLZ05UPRtVsoM_YwvmXvXhECNrosinsG20FM37HGZH0i2OHIfpLGvR5oH7Q4w0byhasNa
 gzvR.G8gv2o55REKZug5g0ZWVFPIlG5.h2NgawgiOPGcj1uozw4YVYsXnavhNGPW3ReN1wg0D5qn
 l_Z3TPQOIKLXR3_9h9A8E9wNuepNBfKe.Gwo2a7nFb1iZl7Eui_fvRBHt.i6KSLeS37fsbYP6CQp
 bVmfN2pDtitLEnfOrklMHxfiSWbQVrioBPxou4g8S_Xu1x.SFb9wAhtelE1QHBFt0IQVwHxOmaXp
 GxOkIcVM7KZBz7y6X.bf5uulpF9wbuDXeFXh.gdeu6OmA7l41RzvHcFLQSooE_SOGXbhIo9VIx8R
 yM1WTnheWdRLg4msgZM8XPHSlj3CLwOyeRgk05.1tQfrxq0ff0DsMLCzoAIe1AWs7Sw192JfO4SK
 1I0xPDaUtSWvEtNushqP_w4JNKYSr0Jrk5xlLLRjA6CDqKoyT91vxQFxImdXIv.S1P3bZm3go1WB
 Z1CNGQYUFdzRCj5.lpDW2mOD1q1PlU2KYcGj2w04bmhJqWwuCPLpJkNYHEIOM8DXIr2gyJiIpE1C
 zrxySoFQhJ3rXvUTGtFNl7uul9x1Vv7GIlHGn6cwxnehQWhLlbS50LOHphTplzNr9wva2wZWZfeg
 LD3zHt4aojqnQVthJ6ImWhwo7Y717axNM2esBEOB7il0yRhL4c9SDocnJPgWPy8ywJP7fz7u6MoH
 xvO9Kp.XMhtpv28bkPGXY6uyfFKkS7ORFJuI3.boAy4W6g4ZReGbzY4AkicxG9MWgf8F.vNHjnxG
 bmbG2LyEXuZkhtIAk_b3xO7li2TX6wap3lM.QS0ZSRfQ9a7gkq3qFXAH36vmaNpiY06vCN8nse88
 xkvlnDAQsXw14.bYCLkkxe9vN.RymOckIugcUR0FHSD3fI1jB181HOVDNxH.iNS14iz_qV_WIaq6
 EsDajTNfkvvsbGdHd47OQN08BJJP.P71mPLHOckfmskFf_FD.5Y_pDaz3c6Eg_u7sjZg7Yebb1Qb
 PkOuwEBETJHwqr1xJcGfnNv6l4xszOpRcEjsvNZS_2IMS9VlKrTzrrFpfW0TSyvvsc6slvGAhLS7
 qKxZRZzOAUykLvasbHupvs8WiTIIcIpMjr1G14Fr4GVTtJ4ntE9kkMuBzeJKfBaarJgx8XdqJ6sv
 KZm.ePBfUA.0d9SHlL4eRsYR4X1B.ZsjTbWl6gJj0GtQfkcWCRp.debpYu_0K8lWm0jaap6LX_Qa
 xhQl9Z7wEuNyFC4X7SipMNCNqMy92Xq6qwoPrItSEi2Bh7bsi.cOP5jswDh3lcXn58_M3ZbPSYKB
 btvgKfKPFrCPx0JpC72CcZ3GcLrDPAi.a
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 4df0399e-5d9a-4b09-b253-03de964ab6ac
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:58:06 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 70d8dee74b9581b201e5d1fc2936dba7;
          Tue, 10 Mar 2026 21:47:54 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:46:53 +0100
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
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-5-fd22e1a04cfa@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: E03A6258963
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
	TAGGED_FROM(0.00)[bounces-55261-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
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


