Return-Path: <linux-media+bounces-55253-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLV/OgOSsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55253-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:49:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 051352587C6
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 124F6302E746
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8433F1671;
	Tue, 10 Mar 2026 21:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="OOXXjtmq"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic304-23.consmr.mail.ir2.yahoo.com (sonic304-23.consmr.mail.ir2.yahoo.com [77.238.179.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C69F3F165E
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179372; cv=none; b=X6YnCmxw6zfv9bGCzZY6xRlERmZIKwgkHUoqx3vFNDfFRwK3vzq5NETJpCDTMBsPGVy0/XNI+hZn0hA9PvdDNAoN32RImjueIjikBJPfcYBn51ynz0MpvkvG56S3ATfqCIsgVZ8qBngoHh8beYJVv8aKrKRJdFfpuujnVVtSzbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179372; c=relaxed/simple;
	bh=W7jnxSxFUjmvj8D6lZwHZcVZbKCWfvIENbtgFL7P2e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WNRV+D52mHgeaKe0eXOeRDJJUia/V7ZkLrDnpUWY/JTbHQ8eJvgXu0B4iaR9e3aM7pXDTvvH7hTtjMBBEvTEYE0qeUr624G8+L5i3U3oMNcVZx9e7zeRJT+7HlbB+yoC43dmLG6DejcvcNu5d1TYTyOCvOtvs7QGSKCbUOOJQ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=OOXXjtmq; arc=none smtp.client-ip=77.238.179.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179369; bh=pknoANi+IeCUd6T8p38AbnWHQI/BREFpmMlQqUR1Yq0=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=OOXXjtmqD/AMtCGd4z/VU1pjNk14BeTWs9qIT+o79WsWDDAMRR6E9fg0xZyEzikvd88IBfpX3y6xUUjwOi5rwcmpz6M3i52FHyuuGpQJ9ekj4RDgb07KWSA75sOikq68OcvGBVPrRs1Mp1hFxY0Bqaveccbu9Aba8IQY0FTS/hy4/EA/40A4xGscFJHsw93l8M9E5a18Q5GCNfuuIltb/pTbO4REjmif5pv+BhKSrpzlA3KTpHoT/5rr07ny6JaaerUU9izrGL6pvW+xeXVFeUZTT7xZVO/z7ytFoYetkLafg3wKgGqutBht8NgHBNhuBaGU2cm4SqKAgMTZWFldWw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179369; bh=75do+DY6jjNjgWqUq04FJGhvN5PrOzCBZWeQSrT8RpV=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=W7r7/eQSGHmsMoaXucPn6Z6Tu3vZZKD/kDLkUhemq8DdomDiHRcRk+FJ57in1PPg2h25kEzFERKHKkLNKdRyZOvIdZHOeNd8joOOJAoIhiSaieUutDleFgBrVjIzm4KYiuZyTSL8xJEqHkp5RUi6XGLbaHb3TlBYLQtj3LF6hcVMpLsrm7ssc078DSPVyRAgFaNHZf5CK7XYaJ2mOBBLJHnrkVTo1H97TzuOGgYYUY3M1AAA9XFSqOTWG+b4IK20eYuUcNRl7cTeIwmpOKLYGy7s+inT0vMqg93cVg+CUnA63uZ9nT8wB5vvbRbGPCThdcgxrHp6BPVoS93fmn5Gaw==
X-YMail-OSG: vG9ZjlIVM1lcLOv27GRnf12oyVgYaxrWShsITAxAMm70wAP3cF2xJUPyEA0ZfDA
 ccbp1jyb.YU0z7RqoLWN6pk0sV28.hl7fuxMXwXj5fWuAuow_BtmFIA_Mpd2TVB5bZbMXGi1WXBR
 Mm7IysoJ6I1vPPBslktwTmNDGQ.abkfxaNhwQB8bixJyRtZInb4DZ9kkN_n2TxeO2u4MXdBstASa
 2RZZw7sx6jKnX3iYFoyg48OVy_16W7YNjm0xzxnvGDV7sMF9K5ForKtJBIsmvYyf3LadwtRAdiSa
 rBR8Awhy6mH7eYOOLiFcY_LGjABzR9hkPC68kUmP6fUYz2qLz29pIish6QJlpuTD48BYbQ5y_8Ll
 7J4MHLZJY._jXLpozViTkTr4jzg.mMOUgFXBZI20evVHVcvG.WmgqJYWURbVk8Tk.gsQ99qsZpXE
 vbW7hPt7VUNRm4i65G5pkjLUCmGgfoV4o1SLqqecdxfieeRHy5qMOIESpXr2r7XqLHreMymdPsZc
 afUYQRYD9pjA6klc2q3G3cMC5mAegXnD994c27G.kKk4WhwPUwXoQSKqRPNNx969M4nRPx3dK_ew
 kunuMXXgycnywnkuzkWY6iuS5DbpGvJ6cvudC_spbFEnLx9u9t3Hll48eEWvNUOahR7k3r9AIE.J
 _DT.1u.NmjpWBEeqxUEg6RJo8iAxJKZ_FcFe8t2rjY6Wzl6PDci6NIvpkWY3t92WVA6IHRUITZKO
 .E_9otaoMLMR7Rc73aO95Luo_3znp3OHE5LKrHsZk5tNxmjva1C8VRasRTKlcT_kDWvA5X3YWBK.
 P3YDY6ZJnKB63ad5G.oWwCv8ToImrgiCnMcnbb9TZyAA1E7FiO9dBsIkowJUqfhvvk63pjTLnmzf
 GMIcrY.raJOd_ZIH7MfxuNSz3MNoojXm.heizQr6c1aJJLiMbaBVd.CdJUiJ5OBubutESkwHoxNx
 Xkq54tfABNZoSBsTmRIq4gBIqYt2U1lidLlTsnaorx9PozQMvOgahAp0dlZEg.iDTI5dIuImXOso
 5HzACz0rauz7ouWigP9ikyyOaxjXgZMahnuAfNfOJFilXKFvcFf_KHMxWOa.48kHTPoIdSG6t2QL
 Tr5qjkzZjHWCqKkUFlVGo7eH0Uab2d1jdBi2R2BmijR1G132tj7PRfTlOT8ri3WmAxFOYsmfbLGV
 820e_Zz4jcXQCk_HZv9ItvGIbr5fFBlW7GgRyyv0.ulTX4sX5wk7jhK7I_4FpTja5rcZYCrkaRnv
 EDCCDsN_SQEdl1PtyL2aejYZfz256cIFzkXT5iZCZFBRnC7y_ZUeV1Xn4YO.wnURib9BELZLCUnl
 tKFKycOUMOEZgDJqt39SPGb2whuLOqYouYOoxJQWGysdO4h_4nOweyqEO1h7ar5TeHAoTo55tf6o
 pe.CqVN6IevzBI7gEyWGGPEQnaPciqwmVZr7EX_VLppMlVhBOcF.tlxMvhtx0hMUUcDhZRlYUhsw
 cwKE8QdopyQZI.oDlsoI28UqMZ5s.vtis9Ew2Zl3EoJZl3xqIm.wX80UT142a05s5EZKqjLqt6l1
 2uBSnojJdhZb9CcD3F1bgplbgh_dduigIgS.X_9LX.8dH1Cn968H0yHZhnbct7YEBVeWb2vNWA.b
 BBjdnbQavE7j_5A9DCLpHk09arFWyIyiqhv35zL_sf3FkpthYn9c4CBYveqruhniNzwDDyqo1hDW
 bttUkZzOd.2cD96Zhl5ixLSHehg58rGUpjuUqi3sauKNJF5oE9A.8RxXG1ZPqAuzNsubyR09.zEj
 blk6UV5dDKHN3UmPGDR58Hh19sI.TKBfBhXBx25E7J4C1PxRzeL.0NBhi5mmpClXrMh4KesoNluC
 7YcOZxnmnOpsQpm40iKsz81WPSgR2IhwZr7WrSMslQW4Q_F0jZhoA6FQGCuj0XJVM7Ru_f0xQuXO
 DybaFRqdBg30nD7NNS5CI5PoBTqrgRpr8h.iAtNzoNkbyXlwu4EWkmJ2rOL2vTDlsTrJ_Xqlbl7z
 iRv.iCUsFKg76U8d3lHkQ3dj25At8KlHXYGECgZdqdIPcjkq3CqXksjjk5koNjbsmUSJIdeLC78r
 gWFgSvbJ095fzuGtTLFr71a5QHS_.oFX2H894XQZPl5k6CUS5XsnoPFyIPJmAmVTLddiGI1vQKpd
 wlDGJQymm5UoJns_Rqy49ebit8gVHAPIgWNgJqWzU0JVxk4hxu42IJTqHLB83ZwBwhwTz3GQDP4M
 NLSnNd3chfUHkkG_RgMEt9wSq_AKiSIewE3yUifaeQSeCgxZugwxbjL7JabKvMQz2L7tRMsG7dj3
 1j0j8sHrv_c7ffFqsnE_HdQ--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: a647c206-26c0-4d5f-9de5-befa1f6713ab
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:49:29 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:17 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:13 +0100
Subject: [PATCH v3 02/28] media: staging: atomisp: Remove unnecessary
 return statements in inputfifo.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-2-3fdddab41271@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 051352587C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55253-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Action: no action

Remove redundant 'return;' statements at the end of void functions
in inputfifo.c. Void functions do not need an explicit return
statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 .../media/atomisp/pci/runtime/inputfifo/src/inputfifo.c  | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
index 8e1efeb6372c..f0dcd839e33b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
+++ b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
@@ -88,7 +88,6 @@ _sh_css_fifo_snd(unsigned int token)
 	while (!can_event_send_token(STR2MIPI_EVENT_ID))
 		udelay(1);
 	event_send_token(STR2MIPI_EVENT_ID, token);
-	return;
 }
 
 static void inputfifo_send_data_a(
@@ -98,7 +97,6 @@ static void inputfifo_send_data_a(
 	unsigned int token = (1 << HIVE_STR_TO_MIPI_VALID_A_BIT) |
 			     (data << HIVE_STR_TO_MIPI_DATA_A_LSB);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_data_b(
@@ -108,7 +106,6 @@ static void inputfifo_send_data_b(
 	unsigned int token = (1 << HIVE_STR_TO_MIPI_VALID_B_BIT) |
 			     (data << _HIVE_STR_TO_MIPI_DATA_B_LSB);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_data(
@@ -121,7 +118,6 @@ static void inputfifo_send_data(
 			      (a << HIVE_STR_TO_MIPI_DATA_A_LSB) |
 			      (b << _HIVE_STR_TO_MIPI_DATA_B_LSB));
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_sol(void)
@@ -131,7 +127,6 @@ static void inputfifo_send_sol(void)
 				1 << HIVE_STR_TO_MIPI_SOL_BIT);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_eol(void)
@@ -140,7 +135,6 @@ static void inputfifo_send_eol(void)
 	hrt_data	token = inputfifo_wrap_marker(
 				1 << HIVE_STR_TO_MIPI_EOL_BIT);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_sof(void)
@@ -150,7 +144,6 @@ static void inputfifo_send_sof(void)
 				1 << HIVE_STR_TO_MIPI_SOF_BIT);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_eof(void)
@@ -159,7 +152,6 @@ static void inputfifo_send_eof(void)
 	hrt_data	token = inputfifo_wrap_marker(
 				1 << HIVE_STR_TO_MIPI_EOF_BIT);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_ch_id_and_fmt_type(
@@ -177,7 +169,6 @@ static void inputfifo_send_ch_id_and_fmt_type(
 	 */
 	token = inputfifo_wrap_marker(0);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_empty_token(void)
@@ -186,7 +177,6 @@ static void inputfifo_send_empty_token(void)
 	hrt_data	token = inputfifo_wrap_marker(0);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_start_frame(
@@ -196,7 +186,6 @@ static void inputfifo_start_frame(
 {
 	inputfifo_send_ch_id_and_fmt_type(ch_id, fmt_type);
 	inputfifo_send_sof();
-	return;
 }
 
 static void inputfifo_end_frame(
@@ -207,7 +196,6 @@ static void inputfifo_end_frame(
 	for (i = 0; i < marker_cycles; i++)
 		inputfifo_send_empty_token();
 	inputfifo_send_eof();
-	return;
 }
 
 static void inputfifo_send_line2(
@@ -297,7 +285,6 @@ static void inputfifo_send_line2(
 	for (i = 0; i < hblank_cycles; i++)
 		inputfifo_send_empty_token();
 	inputfifo_send_eol();
-	return;
 }
 
 static void
@@ -377,7 +364,6 @@ static void inputfifo_send_frame(
 		}
 	}
 	inputfifo_end_frame(marker_cycles);
-	return;
 }
 
 static enum inputfifo_mipi_data_type inputfifo_determine_type(
@@ -453,7 +439,6 @@ void ia_css_inputfifo_start_frame(
 	s2mi->streaming = true;
 
 	inputfifo_start_frame(ch_id, s2mi->fmt_type);
-	return;
 }
 
 void ia_css_inputfifo_send_line(
@@ -516,5 +501,4 @@ void ia_css_inputfifo_end_frame(
 	inputfifo_end_frame(s2mi->marker_cycles);
 
 	s2mi->streaming = false;
-	return;
 }

-- 
2.53.0


