Return-Path: <linux-media+bounces-61035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6bv+KIb1AGrEOwEAu9opvQ
	(envelope-from <linux-media+bounces-61035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 23:15:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F845066C6
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 23:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE80F30238FB
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 21:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E91331218;
	Sun, 10 May 2026 21:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDNLN21k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2247C2046BA
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778447738; cv=none; b=hJlgWWUMNNsohVlWungtEhVXdgzcW+symadRSKpjIgzDmEC13m4brAY0xH7gcrCeBQQy6zMROCPLlB5aY2rtE2BRaDWaxm2Kpjm/1zWT6Rkq4h0GF/SQXw4pPAZsaOubm8oNEuEJ42bEeqUZs7iX2ECujp8HhVeZv99vRX5B7vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778447738; c=relaxed/simple;
	bh=5nc3rYwWJAKdTeHwsrQVloV4eEMzmzNNIKzthnT86nQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D9ic7hK4l2qHNFaT/qls8xcQeQmUPCFFIz5WQpMCBg1PcQMZY8bt2qA2mzzGfm0W3F+wUroqm35/v0PE8vXmFmf8QskWbeP5MD66mrA7se0VLV87ddZdu7Ved9t8wG1DCAO53f0UNMOc7gi7U4ZMKM0/7YyJaetEH5CynHvazGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDNLN21k; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c8ccc7755so5155228c88.0
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 14:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778447734; x=1779052534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6uIY53EGr2Edf1diOOhJamof7AIyWQY8UrppMrS7/Ck=;
        b=JDNLN21kMT17iumltQsDfQejaWUBcSFP+UPfvkSj8GQwl8LKIs/AQgymrTc1yI/swa
         qt6IVY+m/NgjonOztCEAbv2QZNj0q9K5+l4ysDhsXpwRVwbwVBOt0CKjQJvbYDYkRix4
         eo8AeFsJfylLzJegTn0ehEcqWiB1U+QbjDWxE4mNRZgWqUok7SQm573LKiNJSp85IS9q
         O5qVKsY6huOKXXsStTQv0cKjq5Vw/vDO3idnFZXXsftlytKyMuw2IK0QZABmyAy8Eun9
         cT6kju9C/Ov3VCsJgxmdz708Vzc03P/fHpsTMtFtWn7djGU5J41t5VyjR0jA42P8Uxpl
         7ZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778447734; x=1779052534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uIY53EGr2Edf1diOOhJamof7AIyWQY8UrppMrS7/Ck=;
        b=plprcqmcjLWR9d9DyoAQlLctoEpoD0jHcNa9Dzn3wTngxTMXQ229EvPPOssadGfUMv
         6crR4MhPkbeJ55CB5ao/m4rSfUNwG+bsQ2EKI1oQeIWwmHI3k6ceDDtbzJovyED7zLMT
         PH5+2oC4Hnp96AKtyBv/LEdvabdVvhWktczTe28W8K89LYKVaLNw7arDNgQagUk1gFVn
         uMLOCW7NSyGIC6hoSXheWFAYaAss3CqAJzOvU8IMZCBLCIGfzOjQrX0b1EY5hOvb+QRN
         LN6mPhTW5vppy5LrtnFlWb9hI+6CkS/IGAfURNOBjxIag2UiwKzkpQm8pKLcQkfXEeSs
         bHKg==
X-Forwarded-Encrypted: i=1; AFNElJ/2/fs/iuy8zb9qFl0JUGaLfZgmD0WIc8rFbKyoqQrtDfIDqQ/GGVPnxka+/TKINvceoaMo08eqC8V0sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfFlEpMxPOTKyolUkir5U9a9K/wF81T/VJps10CIWczD6mFNiQ
	nRT9y0rNzXM2RrzHhCIbuGLOT0Xv2i95TawY3t7QtyNQAuf8cv3Q70lL
X-Gm-Gg: Acq92OEsXiDjyTdczzY2HTRiaP5/XhQ5/stkBmghMkyJrcPwvHHhRDRhqPB/43COuV8
	rjsrT5CymYjrO+ROO5tBmxDymsmhGo//YUJHeJX79eHiAFnPXkDOytiiTeoXkmc/SChTZ9JtIaS
	E8GeTXoNjmjCnKLFgQhVdoDXWDXU8v7gU8L3VG2UyA80ReEdub2RW+ZlPJjTkmAwxJbLyz2kC+X
	fLbpVXINv3cXjIyQwnAhe4f3jlb6woI7wFiwehvF+weKxa0yHSK1bWjDxQFnrYyntFZiCEXTUyh
	6lVUtTm98EnBTxz2GoGfOehshpLjLtqMpcQWk/mPsUFbQTM7SfM9Kxc4EtbkC0d8gH+jJfi0Lfx
	IGBJP3i7QKC8ufSRgyw6xzn+wKuNx2Qy2OzEvNtvFkoAND8TMn9Vc28XPCR3hyOwMrPkNMKPSnv
	ajAODNIpNlSHohjd72aF/vRYKFF7Vy8k/19gvwvm00jk/9fSNQzA==
X-Received: by 2002:a05:7022:6b9b:b0:12d:b2ca:a9ef with SMTP id a92af1059eb24-132a7fe21admr3372870c88.17.1778447733716;
        Sun, 10 May 2026 14:15:33 -0700 (PDT)
Received: from everton-Dell-G15-5530.. ([177.62.230.31])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327875a269sm11705210c88.13.2026.05.10.14.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 14:15:32 -0700 (PDT)
From: Everton Colombo <e.rcolombo2@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	koike@igalia.com,
	~lkcamp/patches@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Everton Colombo <e.rcolombo2@gmail.com>
Subject: [PATCH v3] media: atomisp: remove returns from void functions
Date: Sun, 10 May 2026 18:15:25 -0300
Message-Id: <20260510211525.70500-1-e.rcolombo2@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 28F845066C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-61035-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,igalia.com,lists.sr.ht,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ercolombo2@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Fixed the following checkpath warning on all files:
WARNING: void function return statements are not generally useful.

Signed-off-by: Everton Colombo <e.rcolombo2@gmail.com>

---
Hey, this is my first patch! Any feedback would be appreciated!

Changes in v3:
 - Fixed missing braces introduced in v2 that caused build failures
   (caught by kernel test robot).
 - Rebased onto the latest staging-testing tree.

Changes in v2:
 - Expanded the fix to cover all files within the driver per maintainer
   feedback.
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c  |  1 -
 .../host/event_fifo_private.h                    |  1 -
 .../pci/hive_isp_css_common/host/fifo_monitor.c  |  5 -----
 .../host/fifo_monitor_private.h                  |  3 ---
 .../atomisp/pci/hive_isp_css_common/host/gdc.c   |  2 --
 .../pci/hive_isp_css_common/host/gp_device.c     |  1 -
 .../hive_isp_css_common/host/gp_device_private.h |  1 -
 .../pci/hive_isp_css_common/host/gpio_private.h  |  1 -
 .../hive_isp_css_common/host/input_formatter.c   |  8 --------
 .../host/input_formatter_private.h               |  1 -
 .../atomisp/pci/hive_isp_css_common/host/irq.c   | 10 ----------
 .../pci/hive_isp_css_common/host/irq_private.h   |  1 -
 .../atomisp/pci/hive_isp_css_common/host/isp.c   |  1 -
 .../pci/hive_isp_css_common/host/isp_private.h   |  6 ------
 .../atomisp/pci/hive_isp_css_common/host/mmu.c   |  2 --
 .../pci/hive_isp_css_common/host/sp_private.h    |  8 --------
 .../pci/hive_isp_css_include/host/mmu_public.h   |  1 -
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c   |  2 --
 .../atomisp/pci/isp2400_input_system_private.h   |  4 ----
 .../atomisp/pci/runtime/binary/src/binary.c      |  1 -
 .../media/atomisp/pci/runtime/bufq/src/bufq.c    |  1 -
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c |  9 ---------
 .../media/atomisp/pci/runtime/frame/src/frame.c  |  4 ----
 .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c  |  2 --
 .../pci/runtime/inputfifo/src/inputfifo.c        | 16 ----------------
 .../media/atomisp/pci/runtime/isys/src/rx.c      |  7 -------
 drivers/staging/media/atomisp/pci/sh_css.c       |  4 ----
 .../staging/media/atomisp/pci/sh_css_param_dvs.c |  1 -
 28 files changed, 104 deletions(-)

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
index 40b3f1e48c56..6f866814428b 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -65,8 +65,6 @@ void input_formatter_rst(
 	if (!HIVE_IF_BIN_COPY[ID]) {
 		input_formatter_reg_store(ID, addr, rst);
 	}
-
-	return;
 }
 
 unsigned int input_formatter_get_alignment(
@@ -88,7 +86,6 @@ void input_formatter_set_fifo_blocking_mode(
 		input_formatter_reg_store(ID,
 					  HIVE_IF_BLOCK_FIFO_NO_REQ_ADDRESS, enable);
 	}
-	return;
 }
 
 void input_formatter_get_switch_state(
@@ -121,8 +118,6 @@ void input_formatter_get_switch_state(
 					   _REG_GP_IFMT_input_switch_fsync_lut);
 	state->if_input_switch_ch_id_fmt_type = gp_device_reg_load(GP_DEVICE0_ID,
 						_REG_GP_IFMT_input_switch_ch_id_fmt_type);
-
-	return;
 }
 
 void input_formatter_get_state(
@@ -202,8 +197,6 @@ void input_formatter_get_state(
 				HIVE_IF_FSM_VECTOR_SUPPORT);
 	state->sensor_data_lost = input_formatter_reg_load(ID,
 				  HIVE_IF_FIFO_SENSOR_STATUS);
-
-	return;
 }
 
 void input_formatter_bin_get_state(
@@ -231,5 +224,4 @@ void input_formatter_bin_get_state(
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
index 856561e951a5..5c82d9de7663 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -483,7 +483,6 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
 	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);
 
 	mutex_unlock(&bdev->rbtree_mutex);
-	return;
 }
 
 void hmm_bo_device_exit(struct hmm_bo_device *bdev)
@@ -948,7 +947,6 @@ void hmm_bo_vunmap(struct hmm_buffer_object *bo)
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
index b411ca2f415e..e19b6342fe04 100644
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
index 9cfb8bc97e24..5d90587bac73 100644
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
@@ -637,8 +633,6 @@ void ia_css_isys_rx_configure(const rx_cfg_t *config,
 	 *                INPUT_SYSTEM_CSI_RECEIVER_SELECT_BACKENG, 1);
 	 */
 	input_system_reg_store(INPUT_SYSTEM0_ID, 0x207, 1);
-
-	return;
 }
 
 void ia_css_isys_rx_disable(void)
@@ -650,5 +644,4 @@ void ia_css_isys_rx_disable(void)
 					_HRT_CSS_RECEIVER_DEVICE_READY_REG_IDX,
 					false);
 	}
-	return;
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..3f4968dd638b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -2928,8 +2928,6 @@ ia_css_get_crop_offsets(
 	in_frame->crop_info.start_line = row;
 
 	IA_CSS_LEAVE_PRIVATE("void start_col: %u start_row: %u", column, row);
-
-	return;
 }
 
 static int
@@ -3326,8 +3324,6 @@ static void send_raw_frames(struct ia_css_pipe *pipe)
 							    pipe->continuous_frames[i], pipe->cont_md_buffers[i]);
 		}
 	}
-
-	return;
 }
 
 static int
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
-- 
2.34.1


