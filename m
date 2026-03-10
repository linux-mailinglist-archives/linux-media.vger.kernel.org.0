Return-Path: <linux-media+bounces-55269-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JjkNneYsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55269-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:17:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4442A258D11
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 295873268396
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D2C3F2104;
	Tue, 10 Mar 2026 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="k4CV7YMx"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic304-23.consmr.mail.ir2.yahoo.com (sonic304-23.consmr.mail.ir2.yahoo.com [77.238.179.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D03EE1C0
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180760; cv=none; b=ps9+wuXi3YWdfAuX/+qu4CLlIoKuwiTiBIXETr0NKyPLTk2nqjwnOtiTmmCl3hc+rYOuUJtfgzrrS7gHO/i5F9ObFAqKi7BhdQalsialW2kDWz1eC54lVSmIphTql32tUdR6g4nUhgvPZBzfeyK2A8Bewf1x6P3A5Giduz7XrN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180760; c=relaxed/simple;
	bh=caZz4HECxPxbScPe3rc1QqxDBZdPlwFaAqJiH4EtrJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HoU5EDkJVxaxh+4913UMLObk/pbbXSIaL+yq4Au3IZ69DgfOOKHD8XUgKgOkjxmSx2a3s+lcaQc3k1RBGXypg7qatf0e4FHyRefDLqsQ6rBAhenyyHRsxGoxC5V/Zq+xNrvmlo9ENFxce28iKF7X+EMQ65QqWwo6EV0JYiUv620=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=k4CV7YMx; arc=none smtp.client-ip=77.238.179.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773180754; bh=SfrPqTlFMNbybXOY58k0ocf22kw0B6UMDT7Wpvx+t3Q=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=k4CV7YMx8hYa3S6Dj4423/XPIHKx16KHUZqC/E1cV3+vcI5OHBQVMbTrGdv6nyoke6aZxIq9Gmfpz10NDCF+NerhbXgfPhTudbGmqT4EuJV8TG/b/wHeM00Ry0xrQbzM7A9ih367ChAks6Wuf5QUk8U8kKse39orR5s6fLQJQBul+OMl0IEtf/vbtduSJ0PbB7WxHxhvZzgW3+62WjgDIZKgGPsJES/GkotcTN2dicq6YvNqq5SvTyYXUJ+Ux47mg0BngvYoBO6c2zUc8GUFmvJ2ovCR1jm0cRkuMPsSdPMyixD4xNW7D8jWh26c6TaanyFkFsTY9xO6FmIm1PgSAA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773180754; bh=CWpH+UNn30ReDC/Fkx72ihqoEByE3+BeOzBxHl3uvDS=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=BRvZyz7faRpnurraQqhQrO9v3Vmc1b+f8V8/RLmh2le5nWzsCTDKJW041WNmG+MO3GUZTAjlTEWPt7lxt7SZkGgFNP79GOGnBtNRR4J9NcHZu5zNx8Atg4e2u94ijIINNyQSVbM13qQpsFg3nCkO219gdvBv/2U/G7SDWCn2ZelzoI9LZAfOQ8G9L5SBUvOOQXtdH2977r/NE+yqyZ3jd2C9QGOBgCv68a0w8GchLDWS/flBOv5srArFIZY/Bq8queDy7uMALQRsvB8ATkKnIx25skpK4KEbq/LAHSipC37tGOZUn1rM9ZLDoi9NKYHTzaHC1U2CHKCUgy3dORKlGA==
X-YMail-OSG: WfyJ03kVM1mHEOdqWHTqwdBv3h6G0KO..MJuAWxRx9ZxuuPfcDJgxDRoTqzu_is
 ZNin4b0mp2IIdHFLLC4uj2n5D8S.2IKwYztSOQ3.brfX5nPXPlmHz2D_Kq3V6illFF7JrkpDxW9n
 b8ocoH79m2CMH34lR3MRKRmSjFgcg08joFEB9cQ6Wye0lWpdlF.Udv8hJnq9N3iTryv4QnwUXDIo
 zEvm0D1PStsG_Wko4AMx32zclk5f3BvNCMOTNDO_ll5aCmCHd.3MX1nzWYYsNU2o_0O7s4zYdGBU
 eN77EN7nJkQvsAoqSBoT_CWNGA0XeVPt2gXzfyJKFXosHjTq1vIyClw9q9vgin_NKCPIk71ZRTOM
 U440hzhrOSP0InGWbLzJ3wQD3ImgD_e92yjQ0.j6Dv88ykjMZ1.h90oN2IFuB2HVYj8zQeXw1ul2
 s.c4d9ZKS6pgIhTcet7fkvvxCXSr6o_vNulzcW1jktesWSXp3SZUXpVAaAft5ODjS9ue.lvM3h0M
 XFcm.sWLPWqvjbYr8Wi4Yg8DNzxvg392CIFAVE_pNIZ_qBl0FRopsXjUB7RcW5ojOW4Zr.6ajheb
 8Nj9igBzO0uIdfYL9vOq5TqRRChnrX7kIz0mQMZt58TJJFEmaBXM32j8cAyMGlhBgwBlakCoGfv.
 onm8NdualsiOslBJfOVpOMeGbzcUG6BnMvfCwVHJz8fc6F7CmaTYgFaNMA9TZcVvV455EXzxnefR
 vunc_fAlMSH92tAb5ZGElfDetwHkaJGobh815cOq4mn9yLYziG8GNMZ_ODS_ytZtqjXJ6f1uw5VF
 DqTlAlo6r53kYuOM0ni3MX1u7vlKZd8oS6kVyMAmFEBruzF4YEE.aILM_zMAzHsCwsNxrqy42hpD
 vLONYdAHnxsub8GWyg.HNrJPD318ufn6sWruERiXTJE_kVyYM_N58CG4DCyFp5CeVFa73B4lKEU2
 dS6.S.sQci8dm420xsqdEaUiq09VTlyzsEsF9eW2YfDRa3uisH3sM7xyM420T.7Q03rFwVefNs5b
 RgO_1k93yXlBgVL83RxfObycaZygSmcB1KS4WCym4PXIfBlJkXz4TfCRtTPAD4oT63dalchdBEbO
 c.Ic5thARFKiAKs2s5RryrJP5lWItKhOwahJByrzgHogSmz0gW2gYKSqcuEw5tgH2MdbBw8zA28U
 N6UHzhS2UCSuWDQjuAw3qkwN9obS6ThXJi2xsp1NdgnEX_cbOKG4iH3R.muXVg47QfM2799WBz_8
 pVk7rrO9ZM8WxcdZ0wPY8Kc3eCjIRVyS1icBsE7k_Hn1Xm4QFdpLNj01Lm1KgX3j_7G0GxdqbTUw
 QlyVSk4OA8DLJDxo55zd9q1Y9pAOsipWORKLMzbpeDJgs9kEG26_08o87u4ckdRYzF1K4KF5pfXj
 z2vgGO9x7s.CNUgRYg3bskiOo.9UNwRJGQaARlEoSFucJUxIuqV5ZoKsWTjPknEDI8fxgesBTfKx
 ZOQ7kdnDfc5P98OI3oJTSZFubSKew2xVNFq_y_JdPr_GhcIbIktecWgA4ra6Ihef9mWeflyC62vc
 B.1JfriZ7iAzU56VZOYi7rlm.rXtt8b1h_YwzQVFZA3BLMNSrtQIYY6GUjGw0bcABv29Whxo_4lg
 1UXzAeyNFUcAeCeiOJLreyiqZocgslOSOKdHyH9qfS5yn7H3o6QAh6M.ecqQtCB8xbOMFXmO9zgg
 GoiKCg42mnnZc9uAFjGLrHeYllvOUjuDF4SfZbpop2hrgTXXLHS07qQ8ZPS2jl0mMonbphWg2SM7
 KyGect7t33jJUh1O35zw8B4o2hM.yMyJLGFn7ttD0jn3iUqIy6lNG1Q2vhhzFZP683sRGU4Ani53
 NpTOnpD9lFwHo3Ne7KDv_VnPeU6isHXWW0EzEbgt3rURJHLBCdCWQowVGX0mzv9EP7FQIlgZaA5r
 BTAPgcpZ.uZtU_JGQLvKolo6tym1z555wcQDVgdyvmzIiE.DHeb3J2TS4xp6MC_SZqhcHGj8ufzs
 4zZPYD4_YtdmZ_S6lZfiednHTfnhh6kZRjZsyPEnKxYp2eu0WUe1Eu.CPo2cWA5NK6s0GHqIVWxN
 xektFw7ZUDNKtqElKk0O2o7Df2zf1AteIaBcPsHFPDd_Lqi43_Xcxm3r6S36iweyLyDdfigmuS3E
 tHhcWlW.2NdyiLUgv.VAEDASSvb2AY0vnHTFbL4NdwyJk5Uti_ykxmLV6jhzjJgUMehhDzu.WydV
 ZHpwGFsstRzfwmXv_nb.hHqvdCZBQ2w2B4.ZhyIBaLVE1ef8J.HItFGBDC2hPd6rc5JsD4i5WgZe
 5z13MrI6jb1Yg06kIpDWJJ.yL4LcK
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: bc29e28b-b1da-4d0d-8e70-726d135dbc5b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 22:12:34 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f9947c77cf9e1aeca1b11f9d2e24d774;
          Tue, 10 Mar 2026 22:12:29 +0000 (UTC)
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
Subject: [PATCH v3 06/28] media: staging: atomisp: Remove unnecessary return statements in rx.c
Date: Tue, 10 Mar 2026 23:09:50 +0100
Message-ID: <20260310-atomisp-remove-void-return-v2b-v3-6-f2977db216cc@yahoo.pl>
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
X-Rspamd-Queue-Id: 4442A258D11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[yahoo.pl,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-55269-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

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


