Return-Path: <linux-media+bounces-55247-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEbhBu+RsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55247-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:49:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADABA2587B0
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 080AF31FEC51
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CDC3F167C;
	Tue, 10 Mar 2026 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="i/+X+3Xx"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic313-21.consmr.mail.ir2.yahoo.com (sonic313-21.consmr.mail.ir2.yahoo.com [77.238.179.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1E73F1667
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179278; cv=none; b=f3rVnPVMX3iQqlmbCSlapZ/Zi3BfePEJzGpIRO2L3MaLcB0xSfCsmDI9KEmubVABn2YjSY1Ug1tz1/dppvlKWKo1bX7CBzAP4Y8r2dQinUpiCrRb0ppYR19Anbu4hZPETrV/4kJzYIXXhQR8tCbApNvt4RJDtZNC8nMtVMZII3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179278; c=relaxed/simple;
	bh=W7jnxSxFUjmvj8D6lZwHZcVZbKCWfvIENbtgFL7P2e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcKhW9JTPnmRKG93MKxyQxt49d2SWfVWgxVpm0dPpUb7OoeFRs2M4HR+eiyqvsywnqekWpoyqw1gKznHlek4MLp0z4yXep+J8tQwHq2F/RMrXPNlfyPgRPaOzE3UUxAbmRrWKJIyamVfHlzz1abdNnDitKSvIiwAzUdVrsM0otI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=i/+X+3Xx; arc=none smtp.client-ip=77.238.179.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179274; bh=pknoANi+IeCUd6T8p38AbnWHQI/BREFpmMlQqUR1Yq0=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=i/+X+3XxKxd33HpURDWUCfCiJADrbcp4xW4a+GKJrMpck529ZmC8tyBpIhZoK4ZobLWSkUjjWn2JRYpvGb4G4pd/LT5vw5WC/A78fne9augrxYrgHq9ztK/xZ7IXoUfFMklRZ1oSAz0KnAbTkwMmbSdonJ3qg6f9FAAvq/LTwOAwk5vCUVjluGOZuVKSq/TfPVuRIf2rY+U1zCY83J2fnbK0D8Etyxehl5/gtSgCqzHnA1IOJ7kfW85jFg7G2K9wtxml9DmWMxLNNbW1tRtCpFzCxcEUKwFDEVTahiUlA1lciMpa3/VjpXhKAZm7buRBLDohVp6ODtLNHwCDlg25Hw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179274; bh=6Hx3dDbQrM+wxgpRULZwNZSQloWWw+kh0tErl/sgm2m=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=c2MR6x6skL9G5KCjaIkdQAMmWNx0qR6/rbWAxMIgDaPkN2He/qXTG3e2TmEt+4dwYBZlo+/a+fFxX9tAh2x+PRQ77n5jAw1MKDEPfb/1B/hURk03+MNexKs782s9OPi6obuj5/osqbzilOv3Hr+udxPAeuAnCEXEfHrGjzoTFuvVCfNO7RDSkN/YxxKRZfYl+ioTy3cfmZpih9ciSJCegATgBwsvbCjBPXdDNRRrb2Nk4jSiYoJWTrVb/Slnf+hES/i9AC34kMET+rms6bh5x9xQ0KETDjp2luoEchTroTXdwRXoi9FngEGOfjINuJPKhXPiSvI9HB8/Q0J8L9ilvA==
X-YMail-OSG: xckQkJUVM1mmPfA01YV3zbtIKnMlivnT..GcFZPwJoUWVR32K8N5WqrnHjLlcAR
 THJFRQodEYewdZZwwQgkqgT8s7_OPZJX0FFz0OgWFwG1dzlzJjL5r3f.FRFEXxLBZ.GZbwnjlaat
 416dUqg7SrRRovHkawyh8mCeZ1F37ue44iatFwxLFrbo_l46vhL8uF.olB1Chg4nGbX7ZjPmk737
 aEoqjnhr6QFtFuuLehg24.dn5typYYlw04guvC2LxdaFILYKoGusAvSUHQLfSh7FM4oQ9DRKRg91
 9rMk6_zldMpbVvd6h4RQTLqeQtI3M4zDtbvr7nAOabvw2Ntf85E32l.CqHocqD8kOnnLSh9PBXep
 D_IgdE8Kc2vk4pMGU2ZwK7bJUMU9FpovowAIRSxD3mNbN3G0cyLl3nCSK2qFtCNvUiHJR_kA9FZz
 WavixYJ9eZO84zSSwAw.ZyVCfZlT6ubFoyplhxiyhKWQtgruumm5iGwTzrhipKYLdoDKkkCasj9t
 9agQ6A.Ael0nMf3NBPA3su3iOTtvaVK..6k2qSmRemmZ8wDv7AhLYaBE_ALa9kN1R6uxtfw91Nkk
 g2OQhs07.OWcXeyGbhkdpXF_eOLSTi4ArSMIe5JqXs7qDOtKwl12uXYwPrOfBHW8l3TpMjtxhoCp
 mE6AWHvd7AA2eTINgsOKsECBJWUEAF2xlV5ZV8gWIHDj49jslvS7mCROdqic4own4.pEsv0iXitA
 MdR309YKU2EWYjDZ5.T0RdtoP1yDNSmOF6zHYXN0WcTig64ko8TG0fA52ITDOJ_D23jhrqiYMy2g
 iNl5IDj34aX0yWpgUvM8Y.gkRcdWbbx9FC01PwOcfoAli8wkGz2ivvwNOYsruZZgpjv8F9EmUxzi
 ut2AUUZqoL5C5EDqKFervpfAmgUZmj3GpMZOdSRmWc4GnqSu1q1j2BA08rnnbg5basdFX7UNbndb
 0Vp0OTtjsu3nC.trPJmeI7DHeew93Cv.Su4DZQ5R54waBMGXp_z77JXkPrHYIJYLmTBkk4kluxya
 tMWUPpHwZMfsBd9yHK9KAamcqfPaYxBtH4D0eKikRw5PXVFYlObCpJBxs_Q2t.7FZu_gJW8z3IP4
 c4LaG1ztf1UyOg0zBhFC2cE5lNnZDDunvHUoS4UnjRCa6DjpDRvNRBLwLQ7D3g1NapAqwqgimlbB
 FvSLq3rCeB8TfVTRgcoN.eOxUAPNzW8qaxpvrZ_TWfTFzapReiKDU3eamURucusJ4cjtzfsIKlRH
 uw4KIq4t3B1MT7UvbJ_.8aiB2KVhz48IuFDyKpA72bSv6sbS1NtYPWwQNTwSgPipimSy6WoaGN4V
 74F3hKEijaBSX.lC0Th5_6EFwFJ4WXAP_9Ok9SKRljawd7SxsxrBTTkUvJ8eSjo7tgeY9JpgeocQ
 JZrDYuELSM76LGrWnuU6prWaEnmd539obsWizVsfZkltDgc0b_uf8785admOCR9n9zPQl9QRpqOA
 aGKhTVOB8eqAVSybgHjTiRK16RqGYFyic8Bu307g3HVnHWa8uA0G3T.Kr46tR7eTbEcstCTp.KxI
 griJxT8mC0h1UjbWQ4hfOzTCH8d.rnS5EMLdkAJD7.rOoPSsjfcjmQwCVP7mYXaOldAsxhT_40oM
 lufKCG.g51DnEe3mSC2OHtoHfFRvGrsHOYPh97xY8nrYy4pQooDZpENyED9dowWcSR3B2JXH4eUi
 _POVccvr91Pzs.qE3L_jQYkzLAfcusXVeG09wCHIan3aK1kc40M6RqIGncn7NtEPZZi1lXNtY3D4
 Q3VxzTjosG7_Bx3KGs3h..3FedXZbFYwpkUF2mcnENsieBSTqEhJ2hXoxjgfdl0FXe49w9qqA2FP
 XuU6xDAKodyej.l7fazmCCKgSV86DqiJ7FVOm5GgbxdxZsG3nxBESgbWbsXytn2XFaQSC2LB9HQF
 PShYpFK26TkxL9emF_Zd7Mwo2ps3KNSwTcbNdLQA5k6GUGPqnKo2aCCZuL3DVKXDII_lg2xQty6B
 iVPHpkO4VGM9pGcwGFgbQ7hvGxR6ILL6c9D5H6jnqjuMmDRdUfThrbAOyw2825DKFuMrcbDKfMMJ
 5n7GwZkD1MIwfjnSWzAwCOzUzW1IlgJwf3KThEyeKilu90oFjHihuBcFoojoPjBl5QtrDh6_.FQ1
 gknI686kRywNyWcobHxcYbFQ6M8d5CKLNWD45Q1_AfHDwu_4mFqijzZOsltVmohS1mLieusidYst
 CFac2wROr4MXKPmYdrCkds53zyho11VXXNgwlwQ5J9Iqp.dva5zKESqNLhA.u5oZBMKq9ijxrtXB
 rBNQpPFz59yRgVa61boRlUhuwjj87Bku_
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 79378eab-8572-4a47-a064-511eb5990ec7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:47:54 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 70d8dee74b9581b201e5d1fc2936dba7;
          Tue, 10 Mar 2026 21:47:51 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:46:50 +0100
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
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-2-fd22e1a04cfa@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: ADABA2587B0
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
	TAGGED_FROM(0.00)[bounces-55247-lists,linux-media=lfdr.de];
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


