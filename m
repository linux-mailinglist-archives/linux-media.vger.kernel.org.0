Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 849225B502B
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbiIKRRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiIKRRP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C2027CD1
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916632;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E1fcDaaneRFUpSsrsioXPGJsJpXdbZc50yfAXHTdrGo=;
        b=aYsBAhioKZyPr6kcZCJpEC7MSPExxwOBd6jD5WnoEv5OUG6fPbckmRtYYi0KjPuiMqm5NU
        cRprQmeXCYeD8hW+Y9t4bO6jZ+y3o4Xzlk06gAQaZftxFTvhRYWXkosBbanFUTCJ5glbxj
        nCv3Pj9jfhB+1/d7iKWSO1HpSzu8T7c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-I5qYZG6FOgWa2kLvZe9VuQ-1; Sun, 11 Sep 2022 13:17:08 -0400
X-MC-Unique: I5qYZG6FOgWa2kLvZe9VuQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DF6A1C05156;
        Sun, 11 Sep 2022 17:17:08 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7B24140334C;
        Sun, 11 Sep 2022 17:17:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 06/17] media: atomisp: Remove watchdog timer
Date:   Sun, 11 Sep 2022 19:16:42 +0200
Message-Id: <20220911171653.568932-7-hdegoede@redhat.com>
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The watchdog timer code to recover from the ISP getting stuck has several
major issues:

1. There is no way to do fault injection and normally the ISP does not
get stuck, so is it is impossible to test it.

2. It in essence just stops all streams, resets the ISP and then brings
everything back up. Userspace can easily do this itself by using a
timeout on dqbuf and then closing (which causes a poweroff) +
re-opening the device. Doing this in userspace (if it ever turns out
to be necessary) greatly simplifies the kernel code and in general
will be a more robust solution.

Even just a quick look at the code finds several more issues:

3. The need to sync-cancel the timers + work on streamoff requires
isp->mutex to be dropped halfway during the ioctl opening all sorts of
races.

4. The atomisp code supports setting up 2 pipelines, streaming from
two sensors at the same time. But there is only a single wdt_work
and stopping one of the 2 streams will cancel the timers + work,
stopping the wdt even though the other stream might still be running.

5. In case atomisp_css_flush() the sync cancel is done while keeping
isp->mutex locked, causing a deadlock when racing with wdt_work which
also takes isp->mutex.

6. Even though the watchdog is purely a software/driver thing which
just checkes that new frames keep coming in, there are 2 completely
different implementations for the ISP2400/ISP2401 which is not
necessary at all.

So all in all I believe that it is better to just remove the current
watchdog implementation. Fixing all the issues with the current
implementation will be so much work, that if it turns out that we do
need something like this then doing a clean re-implementation from
scratch will be better anyways.

wdt_work was also (ab)used to reset the ISP after the firmware signalled
an fw-assert error through the irq, add a new assert_recover_work to
replace this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 361 +-----------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   3 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  |  43 +--
 .../media/atomisp/pci/atomisp_internal.h      |  24 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  60 ---
 .../media/atomisp/pci/atomisp_subdev.h        |  14 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  43 +--
 7 files changed, 9 insertions(+), 539 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 7945852ecd13..4b459c4c6d76 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -897,7 +897,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 	enum atomisp_metadata_type md_type;
 	struct atomisp_device *isp = asd->isp;
 	struct v4l2_control ctrl;
-	bool reset_wdt_timer = false;
 
 	lockdep_assert_held(&isp->mutex);
 
@@ -1006,9 +1005,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		break;
 	case IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME:
 	case IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME:
