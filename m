Return-Path: <linux-media+bounces-56508-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNsKC38dvWnG6QIAu9opvQ
	(envelope-from <linux-media+bounces-56508-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 11:12:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C342D8860
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 11:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A19C30C3D96
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2827355F3E;
	Fri, 20 Mar 2026 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="EiyBKix0"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic310-57.consmr.mail.ir2.yahoo.com (sonic310-57.consmr.mail.ir2.yahoo.com [77.238.177.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C114B36165D
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774001267; cv=none; b=qvgRyYmumjf2jyTOs18uy8TElHh3Bj1bSuqlLd5L+0mt9xrCwiUakzuEVEjHKJYUxks27g9so481sL9V2kvgpOhHfSRi7Jl35zp4bHuh+gkKaxxF9siPce1T1SyxDxfs+ZkdIxjmd/uUBRTPtCot9D6HmBxxSUWq8NNEFrCzH4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774001267; c=relaxed/simple;
	bh=ROVMc5JAIuwNqc0jKHs2FtstWuWT4dPv5nT1PlG1vp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=QRYF8c51M7MarNOX+cnQ3t2eAzzB778hSxxJFubIOvfZ/UbpCT07gbd+Ux+vGAbIkHTw7Tr824hq9ar5qNGWHjo3VTpKFLRydyY+nO3fFQUUysSmppomhZcuulNg12WR86FkIB20ODQGzG8ujaSQiSe6F5QofknL1kwLVd0iNmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=EiyBKix0; arc=none smtp.client-ip=77.238.177.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1774001264; bh=COJZclBbWDNE4y0eAt1HnlQYYriESXV9hI25lEsi8ik=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=EiyBKix0wJnrRdHKUMdb7H/yJmhVs0X+3PoGk5IbCrzZyhOZVP2pTxpyGrJNTJDuex2Noz5t7xJ2DyUhGDVoeQcevIqDmjRj5ODWuFIvRIjWRODhhadgS3evgS4xhusS03kdtapHdNcTdW2dv6IcXoI29nw8kdY4M8nC5UT+nyYvDZec1kiI+LieIhY4eN7d1XEN2oeAZ+fSR+gAbR6Nus6IGwf0a54Y8CwE/fFXrXfSGiKHPRVr1bDgE6THEpjX7OLUI2lTmqbdq06W9pg9EjKigEtmCgUCXs5PybKFTV6P14V7goXVGaVFLEcvOQMohihjS2I6CWmO5iAZHGUGAw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1774001264; bh=nH1mP4xc+h66EjdQR2GbFXMB4vvLOeHi61Y5hj6sNL1=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=g2i0t8aOc3TxCaqquPgVVIXUrU3O0MxlxZz4ZHySj2J3zCOFnZjklOycL7agzrQgnp0ohZeakvHsnvwbVPHO1I3SSiT1O4udta2ZnfqoAeH3WYYleDeA2+Ma6dnHCnFWW6vFjNPLPkKOzJba0IF8hJ5BYpf2tppfmibQL55ffVKiApQSIcq5t5mDOFmfHP9UaXoB5niw1vqnvFVL4/j+LB0DaFf+dUon792TWkBfk/wbLvHizG3IadrJVkBRAjdd6TZpcoGE8UU3yTdfMeM5Q5HqNGK6LNzB+1Q9SMT3MQ6GnHQpcrpxCZdThsekSRjHN5ewt8Wj+9WEz7lTMIkYqA==
X-YMail-OSG: DIzhNagVM1m6DlZc0RAk9oAgh4CTDx8t4vkAzAKLdZGRthqOiXLKOZJVIaCXF53
 GKrJ5m_nuoKk4YR10okuy78AlpskyH0wbBGJJRACb.01SaoCBAW9ysM5inwbOKaDOf_DiIHmETEX
 BQLiHAkqBzaXBAEGJIrafZH.gGNswKK4ZFuYqFEdA4ABVaU6Q6FXNhaWg5bij74zeTlOVSK9fnC7
 8Q4j0ycK6s_HCGhiFaoTigHw9sTVn.eyy1YXo4tuuOqd9cQ7OjnOrTxRuBinDOLCH9eKzvCdLQmT
 qOIFpEwoX_r9EfivEdS88HRK6EWNAt.iC4BLmQXh4RkNDDyWQwSPzhHx7EoX85u20gE9Twu7BQYx
 7Lfme.B8Vk84WodLZ96uN6KCQOLZgZbGoDdGidDyc2Hbl__v2vuqJfQooRfP6YPRcsbGadlOYU75
 djQNZrj22g8ISAA1_2nAXk3.HaxK2CF4294RfrE6MALxpUor7qee9qgh0B0_yJck36XZGMBXqvW1
 qqHzSpTMqMWavfFxljlr1GY16QXBV_BfKsD_PDi4Wt_29O7R_p0ddH0wO2WQlDLCO8_dXwXtbMyR
 urgwQJTF1VEMXq1s3ONn5ZKsLYgWMVAOJFheM4LM3tMDUPi971fAdinkkSXJR6CLQrZgb_0JWUrb
 HwAD6tnIjUNtPoQPESRwBtj_5S3XJiQkOQyvpVpX1sS4PhpfpMREVrIMCNM8ZxEQZqgRNCLj_Ly0
 .4A3zKCR92wurYyKGoUgi5bBeDet6P6vFJ6zG.8W4.6.eWnVKCvnBEp8jYGvFirx7DwplVk93YCZ
 SKRlI7TDT3d1m.n4x1yafuHxenxybsUD.775xo2IH.XR7dJOXGBGhmo1U5ot7WHkmDiO0estmEM2
 Z7mfo0EuThuBXLqGyLmqMMI_qCz5PLrcVM77K_2zvX_2z947FMawudJBVT5bCMtWxC0JBODqZSbf
 NdG6UsDytosB3Z4IuK9eihSoDW9.mDT9_bsysVFz80re1PGkEgVz43trExh4oQU5t0sVYGZcEe2_
 aamTasrozRtWkzT2XZZAbdSkWgcMHQnolc.8KR6gZg3S4Evjoks0_i.xCaRJVw0BgDVAWfqE74Tz
 6jT1rrR2V2rre5nGWuoUm6oeFoIE2yPN9KmcankarC54AQc879rTgstsn3vhX9DoA7djUPPNTiIU
 2JSoQsAa5CAbBe.pfIDRCCiudtfdfOmipdu5b9beQtOqs.D6gnYbbNwP1LKS_EZSW89LdshS6SSt
 tLlfOKrlEqa3zsb4esU6_PBAcEB_GefKauVTw16O_BzvXBnPZyw3YgaoO7HckqmjGvpQ94dOaBey
 ubaC2V1UfbnZ_RMzITpgwVx_Vl_oE7QRehElAGTemOVxSM0Gc3nznZcFPHYlQxQFPVBovd_U5k9i
 MFCyPR3dK08L_1_Iu4Mh83Yxi8_QDyn.mOkpRNfS9IRmS2Mwhp0ryorLkckycLKrbKrOHyPP8.xQ
 4tr7ZPFWpxjwrDDeCe2.G2R3vhgdYJtpO8wPQKxOP0qaO7Q3Tbl0J9xvaMzlW9_eEZNcR4GFPWoE
 v6fvRTFLHDmKHyoAxf_e5YPdmFROo04noeBARXuqxX6qgbgurAqdLKhRj.qb5.ie77pKvlvQFdbI
 zFMH5dIdnKEM.Qo5OTHlyEuGVis0LutoEBgylrbfSwnT0sE.7BBeZ0rQttBnAm2prlv7vPIJOTvl
 7xx2uwr91mflktSMhoJLYv3y_uHsTfJA.AR.XI.GM7zSkb.jDeN4RK5DKMWSUz4_SB6BOVCFGJ8M
 MwQCpZ6QaBgUwkiTq98p0IepczV2MIbseHdQtU0bDEljF6d0P4_.ZSXSadwEOgRjvay3zbeyxXmX
 oT9ELtB1kAFD8W7r4VmlteBe9VbSWb8fr_DK0gD2UoobJreMs723gn04AJV73Q3BIlkf5eC.5.j1
 .ZLLHZpm6HDfKAmrv1QtWKd8w63BAQkCrxABaFC_X78ZgvP5VK3zk2KNBDf5fQcJOLQ1mOZPRPU2
 gc9bx1R4ZGOWL6r6OiXvQk8iZ1w27EWn14jDxrwP3G55EAohYy6qsa6Zukyqg46NtOZs9uSgu9dI
 H0Dng.0lm97UmIqWMJc3rd5ebZWVBVeJqiI3A9.q0wjHiRPPUEt6uIUNnMXT2wj2jOwGTHLpbN_j
 O97V2Z5rDL3SH6ic_dzhUunDTK3v2X0tAEbzkgMQO5uYsIBVXmTL51qichF1ihLtWHLAG85mGFwH
 DgTMIqtmkWWIAQl9BDi_sEG9NdVX3pCf822B65WdRsGa3i7tZnr3Ht15nTToAMfIOh4i4PbGHfU6
 K0tLbvk4VQ1sKALp07PXM_9IbRFRR_5Zm_QKO
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 7e22caf9-8a70-44d1-8f9b-0f54ff548b6d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ir2.yahoo.com with HTTP; Fri, 20 Mar 2026 10:07:44 +0000
Received: by hermes--production-ir2-bbcfb4457-64r94 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID e61386a833cc93dd4a6266e626ebee5b;
          Fri, 20 Mar 2026 10:07:40 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Fri, 20 Mar 2026 11:07:37 +0100
Subject: [PATCH v2] staging: media: av7110: remove print_time() dead code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-av7110-remove-print-time-v2-1-e22377a07bdc@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7ZiZopS48h6GRYODTCKUtE0jI
 dzdyglcvpf89zeIElQi3KoNgmSN6ucC5lRBP7r5JajPwmDINFQbQpctM2GQyWfBJeicMOkk2Nq
 6Zul7HpoGynwJMujnSD+6wqPG5MN6PGX+2T+imZGRrhcyprVkW3df3ej9eXlDt+/7Fxp5yzi/A
 AAA
X-Change-ID: 20260320-av7110-remove-print-time-87331ecc1f66
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774001259; l=2217;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=ROVMc5JAIuwNqc0jKHs2FtstWuWT4dPv5nT1PlG1vp8=;
 b=tfJwB3weaEBA1PkVWQgILpnNeXE5Y3fIujPY5UAdgvm96p6aqh7A/ECWNoBqPR/O90x+4MqxG
 fWyDRm0kBepAUZaumvhOuO7in2iZ8fHj0HLnpV92SSMkBqs7Bc0rVGq
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260320-av7110-remove-print-time-v2-1-e22377a07bdc.ref@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-56508-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Queue-Id: 97C342D8860
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DEBUG_TIMING macro is commented out and can never be defined,
making the print_time() function body always empty. Remove the
commented-out macro, the unused function definition and all its
call sites as they serve no purpose.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2:
- Remove extra blank line after deleted print_time() call (Dan Carpenter)
- Link to v1: https://lore.kernel.org/r/20260320-av7110-remove-print-time-v1-1-05402287078a@yahoo.pl
---
 drivers/staging/media/av7110/av7110.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..0648bce4bf84 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -314,17 +314,6 @@ static int DvbDmxFilterCallback(u8 *buffer1, size_t buffer1_len,
 	}
 }
 
-//#define DEBUG_TIMING
-static inline void print_time(char *s)
-{
-#ifdef DEBUG_TIMING
-	struct timespec64 ts;
-
-	ktime_get_real_ts64(&ts);
-	pr_info("%s(): %ptSp\n", s, &ts);
-#endif
-}
-
 #define DEBI_READ 0
 #define DEBI_WRITE 1
 static inline void start_debi_dma(struct av7110 *av7110, int dir,
@@ -353,7 +342,6 @@ static void debiirq(struct tasklet_struct *t)
 	int handle = (type >> 8) & 0x1f;
 	unsigned int xfer = 0;
 
-	print_time("debi");
 	dprintk(4, "type 0x%04x\n", type);
 
 	if (type == -1) {
@@ -473,7 +461,6 @@ static void gpioirq(struct tasklet_struct *t)
 	txbuf = irdebi(av7110, DEBINOSWAP, TX_BUFF, 0, 2);
 	len = (av7110->debilen + 3) & ~3;
 
-	print_time("gpio");
 	dprintk(8, "GPIO0 irq 0x%04x %d\n", av7110->debitype, av7110->debilen);
 
 	switch (av7110->debitype & 0xff) {
@@ -2785,8 +2772,6 @@ static void av7110_irq(struct saa7146_dev *dev, u32 *isr)
 {
 	struct av7110 *av7110 = dev->ext_priv;
 
-	//print_time("av7110_irq");
-
 	/* Note: Don't try to handle the DEBI error irq (MASK_18), in
 	 * intel mode the timeout is asserted all the time...
 	 */

---
base-commit: 82e1c68ac206efe42854296c462aa83f541ea22c
change-id: 20260320-av7110-remove-print-time-87331ecc1f66

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>


