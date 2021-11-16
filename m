Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52AA14530A7
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235100AbhKPLcf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:32:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:34674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235069AbhKPLcF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4750061AFB;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=Zcn0lorPhD1nGfWcWDn4BsD5KKGqFJadzR63ofX4/RU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fAuNZOO2A+3tm/AdTDlJZ/D9eUYGmPpycydwI55isFoLvla0rkRHcP2L+kP7SlEvB
         ZUIYjcv0mci5zDCefvRZwsJMPhhgQEupoLDdqJgZ6t3B2/9MqKds/vRDRWnC1+bk2d
         YvYOzHocBCQe7WKtP2FNS18xnhURMXZYupFZp02mqyL6BPnMHT56SY41bu1lbBBiqm
         wGgNAchWGgbARGwA7ECKnZy2MLB/2aRw/G1VVmZrMyJ673QICwtpLkgAU+ArCzl8cM
         979nFsR1PU1Snp3EGhD0RU6EQK26DQumep6SORDRA56XOMN8Wiu81MnKtOy0D41skr
         j5eb1C2/fHspw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qfd-HY; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 11/23] media: atomisp: drop #ifdef WITH_PC_MONITORING
Date:   Tue, 16 Nov 2021 11:28:52 +0000
Message-Id: <e50ea6f43767258f4ecedf7100f97331a1eb0069.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is not needed for the driver to work. So, just drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c | 118 ---------------------
 1 file changed, 118 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6d3c4a0558e1..c3f08c69f36d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -74,15 +74,6 @@
 
 #define SH_CSS_VIDEO_BUFFER_ALIGNMENT 0
 
-#if WITH_PC_MONITORING
-#define MULTIPLE_SAMPLES 1
-#define NOF_SAMPLES      60
-#include "linux/kthread.h"
-#include "linux/sched.h"
-#include "linux/delay.h"
-#include "sh_css_metrics.h"
-static int thread_alive;
-#endif /* WITH_PC_MONITORING */
 
 #include "ia_css_spctrl.h"
 #include "ia_css_version_data.h"
@@ -1261,89 +1252,6 @@ static inline int stream_unregister_with_csi_rx(
 }
 #endif
 
-#if WITH_PC_MONITORING
-static struct task_struct *my_kthread;    /* Handle for the monitoring thread */
-static int sh_binary_running;         /* Enable sampling in the thread */
-
-static void print_pc_histo(char *core_name, struct sh_css_pc_histogram *hist)
-{
-	unsigned int i;
-	unsigned int cnt_run = 0;
-	unsigned int cnt_stall = 0;
-
-	if (!hist)
-		return;
-
-	sh_css_print("%s histogram length = %d\n", core_name, hist->length);
-	sh_css_print("%s PC\turn\tstall\n", core_name);
-
-	for (i = 0; i < hist->length; i++) {
-		if ((hist->run[i] == 0) && (hist->run[i] == hist->stall[i]))
-			continue;
-		sh_css_print("%s %d\t%d\t%d\n",
-			     core_name, i, hist->run[i], hist->stall[i]);
-		cnt_run += hist->run[i];
-		cnt_stall += hist->stall[i];
-	}
-
-	sh_css_print(" Statistics for %s, cnt_run = %d, cnt_stall = %d, hist->length = %d\n",
-		     core_name, cnt_run, cnt_stall, hist->length);
-}
-
-static void print_pc_histogram(void)
-{
-	struct ia_css_binary_metrics *metrics;
-
-	for (metrics = sh_css_metrics.binary_metrics;
-	     metrics;
-	     metrics = metrics->next) {
-		if (metrics->mode == IA_CSS_BINARY_MODE_PREVIEW ||
-		    metrics->mode == IA_CSS_BINARY_MODE_VF_PP) {
-			sh_css_print("pc_histogram for binary %d is SKIPPED\n",
-				     metrics->id);
-			continue;
-		}
-
-		sh_css_print(" pc_histogram for binary %d\n", metrics->id);
-		print_pc_histo("  ISP", &metrics->isp_histogram);
-		print_pc_histo("  SP",   &metrics->sp_histogram);
-		sh_css_print("print_pc_histogram() done for binary->id = %d, done.\n",
-			     metrics->id);
-	}
-
-	sh_css_print("PC_MONITORING:print_pc_histogram() -- DONE\n");
-}
-
-static int pc_monitoring(void *data)
-{
-	int i = 0;
-
-	(void)data;
-	while (true) {
-		if (sh_binary_running) {
-			sh_css_metrics_sample_pcs();
-#if MULTIPLE_SAMPLES
-			for (i = 0; i < NOF_SAMPLES; i++)
-				sh_css_metrics_sample_pcs();
-#endif
-		}
-		usleep_range(10, 50);
-	}
-	return 0;
-}
-
-static void spying_thread_create(void)
-{
-	my_kthread = kthread_run(pc_monitoring, NULL, "sh_pc_monitor");
-	sh_css_metrics_enable_pc_histogram(1);
-}
-
-static void input_frame_info(struct ia_css_frame_info frame_info)
-{
-	sh_css_print("SH_CSS:input_frame_info() -- frame->info.res.width = %d, frame->info.res.height = %d, format = %d\n",
-		     frame_info.res.width, frame_info.res.height, frame_info.format);
-}
-#endif /* WITH_PC_MONITORING */
 
 static void
 start_binary(struct ia_css_pipe *pipe,
@@ -1355,15 +1263,6 @@ start_binary(struct ia_css_pipe *pipe,
 	if (binary)
 		sh_css_metrics_start_binary(&binary->metrics);
 
-#if WITH_PC_MONITORING
-	sh_css_print("PC_MONITORING: %s() -- binary id = %d , enable_dvs_envelope = %d\n",
-		     __func__, binary->info->sp.id,
-		     binary->info->sp.enable.dvs_envelope);
-	input_frame_info(binary->in_frame_info);
-
-	if (binary && binary->info->sp.pipeline.mode == IA_CSS_BINARY_MODE_VIDEO)
-		sh_binary_running = true;
-#endif
 
 #if !defined(ISP2401)
 	if (pipe->stream->reconfigure_css_rx) {
@@ -1754,14 +1653,6 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 		return err;
 	}
 
-#if WITH_PC_MONITORING
-	if (!thread_alive) {
-		thread_alive++;
-		sh_css_print("PC_MONITORING: %s() -- create thread DISABLED\n",
-			     __func__);
-		spying_thread_create();
-	}
-#endif
 	if (!sh_css_hrt_system_is_idle()) {
 		IA_CSS_LEAVE_ERR(-EBUSY);
 		return -EBUSY;
@@ -2427,10 +2318,6 @@ void
 ia_css_uninit(void)
 {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_uninit() enter: void\n");
-#if WITH_PC_MONITORING
-	sh_css_print("PC_MONITORING: %s() -- started\n", __func__);
-	print_pc_histogram();
-#endif
 
 	sh_css_params_free_default_gdc_lut();
 
@@ -2479,11 +2366,6 @@ int ia_css_irq_translate(
 		if (status == hrt_isp_css_irq_status_error)
 			return -EINVAL;
 
-#if WITH_PC_MONITORING
-		sh_css_print("PC_MONITORING: %s() irq = %d, sh_binary_running set to 0\n",
-			     __func__, irq);
-		sh_binary_running = 0;
-#endif
 
 		switch (irq) {
 		case virq_sp:
-- 
2.33.1

