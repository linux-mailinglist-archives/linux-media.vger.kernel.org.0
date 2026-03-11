Return-Path: <linux-media+bounces-55373-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEPxI/g9sWmtswIAu9opvQ
	(envelope-from <linux-media+bounces-55373-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 11:03:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A3261ADD
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 11:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 40B5F305C3B7
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90C53C73E3;
	Wed, 11 Mar 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="LkQGICjK"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic314-21.consmr.mail.ir2.yahoo.com (sonic314-21.consmr.mail.ir2.yahoo.com [77.238.177.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493CF3C5521
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222618; cv=none; b=fVwuNykPAnzl4iscjmW9R8cDT5FtEWcz9y3WVxfxvnyySfDQxC9ue5XY4QhMw2mM/9GhI487tvArHVUo+C7oieqt0IouLNLK7Ds5GVXF4BnNBbqAlRR2WyUnnSOvWRRAxw8LmNO8PTRzC+xknT7az6setzFBKTGjnM8yt0SeCo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222618; c=relaxed/simple;
	bh=WhS/zDxaDnKDhT7isLQAUE9XOfqdwZQ4GtG7gs4tXTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=t99eOw2EFvjYWAtZnsw0/yZvTqC6V++3jt/Ha/GvJthpEHk3HAL69C3DwzlWswihoOIPXnzWEg6ie1eEhXgp7G8rfeOSE+HH/9AnxNNRJfc7PcjPRd+9KArAvG5bHJkxeqUccNr2DQ6eaKDDAFc6QxiNJU6fsAKkG6bJKYaFf3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=LkQGICjK; arc=none smtp.client-ip=77.238.177.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773222607; bh=B9cWagrRCUVH0KXPWMsCRHHsAiFhmL3M7QVSTrXMknQ=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=LkQGICjK542inN4d8yAm69g6IqoGUKl1xM9oVOaAzAcscqLj9sA3Evj6QtTx5vL/WISKSqevnP392OFqTIVZk7ktkbSUCaSaCH7Iq/LkJUqKMbupfhmzCRNTCsyd4oi4xyytrVAnWk7GDeIlG8R5Q4LAbNMC3IUgNE63gS5xVH9S13htps+effxp79uoqyjmRBWpJdPMpoFVN3HrZ88es2b497YVCa+dwZeCMDVxdoqoyCMR+v1onrFYqhXH2lZQNpUUtBbn19DR9l6FBXfTpm298qWsk7ZZGF2fsQeDfGDsZKAJBVFxP1UZ/81xBN1xFN14kOEga6evnuKmtW+yOw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773222607; bh=JMCGdVQ0iVhxg/Hi9wRIm3vnybFobKjBwFBnjilxI+h=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=qyM89DJBhjvmzl4pTUwRLij4CaabNULHpGPLVGOKuDyV1efS6/Kvqb5DgNH5kcyMgsFT3ZBMstkCm2pUeGkZr6giB13oCexbUqNIOqh07USxr/kMdBrsswvKwG2JMd0fwrQ+Xp7aA8ImbRdym8AjDT9BAi0Rpd9vQEv3LCXebX2XRxRM51Zfiq1A7wc6BOl+z+L2htvHFN/WXQ+O6LO23Qc2GvkT9O63LrgiLhkZQGQSYLp7zVDh+bOywtU7400+ZgfcztCDLkE5cxFn8vB2M9ArBiWBFTPAe/U35Efh4h8HM5tWFFYuckkaBRgBgkHvzZv24wJj3JeM9g6lUPM9tA==
X-YMail-OSG: s6Z5uMgVM1kfs8ThFOFOFlrHQUcpnDVS7444rks_7VxEUL_d1oJ7VDY4yncvcOL
 AsctJzwjiTNGegKDJVv0luvNo1jv1IweRAHZ1U2V8oVrYMqmzbc6zCenskuUrxitdi.6rWPnc.Ft
 .5wxRvxxZoWNB_cH_4nu4n70dekBaybipcTrNGgnIfvKKHHrqY8ZSEhAAO0PagfMjWZ8Sws3Tn3T
 oSFohdZFaFT8QqRH.qNyIUcBmKZwBKYAO7s61DG2gDO7IgTlRopA_By.PyaR_kGdwGpWuBI5.ar6
 9BIawRKObb0OVu8N7zwxbcOjKiASS7R045lXoS_1J_vS7PqEQAHnzjGvXXMiWbS2RVnTSUTsaJtC
 W2dVQKl6UZgSqT2wdj6NB737_JWQ4yQokF.OnqXtAD5GDZ3yPPhpmIr.66cTHUTphJkZSjG2_Ek2
 5CVuvYa3X8iu_m9wFOvOqWr0vqKbU7A.Uhaa8JvBLjD7H6ZCuplHb1VCfFypMgx4JN9qaW5FpqP3
 7A4c6YSvfrjp4nIngIDhw6wZur.C0rg4WQisLjVLH.albVgPv7WO1EE4VZxjHBcsl2tWa.l3K7SH
 LwOYQSargUUHZ4YSiHSnJQgBFvi.Pv_C.ns2oUE44MtiSmN5UIfeFVNcrorngps5Qu17.yLbtlYi
 ebcOi1JGExm.OWBPOf.Z0yCUGivpTnfwRv0vPQwDIMhNdCchLUaRjCBxAg8_meO7wxIJoRVTlTPe
 9Q1BnVqvsAIh_jHkYvtCytTYNx5bbGL_OXTY5kL6SXcSKixoL9efDgY3Qh.mMpjYXA3_lSMO19zd
 ZpiYb0IAyZSBz7SCWQPz8BfaGGHWmc1LmKI3fv8aNmb6wWrh7tOBgUjU0KE.oweZ7ErnmUHx8gvB
 4dF2EDzZsqPZQcWCB9PDKtiVCqRe2v_mPCXsC.L0ZEDj4xW3Pg0Kl1kecfbA7TH.L1_PRFIXNovW
 07SjWn5EN8XqOXUSkyGrCeudsKxjqJl10JXvrzKpOBLGUTJypLj2E1a9O22t41wJYM3vACI_Ka97
 a_4Ks3TMVBBAn6LPbWVq_UMqysskgXZe9wIVZy3F28_b5_BInuw59yE0GQhUnWhr0zAZnstbx1b0
 8nYDoMNJbfjG5gTBC1f5sl74cmb.vlw4mTeWDvn1kCRaacnOlRFISGPowVJKpziJO7zq1ToawPQN
 Xix5VOOKpHTxAjN8T0VMv08iWmYlJwyViVMxEFwM32a7xOq5Cg.VUAPAhnEnuaK3kBwoUU6Mi64b
 eEBLswoakiwSq5IZTN2Bh55lg8K0rCVmHmUWY7a.5zBOtQ3eEAP.SS7bKIW_1FZM9HuvROZ.3P7.
 Mgm2JLoR0yrixxN4GqoK797iiotVUO_stOPcp4.w_9mxW0LNJDIwUUTy4hv80br.Fg_.kg24yuuy
 iKCJng4dNtSmXpvNGPQflzIhTVSxpKkzSE1Hpm16PUmFAhsXTLiM3Fbq_VQoZZpUBHaVBgsvaudF
 JxiFGhWr6WceyDjdcdMD_Wi5XPN6B3p2ARUdF12N4A7EA4SdUS5WW._1Tmtbf9IdX9Mr7eRijkQW
 IMkh_NiFMm8I6Oh7QBqTJPcowsPS0q9V68PSrvGGEcxnbamOAMeoYvmNteDT6bd7vmTT1nUe75k5
 LrqAJVuSM9rA5Z5eHLkxBDAPf.Wq3j3t1S7xE9BGDwuvw8W4y.DArFwaloZ84sLbsfSKAUoifGcs
 E2Nl4drstT3jMfX3W30h9.qR7ni9xq.fzTDOXYj9I30BdeePogHgj636Z7GoX3AubQrSyQ_ajqxR
 fwT5OCgKVvlAciDjCxjI_3iElXcugX5Jcg4yILJ6REsgUeBU600KfCwU.TBF614A1zh675pgQTee
 Bp3eRVCg3xOcPDgVPGEsMpNQ36Nd4u_xJUnpxaAJkXWqE8w0u42zVSthCLJmOXGRn7OL.JyZFNfK
 Tczj2L3f495NnnuqSWWR.4P2_uPn4mzbolbOk0zuMelIee4isc6Bpszc0Nl7p6mRVV3JyMBzmAoK
 YUsopYQr8RnIa4neFNCU7xAEXAKiDLoD1AfYkeEvHKYSgx3wU95a6zz2e4HzinR3m4iHi5_kkUUV
 ZHmoGvOQHbwCMv2GUXsSVNJOQeRvW9i0uiGg9YgGlkFOdRD__PvXiMnUHPJyvxyD_0NDgqd0ZumS
 7IErEuLQUopyQzcPXPIVVha1.NOeH4IMHCXA8yrHnn6Om1_qWdzU0YOZdD.UvqyXaGlA2MyXEmId
 AAJHZynKt7Th1CEI1jym79ekG1xcpVDzOTyYS9.fKk3fr3s1s5I25srSvon57jkwIKs27hTeYsT4
 _g8jvb14n5pYMhrIgzpTRYtz1ldnh8p4g5w.qgqwpWipIfj1W5TO_IA--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 62e794d1-40a8-421b-84ea-00dfffbeee63
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ir2.yahoo.com with HTTP; Wed, 11 Mar 2026 09:50:07 +0000
Received: by hermes--production-ir2-bbcfb4457-g4h2c (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 1c9740cc45dfb191c8f687eedb670ab9;
          Wed, 11 Mar 2026 09:50:07 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Wed, 11 Mar 2026 10:48:07 +0100
Subject: [PATCH v4] media: staging: atomisp: Remove unnecessary return
 statements from void functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-atomisp-remove-void-return-v2b-v4-1-62275c55e353@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NsQ6CMBDG8VchnT3THkWByfcwDlAOuUQoabGRE
 N7dwsSm2/1v+H2L8OSYvCiTRTgK7NkOMfQpEaarhicBN7EFSrzIVGZQTbZnP4Kj3gaCYLmJ9/R
 2AwSsQRsqFDaECo2IyOio5c8+cH/E7thP1s37XlDb9286KFBQSKQs1WRqnd/mqrP2PL7EJgc8a
 Er+1DBqtaRr2uoiJ8wO2rquX+qx9r8ZAQAA
X-Change-ID: 20260305-atomisp-remove-void-return-v2b-4ce912de212c
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222606; l=37369;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=WhS/zDxaDnKDhT7isLQAUE9XOfqdwZQ4GtG7gs4tXTE=;
 b=QAm5+1LmxA8L+ecfIFY3EEK7EPpE/On4eMAlPf0znSt0PJCPKDEfLwgoScFH1eM9U5gS4IYLw
 GjvVNWVzU3GC6IJGVseZMooXP1eJswx27PU7YnBtQcLqufNMTjm672B
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260311-atomisp-remove-void-return-v2b-v4-1-62275c55e353.ref@yahoo.pl>
X-Rspamd-Queue-Id: 3C9A3261ADD
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
	TAGGED_FROM(0.00)[bounces-55373-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,checkpatch.pl:url]
X-Rspamd-Action: no action

Remove redundant 'return;' statements at the end of void functions
across the driver. Also remove blank lines left before closing braces
after the return statements were removed.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v4:
- Squashed all patches into one (as suggested by Andy Shevchenko)
- Also removed blank lines left before closing braces after return
  statements were removed (as suggested by Dan Carpenter)
- Link to v3: https://lore.kernel.org/r/20260310-atomisp-remove-void-return-v2b-v3-0-aae6a2764033@yahoo.pl

Changes in v3:
- Extended cleanup to all 27 files in the driver containing redundant
  'return;' statements at the end of void functions (as suggested by
  Andy Shevchenko): inputfifo.c, bufq.c, ifmtr.c, frame.c, rx.c,
  binary.c, ia_css_debug.c, mmu_public.h,
  isp2400_input_system_private.h, hmm_bo.c, sh_css.c, sp_private.h,
  fifo_monitor_private.h, isp.c, input_formatter_private.h, irq.c,
  mmu.c, fifo_monitor.c, gp_device.c, gdc.c, event_fifo_private.h,
  isp_private.h, input_formatter.c, irq_private.h, gpio_private.h,
  gp_device_private.h, atomisp_cmd.c
- Each removed 'return;' was verified to be at the end of a void function
- Compiled successfully: make M=drivers/staging/media/atomisp/
- Module loaded successfully in QEMU with Linux 7.0-rc3
- Link to v2: https://lore.kernel.org/r/20260310-atomisp-remove-void-return-v2b-v2-1-b0e73f498e25@yahoo.pl

Changes in v2:
- Fixed subject prefix to 'media: staging: atomisp:' (reported by media CI robot)
- Rebased on media-committers/next
- Verified with checkpatch.pl --strict: 0 errors, 0 warnings
- Compiled successfully: make M=drivers/staging/media/atomisp/
- Module loaded successfully in QEMU with Linux 7.0-rc2
- Link to v1: https://lore.kernel.org/r/20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48@yahoo.pl
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c          |  1 -
 .../pci/hive_isp_css_common/host/event_fifo_private.h    |  1 -
 .../atomisp/pci/hive_isp_css_common/host/fifo_monitor.c  |  5 -----
 .../pci/hive_isp_css_common/host/fifo_monitor_private.h  |  3 ---
 .../media/atomisp/pci/hive_isp_css_common/host/gdc.c     |  2 --
 .../atomisp/pci/hive_isp_css_common/host/gp_device.c     |  1 -
 .../pci/hive_isp_css_common/host/gp_device_private.h     |  1 -
 .../atomisp/pci/hive_isp_css_common/host/gpio_private.h  |  1 -
 .../pci/hive_isp_css_common/host/input_formatter.c       |  9 ---------
 .../hive_isp_css_common/host/input_formatter_private.h   |  1 -
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c     | 10 ----------
 .../atomisp/pci/hive_isp_css_common/host/irq_private.h   |  1 -
 .../media/atomisp/pci/hive_isp_css_common/host/isp.c     |  1 -
 .../atomisp/pci/hive_isp_css_common/host/isp_private.h   |  6 ------
 .../media/atomisp/pci/hive_isp_css_common/host/mmu.c     |  2 --
 .../atomisp/pci/hive_isp_css_common/host/sp_private.h    |  8 --------
 .../atomisp/pci/hive_isp_css_include/host/mmu_public.h   |  1 -
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c           |  7 -------
 .../media/atomisp/pci/isp2400_input_system_private.h     |  4 ----
 .../media/atomisp/pci/runtime/binary/src/binary.c        |  2 --
 .../staging/media/atomisp/pci/runtime/bufq/src/bufq.c    |  1 -
 .../media/atomisp/pci/runtime/debug/src/ia_css_debug.c   | 10 ----------
 .../staging/media/atomisp/pci/runtime/frame/src/frame.c  |  4 ----
 .../staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c  |  2 --
 .../media/atomisp/pci/runtime/inputfifo/src/inputfifo.c  | 16 ----------------
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c  |  8 --------
 drivers/staging/media/atomisp/pci/sh_css.c               | 11 -----------
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c     |  1 -
 28 files changed, 120 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..683e9d39a831 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1415,7 +1415,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h
index 439c69444942..b467cd7a63db 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/event_fifo_private.h
@@ -20,7 +20,6 @@ STORAGE_CLASS_EVENT_C void event_wait_for(const event_ID_t ID)
 	assert(ID < N_EVENT_ID);
 	assert(event_source_addr[ID] != ((hrt_address) - 1));
 	(void)ia_css_device_load_uint32(event_source_addr[ID]);
-	return;
 }
 
 STORAGE_CLASS_EVENT_C void cnd_event_wait_for(const event_ID_t ID,
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c
index f0de78815456..9aee5ebb2004 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c
@@ -492,8 +492,6 @@ void fifo_channel_get_state(
 		assert(0);
 		break;
 	}
-
-	return;
 }
 
 void fifo_switch_get_state(
@@ -514,8 +512,6 @@ void fifo_switch_get_state(
 	state->is_none = (data == HIVE_ISP_CSS_STREAM_SWITCH_NONE);
 	state->is_sp = (data == HIVE_ISP_CSS_STREAM_SWITCH_SP);
 	state->is_isp = (data == HIVE_ISP_CSS_STREAM_SWITCH_ISP);
-
-	return;
 }
 
 void fifo_monitor_get_state(
@@ -537,7 +533,6 @@ void fifo_monitor_get_state(
 		fifo_switch_get_state(ID, sw_id,
 				      &state->fifo_switches[sw_id]);
 	}
-	return;
 }
 
 static inline bool fifo_monitor_status_valid(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_private.h
index 53a3fb796aab..123cb89cf3ee 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monitor_private.h
@@ -31,8 +31,6 @@ STORAGE_CLASS_FIFO_MONITOR_C void fifo_switch_set(
 	(void)ID;
 
 	gp_device_reg_store(GP_DEVICE0_ID, FIFO_SWITCH_ADDR[switch_id], sel);
-
-	return;
 }
 
 STORAGE_CLASS_FIFO_MONITOR_C hrt_data fifo_switch_get(
@@ -56,7 +54,6 @@ STORAGE_CLASS_FIFO_MONITOR_C void fifo_monitor_reg_store(
 	assert(FIFO_MONITOR_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(FIFO_MONITOR_BASE[ID] + reg * sizeof(hrt_data),
 				   value);
-	return;
 }
 
 STORAGE_CLASS_FIFO_MONITOR_C hrt_data fifo_monitor_reg_load(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index 8bb78b4d7c67..81870a6d9751 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -49,7 +49,6 @@ void gdc_lut_store(
 		gdc_reg_store(ID, lut_offset++, word_0);
 		gdc_reg_store(ID, lut_offset++, word_1);
 	}
-	return;
 }
 
 /*
@@ -102,5 +101,4 @@ static inline void gdc_reg_store(
     const hrt_data		value)
 {
 	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c
index b934d20c88ea..35366da05390 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device.c
@@ -96,5 +96,4 @@ void gp_device_get_state(
 				   _REG_GP_SYNCGEN_FRAME_CNT_ADDR);
 	state->soft_reset = gp_device_reg_load(ID,
 					       _REG_GP_SOFT_RESET_ADDR);
-	return;
 }
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_private.h
index 71f20992ee98..f43e79a39f4d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_device_private.h
@@ -22,7 +22,6 @@ STORAGE_CLASS_GP_DEVICE_C void gp_device_reg_store(
 	assert(GP_DEVICE_BASE[ID] != (hrt_address) - 1);
 	assert((reg_addr % sizeof(hrt_data)) == 0);
 	ia_css_device_store_uint32(GP_DEVICE_BASE[ID] + reg_addr, value);
-	return;
 }
 
 STORAGE_CLASS_GP_DEVICE_C hrt_data gp_device_reg_load(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_private.h
index bcf6538ac0dc..27809117dde6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gpio_private.h
@@ -18,7 +18,6 @@ static inline void gpio_reg_store(
 	OP___assert(ID < N_GPIO_ID);
 	OP___assert(GPIO_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(GPIO_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 static inline hrt_data gpio_reg_load(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index 40b3f1e48c56..db4052ab3665 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -6,7 +6,6 @@
 
 #include "system_global.h"
 
-
 #include "input_formatter.h"
 #include <type_support.h>
 #include "gp_device.h"
@@ -65,8 +64,6 @@ void input_formatter_rst(
 	if (!HIVE_IF_BIN_COPY[ID]) {
 		input_formatter_reg_store(ID, addr, rst);
 	}
-
-	return;
 }
 
 unsigned int input_formatter_get_alignment(
@@ -88,7 +85,6 @@ void input_formatter_set_fifo_blocking_mode(
 		input_formatter_reg_store(ID,
 					  HIVE_IF_BLOCK_FIFO_NO_REQ_ADDRESS, enable);
 	}
-	return;
 }
 
 void input_formatter_get_switch_state(
@@ -121,8 +117,6 @@ void input_formatter_get_switch_state(
 					   _REG_GP_IFMT_input_switch_fsync_lut);
 	state->if_input_switch_ch_id_fmt_type = gp_device_reg_load(GP_DEVICE0_ID,
 						_REG_GP_IFMT_input_switch_ch_id_fmt_type);
-
-	return;
 }
 
 void input_formatter_get_state(
@@ -202,8 +196,6 @@ void input_formatter_get_state(
 				HIVE_IF_FSM_VECTOR_SUPPORT);
 	state->sensor_data_lost = input_formatter_reg_load(ID,
 				  HIVE_IF_FIFO_SENSOR_STATUS);
-
-	return;
 }
 
 void input_formatter_bin_get_state(
@@ -231,5 +223,4 @@ void input_formatter_bin_get_state(
 			 HIVE_STR2MEM_DUAL_BYTE_INPUTS_ENABLED_REG_ADDRESS);
 	state->en_status_update = input_formatter_reg_load(ID,
 				  HIVE_STR2MEM_EN_STAT_UPDATE_ADDRESS);
-	return;
 }
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_private.h
index 6b6ba49656e5..823861f2abe3 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_private.h
@@ -22,7 +22,6 @@ STORAGE_CLASS_INPUT_FORMATTER_C void input_formatter_reg_store(
 	assert(INPUT_FORMATTER_BASE[ID] != (hrt_address)-1);
 	assert((reg_addr % sizeof(hrt_data)) == 0);
 	ia_css_device_store_uint32(INPUT_FORMATTER_BASE[ID] + reg_addr, value);
-	return;
 }
 
 STORAGE_CLASS_INPUT_FORMATTER_C hrt_data input_formatter_reg_load(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index b66560bca625..a8fac8aebede 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -61,7 +61,6 @@ void irq_clear_all(
 
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_CLEAR_REG_IDX, mask);
-	return;
 }
 
 /*
@@ -105,8 +104,6 @@ void irq_enable_channel(
 		      _HRT_IRQ_CONTROLLER_MASK_REG_IDX, mask);
 
 	irq_wait_for_write_complete(ID);
-
-	return;
 }
 
 void irq_enable_pulse(
@@ -121,7 +118,6 @@ void irq_enable_pulse(
 	/* output is given as edge, not pulse */
 	irq_reg_store(ID,
 		      _HRT_IRQ_CONTROLLER_EDGE_NOT_PULSE_REG_IDX, edge_out);
-	return;
 }
 
 void irq_disable_channel(
@@ -151,8 +147,6 @@ void irq_disable_channel(
 		      _HRT_IRQ_CONTROLLER_CLEAR_REG_IDX, me);
 
 	irq_wait_for_write_complete(ID);
-
-	return;
 }
 
 enum hrt_isp_css_irq_status irq_get_channel_id(
@@ -213,7 +207,6 @@ void irq_raise(
 			    (unsigned int)addr, 1);
 	gp_device_reg_store(GP_DEVICE0_ID,
 			    (unsigned int)addr, 0);
-	return;
 }
 
 bool any_virq_signal(void)
@@ -252,7 +245,6 @@ void cnd_virq_enable_channel(
 			irq_disable_channel(IRQ0_ID, IRQ_NESTING_ID[ID]);
 		}
 	}
-	return;
 }
 
 void virq_clear_all(void)
@@ -262,7 +254,6 @@ void virq_clear_all(void)
 	for (irq_id = (irq_ID_t)0; irq_id < N_IRQ_ID; irq_id++) {
 		irq_clear_all(irq_id);
 	}
-	return;
 }
 
 enum hrt_isp_css_irq_status
@@ -304,7 +295,6 @@ void virq_clear_info(struct virq_info *irq_info)
 	for (ID = (irq_ID_t)0 ; ID < N_IRQ_ID; ID++) {
 		irq_info->irq_status_reg[ID] = 0;
 	}
-	return;
 }
 
 enum hrt_isp_css_irq_status virq_get_channel_id(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_private.h
index ae0a8466a70a..5e27f053f00c 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_private.h
@@ -21,7 +21,6 @@ STORAGE_CLASS_IRQ_C void irq_reg_store(
 	assert(ID < N_IRQ_ID);
 	assert(IRQ_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(IRQ_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 STORAGE_CLASS_IRQ_C hrt_data irq_reg_load(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
index 39cccbfa3fca..17a04ac623ff 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
@@ -27,7 +27,6 @@ void cnd_isp_irq_enable(
 		isp_ctrl_clearbit(ID, ISP_IRQ_READY_REG,
 				  ISP_IRQ_READY_BIT);
 	}
-	return;
 }
 
 /* ISP functions to control the ISP state from the host, even in crun. */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_private.h
index 177770a9bc1d..b699a1c3af0b 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_private.h
@@ -30,7 +30,6 @@ STORAGE_CLASS_ISP_C void isp_ctrl_store(
 #else
 	hrt_master_port_store_32(ISP_CTRL_BASE[ID] + reg * sizeof(hrt_data), value);
 #endif
-	return;
 }
 
 STORAGE_CLASS_ISP_C hrt_data isp_ctrl_load(
@@ -64,7 +63,6 @@ STORAGE_CLASS_ISP_C void isp_ctrl_setbit(
 	hrt_data	data = isp_ctrl_load(ID, reg);
 
 	isp_ctrl_store(ID, reg, (data | (1UL << bit)));
-	return;
 }
 
 STORAGE_CLASS_ISP_C void isp_ctrl_clearbit(
@@ -75,7 +73,6 @@ STORAGE_CLASS_ISP_C void isp_ctrl_clearbit(
 	hrt_data	data = isp_ctrl_load(ID, reg);
 
 	isp_ctrl_store(ID, reg, (data & ~(1UL << bit)));
-	return;
 }
 
 STORAGE_CLASS_ISP_C void isp_dmem_store(
@@ -91,7 +88,6 @@ STORAGE_CLASS_ISP_C void isp_dmem_store(
 #else
 	hrt_master_port_store(ISP_DMEM_BASE[ID] + addr, data, size);
 #endif
-	return;
 }
 
 STORAGE_CLASS_ISP_C void isp_dmem_load(
@@ -107,7 +103,6 @@ STORAGE_CLASS_ISP_C void isp_dmem_load(
 #else
 	hrt_master_port_load(ISP_DMEM_BASE[ID] + addr, data, size);
 #endif
-	return;
 }
 
 STORAGE_CLASS_ISP_C void isp_dmem_store_uint32(
@@ -123,7 +118,6 @@ STORAGE_CLASS_ISP_C void isp_dmem_store_uint32(
 #else
 	hrt_master_port_store_32(ISP_DMEM_BASE[ID] + addr, data);
 #endif
-	return;
 }
 
 STORAGE_CLASS_ISP_C uint32_t isp_dmem_load_uint32(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
index 064e88a5e064..6d5434a27a7c 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/mmu.c
@@ -12,7 +12,6 @@ void mmu_set_page_table_base_index(
     const hrt_data		base_index)
 {
 	mmu_reg_store(ID, _HRT_MMU_PAGE_TABLE_BASE_ADDRESS_REG_IDX, base_index);
-	return;
 }
 
 hrt_data mmu_get_page_table_base_index(
@@ -25,7 +24,6 @@ void mmu_invalidate_cache(
     const mmu_ID_t		ID)
 {
 	mmu_reg_store(ID, _HRT_MMU_INVALIDATE_TLB_REG_IDX, 1);
-	return;
 }
 
 void mmu_invalidate_cache_all(void)
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
index c69778411f2f..b03ae6658df3 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp_private.h
@@ -21,7 +21,6 @@ STORAGE_CLASS_SP_C void sp_ctrl_store(
 	assert(ID < N_SP_ID);
 	assert(SP_CTRL_BASE[ID] != (hrt_address)-1);
 	ia_css_device_store_uint32(SP_CTRL_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 STORAGE_CLASS_SP_C hrt_data sp_ctrl_load(
@@ -51,7 +50,6 @@ STORAGE_CLASS_SP_C void sp_ctrl_setbit(
 	hrt_data	data = sp_ctrl_load(ID, reg);
 
 	sp_ctrl_store(ID, reg, (data | (1UL << bit)));
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_ctrl_clearbit(
@@ -62,7 +60,6 @@ STORAGE_CLASS_SP_C void sp_ctrl_clearbit(
 	hrt_data	data = sp_ctrl_load(ID, reg);
 
 	sp_ctrl_store(ID, reg, (data & ~(1UL << bit)));
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store(
@@ -74,7 +71,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store(
 	assert(ID < N_SP_ID);
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	ia_css_device_store(SP_DMEM_BASE[ID] + addr, data, size);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_load(
@@ -86,7 +82,6 @@ STORAGE_CLASS_SP_C void sp_dmem_load(
 	assert(ID < N_SP_ID);
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	ia_css_device_load(SP_DMEM_BASE[ID] + addr, data, size);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store_uint8(
@@ -98,7 +93,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store_uint8(
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	(void)ID;
 	ia_css_device_store_uint8(SP_DMEM_BASE[SP0_ID] + addr, data);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store_uint16(
@@ -110,7 +104,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store_uint16(
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	(void)ID;
 	ia_css_device_store_uint16(SP_DMEM_BASE[SP0_ID] + addr, data);
-	return;
 }
 
 STORAGE_CLASS_SP_C void sp_dmem_store_uint32(
@@ -122,7 +115,6 @@ STORAGE_CLASS_SP_C void sp_dmem_store_uint32(
 	assert(SP_DMEM_BASE[ID] != (hrt_address)-1);
 	(void)ID;
 	ia_css_device_store_uint32(SP_DMEM_BASE[SP0_ID] + addr, data);
-	return;
 }
 
 STORAGE_CLASS_SP_C uint8_t sp_dmem_load_uint8(
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 1a435a348318..2fc137ef46da 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -63,7 +63,6 @@ static inline void mmu_reg_store(
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 /*! Read from a control register of MMU[ID]
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 856561e951a5..0acdb3cddc01 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -339,7 +339,6 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
 	spin_lock_init(&bdev->list_lock);
 	mutex_init(&bdev->rbtree_mutex);
 
-
 	INIT_LIST_HEAD(&bdev->entire_bo_list);
 	bdev->allocated_rbtree = RB_ROOT;
 	bdev->free_rbtree = RB_ROOT;
@@ -483,7 +482,6 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
 	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);
 
 	mutex_unlock(&bdev->rbtree_mutex);
-	return;
 }
 
 void hmm_bo_device_exit(struct hmm_bo_device *bdev)
@@ -737,8 +735,6 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 	kfree(bo->pages);
 	mutex_unlock(&bo->mutex);
 
-	return;
-
 status_err2:
 	mutex_unlock(&bo->mutex);
 	dev_err(atomisp_dev,
@@ -868,8 +864,6 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
 
 	mutex_unlock(&bo->mutex);
 
-	return;
-
 status_err:
 	mutex_unlock(&bo->mutex);
 	dev_err(atomisp_dev,
@@ -948,7 +942,6 @@ void hmm_bo_vunmap(struct hmm_buffer_object *bo)
 	}
 
 	mutex_unlock(&bo->mutex);
-	return;
 }
 
 void hmm_bo_ref(struct hmm_buffer_object *bo)
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
index a6762683a0ac..00e6574f186a 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_private.h
@@ -22,7 +22,6 @@ STORAGE_CLASS_INPUT_SYSTEM_C void input_system_reg_store(
 	assert(INPUT_SYSTEM_BASE[ID] != (hrt_address)-1);
 	ia_css_device_store_uint32(INPUT_SYSTEM_BASE[ID] + reg * sizeof(hrt_data),
 				   value);
-	return;
 }
 
 STORAGE_CLASS_INPUT_SYSTEM_C hrt_data input_system_reg_load(
@@ -43,7 +42,6 @@ STORAGE_CLASS_INPUT_SYSTEM_C void receiver_reg_store(
 	assert(ID < N_RX_ID);
 	assert(RX_BASE[ID] != (hrt_address)-1);
 	ia_css_device_store_uint32(RX_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 STORAGE_CLASS_INPUT_SYSTEM_C hrt_data receiver_reg_load(
@@ -67,7 +65,6 @@ STORAGE_CLASS_INPUT_SYSTEM_C void receiver_port_reg_store(
 	assert(MIPI_PORT_OFFSET[port_ID] != (hrt_address)-1);
 	ia_css_device_store_uint32(RX_BASE[ID] + MIPI_PORT_OFFSET[port_ID] + reg *
 				   sizeof(hrt_data), value);
-	return;
 }
 
 STORAGE_CLASS_INPUT_SYSTEM_C hrt_data receiver_port_reg_load(
@@ -95,7 +92,6 @@ STORAGE_CLASS_INPUT_SYSTEM_C void input_system_sub_system_reg_store(
 	assert(SUB_SYSTEM_OFFSET[sub_ID] != (hrt_address)-1);
 	ia_css_device_store_uint32(INPUT_SYSTEM_BASE[ID] + SUB_SYSTEM_OFFSET[sub_ID] +
 				   reg * sizeof(hrt_data), value);
-	return;
 }
 
 STORAGE_CLASS_INPUT_SYSTEM_C hrt_data input_system_sub_system_reg_load(
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..756602cb43c2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -265,7 +265,6 @@ binary_get_shading_info_type_1(const struct ia_css_binary *binary,	/* [in] */
 	return err;
 }
 
-
 int
 ia_css_binary_get_shading_info(const struct ia_css_binary *binary,			/* [in] */
 			       enum ia_css_shading_correction_type type,		/* [in] */
@@ -344,7 +343,6 @@ ia_css_binary_dvs_stat_grid_info(
 {
 	(void)pipe;
 	sh_css_binary_common_grid_info(binary, info);
-	return;
 }
 
 int
diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
index 0f0d16f4ce7c..51f7c9d6f378 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
@@ -176,7 +176,6 @@ static void map_buffer_type_to_queue_id(
 	}
 
 	assert(i != SH_CSS_MAX_NUM_QUEUES);
-	return;
 }
 
 static void unmap_buffer_type_to_queue_id(
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index b411ca2f415e..789d074a4542 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -136,7 +136,6 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
 void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
 {
 	dbg_level = trace_level;
-	return;
 }
 
 unsigned int ia_css_debug_get_dtrace_level(void)
@@ -315,7 +314,6 @@ static void debug_print_fifo_channel_state(const fifo_channel_state_t *state,
 			    state->fifo_valid);
 	ia_css_debug_dtrace(2, "\t%-32s: %d\n", "sink accept",
 			    state->sink_accept);
-	return;
 }
 
 void ia_css_debug_dump_pif_a_isp_fifo_state(void)
@@ -364,7 +362,6 @@ void ia_css_debug_dump_all_fifo_state(void)
 	for (i = 0; i < N_FIFO_CHANNEL; i++)
 		debug_print_fifo_channel_state(&state.fifo_channels[i],
 					       "squepfstqkt");
-	return;
 }
 
 static void debug_binary_info_print(const struct ia_css_binary_xinfo *info)
@@ -386,7 +383,6 @@ static void debug_binary_info_print(const struct ia_css_binary_xinfo *info)
 	ia_css_debug_dtrace(2, "enable_uds = %d\n", info->sp.enable.uds);
 	ia_css_debug_dtrace(2, "enable ds = %d\n", info->sp.enable.ds);
 	ia_css_debug_dtrace(2, "s3atbl_use_dmem = %d\n", info->sp.s3a.s3atbl_use_dmem);
-	return;
 }
 
 void ia_css_debug_binary_print(const struct ia_css_binary *bi)
@@ -441,7 +437,6 @@ void ia_css_debug_binary_print(const struct ia_css_binary *bi)
 			    bi->sctbl_width_per_color);
 	ia_css_debug_dtrace(2, "s3atbl_width = %d\n", bi->s3atbl_width);
 	ia_css_debug_dtrace(2, "s3atbl_height = %d\n", bi->s3atbl_height);
-	return;
 }
 
 void ia_css_debug_frame_print(const struct ia_css_frame *frame,
@@ -526,7 +521,6 @@ void ia_css_debug_frame_print(const struct ia_css_frame *frame,
 		ia_css_debug_dtrace(2, "  unknown frame type\n");
 		break;
 	}
-	return;
 }
 
 #if SP_DEBUG != SP_DEBUG_NONE
@@ -808,8 +802,6 @@ void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
 #endif
 
 #if SP_DEBUG != SP_DEBUG_NONE
-
-	return;
 }
 #endif
 
@@ -823,7 +815,6 @@ void ia_css_debug_dump_sp_sw_debug_info(void)
 #endif
 	ia_css_bufq_dump_queue_info();
 	ia_css_pipeline_dump_thread_map_info();
-	return;
 }
 
 /* this function is for debug use, it can make SP go to sleep
@@ -1273,7 +1264,6 @@ ia_css_debug_pipe_graph_dump_stage(
 
 					snprintf(enable_info, sizeof(enable_info), "%s\\n%s",
 						 enable_info1, enable_info2);
-
 				} else {
 					/* 2nd line is still too long */
 					p = ENABLE_LINE_MAX_LENGTH;
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
diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
index 50b0b31d734a..9739ab25000c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
@@ -471,8 +471,6 @@ static void ifmtr_set_if_blocking_mode(
 			input_formatter_set_fifo_blocking_mode(id, block[id]);
 		}
 	}
-
-	return;
 }
 
 static int ifmtr_start_column(
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
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 9cfb8bc97e24..acc7e5f76f58 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -43,8 +43,6 @@ void ia_css_isys_rx_enable_all_interrupts(enum mipi_port_id port)
 	 * The CSI is nested into the Iunit IRQ's
 	 */
 	ia_css_irq_enable(IA_CSS_IRQ_INFO_CSS_RECEIVER_ERROR, true);
-
-	return;
 }
 
 /* This function converts between the enum used on the CSS API and the
@@ -196,8 +194,6 @@ void ia_css_isys_rx_clear_irq_info(enum mipi_port_id port,
 	receiver_port_reg_store(RX0_ID,
 				port,
 				_HRT_CSS_RECEIVER_IRQ_ENABLE_REG_IDX, bits);
-
-	return;
 }
 
 static int ia_css_isys_2400_set_fmt_type(enum atomisp_input_format input_format,
@@ -530,7 +526,6 @@ unsigned int ia_css_csi2_calculate_input_system_alignment(
 	return memory_alignment_in_bytes;
 }
 
-
 static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
 	{MIPI_4LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
 	{MIPI_3LANE_CFG, MIPI_1LANE_CFG, MIPI_0LANE_CFG},
@@ -637,8 +632,6 @@ void ia_css_isys_rx_configure(const rx_cfg_t *config,
 	 *                INPUT_SYSTEM_CSI_RECEIVER_SELECT_BACKENG, 1);
 	 */
 	input_system_reg_store(INPUT_SYSTEM0_ID, 0x207, 1);
-
-	return;
 }
 
 void ia_css_isys_rx_disable(void)
@@ -650,5 +643,4 @@ void ia_css_isys_rx_disable(void)
 					_HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX,
 					false);
 	}
-	return;
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..50b55ec979ea 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -65,7 +65,6 @@
 
 #define SH_CSS_VIDEO_BUFFER_ALIGNMENT 0
 
-
 #include "ia_css_spctrl.h"
 #include "ia_css_version_data.h"
 #include "sh_css_struct.h"
@@ -1095,7 +1094,6 @@ static inline int stream_unregister_with_csi_rx(
 	return stream_csi_rx_helper(stream, ia_css_isys_csi_rx_unregister_stream);
 }
 
-
 static void
 start_binary(struct ia_css_pipe *pipe,
 	     struct ia_css_binary *binary)
@@ -2042,7 +2040,6 @@ int ia_css_irq_translate(
 		if (status == hrt_isp_css_irq_status_error)
 			return -EINVAL;
 
-
 		switch (irq) {
 		case virq_sp:
 			/*
@@ -2148,7 +2145,6 @@ int ia_css_irq_enable(
 	return 0;
 }
 
-
 static unsigned int
 sh_css_get_sw_interrupt_value(unsigned int irq)
 {
@@ -2928,8 +2924,6 @@ ia_css_get_crop_offsets(
 	in_frame->crop_info.start_line = row;
 
 	IA_CSS_LEAVE_PRIVATE("void start_col: %u start_row: %u", column, row);
-
-	return;
 }
 
 static int
@@ -3326,8 +3320,6 @@ static void send_raw_frames(struct ia_css_pipe *pipe)
 							    pipe->continuous_frames[i], pipe->cont_md_buffers[i]);
 		}
 	}
-
-	return;
 }
 
 static int
@@ -3521,7 +3513,6 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 				    "ia_css_pipe_enqueue_buffer() buf_type=%d, data(DDR address)=0x%x\n",
 				    buf_type, buffer->data.frame->data);
-
 	}
 
 	/* start of test for using rmgr for acq/rel memory */
@@ -5140,7 +5131,6 @@ static int load_primary_binaries(
 			}
 		}
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
-
 	} else {
 		capt_pp_out_info = pipe->output_info[0];
 	}
@@ -8930,7 +8920,6 @@ void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 	IA_CSS_LEAVE("");
 }
 
-
 int
 ia_css_unlock_raw_frame(struct ia_css_stream *stream, uint32_t exp_id)
 {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index 9ccdb66de2df..3d2cb2d25fdb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -269,5 +269,4 @@ ia_css_dvs_statistics_get(enum dvs_statistics_type type,
 		ia_css_get_dvs2_statistics(host_stats->p_dvs2_statistics_host,
 					   isp_stats->p_dvs_statistics_isp);
 	}
-	return;
 }

---
base-commit: c24bad1b9ac3ee3a63dcdeaa082cf671a4be1345
change-id: 20260305-atomisp-remove-void-return-v2b-4ce912de212c

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>


