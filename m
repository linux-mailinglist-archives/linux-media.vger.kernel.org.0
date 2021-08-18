Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6123F05ED
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239146AbhHRONC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239042AbhHROMq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:12:46 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E788BC06179A
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:10 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso8929989pjh.5
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hv3/BWr2Hya5YVjCfpoeEoJ6c50x4vzxYN47UPUAiik=;
        b=Fcxk54jOWEHUD7HshO9XrrEp1rCkbmk4ZyhBZJZEv7ZtKgfm4v3pAuZfIp9EHX8YiS
         GhyAA4A4SUcCXghlmWAsCQLZfWsJ6eRIw9HukhUDVkC5bR0AQtkecQ7Gqo6loVf2m6Vr
         P97N/cCcDUbr1cOr9BHLwLuILFM+kjS4bekvWunwY0ZNoolh6CMMrIflhPlUUEDaTpw1
         O5xByQ+JYq856G+6TZ9SltfdDpVhbsAUpCifArTwtoA8fb0tzD/4l1EBWrsUHViUXeJ2
         pMJFmZDUACSO+5a6/AZ/xqfZc7i2AfUW7GoPK05Vklfsi7OPvAAnkcxWfsTvo/szp7bV
         +CQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=hv3/BWr2Hya5YVjCfpoeEoJ6c50x4vzxYN47UPUAiik=;
        b=Mbgcfm+GNktZldYWZoimOJWXyj9iCq4ZZJlUHb/rYypPuOIrtbj+UD2Y+dmbcUcd7c
         D+7rdCOeJh271S0VRdy4GnS/zgatmN18mVC+4k1qjVRrbg8ftGzvlD95r1OFHXtYELZZ
         Kq3yeuB3flGnWtRxFTRzAXjOYImY/pQ+ESbE+Nw+gxWxaSPovHKDySUbKv6fIgByyNUu
         GssE5E7r3g14iwG2nGnPvoHoQRxTVg+wLvedt7X1Tsf15OoTRgAWaWOj8RX0B9Zjcy1b
         iKatkWUqHi8XZY3DH1zSpns9VCYOEF5bse0iYo6wkHwNZLYiAg5PLcUHCTpuf8ajzTPJ
         I0Dg==
MIME-Version: 1.0
X-Gm-Message-State: AOAM532pNDkFX4d3fhuyutGi/LT12n9m21tRV4gchM5KsZOgZ+F83KiB
        w3jMKqLKt0N32nNqScnoMVAsaZ50Jnxgdo2V/tIlObED4Plb9aHrTrUZOfuEPFptcNTiEkMH02q
        aBqqM4kTa5gUfM4LG
X-Google-Smtp-Source: ABdhPJyIr1TkaFFgf0ol7O4P95lkdXF7H6Byb9HucJM/OkTgtOG7ITooPFLHW+3fql0EJCDGz/yw3w==
X-Received: by 2002:a17:90a:a42:: with SMTP id o60mr9754602pjo.191.1629295929751;
        Wed, 18 Aug 2021 07:12:09 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:12:09 -0700 (PDT)
From:   sidraya.bj@pathpartnertech.com
To:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com,
        Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 05/30] v4l: vxd-dec: Add IMG VXD Video Decoder mem to mem drive
Date:   Wed, 18 Aug 2021 19:40:12 +0530
Message-Id: <20210818141037.19990-6-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sidraya <sidraya.bj@pathpartnertech.com>

The IMG VXD Video Decoder uses the IMG D5520 to provide video
decoding for various codecs including H.264 and HEVC.
Scaling and rotation are also supported by the hardware
and driver. The driver also supports multiple simultaneous
video decodes.

Each mem2mem context is a single stream decode session.
Each session creates it's own vxd context and associated
mem mgr and mmu contexts. Firmware loading, firmware messaging,
and hardware power management (reset) are supported, as well as MMU
programming of the HW.

This patch adds the framework for the v4l2 IMG VXD video decoder
driver, supporting HW initialization, MMU mapping and buffer management.
The decoding functionality is not yet implemented.

Signed-off-by: Buddy Liong <buddy.liong@ti.com>
Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 MAINTAINERS                                  |    3 +
 drivers/staging/media/vxd/decoder/vxd_core.c | 1683 ++++++++++++++++++
 drivers/staging/media/vxd/decoder/vxd_dec.c  |  185 ++
 drivers/staging/media/vxd/decoder/vxd_dec.h  |  477 +++++
 4 files changed, 2348 insertions(+)
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_core.c
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_dec.c
 create mode 100644 drivers/staging/media/vxd/decoder/vxd_dec.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f8154b69a91..47067f907539 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19543,6 +19543,9 @@ F:	drivers/staging/media/vxd/common/img_mem_unified.c
 F:	drivers/staging/media/vxd/common/imgmmu.c
 F:	drivers/staging/media/vxd/common/imgmmu.h
 F:	drivers/staging/media/vxd/decoder/img_dec_common.h
+F:	drivers/staging/media/vxd/decoder/vxd_core.c
+F:	drivers/staging/media/vxd/decoder/vxd_dec.c
+F:	drivers/staging/media/vxd/decoder/vxd_dec.h
 F:	drivers/staging/media/vxd/decoder/vxd_pvdec.c
 F:	drivers/staging/media/vxd/decoder/vxd_pvdec_priv.h
 F:	drivers/staging/media/vxd/decoder/vxd_pvdec_regs.h