-		if (IS_ISP2401)
-			reset_wdt_timer = true;
-
 		pipe->buffers_in_css--;
 		frame = buffer.css_buffer.data.frame;
 		if (!frame) {
@@ -1061,9 +1057,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		break;
 	case IA_CSS_BUFFER_TYPE_OUTPUT_FRAME:
 	case IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME:
-		if (IS_ISP2401)
-			reset_wdt_timer = true;
-
 		pipe->buffers_in_css--;
 		frame = buffer.css_buffer.data.frame;
 		if (!frame) {
@@ -1231,8 +1224,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		 */
 		wake_up(&vb->done);
 	}
-	if (IS_ISP2401)
-		atomic_set(&pipe->wdt_count, 0);
 
 	/*
 	 * Requeue should only be done for 3a and dis buffers.
@@ -1249,19 +1240,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 	}
 	if (!error && q_buffers)
 		atomisp_qbuffers_to_css(asd);
-
-	if (IS_ISP2401) {
-		/* If there are no buffers queued then
-		* delete wdt timer. */
-		if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
-			return;
-		if (!atomisp_buffers_queued_pipe(pipe))
-			atomisp_wdt_stop_pipe(pipe, false);
-		else if (reset_wdt_timer)
-			/* SOF irq should not reset wdt timer. */
-			atomisp_wdt_refresh_pipe(pipe,
-						ATOMISP_WDT_KEEP_CURRENT_DELAY);
-	}
 }
 
 void atomisp_delayed_init_work(struct work_struct *work)
@@ -1450,350 +1428,32 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 	}
 }
 
-void atomisp_wdt_work(struct work_struct *work)
+void atomisp_assert_recovery_work(struct work_struct *work)
 {
 	struct atomisp_device *isp = container_of(work, struct atomisp_device,
-				     wdt_work);
-	int i;
-	unsigned int pipe_wdt_cnt[MAX_STREAM_NUM][4] = { {0} };
-	bool css_recover = true;
+						  assert_recovery_work);
 
 	mutex_lock(&isp->mutex);
