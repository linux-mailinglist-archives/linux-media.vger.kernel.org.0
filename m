Return-Path: <linux-media+bounces-53144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Fx8FqsEm2lPqAMAu9opvQ
	(envelope-from <linux-media+bounces-53144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Feb 2026 14:29:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4C16F3C9
	for <lists+linux-media@lfdr.de>; Sun, 22 Feb 2026 14:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1366D3008CA9
	for <lists+linux-media@lfdr.de>; Sun, 22 Feb 2026 13:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244EF33859A;
	Sun, 22 Feb 2026 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="iQhlVaDh"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic312-45.consmr.mail.ir2.yahoo.com (sonic312-45.consmr.mail.ir2.yahoo.com [77.238.178.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20C6338597
	for <linux-media@vger.kernel.org>; Sun, 22 Feb 2026 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771766943; cv=none; b=dlOaBSAtYpiRgYtPf8oYg3Mk/82vvlsYfHl7EnBFZeEvGxW1bwSseb6bJiB3X6S2AizXqg5KSLaZZ2PAo8/bmdb0A+VbZFAAFPJrv2hOn4vTty6UK1WhrMMyyC1l9gbZlW7FbQlhaP06NfcxkpDu/OK0etvX5uty6M9+jbsZ5nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771766943; c=relaxed/simple;
	bh=w0CP5PbtExiLF1kngJAI3FlGH0FrwT7naYWfjv/ZpoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=EMnv3VJhVUuVMe+G4PQvC+fE2siqH5pXzrkJSN6GQJYnzs7nT/VFz9QESGWhmAve5D9jQZasjWoA+mKKXK007xH2/qIWshTqxjmZF9C99yDDHQ5nCJVOH2Ov8YuzbCWP1/Whn5auSIWJoj6pQOHIEOFv5lNbwVwcVQZwzdZzrIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=iQhlVaDh; arc=none smtp.client-ip=77.238.178.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1771766931; bh=307bPEkFTSndiDoWgMPOBxT0fXFC/7IzAQBC4rm3Nno=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=iQhlVaDhiYtAMNV2UFvF/bgjlhSPF9li0PjdlMVrmXckLi9m0g5M++9tZD2eGcinkpxc+xv8qf12UxIVBoewzRz5GSa4awI0Gji7VHanbfI2LUwu5xcfaS3x912JP+suTF+Ud3VTkHL7i5eSgsbXj8UcIFa5Ssiv0YUOkXSGOrkQ7gGd1dpOeKSY9J/MkKujh4zGKWwAMbMZd/RY61IqEXDvSg/FJfHK1rgaT44RIwlRJzgEW+NAzLocGdbAEhgGrKlxog41wTR0pSK/3JgzAXTtqQxgQghvnRzgwN6ilavRbi2g9dZRRkWymJznOtJ66euymxUhAL5a7/gytMoEow==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771766931; bh=Nd1wcYt7sxJCw+ymUdl4TnKSzMtFYGc8vl6CHVpF5Rz=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=HVSeIvrgh0QsI+mVJaiovTCAOyOd5FvVAjs0kDVif4+MT90JCoYxfa16SHhbcoitBg2/MyXFFLrteJ1wVueNDtbIIZjBjKcTrsMRWt9QQo1OZkM+zCp4CBnjCFcss0mF/C0dpbAo1z03dCMK8ATSl4AYw0aAMYW6780h0TulSIKKzFGvvWQId1106rjLAvzS50ufDKFOSL+PaTthUpGUeGQGcZycU+3EvzUv6WSWfWL//QaN7MWf1OJSoRRkR7u1wnTC+aSNhP1QRO+kX89BoxGJwZFCI86wrJ6OeeKVz9UfPqXKbcGI8oCkjik3o3Y5JXHtKAkzQfr+sNCwxU7vrg==
X-YMail-OSG: a8HtXW4VM1lJ3j35MB4Od0UD6N7lb6IzF1gSrSDa8WJDLx3S9yot_qN2cpTFYFz
 daC0vTBtg5_BW6CYNi7TmVwpMaH_4niykJzoxYLg95cISEJn0y8kyq9sH1A83jkgxeUnrFYoW1tP
 rNQs5gSCV_ylKhj74dZvLzhNzFG1BbbBFmZxnyQM3TgEvAMuc9ZUGeESUzhJy9kcRYMYX01XwH83
 Ad73j2J2sjVaeppSePFT91W2Iu2PweIpMUPEznLYVoPwjvHV5sipKbm5hzoMqH3Mrp98Q1RDqZEq
 muEFKH4AYMGcVJMJBW_SqllGTavbXE4d5PbmmrMbN79Atsa7CmvvShB5RVgDB6bC0DlEBbJks9PE
 B6WyL1QcnDO45O9KpC3p5f3N9FsAz095YunlPbNl7NQS0Av5e2IniDPTGQZr73JI5TVwm9eTzcWV
 HnJNhCtLCEdATugi9deiYGFMMjDyJ1HP6eenVWyqIRpthQ76a5cOOmgY.ygE9fNi3rqY.md57XQ_
 2tRIMLRMSFTi_6QD5PppKClENZzh5PE2xF2TgroJCeybMdR2JmvTygramtev7.iotIZi5s_t132B
 .TqkDYPc2gP0bSkIz4PekGqqHVgiuD_LqvN4TEZbztOBlk23XeLAnZRb0P8zf3PoEuk.2vD9XWNM
 0DYHBkM9NhFa7CFtZK_jE6EB9gGfvNBQ1t30jp_gme8oezi8xxI6ZaZlnN7IKxXzEUbvLT5S9pFb
 iCmT1TyadvQdDsf9bNX74yUcThzVMG88FJBpw7NZcUg3D0qolz0lQUpYg8D_UHhSw8P5n22s8I0v
 TOijbO2W8tGL_fuE18q66vTQyTMPreb41EynDQrF8xFuf81CwECMn1vecjcmd43bE8CK8dlNxsFS
 7NJvN_jc_PbcAEqaTdCQ1s4aa6gQudKYLL1PK5WHMFsiqHaiqbVaFIwPKiw3duNktZbJSIiAdLZO
 mPSwf_4_yOWa_1C4fqRt9KBUa48AOr8dGwzxe_TCHa4He3UQFtY5fd594d5sZR9jDQ.lOJ7.Dv9D
 zDAqt91MRMJCKVjKmDiS.gJj4cSj8pUVS44YU4wa5P0cWX2W6kFoEe3._I5ipZLsPq5a4mA7oZzz
 p.tiFScxvYRjUt9YPDKHikKmW4uuuOvkWZqj.G8.xjELEjNuN2r9VxhIpOCs2.cev32rzY0mIZO7
 khdmryOt25.OT89awPWaSK7y7TuuLmAjzhHWwTC76jZ_Mfs4DctV6hau4rSMQznnmPX7i.cZ6s9B
 DxZfYBz_mziqmvboTpxlDl1AE4PHXownhQ1IF_fpvydI1RLVASPd357u8uk1wlXOvNsszi600cye
 JkTwb0xaLHtsqNxSIo_uW38KJ6Nu1Ye_pF0qPI20654AEDE9z4HepX6BTFLwQ3XMiQjr56ww7LBO
 Tu1MoQ4b6z6dT0RCfgnUQkoSVQv3JU7I4EwPwrJXDDYIhSYpjmgY1v9dZUnbY6MUIV_PIJEDLZ3B
 5deIvNc_lVmee5tLwW3XUY5UTicbrlXFcDDGgxpY1NAokQUcG.Ue1JcQW2JidVa56eIR88mmv4LQ
 6TkNuo.7B7cKADUU2pAO0LI13iSLIGBf1aM3pW_V_XRdScKIrcwBWriGGJMa9XScGcchixem.bvU
 VBoUUF48thi6d4xcciARJ4GH_Cv_rKiCSxHdiTRnntEU.93Ui2kkXp1AJepbesEzJ.ia9nSNtB2k
 ycvFvh4ffDEeXdX_Uc_F2Qy4GZoxWWT0h3QYK6z1qjTzte87NO9Po9CQUJTETr26efxcxo4A6Zlt
 dOaydeCdM8oxow7.zxGEtkVBYJpVanTqQYOZd0K1W.GWd0hhWvCJJnpreNu8MyA05pAPCtN1JBcc
 4uq9BSV8w_hOWXOs4YRGfm6jBElyJXQL4D_irtk5EugLUsUZPERxGhRAq_0zf2v3eY2zpvUJXByV
 7no4fYe53TZu.m7o0dOXCntRT4Idi3kMFHCzek36uvUAUmBkx5fjupl6R59C6PGXE5.Y_EMNjBuK
 wQSCFPS3czjwk7GgPhR2q_FebqGXa53q1t6KQgRgqN0z__GAe1sFMipnK88vKiXJ39RedkC9H_5B
 sTq6JuZ6w7dNLmXcLevPzm5EFJZX9gdAZHLBjQoc76Rtbw2.JeC4Z_bdn1aRh1.0TboViZQMjAtu
 vArzxBJWwapvEQ1VtMofOqRki.1sA_2T0SmtZREw8VCefFsPoo1oTwyc1OcKDpJwaRsAFfVe1H3X
 krmYlwe5hToEc6A9mNGYUaedZhZHQxcHoBvO62OgpmmEUSJIMq8M23rG2LB7nVeoHK0i6.eaLn22
 KCngA4WD01DYoKyhnnIQSvETOIu1des8c195m6xTRURCtEA--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 0d59d50a-998a-4cdc-8912-e334914e4856
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ir2.yahoo.com with HTTP; Sun, 22 Feb 2026 13:28:51 +0000
Received: by hermes--production-ir2-bbcfb4457-c2jpm (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7ed9610abc9a97f40fa786294b835035;
          Sun, 22 Feb 2026 13:16:41 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: atomisp: Fix spelling mistakes in comments
Date: Sun, 22 Feb 2026 14:16:37 +0100
Message-ID: <20260222131637.115789-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260222131637.115789-1-tomasz.unger.ref@yahoo.pl>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,yahoo.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53144-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,yahoo.pl:mid,yahoo.pl:dkim,yahoo.pl:email]
X-Rspamd-Queue-Id: 9FC4C16F3C9
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Fix various spelling mistakes found by codespell:
 - aviod => avoid
 - corrent => correct
 - stablization => stabilization
 - addtional => additional
 - facor => factor
 - steams => streams

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c          | 8 ++++----
 drivers/staging/media/atomisp/pci/atomisp_cmd.h          | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 8 ++++----
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.h | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..5e5f3fe1ba7d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -811,7 +811,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 			/* New global dvs 6axis config should be blocked
 			 * here if there's a buffer with per-frame parameters
 			 * pending in CSS frame buffer queue.
-			 * This is to aviod zooming vibration since global
+			 * This is to avoid zooming vibration since global
 			 * parameters take effect immediately while
 			 * per-frame parameters are taken after previous
 			 * buffers in CSS got processed.
@@ -974,7 +974,7 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 	 * to a FIFO, then process the event in the FIFO.
 	 * This will not have issue in single stream mode, but it do have some
 	 * issue in multiple stream case. The issue is that
-	 * ia_css_pipe_dequeue_buffer() will not return the corrent buffer in
+	 * ia_css_pipe_dequeue_buffer() will not return the correct buffer in
 	 * a specific pipe.
 	 *
 	 * This is due to ia_css_pipe_dequeue_buffer() does not take the
@@ -1575,7 +1575,7 @@ int atomisp_set_dis_vector(struct atomisp_sub_device *asd,
 }
 
 /*
- * Function to set/get image stablization statistics
+ * Function to set/get image stabilization statistics
  */
 int atomisp_get_dis_stat(struct atomisp_sub_device *asd,
 			 struct atomisp_dis_statistics *stats)
@@ -3232,7 +3232,7 @@ int atomisp_bad_pixel_param(struct atomisp_sub_device *asd, int flag,
 }
 
 /*
- * Function to enable/disable video image stablization
+ * Function to enable/disable video image stabilization
  */
 int atomisp_video_stable(struct atomisp_sub_device *asd, int flag,
 			 __s32 *value)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 82199dc9284e..d3d1f2574e77 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -153,7 +153,7 @@ int atomisp_bad_pixel(struct atomisp_sub_device *asd, int flag,
 int atomisp_bad_pixel_param(struct atomisp_sub_device *asd, int flag,
 			    struct atomisp_dp_config *config);
 
-/* Function to enable/disable video image stablization */
+/* Function to enable/disable video image stabilization */
 int atomisp_video_stable(struct atomisp_sub_device *asd, int flag,
 			 __s32 *value);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..c30501a36f86 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1957,7 +1957,7 @@ static void __configure_capture_pp_input(struct atomisp_sub_device *asd,
 
 /*
  * For CSS2.1, preview pipe could support bayer downscaling, yuv decimation and
- * yuv downscaling, which needs addtional configurations.
+ * yuv downscaling, which needs additional configurations.
  */
 static void __configure_preview_pp_input(struct atomisp_sub_device *asd,
 	unsigned int width, unsigned int height,
@@ -2044,7 +2044,7 @@ static void __configure_preview_pp_input(struct atomisp_sub_device *asd,
 		}
 	}
 	/*
-	 * calculate YUV Decimation, YUV downscaling facor:
+	 * calculate YUV Decimation, YUV downscaling factor:
 	 * YUV Downscaling factor must not exceed 2.
 	 * YUV Decimation factor could be 2, 4.
 	 */
@@ -2085,7 +2085,7 @@ static void __configure_preview_pp_input(struct atomisp_sub_device *asd,
 
 /*
  * For CSS2.1, offline video pipe could support bayer decimation, and
- * yuv downscaling, which needs addtional configurations.
+ * yuv downscaling, which needs additional configurations.
  */
 static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 				       unsigned int width, unsigned int height,
@@ -3002,7 +3002,7 @@ int atomisp_css_get_zoom_factor(struct atomisp_sub_device *asd,
 }
 
 /*
- * Function to set/get image stablization statistics
+ * Function to set/get image stabilization statistics
  */
 int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
 			     struct atomisp_dis_statistics *stats)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
index 75781807544a..5188df4f469c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
@@ -40,7 +40,7 @@ enum atomisp_css_stream_state {
 };
 
 /*
- *  Sensor of external ISP can send multiple steams with different mipi data
+ *  Sensor of external ISP can send multiple streams with different mipi data
  * type in the same virtual channel. This information needs to come from the
  * sensor or external ISP
  */
-- 
2.53.0


