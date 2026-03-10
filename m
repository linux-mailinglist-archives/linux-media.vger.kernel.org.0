Return-Path: <linux-media+bounces-55270-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFJmFHWYsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55270-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:17:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B064B258D03
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0897C3266F1C
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C9E3F2103;
	Tue, 10 Mar 2026 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="gwqhTrvF"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic313-21.consmr.mail.ir2.yahoo.com (sonic313-21.consmr.mail.ir2.yahoo.com [77.238.179.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920533F32A5
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180760; cv=none; b=d4qgNryFgC/UVqttZ/uwWBfckfpO6wQ34WtbNteXgbbKkvRKRF0kPW08JaLYSqBbptHTMPJ25H5VzuD5v/tSNNl9IuOV0Ef/1YhcgsH80pWHYXr3Zt7dlpwVKuul8mvkb562mO3E7Xl9A3BiE5JQW6Q4Ntjo2jOA7E2z2Njxavk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180760; c=relaxed/simple;
	bh=L+EIH3m7R3lFfVLWzD1jH3MzWY2od66B43TJQKg4tQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M4gcgs8FCzdlMe3jEdQxjTvNyWQ3bcM1EzWeDb0t1xqa38/ZjsmCxZm8H1yfTAuwo3nCnD6GEbwKCj40Ns4Cth0+e3BRd38u/Ca0Xy7r7OUa5K5a0s1+f/11NP6x76zO0Zu2rtdL5gz8jDBzF59UwVtaqJF3jDFwZs3+/ODRUDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=gwqhTrvF; arc=none smtp.client-ip=77.238.179.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773180752; bh=QFuO/+jvZwZ6DpAYCVNLeIVe6XwgOgfhctSQeFsAzm4=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=gwqhTrvFLd86Y26quv5Lq0lvRbDun8iInoK2N4nNqZ1ZXvW4c5CpnWLnmaZ+S1723eotOtjPK/mmbIRZCxrCFi1wqsBnOngNdBmbEPUNeDtszSulgEcbhlg85ujCTVI7/5+9twJzBXF7fMnU3ynWUL9dfg/9TE2GqU+1yl0n/2+owNWrnOOFbBUZm+Lerll6uCMYYzPci/YGOkmIKIx4572UKqk2CGSaqU852/xQfoMcHC/rsQEYIY7Rz6iJY7G8x3zVbWJmXyfqeIiox6GUPWgEm4p5gqpVljweaZ7gI76c2xi06yqO0XkJGPSwjqMyZQ2er/S5QXcfU7AIsyiywQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773180752; bh=50DWlOA7pxGgs/EL3XBu/16Z/yWHGyOu/37u0YUUl4A=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=rHJCCz3lj4MgBXgkQ7Ozit68KdchwHddSTBNFXRX91/YdUevMApfku/VksM/7cHGUjfNOT/Vg+jhAHFqPC/xbceb6G+meB14gJew/Le/gEAcGfRO/4hAt++t1BGeIT2EptYfU0ZXCEwAmtDo17BWbvd0h9o9y44Zr3BX5F4fUA1Hf5K4K0tx5JhI3xU1ufgR0/qBKW9EowIy6WEwE8gYyrBkLTo+Jlc8hYLrytudTWjmvcHyS7cWKVFN7x2pf34fMhuf+un4GFe+Qy5iSkcw90B38Wdv0dbkzaHJQeR3H03q3TZckRZKTiWHypMVf3mbfM3qbJfHgjVC9NPIVcfGHQ==
X-YMail-OSG: RkTYyJcVM1nz0TlM08eYXfVQy0jpYNzRYximf14Wo7N9548cqmlB92H00zpDNcT
 dgZK7ggr2q1shc9idfsz3th.RJCTAAHo59tbp9kku2EVueTFkyzQgTquvk4icFHVPN3r1vo.VphZ
 yxa7Mun5aD5LCJ1Au9GbUvdjca4syrvKlY5E1mMZrcCFyv8LtZgggYscC6r02uPG8vnNoUef6fJ3
 Qx.6naUwqE5TvvRUgCOyIKe14aHiJNEQAoOvO_Rppa1.FemAIA7PotqjOvQW9q7F9rPdVzd.dPbB
 XLcBnzWn7ASZk7O7fxaCpvMmlw3gJ7Id8H_OT463NLS0_XdVZCpx4.SdIXcITN3SGtlbr36._EBf
 HcLL8ecvTMhvtmk5p6kV73dsrq4XX875U_v7UpM8B47.X_sFvBFkuAWPwXLfEEBrvOqA3Tv4tk7S
 oDIPyhPyzM5PnlhalJimbnI6UWvlcmhm5LnvrbaSwzkol78tuofa4KgiQT7hXomBe3NHHOEOuK1L
 OlsKzgS.PgLAyCnA9w.WY_a2vj8V_DGe4E2dbti0V.v6IOTejGxLe9eWVSC_rEiIX2mf34HRqZkl
 MdpeXifssxeDFNSxhh6D.oYfZEFaljw0K2cXC9ey8oVKx1fDqBD6T3Of3h31kWvfpIWbPjDo.MyT
 f1JdVrx00fOQZeOYOlEbpOqNYpugb.XxMUYNPXGU_6JDU1IfGZsj.MFlRq7K4nRv9Kjtd.W5Q9ON
 0SnCzSzCbhaw2Q9W3LIw81Ff7i.VJlC3GSc2MhUk6.LVdiccQfdiQZwnhf4QI4jhw.fmvO2KtY6D
 HtGlfcIiJthrnb9NRN2aZ67UatSTwN1TMWgrHe41OKfjN3xsSWhKpy8UKJeNvTqV4IU5K_1YsDHZ
 d6RJMoP1PbtbQq_XT8gc1V5RwS2NS1FLAYWjOnoQ8IDiebxYQqAnWebQQsqnRUEGuqqHjbrvo4EA
 yshqoTWUGIqSa5nyR5rQFzllo2F5HioM2xB9Y7qQW9FVgKat3gixg4p0G23LhrpRtOWcaWzwLKUu
 iuioMRDZJ1t5qRsohKLyrEnFqS38cPy0DgmyWtTTnUn0ERdn7bdz0ClOQIifounWSp88yJi5yry_
 M0AKV4v8AZ7.ERxvn0u8tyPBZHzhXe_9ms_JdVYeIRRms5iO52Fo1rRDBRZbors0qcN7lwucaRsu
 m1v5SutVRixyqG2mHzhQ1JAY.NgKippBI3TOSqUkATr2X322e_gnI4fElPWskSoz1h8syA8jAvKR
 wqA8xSWQCswoXFCPwOMm85VpTkB8T84I.srQpZzD3CaWPYLc_BTiPvsTAwEucWCh.WQ2cANJ9XLk
 .H32fd9CF3jeLgHOX7jTbz9JrDkPH4nHyrosSSYzxrElvyUOrlElginzZt52nbhJCy2imDLBAvd.
 A.nXcZD8DDVxV5rconqW8UHW7qAGwkixVSUtyg_msN7Zg7_bDcHI07USse6mdv23MPHQR6oZv2UL
 tBVpNKSaAb_CvGzGE6jZeBSRwABzxTXHFEiecocOMNdjwupa6ocnoRirALCUv7qTCPaQSupG8U2a
 MqGtE0cY6i6mF_viqHDmTx0JgELkxc7z5Ku_YTHV4_AdOROeAvpssNhkb4fGv_rkDhFV2k1fBGZE
 yGdLGT85JOvngwhjyLjqr_IBhc2pPRPPtpMhgW3Vo54d7d.cYH8Yue2bXDt5OgGqVrORKMUoxgNC
 nDz2N8EtbMbiAoJzunrWLY11XSX0PDDJM_3DsfjJn95hyGDwvcbTX72hn2psWfwzBekwcqdfZZ80
 MoDGFIZUynojkELGI4rfA7A1EVvqz_68CSnhLwK4z2Wvugq.Rm.aGgjzjz6Ap73UDf8skOyU2Rib
 imMBaY7mN_hQyP42PwW3Xb.3F25CxE9F2NQjbj2Bql77WyY3ywpPL.Engvo11uKrvHgMszUJtbxy
 sZ506Qmv8Sr0w0eU5k7Lrl3McS4Z.QPyGswEdda.xikT7afJpjm7SoLLZTVIzA_NOfjgs1eev658
 osOiMQZxIbKP0T4h0ngtNmvAUOMRpDuzJm.tXcNZtB1LY.OCuEv8ghjujEluQmEwFw.yw.zvmFZG
 SM8qq0CwjGgFjsHd1o.DJecqx2BtXuzTm9jEycg79Wy2J8MiidazWvyKL7hGIJZxtnBYpa_afJyJ
 e5s8Jl4H0rL3WtE7XGgWBN9Qp89quOTKE1XBAATk6PUjV6rpWHmAx.xF7.13EBPxVkRW.JR3Av3g
 z.zv7QjvFYPDkMu8mzzhdqLnXIka4CX_tz4X4oL.PNjkQW3ywgoUFHe._V5NIr4bOl8manH14U71
 G0Kg8zWy0cXQvPvsg22DX_kyEhpAm
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: d3d95508-1a6d-42ec-91b4-0ea0e495a910
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 22:12:32 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f9947c77cf9e1aeca1b11f9d2e24d774;
          Tue, 10 Mar 2026 22:12:30 +0000 (UTC)
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
Subject: [PATCH v3 07/28] media: staging: atomisp: Remove unnecessary return statement in binary.c
Date: Tue, 10 Mar 2026 23:09:51 +0100
Message-ID: <20260310-atomisp-remove-void-return-v2b-v3-7-f2977db216cc@yahoo.pl>
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
X-Rspamd-Queue-Id: B064B258D03
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
	TAGGED_FROM(0.00)[bounces-55270-lists,linux-media=lfdr.de];
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


