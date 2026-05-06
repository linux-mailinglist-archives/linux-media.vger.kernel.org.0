Return-Path: <linux-media+bounces-60663-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL7SCCN8+2n0bgMAu9opvQ
	(envelope-from <linux-media+bounces-60663-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 19:36:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 610294DEE92
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 19:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBD1130A5F27
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 17:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC55B4BC02B;
	Wed,  6 May 2026 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFG7bPjt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD073EF66F
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 17:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778088661; cv=none; b=chFN6qD8hFfiwoPzLI4RHXbJmruVGi6740dNEqV5i+mOMpTpW9UOzowaCSfyY3PSma6bN9s//BWLFh9zgHg8kgw3kFDHjlPxfjO1oZN4p4i/UXOihJomA1YoS90B6PfQ/Uu+fS8PhCk+tCbXtfsntF6ogxg7d/tXJR9l7SfLovc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778088661; c=relaxed/simple;
	bh=Ww2T6/nwj93rEJ9z4FxV27vMXcR4RdvLK69WrlgQpcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=imr+lKlDZMjWjvWDrmmSM1TT9ka4mIwl2R/y7eDKYHswJBvFsxEY2+B2JdXQXRfm2mY4v9qxpa828RIloAkfwu54X0pEx/1AKKKYCdcGyTDQjkh+cAdKqcg4uTtUA2cQ5qK6HnIr+YHaZfaeAssqBO+uMqBfWeuBQCTXU/mTe/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFG7bPjt; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12dfbcc0703so778514c88.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 10:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778088658; x=1778693458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFAuki1GGRw3nEZzyHITPvoUi3h8+PZa2ELxEIt/yhs=;
        b=OFG7bPjtRbsiDlY5uUFBt2EHhXYIe5hEJCAIAW5Mzrny+9ahhT4QgErJMH6CeItIci
         lteiNLvtbEu48rIFkI+Ce+JbrBlDYHh47Z+ahviC0bMSRUWydnQTANh2rhQtw+joHd41
         WAgB/CX/pAw9zUc3JxzumYtnOWA9JMxnMo7PXm7ZVo/YgxuNFU9qMr3QpbHTRc4H3zVf
         UAbwzJR26GBo13BqrjS0ptDlHUj9s3pF0ai94KbyuAFobH8dn5bGyf5LKWdUoVCy6+gx
         W0smAMDJICiv7hKPIzcwQ2Mayon9ZiUY5YcmzJTqULeQCBfYcLgdyhJOcl+KIQkcE5Ho
         io3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778088658; x=1778693458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RFAuki1GGRw3nEZzyHITPvoUi3h8+PZa2ELxEIt/yhs=;
        b=QeUohltVyzqtc9GR5lmF7gi76bvKZLK9mn8V8Xe4RWt8939OxH8FSSg6thSXuNeSv9
         dI4rExwDq3Hgo10e0jOZdBqWeBRpBxLJ4HNNPwcMcJuz5ZXU1NAVVpYk5t68bDhAHVQ9
         t1n7W6k1sg6Ec0le1ccxNw1eORrU79zrA7+ZDzMHqaQ0brI8Egjc3AT7YBtGvyOPuVWy
         YedLFfbdA1FiQA2pTjU41avbIN8uGlHzgiVoXvh9ixat6+gEwg+HOTr8Nt06I3pqlkLR
         9H+JtXE8M63r27RRx7nEUdig+V5GQPvqUnIB5zXVXCnUrxi1naFZzAb35XCS8mcif8Ai
         hh1w==
X-Forwarded-Encrypted: i=1; AFNElJ836S9JHlbD4z3YI0XMxE4eeMFhMxNjKcYIk9dh8hHtqgA9RBy4TcAXhdoGJ6oMdqGr/o0QulFse5MHfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqzk0iXVARHqAZTSMfDc9jtjgfWr9hM5LTnrTjOlNZIHBnDXKA
	9kBN3nWwlPvfYLpts+1mlh/fljK3tL6k0EhDuzhiCfyQpWqO6Z7+RrFU
X-Gm-Gg: AeBDietasnrBufapho1pLYj070gNp3DBohBvYLBuj0yC10zRs/3AY8lmkmeGBl6DzWi
	ZDPPs/IheGWRbdybY66Od+kPCtEBuL4fgF6R3Z/8prjcaP26iIF7R7tB7EqYpFNpUNH5UqyHPpC
	6LYHJWbYCXohtx6aiTSHp3IgYzV/n6F0xCyYDcK6zRD3UmDbTLKEq2vRDbfT5IwKbam6PbU/v7x
	rr2y0c+kVlaqikKLDt4E0DGX812cMSpMc6CVjHHw69fV4JByE8yQ8jxh9Hp7xH3J4iX+F/lGsy6
	a+E5CgyHtHNCbK+aQFrfYgCTI37WybPM8/RqvpP4sQOAuq9fFD+uxKUuhKSLsKs7ssFcAvFHQKC
	4YVlcjpaT/Z+G2UUaXvucdXHwTBehhfMyLDgHOztml/eU0jG6i1jniDkB5DkV+TvFgG5J0TmRup
	z2+q9H3cN/fXw95Hfsuamir8kT6MV1ymTRqnnXw3SoDEucQRcYwV6B3/tCj+UhsMbISehVoYegi
	mSwJO8dNg==
X-Received: by 2002:a05:7022:ea21:b0:12d:b993:c68f with SMTP id a92af1059eb24-1317d896e50mr2600627c88.4.1778088657933;
        Wed, 06 May 2026 10:30:57 -0700 (PDT)
Received: from everton-Dell-G15-5530.. (recod-gw.ic.unicamp.br. [143.106.7.151])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-131f968cad4sm3987087c88.6.2026.05.06.10.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:30:57 -0700 (PDT)
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
Subject: [PATCH v2] media: atomisp: remove returns from void functions
Date: Wed,  6 May 2026 14:30:28 -0300
Message-Id: <20260506173028.24417-1-e.rcolombo2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423182733.80365-1-e.rcolombo2@gmail.com>
References: <20260423182733.80365-1-e.rcolombo2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 610294DEE92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60663-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Fixed the following checkpath warning on all files:
WARNING: void function return statements are not generally useful.

Signed-off-by: Everton Colombo <e.rcolombo2@gmail.com>

---
Hey, this is my first patch! Any feedback would be appreciated!

Changes in v2:
 - Expanded the fix to cover all files within the driver per maintainer
   feedback.
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c |  1 -
 .../host/event_fifo_private.h                   |  1 -
 .../pci/hive_isp_css_common/host/fifo_monitor.c |  5 -----
 .../host/fifo_monitor_private.h                 |  3 ---
 .../atomisp/pci/hive_isp_css_common/host/gdc.c  |  2 --
 .../pci/hive_isp_css_common/host/gp_device.c    |  1 -
 .../host/gp_device_private.h                    |  1 -
 .../pci/hive_isp_css_common/host/gpio_private.h |  1 -
 .../hive_isp_css_common/host/input_formatter.c  |  8 --------
 .../host/input_formatter_private.h              |  1 -
 .../atomisp/pci/hive_isp_css_common/host/irq.c  | 10 ----------
 .../pci/hive_isp_css_common/host/irq_private.h  |  1 -
 .../atomisp/pci/hive_isp_css_common/host/isp.c  |  1 -
 .../pci/hive_isp_css_common/host/isp_private.h  |  6 ------
 .../atomisp/pci/hive_isp_css_common/host/mmu.c  |  2 --
 .../pci/hive_isp_css_common/host/sp_private.h   |  8 --------
 .../pci/hive_isp_css_include/host/mmu_public.h  |  1 -
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c  |  2 --
 .../atomisp/pci/isp2400_input_system_private.h  |  4 ----
 .../atomisp/pci/runtime/binary/src/binary.c     |  1 -
 .../media/atomisp/pci/runtime/bufq/src/bufq.c   |  1 -
 .../pci/runtime/debug/src/ia_css_debug.c        | 10 ----------
 .../media/atomisp/pci/runtime/frame/src/frame.c |  4 ----
 .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c |  2 --
 .../pci/runtime/inputfifo/src/inputfifo.c       | 17 -----------------
 .../media/atomisp/pci/runtime/isys/src/rx.c     |  8 --------
 drivers/staging/media/atomisp/pci/sh_css.c      |  4 ----
 .../media/atomisp/pci/sh_css_param_dvs.c        |  1 -
 28 files changed, 107 deletions(-)

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
index b411ca2f415e..ca0ad62b78e0 100644
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
@@ -441,8 +437,6 @@ void ia_css_debug_binary_print(const struct ia_css_binary *bi)
 			    bi->sctbl_width_per_color);
 	ia_css_debug_dtrace(2, "s3atbl_width = %d\n", bi->s3atbl_width);
 	ia_css_debug_dtrace(2, "s3atbl_height = %d\n", bi->s3atbl_height);
