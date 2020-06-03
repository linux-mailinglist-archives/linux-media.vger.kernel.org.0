Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32AC31ECA02
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgFCHBj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:01:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:43402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbgFCHBI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:08 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 802BF206E6;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=82rWhY70VDMp6r+w208SPFzpIRfRwkocD+byesNur7M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lXN/9JNk3vOobT+lUb5Pmbam4kwVpbyuZvYww4tA5Hmwq/SOjHBmEiKTznq7lcBVx
         rUgW3JYB0/MZgfO0mWl2W1n2wdf4jbBwg7+16E8bxlEIpp8KPaToJxyQO0xJLtYrmb
         o73ut3UERGeJ753MhZOwTMz2f/y2pCD2iYxkf+xE=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j88-50; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/15] media: atomisp: do some cleanup at irq_local.h
Date:   Wed,  3 Jun 2020 09:00:48 +0200
Message-Id: <4a452db7a606920d3a855322579accd8d21bda27.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Get rid of typedefs;
- Get rid of a duplicated enum type with different names for
  ISP2400 and ISP2401;
- adjust indentation on the touched code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../pci/hive_isp_css_common/host/irq.c        | 29 +++++++++----------
 .../pci/hive_isp_css_common/host/irq_local.h  | 17 +++--------
 .../hive_isp_css_include/host/irq_public.h    | 16 +++++-----
 .../pci/runtime/debug/src/ia_css_debug.c      |  2 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 10 +++----
 5 files changed, 30 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 8b72a40f9ad1..11448ca00a35 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -29,9 +29,8 @@ static inline void irq_wait_for_write_complete(
 static inline bool any_irq_channel_enabled(
     const irq_ID_t				ID);
 
-static inline irq_ID_t virq_get_irq_id(
-    const virq_id_t		irq_ID,
-    unsigned int		*channel_ID);
+static inline irq_ID_t virq_get_irq_id(const enum virq_id irq_ID,
+				       unsigned int *channel_ID);
 
 #ifndef __INLINE_IRQ__
 #include "irq_private.h"
@@ -52,7 +51,7 @@ static unsigned short IRQ_N_ID_OFFSET[N_IRQ_ID + 1] = {
 	IRQ_END_OFFSET
 };
 
-static virq_id_t IRQ_NESTING_ID[N_IRQ_ID] = {
+static enum virq_id IRQ_NESTING_ID[N_IRQ_ID] = {
 	N_virq_id,
 	virq_ifmt,
 	virq_isys,
@@ -228,9 +227,8 @@ void irq_raise(
 	return;
 }
 
-void irq_controller_get_state(
-    const irq_ID_t				ID,
-    irq_controller_state_t		*state)
+void irq_controller_get_state(const irq_ID_t ID,
+			      struct irq_controller_state *state)
 {
 	assert(ID < N_IRQ_ID);
 	assert(state);
@@ -257,7 +255,7 @@ bool any_virq_signal(void)
 }
 
 void cnd_virq_enable_channel(
-    const virq_id_t				irq_ID,
+    const enum virq_id				irq_ID,
     const bool					en)
 {
 	irq_ID_t		i;
@@ -297,8 +295,8 @@ void virq_clear_all(void)
 	return;
 }
 
-enum hrt_isp_css_irq_status virq_get_channel_signals(
-    virq_info_t					*irq_info)
+enum hrt_isp_css_irq_status
+virq_get_channel_signals(struct virq_info *irq_info)
 {
 	enum hrt_isp_css_irq_status irq_status = hrt_isp_css_irq_status_error;
 	irq_ID_t ID;
@@ -327,8 +325,7 @@ enum hrt_isp_css_irq_status virq_get_channel_signals(
 	return irq_status;
 }
 
-void virq_clear_info(
-    virq_info_t					*irq_info)
+void virq_clear_info(struct virq_info *irq_info)
 {
 	irq_ID_t ID;
 
@@ -341,7 +338,7 @@ void virq_clear_info(
 }
 
 enum hrt_isp_css_irq_status virq_get_channel_id(
-    virq_id_t					*irq_id)
+    enum virq_id					*irq_id)
 {
 	unsigned int irq_status = irq_reg_load(IRQ0_ID,
 					       _HRT_IRQ_CONTROLLER_STATUS_REG_IDX);
@@ -368,7 +365,7 @@ enum hrt_isp_css_irq_status virq_get_channel_id(
 
 	/* Check whether we have an IRQ on one of the nested devices */
 	for (ID = N_IRQ_ID - 1 ; ID > (irq_ID_t)0; ID--) {
-		if (IRQ_NESTING_ID[ID] == (virq_id_t)idx) {
+		if (IRQ_NESTING_ID[ID] == (enum virq_id)idx) {
 			break;
 		}
 	}
@@ -405,7 +402,7 @@ enum hrt_isp_css_irq_status virq_get_channel_id(
 
 	idx += IRQ_N_ID_OFFSET[ID];
 	if (irq_id)
-		*irq_id = (virq_id_t)idx;
+		*irq_id = (enum virq_id)idx;
 
 	return status;
 }
@@ -433,7 +430,7 @@ static inline bool any_irq_channel_enabled(
 }
 
 static inline irq_ID_t virq_get_irq_id(
-    const virq_id_t		irq_ID,
+    const enum virq_id		irq_ID,
     unsigned int		*channel_ID)
 {
 	irq_ID_t ID;
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.h
index 345d41c1d39f..6a25345ae88e 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq_local.h
@@ -43,10 +43,7 @@
 #define	IRQ2_ID_N_CHANNEL	HIVE_ISYS_IRQ_NUM_BITS
 #define	IRQ3_ID_N_CHANNEL	HIVE_ISEL_IRQ_NUM_IRQS
 
-typedef struct virq_info_s					virq_info_t;
-typedef struct irq_controller_state_s		irq_controller_state_t;
-
-typedef enum {
+enum virq_id {
 	virq_gpio_pin_0            = IRQ0_ID_OFFSET + HIVE_GP_DEV_IRQ_GPIO_PIN_0_BIT_ID,
 	virq_gpio_pin_1            = IRQ0_ID_OFFSET + HIVE_GP_DEV_IRQ_GPIO_PIN_1_BIT_ID,
 	virq_gpio_pin_2            = IRQ0_ID_OFFSET + HIVE_GP_DEV_IRQ_GPIO_PIN_2_BIT_ID,
@@ -67,13 +64,7 @@ typedef enum {
 	virq_sp_stream_mon         = IRQ0_ID_OFFSET + HIVE_GP_DEV_IRQ_SP_STREAM_MON_BIT_ID,
 	virq_isp_stream_mon        = IRQ0_ID_OFFSET + HIVE_GP_DEV_IRQ_ISP_STREAM_MON_BIT_ID,
 	virq_mod_stream_mon        = IRQ0_ID_OFFSET + HIVE_GP_DEV_IRQ_MOD_STREAM_MON_BIT_ID,
-#if defined(IS_ISP_2400_MAMOIADA_SYSTEM)
 	virq_isp_pmem_error        = IRQ0_ID_OFFSET + HIVE_GP_DEV_IRQ_ISP_PMEM_ERROR_BIT_ID,
-#elif defined(IS_ISP_2401_MAMOIADA_SYSTEM)
-	virq_isys_2401             = IRQ0_ID_OFFSET + HIVE_GP_DEV_IRQ_ISP_PMEM_ERROR_BIT_ID,
-#else
-#error "irq_local.h: 2400_SYSTEM must be one of {2400, 2401 }"
-#endif
 	virq_isp_bamem_error       = IRQ0_ID_OFFSET + HIVE_GP_DEV_IRQ_ISP_BAMEM_ERROR_BIT_ID,
 	virq_isp_dmem_error        = IRQ0_ID_OFFSET + HIVE_GP_DEV_IRQ_ISP_DMEM_ERROR_BIT_ID,
 	virq_sp_icache_mem_error   = IRQ0_ID_OFFSET + HIVE_GP_DEV_IRQ_SP_ICACHE_MEM_ERROR_BIT_ID,
@@ -118,13 +109,13 @@ typedef enum {
 	virq_isel_eol              = IRQ3_ID_OFFSET + HIVE_ISEL_IRQ_SYNC_GEN_EOL_BIT_ID,
 
 	N_virq_id                  = IRQ_END_OFFSET
-} virq_id_t;
+};
 
-struct virq_info_s {
+struct virq_info {
 	hrt_data		irq_status_reg[N_IRQ_ID];
 };
 
-struct irq_controller_state_s {
+struct irq_controller_state {
 	unsigned int	irq_edge;
 	unsigned int	irq_mask;
 	unsigned int	irq_status;
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
index bc3ad3dcf6d1..d335e7b0a76e 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
@@ -26,9 +26,8 @@
 
  \return none, state = IRQ[ID].state
  */
-void irq_controller_get_state(
-    const irq_ID_t				ID,
-    irq_controller_state_t		*state);
+void irq_controller_get_state(const irq_ID_t ID,
+			      struct irq_controller_state *state);
 
 /*! Write to a control register of IRQ[ID]
 
@@ -137,7 +136,7 @@ bool any_virq_signal(void);
  \return none, VIRQ.channel[irq_ID].enable = en
  */
 void cnd_virq_enable_channel(
-    const virq_id_t				irq_ID,
+    const enum virq_id				irq_ID,
     const bool					en);
 
 /*! Clear the state of all IRQ channels of the virtual super IRQ
@@ -152,8 +151,7 @@ void virq_clear_all(void);
 
  \return none
  */
-void virq_clear_info(
-    virq_info_t					*irq_info);
+void virq_clear_info(struct virq_info *irq_info);
 
 /*! Return the ID of a signalling IRQ channel of the virtual super IRQ
 
@@ -166,7 +164,7 @@ void virq_clear_info(
  \return state(IRQ[...])
  */
 enum hrt_isp_css_irq_status virq_get_channel_id(
-    virq_id_t					*irq_id);
+    enum virq_id					*irq_id);
 
 /*! Return the IDs of all signaling IRQ channels of the virtual super IRQ
 
@@ -179,7 +177,7 @@ enum hrt_isp_css_irq_status virq_get_channel_id(
 
  \return (error(state(IRQ[...]))
  */
-enum hrt_isp_css_irq_status virq_get_channel_signals(
-    virq_info_t					*irq_info);
+enum hrt_isp_css_irq_status
+virq_get_channel_signals(struct virq_info *irq_info);
 
 #endif /* __IRQ_PUBLIC_H_INCLUDED__ */
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index e367c5e0fc5a..49836016559f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -2228,7 +2228,7 @@ void ia_css_debug_dump_debug_info(const char *context)
 	ia_css_debug_dump_isys_state();
 
 	{
-		irq_controller_state_t state;
+		struct irq_controller_state state;
 
 		irq_controller_get_state(IRQ2_ID, &state);
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 9815c87ca6f3..a722b886b2f5 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1546,16 +1546,16 @@ enable_interrupts(enum ia_css_irq_type irq_type)
 
 	/* Enable SW interrupt 0, this is used to signal ISYS events */
 	cnd_virq_enable_channel(
-	    (virq_id_t)(IRQ_SW_CHANNEL0_ID + IRQ_SW_CHANNEL_OFFSET),
+	    (enum virq_id)(IRQ_SW_CHANNEL0_ID + IRQ_SW_CHANNEL_OFFSET),
 	    true);
 	/* Enable SW interrupt 1, this is used to signal PSYS events */
 	cnd_virq_enable_channel(
-	    (virq_id_t)(IRQ_SW_CHANNEL1_ID + IRQ_SW_CHANNEL_OFFSET),
+	    (enum virq_id)(IRQ_SW_CHANNEL1_ID + IRQ_SW_CHANNEL_OFFSET),
 	    true);
 #if !defined(HAS_IRQ_MAP_VERSION_2)
 	/* IRQ_SW_CHANNEL2_ID does not exist on 240x systems */
 	cnd_virq_enable_channel(
-	    (virq_id_t)(IRQ_SW_CHANNEL2_ID + IRQ_SW_CHANNEL_OFFSET),
+	    (enum virq_id)(IRQ_SW_CHANNEL2_ID + IRQ_SW_CHANNEL_OFFSET),
 	    true);
 	virq_clear_all();
 #endif
@@ -2549,7 +2549,7 @@ ia_css_uninit(void)
 int ia_css_irq_translate(
     unsigned int *irq_infos)
 {
-	virq_id_t	irq;
+	enum virq_id	irq;
 	enum hrt_isp_css_irq_status status = hrt_isp_css_irq_status_more_irqs;
 	unsigned int infos = 0;
 
@@ -2622,7 +2622,7 @@ int ia_css_irq_enable(
     enum ia_css_irq_info info,
     bool enable)
 {
-	virq_id_t	irq = N_virq_id;
+	enum virq_id	irq = N_virq_id;
 
 	IA_CSS_ENTER("info=%d, enable=%d", info, enable);
 
-- 
2.26.2

