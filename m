Return-Path: <linux-media+bounces-55242-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKlYHtyPsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55242-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:40:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D28DE258677
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F331931DD899
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110893EE1C0;
	Tue, 10 Mar 2026 21:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="i2cWHNSc"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic307-54.consmr.mail.ir2.yahoo.com (sonic307-54.consmr.mail.ir2.yahoo.com [87.248.110.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C322701B8
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773178766; cv=none; b=XvT159GglzQffKMsnQJSnk8gXrCJX7LOsxLqKchx6f/dmSBjxVl2mf10p0KkOWyRFpOUn9GJ3uI+hgSgQ8wOVG3bg8KMedoG1MvE5/ZOUuQ/UeTw04DNUagX0RjgIt/rGkY0cRqNfiJnHQs7R+bAYdr/rDow8HuO7bna9sYQo0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773178766; c=relaxed/simple;
	bh=8iHGsbN9sH20YKMQXPk/VQSNTzmpdCOBvnER7trJfNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZyqBBoukXl0GMFSUhVttp41AxreMga89wCbkmjB6xlFvQZjlvpb1VAWbQ76agj9rRXH474YxPylLUfra6uQfNcWmLhuJmEXtFGE3Q9UjfeLiXtfOKtwVO7JprdhrFHxUab7Dc0joWH1RCmv+AGWaIa/bbWqfHOl0HIJgvumwkhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=i2cWHNSc; arc=none smtp.client-ip=87.248.110.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773178763; bh=zdYQicZqGAYZo+KYeBJvn1xAHJrkDfV7RO3PZRq+1j8=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=i2cWHNScUZu9NCE+2krBMR2uz+hCEfllYH8q3XHdb0sK6i+s9oeqd2gz4r0wZ5/lTRpXN84lp+iWyGzn5/ZPux/IEnicxZFS6C5vN3B6tlMeMn75fI7hntIrdTxqrEmE6nFgrr7cnMlho+a0YzDkaL51NxffQm4iVfGusqkKTF5gdPk8Ra1ly8/uy8fFWYcJWKQpbPGs9hTc9btUzQR5zNFOubLVfSlmgGbzWsJusNGPw+V7+WDx+Tr/OFpy6Hwjy1siyr3EUJuGd+olv7oSrnIg6k2ukGLX/yKct6rinMCj7B+OmNm5RhDcd/NasiN74a2+AZJTWk0UzboV1Gr0PA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773178763; bh=HJ00S1p+uZV+SVTsEIjXs/8xmHrCLlScPDJkiCObWJV=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=heVsEbNr/v8DckASfNMGUwArTzva33M+7LhEsJ3HQ0lrdPaZ/n8tW3G8dam5e9vIn99XeHPW0tRCF2HFu3Kxf3nu4OPWuuHKwQLajDmtzZ+fAvRPJu3+8ld8uETw9SgxNJtiVag38poJyv+GET02LevYWqIo9HZ+63dxfN4nYzw5O58APzf+gLDIrP5jjbPKqwfmhT4aGmyB272MY8kQspAGDYtGzJIDlBZZSYCCUMHwmSO8SSaOUE6YMFcuLfH+AGR+QJ6N+xLSVnpHQN4yAwDFLdceiA0W7SnFfIf6k/wl5//rOOkR66akuiGdpIqpYAq7k51zYal2lCzaVsJZOQ==
X-YMail-OSG: fh84UaAVM1kyThQkcIMeLJrhBQbpH9_.uMblXR0ZTqsRSMtd82mJYyhBqiramXj
 .d3KYeKuPDzhqLcCFO0vSfSN772vflgeMfydLUhKuW1eyMbhYAPbB.8gGz3Yt1UjtPiHttCezjp1
 5ZUXCwzZ_tm8fiWDLbzcmXKa0wujIpSwQXNBrVaj7pxvFJ3MRpC8QJ0XbYaHnwjZ18K3plRH24LJ
 gAcDo3Q7IE66bT7naKRImnmVMdeJrJnQRaEhYjwzrS2PkfMJeAh2LYZHZykN93JiEieOAjs4N2Hx
 _EJYD2peDZgUhJnzTDZIEXr8B4xFsTkqCmgcl2u3tLqvReL99FQjdNP8fVVxfw_ibp4q7O0hVUTd
 z1bI1umvw_flyVduLOHxecDo4YBSvWIriULocU8ewFjo0Kgeg.mbjt7UdjoLqaIMGPkASgcURv22
 pXYA_yg8H5cPzRQLJoInQoSnQvgRnx19nkU9tnN01Y6o9knIC93qTD6JY6rl_p6hTPS4zVCPQ6Cy
 kH2zx8t9cnv.WMV88URx6u5.v_J5gjbZXrRcbXHmBXTJ3jwrCx7Y8DqFZAKthN2cNSy98hvR6ygI
 GiL8joi7dRtwFMHdZLtxPmwpBaP_khoP4oa8yCThqC6_TQYB.dcZpJOXNWmSZTps7Vyv25_XFCCA
 Dk1y9sVyANouozEdhuViQpih6bD3pPZh_tVA8Qu6ZsrDqxoOYmuY8bZ.dUAxXu4ffrJ6MzdEhx3n
 WJmFlSiaxv84.eolkBU2i0A.7al0zAg2W0RT4zgNftVo0UIMNOD0PKjIkArAlLz0hE2_XGmURBnT
 ZAycK8mq3Jsl902anmBkhdbQt6lk6dV4G_CQlVRV8O5bvDeGEzndbReFKLWdM2gVoBAdpRMWoJoX
 5OWkk2g5wva3Ski3VlGb9KjCI.gM7sBJ0rcC3eERrJcjd80N_6M838r7OKpWECNlstmH3F862wok
 o2sSR2ZKyLcm7ayxTyV.jqNKclzcb7cT5z4.TQuLuNnFVfXqz.4gRUQrgLMZMAVwF.hpaVEdrlde
 tIbwi8N_Fuc5H8a2nERSnwzGo6LwBA6AiM0AJubydneFQNNu_rpjuS1isEqRs_2tE1.4WuoBGWWU
 gImKeyUmiuO_W16o5ohmfmJgfNXR2sZEpedEXkYBaU5UHLSeyTzrQe0T0_84_XMQCOLLqAXBODU9
 9FODo7JXSV7TX.EEqQ1D8OKYj9dek8r9HcRGZdP4lvW7O38ibdIsdNnj1TeS2R.k.p5yejsLUnSd
 y93LNQxIGxtJJ8nogoXuaI065WqNxmBC6sW78CzeaXlDFpPqCVwmBYXbuk9f7rT540Zqwi8sQizg
 VflZ8wfVfcdp652Kw0XBI4e.4jJNzaBGxrTjDPCov_wfX2KluIQishwciDsnnZOvDtnBJQsPft_V
 AhhbBKAPNC2u98epThtINiKBknJvkFPlpd5XdY6Hn3LYboZlYbz1Hnm7bqMyXaFqv_fxCpaM1MSN
 p.ih0KSZzlf8WDJpYQjNDW67yznwEOYwGPfACigzt9yyAL8AJHZUGTsarwb8OBTSV7kK5gQB69NU
 7T.GDcs4k8TVUq74A7nndG3S8WYqsEbMgm7GWjGC0Ug.g8W4I5dPpupNp1UVcJl0XuK2YMKugEbV
 enO9S.2apNVaHoiPrC.gLntJQWX53KdO1ERynO_QPFEHVBK8M3kexvCDFvU9nrotUODwlXgccPTr
 NB9JoQqD95IttxAVVgjfZo7AUyB67KgZb8r2KBKXI7tzaTomcGB2lPfEFBjLZGfWrHwAReloegM7
 vdpOX6wEnOMbpYoXOFjvVbqqFgHfbtt1zoH82yzTjDqCz33UIhEXKnKj8rPNCFJUZn9WpXiujBdN
 zxycAUMLQgF80ZMo2bQqvv6X3jzwNtPUA6IdP2SqhiVNUqTpBFGrWFCuxiPRDlZaNl6Dm_SKc9eI
 fJhtaYTvYF6OerqsZz7aA4usMMcbB735qNgtZnlR_9_4JcaNM4SPpeCyQ471HlV3LvtIQqTeU2e8
 sHx1tCndPTI6W6RFygNzjvjYqUXfL6gqBuRd8I9b5_3o1I5pLlAVMIfMno5CiKZlJfHcti_0Z2gs
 9LKpjKuGGnhTi7ja6Q9P6G340ZW5FiZPA6wy6_ozWOyVj8FEX62QiTOwTiOUPzp8ZBl20jvuuaA9
 6XTpm4K06tsDcgIOf_OJzLHuEbnwZYYzSUD5eQBAKjspnTXMn4hN9QCjY9UCCrEMNuUi5pzZu0Ud
 hQiMyxDzZR682KoaaJaUJ.WHCep6galS.xXDG0eYdyEyReZD6.h5iT44N.yH2O75qGp15.JDCKbY
 1ApqXOvkdk0kBkXX2E.zndS0-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 45ee7f7d-3d77-4dec-b09b-fa371c99e505
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:39:23 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:21 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:17 +0100
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
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-6-3fdddab41271@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: D28DE258677
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
	TAGGED_FROM(0.00)[bounces-55242-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,checkpatch.pl:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
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