-	if (!atomisp_streaming_count(isp)) {
-		atomic_set(&isp->wdt_work_queued, 0);
-		mutex_unlock(&isp->mutex);
-		return;
-	}
-
-	if (!IS_ISP2401) {
-		dev_err(isp->dev, "timeout %d of %d\n",
-			atomic_read(&isp->wdt_count) + 1,
-			ATOMISP_ISP_MAX_TIMEOUT_COUNT);
-	} else {
-		for (i = 0; i < isp->num_of_streams; i++) {
-			struct atomisp_sub_device *asd = &isp->asd[i];
-
-			pipe_wdt_cnt[i][0] +=
-			    atomic_read(&asd->video_out_capture.wdt_count);
-			pipe_wdt_cnt[i][1] +=
-			    atomic_read(&asd->video_out_vf.wdt_count);
-			pipe_wdt_cnt[i][2] +=
-			    atomic_read(&asd->video_out_preview.wdt_count);
-			pipe_wdt_cnt[i][3] +=
-			    atomic_read(&asd->video_out_video_capture.wdt_count);
-			css_recover =
-			    (pipe_wdt_cnt[i][0] <= ATOMISP_ISP_MAX_TIMEOUT_COUNT &&
-			    pipe_wdt_cnt[i][1] <= ATOMISP_ISP_MAX_TIMEOUT_COUNT &&
-			    pipe_wdt_cnt[i][2] <= ATOMISP_ISP_MAX_TIMEOUT_COUNT &&
-			    pipe_wdt_cnt[i][3] <= ATOMISP_ISP_MAX_TIMEOUT_COUNT)
-			    ? true : false;
-			dev_err(isp->dev,
-				"pipe on asd%d timeout cnt: (%d, %d, %d, %d) of %d, recover = %d\n",
-				asd->index, pipe_wdt_cnt[i][0], pipe_wdt_cnt[i][1],
-				pipe_wdt_cnt[i][2], pipe_wdt_cnt[i][3],
-				ATOMISP_ISP_MAX_TIMEOUT_COUNT, css_recover);
-		}
-	}
-
-	if (css_recover) {
-		ia_css_debug_dump_sp_sw_debug_info();
-		ia_css_debug_dump_debug_info(__func__);
-		for (i = 0; i < isp->num_of_streams; i++) {
-			struct atomisp_sub_device *asd = &isp->asd[i];
-
-			if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
-				continue;
-			dev_err(isp->dev, "%s, vdev %s buffers in css: %d\n",
-				__func__,
-				asd->video_out_capture.vdev.name,
-				asd->video_out_capture.
-				buffers_in_css);
-			dev_err(isp->dev,
-				"%s, vdev %s buffers in css: %d\n",
-				__func__,
-				asd->video_out_vf.vdev.name,
-				asd->video_out_vf.
-				buffers_in_css);
-			dev_err(isp->dev,
-				"%s, vdev %s buffers in css: %d\n",
-				__func__,
-				asd->video_out_preview.vdev.name,
-				asd->video_out_preview.
-				buffers_in_css);
-			dev_err(isp->dev,
-				"%s, vdev %s buffers in css: %d\n",
-				__func__,
-				asd->video_out_video_capture.vdev.name,
-				asd->video_out_video_capture.
-				buffers_in_css);
-			dev_err(isp->dev,
-				"%s, s3a buffers in css preview pipe:%d\n",
-				__func__,
-				asd->s3a_bufs_in_css[IA_CSS_PIPE_ID_PREVIEW]);
-			dev_err(isp->dev,
-				"%s, s3a buffers in css capture pipe:%d\n",
-				__func__,
-				asd->s3a_bufs_in_css[IA_CSS_PIPE_ID_CAPTURE]);
-			dev_err(isp->dev,
-				"%s, s3a buffers in css video pipe:%d\n",
-				__func__,
-				asd->s3a_bufs_in_css[IA_CSS_PIPE_ID_VIDEO]);
-			dev_err(isp->dev,
-				"%s, dis buffers in css: %d\n",
-				__func__, asd->dis_bufs_in_css);
-			dev_err(isp->dev,
-				"%s, metadata buffers in css preview pipe:%d\n",
-				__func__,
-				asd->metadata_bufs_in_css
-				[ATOMISP_INPUT_STREAM_GENERAL]
-				[IA_CSS_PIPE_ID_PREVIEW]);
-			dev_err(isp->dev,
-				"%s, metadata buffers in css capture pipe:%d\n",
-				__func__,
-				asd->metadata_bufs_in_css
-				[ATOMISP_INPUT_STREAM_GENERAL]
-				[IA_CSS_PIPE_ID_CAPTURE]);
-			dev_err(isp->dev,
-				"%s, metadata buffers in css video pipe:%d\n",
-				__func__,
-				asd->metadata_bufs_in_css
-				[ATOMISP_INPUT_STREAM_GENERAL]
-				[IA_CSS_PIPE_ID_VIDEO]);
-			if (asd->enable_raw_buffer_lock->val) {
-				unsigned int j;
-
-				dev_err(isp->dev, "%s, raw_buffer_locked_count %d\n",
-					__func__, asd->raw_buffer_locked_count);
-				for (j = 0; j <= ATOMISP_MAX_EXP_ID / 32; j++)
-					dev_err(isp->dev, "%s, raw_buffer_bitmap[%d]: 0x%x\n",
-						__func__, j,
-						asd->raw_buffer_bitmap[j]);
-			}
-		}
 
-		/*sh_css_dump_sp_state();*/
-		/*sh_css_dump_isp_state();*/
-	} else {
-		for (i = 0; i < isp->num_of_streams; i++) {
-			struct atomisp_sub_device *asd = &isp->asd[i];
-
-			if (asd->streaming ==
-			    ATOMISP_DEVICE_STREAMING_ENABLED) {
-				atomisp_clear_css_buffer_counters(asd);
-				atomisp_flush_bufs_and_wakeup(asd);
-				complete(&asd->init_done);
-			}
-			if (IS_ISP2401)
-				atomisp_wdt_stop(asd, false);
-		}
-
-		if (!IS_ISP2401) {
-			atomic_set(&isp->wdt_count, 0);
-		} else {
-			isp->isp_fatal_error = true;
-			atomic_set(&isp->wdt_work_queued, 0);
-
-			mutex_unlock(&isp->mutex);
-			return;
-		}
-	}
-
-	__atomisp_css_recover(isp, true);
-	if (IS_ISP2401) {
-		for (i = 0; i < isp->num_of_streams; i++) {
-			struct atomisp_sub_device *asd = &isp->asd[i];
-
-			if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
-				continue;
-
-			atomisp_wdt_refresh(asd, ATOMISP_ISP_TIMEOUT_DURATION);
-		}
-	}
-
-	dev_err(isp->dev, "timeout recovery handling done\n");
-	atomic_set(&isp->wdt_work_queued, 0);
+	if (atomisp_streaming_count(isp))
+		__atomisp_css_recover(isp, true);
 
 	mutex_unlock(&isp->mutex);
 }
 
 void atomisp_css_flush(struct atomisp_device *isp)
 {
-	int i;
-
 	lockdep_assert_held(&isp->mutex);
 
 	if (!atomisp_streaming_count(isp))
 		return;
 
-	/* Disable wdt */
-	for (i = 0; i < isp->num_of_streams; i++) {
-		struct atomisp_sub_device *asd = &isp->asd[i];
-
-		atomisp_wdt_stop(asd, true);
-	}
-
 	/* Start recover */
 	__atomisp_css_recover(isp, false);
-	/* Restore wdt */
-	for (i = 0; i < isp->num_of_streams; i++) {
-		struct atomisp_sub_device *asd = &isp->asd[i];
-
-		if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
-			continue;
 
-		atomisp_wdt_refresh(asd, ATOMISP_ISP_TIMEOUT_DURATION);
-	}
 	dev_dbg(isp->dev, "atomisp css flush done\n");
 }
 
