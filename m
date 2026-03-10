Return-Path: <linux-media+bounces-55264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LI9LE6XsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:12:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31833258C3F
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F32173058459
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC94B3F0A9C;
	Tue, 10 Mar 2026 22:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="ZTbeEhJW"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic314-20.consmr.mail.ir2.yahoo.com (sonic314-20.consmr.mail.ir2.yahoo.com [77.238.177.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AAB3C3BF4
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180747; cv=none; b=rzFhOxu+sXpDONHPlgCuoXO2ACRCbYF8x25h8Y4J0hAwEiQ+/T/kEaXY9VnDW3n8HlAOms82HCzMqFuydMTCXXum7EQIRvMY26wtRBqF1eSMJ8KjR//byfe9+scw0CUSCBd6AQ54vFGqqigIZU79G+PZZ0aaIz5b780F/yL+tFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180747; c=relaxed/simple;
	bh=ZapjEgE+O4lUxKOaUFHzeZeEA7F12CLDNCgkbmMGBvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=sKM4slQpmMuxXq5AVM/mmV/d7SXLNSELyfD5nTvUv7aweMFWoGVl3HvqlJqdMzGWqGQVl3WhTwuZrpIdYrhVSvQTFhXp0ecCMP7HRm4WaqmC32esMTZ5YkXcEGH7ECQx2sjQBR4mjC7ROhfS7tRGIW9HauWlVb5QEcDdmT1OBNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=ZTbeEhJW; arc=none smtp.client-ip=77.238.177.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773180743; bh=OiByHmwNjeBF90R013v+8zqMHZLil/u0kruVMtTLeUM=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=ZTbeEhJW8mHKO946Gjy066nPXtg2zrpmJ5BJBeRYZPgQlOWmt98hJDpiPABmBcGNMDHLlN48g9YHBG6x6yccPWQhLFDhHCxhDYKO1Va2dq9mc+NZGvsmG+sOpkQ6iItbI6XOplbh+TU1zHMp3AcNGlcjfVStdXuZD15EYDyEttg0PgcqRs1a0xV4Xmw9h0NXuWN4BGXKR6bx7AZpMBzqurpvCBPe216dOKdqc7QCi3df0z4l4eB6Nr9CdCrKm9AQvBoPGus7F/Aa2z9p+0o+tg/woDttlYsCPTfgsufMozfHVnckoL+NxoLn1X7CD/EGrMKJcQCZtWESXxDnRyP7rA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773180743; bh=qSizoHprBMnvWr/hWhNDOROftt2GwLlzrjp+r83vuxr=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=eyhT61AX8BTHvpWpoyS/VQjSTVAjLkiACj+URoLWr8dRgY6uku8qS+BoozxA+3HHGQ0Oln4sGZA4EZX7LgzINOS39QQpF38iYY+SoL9N2VEQGfRVmrLrAJYoWKjpE3ipU/TB9moreZeDmAq/9Oq+N0FvIfuc0Irl4bIoQ+CVxGJUJ88MltxowdUwMsm8I/EnEgXTS7s45ARvsU/DXGvpM/wKe2cGDK6+dYzWwZ3IL3Snb08cNTKgtlm6ybtKqgdUqu2A+9G1u/t6ZV371QZfl03tT/y3eME7Kh7wi66bqk6J14In6PY2NKOd7NcqfeYGIjXG7NRwULvDEWjSAqKpTw==
X-YMail-OSG: m5sva1oVM1lviALGLztEok5tp7YpVEOroBZz2IP5s2aV2bXkDSNyU6obSYGBBnP
 Xdb2Ke59WoprZnT4Cujacnl5TmyG.M0yZAdvjrAe3lrAFFLDb.oBi_0ChKyom.M6eQe2VxxJw7F1
 ID4toFUNgRXaiV8iKgiHids829KSTcMXfiHTtAy2dQ.NJ9KM9Nx4C6pKD_pELdJ83hqq4vJWu47e
 UyLhNb.DZ14VGYAxMWbGns2CNvRYuVmOsUxS4eMpFfA.S4SsKNXv_8ndyIBlXTUjgyB8aBc9pXMO
 0WKYYAJi_odwoHdF5xrA3Xix8iQYy0JW5AW7Wo0R99k9keIkePzo.4km36YnxFrMYajpzl8tHJaS
 oSkak9Z3FL8fbMH74IcyOdav47pXntgrk_CUwUCvhnmqB7N1I5UkoQLwZCCCbU8lb92zSH_1dgBE
 aEE.upjprxji4VpZ_a1M0fRepR8H78SWfvibUPo3NQ3xQpTvhmhUN2UYIg1FnK9S1WiyDfC05nfo
 TRC64xLjPl3N6d_NNX1IlAuLn1IRPXvAgU4lGLqD4UO12hlupUn4bMi.5fZToCnC_60NndS3h9op
 zsQp1fU99YpQOQKFNBdiN_pEB_Fkn1T8_33oWq0zaUbptnAcGWVx.nXFGRrWGAAbX9XVf6UCTgeB
 tTct4eRVwu4zJ54wesU03HrlVcswEFkVtzHUCZtyPOqfJMtQT0DX5Y2p_Tpzw7SrMpiq0hcwwspJ
 sT0ZArUsur0LDju5GR8B4ZlgmlgM3ZLB2SnIygcXcn5Qtd3Nm7AbUlZYgNnll_hWnAsDwLmJzjY4
 U6aHvjuRU3cRvJNCUwH7CyJf0ZALVxk8m8TZHlkavtPU2WZFiiYSnJ0yR2ApUGoNWK16SMnnIgCc
 9jqKRlp5MCPf3EzKoLQ5bsKDRJu54G15eleVGblah.5Oawfq8haCMa9qRV3xNauvpMRq5efcFW8I
 rXw1vwiVPpByOu9n1yUnm.mCEIOgQ5agTVa6gNO3H1h0DtKFz7Q0Vywpg7dCTciJ8V4j54WpORau
 cW5ZyvjHX4S5P842pHyWirzXwg90SbRFnagRfLSMfa3AEJx3n8ofQRLlUBRSOFiWOHzytDRfXath
 8chzSxUDpEDKQVbWp73Du_MeYw3aE37_f6sv9xGSbcvsCqpMpweA1dYX63Y_KvYNFOTc9lAYFiaF
 eyHJDkBQBPZpddrhuo2PCdUrAZSjBPe0THUw9dSnH_emd623zWt.avh2gi_VcRWiz2wa2TqsCqQG
 JGQpS8ky7IiwUuap4DHR6og3TebETsuxg6LbVLno3rTJOF_u73cYmZGEIPXN0B7Prz5DbzAroPQG
 _BauZTVmJu_ATjSHmtpZ8hJ1TmWo3yc__OuYsQbgNCFDz4NJhS5uLHqMzo5yZzsbP9n1YrQUsOdx
 fbluW_8y.oxY1ymPsmRmqrf_evqmPQKyl7OCBBPB0Yu0RUGoQo2hDge1r4.c8wnJrCNduFk3yH2P
 4mCnYaEPGyCcnuRZVbR1diCCGk5NtrNmp_0y4suIFg44wAtHyzhM7OxOK0ELjL4CwqSEvz0Lcuoo
 xywB729QMflHBsaE993tHueggQfXEz5ejajCNlVg0H9OTkEWxqBIhvAUSf8nyT0ctl0sJpk4zy1k
 V5td9yDqVRQo9AKn_.0Wxm0.RPHFBiL2Mn1fSgNk5rb0BsS0jwFCHF9B4EnapsUdhMr9UB5YNhNI
 d6l64V5FBI2srmLnHL7NgIphW77sb4TRMzVSsAZGg7kTo0geNYhYjLCT2QUElqYkvcMFTcku3CHh
 wEYn6XWFzNSNg1If1J.lj.RJwuOCX9Ye5oscyQXTD4oKC5dWMgCZmJXM9q8w7qSMQK6HDUgwsJ_b
 NhOjVfOp7bfKKtnsaQppay4oU5ILrdDpJE6rt8n8fzI5dMxtLo_kQlPD2U5w2jCb16uqpDxMV5uS
 5VZ04yJka7ZpAEW4qEHU2pGJdpjKEG9K2JHd0IAPPXsTeYqaDYiniZ5HHsrZ3kclsf5nEsLd5KI2
 ZfSf_wICACFitGBp87qeUUOCpecjYim7I.9B5DJBu3uZL0JhIcCQg7nItLhPbesiIQ0Bi._gpx7X
 MWMNERg6xwuw3iOLo0hoKPhheKLBWUstEYlvTs4CDsJcTBWEKRDMU4dTTBJN2_9W8o4whlRBEHNA
 9ICSFdVOrYp.bonvfUPDe9F5bcGbZPWAkoJ84.n1tQK5AjYc3E5KKBOZjFg68Wb3kp13lBarRKoP
 .UYyboQt8TpDWkuyBqmrpARv2U_3RW8xN37XSK_JA4Cy8c6xoNC7zJoLo7ZrPTlRwAVkDrtlHW.i
 _so3AQ5s3AO_0ZjkfuWCcSq2AHOfPBJHD0JjO62DaWQ--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 79721ceb-00ad-4d4e-9696-57650f20df21
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 22:12:23 +0000
Received: by hermes--production-ir2-bbcfb4457-4sf65 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 48b5c4a15ee0780b19eed7b75aa629cc;
          Tue, 10 Mar 2026 22:12:22 +0000 (UTC)
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
Subject: [PATCH v3 00/28] media: staging: atomisp: Remove unnecessary return statements from void functions
Date: Tue, 10 Mar 2026 23:09:44 +0100
Message-ID: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260305-atomisp-remove-void-return-v2b-4ce912de212c
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit
References: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc.ref@yahoo.pl>
X-Rspamd-Queue-Id: 31833258C3F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[yahoo.pl,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-55264-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,checkpatch.pl:url]
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
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
Tomasz Unger (28):
      media: staging: atomisp: Remove unnecessary return statement in void function
      media: staging: atomisp: Remove unnecessary return statements in inputfifo.c
      media: staging: atomisp: Remove unnecessary return statement in bufq.c
      media: staging: atomisp: Remove unnecessary return statement in ifmtr.c
      media: staging: atomisp: Remove unnecessary return statements in frame.c
      media: staging: atomisp: Remove unnecessary return statements in rx.c
      media: staging: atomisp: Remove unnecessary return statement in binary.c
      media: staging: atomisp: Remove unnecessary return statements in ia_css_debug.c
      media: staging: atomisp: Remove unnecessary return statement in mmu_public.h
      media: staging: atomisp: Remove unnecessary return statements in isp2400_input_system_private.h
      media: staging: atomisp: Remove unnecessary return statements in hmm_bo.c
      media: staging: atomisp: Remove unnecessary return statements in sh_css.c
      media: staging: atomisp: Remove unnecessary return statements in sp_private.h
      media: staging: atomisp: Remove unnecessary return statements in fifo_monitor_private.h
      media: staging: atomisp: Remove unnecessary return statement in isp.c
      media: staging: atomisp: Remove unnecessary return statement in input_formatter_private.h
      media: staging: atomisp: Remove unnecessary return statements in irq.c
      media: staging: atomisp: Remove unnecessary return statements in mmu.c
      media: staging: atomisp: Remove unnecessary return statements in fifo_monitor.c
      media: staging: atomisp: Remove unnecessary return statement in gp_device.c
      media: staging: atomisp: Remove unnecessary return statements in gdc.c
      media: staging: atomisp: Remove unnecessary return statement in event_fifo_private.h
      media: staging: atomisp: Remove unnecessary return statements in isp_private.h
      media: staging: atomisp: Remove unnecessary return statements in input_formatter.c
      media: staging: atomisp: Remove unnecessary return statement in irq_private.h
      media: staging: atomisp: Remove unnecessary return statement in gpio_private.h
      media: staging: atomisp: Remove unnecessary return statement in gp_device_private.h
      media: staging: atomisp: Remove unnecessary return statement in atomisp_cmd.c

 drivers/staging/media/atomisp/pci/atomisp_cmd.c          |  1 -
 .../pci/hive_isp_css_common/host/event_fifo_private.h    |  1 -
 .../atomisp/pci/hive_isp_css_common/host/fifo_monitor.c  |  3 ---
 .../pci/hive_isp_css_common/host/fifo_monitor_private.h  |  2 --
 .../media/atomisp/pci/hive_isp_css_common/host/gdc.c     |  2 --
 .../atomisp/pci/hive_isp_css_common/host/gp_device.c     |  1 -
 .../pci/hive_isp_css_common/host/gp_device_private.h     |  1 -
 .../atomisp/pci/hive_isp_css_common/host/gpio_private.h  |  1 -
 .../pci/hive_isp_css_common/host/input_formatter.c       |  5 -----
 .../hive_isp_css_common/host/input_formatter_private.h   |  1 -
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c     |  8 --------
 .../atomisp/pci/hive_isp_css_common/host/irq_private.h   |  1 -
 .../media/atomisp/pci/hive_isp_css_common/host/isp.c     |  1 -
 .../atomisp/pci/hive_isp_css_common/host/isp_private.h   |  6 ------
 .../media/atomisp/pci/hive_isp_css_common/host/mmu.c     |  2 --
 .../atomisp/pci/hive_isp_css_common/host/sp_private.h    |  8 --------
 .../atomisp/pci/hive_isp_css_include/host/mmu_public.h   |  1 -
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c           |  4 ----
 .../media/atomisp/pci/isp2400_input_system_private.h     |  4 ----
 .../media/atomisp/pci/runtime/binary/src/binary.c        |  1 -
 .../staging/media/atomisp/pci/runtime/bufq/src/bufq.c    |  1 -
 .../media/atomisp/pci/runtime/debug/src/ia_css_debug.c   |  8 --------
 .../staging/media/atomisp/pci/runtime/frame/src/frame.c  |  4 ----
 .../staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c  |  1 -
 .../media/atomisp/pci/runtime/inputfifo/src/inputfifo.c  | 16 ----------------
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c  |  4 ----
 drivers/staging/media/atomisp/pci/sh_css.c               |  2 --
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c     |  1 -
 28 files changed, 91 deletions(-)
---
base-commit: c24bad1b9ac3ee3a63dcdeaa082cf671a4be1345
change-id: 20260305-atomisp-remove-void-return-v2b-4ce912de212c

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>


