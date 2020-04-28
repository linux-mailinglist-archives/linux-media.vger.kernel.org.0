Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C77A1BB51B
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 06:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgD1EVv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 00:21:51 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9760 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgD1EVt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 00:21:49 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea7af500001>; Mon, 27 Apr 2020 21:21:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 27 Apr 2020 21:21:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 27 Apr 2020 21:21:49 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 04:21:48 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 Apr 2020 04:21:48 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.152]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ea7af5c0000>; Mon, 27 Apr 2020 21:21:48 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <digetx@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v1 3/5] media: tegra-video: Move PM runtime handle to streaming
Date:   Mon, 27 Apr 2020 21:20:48 -0700
Message-ID: <1588047650-29402-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588047696; bh=Bk0IVV1VuhDOXgh7mRL9yuSSU0OFWYsRAC5v+Bfzhlk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=YWKoqEGhdvRgHjFv28BMQ/FYbFolrxqv7yogM2CBSzL2a9EwZQHbsBT4WpLFUId0g
         dpZ5NlazMu62n6VSmv+o8hAWK432L2Ln2uh6X2pZxS77ZogQylEohqLEeEd7CkZ5fj
         kjRv7iOkCYT5YDEI1Z3CtxcbGXIrOUNjQiRpML0iqTYAbf+cUsoK1vZcpfGdMQn6PO
         ck2KdpUBEBsXmyNzJIgjrV0JkcD5SudtdiN1aNf9dfHdFPn0TRdgi90oTIcFDFLJZe
         wjdw38md1K+WVhzIZ173Anhp2ypyTObpIAzPQOtpuN5q6Wrs5c+2SMT2qsY57WHL2e
         822MkrMp4GMMw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PM runtime resume and suspend should happen during streaming start
and stop so only when there is any active streaming from any of the
video devices, power and clocks gets enabled otherwise they will be
disabled.

This patch moves pm_runtime_get_sync and pm_runtime_put_sync to
streaming start and stop for both Tegra VI and CSI.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/csi.c | 27 +++++++++++++++++---------
 drivers/staging/media/tegra-video/csi.h |  2 ++
 drivers/staging/media/tegra-video/vi.c  | 34 ++++++++++++++++++++-------------
 drivers/staging/media/tegra-video/vi.h  |  2 ++
 4 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index b3dd0c3..29ccdae 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -272,8 +272,25 @@ static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
 	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct tegra_csi *csi = csi_chan->csi;
+	int ret;
+
+	if (enable && atomic_add_return(1, &csi->clk_refcnt) == 1) {
+		ret = pm_runtime_get_sync(csi->dev);
+		if (ret < 0) {
+			dev_err(csi->dev,
+				"failed to get runtime PM: %d\n", ret);
+			pm_runtime_put_noidle(csi->dev);
+			atomic_dec(&csi->clk_refcnt);
+			return ret;
+		}
+	}
+
+	ret = csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
 