-	return;
-}
 
 void ia_css_debug_frame_print(const struct ia_css_frame *frame,
 			      const char *descr)
@@ -526,7 +520,6 @@ void ia_css_debug_frame_print(const struct ia_css_frame *frame,
 		ia_css_debug_dtrace(2, "  unknown frame type\n");
 		break;
 	}
-	return;
 }
 
 #if SP_DEBUG != SP_DEBUG_NONE
@@ -808,8 +801,6 @@ void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
 #endif
 
 #if SP_DEBUG != SP_DEBUG_NONE
-
-	return;
 }
 #endif
 
@@ -823,7 +814,6 @@ void ia_css_debug_dump_sp_sw_debug_info(void)
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
index 8e1efeb6372c..083ef719d446 100644
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
@@ -108,8 +106,6 @@ static void inputfifo_send_data_b(
 	unsigned int token = (1 << HIVE_STR_TO_MIPI_VALID_B_BIT) |
 			     (data << _HIVE_STR_TO_MIPI_DATA_B_LSB);
 	_sh_css_fifo_snd(token);
-	return;
-}
 
 static void inputfifo_send_data(
     /* static inline void inputfifo_send_data( */
@@ -121,7 +117,6 @@ static void inputfifo_send_data(
 			      (a << HIVE_STR_TO_MIPI_DATA_A_LSB) |
 			      (b << _HIVE_STR_TO_MIPI_DATA_B_LSB));
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_sol(void)
@@ -131,7 +126,6 @@ static void inputfifo_send_sol(void)
 				1 << HIVE_STR_TO_MIPI_SOL_BIT);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_eol(void)