-void atomisp_wdt(struct timer_list *t)
-{
-	struct atomisp_sub_device *asd;
-	struct atomisp_device *isp;
-
-	if (!IS_ISP2401) {
-		asd = from_timer(asd, t, wdt);
-		isp = asd->isp;
-	} else {
-		struct atomisp_video_pipe *pipe = from_timer(pipe, t, wdt);
-
-		asd = pipe->asd;
-		isp = asd->isp;
-
-		atomic_inc(&pipe->wdt_count);
-		dev_warn(isp->dev,
-			"[WARNING]asd %d pipe %s ISP timeout %d!\n",
-			asd->index, pipe->vdev.name,
-			atomic_read(&pipe->wdt_count));
-	}
-
-	if (atomic_read(&isp->wdt_work_queued)) {
-		dev_dbg(isp->dev, "ISP watchdog was put into workqueue\n");
-		return;
-	}
-	atomic_set(&isp->wdt_work_queued, 1);
-	queue_work(isp->wdt_work_queue, &isp->wdt_work);
-}
-
-/* ISP2400 */
-void atomisp_wdt_start(struct atomisp_sub_device *asd)
-{
-	atomisp_wdt_refresh(asd, ATOMISP_ISP_TIMEOUT_DURATION);
-}
-
-/* ISP2401 */
-void atomisp_wdt_refresh_pipe(struct atomisp_video_pipe *pipe,
-			      unsigned int delay)
-{
-	unsigned long next;
-
-	if (!pipe->asd) {
-		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, pipe->vdev.name);
-		return;
-	}
-
-	if (delay != ATOMISP_WDT_KEEP_CURRENT_DELAY)
-		pipe->wdt_duration = delay;
-
-	next = jiffies + pipe->wdt_duration;
-
-	/* Override next if it has been pushed beyon the "next" time */
-	if (atomisp_is_wdt_running(pipe) && time_after(pipe->wdt_expires, next))
-		next = pipe->wdt_expires;
-
-	pipe->wdt_expires = next;
-
-	if (atomisp_is_wdt_running(pipe))
-		dev_dbg(pipe->asd->isp->dev, "WDT will hit after %d ms (%s)\n",
-			((int)(next - jiffies) * 1000 / HZ), pipe->vdev.name);
-	else
-		dev_dbg(pipe->asd->isp->dev, "WDT starts with %d ms period (%s)\n",
-			((int)(next - jiffies) * 1000 / HZ), pipe->vdev.name);
-
-	mod_timer(&pipe->wdt, next);
-}
-
-void atomisp_wdt_refresh(struct atomisp_sub_device *asd, unsigned int delay)
-{
-	if (!IS_ISP2401) {
-		unsigned long next;
-
-		if (delay != ATOMISP_WDT_KEEP_CURRENT_DELAY)
-			asd->wdt_duration = delay;
-
-		next = jiffies + asd->wdt_duration;
-
-		/* Override next if it has been pushed beyon the "next" time */
-		if (atomisp_is_wdt_running(asd) && time_after(asd->wdt_expires, next))
-			next = asd->wdt_expires;
-
-		asd->wdt_expires = next;
-
-		if (atomisp_is_wdt_running(asd))
-			dev_dbg(asd->isp->dev, "WDT will hit after %d ms\n",
-				((int)(next - jiffies) * 1000 / HZ));
-		else
-			dev_dbg(asd->isp->dev, "WDT starts with %d ms period\n",
-				((int)(next - jiffies) * 1000 / HZ));
-
-		mod_timer(&asd->wdt, next);
-		atomic_set(&asd->isp->wdt_count, 0);
-	} else {
-		dev_dbg(asd->isp->dev, "WDT refresh all:\n");
-		if (atomisp_is_wdt_running(&asd->video_out_capture))
-			atomisp_wdt_refresh_pipe(&asd->video_out_capture, delay);
-		if (atomisp_is_wdt_running(&asd->video_out_preview))
-			atomisp_wdt_refresh_pipe(&asd->video_out_preview, delay);
-		if (atomisp_is_wdt_running(&asd->video_out_vf))
-			atomisp_wdt_refresh_pipe(&asd->video_out_vf, delay);
-		if (atomisp_is_wdt_running(&asd->video_out_video_capture))
-			atomisp_wdt_refresh_pipe(&asd->video_out_video_capture, delay);
-	}
-}
-
-/* ISP2401 */
-void atomisp_wdt_stop_pipe(struct atomisp_video_pipe *pipe, bool sync)
-{
-	if (!atomisp_is_wdt_running(pipe))
-		return;
-
-	dev_dbg(pipe->asd->isp->dev,
-		"WDT stop asd %d (%s)\n", pipe->asd->index, pipe->vdev.name);
-
-	if (sync) {
-		del_timer_sync(&pipe->wdt);
-		cancel_work_sync(&pipe->asd->isp->wdt_work);
-	} else {
-		del_timer(&pipe->wdt);
-	}
-}
-
-/* ISP 2401 */
-void atomisp_wdt_start_pipe(struct atomisp_video_pipe *pipe)
-{
-	atomisp_wdt_refresh_pipe(pipe, ATOMISP_ISP_TIMEOUT_DURATION);
-}
-
-void atomisp_wdt_stop(struct atomisp_sub_device *asd, bool sync)
-{
-	dev_dbg(asd->isp->dev, "WDT stop:\n");
-
-	if (!IS_ISP2401) {
-		if (sync) {
-			del_timer_sync(&asd->wdt);
-			cancel_work_sync(&asd->isp->wdt_work);
-		} else {
-			del_timer(&asd->wdt);
-		}
-	} else {
-		atomisp_wdt_stop_pipe(&asd->video_out_capture, sync);
-		atomisp_wdt_stop_pipe(&asd->video_out_preview, sync);
-		atomisp_wdt_stop_pipe(&asd->video_out_vf, sync);
-		atomisp_wdt_stop_pipe(&asd->video_out_video_capture, sync);
-	}
-}
-
 void atomisp_setup_flash(struct atomisp_sub_device *asd)
 {
 	struct atomisp_device *isp = asd->isp;
@@ -4122,19 +3782,6 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
 		return;
 
 	atomisp_qbuffers_to_css(asd);
-
-	if (!IS_ISP2401) {
-		if (!atomisp_is_wdt_running(asd) && atomisp_buffers_queued(asd))
-			atomisp_wdt_start(asd);
-	} else {
-		if (atomisp_buffers_queued_pipe(pipe)) {
-			if (!atomisp_is_wdt_running(pipe))
-				atomisp_wdt_start_pipe(pipe);
-			else
-				atomisp_wdt_refresh_pipe(pipe,
-							ATOMISP_WDT_KEEP_CURRENT_DELAY);
-		}
-	}
 }
 
 /*
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index c4472516487b..5ab7d6aca7fa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -65,8 +65,7 @@ bool atomisp_buffers_queued_pipe(struct atomisp_video_pipe *pipe);
 /* Interrupt functions */
 void atomisp_msi_irq_init(struct atomisp_device *isp);
 void atomisp_msi_irq_uninit(struct atomisp_device *isp);
