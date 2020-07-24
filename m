Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66B122C4AD
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 14:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgGXMCi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 08:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbgGXMCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 08:02:32 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 990FDC0619D3
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 05:02:32 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id l6so4322470plt.7
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 05:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cvnh2hEgqr+H3PqRAzGMgrE9Ro4XZW4OvEzfzGD53mo=;
        b=VeE6kkrhkfhNP5LUcTBQH11gWeFF2+m6gYWJQs7hF4vvMOESDioBiAvItJzO2SMFbK
         8FCqkBz8VjNAQkhBINnbqgV765p/yY2MKpyR4pbsPScOW6XqETJq3/hC8OqcV1u/nyIE
         hMUwPK0tvMmRutyClsFgP7hCPQTUJsihOINYnmTVNYLXqJ8rkWEPfnMB81qnj645CWZs
         dN700jzBqr3D81QOg2wZtaTObxl7GCECZHV90gHavWW8j3JFlJ1C9JeyqdtW6qXJZtSo
         qIzIT2xN8tCc1kIhTppQog0LsNo2J49gakquKZFtFBoH/c3FduITekszQUZJPtJ2NeuW
         GzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cvnh2hEgqr+H3PqRAzGMgrE9Ro4XZW4OvEzfzGD53mo=;
        b=SGj8GnPbPzVLsmsbUPnppy2v1ltxYo3cmzLlK7yh7kqoeQoL1BKd3KBWGqVbjmLsAw
         1UR6TkwtMF/LzuiovW4OL4+XN+NtPAmARcw/7PbfgnuGnOSZC13rCyfjBcIIh5E0Ad5I
         eeOzJipf3WnC5hcH/AkU+1cmbWsYhFHQ04zafyvLsEndscn8W8XXgWzWFiRa0hLTW9z9
         NnlXYesdt/ValyCPA0jfW9eVD4hA/WqtVc24qKwVS6ZENmUeMrSeiRVMQC6enE9Msr7v
         G34MfFO/RwAOr8TdV4AOupxXiZ1NI5vpR98dwjnJDA7fCFX02PdxVMnZ9VKWyLZASNMX
         PdKg==
X-Gm-Message-State: AOAM533QJslOr9r+wy6VZR/F156TlCbrH0J9DyDbmtIbAuwQE/HIbBBM
        hesoI44lg3nLiifeZMN9FbwhXA==
X-Google-Smtp-Source: ABdhPJx1KpkTSIokD3l7fY0gnmrHS9A2ucrNiBW4LSWWu0NAn1vNg+7QQ5JqFjd577c75UP4IxamzA==
X-Received: by 2002:a17:90b:4b84:: with SMTP id lr4mr4891056pjb.111.1595592151966;
        Fri, 24 Jul 2020 05:02:31 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id h15sm6293300pfo.192.2020.07.24.05.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 05:02:31 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v2 1/3] media: vimc: Add usage count to subdevices
Date:   Fri, 24 Jul 2020 17:32:11 +0530
Message-Id: <20200724120213.17119-2-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
References: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prepare for multiple video streams from the same sensor by adding a use
counter to each subdevice. The counter is increased for every s_stream(1)
and decremented for every s_stream(0) call.

The subdevice stream is not started or stopped unless the usage count go
from 0 to 1 (started) or from 1 to 0 (stopped). This allows for multiple
s_stream() calls to try to either start or stop the device while only
the first/last call will actually effect the state of the device.

[Kaaira: rebased the patch on current HEAD of media-tree
(8f2a4a9d5ff5202d0b3e3a144ebb9b67aabadd29)]

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 drivers/media/test-drivers/vimc/vimc-debayer.c | 8 ++++++++
 drivers/media/test-drivers/vimc/vimc-scaler.c  | 8 ++++++++
 drivers/media/test-drivers/vimc/vimc-sensor.c  | 9 ++++++++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index c3f6fef34f68..93fe19d8d2b4 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -29,6 +29,7 @@ struct vimc_deb_pix_map {
 struct vimc_deb_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
+	atomic_t use_count;
 	/* The active format */
 	struct v4l2_mbus_framefmt sink_fmt;
 	u32 src_code;
@@ -343,6 +344,9 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
+		if (atomic_inc_return(&vdeb->use_count) != 1)
+			return 0;
+
 		if (vdeb->src_frame)
 			return 0;
 
@@ -368,6 +372,9 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 			return -ENOMEM;
 
 	} else {
+		if (atomic_dec_return(&vdeb->use_count) != 0)
+			return 0;
+
 		if (!vdeb->src_frame)
 			return 0;
 
@@ -595,6 +602,7 @@ static struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 	vdeb->ved.process_frame = vimc_deb_process_frame;
 	vdeb->ved.dev = vimc->mdev.dev;
 	vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
+	atomic_set(&vdeb->use_count, 0);
 
 	/* Initialize the frame format */
 	vdeb->sink_fmt = sink_fmt_default;
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index 121fa7d62a2e..9b8458dbe57c 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -25,6 +25,7 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
 struct vimc_sca_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
+	atomic_t use_count;
 	/* NOTE: the source fmt is the same as the sink
 	 * with the width and hight multiplied by mult
 	 */
@@ -340,6 +341,9 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
+		if (atomic_inc_return(&vsca->use_count) != 1)
+			return 0;
+
 		if (vsca->src_frame)
 			return 0;
 
@@ -363,6 +367,9 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 			return -ENOMEM;
 
 	} else {
+		if (atomic_dec_return(&vsca->use_count) != 0)
+			return 0;
+
 		if (!vsca->src_frame)
 			return 0;
 
@@ -506,6 +513,7 @@ static struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 
 	vsca->ved.process_frame = vimc_sca_process_frame;
 	vsca->ved.dev = vimc->mdev.dev;
+	atomic_set(&vsca->use_count, 0);
 
 	/* Initialize the frame format */
 	vsca->sink_fmt = sink_fmt_default;
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index ba5db5a150b4..dbe169604e71 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -24,6 +24,7 @@ struct vimc_sen_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
 	struct tpg_data tpg;
+	atomic_t use_count;
 	u8 *frame;
 	enum vimc_sen_osd_mode osd_value;
 	u64 start_stream_ts;
@@ -250,8 +251,10 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
-		vsen->start_stream_ts = ktime_get_ns();
+		if (atomic_inc_return(&vsen->use_count) != 1)
+			return 0;
 
+		vsen->start_stream_ts = ktime_get_ns();
 		/* Calculate the frame size */
 		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
 		frame_size = vsen->mbus_format.width * vpix->bpp *
@@ -270,6 +273,9 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 
 	} else {
 
+		if (atomic_dec_return(&vsen->use_count) != 0)
+			return 0;
+
 		vfree(vsen->frame);
 		vsen->frame = NULL;
 	}
@@ -430,6 +436,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 
 	vsen->ved.process_frame = vimc_sen_process_frame;
 	vsen->ved.dev = vimc->mdev.dev;
+	atomic_set(&vsen->use_count, 0);
 
 	/* Initialize the frame format */
 	vsen->mbus_format = fmt_default;
-- 
2.17.1

