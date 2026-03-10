Return-Path: <linux-media+bounces-55248-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IeNAxOSsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55248-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:50:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 704222587D4
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91CF5322640F
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BB03F23A3;
	Tue, 10 Mar 2026 21:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="eeSlf9a0"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic312-26.consmr.mail.ir2.yahoo.com (sonic312-26.consmr.mail.ir2.yahoo.com [77.238.178.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4526A3F20E5
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179280; cv=none; b=BeBoA2H71hQiZWG7F4J+L+Pz0C2b4rZD0pqtDIwuRAWCT4Uu06kyXuYvkLDB5C4ZDktFyaSzFBPgezdzLZqPinB/9eVZRe7eehSDtpTanHphKYGwrTBTEglbILU1GdlAxYTUvv8i5+WXG2uHknnXwZI9oQC3wPYk8dscTMea53A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179280; c=relaxed/simple;
	bh=8iHGsbN9sH20YKMQXPk/VQSNTzmpdCOBvnER7trJfNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rn2xMMkyoQqqDhDtx7vrEwCE6YkAoSenIeC6gXRG8Wyy01RO3MJmqsHcPUM2IVwgYRgB1wFYbvBeKcJROkolE/WhY+9UZF+5Utc9k91qsB7t79MZeYQHivacIUq5fMugLixmhj7UdbDeYDBAdm58BEZfNFX8MVspUPBRbvwag18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=eeSlf9a0; arc=none smtp.client-ip=77.238.178.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179276; bh=zdYQicZqGAYZo+KYeBJvn1xAHJrkDfV7RO3PZRq+1j8=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=eeSlf9a0+sp89JZ0gjrAd6Ed09PRpk2yqxuDMfx7ukliz6gnMfX3Px+ICtDOlbdYeb9dOQYhsTz/bS3b2MuXSbHLJPp2T8YFv1cc5rZ/M4cHNbkPeo3r+TjnNnrwgCL3gUhwFLbzm3j++CjB7nozE2fpjigUMuG2txGpk4Iz/yiqBuLRo9FllQebCpHaRd/lGIYO/dzr45ylDzvy81zgUzaXgVysetHnspotnNhK3YALyk5KpNsLmJPo+qD/gAzLrMDYMsfumGd0y/G5W8T43xeBNq5qWuYz2YgOO9gcGMCDHasTJHe88oanmhEPFTTmuJxFcbDX9vpCCtZTfKl09w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179276; bh=ReRqg9k4mg2b9W6jb2tl+LlXZIPCKb6mV5gdKRq1WLg=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=CAe6VpoA4KRpBnY4vrQM5Jk+Uu3tE+AEzNLpGzt0a8wDJ0A0ZwMqkPns6hZdHGshjahVpPLePr78klGsaEK1Wf171MOZxYOeLyaHwVAbO+SrYCbzZUwM7hgcEYvTyKQd0ylC2TK2au29fXvO9P+6i/2zrMoFmZhwugnxi5mcRPDPljW/KKNy8P5iVU4w45XrCcoo+jwDRYr5KlQRSpaYjyCyJ7Je8PdePgCc14Dd/zmLuG2xf03W6s+IJMj6DwwQrchpB4BNcubGpJYZe5tQCfhreTsjs7QWDwkUiyCLDB6gIj24ILYsyrrpID1+XPIavJjHojBXEseuIINdiNByFg==
X-YMail-OSG: h2PxfnsVM1ll0ZQ21A_WCjGLp_Fym4Hy.P9WS6aBFpVKH3vB8t_IXb5IudCPq05
 Wm009IDKXcm0ctk_UiJcARtUQuDkIJwDDb03fOF_5cBHGG_wbO_amyrZtJ2VYt7EQgmi28nKPxNf
 K8YnAVNTl4zYAxPwedKb3QoIOFT5X6b461kcYMyIDOdW0i9Onuha2sfoNWlHSMlJ.H7.QXlKcKOI
 hngSpQ5iup7Jf6X.aXLFIKzKHL_ZuScGBMyKa.HGYmyJb2y59pF9B6Z_NW82kzrhqLWuhOF0uuFx
 6QitYC2KKWbxWExycSVTV45xuU_u6nW3d6Qvt6l6J596ng2DIO4k9k17ANjYnwRkwz1VUqnfupOY
 jccfk3s6xgonpp5y0sZWpmM_dxWgyb5dSzD9Y4_jyO.o9WbvzShM6LI59JyVlLyQU2kPFe6iKCKU
 fqn5TIXfzD9KtknoZ9Jcz6PpVPU7lt7GB7JMnXBWDRz2ek8w7NZKjwUeNo2leVNNeB3j4IXrV2yp
 l7.NKpdKTRqbHZK81S48IfEonsolfDCYowY79IB1vwkLjrGp_lAn8jVW4y8C_KT6oMuBxBwQaElr
 LcKKdpzvUxycHMR9vQ2Hhm3N43j4zeHDA03IHAj6N4nB__f.9wxG1OVQIn_trQXiXY5qwaXC7BIz
 xcHPKix8KKvNQBTitYAUzNNkFqByrFuDhPrNEVt9droguOOtTQyWMnL54dzlQ5_Zgd4Zw8uqK.Wk
 wMFMojcsShao6BdASv_ulzD6Uf0qdjp9O6R6gI7t1vLyJH6E14DdOLh.IuUupQDRAgoQ_X.mw2p0
 PxPMYZkGcN6wlPxv83Ty1uyfUu3M578ZHLgd50ZRw0XzHLOO31vAWpueFlkEFxtc2VFinel_5HQ8
 ENtKJlbeHFBVbsIK5Zlou2qE_qbc5K9MwKew3k5Yaca66bCe_fQ59AiFgwedLVON4shg77s14I.I
 aSnMjLlnv.WkndTlILDMy1JLV6WF9U41_N6QwrEnDZE491yOPuwOl9h0gNcc2E.Nal3BvbxcKii8
 UrBKNkME6J7sgBcZzDE.GweaZoq8h_2bxMUZ19LwZ16ATbCnIIHwudRvxl32yfs891YW6BuTqIVX
 ymkl4m2JluHg.DYJuqfLa2J_fv9CghPg.7SaZ1o_5wS4Ro4sVuXtfK6PrVr0dfCEwzoRpXkBIGhq
 fL4ZR5Gf21wbAuuJc59eB8tsElEWmffMzXWFcR2iuLcGwrmEGQxRpFw9f57vlLEszU116KTNhgZr
 KKqMXSk0pa0IqYZd9wo5f207OpEAV6R0WRWYoOfNFhqOdaNtbtaQ4yFRTrW8cwQ6I.qMxiXLDoHh
 D.8IIZFt18adjTAGWgHc6kifOAEC89yyaEkMj8JPwduFFDfnsQoUWSIZ.c3Rz3eICP_CGkWHLbT6
 Pbx1TNwo5Msp8aZW4ubr6cWweThKa1c72MUzslCwP5E2yCnWxQQcUoC1BOad0WLmQDSuOZiaN_Az
 4PuAp2WYXEw8fXCUlKzNO__i76oaEThwngH3778K83KsGly6.fFwjP6c3CXyK.dzbH22J.d0gPIz
 Ig7h5Htxibg7CRDrUJdvQ3VoCZDMOeEKTAOLYkNBcYld2Dvi.hh53lRcjH4.7cUoMaXIRsI_XAKf
 o3DrH0OWRHUrLaJbZ26uwWE8cUo2JJh9zj0VTWp8uJPj7HIsX6Kf7FDLnxjgJzTfDJmnTeNlYm.5
 SxHFKkC7Xwv5n..SAnfsoUjKU70imfg3.SI.FqorXLQtz24mz8Nw6YQL16FVYca.hbYB1Kf8vRCb
 LdrH4HyLsAO6mJKfjWS9TPoOzXCjp9ldT5dkpWNJnsI2iaaIiiSjC19QV5osFnQ6bEwF7bl9Pomf
 bkgkO1qV02K1yD4NHLLeU2VtKSJq8_i8qmbFRmS617Bj70lNql21StyOWwbjeZVgVYA.mtUXphnk
 HMcKM1nVbNKfK_dLeyG89RUyC7t2NcCWcZ5IelktLmCIA.Lzpl6JwX5axG6h9NndHAUIcn5vTuTk
 9wQYXo4sytN0bC4848XN2UGpdRVe4mmk0DnF_kLozArrPqUB2ytfgS8WNPP.0FWzp_4lKWqoHbdx
 vDsDDqPgLJa4rxD58Y1V.aWnMb39WVIJVJnQgw5NtLAjAiFW2ZO9vy1sbJPqhqdnf57FKid_kMVc
 PZkhAuWFgqrnUYjNHDqNYbUJVudhODjOhtXVEljiVGD8qv29CopVHX3ZVOibYeiVtafgu2jftwfA
 1YAe5JPyZSe5dx4hvi.OQjIO0cOojgJRerg_9RBxJ8y.29EE10g1gXwOH_3V04zRPCQ8a_49kCfn
 5j7qHWu6FZq.Kl8j4lXO9vb86fY8puPXS
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: ca59c0a6-9987-4bfc-9d0d-0bfcbab4e352
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:47:56 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 70d8dee74b9581b201e5d1fc2936dba7;
          Tue, 10 Mar 2026 21:47:55 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:46:54 +0100
Subject: [PATCH v3 06/28] media: staging: atomisp: Remove unnecessary
 return statements in rx.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-6-fd22e1a04cfa@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 704222587D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55248-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Action: no action

Remove redundant 'return;' statements at the end of void functions
in rx.c. Void functions do not need an explicit return
statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 9cfb8bc97e24..bf9be11335d4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -44,7 +44,6 @@ void ia_css_isys_rx_enable_all_interrupts(enum mipi_port_id port)
 	 */
 	ia_css_irq_enable(IA_CSS_IRQ_INFO_CSS_RECEIVER_ERROR, true);
 
-	return;
 }
 
 /* This function converts between the enum used on the CSS API and the
@@ -197,7 +196,6 @@ void ia_css_isys_rx_clear_irq_info(enum mipi_port_id port,
 				port,
 				_HRT_CSS_RECEIVER_IRQ_ENABLE_REG_IDX, bits);
 
-	return;
 }
 
 static int ia_css_isys_2400_set_fmt_type(enum atomisp_input_format input_format,
@@ -638,7 +636,6 @@ void ia_css_isys_rx_configure(const rx_cfg_t *config,
 	 */
 	input_system_reg_store(INPUT_SYSTEM0_ID, 0x207, 1);
 
-	return;
 }
 
 void ia_css_isys_rx_disable(void)
@@ -650,5 +647,4 @@ void ia_css_isys_rx_disable(void)
 					_HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX,
 					false);
 	}
-	return;
 }

-- 
2.53.0