@@ -140,7 +134,6 @@ static void inputfifo_send_eol(void)
 	hrt_data	token = inputfifo_wrap_marker(
 				1 << HIVE_STR_TO_MIPI_EOL_BIT);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_sof(void)
@@ -150,7 +143,6 @@ static void inputfifo_send_sof(void)
 				1 << HIVE_STR_TO_MIPI_SOF_BIT);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_eof(void)
@@ -159,7 +151,6 @@ static void inputfifo_send_eof(void)
 	hrt_data	token = inputfifo_wrap_marker(
 				1 << HIVE_STR_TO_MIPI_EOF_BIT);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_ch_id_and_fmt_type(
@@ -177,7 +168,6 @@ static void inputfifo_send_ch_id_and_fmt_type(
 	 */
 	token = inputfifo_wrap_marker(0);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_empty_token(void)
@@ -186,7 +176,6 @@ static void inputfifo_send_empty_token(void)
 	hrt_data	token = inputfifo_wrap_marker(0);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_start_frame(
@@ -196,7 +185,6 @@ static void inputfifo_start_frame(
 {
 	inputfifo_send_ch_id_and_fmt_type(ch_id, fmt_type);
 	inputfifo_send_sof();
-	return;
 }
 
 static void inputfifo_end_frame(
@@ -207,7 +195,6 @@ static void inputfifo_end_frame(
 	for (i = 0; i < marker_cycles; i++)
 		inputfifo_send_empty_token();
 	inputfifo_send_eof();
-	return;
 }
 
 static void inputfifo_send_line2(
@@ -297,7 +284,6 @@ static void inputfifo_send_line2(
 	for (i = 0; i < hblank_cycles; i++)
 		inputfifo_send_empty_token();
 	inputfifo_send_eol();
-	return;
 }
 
 static void
@@ -377,7 +363,6 @@ static void inputfifo_send_frame(
 		}
 	}
 	inputfifo_end_frame(marker_cycles);
-	return;
 }
 
 static enum inputfifo_mipi_data_type inputfifo_determine_type(
@@ -453,7 +438,6 @@ void ia_css_inputfifo_start_frame(
 	s2mi->streaming = true;
 
 	inputfifo_start_frame(ch_id, s2mi->fmt_type);
-	return;
 }
 
 void ia_css_inputfifo_send_line(
@@ -516,5 +500,4 @@ void ia_css_inputfifo_end_frame(
 	inputfifo_end_frame(s2mi->marker_cycles);
 
 	s2mi->streaming = false;
-	return;
 }
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 9cfb8bc97e24..859b3050e44a 100644
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
@@ -638,9 +634,6 @@ void ia_css_isys_rx_configure(const rx_cfg_t *config,
 	 */
 	input_system_reg_store(INPUT_SYSTEM0_ID, 0x207, 1);
 
-	return;
-}
-
 void ia_css_isys_rx_disable(void)
 {
 	enum mipi_port_id port;
@@ -650,5 +643,4 @@ void ia_css_isys_rx_disable(void)
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