-void atomisp_wdt_work(struct work_struct *work);
-void atomisp_wdt(struct timer_list *t);
+void atomisp_assert_recovery_work(struct work_struct *work);
 void atomisp_setup_flash(struct atomisp_sub_device *asd);
 irqreturn_t atomisp_isr(int irq, void *dev);
 irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 15ef31b0c601..0154ebf2cba5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -3796,8 +3796,6 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 	enum atomisp_input_stream_id stream_id = 0;
 	struct atomisp_css_event current_event;
 	struct atomisp_sub_device *asd;
-	bool reset_wdt_timer[MAX_STREAM_NUM] = {false};
-	int i;
 
 	lockdep_assert_held(&isp->mutex);
 
@@ -3813,14 +3811,8 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 				__func__,
 				current_event.event.fw_assert_module_id,
 				current_event.event.fw_assert_line_no);
-			for (i = 0; i < isp->num_of_streams; i++)
-				atomisp_wdt_stop(&isp->asd[i], 0);
-
-			if (!IS_ISP2401)
-				atomisp_wdt(&isp->asd[0].wdt);
-			else
-				queue_work(isp->wdt_work_queue, &isp->wdt_work);
 
+			queue_work(system_long_wq, &isp->assert_recovery_work);
 			return -EINVAL;
 		} else if (current_event.event.type == IA_CSS_EVENT_TYPE_FW_WARNING) {
 			dev_warn(isp->dev, "%s: ISP reports warning, code is %d, exp_id %d\n",
@@ -3849,20 +3841,12 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 			frame_done_found[asd->index] = true;
 			atomisp_buf_done(asd, 0, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME,
 					 current_event.pipe, true, stream_id);
-
-			if (!IS_ISP2401)
-				reset_wdt_timer[asd->index] = true; /* ISP running */
-
 			break;
 		case IA_CSS_EVENT_TYPE_SECOND_OUTPUT_FRAME_DONE:
 			dev_dbg(isp->dev, "event: Second output frame done");
 			frame_done_found[asd->index] = true;
 			atomisp_buf_done(asd, 0, IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME,
 					 current_event.pipe, true, stream_id);
-
-			if (!IS_ISP2401)
-				reset_wdt_timer[asd->index] = true; /* ISP running */
-
 			break;
 		case IA_CSS_EVENT_TYPE_3A_STATISTICS_DONE:
 			dev_dbg(isp->dev, "event: 3A stats frame done");
@@ -3883,19 +3867,12 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 			atomisp_buf_done(asd, 0,
 					 IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME,
 					 current_event.pipe, true, stream_id);
-
-			if (!IS_ISP2401)
-				reset_wdt_timer[asd->index] = true; /* ISP running */
-
 			break;
 		case IA_CSS_EVENT_TYPE_SECOND_VF_OUTPUT_FRAME_DONE:
 			dev_dbg(isp->dev, "event: second VF output frame done");
 			atomisp_buf_done(asd, 0,
 					 IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME,
 					 current_event.pipe, true, stream_id);
-			if (!IS_ISP2401)
-				reset_wdt_timer[asd->index] = true; /* ISP running */
-
 			break;
 		case IA_CSS_EVENT_TYPE_DIS_STATISTICS_DONE:
 			dev_dbg(isp->dev, "event: dis stats frame done");
@@ -3918,24 +3895,6 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 		}
 	}
 
