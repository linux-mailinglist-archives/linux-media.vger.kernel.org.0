Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551774530C8
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235073AbhKPLeG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:34:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:35186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235197AbhKPLco (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5B9363248;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=vC+9N73bdu15KCUOSIhytPGGzFvQfFN+qjq3sSHnCvs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VKy5LR+VJNrgIeUjI93YMdDE37RtDuH7zKItqNc6TroucgJmLmfdyk4UEmaQACecu
         nINhIfZw/hayXjMMPHwGuxcZpXQa1WOCbSFfxrpxWzAa8UCvEcwb35e7ZY33Pq73FP
         b36gE+7KWK2a7C2T1hKRZ1efc5zqYyk1IIRdPACKeSqMt1Z5n8t3sDxqLzbSE9iIKV
         Sgrj3z/gpV1p+at+8aCGwvcpZCVsm9jV+YCmtiJoWbG4kjkj9vZPgvFnVcAmMRGdxn
         59Trlre6TEFcHgawDXrHSELpYR9IxOVae9XMjNz4YGMoN6jn+zf1WYgIa4dMrf9yaB
         6DLh+ohh0oAYg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qf9-Ar; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Baokun Li <libaokun1@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 01/23] media: atomisp: get rid of phys event abstractions
Date:   Tue, 16 Nov 2021 11:28:42 +0000
Message-Id: <377414f7f63dd4f5f247da9cf1f20c729b026159.1637061474.git.mchehab+huawei@kernel.org>
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

ia_css_dequeue_event() is just an alias to ia_css_dequeue_psys_event(),
and atomisp_css_dequeue_event() do nothing but calling the event
dequeue logic.

Get rid of both abstractions, calling the function directly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/atomisp_cmd.c |  2 +-
 .../staging/media/atomisp/pci/atomisp_compat.h  |  2 --
 .../media/atomisp/pci/atomisp_compat_css20.c    | 10 +---------
 .../media/atomisp/pci/ia_css_event_public.h     | 17 +----------------
 drivers/staging/media/atomisp/pci/sh_css.c      |  6 ------
 5 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 72c61c732d53..4783590969b6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1881,7 +1881,7 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 	/*
 	 * The standard CSS2.0 API tells the following calling sequence of
 	 * dequeue ready buffers:
-	 * while (ia_css_dequeue_event(...)) {
+	 * while (ia_css_dequeue_psys_event(...)) {
 	 *	switch (event.type) {
 	 *	...
 	 *	ia_css_pipe_dequeue_buffer()
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index c16eaf3d126f..64c1bf0943e6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -133,8 +133,6 @@ void atomisp_css_get_dis_statistics(struct atomisp_sub_device *asd,
 				    struct atomisp_css_buffer *isp_css_buffer,
 				    struct ia_css_isp_dvs_statistics_map *dvs_map);
 
-int atomisp_css_dequeue_event(struct atomisp_css_event *current_event);
-
 void atomisp_css_temp_pipe_to_pipe_id(struct atomisp_sub_device *asd,
 				      struct atomisp_css_event *current_event);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index da177a8e78e3..7edee293b132 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1633,14 +1633,6 @@ void atomisp_css_get_dis_statistics(struct atomisp_sub_device *asd,
 	}
 }
 
-int atomisp_css_dequeue_event(struct atomisp_css_event *current_event)
-{
-	if (ia_css_dequeue_event(&current_event->event))
-		return -EINVAL;
-
-	return 0;
-}
-
 void atomisp_css_temp_pipe_to_pipe_id(struct atomisp_sub_device *asd,
 				      struct atomisp_css_event *current_event)
 {
@@ -4120,7 +4112,7 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 	bool reset_wdt_timer[MAX_STREAM_NUM] = {false};
 	int i;
 
-	while (!atomisp_css_dequeue_event(&current_event)) {
+	while (!ia_css_dequeue_psys_event(&current_event.event)) {
 		if (current_event.event.type ==
 		    IA_CSS_EVENT_TYPE_FW_ASSERT) {
 			/*
diff --git a/drivers/staging/media/atomisp/pci/ia_css_event_public.h b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
index 08ea801dd5ac..76219d741d2e 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_event_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
@@ -157,21 +157,6 @@ struct ia_css_event {
 int
 ia_css_dequeue_psys_event(struct ia_css_event *event);
 
-/* @brief Dequeue an event from the CSS system.
- *
- * @param[out]	event   Pointer to the event struct which will be filled by
- *                      this function if an event is available.
- * @return		-ENODATA if no events are
- *			available or
- *			0 otherwise.
- *
- * deprecated{Use ia_css_dequeue_psys_event instead}.
- * Unless the isys event queue is explicitly enabled, this function will
- * dequeue both isys (EOF) and psys events (all others).
- */
-int
-ia_css_dequeue_event(struct ia_css_event *event);
-
 /* @brief Dequeue an ISYS event from the CSS system.
  *
  * @param[out]	event   Pointer to the event struct which will be filled by
@@ -182,7 +167,7 @@ ia_css_dequeue_event(struct ia_css_event *event);
  *
  * This function dequeues an event from the ISYS event queue. The queue is
  * between host and the CSS system.
- * Unlike the ia_css_dequeue_event() function, this function can be called
+ * Unlike the ia_css_dequeue_psys_event() function, this function can be called
  * directly from an interrupt service routine (ISR) and it is safe to call
  * this function in parallel with other CSS API functions (but only one
  * call to this function should be in flight at any point in time).
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 79003077f390..c714c15c49d2 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4423,12 +4423,6 @@ static enum ia_css_event_type convert_event_sp_to_host_domain[] = {
 	0,					/* error if sp passes  SH_CSS_SP_EVENT_NR_OF_TYPES as a valid event. */
 };
 
-int
-ia_css_dequeue_event(struct ia_css_event *event)
-{
-	return ia_css_dequeue_psys_event(event);
-}
-
 int
 ia_css_dequeue_psys_event(struct ia_css_event *event)
 {
-- 
2.33.1

