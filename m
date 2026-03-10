Return-Path: <linux-media+bounces-55244-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIwUFJ+RsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55244-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:48:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A1225878E
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23C0931270E6
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9173F1662;
	Tue, 10 Mar 2026 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="Fjhvk5Dn"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic301-22.consmr.mail.ir2.yahoo.com (sonic301-22.consmr.mail.ir2.yahoo.com [77.238.176.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8B140DFA0
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.176.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179275; cv=none; b=lLAjcFmEE7ufr24xQJex1587hidrPR5wIUBIX/1LaAyZ/sCJJtl0RO4ONDWHQX7QAGYgsz3S4YOwcDdJzrZyprdO60J8c78x6luBUbxsAumuv4rGf8O69kDrJzqNpAbNbGmrX8ZYmxhu+lLwt5ryZBvIVDWL/dOylQApI8GK7Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179275; c=relaxed/simple;
	bh=ZbandGBElW0N5pYeEKM6bJhSvoKphyY31WkUTwSebZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc:
	 References; b=HBBNB6y8ZVCzu3Gxy4TrFLrPf9ZbnBmzfqPiesX9b7BCqoLY/BFuRWLsbUHEE8MrlXGrz0okWDvoIU6fJ3uNKQMgVCqClA+17JaQCyRolqD2GpoSINUv4jJu9EQG2/JMnlpxDNJnVV6SiTHlEVLxfy3tytC0UP5jZXK/HcZiY2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=Fjhvk5Dn; arc=none smtp.client-ip=77.238.176.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179272; bh=Zo0OiRyYuIByE+/0MTgWLPhDYAHJtmXswAlCOwf731k=; h=From:Subject:Date:To:Cc:References:From:Subject:Reply-To; b=Fjhvk5DnssNkK7xV3Q5Kq9ScfeY2lXmPT0qx1Nqg+ceTev6hD9k0p6YlmsQIcpQJOPnxlG6ABu2JYJZTaJPnQOrqKEenXP9ke+lQHBhuX/9zdWlBDcdJ/s4uHuYXsyZ4TMBvk9pCnDdGavwXsTVzhQ2RJMkmulUcKRlGsTa2cUEo2d/Js08Da+ZYEPmWzi7+sxiQSdZm+FD7EzYKFo91QmFg1jyVh85pGCG9SRlGYF+gedLcPi6FnfjQLKg1rhCOIFH79azwnoNYK0IwNjOFgd1rmwlXQvKY8Dpv8fuHUh4rIIcrquQtdmSVuPFf35+CovrGub1jA2/XLqnlaaLOdw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179272; bh=1kXCLje0ImbZ32s3h/+XXZ7pBQa2JgsPOVd+19x5OJf=; h=X-Sonic-MF:From:Subject:Date:To:From:Subject; b=aGvOx1ejAbKWrSyL6wREbLNs5yQ+JHbZQ1ZGFa1cPjylQP9wwzdCE9z2UDLl687Qk+luGyw6qnkkZ7qkDW3ydtYAXCLeRgwTY6IU8I9L5BfKwNS3oZPWKN5nHmymZCWQA0iC9Vf2epQ0wIO8qkUUxlPM6V4xD2Axg2Swt6mfGjOaqsf/VrS/i+fkVD98qb6sr6h6uL8enpZWlKnBPdsbRlJggPHnW2gerXtVcNnWLSjk1TZFwh+CD4HXvtdqiBeozCnulOnCodhXiqks40HQN2T9ToeWawftuKJXmE7x0BaDppgdTUhP54QYbHnZ1kiK0FEVazIIf64Sys1GUykYGQ==
X-YMail-OSG: ynePqvYVM1ksVcRUPoS9chiXo9SPYE2DRdCbHYBGY30ECXKV2GChe_6Ctpw5Ljr
 hh.RZjpDDTQoHjGWKjOgE6kGcCWS536L_DbZ0J7PsEqi4hDyxmumIkJVtZNDkckyEihQWI8j36TJ
 7LxUlUElN0dzph_k909pjbWdmjnEbi0TdekQga4ZxgwEHBWJ_.BQr4qNMG1Fd9veyKK4i8g5QLKm
 whaZgV_2wevPck1flmUnNwRIlUA2HEuNvEguYOsPJBwTib7Q_3Dg.d_BLWDCK0gAqs35ERXrKrN7
 pio3g6H2snqT1yS2XlDOKmxa6332BVm5AwF3hEgaIkPI5Dlxn9XSUqg_aI0aaZFaRKb7Gzif48Qt
 Zs20Q9CymaYPawz96w7x9nL66CgJim9JxznGqGappO9zrMBdAQyyfxBlqJBstEXBzqSb4jOsScdm
 gya1CnzE00UtDzo6bC4L2W3tK8p7rbGNNR.G7hjpNPvvK0.nu2UhosxWx0la3waD89vHI1CR9TP6
 hZBLq3Q6lYsy9UYn2wmGW2aAg.V9vAA5gzpMf_8s3g8gPsddluzWeEtMa91fDgR9XBLkvw175Lu7
 UDa9VoJcGgsIIKe_EVTtYqW9xc92THxDgBT5TPLlzWB52JlzckBvSddAdOcpUpwj.zkYwdiJtKdp
 banJ7f9Tv2.g4adq5I8JBfh0V2pQ5JMSTvcl4R0p5X5fz7J7FLG0mBs_4RJ6eTTETG0B0Xe08UJc
 8TlNUvbunNOC3dmdTQE9sk4IzIkSqQDAyWdXrKq6WfztdcUf9P0He9umOc0DV10wV7b5lXG8NRxy
 ZeQxUz0K5WNe47kHZroCypAYOW79CxjxliXIKU2zNIrEw7Y_xxjKXdiX9VHDW2bFGhoR4uBydJyt
 n1OwDfIPOe7ipjhv.E9WTDxlah6tizPlrdIkpYOTvx.KvkIvWgTt6VqS.dJypmeY.Lu6d2bVuXXS
 yA2hX2zys7qBk5j_Qrs.ljT3NZdbNClOAAqlNzFkmjqabVvJ3VPYpI20m2SQP7XMj.REluNtZzpC
 ArXqgy6X.qEE1FTCyIRPaPF_DGLCD6GdizwaVdtWhCRDiYpt8mrKfLZ7OK_3wQ0c9rN1Jt4kXgzT
 .JW6Jxl9mU1h9pGwaj28PrbiuySMzNv3QFvoX..4ZUQdzRNszgZqca6A.bNpau4NhOJ3OA5vP.z2
 BymD6Gu3d1bJfMCusBhyFeGys4I0o6sRRxRxYhn3T5bQt7oMR7f.AJqffoOg73mpzgPmh8nytfCn
 R54RYWNMthf.qotQWdjXpDV8R9SzPYFiUdhgL2nM1YYU4Nz.zsVu8fhlddWY2.0EK8uuGsMPiy9F
 Yqv70tPIXqqW5JYV1tWkN5G2CIGYdPcISw_CoW_LkdLZMvuWahbrab8546n3SqUVymV.YA_cq1p6
 x25yfT5vTXDMaISlD5zVWAXZiPbQcWed5kdHtobEBVs8vIa1IUq1gdQcl7nOq7YrR3Jkli28QWuh
 _npmMx914_yAtfFH07m_PiA.JMsuxc.440kAxw2nYYK5vKB0pqP6o0PNQOVn86dwfwzf9iaUHy6N
 4XTAEPdOJkQ8lq0THJol2_8OiqeqlCIGKdHdEy.T8Yice_s6UWUXkrDlXuVFxxrLbkvbfsQ5W7wC
 7dcJrR6hdoyvZm.QdXpWNJ.aUMrHDn5zpo2poacbTs2Lw8lS4OnG5Gh_98Yz9bIKpgIfSwAExbui
 lXBPw8oT85PsTFkvo2Uz3ggacjRRBxDfPTsEgkzpnt63sjjJ6fjs0yI2Nt2d28SpF8dI6c_tqexP
 lMxJfmIdMwWxboQD2klYE3VjsdwF4OWzXdDUfVrRijGVdy_AKO45O5WTtZDCIvMB6PvzZ9K2QaBk
 hFhibIoZP6ntrf_OIIbeZEe2zjvGE.k2y2Q_z0Wp5PqRMm0C4sEwsLCCuNmSlyC9By2fpmOXpOWs
 CvDEEd1K1BrOpAov3w39RQ5bKCIu.RhAgpGXlz7Q2Znssy.fMtbaYDvR9KEOpp2scXLutQ1GjWFq
 eo6HjYxX2MVq2kKuJ_W1PTuAM9bzySFG4hMD53xUJayiRR.8ycPXef0cK0TK.6P9ckDna98BQOxZ
 SsKHVGt0HHNieZdH05_B1jAd9WCSn20tcWuaoLORdW.fP4FX59uWsp4aS_M9M5oksgVcitf5SxwV
 MFI_WoJQgQtKMALFoYNvnFLBuo3ThwvPEZyFQfKjMb49tsPxcuWwkvEgBbckkVPlOrffE.dpj48a
 6JSFRMjaIOp_2Nj.atsBNHQbFgsLci2jV1jn4Bf3tpLge.9bCgCd7M43Qx2KiJ1CEAk5hxyLtehS
 bZBjdoeK_.2Li3dRuqhgU3D2xW9Aabu4qzZTdU8Py27Mmva4-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: f5d09e72-bb98-40f5-8751-fe3101f88564
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:47:52 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 70d8dee74b9581b201e5d1fc2936dba7;
          Tue, 10 Mar 2026 21:47:50 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH v3 00/28] media: staging: atomisp: Remove unnecessary
 return statements from void functions
Date: Tue, 10 Mar 2026 22:46:48 +0100
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NsQ6CMBDG8VcxnT3TXouCk+9hHKAccolQ0mIjI
 by7hYlNt/vf8PtmEcgzBXE9zMJT5MCuT6GPB2Hbsn8ScJ1aoMSz1DKDcnQdhwE8dS4SRMd1use
 37yFiBcZSobAmVGhFQgZPDX+2gfsjdcthdH7a9qJav3/TUYGCQiJl2pCtTH6byta50/ASqxxxp
 yn5U8OkVZIuujFFTpjttGVZvhVonpoZAQAA
X-Change-ID: 20260305-atomisp-remove-void-return-v2b-4ce912de212c
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
References: <20260310-atomisp-remove-void-return-v2b-v3-0-fd22e1a04cfa.ref@yahoo.pl>
X-Rspamd-Queue-Id: A3A1225878E
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
	TAGGED_FROM(0.00)[bounces-55244-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Action: no action

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


