Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD7135FF0A
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 02:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhDOAte (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 20:49:34 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49361 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhDOAtd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 20:49:33 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A3B6120007;
        Thu, 15 Apr 2021 00:49:09 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: [2/6] Fix sh_css.c brace coding style issues
Date:   Wed, 14 Apr 2021 20:50:59 -0400
Message-Id: <20210415005106.530914-3-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415005106.530914-1-vrzh@vrzh.net>
References: <20210415005106.530914-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix brace coding style issues.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 42 +++++++++-------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 10b70dfc0528..7c93fe911d0d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1379,7 +1379,8 @@ start_binary(struct ia_css_pipe *pipe,
 /* start the copy function on the SP */
 static int
 start_copy_on_sp(struct ia_css_pipe *pipe,
-		 struct ia_css_frame *out_frame) {
+		 struct ia_css_frame *out_frame)
+{
 	(void)out_frame;
 	assert(pipe);
 	assert(pipe->stream);
@@ -1397,8 +1398,7 @@ start_copy_on_sp(struct ia_css_pipe *pipe,
 	sh_css_sp_start_binary_copy(ia_css_pipe_get_pipe_num(pipe), out_frame, pipe->stream->config.pixels_per_clock == 2);
 
 #if !defined(ISP2401)
-	if (pipe->stream->reconfigure_css_rx)
-	{
+	if (pipe->stream->reconfigure_css_rx) {
 		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
 					 pipe->stream->config.mode);
 		pipe->stream->reconfigure_css_rx = false;
@@ -1587,7 +1587,8 @@ ia_css_reset_defaults(struct sh_css *css)
 
 int
 ia_css_load_firmware(struct device *dev, const struct ia_css_env *env,
-		     const struct ia_css_fw  *fw) {
+		     const struct ia_css_fw  *fw)
+{
 	int err;
 
 	if (!env)
@@ -1598,16 +1599,14 @@ ia_css_load_firmware(struct device *dev, const struct ia_css_env *env,
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_load_firmware() enter\n");
 
 	/* make sure we initialize my_css */
-	if (my_css.flush != env->cpu_mem_env.flush)
-	{
+	if (my_css.flush != env->cpu_mem_env.flush) {
 		ia_css_reset_defaults(&my_css);
 		my_css.flush = env->cpu_mem_env.flush;
 	}
 
 	ia_css_unload_firmware(); /* in case we are called twice */
 	err = sh_css_load_firmware(dev, fw->data, fw->bytes);
-	if (!err)
-	{
+	if (!err) {
 		err = ia_css_binary_init_infos();
 		if (!err)
 			fw_explicitly_loaded = true;
@@ -1621,7 +1620,8 @@ int
 ia_css_init(struct device *dev, const struct ia_css_env *env,
 	    const struct ia_css_fw  *fw,
 	    u32                 mmu_l1_base,
-	    enum ia_css_irq_type     irq_type) {
+	    enum ia_css_irq_type     irq_type)
+{
 	int err;
 	ia_css_spctrl_cfg spctrl_cfg;
 
@@ -1695,16 +1695,14 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 	my_css.flush     = flush_func;
 
 	err = ia_css_rmgr_init();
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR(err);
 		return err;
 	}
 
 	IA_CSS_LOG("init: %d", my_css_save_initialized);
 
-	if (!my_css_save_initialized)
-	{
+	if (!my_css_save_initialized) {
 		my_css_save_initialized = true;
 		my_css_save.mode = sh_css_mode_working;
 		memset(my_css_save.stream_seeds, 0,
@@ -1732,19 +1730,16 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 	gpio_reg_store(GPIO0_ID, _gpio_block_reg_do_0, 0);
 
 	err = ia_css_refcount_init(REFCOUNT_SIZE);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR(err);
 		return err;
 	}
 	err = sh_css_params_init();
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR(err);
 		return err;
 	}
-	if (fw)
-	{
+	if (fw) {
 		ia_css_unload_firmware(); /* in case we already had firmware loaded */
 		err = sh_css_load_firmware(dev, fw->data, fw->bytes);
 		if (err) {
@@ -1765,23 +1760,20 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 		return -EINVAL;
 
 	err = ia_css_spctrl_load_fw(SP0_ID, &spctrl_cfg);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR(err);
 		return err;
 	}
 
 #if WITH_PC_MONITORING
-	if (!thread_alive)
-	{
+	if (!thread_alive) {
 		thread_alive++;
 		sh_css_print("PC_MONITORING: %s() -- create thread DISABLED\n",
 			     __func__);
 		spying_thread_create();
 	}
 #endif
-	if (!sh_css_hrt_system_is_idle())
-	{
+	if (!sh_css_hrt_system_is_idle()) {
 		IA_CSS_LEAVE_ERR(-EBUSY);
 		return -EBUSY;
 	}
-- 
2.31.1