-	if (IS_ISP2401)
-		return 0;
-
-	/* ISP2400: If there are no buffers queued then delete wdt timer. */
-	for (i = 0; i < isp->num_of_streams; i++) {
-		asd = &isp->asd[i];
-		if (!asd)
-			continue;
-		if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
-			continue;
-		if (!atomisp_buffers_queued(asd))
-			atomisp_wdt_stop(asd, false);
-		else if (reset_wdt_timer[i])
-			/* SOF irq should not reset wdt timer. */
-			atomisp_wdt_refresh(asd,
-					    ATOMISP_WDT_KEEP_CURRENT_DELAY);
-	}
-
 	return 0;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index b2c362ef7199..2279d45e7d7a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -258,13 +258,7 @@ struct atomisp_device {
 	/* isp timeout status flag */
 	bool isp_timeout;
 	bool isp_fatal_error;
-	struct workqueue_struct *wdt_work_queue;
-	struct work_struct wdt_work;
-
-	/* ISP2400 */
-	atomic_t wdt_count;
-
-	atomic_t wdt_work_queued;
+	struct work_struct assert_recovery_work;
 
 	spinlock_t lock; /* Protects asd[i].streaming */
 
@@ -282,20 +276,4 @@ struct atomisp_device {
 
 extern struct device *atomisp_dev;
 
-#define atomisp_is_wdt_running(a) timer_pending(&(a)->wdt)
-
-/* ISP2401 */
-void atomisp_wdt_refresh_pipe(struct atomisp_video_pipe *pipe,
-			      unsigned int delay);
-void atomisp_wdt_refresh(struct atomisp_sub_device *asd, unsigned int delay);
-
-/* ISP2400 */
-void atomisp_wdt_start(struct atomisp_sub_device *asd);
-
-/* ISP2401 */
-void atomisp_wdt_start_pipe(struct atomisp_video_pipe *pipe);
-void atomisp_wdt_stop_pipe(struct atomisp_video_pipe *pipe, bool sync);
-
-void atomisp_wdt_stop(struct atomisp_sub_device *asd, bool sync);
-
 #endif /* __ATOMISP_INTERNAL_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 9b50f637c46a..daecdcdeb27c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1363,15 +1363,6 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 			atomisp_handle_parameter_and_buffer(pipe);
 		} else {
 			atomisp_qbuffers_to_css(asd);
-
-			if (!IS_ISP2401) {
-				if (!atomisp_is_wdt_running(asd) && atomisp_buffers_queued(asd))
-					atomisp_wdt_start(asd);
-			} else {
-				if (!atomisp_is_wdt_running(pipe) &&
-				    atomisp_buffers_queued_pipe(pipe))
-					atomisp_wdt_start_pipe(pipe);
-			}
 		}
 	}
 