-	return csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
+	if ((ret < 0 || !enable) && atomic_dec_and_test(&csi->clk_refcnt))
+		pm_runtime_put_sync(csi->dev);
+
+	return ret;
 }
 
 /*
@@ -437,13 +454,6 @@ static int tegra_csi_init(struct host1x_client *client)
 
 	INIT_LIST_HEAD(&csi->csi_chans);
 
-	ret = pm_runtime_get_sync(csi->dev);
-	if (ret < 0) {
-		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
-		pm_runtime_put_noidle(csi->dev);
-		return ret;
-	}
-
 	ret = tegra_csi_tpg_channels_alloc(csi);
 	if (ret < 0) {
 		dev_err(csi->dev,
@@ -470,7 +480,6 @@ static int tegra_csi_exit(struct host1x_client *client)
 	struct tegra_csi *csi = host1x_client_to_csi(client);
 
 	tegra_csi_channels_cleanup(csi);
-	pm_runtime_put_sync(csi->dev);
 
 	return 0;
 }
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 217d5d3..4781b83 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -125,6 +125,7 @@ struct tegra_csi_soc {
  * @soc: pointer to SoC data structure
  * @ops: csi operations
  * @channels: list head for CSI channels
+ * @clk_refcnt: reference counter for clock enable/disable
  */
 struct tegra_csi {
 	struct device *dev;
@@ -134,6 +135,7 @@ struct tegra_csi {
 	const struct tegra_csi_soc *soc;
 	const struct tegra_csi_ops *ops;
 	struct list_head csi_chans;
+	atomic_t clk_refcnt;
 };
 
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 61ecc2b..cd4c08d 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -200,8 +200,25 @@ void tegra_channel_release_buffers(struct tegra_vi_channel *chan,
 static int tegra_channel_start_streaming(struct vb2_queue *vq, u32 count)
 {
 	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
+	int ret;
 
-	return chan->vi->ops->vi_start_streaming(vq, count);
+	if (atomic_add_return(1, &chan->vi->power_on_refcnt) == 1) {
+		ret = pm_runtime_get_sync(chan->vi->dev);
+		if (ret < 0) {
+			dev_err(chan->vi->dev,
+				"failed to get runtime PM: %d\n", ret);
+			pm_runtime_put_noidle(chan->vi->dev);
+			atomic_dec(&chan->vi->power_on_refcnt);
+			return ret;
+		}
+	}
+
+	ret = chan->vi->ops->vi_start_streaming(vq, count);
+
+	if (ret < 0 && atomic_dec_and_test(&chan->vi->power_on_refcnt))
+		pm_runtime_put_sync(chan->vi->dev);
+
+	return ret;
 }
 
 static void tegra_channel_stop_streaming(struct vb2_queue *vq)
@@ -209,6 +226,9 @@ static void tegra_channel_stop_streaming(struct vb2_queue *vq)
 	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
 
 	chan->vi->ops->vi_stop_streaming(vq);
+
+	if (atomic_dec_and_test(&chan->vi->power_on_refcnt))
+		pm_runtime_put_sync(chan->vi->dev);
 }
 
 static const struct vb2_ops tegra_channel_queue_qops = {
@@ -920,13 +940,6 @@ static int tegra_vi_init(struct host1x_client *client)
 
 	INIT_LIST_HEAD(&vi->vi_chans);
 
-	ret = pm_runtime_get_sync(vi->dev);
-	if (ret < 0) {
-		dev_err(vi->dev, "failed to get runtime PM: %d\n", ret);
-		pm_runtime_put_noidle(vi->dev);
-		return ret;
-	}
-
 	ret = tegra_vi_tpg_channels_alloc(vi);
 	if (ret < 0) {
 		dev_err(vi->dev, "failed to allocate tpg channels: %d\n", ret);
@@ -947,14 +960,11 @@ static int tegra_vi_init(struct host1x_client *client)
 		kfree(chan);
 	}
 
-	pm_runtime_put_sync(vi->dev);
 	return ret;
 }
 
 static int tegra_vi_exit(struct host1x_client *client)
 {
-	struct tegra_vi *vi = host1x_client_to_vi(client);
-
 	/*
 	 * Do not cleanup the channels here as application might still be
 	 * holding video device nodes. Channels cleanup will happen during
@@ -962,8 +972,6 @@ static int tegra_vi_exit(struct host1x_client *client)
 	 * device nodes are released.
 	 */
 
-	pm_runtime_put_sync(vi->dev);
-
 	return 0;
 }
 
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index bf0ed1a..b7a5439 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -54,6 +54,7 @@ struct tegra_vi_soc {
  * @soc: pointer to SoC data structure
  * @ops: vi operations
  * @vi_chans: list head for VI channels
+ * @power_on_refcnt: reference counter for power and clocks on/off
  */
 struct tegra_vi {
 	struct device *dev;
@@ -64,6 +65,7 @@ struct tegra_vi {
 	const struct tegra_vi_soc *soc;
 	const struct tegra_vi_ops *ops;
 	struct list_head vi_chans;
+	atomic_t power_on_refcnt;
 };
 
 void tegra_channels_cleanup(struct tegra_vi *vi);
-- 
2.7.4