diff --git a/drivers/staging/media/vxd/decoder/vxd_core.c b/drivers/staging/media/vxd/decoder/vxd_core.c
new file mode 100644
index 000000000000..b502c33e6456
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/vxd_core.c
@@ -0,0 +1,1683 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IMG DEC VXD Core component function implementations
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Angela Stegmaier <angelabaker@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ *	Prashanth Kumar Amai <prashanth.ka@pathpartnertech.com>
+ */
+
+#include <linux/firmware.h>
+#include <linux/completion.h>
+#include <linux/slab.h>
+#include <linux/idr.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/printk.h>
+#include <linux/mutex.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/time64.h>
+#include <linux/dma-mapping.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "img_dec_common.h"
+#include "vxd_pvdec_priv.h"
+
+#define VXD_RENDEC_SIZE (5 * 1024 * 1024)
+
+#define VXD_MSG_CNT_SHIFT 8
+#define VXD_MSG_CNT_MASK 0xff00
+#define VXD_MAX_MSG_CNT ((1 << VXD_MSG_CNT_SHIFT) - 1)
+#define VXD_MSG_STR_MASK 0xff
+#define VXD_INVALID_ID (-1)
+
+#define MAP_FIRMWARE_TO_STREAM 1
+
+/* Has to be used with VXD->mutex acquired! */
+#define VXD_GEN_MSG_ID(VXD, STR_ID, MSG_ID, vxd_type, str_type) \
+	do { \
+		vxd_type __VXD = VXD; \
+		str_type __STR_ID = STR_ID; \
+		WARN_ON((__STR_ID) > VXD_MSG_STR_MASK); \
+		(__VXD)->msg_cnt = (__VXD)->msg_cnt + 1 % (VXD_MAX_MSG_CNT); \
+		(MSG_ID) = ((__VXD)->msg_cnt << VXD_MSG_CNT_SHIFT) | \
+			((__STR_ID) & VXD_MSG_STR_MASK); \
+	} while (0)
+
+/* Have to be used with VXD->mutex acquired! */
+#define VXD_RET_MSG_ID(VXD) ((VXD)->msg_cnt--)
+
+#define VXD_MSG_ID_GET_STR_ID(MSG_ID) \
+	((MSG_ID) & VXD_MSG_STR_MASK)
+
+#define VXD_MSG_ID_GET_CNT(MSG_ID) \
+	(((MSG_ID) & VXD_MSG_CNT_MASK) >> VXD_MSG_CNT_SHIFT)
+
+static const unsigned char *drv_fw_name = "pvdec_full_bin.fw";
+
+/* Driver context */
+static struct {
+	/* Available memory heaps. List of <struct vxd_heap> */
+	struct list_head heaps;
+	/* heap id for all internal allocations (rendec, firmware) */
+	int internal_heap_id;
+
+	/* Memory Management context for driver */
+	struct mem_ctx *mem_ctx;
+
+	/* List of associated <struct vxd_dev> */
+	struct list_head devices;
+
+	/* Virtual addresses of shared buffers, common for all streams. */
+	struct {
+		unsigned int fw_addr; /* Firmware blob */
+		unsigned int rendec_addr; /* Rendec buffer */
+	} virt_space;
+
+	int initialised;
+} vxd_drv;
+
+/*
+ * struct vxd_heap - node for heaps list
+ * @id:   heap id
+ * @list: Entry in <struct vxd_drv:heaps>
+ */
+struct vxd_heap {
+	int id;
+	struct list_head list;
+};
+
+static void img_mmu_callback(enum mmu_callback_type callback_type,
+			     int buff_id, void *data)
+{
+	struct vxd_dev *vxd = data;
+
+	if (!vxd)
+		return;
+
+	if (callback_type == MMU_CALLBACK_MAP)
+		return;
+
+	if (vxd->hw_on)
+		vxd_pvdec_mmu_flush(vxd->dev, vxd->reg_base);
+}
+
+static int vxd_is_apm_required(struct vxd_dev *vxd)
+{
+	return vxd->hw_on;
+}
+
+/*
+ * Power on the HW.
+ * Call with vxd->mutex acquired.
+ */
+static int vxd_make_hw_on_locked(struct vxd_dev *vxd, unsigned int fw_ptd)
+{
+	unsigned int fw_size;
+	struct vxd_fw_hdr *fw_hdr;
+	struct vxd_ena_params ena_params;
+	int ret;
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev, "%s:%d\n", __func__, __LINE__);
+#endif
+	if (vxd->hw_on)
+		return 0;
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev, "%s: enabling HW\n", __func__);
+#endif
+
+	fw_size = vxd->firmware.fw_size;
+	fw_hdr = vxd->firmware.hdr;
+	if (!fw_size || !fw_hdr) {
+		dev_err(vxd->dev, "%s: firmware missing!\n", __func__);
+		return -ENOENT;
+	}
+
+	memset(&ena_params, 0, sizeof(struct vxd_ena_params));
+
+	ena_params.fw_buf_size = fw_size - sizeof(struct vxd_fw_hdr);
+	ena_params.fw_buf_virt_addr = vxd_drv.virt_space.fw_addr;
+	ena_params.ptd = fw_ptd;
+	ena_params.boot_poll.msleep_cycles = 50;
+	ena_params.crc = 0;
+	ena_params.rendec_addr = vxd_drv.virt_space.rendec_addr;
+	ena_params.rendec_size = (VXD_NUM_PIX_PIPES(vxd->props) *
+		VXD_RENDEC_SIZE) / 4096u;
+
+	ena_params.secure = 0;
+	ena_params.wait_dbg_fifo = 0;
+	ena_params.mem_staller.data = NULL;
+	ena_params.mem_staller.size = 0;
+
+	ret = vxd_pvdec_ena(vxd->dev, vxd->reg_base, &ena_params,
+			    fw_hdr, &vxd->freq_khz);
+	/*
+	 * Ignore the return code, proceed as usual, it will be returned anyway.
+	 * The HW is turned on, so we can perform post mortem analysis,
+	 * and collect the fw logs when available.
+	 */
+
+	vxd->hw_on = 1;
+
+	return ret;
+}
+
+/*
+ * Power off the HW.
+ * Call with vxd->mutex acquired.
+ */
+static void vxd_make_hw_off_locked(struct vxd_dev *vxd, unsigned char suspending)
+{
+	int ret;
+
+	if (!vxd->hw_on)
+		return;
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev, "%s:%d\n", __func__, __LINE__);
+#endif
+
+	ret = vxd_pvdec_dis(vxd->dev, vxd->reg_base);
+	vxd->hw_on = 0;
+	if (ret)
+		dev_err(vxd->dev, "%s: failed to power off the VXD!\n", __func__);
+}
+
+/*
+ * Moves all valid items from the queue of items being currently processed to
+ * the pending queue.
+ * Call with vxd->mutex locked
+ */
+static void vxd_rewind_msgs_locked(struct vxd_dev *vxd)
+{
+	struct vxd_item *item, *tmp;
+
+	if (list_empty(&vxd->msgs))
+		return;
+
+	list_for_each_entry_safe(item, tmp, &vxd->msgs, list)
+		list_move(&item->list, &vxd->pend);
+}
+
+static void vxd_report_item_locked(struct vxd_dev *vxd,
+				   struct vxd_item *item,
+				   unsigned int flags)
+{
+	struct vxd_stream *stream;
+
+	__list_del_entry(&item->list);
+	stream = idr_find(vxd->streams, item->stream_id);
+	if (!stream) {
+		/*
+		 * Failed to find associated stream. Probably it was
+		 * already destroyed -- drop the item
+		 */
+#ifdef DEBUG_DECODER_DRIVER
+		dev_dbg(vxd->dev, "%s: drop item %p [0x%x]\n", __func__, item, item->msg_id);
+#endif
+		kfree(item);
+	} else {
+		item->msg.out_flags |= flags;
+		list_add_tail(&item->list, &stream->ctx->items_done);
+#ifdef DEBUG_DECODER_DRIVER
+		dev_dbg(vxd->dev, "%s: waking %p\n", __func__, stream->ctx);
+
+		dev_info(vxd->dev, "%s: signaling worker for %p\n", __func__, stream->ctx);
+#endif
+		schedule_work(stream->ctx->work);
+	}
+}
+
+/*
+ * Rewind all items to the pending queue and report those to listener.
+ * Postpone the reset.
+ * Call with vxd->mutex acquired.
+ */
+static void vxd_emrg_reset_locked(struct vxd_dev *vxd, unsigned int flags)
+{
+	cancel_delayed_work(vxd->dwork);
+
+	vxd->emergency = 1;
+
+#ifdef ERROR_RECOVERY_SIMULATION
+	if (disable_fw_irq_value != 0) {
+		/*
+		 * Previously we have disabled IRQ, now enable it. This
+		 * condition will occur only when the firmware non responsiveness
+		 * will be detected on vxd_worker thread. Once we reproduce the
+		 * issue we will enable the IRQ so that the code flow continues.
+		 */
+		enable_irq(g_module_irq);
+	}
+#endif
+
+	/*
+	 * If the firmware sends more than one reply per item, it's possible
+	 * that corresponding item was already removed from vxd-msgs, but the
+	 * HW was still processing it and MMU page fault could happen and
+	 * trigger execution of this function. So make sure that vxd->msgs
+	 * is not empty before rewinding items.
+	 */
+	if (!list_empty(&vxd->msgs))
+		/* Move all valid items to the pending queue */
+		vxd_rewind_msgs_locked(vxd);
+
+	{
+		struct vxd_item *item, *tmp;
+
+		list_for_each_entry_safe(item, tmp, &vxd->pend, list) {
+			/*
+			 * Exclusive items that were on the pending list
+			 * must be reported as canceled
+			 */
+			if ((item->msg.out_flags & VXD_FW_MSG_FLAG_EXCL) && !item->msg_id)
+				item->msg.out_flags |= VXD_FW_MSG_FLAG_CANCELED;
+
+			vxd_report_item_locked(vxd, item, flags);
+		}
+	}
+}
+
+static void vxd_handle_io_error_locked(struct vxd_dev *vxd)
+{
+	struct vxd_item *item, *tmp;
+	unsigned int pend_flags = !vxd->hw_on ? VXD_FW_MSG_FLAG_DEV_ERR :
+		VXD_FW_MSG_FLAG_CANCELED;
+
+	list_for_each_entry_safe(item, tmp, &vxd->msgs, list)
+		vxd_report_item_locked(vxd, item, VXD_FW_MSG_FLAG_DEV_ERR);
+
+	list_for_each_entry_safe(item, tmp, &vxd->pend, list)
+		vxd_report_item_locked(vxd, item, pend_flags);
+}
+
+static void vxd_sched_worker_locked(struct vxd_dev *vxd, unsigned int delay_ms)
+{
+	unsigned long long work_at = jiffies + msecs_to_jiffies(delay_ms);
+	int ret;
+
+	/*
+	 * Try to queue the work.
+	 * This may be also called from the worker context,
+	 * so we need to re-arm anyway in case of error
+	 */
+	ret = schedule_delayed_work(vxd->dwork, work_at - jiffies);
+	if (ret) {
+		/* Work is already in the queue */
+		/*
+		 * Check if new requested time is "before"
+		 * the last "time" we scheduled this work at,
+		 * if not, do nothing, the worker will do
+		 * recalculation for APM/DWR afterwards
+		 */
+		if (time_before((unsigned long)work_at, (unsigned long)vxd->work_sched_at)) {
+			/*
+			 * Canceling & rescheduling might be problematic,
+			 * so just modify it, when needed
+			 */
+			ret = mod_delayed_work(system_wq, vxd->dwork, work_at - jiffies);
+			if (!ret)
+				dev_err(vxd->dev, "%s: failed to modify work!\n", __func__);
+			/*
+			 * Record the 'time' this work
+			 * has been rescheduled at
+			 */
+			vxd->work_sched_at = work_at;
+		}
+	} else {
+		/* Record the 'time' this work has been scheduled at */
+		vxd->work_sched_at = work_at;
+	}
+}
+
+static void vxd_monitor_locked(struct vxd_dev *vxd)
+{
+	/* HW is dead, not much sense in rescheduling */
+	if (vxd->hw_dead)
+		return;
+
+	/*
+	 * We are not processing anything, but pending list is not empty
+	 * probably the message fifo is full, so retrigger the worker.
+	 */
+	if (!list_empty(&vxd->pend) && list_empty(&vxd->msgs))
+		vxd_sched_worker_locked(vxd, 1);
+
+	if (list_empty(&vxd->pend) && list_empty(&vxd->msgs) && vxd_is_apm_required(vxd)) {
+#ifdef DEBUG_DECODER_DRIVER
+		dev_dbg(vxd->dev, "%s: scheduling APM work (%d ms)!\n", __func__, vxd->hw_pm_delay);
+#endif
+		/*
+		 * No items to process and no items being processed -
+		 * disable the HW
+		 */
+		vxd->pm_start = jiffies;
+		vxd_sched_worker_locked(vxd, vxd->hw_pm_delay);
+		return;
+	}
+
+	if (vxd->hw_dwr_period > 0 && !list_empty(&vxd->msgs)) {
+#ifdef DEBUG_DECODER_DRIVER
+		dev_dbg(vxd->dev, "%s: scheduling DWR work (%d ms)!\n",
+			__func__, vxd->hw_dwr_period);
+#endif
+		vxd->dwr_start = jiffies;
+		vxd_sched_worker_locked(vxd, vxd->hw_dwr_period);
+	}
+}
+
+/*
+ * Take first item from pending list and submit it to the hardware.
+ * Has to be called with vxd->mutex locked.
+ */
+static int vxd_sched_single_locked(struct vxd_dev *vxd)
+{
+	struct vxd_item *item = NULL;
+	unsigned long msg_size;
+	int ret;
+
+	item = list_first_entry(&vxd->pend, struct vxd_item, list);
+
+	msg_size = item->msg.payload_size / sizeof(unsigned int);
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev, "%s: checking msg_size: %zu, item: %p\n", __func__, msg_size, item);
+#endif
+
+	/*
+	 * In case of exclusive item check if hw/fw is
+	 * currently processing anything.
+	 * If so we need to wait until items are returned back.
+	 */
+	if ((item->msg.out_flags & VXD_FW_MSG_FLAG_EXCL) && !list_empty(&vxd->msgs) &&
+	    /*
+	     * We can move forward if message
+	     * is about to be dropped.
+	     */
+	     !(item->msg.out_flags & VXD_FW_MSG_FLAG_DROP))
+
+		ret = -EBUSY;
+	else
+		/*
+		 * Check if there's enough space
+		 * in comms RAM to submit the message.
+		 */
+		ret = vxd_pvdec_msg_fit(vxd->dev, vxd->reg_base, msg_size);
+
+	if (ret == 0) {
+		unsigned short msg_id;
+
+		VXD_GEN_MSG_ID(vxd, item->stream_id, msg_id, struct vxd_dev*, unsigned int);
+
+		/* submit the message to the hardware */
+		ret = vxd_pvdec_send_msg(vxd->dev, vxd->reg_base,
+					 (unsigned int *)item->msg.payload, msg_size,
+					 msg_id, vxd);
+		if (ret) {
+			dev_err(vxd->dev, "%s: failed to send msg!\n", __func__);
+			VXD_RET_MSG_ID(vxd);
+		} else {
+			if (item->msg.out_flags & VXD_FW_MSG_FLAG_DROP) {
+				__list_del_entry(&item->list);
+				kfree(item);
+#ifdef DEBUG_DECODER_DRIVER
+				dev_dbg(vxd->dev, "%s: drop msg 0x%x! (user requested)\n",
+					__func__, msg_id);
+#endif
+			} else {
+				item->msg_id = msg_id;
+#ifdef DEBUG_DECODER_DRIVER
+				dev_dbg(vxd->dev,
+					"%s: moving item %p, id 0x%x to msgs\n",
+					__func__, item, item->msg_id);
+#endif
+				list_move(&item->list, &vxd->msgs);
+			}
+
+			vxd_monitor_locked(vxd);
+		}
+
+	} else if (ret == -EINVAL) {
+		dev_warn(vxd->dev, "%s: invalid msg!\n", __func__);
+		vxd_report_item_locked(vxd, item, VXD_FW_MSG_FLAG_INV);
+		/*
+		 * HW is ok, the message was invalid, so don't return an
+		 * error
+		 */
+		ret = 0;
+	} else if (ret == -EBUSY) {
+		/*
+		 * Not enough space. Message is already in the pending queue,
+		 * so it will be submitted once we've got space. Delayed work
+		 * might have been canceled (if we are currently processing
+		 * threaded irq), so make sure that DWR will trigger if it's
+		 * enabled.
+		 */
+		vxd_monitor_locked(vxd);
+	} else {
+		dev_err(vxd->dev, "%s: failed to check space for msg!\n", __func__);
+	}
+
+	return ret;
+}
+
+/*
+ * Take items from pending list and submit them to the hardware, if space is
+ * available in the ring buffer.
+ * Call with vxd->mutex locked
+ */
+static void vxd_schedule_locked(struct vxd_dev *vxd)
+{
+	unsigned char emergency = vxd->emergency;
+	int ret;
+
+	/* if HW is dead, inform the UM and skip */
+	if (vxd->hw_dead) {
+		vxd_handle_io_error_locked(vxd);
+		return;
+	}
+
+	if (!vxd->hw_on && !list_empty(&vxd->msgs))
+		dev_err(vxd->dev, "%s: msgs not empty when the HW is off!\n", __func__);
+
+	if (list_empty(&vxd->pend)) {
+		vxd_monitor_locked(vxd);
+		return;
+	}
+
+	/*
+	 * If the emergency routine was fired, the hw was left ON,so the UM
+	 * could do the post mortem analysis before submitting the next items.
+	 * Now we can switch off the hardware.
+	 */
+	if (emergency) {
+		vxd->emergency = 0;
+		vxd_make_hw_off_locked(vxd, FALSE);
+		usleep_range(1000, 2000);
+	}
+
+	/* Try to schedule */
+	ret = 0;
+	while (!list_empty(&vxd->pend) && ret == 0) {
+		struct vxd_item *item;
+		struct vxd_stream *stream;
+
+		item = list_first_entry(&vxd->pend, struct vxd_item, list);
+		stream = idr_find(vxd->streams, item->stream_id);
+
+		ret = vxd_make_hw_on_locked(vxd, stream->ptd);
+		if (ret) {
+			dev_err(vxd->dev, "%s: failed to start HW!\n", __func__);
+			vxd->hw_dead = 1;
+			vxd_handle_io_error_locked(vxd);
+			return;
+		}
+
+		ret = vxd_sched_single_locked(vxd);
+	}
+
+	if (ret != 0 && ret != -EBUSY) {
+		dev_err(vxd->dev, "%s: failed to schedule, emrg: %d!\n", __func__, emergency);
+		if (emergency) {
+			/*
+			 * Failed to schedule in the emergency mode --
+			 * there's no hope. Power off the HW, mark all
+			 * items as failed and return them.
+			 */
+			vxd_handle_io_error_locked(vxd);
+			return;
+		}
+		/* Let worker try to handle it */
+		vxd_sched_worker_locked(vxd, 0);
+	}
+}
+
+static void stream_worker(void *work)
+{
+	struct vxd_dec_ctx *ctx = NULL;
+	struct vxd_dev *vxd = NULL;
+	struct vxd_item *item;
+
+	work = get_work_buff(work, FALSE);
+	ctx = container_of(work, struct vxd_dec_ctx, work);
+	vxd = ctx->dev;
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev, "%s: got work for ctx %p\n", __func__, ctx);
+#endif
+
+	mutex_lock_nested(ctx->mutex, SUBCLASS_VXD_CORE);
+
+	while (!list_empty(&ctx->items_done)) {
+		item = list_first_entry(&ctx->items_done, struct vxd_item, list);
+
+		item->msg.out_flags &= VXD_FW_MSG_RD_FLAGS_MASK;
+
+#ifdef DEBUG_DECODER_DRIVER
+		dev_info(vxd->dev, "%s: item: %p, payload_size: %d, flags: 0x%x\n",
+			 __func__, item, item->msg.payload_size,
+			 item->msg.out_flags);
+#endif
+
+		if (ctx->cb)
+			ctx->cb(ctx->res_str_id, item->msg.payload,
+				item->msg.payload_size, item->msg.out_flags);
+
+		__list_del_entry(&item->list);
+		kfree(item);
+	}
+	mutex_unlock(ctx->mutex);
+}
+
+int vxd_create_ctx(struct vxd_dev *vxd, struct vxd_dec_ctx *ctx)
+{
+	int ret = 0;
+	unsigned int fw_load_retries = 2 * 1000;
+
+	while (!vxd->firmware.ready) {
+		usleep_range(1000, 2000);
+		fw_load_retries--;
+	}
+	if (vxd->firmware.buf_id == 0) {
+		dev_err(vxd->dev, "%s: request fw not yet done!\n", __func__);
+		return -EAGAIN;
+	}
+
+	/* Create memory management context for HW buffers */
+	ret = img_mem_create_ctx(&ctx->mem_ctx);
+	if (ret) {
+		dev_err(vxd->dev, "%s: failed to create mem context (err:%d)!\n", __func__, ret);
+		return ret;
+	}
+
+	ret = img_mmu_ctx_create(vxd->dev, vxd->mmu_config_addr_width,
+				 ctx->mem_ctx, vxd_drv.internal_heap_id,
+				 img_mmu_callback, vxd, &ctx->mmu_ctx);
+	if (ret) {
+		dev_err(vxd->dev, "%s:%d: failed to create mmu ctx\n", __func__, __LINE__);
+		ret = -EPERM;
+		goto out_destroy_ctx;
+	}
+
+	ret = img_mmu_map(ctx->mmu_ctx, vxd->mem_ctx, vxd->firmware.buf_id,
+			  vxd_drv.virt_space.fw_addr,
+			  VXD_MMU_PTD_FLAG_READ_ONLY);
+	if (ret) {
+		dev_err(vxd->dev, "%s:%d: failed to map firmware buffer\n", __func__, __LINE__);
+		ret = -EPERM;
+		goto out_destroy_mmu_ctx;
+	}
+
+	ret = img_mmu_map(ctx->mmu_ctx, vxd->mem_ctx, vxd->rendec_buf_id,
+			  vxd_drv.virt_space.rendec_addr,
+			  VXD_MMU_PTD_FLAG_NONE);
+	if (ret) {
+		dev_err(vxd->dev, "%s:%d: failed to map rendec buffer\n", __func__, __LINE__);
+		ret = -EPERM;
+		goto out_unmap_fw;
+	}
+
+	ret = img_mmu_get_ptd(ctx->mmu_ctx, &ctx->ptd);
+	if (ret) {
+		dev_err(vxd->dev, "%s:%d: failed to get PTD\n", __func__, __LINE__);
+		ret = -EPERM;
+		goto out_unmap_rendec;
+	}
+
+	/* load fw - turned Hw on */
+	ret = vxd_make_hw_on_locked(vxd, ctx->ptd);
+	if (ret) {
+		dev_err(vxd->dev, "%s:%d: failed to start HW\n", __func__, __LINE__);
+		ret = -EPERM;
+		vxd->hw_on = FALSE;
+		goto out_unmap_rendec;
+	}
+
+	init_work(&ctx->work, stream_worker, HWA_DECODER);
+	if (!ctx->work) {
+		ret = ENOMEM;
+		goto out_unmap_rendec;
+	}
+
+	vxd->fw_refcnt++;
+
+	return ret;
+
+out_unmap_rendec:
+	img_mmu_unmap(ctx->mmu_ctx, vxd->mem_ctx, vxd->rendec_buf_id);
+out_unmap_fw:
+	img_mmu_unmap(ctx->mmu_ctx, vxd->mem_ctx, vxd->firmware.buf_id);
+
+out_destroy_mmu_ctx:
+	img_mmu_ctx_destroy(ctx->mmu_ctx);
+out_destroy_ctx:
+	img_mem_destroy_ctx(ctx->mem_ctx);
+	return ret;
+}
+
+void vxd_destroy_ctx(struct vxd_dev *vxd, struct vxd_dec_ctx *ctx)
+{
+	vxd->fw_refcnt--;
+
+	flush_work(ctx->work);
+
+	img_mmu_unmap(ctx->mmu_ctx, vxd->mem_ctx, vxd->rendec_buf_id);
+
+	img_mmu_unmap(ctx->mmu_ctx, vxd->mem_ctx, vxd->firmware.buf_id);
+
+	img_mmu_ctx_destroy(ctx->mmu_ctx);
+
+	img_mem_destroy_ctx(ctx->mem_ctx);
+
+	if (vxd->fw_refcnt == 0) {
+#ifdef DEBUG_DECODER_DRIVER
+		dev_info(vxd->dev, "FW: put %s\n", drv_fw_name);
+#endif
+		/* Poke the monitor to finally switch off the hw, when needed */
+		vxd_monitor_locked(vxd);
+	}
+}
+
+/* Top half */
+irqreturn_t vxd_handle_irq(void *dev)
+{
+	struct vxd_dev *vxd = ((const struct device *)dev)->driver_data;
+	struct vxd_hw_state *hw_state = &vxd->state.hw_state;
+	int ret;
+
+	if (!vxd)
+		return IRQ_NONE;
+
+	ret = vxd_pvdec_clear_int(vxd->reg_base, &hw_state->irq_status);
+
+	if (!hw_state->irq_status || ret == IRQ_NONE)
+		dev_warn(dev, "Got spurious interrupt!\n");
+
+	return (irqreturn_t)ret;
+}
+
+static void vxd_drop_msg_locked(const struct vxd_dev *vxd)
+{
+	int ret;
+
+	ret = vxd_pvdec_recv_msg(vxd->dev, vxd->reg_base, NULL, 0, (struct vxd_dev *)vxd);
+	if (ret)
+		dev_warn(vxd->dev, "%s: failed to receive msg!\n", __func__);
+}
+
+#ifdef DEBUG_DECODER_DRIVER
+static void vxd_dbg_dump_msg(const void *dev, const unsigned char *func,
+			     const unsigned int *payload,
+			     unsigned long msg_size)
+{
+	unsigned int i;
+
+	for (i = 0; i < msg_size; i++)
+		dev_dbg(dev, "%s: msg %d: 0x%08x\n", func, i, payload[i]);
+}
+#endif
+
+static struct vxd_item *vxd_get_orphaned_item_locked(struct vxd_dev *vxd,
+						     unsigned short msg_id,
+						     unsigned long msg_size)
+{
+	struct vxd_stream *stream;
+	struct vxd_item *item;
+	unsigned short str_id = VXD_MSG_ID_GET_STR_ID(msg_id);
+
+	/* Try to find associated stream */
+	stream = idr_find(vxd->streams, str_id);
+	if (!stream) {
+		/* Failed to find associated stream. */
+#ifdef DEBUG_DECODER_DRIVER
+		dev_dbg(vxd->dev, "%s: failed to find str_id: %u\n", __func__, str_id);
+#endif
+		return NULL;
+	}
+
+	item = kzalloc(sizeof(*item) + (msg_size * sizeof(unsigned int)), GFP_KERNEL);
+	if (!item)
+		return NULL;
+
+	item->msg.out_flags = 0;
+	item->stream_id = str_id;
+	item->msg.payload_size = msg_size * sizeof(unsigned int);
+	if (vxd_pvdec_recv_msg(vxd->dev, vxd->reg_base, item->msg.payload, msg_size, vxd)) {
+		dev_err(vxd->dev, "%s: failed to receive msg from VXD!\n", __func__);
+		item->msg.out_flags |= VXD_FW_MSG_FLAG_DEV_ERR;
+	}
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev, "%s: item: %p str_id: %u\n", __func__, item, str_id);
+#endif
+	/*
+	 * Need to put this item on the vxd->msgs list.
+	 * It will be removed after.
+	 */
+	list_add_tail(&item->list, &vxd->msgs);
+
+#ifdef DEBUG_DECODER_DRIVER
+	vxd_dbg_dump_msg(vxd->dev, __func__, item->msg.payload, msg_size);
+#endif
+
+	return item;
+}
+
+/*
+ * Fetch and process a single message from the MTX->host ring buffer.
+ * <no_more> parameter is used to indicate if there are more messages pending.
+ * <fatal> parameter indicates if there is some serious situation detected.
+ * Has to be called with vxd->mutex locked.
+ */
+static void vxd_handle_single_msg_locked(struct vxd_dev *vxd,
+					 unsigned char *no_more,
+					 unsigned char *fatal)
+{
+	int ret;
+	unsigned short msg_id, str_id;
+	unsigned long msg_size; /* size in dwords */
+	struct vxd_item *item = NULL, *tmp, *it;
+	struct vxd_stream *stream;
+	void *dev = vxd->dev;
+	unsigned char not_last_msg;
+
+	/* get the message size and id */
+	ret = vxd_pvdec_pend_msg_info(dev, vxd->reg_base, &msg_size, &msg_id,
+				      &not_last_msg);
+	if (ret) {
+		dev_err(dev, "%s: failed to get pending msg size!\n", __func__);
+		*no_more = TRUE; /* worker will HW failure */
+		return;
+	}
+
+	if (msg_size == 0) {
+		*no_more = TRUE;
+		return;
+	}
+	*no_more = FALSE;
+
+	str_id = VXD_MSG_ID_GET_STR_ID(msg_id);
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(dev, "%s: [msg] size: %zu, cnt: %u, str_id: %u, id: 0x%x\n",
+		__func__, msg_size, VXD_MSG_ID_GET_CNT(msg_id),
+		str_id, msg_id);
+	dev_dbg(dev, "%s: [msg] not last: %u\n", __func__, not_last_msg);
+#endif
+
+	cancel_delayed_work(vxd->dwork);
+
+	/* Find associated item */
+	list_for_each_entry_safe_reverse(it, tmp, &vxd->msgs, list) {
+#ifdef DEBUG_DECODER_DRIVER
+		dev_dbg(dev, "%s: checking item %p [0x%x] [des: %d]\n",
+			__func__, it, it->msg_id, it->destroy);
+#endif
+		if (it->msg_id == msg_id) {
+			item = it;
+			break;
+		}
+	}
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(dev, "%s: found item %p [destroy: %d]\n",
+		__func__, item, item ? item->destroy : VXD_INVALID_ID);
+#endif
+
+	/* Find associated stream */
+	stream = idr_find(vxd->streams, str_id);
+	/*
+	 * Check for firmware condition in case
+	 * when unexpected item is received.
+	 */
+	if (!item && !stream && vxd_pvdec_check_fw_status(dev, vxd->reg_base)) {
+		struct vxd_item *orphan;
+		/*
+		 * Lets forward the fatal info to listeners first, relaying
+		 * on the head of the msg queue.
+		 */
+		/* TODO: forward fatal info to all attached processes */
+		item = list_entry(vxd->msgs.prev, struct vxd_item, list);
+		orphan = vxd_get_orphaned_item_locked(vxd, item->msg_id, msg_size);
+		if (!orphan) {
+			dev_warn(dev, "%s: drop msg 0x%x! (no orphan)\n", __func__, item->msg_id);
+			vxd_drop_msg_locked(vxd);
+		}
+
+		*fatal = TRUE;
+		return;
+	}
+
+	if ((item && item->destroy) || !stream) {
+		/*
+		 * Item was marked for destruction or we failed to find
+		 * associated stream. Probably it was already destroyed --
+		 * just ignore the message.
+		 */
+		if (item) {
+			__list_del_entry(&item->list);
+			kfree(item);
+			item = NULL;
+		}
+		dev_warn(dev, "%s: drop msg 0x%x! (no owner)\n", __func__, msg_id);
+		vxd_drop_msg_locked(vxd);
+		return;
+	}
+
+	/* Remove item from vxd->msgs list */
+	if (item && item->msg_id == msg_id && !not_last_msg)
+		__list_del_entry(&item->list);
+
+	/*
+	 * If there's no such item on a <being processed> list, or the one
+	 * found is too small to fit the output, or it's not supposed to be
+	 * released, allocate a new one.
+	 */
+	if (!item || (msg_size * sizeof(unsigned int) > item->msg.payload_size) || not_last_msg) {
+		struct vxd_item *new_item;
+
+		new_item = kzalloc(sizeof(*new_item) +
+				(msg_size * sizeof(unsigned int)), GFP_KERNEL);
+		if (item) {
+			if (!new_item) {
+				/*
+				 * Failed to allocate new item. Mark item as
+				 * errored and continue best effort, provide
+				 * only part of the message to the userspace
+				 */
+				dev_err(dev, "%s: failed to alloc new item!\n", __func__);
+				msg_size = item->msg.payload_size / sizeof(unsigned int);
+				item->msg.out_flags |= VXD_FW_MSG_FLAG_DRV_ERR;
+			} else {
+				*new_item = *item;
+				/*
+				 * Do not free the old item if subsequent
+				 * messages are expected (it also wasn't
+				 * removed from the vxd->msgs list, so we are
+				 * not losing a pointer here).
+				 */
+				if (!not_last_msg)
+					kfree(item);
+				item = new_item;
+			}
+		} else {
+			if (!new_item) {
+				/*
+				 * We have no place to put the message, we have
+				 * to drop it
+				 */
+				dev_err(dev, "%s: drop msg 0x%08x! (no mem)\n", __func__, msg_id);
+				vxd_drop_msg_locked(vxd);
+				return;
+			}
+			/*
+			 * There was no corresponding item on the
+			 * <being processed> list and we've allocated
+			 * a new one. Initialize it
+			 */
+			new_item->msg.out_flags = 0;
+			new_item->stream_id = str_id;
+			item = new_item;
+		}
+	}
+	ret = vxd_pvdec_recv_msg(dev, vxd->reg_base, item->msg.payload, msg_size, vxd);
+	if (ret) {
+		dev_err(dev, "%s: failed to receive msg from VXD!\n", __func__);
+		item->msg.out_flags |= VXD_FW_MSG_FLAG_DEV_ERR;
+	}
+	item->msg.payload_size = msg_size * sizeof(unsigned int);
+
+#ifdef DEBUG_DECODER_DRIVER
+	vxd_dbg_dump_msg(dev, __func__, item->msg.payload, msg_size);
+
+	dev_dbg(dev, "%s: adding to done list, item: %p, msg_size: %zu\n",
+		__func__, item, msg_size);
+#endif
+	list_add_tail(&item->list, &stream->ctx->items_done);
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_info(dev, "%s: signaling worker for %p\n", __func__, stream->ctx);
+#endif
+	schedule_work(stream->ctx->work);
+}
+
+/* Bottom half */
+irqreturn_t vxd_handle_thread_irq(void *dev)
+{
+	unsigned char no_more = FALSE;
+	unsigned char fatal = FALSE;
+	struct vxd_dev *vxd = ((const struct device *)dev)->driver_data;
+	struct vxd_hw_state *hw_state = &vxd->state.hw_state;
+	irqreturn_t ret = IRQ_HANDLED;
+
+	if (!vxd)
+		return IRQ_NONE;
+
+	mutex_lock(vxd->mutex);
+
+	/* Spurious interrupt? */
+	if (unlikely(!vxd->hw_on || vxd->hw_dead)) {
+		ret = IRQ_NONE;
+		goto out_unlock;
+	}
+
+	/* Check for critical exception - only MMU faults for now */
+	if (vxd_pvdec_check_irq(dev, vxd->reg_base, hw_state->irq_status) < 0) {
+#ifdef DEBUG_DECODER_DRIVER
+		dev_info(vxd->dev, "device MMU fault: resetting!!!\n");
+#endif
+		vxd_emrg_reset_locked(vxd, VXD_FW_MSG_FLAG_MMU_FAULT);
+		goto out_unlock;
+	}
+
+	/*
+	 * Single interrupt can correspond to multiple messages, handle them
+	 * all.
+	 */
+	while (!no_more)
+		vxd_handle_single_msg_locked(vxd, &no_more, &fatal);
+
+	if (fatal) {
+#ifdef DEBUG_DECODER_DRIVER
+		dev_info(vxd->dev, "fw fatal condition: resetting!!!\n");
+#endif
+		/* Try to recover ... */
+		vxd_emrg_reset_locked(vxd, VXD_FW_MSG_FLAG_FATAL);
+	} else {
+		/* Try to submit items to the HW */
+		vxd_schedule_locked(vxd);
+	}
+
+out_unlock:
+	hw_state->irq_status = 0;
+	mutex_unlock(vxd->mutex);
+
+	return ret;
+}
+
+static void vxd_worker(void *work)
+{
+	struct vxd_dev *vxd = NULL;
+	struct vxd_hw_state state = { 0 };
+	struct vxd_item *item_tail;
+
+	work = get_delayed_work_buff(work, FALSE);
+	vxd = container_of(work, struct vxd_dev, dwork);
+	mutex_lock(vxd->mutex);
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev, "%s: jif: %lu, pm: %llu dwr: %llu\n", __func__,
+		jiffies, vxd->pm_start, vxd->dwr_start);
+#endif
+
+	/*
+	 * Disable the hardware if it has been idle for vxd->hw_pm_delay
+	 * milliseconds. Or simply leave the function without doing anything
+	 * if the HW is not supposed to be turned off.
+	 */
+	if (list_empty(&vxd->pend) && list_empty(&vxd->msgs)) {
+		if (vxd_is_apm_required(vxd)) {
+			unsigned long long dst = vxd->pm_start +
+				msecs_to_jiffies(vxd->hw_pm_delay);
+
+			if (time_is_before_eq_jiffies((unsigned long)dst)) {
+#ifdef DEBUG_DECODER_DRIVER
+				dev_dbg(vxd->dev, "%s: pm, power off\n", __func__);
+#endif
+				vxd_make_hw_off_locked(vxd, FALSE);
+			} else {
+				unsigned long long targ = dst - jiffies;
+
+#ifdef DEBUG_DECODER_DRIVER
+				dev_dbg(vxd->dev, "%s: pm, reschedule: %llu\n", __func__, targ);
+#endif
+				vxd_sched_worker_locked(vxd, jiffies_to_msecs(targ));
+			}
+		}
+		goto out_unlock;
+	}
+
+	/*
+	 * We are not processing anything, but pending list is not empty (if it
+	 * was, we would enter <if statement> above. This can happen upon
+	 * specific conditions, when input message occupies almost whole
+	 * host->MTX ring buffer and is followed by large padding message.
+	 */
+	if (list_empty(&vxd->msgs)) {
+		vxd_schedule_locked(vxd);
+		goto out_unlock;
+	}
+
+	/* Skip emergency reset if it's disabled. */
+	if (vxd->hw_dwr_period <= 0) {
+#ifdef DEBUG_DECODER_DRIVER
+		dev_dbg(vxd->dev, "%s: skip watchdog\n", __func__);
+#endif
+		goto out_unlock;
+	} else {
+		/* Recalculate DWR when needed */
+		unsigned long long dst = vxd->dwr_start +
+			msecs_to_jiffies(vxd->hw_dwr_period);
+
+		if (time_is_after_jiffies((unsigned long)dst)) {
+			unsigned long long targ = dst - jiffies;
+
+#ifdef DEBUG_DECODER_DRIVER
+			dev_dbg(vxd->dev, "%s: dwr, reschedule: %llu\n", __func__, targ);
+#endif
+			vxd_sched_worker_locked(vxd, jiffies_to_msecs(targ));
+			goto out_unlock;
+		}
+	}
+
+	/* Get ID of the oldest item being processed by the HW */
+	item_tail = list_entry(vxd->msgs.prev, struct vxd_item, list);
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev, "%s: tail_item: %p, id: 0x%x\n", __func__, item_tail,
+		item_tail->msg_id);
+#endif
+
+	/* Get HW and firmware state */
+	vxd_pvdec_get_state(vxd->dev, vxd->reg_base, VXD_NUM_PIX_PIPES(vxd->props), &state);
+
+	if (vxd->state.msg_id_tail == item_tail->msg_id &&
+	    !memcmp(&state, &vxd->state.hw_state,
+	    sizeof(struct vxd_hw_state))) {
+		vxd->state.msg_id_tail = 0;
+		memset(&vxd->state.hw_state, 0, sizeof(vxd->state.hw_state));
+		dev_err(vxd->dev, "device DWR(%ums) expired: resetting!!!\n",
+			vxd->hw_dwr_period);
+		vxd_emrg_reset_locked(vxd, VXD_FW_MSG_FLAG_DWR);
+	} else {
+		/* Record current state */
+		vxd->state.msg_id_tail = item_tail->msg_id;
+		vxd->state.hw_state = state;
+
+		/* Submit items to the HW, if space is available.  */
+		vxd_schedule_locked(vxd);
+
+#ifdef DEBUG_DECODER_DRIVER
+		dev_dbg(vxd->dev, "%s: scheduling DWR work (%d ms)!\n",
+			__func__, vxd->hw_dwr_period);
+#endif
+		vxd_sched_worker_locked(vxd, vxd->hw_dwr_period);
+	}
+
+out_unlock:
+	mutex_unlock(vxd->mutex);
+}
+
+/*
+ * Lazy initialization of main driver context (when first core is probed -- we
+ * need heap configuration from sysdev to allocate firmware buffers.
+ */
+int vxd_init(void *dev, struct vxd_dev *vxd,
+	     const struct heap_config heap_configs[], int heaps)
+{
+	int ret, i;
+
+	INIT_LIST_HEAD(&vxd_drv.heaps);
+	vxd_drv.internal_heap_id = VXD_INVALID_ID;
+
+	vxd_drv.mem_ctx = NULL;
+
+	INIT_LIST_HEAD(&vxd_drv.devices);
+
+	vxd_drv.virt_space.fw_addr = 0x42000;
+	vxd_drv.virt_space.rendec_addr = 0xe0000000;
+
+	vxd_drv.initialised = 0;
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(dev, "%s: vxd drv init, params:\n", __func__);
+#endif
+
+	/* Initialise memory management component */
+	for (i = 0; i < heaps; i++) {
+		struct vxd_heap *heap;
+
+#ifdef DEBUG_DECODER_DRIVER
+		dev_dbg(dev, "%s: adding heap of type %d\n",
+			__func__, heap_configs[i].type);
+#endif
+
+		heap = kzalloc(sizeof(*heap), GFP_KERNEL);
+		if (!heap) {
+			ret = -ENOMEM;
+			goto heap_add_failed;
+		}
+
+		ret = img_mem_add_heap(&heap_configs[i], &heap->id);
+		if (ret < 0) {
+			dev_err(dev, "%s: failed to init heap (type %d)!\n",
+				__func__, heap_configs[i].type);
+			kfree(heap);
+			goto heap_add_failed;
+		}
+		list_add(&heap->list, &vxd_drv.heaps);
+
+		/* Implicitly, first heap is used for internal allocations */
+		if (vxd_drv.internal_heap_id < 0) {
+			vxd_drv.internal_heap_id = heap->id;
+#ifdef DEBUG_DECODER_DRIVER
+			dev_dbg(dev, "%s: using heap %d for internal alloc\n",
+				__func__, vxd_drv.internal_heap_id);
+#endif
+		}
+	}
+
+	/* Do not proceed if internal heap not defined */
+	if (vxd_drv.internal_heap_id < 0) {
+		dev_err(dev, "%s: failed to locate heap for internal alloc\n", __func__);
+		ret = -EINVAL;
+		/* Loop registered heaps just for sanity */
+		goto heap_add_failed;
+	}
+
+	/* Create memory management context for HW buffers */
+	ret = img_mem_create_ctx(&vxd_drv.mem_ctx);
+	if (ret) {
+		dev_err(dev, "%s: failed to create mem context (err:%d)!\n", __func__, ret);
+		goto create_mem_context_failed;
+	}
+
+	vxd->mem_ctx = vxd_drv.mem_ctx;
+
+	/* Allocate rendec buffer */
+	ret = img_mem_alloc(dev, vxd_drv.mem_ctx, vxd_drv.internal_heap_id,
+			    VXD_RENDEC_SIZE * VXD_NUM_PIX_PIPES(vxd->props),
+			    (enum mem_attr)0, &vxd->rendec_buf_id);
+	if (ret) {
+		dev_err(dev, "%s: alloc rendec buffer failed (err:%d)!\n", __func__, ret);
+		goto create_mem_context_failed;
+	}
+
+	init_delayed_work(&vxd->dwork, vxd_worker, HWA_DECODER);
+	if (!vxd->dwork) {
+		ret = ENOMEM;
+		goto create_mem_context_failed;
+	}
+
+	vxd_drv.initialised = 1;
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(dev, "%s: vxd drv init done\n", __func__);
+#endif
+	return 0;
+
+create_mem_context_failed:
+heap_add_failed:
+	while (!list_empty(&vxd_drv.heaps)) {
+		struct vxd_heap *heap;
+
+		heap = list_first_entry(&vxd_drv.heaps, struct vxd_heap, list);
+		__list_del_entry(&heap->list);
+		img_mem_del_heap(heap->id);
+		kfree(heap);
+	}
+	vxd_drv.internal_heap_id = VXD_INVALID_ID;
+	return ret;
+}
+
+/*
+ * Get internal_heap_id
+ * TODO: Only error checking is if < 0, so if the stored value is < 0, then
+ * just passing the value to caller still conveys error.
+ * Caller must error check.
+ */
+int vxd_g_internal_heap_id(void)
+{
+	return vxd_drv.internal_heap_id;
+}
+
+void vxd_deinit(struct vxd_dev *vxd)
+{
+	cancel_delayed_work_sync(vxd->dwork);
+	vxd_make_hw_off_locked(vxd, FALSE);
+
+	/* Destroy memory management context */
+	if (vxd_drv.mem_ctx) {
+		/* Deallocate rendec buffer */
+		img_mem_free(vxd_drv.mem_ctx, vxd->rendec_buf_id);
+
+		img_mem_destroy_ctx(vxd_drv.mem_ctx);
+		vxd_drv.mem_ctx = NULL;
+	}
+
+	/* Deinitialize memory management component */
+	while (!list_empty(&vxd_drv.heaps)) {
+		struct vxd_heap *heap;
+
+		heap = list_first_entry(&vxd_drv.heaps, struct vxd_heap, list);
+		__list_del_entry(&heap->list);
+		img_mem_del_heap(heap->id);
+		kfree(heap);
+	}
+
+	vxd_drv.internal_heap_id = VXD_INVALID_ID;
+	vxd_drv.mem_ctx = NULL;
+	vxd_drv.virt_space.fw_addr = 0x0;
+	vxd_drv.virt_space.rendec_addr = 0x0;
+	vxd_drv.initialised = 0;
+
+#ifdef ERROR_RECOVERY_SIMULATION
+	/* free the kernel object created to debug */
+	kobject_put(vxd_dec_kobject);
+#endif
+}
+
+static void vxd_fw_loaded(const struct firmware *fw, void *context)
+{
+	struct vxd_dev *vxd = context;
+	unsigned long bin_size;
+	int buf_id;
+	struct vxd_fw_hdr *hdr;
+	void *buf_kptr;
+	int ret;
+	unsigned long size = 0;
+	const unsigned char *data = NULL;
+
+	if (!fw) {
+		dev_err(vxd->dev, "Firmware binary is not present\n");
+		vxd->no_fw = 1;
+		return;
+	}
+
+	size = fw->size;
+	data = fw->data;
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_info(vxd->dev, "FW: acquired %s size %zu\n", drv_fw_name, size);
+#endif
+
+	/* Sanity verification of the firmware */
+	if (size < sizeof(struct vxd_fw_hdr)) {
+		dev_err(vxd->dev, "%s: firmware file too small!\n", __func__);
+		goto out;
+	}
+
+	bin_size = size - sizeof(struct vxd_fw_hdr);
+	ret = img_mem_alloc(vxd->dev, vxd_drv.mem_ctx, vxd_drv.internal_heap_id,
+			    bin_size, (enum mem_attr)0, &buf_id);
+	if (ret) {
+		dev_err(vxd->dev, "%s: failed to alloc fw buffer (err:%d)!\n", __func__, ret);
+		goto out;
+	}
+
+	hdr = kzalloc(sizeof(*hdr), GFP_KERNEL);
+	if (!hdr)
+		goto out_release_buf;
+
+	/* Store firmware header in vxd context */
+	memcpy(hdr, data, sizeof(struct vxd_fw_hdr));
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_info(vxd->dev, "FW: info cs: %u, bs: %u, id: 0x%08x, ts: %u\n",
+		 hdr->core_size, hdr->blob_size,
+		 hdr->firmware_id, hdr->timestamp);
+#endif
+
+	/* Check if header is consistent */
+	if (hdr->core_size > bin_size || hdr->blob_size > bin_size) {
+		dev_err(vxd->dev, "%s: got invalid firmware!\n", __func__);
+		goto out_release_hdr;
+	}
+
+	/* Map the firmware buffer to CPU */
+	ret = img_mem_map_km(vxd_drv.mem_ctx, buf_id);
+	if (ret) {
+		dev_err(vxd->dev, "%s: failed to map FW buf to cpu! (%d)\n", __func__, ret);
+		goto out_release_hdr;
+	}
+
+	/* Copy firmware to device buffer */
+	buf_kptr = img_mem_get_kptr(vxd_drv.mem_ctx, buf_id);
+	memcpy(buf_kptr, data + sizeof(struct vxd_fw_hdr), size - sizeof(struct vxd_fw_hdr));
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev, "%s: FW: copied to buffer %d kptr 0x%p\n", __func__, buf_id, buf_kptr);
+#endif
+
+	img_mem_sync_cpu_to_device(vxd_drv.mem_ctx, buf_id);
+
+	vxd->firmware.fw_size = size;
+	vxd->firmware.buf_id = buf_id;
+	vxd->firmware.hdr = hdr;
+	vxd->firmware.ready = TRUE;
+
+	release_firmware(fw);
+	complete_all(vxd->firmware_loading_complete);
+	pr_debug("Firmware loaded successfully ..!!\n");
+	return;
+
+out_release_hdr:
+	kfree(hdr);
+out_release_buf:
+	img_mem_free(vxd_drv.mem_ctx, buf_id);
+out:
+	release_firmware(fw);
+	complete_all(vxd->firmware_loading_complete);
+	kfree(vxd->firmware_loading_complete);
+	vxd->firmware_loading_complete = NULL;
+}
+
+/*
+ * Takes the firmware from the file system and allocates a buffer
+ */
+int vxd_prepare_fw(struct vxd_dev *vxd)
+{
+	int ret;
+
+	/* Fetch firmware from the file system */
+	struct completion **firmware_loading_complete =
+		(struct completion **)&vxd->firmware_loading_complete;
+
+	*firmware_loading_complete = kmalloc(sizeof(*firmware_loading_complete), GFP_KERNEL);
+	if (!(*firmware_loading_complete)) {
+		pr_err("Memory allocation failed for init_completion\n");
+		return -ENOMEM;
+	}
+	init_completion(*firmware_loading_complete);
+
+	if (!vxd->firmware_loading_complete)
+		return -ENOMEM;
+
+	vxd->firmware.ready = FALSE;
+	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
+				      drv_fw_name, vxd->dev, GFP_KERNEL, vxd,
+				      vxd_fw_loaded);
+	if (ret < 0) {
+		dev_err(vxd->dev, "request_firmware_nowait err: %d\n", ret);
+		complete_all(vxd->firmware_loading_complete);
+		kfree(vxd->firmware_loading_complete);
+		vxd->firmware_loading_complete = NULL;
+	}
+
+	return ret;
+}
+
+/*
+ * Cleans firmware resources
+ */
+void vxd_clean_fw_resources(struct vxd_dev *vxd)
+{
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev, "%s:%d\n", __func__, __LINE__);
+#endif
+
+	wait_for_completion(vxd->firmware_loading_complete);
+	kfree(vxd->firmware_loading_complete);
+	vxd->firmware_loading_complete = NULL;
+
+	if (vxd->firmware.fw_size) {
+		img_mem_free(vxd_drv.mem_ctx, vxd->firmware.buf_id);
+		kfree(vxd->firmware.hdr);
+		vxd->firmware.hdr = NULL;
+#ifdef DEBUG_DECODER_DRIVER
+		dev_info(vxd->dev, "FW: released %s\n", drv_fw_name);
+#endif
+		vxd->firmware.buf_id = VXD_INVALID_ID;
+	}
+}
+
+/*
+ * Submit a message to the VXD.
+ * <ctx> is used to verify that requested stream id (item->stream_id) is valid
+ * for this ctx
+ */
+int vxd_send_msg(struct vxd_dec_ctx *ctx, struct vxd_fw_msg *msg)
+{
+	struct vxd_dev *vxd = ctx->dev;
+	unsigned long msg_size;
+	struct vxd_item *item;
+	struct vxd_stream *stream;
+	int ret;
+
+	if (msg->payload_size < VXD_MIN_INPUT_SIZE)
+		return -EINVAL;
+
+	if (msg->payload_size % sizeof(unsigned int)) {
+		dev_err(vxd->dev, "msg size not aligned! (%u)\n",
+			msg->payload_size);
+		return -EINVAL;
+	}
+
+	msg_size = VXD_MSG_SIZE(*msg);
+
+	if (msg_size > VXD_MAX_INPUT_SIZE)
+		return -EINVAL;
+
+	/* Verify that the gap was left for stream PTD */
+	if (msg->payload[VXD_PTD_MSG_OFFSET] != 0) {
+		dev_err(vxd->dev, "%s: PTD gap missing!\n", __func__);
+		return -EINVAL;
+	}
+
+	ret = mutex_lock_interruptible_nested(ctx->mutex, SUBCLASS_VXD_CORE);
+	if (ret)
+		return ret;
+
+	stream = idr_find(vxd->streams, ctx->stream.id);
+	if (!stream) {
+		dev_warn(vxd->dev, "%s: invalid stream id requested! (%u)\n",
+			 __func__, ctx->stream.id);
+
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	item = kmalloc(sizeof(*item) + msg->payload_size, GFP_KERNEL);
+	if (!item) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
+	memcpy(&item->msg, msg, msg_size);
+
+	msg->out_flags &= VXD_FW_MSG_WR_FLAGS_MASK;
+	item->stream_id = ctx->stream.id;
+	item->msg_id = 0;
+	item->msg.out_flags = msg->out_flags;
+	item->destroy = 0;
+
+	/*
+	 * Inject the stream PTD into the message. It was already verified that
+	 * there is enough space.
+	 */
+	item->msg.payload[VXD_PTD_MSG_OFFSET] = stream->ptd;
+
+	list_add_tail(&item->list, &vxd->pend);
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev,
+		"%s: added item %p to pend, ptd: 0x%x, str: %u flags: 0x%x\n",
+		__func__, item, stream->ptd, stream->id, item->msg.out_flags);
+#endif
+
+	vxd_schedule_locked(vxd);
+
+out_unlock:
+	mutex_unlock(ctx->mutex);
+
+	return ret;
+}
+
+int vxd_suspend_dev(void *dev)
+{
+	struct vxd_dev *vxd = platform_get_drvdata(to_platform_device(dev));
+
+	mutex_lock(vxd->mutex);
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(dev, "%s: taking a nap!\n", __func__);
+#endif
+
+	/* Cancel the worker first */
+	cancel_delayed_work(vxd->dwork);
+
+	/* Forcing hardware disable */
+	vxd_make_hw_off_locked(vxd, TRUE);
+
+	/* Move all valid items to the pending queue */
+	vxd_rewind_msgs_locked(vxd);
+
+	mutex_unlock(vxd->mutex);
+
+	return 0;
+}
+
+int vxd_resume_dev(void *dev)
+{
+	struct vxd_dev *vxd = platform_get_drvdata(to_platform_device(dev));
+	int ret = 0;
+
+	mutex_lock(vxd->mutex);
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(dev, "%s: waking up!\n", __func__);
+#endif
+
+	mutex_unlock(vxd->mutex);
+
+	return ret;
+}
+
+int vxd_map_buffer_sg(struct vxd_dev *vxd, struct vxd_dec_ctx *ctx,
+		      unsigned int str_id,
+		      unsigned int buff_id,
+		      void *sgt, unsigned int virt_addr,
+		      unsigned int map_flags)
+{
+	struct vxd_stream *stream;
+	unsigned int flags = VXD_MMU_PTD_FLAG_NONE;
+	int ret;
+
+	ret = mutex_lock_interruptible_nested(ctx->mutex, SUBCLASS_VXD_CORE);
+	if (ret)
+		return ret;
+
+	stream = idr_find(vxd->streams, str_id);
+	if (!stream) {
+		dev_err(vxd->dev, "%s: stream %d not found!\n", __func__, str_id);
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if ((map_flags & (VXD_MAP_FLAG_READ_ONLY | VXD_MAP_FLAG_WRITE_ONLY))
+		== (VXD_MAP_FLAG_READ_ONLY | VXD_MAP_FLAG_WRITE_ONLY)) {
+		dev_err(vxd->dev, "%s: Bogus mapping flags 0x%x!\n", __func__,
+			map_flags);
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	/* Convert permission flags to internal definitions */
+	if (map_flags & VXD_MAP_FLAG_READ_ONLY)
+		flags |= VXD_MMU_PTD_FLAG_READ_ONLY;
+
+	if (map_flags & VXD_MAP_FLAG_WRITE_ONLY)
+		flags |= VXD_MMU_PTD_FLAG_WRITE_ONLY;
+
+	ret = img_mmu_map_sg(stream->mmu_ctx, ctx->mem_ctx, buff_id, sgt, virt_addr, flags);
+	if (ret) {
+		dev_err(vxd->dev, "%s: map failed!\n", __func__);
+		goto out_unlock;
+	}
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev,
+		"%s: mapped buf %u to 0x%08x, str_id: %u flags: 0x%x\n",
+		__func__, buff_id, virt_addr, str_id, flags);
+#endif
+
+out_unlock:
+	mutex_unlock(ctx->mutex);
+	return ret;
+}
+
+int vxd_map_buffer(struct vxd_dev *vxd, struct vxd_dec_ctx *ctx, unsigned int str_id,
+		   unsigned int buff_id,
+		   unsigned int virt_addr,
+		   unsigned int map_flags)
+{
+	struct vxd_stream *stream;
+	unsigned int flags = VXD_MMU_PTD_FLAG_NONE;
+	int ret;
+
+	ret = mutex_lock_interruptible_nested(ctx->mutex, SUBCLASS_VXD_CORE);
+	if (ret)
+		return ret;
+
+	stream = idr_find(vxd->streams, str_id);
+	if (!stream) {
+		dev_err(vxd->dev, "%s: stream %d not found!\n", __func__, str_id);
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if ((map_flags & (VXD_MAP_FLAG_READ_ONLY | VXD_MAP_FLAG_WRITE_ONLY))
+		== (VXD_MAP_FLAG_READ_ONLY | VXD_MAP_FLAG_WRITE_ONLY)) {
+		dev_err(vxd->dev, "%s: Bogus mapping flags 0x%x!\n", __func__, map_flags);
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	/* Convert permission flags to internal definitions */
+	if (map_flags & VXD_MAP_FLAG_READ_ONLY)
+		flags |= VXD_MMU_PTD_FLAG_READ_ONLY;
+
+	if (map_flags & VXD_MAP_FLAG_WRITE_ONLY)
+		flags |= VXD_MMU_PTD_FLAG_WRITE_ONLY;
+
+	ret = img_mmu_map(stream->mmu_ctx, ctx->mem_ctx, buff_id, virt_addr, flags);
+	if (ret) {
+		dev_err(vxd->dev, "%s: map failed!\n", __func__);
+		goto out_unlock;
+	}
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev,
+		"%s: mapped buf %u to 0x%08x, str_id: %u flags: 0x%x\n",
+		__func__, buff_id, virt_addr, str_id, flags);
+#endif
+
+out_unlock:
+	mutex_unlock(ctx->mutex);
+	return ret;
+}
+
+int vxd_unmap_buffer(struct vxd_dev *vxd, struct vxd_dec_ctx *ctx,
+		     unsigned int str_id, unsigned int buff_id)
+{
+	struct vxd_stream *stream;
+	int ret;
+
+	ret = mutex_lock_interruptible_nested(ctx->mutex, SUBCLASS_VXD_CORE);
+	if (ret)
+		return ret;
+
+	stream = idr_find(vxd->streams, str_id);
+	if (!stream) {
+		dev_err(vxd->dev, "%s: stream %d not found!\n", __func__, str_id);
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	ret = img_mmu_unmap(stream->mmu_ctx, ctx->mem_ctx, buff_id);
+	if (ret) {
+		dev_err(vxd->dev, "%s: map failed!\n", __func__);
+		goto out_unlock;
+	}
+
+#ifdef DEBUG_DECODER_DRIVER
+	dev_dbg(vxd->dev, "%s: unmapped buf %u str_id: %u\n", __func__, buff_id, str_id);
+#endif
+
+out_unlock: mutex_unlock(ctx->mutex);
+	return ret;
+}
diff --git a/drivers/staging/media/vxd/decoder/vxd_dec.c b/drivers/staging/media/vxd/decoder/vxd_dec.c
new file mode 100644
index 000000000000..cf3cf9b7b6f0
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/vxd_dec.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IMG DEC SYSDEV and UI Interface function implementations
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ *	Prashanth Kumar Amai <prashanth.ka@pathpartnertech.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "core.h"
+#include "h264fw_data.h"
+#include "hevcfw_data.h"
+#include "img_dec_common.h"
+#include "vxd_pvdec_priv.h"
+
+unsigned int get_nbuffers(enum vdec_vid_std std, int w, int h,
+			  unsigned int max_num_ref_frames)
+{
+	unsigned int nbuffers;
+
+	switch (std) {
+	case VDEC_STD_H264:
+		/*
+		 * Request number of buffers from header bspp information
+		 * using formula N + Display Lag
+		 * Parser is passing (2*N)
+		 */
+		if (max_num_ref_frames == 0) {
+			nbuffers = DISPLAY_LAG + min(MAX_CAPBUFS_H264,
+					(184320 / ((w / 16) * (h / 16))));
+		} else {
+			nbuffers = max_num_ref_frames + DISPLAY_LAG;
+		}
+		break;
+	case VDEC_STD_HEVC:
+		if (max_num_ref_frames == 0) {
+			if ((w * h) <= (HEVC_MAX_LUMA_PS >> 2))
+				nbuffers = 16;
+			else if ((w * h) <= (HEVC_MAX_LUMA_PS >> 1))
+				nbuffers = 12;
+			else if ((w * h) <= ((3 * HEVC_MAX_LUMA_PS) >> 2))
+				nbuffers = 8;
+			else
+				nbuffers = 6;
+			nbuffers += DISPLAY_LAG;
+		} else {
+			nbuffers = max_num_ref_frames + DISPLAY_LAG;
+		}
+		break;
+#ifdef HAS_JPEG
+	case VDEC_STD_JPEG:
+		/*
+		 * Request number of output buffers based on h264 spec
+		 * + display delay
+		 */
+		nbuffers = DISPLAY_LAG + min(MAX_CAPBUFS_H264,
+				(184320 / ((w / 16) * (h / 16))));
+		break;
+#endif
+	default:
+		nbuffers = 0;
+	}
+
+	return nbuffers;
+}
+
+int vxd_dec_alloc_bspp_resource(struct vxd_dec_ctx *ctx, enum vdec_vid_std vid_std)
+{
+	struct vxd_dev *vxd_dev = ctx->dev;
+	struct device *dev = vxd_dev->v4l2_dev.dev;
+	struct vdec_buf_info buf_info;
+	struct bspp_ddbuf_array_info *fw_sequ = ctx->fw_sequ;
+	struct bspp_ddbuf_array_info *fw_pps = ctx->fw_pps;
+	int attributes = 0, heap_id = 0, size = 0;
+	int i, ret = 0;
+
+	attributes = SYS_MEMATTRIB_UNCACHED | SYS_MEMATTRIB_WRITECOMBINE |
+		SYS_MEMATTRIB_INTERNAL | SYS_MEMATTRIB_CPU_WRITE;
+	heap_id = vxd_g_internal_heap_id();
+
+	size = vid_std == VDEC_STD_HEVC ?
+		sizeof(struct hevcfw_sequence_ps) : sizeof(struct h264fw_sequence_ps);
+
+#ifdef HAS_JPEG
+	if (vid_std == VDEC_STD_JPEG)
+		size = sizeof(struct vdec_jpeg_sequ_hdr_info);
+#endif
+
+	for (i = 0; i < MAX_SEQUENCES; i++) {
+		ret = img_mem_alloc(vxd_dev->dev, ctx->mem_ctx, heap_id,
+				    size, (enum mem_attr)attributes,
+				    (int *)&fw_sequ[i].ddbuf_info.buf_id);
+		if (ret) {
+			dev_err(dev, "Couldn't allocate sequ buffer %d\n", i);
+			return -ENOMEM;
+		}
+		ret = img_mem_map_km(ctx->mem_ctx, fw_sequ[i].ddbuf_info.buf_id);
+		if (ret) {
+			dev_err(dev, "Couldn't map sequ buffer %d\n", i);
+			return -ENOMEM;
+		}
+		fw_sequ[i].ddbuf_info.cpu_virt_addr = img_mem_get_kptr
+							(ctx->mem_ctx,
+							 fw_sequ[i].ddbuf_info.buf_id);
+		fw_sequ[i].buf_offset = 0;
+		fw_sequ[i].buf_element_size = size;
+		fw_sequ[i].ddbuf_info.buf_size = size;
+		fw_sequ[i].ddbuf_info.mem_attrib = (enum sys_emem_attrib)attributes;
+		memset(fw_sequ[i].ddbuf_info.cpu_virt_addr, 0, size);
+
+		buf_info.cpu_linear_addr =
+			fw_sequ[i].ddbuf_info.cpu_virt_addr;
+		buf_info.buf_size = size;
+		buf_info.fd = -1;
+		buf_info.buf_id = fw_sequ[i].ddbuf_info.buf_id;
+		buf_info.mem_attrib =
+			(enum sys_emem_attrib)(SYS_MEMATTRIB_UNCACHED | SYS_MEMATTRIB_WRITECOMBINE |
+			SYS_MEMATTRIB_INPUT | SYS_MEMATTRIB_CPU_WRITE);
+
+		ret = core_stream_map_buf(ctx->res_str_id, VDEC_BUFTYPE_BITSTREAM, &buf_info,
+					  &fw_sequ[i].ddbuf_info.bufmap_id);
+		if (ret) {
+			dev_err(dev, "sps core_stream_map_buf failed\n");
+			return ret;
+		}
+	}
+
+#ifdef HAS_JPEG
+	if (vid_std == VDEC_STD_JPEG)
+		return 0;
+#endif
+
+	size = vid_std == VDEC_STD_HEVC ?
+		sizeof(struct hevcfw_picture_ps) : sizeof(struct h264fw_picture_ps);
+
+	for (i = 0; i < MAX_PPSS; i++) {
+		ret = img_mem_alloc(vxd_dev->dev, ctx->mem_ctx, heap_id, size,
+				    (enum mem_attr)attributes,
+				    (int *)&fw_pps[i].ddbuf_info.buf_id);
+		if (ret) {
+			dev_err(dev, "Couldn't allocate sequ buffer %d\n", i);
+			return -ENOMEM;
+		}
+		ret = img_mem_map_km(ctx->mem_ctx, fw_pps[i].ddbuf_info.buf_id);
+		if (ret) {
+			dev_err(dev, "Couldn't map sequ buffer %d\n", i);
+			return -ENOMEM;
+		}
+		fw_pps[i].ddbuf_info.cpu_virt_addr = img_mem_get_kptr(ctx->mem_ctx,
+								      fw_pps[i].ddbuf_info.buf_id);
+		fw_pps[i].buf_offset = 0;
+		fw_pps[i].buf_element_size = size;
+		fw_pps[i].ddbuf_info.buf_size = size;
+		fw_pps[i].ddbuf_info.mem_attrib = (enum sys_emem_attrib)attributes;
+		memset(fw_pps[i].ddbuf_info.cpu_virt_addr, 0, size);
+
+		buf_info.cpu_linear_addr =
+			fw_pps[i].ddbuf_info.cpu_virt_addr;
+		buf_info.buf_size = size;
+		buf_info.fd = -1;
+		buf_info.buf_id = fw_pps[i].ddbuf_info.buf_id;
+		buf_info.mem_attrib =
+			(enum sys_emem_attrib)(SYS_MEMATTRIB_UNCACHED | SYS_MEMATTRIB_WRITECOMBINE |
+			SYS_MEMATTRIB_INPUT | SYS_MEMATTRIB_CPU_WRITE);
+
+		ret = core_stream_map_buf(ctx->res_str_id, VDEC_BUFTYPE_BITSTREAM, &buf_info,
+					  &fw_pps[i].ddbuf_info.bufmap_id);
+		if (ret) {
+			dev_err(dev, "pps core_stream_map_buf failed\n");
+			return ret;
+		}
+	}
+	return 0;
+}
diff --git a/drivers/staging/media/vxd/decoder/vxd_dec.h b/drivers/staging/media/vxd/decoder/vxd_dec.h
new file mode 100644
index 000000000000..a8d409bc4212
--- /dev/null
+++ b/drivers/staging/media/vxd/decoder/vxd_dec.h
@@ -0,0 +1,477 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * IMG DEC SYSDEV and UI Interface header
+ *
+ * Copyright (c) Imagination Technologies Ltd.
+ * Copyright (c) 2021 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *	Amit Makani <amit.makani@ti.com>
+ *
+ * Re-written for upstreamimg
+ *	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+ *	Prashanth Kumar Amai <prashanth.ka@pathpartnertech.com>
+ */
+
+#ifndef _VXD_DEC_H
+#define _VXD_DEC_H
+
+#include <linux/interrupt.h>
+#include <linux/dma-mapping.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+#include <linux/types.h>
+
+#include "bspp.h"
+#include "img_dec_common.h"
+#include "img_mem_man.h"
+#include "img_pixfmts.h"
+#include "pixel_api.h"
+#include "vdecdd_defs.h"
+#include "vdec_defs.h"
+#include "work_queue.h"
+
+#define VXD_MIN_STREAM_ID 1
+#define VXD_MAX_STREAMS_PER_DEV 254
+#define VXD_MAX_STREAM_ID (VXD_MIN_STREAM_ID + VXD_MAX_STREAMS_PER_DEV)
+
+#define CODEC_NONE -1
+#define CODEC_H264_DEC 0
+#define CODEC_MPEG4_DEC 1
+#define CODEC_VP8_DEC 2
+#define CODEC_VC1_DEC 3
+#define CODEC_MPEG2_DEC 4
+#define CODEC_JPEG_DEC 5
+#define CODEC_VP9_DEC 6
+#define CODEC_HEVC_DEC 7
+
+#define MAX_SEGMENTS 6
+#define HW_ALIGN 64
+
+#define MAX_BUF_TRACE 30
+
+#define MAX_CAPBUFS_H264 16
+#define DISPLAY_LAG 3
+#define HEVC_MAX_LUMA_PS 35651584
+
+#define MAX_PLANES 3
+
+enum {
+	Q_DATA_SRC         = 0,
+	Q_DATA_DST         = 1,
+	Q_DATA_FORCE32BITS = 0x7FFFFFFFU
+};
+
+enum {
+	IMG_DEC_FMT_TYPE_CAPTURE     = 0x01,
+	IMG_DEC_FMT_TYPE_OUTPUT      = 0x10,
+	IMG_DEC_FMT_TYPE_FORCE32BITS = 0x7FFFFFFFU
+};
+
+enum vxd_map_flags {
+	VXD_MAP_FLAG_NONE        = 0x0,
+	VXD_MAP_FLAG_READ_ONLY   = 0x1,
+	VXD_MAP_FLAG_WRITE_ONLY  = 0x2,
+	VXD_MAP_FLAG_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * struct vxd_fw_msg - This structure holds the information about the message
+ *                     exchanged in read/write between Kernel and firmware.
+ *
+ * @out_flags: indicating the type of message
+ * @payload_size: size of payload in bytes
+ * @payload: data which is send to firmware
+ */
+struct vxd_fw_msg {
+	unsigned int out_flags;
+	unsigned int payload_size;
+	unsigned int payload[0];
+};
+
+/* HW state */
+struct vxd_hw_state {
+	unsigned int fw_counter;
+	unsigned int fe_status[VXD_MAX_PIPES];
+	unsigned int be_status[VXD_MAX_PIPES];
+	unsigned int dmac_status[VXD_MAX_PIPES][2]; /* Cover DMA chan 2/3*/
+	unsigned int irq_status;
+};
+
+/*
+ * struct vxd_state - contains VXD HW state
+ *
+ * @hw_state: HW state
+ * @msg_id_tail: msg id of the oldest item being processed
+ */
+struct vxd_state {
+	struct vxd_hw_state hw_state;
+	unsigned short msg_id_tail;
+};
+
+/*
+ * struct vxd_dec_fmt - contains info for each of the supported video format
+ *
+ * @fourcc: V4L2 pixel format FCC identifier
+ * @num_planes: number of planes required for luma and chroma
+ * @type: CAPTURE or OUTPUT
+ * @std: VDEC video standard
+ * @pixfmt: IMG pixel format
+ * @interleave: Chroma interleave order
+ * @idc: Chroma format
+ * @size_num: Numberator used to calculate image size
+ * @size_den: Denominator used to calculate image size
+ * @bytes_pp: Bytes per pixel for this format
+ */
+struct vxd_dec_fmt {
+	unsigned int fourcc;
+	unsigned int num_planes;
+	unsigned char type;
+	enum vdec_vid_std std;
+	enum img_pixfmt pixfmt;
+	enum pixel_chroma_interleaved interleave;
+	enum pixel_fmt_idc idc;
+	int size_num;
+	int size_den;
+	int bytes_pp;
+};
+
+/*
+ * struct vxd_item - contains information about the item sent to fw
+ *
+ * @list: item to be linked list to items_done, msgs, or pend.
+ * @stream_id: stream id
+ * @msg_id: message id
+ * @destroy: item belongs to the stream which is destroyed
+ * @msg: contains msg between kernel and fw
+ */
+struct vxd_item {
+	struct list_head list;
+	unsigned int stream_id;
+	unsigned int msg_id;
+	struct {
+		unsigned destroy : 1;
+	};
+	struct vxd_fw_msg msg;
+};
+
+enum vxd_cb_type {
+	VXD_CB_STRUNIT_PROCESSED,
+	VXD_CB_SPS_RELEASE,
+	VXD_CB_PPS_RELEASE,
+	VXD_CB_PICT_DECODED,
+	VXD_CB_PICT_DISPLAY,
+	VXD_CB_PICT_RELEASE,
+	VXD_CB_PICT_END,
+	VXD_CB_STR_END,
+	VXD_CB_ERROR_FATAL,
+	VXD_CB_FORCE32BITS = 0x7FFFFFFFU
+};
+
+/*
+ * vxd_cb - Return a resource to vxd
+ *
+ * @ctx: the vxd stream context
+ * @type: the type of message
+ * @buf_map_id: the buf_map_id of the resource being returned
+ */
+typedef void (*vxd_cb)(void *ctx, enum vxd_cb_type type, unsigned int buf_map_id);
+
+/*
+ * struct vxd_return - contains information about items returning from core
+ *
+ * @type: Type of item being returned
+ * @buf_map_id: mmu mapped id of buffer being returned
+ */
+struct vxd_return {
+	void *work;
+	struct vxd_dec_ctx *ctx;
+	enum vxd_cb_type type;
+	unsigned int buf_map_id;
+};
+
+/*
+ * struct vxd_dec_q_data - contains queue data information
+ *
+ * @fmt: format info
+ * @width: frame width
+ * @height: frame height
+ * @bytesperline: bytes per line in memory
+ * @size_image: image size in memory
+ */
+struct vxd_dec_q_data {
+	struct vxd_dec_fmt *fmt;
+	unsigned int width;
+	unsigned int height;
+	unsigned int bytesperline[MAX_PLANES];
+	unsigned int size_image[MAX_PLANES];
+};
+
+/*
+ * struct time_prof - contains time taken by decoding information
+ *
+ * @id: id info
+ * @start_time: start time
+ * @end_time: end time
+ */
+struct time_prof {
+	unsigned int id;
+	long long start_time;
+	long long end_time;
+};
+
+/*
+ * struct vxd_dev - The struct containing decoder driver internal parameters.
+ *
+ * @v4l2_dev: main struct of V4L2 device drivers
+ * @dev: platform device driver
+ * @vfd_dec: video device structure to create and manage the V4L2 device node.
+ * @plat_dev: linux platform device
+ * @struct v4l2_m2m_dev: mem2mem device
+ * @mutex: mutex to protect certain ongoing operation.
+ * @module_irq: a threaded request IRQ for the device
+ * @reg_base: base address of the IMG VXD hw registers
+ * @props: contains HW properties
+ * @mmu_config_addr_width: indicates the number of extended address bits
+ *                         (above 32) that the external memory interface
+ *                         uses, based on EXTENDED_ADDR_RANGE field of
+ *                         MMU_CONFIG0
+ * @rendec_buf_id: buffer id for rendec buffer allocation
+ * @firmware: firmware information based on vxd_dev_fw structure
+ * @firmware_loading_complete: loading completion
+ * @no_fw: Just to check if firmware is present in /lib
+ * @fw_refcnt: firmware reference counter
+ * @hw_on: indication if hw is on or off
+ * @hw_dead: indication if hw is dead
+ * @lock: basic primitive for locking through spinlock
+ * @state: internal state handling of vxd state
+ * @msgs: linked list of msgs with vxd_item
+ * @pend: linked list of pending msgs to be sent to fw
+ * @msg_cnt: counter of messages submitted to VXD. Wraps every VXD_MSG_ID_MASK
+ * @freq_khz: Core clock frequency measured during boot of firmware
+ * @streams: unique id for the stream
+ * @mem_ctx: memory management context for HW buffers
+ * @dwork: use for Power Management and Watchdog
+ * @work_sched_at: the time of the last work has been scheduled at
+ * @emergency: indicates if emergency condition occurred
+ * @dbgfs_ctx: pointer to debug FS context.
+ * @hw_pm_delay: delay before performaing PM
+ * @hw_dwr_period: period for checking for dwr
+ * @pm_start: time, in jiffies, when core become idle
+ * @dwr_start: time, in jiffies, when dwr has been started
+ */
+struct vxd_dev {
+	struct v4l2_device v4l2_dev;
+	void *dev;
+	struct video_device *vfd_dec;
+	struct platform_device *plat_dev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct mutex  *mutex; /* Per device mutex */
+	int module_irq;
+	void __iomem *reg_base;
+	struct vxd_core_props props;
+	unsigned int mmu_config_addr_width;
+	int rendec_buf_id;
+	struct vxd_dev_fw firmware;
+	void *firmware_loading_complete;
+	unsigned char no_fw;
+	unsigned char fw_refcnt;
+	unsigned int hw_on;
+	unsigned int hw_dead;
+	void *lock; /* basic device level spinlock */
+	struct vxd_state state;
+	struct list_head msgs;
+	struct list_head pend;
+	int msg_cnt;
+	unsigned int freq_khz;
+	struct idr *streams;
+	struct mem_ctx *mem_ctx;
+	void *dwork;
+	unsigned long long work_sched_at;
+	unsigned int emergency;
+	void *dbgfs_ctx;
+	unsigned int hw_pm_delay;
+	unsigned int hw_dwr_period;
+	unsigned long long pm_start;
+	unsigned long long dwr_start;
+	struct time_prof time_fw[MAX_BUF_TRACE];
+	struct time_prof time_drv[MAX_BUF_TRACE];
+
+	/* The variables defined below are used in RTOS only. */
+	/* This variable holds queue handler */
+	void *vxd_worker_queue_handle;
+	void *vxd_worker_queue_sem_handle;
+};
+
+/*
+ * struct vxd_stream - holds stream-related info
+ *
+ * @ctx: associated vxd_dec_ctx
+ * @mmu_ctx: MMU context for this stream
+ * @ptd: ptd for the stream
+ * @id: unique stream id
+ */
+struct vxd_stream {
+	struct vxd_dec_ctx *ctx;
+	struct mmu_ctx *mmu_ctx;
+	unsigned int ptd;
+	unsigned int id;
+};
+
+/*
+ * struct vxd_buffer - holds per buffer info.
+ * @buffer: the vb2_v4l2_buffer
+ * @list: list head for gathering in linked list
+ * @mapped: is this buffer mapped yet
+ * @reuse: is the buffer ready for reuse
+ * @buf_map_id: the mapped buffer id
+ * @buf_info: the buffer info for submitting to map
+ * @bstr_info: the buffer info for submitting to bspp
+ * @seq_unit: the str_unit for submitting sps
+ * @seq_unit: the str_unit for submitting pps and segments
+ * @seq_unit: the str_unit for submitting picture_end
+ */
+struct vxd_buffer {
+	struct v4l2_m2m_buffer buffer;
+	struct list_head list;
+	unsigned char mapped;
+	unsigned char reuse;
+	unsigned int buf_map_id;
+	struct vdec_buf_info buf_info;
+	struct bspp_ddbuf_info bstr_info;
+	struct vdecdd_str_unit seq_unit;
+	struct vdecdd_str_unit pic_unit;
+	struct vdecdd_str_unit end_unit;
+	struct bspp_preparsed_data preparsed_data;
+};
+
+typedef void (*decode_cb)(int res_str_id, unsigned int *msg, unsigned int msg_size,
+			  unsigned int msg_flags);
+
+/*
+ * struct vxd_dec_ctx - holds per stream data. Each playback has its own
+ *                      vxd_dec_ctx
+ *
+ * @fh: V4L2 file handler
+ * @dev: pointer to the device main information.
+ * @ctrl_hdl_dec: v4l2 custom control command for video decoder
+ * @mem_ctx: mem context for this stream
+ * @mmu_ctx: MMU context for this stream
+ * @ptd: page table information
+ * @items_done: linked list of items is ready
+ * @width: frame width
+ * @height: frame height
+ * @width_orig: original frame width (before padding)
+ * @height_orig: original frame height (before padding)
+ * @q_data: Queue data information of src[0] and dst[1]
+ * @stream: stream-related info
+ * @work: work queue for message handling
+ * @return_queue: list of resources returned from core
+ * @out_buffers: list of all output buffers
+ * @cap_buffers: list of all capture buffers except those in reuse_queue
+ * @reuse_queue: list of capture buffers waiting for core to signal reuse
+ * @res_str_id: Core stream id
+ * @stream_created: Core stream is created
+ * @stream_configured: Core stream is configured
+ * @opconfig_pending: Core opconfig is pending stream_create
+ * @src_streaming: V4L2 src stream is streaming
+ * @dst_streaming: V4L2 dst stream is streaming
+ * @core_streaming: core is streaming
+ * @aborting: signal job abort on next irq
+ * @str_opcfg: core output config
+ * @pict_bufcfg: core picture buffer config
+ * @bspp_context: BSPP Stream context handle
+ * @seg_list: list of bspp_bitstr_seg for submitting to BSPP
+ * @fw_sequ: BSPP sps resource
+ * @fw_pps: BSPP pps resource
+ * @cb: registered callback for incoming messages
+ * @mutex: mutex to protect context specific state machine
+ */
+struct vxd_dec_ctx {
+	struct v4l2_fh fh;
+	struct vxd_dev *dev;
+	struct mem_ctx *mem_ctx;
+	struct mmu_ctx *mmu_ctx;
+	unsigned int ptd;
+	struct list_head items_done;
+	unsigned int width;
+	unsigned int height;
+	unsigned int width_orig;
+	unsigned int height_orig;
+	struct vxd_dec_q_data q_data[2];
+	struct vxd_stream stream;
+	void *work;
+	struct list_head return_queue;
+	struct list_head out_buffers;
+	struct list_head cap_buffers;
+	struct list_head reuse_queue;
+	unsigned int res_str_id;
+	unsigned char stream_created;
+	unsigned char stream_configured;
+	unsigned char opconfig_pending;
+	unsigned char src_streaming;
+	unsigned char dst_streaming;
+	unsigned char core_streaming;
+	unsigned char aborting;
+	unsigned char eos;
+	unsigned char stop_initiated;
+	unsigned char flag_last;
+	unsigned char num_decoding;
+	unsigned int max_num_ref_frames;
+	struct vdec_str_opconfig str_opcfg;
+	struct vdec_pict_bufconfig pict_bufcfg;
+	void *bspp_context;
+	struct bspp_bitstr_seg bstr_segments[MAX_SEGMENTS];
+	struct lst_t seg_list;
+	struct bspp_ddbuf_array_info fw_sequ[MAX_SEQUENCES];
+	struct bspp_ddbuf_array_info fw_pps[MAX_PPSS];
+	decode_cb cb;
+	struct mutex *mutex; /* Per stream mutex */
+
+	/* The below variable used only in Rtos */
+	void *mm_return_resource; /* Place holder for CB to application */
+	void *stream_worker_queue_handle;
+	void *stream_worker_queue_sem_handle;
+	// lock is used to synchronize the stream worker and process function
+	void *lock;
+	/* "sem_eos" this semaphore variable used to wait until all frame decoded */
+	void *sem_eos;
+};
+
+irqreturn_t vxd_handle_irq(void *dev);
+irqreturn_t vxd_handle_thread_irq(void *dev);
+int vxd_init(void *dev, struct vxd_dev *vxd, const struct heap_config heap_configs[], int heaps);
+int vxd_g_internal_heap_id(void);
+void vxd_deinit(struct vxd_dev *vxd);
+int vxd_prepare_fw(struct vxd_dev *vxd);
+void vxd_clean_fw_resources(struct vxd_dev *vxd);
+int vxd_send_msg(struct vxd_dec_ctx *ctx, struct vxd_fw_msg *msg);
+int vxd_suspend_dev(void *dev);
+int vxd_resume_dev(void *dev);
+
+int vxd_create_ctx(struct vxd_dev *vxd, struct vxd_dec_ctx *ctx);
+void vxd_destroy_ctx(struct vxd_dev *vxd, struct vxd_dec_ctx *ctx);
+
+int vxd_map_buffer_sg(struct vxd_dev *vxd, struct vxd_dec_ctx *ctx,
+		      unsigned int str_id, unsigned int buff_id,
+		      void *sgt, unsigned int virt_addr,
+		      unsigned int map_flags);
+int vxd_map_buffer(struct vxd_dev *vxd, struct vxd_dec_ctx *ctx, unsigned int str_id,
+		   unsigned int buff_id, unsigned int virt_addr, unsigned int map_flags);
+int vxd_unmap_buffer(struct vxd_dev *vxd, struct vxd_dec_ctx *ctx,
+		     unsigned int str_id, unsigned int buff_id);
+
+unsigned int get_nbuffers(enum vdec_vid_std std, int w, int h, unsigned int max_num_ref_frames);
+
+int vxd_dec_alloc_bspp_resource(struct vxd_dec_ctx *ctx, enum vdec_vid_std vid_std);
+
+#ifdef ERROR_RECOVERY_SIMULATION
+/* sysfs read write functions */
+ssize_t vxd_sysfs_show(struct kobject *vxd_dec_kobject,
+		       struct kobj_attribute *attr, char *buf);
+
+ssize_t vxd_sysfs_store(struct kobject *vxd_dec_kobject,
+			struct kobj_attribute *attr, const char *buf, unsigned long count);
+#endif
+#endif /* _VXD_DEC_H */
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