@@ -1594,33 +1585,6 @@ int atomisp_stream_on_master_slave_sensor(struct atomisp_device *isp,
 	return 0;
 }
 
-/* FIXME! ISP2400 */
-static void __wdt_on_master_slave_sensor(struct atomisp_device *isp,
-					 unsigned int wdt_duration)
-{
-	if (atomisp_buffers_queued(&isp->asd[0]))
-		atomisp_wdt_refresh(&isp->asd[0], wdt_duration);
-	if (atomisp_buffers_queued(&isp->asd[1]))
-		atomisp_wdt_refresh(&isp->asd[1], wdt_duration);
-}
-
-/* FIXME! ISP2401 */
-static void __wdt_on_master_slave_sensor_pipe(struct atomisp_video_pipe *pipe,
-					      unsigned int wdt_duration,
-					      bool enable)
-{
-	static struct atomisp_video_pipe *pipe0;
-
-	if (enable) {
-		if (atomisp_buffers_queued_pipe(pipe0))
-			atomisp_wdt_refresh_pipe(pipe0, wdt_duration);
-		if (atomisp_buffers_queued_pipe(pipe))
-			atomisp_wdt_refresh_pipe(pipe, wdt_duration);
-	} else {
-		pipe0 = pipe;
-	}
-}
-
 static void atomisp_pause_buffer_event(struct atomisp_device *isp)
 {
 	struct v4l2_event event = {0};
@@ -1670,7 +1634,6 @@ static int atomisp_streamon(struct file *file, void *fh,
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
 	unsigned int sensor_start_stream;
-	unsigned int wdt_duration = ATOMISP_ISP_TIMEOUT_DURATION;
 	unsigned long irqflags;
 	int ret;
 
@@ -1845,15 +1808,9 @@ static int atomisp_streamon(struct file *file, void *fh,
 			dev_err(isp->dev, "master slave sensor stream on failed!\n");
 			goto out;
 		}
-		if (!IS_ISP2401)
-			__wdt_on_master_slave_sensor(isp, wdt_duration);
-		else
-			__wdt_on_master_slave_sensor_pipe(pipe, wdt_duration, true);
 		goto start_delay_wq;
 	} else if (asd->depth_mode->val && (atomisp_streaming_count(isp) <
 					    ATOMISP_DEPTH_SENSOR_STREAMON_COUNT)) {
-		if (IS_ISP2401)
-			__wdt_on_master_slave_sensor_pipe(pipe, wdt_duration, false);
 		goto start_delay_wq;
 	}
 
@@ -1875,14 +1832,6 @@ static int atomisp_streamon(struct file *file, void *fh,
 		goto out;
 	}
 
-	if (!IS_ISP2401) {
-		if (atomisp_buffers_queued(asd))
-			atomisp_wdt_refresh(asd, wdt_duration);
-	} else {
-		if (atomisp_buffers_queued_pipe(pipe))
-			atomisp_wdt_refresh_pipe(pipe, wdt_duration);
-	}
-
 start_delay_wq:
 	if (asd->continuous_mode->val) {
 		struct v4l2_mbus_framefmt *sink;
@@ -1986,16 +1935,7 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 		asd->streaming = ATOMISP_DEVICE_STREAMING_STOPPING;
 		first_streamoff = true;
 	}
-	spin_unlock_irqrestore(&isp->lock, flags);
-
-	if (first_streamoff) {
-		/* if other streams are running, should not disable watch dog */
-		mutex_unlock(&isp->mutex);
-		atomisp_wdt_stop(asd, true);
-		mutex_lock(&isp->mutex);
-	}
 
-	spin_lock_irqsave(&isp->lock, flags);
 	if (atomisp_subdev_streaming_count(asd) == 1)
 		asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
 	spin_unlock_irqrestore(&isp->lock, flags);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index b44f060b0bb5..43e6a1d1e410 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -108,15 +108,6 @@ struct atomisp_video_pipe {
 	 */
 	unsigned int frame_request_config_id[VIDEO_MAX_FRAME];
 	struct atomisp_css_params_with_list *frame_params[VIDEO_MAX_FRAME];
-
-	/*
-	* move wdt from asd struct to create wdt for each pipe
-	*/
-	/* ISP2401 */
-	struct timer_list wdt;
-	unsigned int wdt_duration;	/* in jiffies */
-	unsigned long wdt_expires;
-	atomic_t wdt_count;
 };
 
 struct atomisp_pad_format {
@@ -360,11 +351,6 @@ struct atomisp_sub_device {
 	int raw_buffer_locked_count;
 	spinlock_t raw_buffer_bitmap_lock;
 
-	/* ISP 2400 */
-	struct timer_list wdt;
-	unsigned int wdt_duration;	/* in jiffies */
-	unsigned long wdt_expires;
-
 	/* ISP2401 */
 	bool re_trigger_capture;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index aa38e0d33b5b..d55e8d32a286 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1433,39 +1433,6 @@ static bool is_valid_device(struct pci_dev *pdev, const struct pci_device_id *id
 	return true;
 }
 
-static int init_atomisp_wdts(struct atomisp_device *isp)
-{
-	int i, err;
-
-	atomic_set(&isp->wdt_work_queued, 0);
-	isp->wdt_work_queue = alloc_workqueue(isp->v4l2_dev.name, 0, 1);
-	if (!isp->wdt_work_queue) {
-		dev_err(isp->dev, "Failed to initialize wdt work queue\n");
-		err = -ENOMEM;
-		goto alloc_fail;
-	}
-	INIT_WORK(&isp->wdt_work, atomisp_wdt_work);
-
-	for (i = 0; i < isp->num_of_streams; i++) {
-		struct atomisp_sub_device *asd = &isp->asd[i];
-
-		if (!IS_ISP2401) {
-			timer_setup(&asd->wdt, atomisp_wdt, 0);
-		} else {
-			timer_setup(&asd->video_out_capture.wdt,
-				    atomisp_wdt, 0);
-			timer_setup(&asd->video_out_preview.wdt,
-				    atomisp_wdt, 0);
-			timer_setup(&asd->video_out_vf.wdt, atomisp_wdt, 0);
-			timer_setup(&asd->video_out_video_capture.wdt,
-				    atomisp_wdt, 0);
-		}
-	}
-	return 0;
-alloc_fail:
-	return err;
-}
-
 #define ATOM_ISP_PCI_BAR	0
 
 static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
@@ -1698,10 +1665,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		dev_err(&pdev->dev, "atomisp_register_entities failed (%d)\n", err);
 		goto register_entities_fail;
 	}
-	/* init atomisp wdts */
-	err = init_atomisp_wdts(isp);
-	if (err != 0)
-		goto wdt_work_queue_fail;
+
+	INIT_WORK(&isp->assert_recovery_work, atomisp_assert_recovery_work);
 
 	/* save the iunit context only once after all the values are init'ed. */
 	atomisp_save_iunit_reg(isp);
@@ -1748,8 +1713,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 request_irq_fail:
 	hmm_cleanup();
 	pm_runtime_get_noresume(&pdev->dev);
-	destroy_workqueue(isp->wdt_work_queue);
-wdt_work_queue_fail:
 	atomisp_unregister_entities(isp);
 register_entities_fail:
 	atomisp_uninitialize_modules(isp);
@@ -1809,8 +1772,6 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 	atomisp_msi_irq_uninit(isp);
 	atomisp_unregister_entities(isp);
 
-	destroy_workqueue(isp->wdt_work_queue);
-
 	release_firmware(isp->firmware);
 }
 
-- 
2.37.3

