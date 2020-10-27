Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C0229A328
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 04:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504800AbgJ0DTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 23:19:52 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18930 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504585AbgJ0DTd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 23:19:33 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9791cb0000>; Mon, 26 Oct 2020 20:19:39 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 27 Oct
 2020 03:19:31 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 27 Oct 2020 03:19:31 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 10/10] media: tegra-video: Add support for x8 captures with gang ports
Date:   Mon, 26 Oct 2020 20:19:23 -0700
Message-ID: <1603768763-25590-11-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
References: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603768779; bh=h/mVfHw5pkkHAqpAzS0xJifsCukHVrv0H/ojnwO4sIw=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=Wckd2W7QPkLbcnRzJTjUQebgKay+XlmoMZb37nIe/Mn+wV2D/cjyJfyosN8VDkwXM
         JadwLRHkyQ4iRXTfvpw5mCVDtVNn74YX7Pl1Qm7lSEXrYBRlqazxYv3sDqR2vtMFbd
         Poltsjwm7RZbk8BOk8RT51YSq4sTrzHlv3CDtn5mHCvVn4qk4B8BSzpRPqwc1KmwKb
         WKtwZS8Asbpd7Tk1GMp1cIYDppQE4Nsm1E8/DOm2D9dQsPWMkIbjwJz1RYWMGFr0oZ
         5dJKVFWylVoQ2hIOAuHfQXj3d/TZxk7h56jpJm719poenA0aa3IPD/ZxR4NUArBGAy
         yGxFiRAMX5oSQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra VI/CSI hardware don't have native 8 lane capture support.

Each CSI port has max 4 lanes only. So for x8 captures, consecutive
ports are ganged up for left half and right half captures on to each
x4 ports with buffer offsets based on source image split width to align
side-by-side.

All ports in gang are configured together during the corresponding
video device node streaming for x8 captures.

x8 capture with gang ports are supported with HDMI-to-CSI bridges
where they split 4K image into left half onto one x4 port and
right half onto second x4 port.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/csi.c      |  47 ++++-
 drivers/staging/media/tegra-video/csi.h      |  14 +-
 drivers/staging/media/tegra-video/tegra210.c | 304 ++++++++++++++++++---------
 drivers/staging/media/tegra-video/vi.c       | 117 ++++++++---
 drivers/staging/media/tegra-video/vi.h       |  17 +-
 5 files changed, 347 insertions(+), 152 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index a19c85c..a6c54f8 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -253,13 +253,14 @@ static unsigned int csi_get_pixel_rate(struct tegra_csi_channel *csi_chan)
 }
 
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
+				u8 csi_port_num,
 				u8 *clk_settle_time,
 				u8 *ths_settle_time)
 {
 	struct tegra_csi *csi = csi_chan->csi;
 	unsigned int cil_clk_mhz;
 	unsigned int pix_clk_mhz;
-	int clk_idx = (csi_chan->csi_port_num >> 1) + 1;
+	int clk_idx = (csi_port_num >> 1) + 1;
 
 	cil_clk_mhz = clk_get_rate(csi->clks[clk_idx].clk) / MHZ;
 	pix_clk_mhz = csi_get_pixel_rate(csi_chan) / MHZ;
@@ -410,7 +411,7 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 				   unsigned int num_pads)
 {
 	struct tegra_csi_channel *chan;
-	int ret = 0;
+	int ret = 0, i;
 
 	chan = kzalloc(sizeof(*chan), GFP_KERNEL);
 	if (!chan)
@@ -418,8 +419,21 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 
 	list_add_tail(&chan->list, &csi->csi_chans);
 	chan->csi = csi;
-	chan->csi_port_num = port_num;
-	chan->numlanes = lanes;
+	/*
+	 * Each CSI brick has maximum of 4 lanes.
+	 * For lanes more than 4, use multiple of immediate CSI bricks as gang.
+	 */
+	if (lanes <= CSI_LANES_PER_BRICK) {
+		chan->numlanes = lanes;
+		chan->numgangports = 1;
+	} else {
+		chan->numlanes = CSI_LANES_PER_BRICK;
+		chan->numgangports = lanes / CSI_LANES_PER_BRICK;
+	}
+
+	for (i = 0; i < chan->numgangports; i++)
+		chan->csi_port_nums[i] = port_num + i * CSI_PORTS_PER_BRICK;
+
 	chan->of_node = node;
 	chan->numpads = num_pads;
 	if (num_pads & 0x2) {
@@ -461,9 +475,6 @@ static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
 static int tegra_csi_channels_alloc(struct tegra_csi *csi)
 {
 	struct device_node *node = csi->dev->of_node;
-	struct v4l2_fwnode_endpoint v4l2_ep = {
-		.bus_type = V4L2_MBUS_CSI2_DPHY
-	};
 	struct fwnode_handle *fwh;
 	struct device_node *channel;
 	struct device_node *ep;
@@ -471,6 +482,8 @@ static int tegra_csi_channels_alloc(struct tegra_csi *csi)
 	int ret;
 
 	for_each_child_of_node(node, channel) {
+		struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
+
 		if (!of_node_name_eq(channel, "channel"))
 			continue;
 
@@ -499,8 +512,20 @@ static int tegra_csi_channels_alloc(struct tegra_csi *csi)
 			goto err_node_put;
 		}
 
-		lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
-		if (!lanes || ((lanes & (lanes - 1)) != 0)) {
+		if (v4l2_ep.bus_type == V4L2_MBUS_PARALLEL)
+			lanes = v4l2_ep.bus.parallel.bus_width;
+		else
+			lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
+
+		/*
+		 * Each CSI brick has maximum 4 data lanes.
+		 * For lanes more than 4, validate lanes to be multiple of 4
+		 * so multiple of consecutive CSI bricks can be ganged up for
+		 * streaming.
+		 */
+		if (!lanes || ((lanes & (lanes - 1)) != 0) ||
+		    (lanes > CSI_LANES_PER_BRICK && (((lanes & 3) != 0) ||
+		    ((portno & 1) != 0)))) {
 			dev_err(csi->dev, "invalid data-lanes %d for %pOF\n",
 				lanes, channel);
 			ret = -EINVAL;
@@ -544,7 +569,7 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 	subdev->dev = csi->dev;
 	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s-%d", "tpg",
-			 chan->csi_port_num);
+			 chan->csi_port_nums[0]);
 	else
 		snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s",
 			 kbasename(chan->of_node->full_name));
@@ -596,7 +621,7 @@ static int tegra_csi_channels_init(struct tegra_csi *csi)
 		if (ret) {
 			dev_err(csi->dev,
 				"failed to initialize channel-%d: %d\n",
-				chan->csi_port_num, ret);
+				chan->csi_port_nums[0], ret);
 			return ret;
 		}
 	}
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index c65ff73..386f7c6 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -17,6 +17,10 @@
  * CILB.
  */
 #define CSI_PORTS_PER_BRICK	2
+#define CSI_LANES_PER_BRICK	4
+
+/* Maximum 2 CSI x4 ports can be ganged up for streaming */
+#define GANG_PORTS_MAX	2
 
 /* each CSI channel can have one sink and one source pads */
 #define TEGRA_CSI_PADS_NUM	2
@@ -43,8 +47,10 @@ struct tegra_csi;
  * @numpads: number of pads.
  * @csi: Tegra CSI device structure
  * @of_node: csi device tree node
- * @numlanes: number of lanes used per port/channel
- * @csi_port_num: CSI channel port number
+ * @numgangports: number of immediate ports ganged up to meet the
+ *             channel bus-width
+ * @numlanes: number of lanes used per port
+ * @csi_port_nums: CSI channel port numbers
  * @pg_mode: test pattern generator mode for channel
  * @format: active format of the channel
  * @framerate: active framerate for TPG
@@ -60,8 +66,9 @@ struct tegra_csi_channel {
 	unsigned int numpads;
 	struct tegra_csi *csi;
 	struct device_node *of_node;
+	u8 numgangports;
 	unsigned int numlanes;
-	u8 csi_port_num;
+	u8 csi_port_nums[GANG_PORTS_MAX];
 	u8 pg_mode;
 	struct v4l2_mbus_framefmt format;
 	unsigned int framerate;
@@ -150,6 +157,7 @@ extern const struct tegra_csi_soc tegra210_csi_soc;
 
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
+				u8 csi_port_num,
 				u8 *clk_settle_time,
 				u8 *ths_settle_time);
 #endif
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index 929d277..aff56fc 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -149,21 +149,22 @@ static u32 tegra_vi_read(struct tegra_vi_channel *chan, unsigned int addr)
 }
 
 /* Tegra210 VI_CSI registers accessors */
-static void vi_csi_write(struct tegra_vi_channel *chan, unsigned int addr,
-			 u32 val)
+static void vi_csi_write(struct tegra_vi_channel *chan, u8 portno,
+			 unsigned int addr, u32 val)
 {
 	void __iomem *vi_csi_base;
 
-	vi_csi_base = chan->vi->iomem + TEGRA210_VI_CSI_BASE(chan->portno);
+	vi_csi_base = chan->vi->iomem + TEGRA210_VI_CSI_BASE(portno);
 
 	writel_relaxed(val, vi_csi_base + addr);
 }
 
-static u32 vi_csi_read(struct tegra_vi_channel *chan, unsigned int addr)
+static u32 vi_csi_read(struct tegra_vi_channel *chan, u8 portno,
+		       unsigned int addr)
 {
 	void __iomem *vi_csi_base;
 
-	vi_csi_base = chan->vi->iomem + TEGRA210_VI_CSI_BASE(chan->portno);
+	vi_csi_base = chan->vi->iomem + TEGRA210_VI_CSI_BASE(portno);
 
 	return readl_relaxed(vi_csi_base + addr);
 }
@@ -171,7 +172,8 @@ static u32 vi_csi_read(struct tegra_vi_channel *chan, unsigned int addr)
 /*
  * Tegra210 VI channel capture operations
  */
-static int tegra_channel_capture_setup(struct tegra_vi_channel *chan)
+static int tegra_channel_capture_setup(struct tegra_vi_channel *chan,
+				       u8 portno)
 {
 	u32 height = chan->format.height;
 	u32 width = chan->format.width;
@@ -192,19 +194,30 @@ static int tegra_channel_capture_setup(struct tegra_vi_channel *chan)
 	    data_type == TEGRA_IMAGE_DT_RGB888)
 		bypass_pixel_transform = 0;
 
-	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, 0xffffffff);
-	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_DEF,
+	/*
+	 * For x8 source streaming, the source image is split onto two x4 ports
+	 * with left half to first x4 port and right half to second x4 port.
+	 * So, use split width and corresponding word count for each x4 port.
+	 */
+	if (chan->numgangports > 1) {
+		width = width >> 1;
+		word_count = (width * chan->fmtinfo->bit_width) / 8;
+	}
+
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_ERROR_STATUS, 0xffffffff);
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_IMAGE_DEF,
 		     bypass_pixel_transform |
 		     (format << IMAGE_DEF_FORMAT_OFFSET) |
 		     IMAGE_DEF_DEST_MEM);
-	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_DT, data_type);
-	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_SIZE_WC, word_count);
-	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_SIZE,
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_IMAGE_DT, data_type);
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_IMAGE_SIZE_WC, word_count);
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_IMAGE_SIZE,
 		     (height << IMAGE_SIZE_HEIGHT_OFFSET) | width);
 	return 0;
 }
 
-static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan)
+static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan,
+					u8 portno)
 {
 	/* disable clock gating to enable continuous clock */
 	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0);
@@ -212,15 +225,16 @@ static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan)
 	 * Soft reset memory client interface, pixel format logic, sensor
 	 * control logic, and a shadow copy logic to bring VI to clean state.
 	 */
-	vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xf);
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_SW_RESET, 0xf);
 	usleep_range(100, 200);
-	vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_SW_RESET, 0x0);
 
 	/* enable back VI clock gating */
 	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN);
 }
 
-static void tegra_channel_capture_error_recover(struct tegra_vi_channel *chan)
+static void tegra_channel_capture_error_recover(struct tegra_vi_channel *chan,
+						u8 portno)
 {
 	struct v4l2_subdev *subdev;
 	u32 val;
@@ -232,9 +246,9 @@ static void tegra_channel_capture_error_recover(struct tegra_vi_channel *chan)
 	 * events which can cause CSI and VI hardware hang.
 	 * This helps to have a clean capture for next frame.
 	 */
-	val = vi_csi_read(chan, TEGRA_VI_CSI_ERROR_STATUS);
+	val = vi_csi_read(chan, portno, TEGRA_VI_CSI_ERROR_STATUS);
 	dev_dbg(&chan->video.dev, "TEGRA_VI_CSI_ERROR_STATUS 0x%08x\n", val);
-	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, val);
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_ERROR_STATUS, val);
 
 	val = tegra_vi_read(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR);
 	dev_dbg(&chan->video.dev,
@@ -242,8 +256,8 @@ static void tegra_channel_capture_error_recover(struct tegra_vi_channel *chan)
 	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR, val);
 
 	/* recover VI by issuing software reset and re-setup for capture */
-	tegra_channel_vi_soft_reset(chan);
-	tegra_channel_capture_setup(chan);
+	tegra_channel_vi_soft_reset(chan, portno);
+	tegra_channel_capture_setup(chan, portno);
 
 	/* recover CSI block */
 	subdev = tegra_channel_get_remote_csi_subdev(chan);
@@ -282,80 +296,114 @@ static void release_buffer(struct tegra_vi_channel *chan,
 	vb2_buffer_done(&vb->vb2_buf, state);
 }
 
-static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
-				       struct tegra_channel_buffer *buf)
+static void tegra_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
+					  u8 portno, u32 buf_offset,
+					  struct tegra_channel_buffer *buf)
 {
-	u32 thresh, value, frame_start, mw_ack_done;
-	int bytes_per_line = chan->format.bytesperline;
+	int bytesperline = chan->format.bytesperline;
 	u32 sizeimage = chan->format.sizeimage;
-	int err;
 
 	/* program buffer address by using surface 0 */
-	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_MSB,
-		     (u64)buf->addr >> 32);
-	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_LSB, buf->addr);
-	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_STRIDE, bytes_per_line);
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_SURFACE0_OFFSET_MSB,
+		     ((u64)buf->addr + buf_offset) >> 32);
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_SURFACE0_OFFSET_LSB,
+		     buf->addr + buf_offset);
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_SURFACE0_STRIDE, bytesperline);
 
+	if (chan->fmtinfo->fourcc != V4L2_PIX_FMT_NV16)
+		return;
 	/*
 	 * Program surface 1 for UV plane with offset sizeimage from Y plane.
 	 */
-	if (chan->fmtinfo->fourcc == V4L2_PIX_FMT_NV16) {
-		vi_csi_write(chan, TEGRA_VI_CSI_SURFACE1_OFFSET_MSB,
-			     ((u64)buf->addr + sizeimage / 2) >> 32);
-		vi_csi_write(chan, TEGRA_VI_CSI_SURFACE1_OFFSET_LSB,
-			     buf->addr + sizeimage / 2);
-		vi_csi_write(chan, TEGRA_VI_CSI_SURFACE1_STRIDE,
-			     bytes_per_line);
-	}
-
-	/*
-	 * Tegra VI block interacts with host1x syncpt for synchronizing
-	 * programmed condition of capture state and hardware operation.
-	 * Frame start and Memory write acknowledge syncpts has their own
-	 * FIFO of depth 2.
-	 *
-	 * Syncpoint trigger conditions set through VI_INCR_SYNCPT register
-	 * are added to HW syncpt FIFO and when the HW triggers, syncpt
-	 * condition is removed from the FIFO and counter at syncpoint index
-	 * will be incremented by the hardware and software can wait for
-	 * counter to reach threshold to synchronize capturing frame with the
-	 * hardware capture events.
-	 */
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_SURFACE1_OFFSET_MSB,
+		     (((u64)buf->addr + sizeimage / 2) + buf_offset) >> 32);
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_SURFACE1_OFFSET_LSB,
+		     buf->addr + sizeimage / 2 + buf_offset);
+	vi_csi_write(chan, portno, TEGRA_VI_CSI_SURFACE1_STRIDE, bytesperline);
+}
 
-	/* increase channel syncpoint threshold for FRAME_START */
-	thresh = host1x_syncpt_incr_max(chan->frame_start_sp, 1);
+static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
+				       struct tegra_channel_buffer *buf)
+{
+	u32 thresh, value, frame_start, mw_ack_done;
+	u32 fs_thresh[GANG_PORTS_MAX];
+	u8 *portnos = chan->portnos;
+	int gang_bpl = (chan->format.width >> 1) * chan->fmtinfo->bpp;
+	u32 buf_offset;
+	bool capture_timedout = false;
+	int err, i;
+
+	for (i = 0; i < chan->numgangports; i++) {
+		/*
+		 * Align buffers side-by-side for all consecutive x4 ports
+		 * in gang ports using bytes per line based on source split
+		 * width.
+		 */
+		buf_offset = i * roundup(gang_bpl, SURFACE_ALIGN_BYTES);
+		tegra_channel_vi_buffer_setup(chan, portnos[i], buf_offset,
+					      buf);
 
-	/* Program FRAME_START trigger condition syncpt request */
-	frame_start = VI_CSI_PP_FRAME_START(chan->portno);
-	value = VI_CFG_VI_INCR_SYNCPT_COND(frame_start) |
-		host1x_syncpt_id(chan->frame_start_sp);
-	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
+		/*
+		 * Tegra VI block interacts with host1x syncpt to synchronize
+		 * programmed condition and hardware operation for capture.
+		 * Frame start and Memory write acknowledge syncpts has their
+		 * own FIFO of depth 2.
+		 *
+		 * Syncpoint trigger conditions set through VI_INCR_SYNCPT
+		 * register are added to HW syncpt FIFO and when HW triggers,
+		 * syncpt condition is removed from the FIFO and counter at
+		 * syncpoint index will be incremented by the hardware and
+		 * software can wait for counter to reach threshold to
+		 * synchronize capturing frame with hardware capture events.
+		 */
 
-	/* increase channel syncpoint threshold for MW_ACK_DONE */
-	buf->mw_ack_sp_thresh = host1x_syncpt_incr_max(chan->mw_ack_sp, 1);
+		/* increase channel syncpoint threshold for FRAME_START */
+		thresh = host1x_syncpt_incr_max(chan->frame_start_sp[i], 1);
+		fs_thresh[i] = thresh;
+
+		/* Program FRAME_START trigger condition syncpt request */
+		frame_start = VI_CSI_PP_FRAME_START(portnos[i]);
+		value = VI_CFG_VI_INCR_SYNCPT_COND(frame_start) |
+			host1x_syncpt_id(chan->frame_start_sp[i]);
+		tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
+
+		/* increase channel syncpoint threshold for MW_ACK_DONE */
+		thresh = host1x_syncpt_incr_max(chan->mw_ack_sp[i], 1);
+		buf->mw_ack_sp_thresh[i] = thresh;
+
+		/* Program MW_ACK_DONE trigger condition syncpt request */
+		mw_ack_done = VI_CSI_MW_ACK_DONE(portnos[i]);
+		value = VI_CFG_VI_INCR_SYNCPT_COND(mw_ack_done) |
+			host1x_syncpt_id(chan->mw_ack_sp[i]);
+		tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
+	}
 
-	/* Program MW_ACK_DONE trigger condition syncpt request */
-	mw_ack_done = VI_CSI_MW_ACK_DONE(chan->portno);
-	value = VI_CFG_VI_INCR_SYNCPT_COND(mw_ack_done) |
-		host1x_syncpt_id(chan->mw_ack_sp);
-	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
+	/* enable single shot capture after all ganged ports are ready */
+	for (i = 0; i < chan->numgangports; i++)
+		vi_csi_write(chan, portnos[i], TEGRA_VI_CSI_SINGLE_SHOT,
+			     SINGLE_SHOT_CAPTURE);
 
-	/* enable single shot capture */
-	vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT, SINGLE_SHOT_CAPTURE);
+	for (i = 0; i < chan->numgangports; i++) {
+		/*
+		 * Wait for syncpt counter to reach frame start event threshold
+		 */
+		err = host1x_syncpt_wait(chan->frame_start_sp[i], fs_thresh[i],
+					 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
+		if (err) {
+			capture_timedout = true;
+			/* increment syncpoint counter for timedout events */
+			host1x_syncpt_incr(chan->frame_start_sp[i]);
+			spin_lock(&chan->sp_incr_lock[i]);
+			host1x_syncpt_incr(chan->mw_ack_sp[i]);
+			spin_unlock(&chan->sp_incr_lock[i]);
+			/* clear errors and recover */
+			tegra_channel_capture_error_recover(chan, portnos[i]);
+		}
+	}
 
-	/* wait for syncpt counter to reach frame start event threshold */
-	err = host1x_syncpt_wait(chan->frame_start_sp, thresh,
-				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
-	if (err) {
+	if (capture_timedout) {
 		dev_err_ratelimited(&chan->video.dev,
 				    "frame start syncpt timeout: %d\n", err);
-		/* increment syncpoint counter for timedout events */
-		host1x_syncpt_incr(chan->frame_start_sp);
-		spin_lock(&chan->sp_incr_lock);
-		host1x_syncpt_incr(chan->mw_ack_sp);
-		spin_unlock(&chan->sp_incr_lock);
-		/* clear errors and recover */
-		tegra_channel_capture_error_recover(chan);
 		release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
 		return err;
 	}
@@ -376,21 +424,29 @@ static void tegra_channel_capture_done(struct tegra_vi_channel *chan,
 {
 	enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
 	u32 value;
-	int ret;
+	bool capture_timedout = false;
+	int ret, i;
 
-	/* wait for syncpt counter to reach MW_ACK_DONE event threshold */
-	ret = host1x_syncpt_wait(chan->mw_ack_sp, buf->mw_ack_sp_thresh,
-				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
-	if (ret) {
-		dev_err_ratelimited(&chan->video.dev,
-				    "MW_ACK_DONE syncpt timeout: %d\n", ret);
-		state = VB2_BUF_STATE_ERROR;
-		/* increment syncpoint counter for timedout event */
-		spin_lock(&chan->sp_incr_lock);
-		host1x_syncpt_incr(chan->mw_ack_sp);
-		spin_unlock(&chan->sp_incr_lock);
+	for (i = 0; i < chan->numgangports; i++) {
+		/*
+		 * Wait for syncpt counter to reach MW_ACK_DONE event threshold
+		 */
+		ret = host1x_syncpt_wait(chan->mw_ack_sp[i],
+					 buf->mw_ack_sp_thresh[i],
+					 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
+		if (ret) {
+			capture_timedout = true;
+			state = VB2_BUF_STATE_ERROR;
+			/* increment syncpoint counter for timedout event */
+			spin_lock(&chan->sp_incr_lock[i]);
+			host1x_syncpt_incr(chan->mw_ack_sp[i]);
+			spin_unlock(&chan->sp_incr_lock[i]);
+		}
 	}
 
+	if (capture_timedout)
+		dev_err_ratelimited(&chan->video.dev,
+				    "MW_ACK_DONE syncpt timeout: %d\n", ret);
 	release_buffer(chan, buf, state);
 }
 
@@ -463,14 +519,12 @@ static int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
 	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
 	struct media_pipeline *pipe = &chan->video.pipe;
 	u32 val;
-	int ret;
+	u8 *portnos = chan->portnos;
+	int ret, i;
 
 	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN);
 
-	/* clear errors */
-	val = vi_csi_read(chan, TEGRA_VI_CSI_ERROR_STATUS);
-	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, val);
-
+	/* clear syncpt errors */
 	val = tegra_vi_read(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR);
 	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR, val);
 
@@ -489,7 +543,14 @@ static int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
 	if (ret < 0)
 		goto error_pipeline_start;
 
-	tegra_channel_capture_setup(chan);
+	/* clear csi errors and do capture setup for all ports in gang mode */
+	for (i = 0; i < chan->numgangports; i++) {
+		val = vi_csi_read(chan, portnos[i], TEGRA_VI_CSI_ERROR_STATUS);
+		vi_csi_write(chan, portnos[i], TEGRA_VI_CSI_ERROR_STATUS, val);
+
+		tegra_channel_capture_setup(chan, portnos[i]);
+	}
+
 	ret = tegra_channel_set_stream(chan, true);
 	if (ret < 0)
 		goto error_set_stream;
@@ -743,10 +804,10 @@ static void tpg_write(struct tegra_csi *csi, u8 portno, unsigned int addr,
 /*
  * Tegra210 CSI operations
  */
-static void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan)
+static void tegra210_csi_port_recover(struct tegra_csi_channel *csi_chan,
+				      u8 portno)
 {
 	struct tegra_csi *csi = csi_chan->csi;
-	unsigned int portno = csi_chan->csi_port_num;
 	u32 val;
 
 	/*
@@ -795,16 +856,26 @@ static void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan)
 	}
 }
 
-static int tegra210_csi_start_streaming(struct tegra_csi_channel *csi_chan)
+static void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan)
+{
+	u8 *portnos = csi_chan->csi_port_nums;
+	int i;
+
+	for (i = 0; i < csi_chan->numgangports; i++)
+		tegra210_csi_port_recover(csi_chan, portnos[i]);
+}
+
+static int
+tegra210_csi_port_start_streaming(struct tegra_csi_channel *csi_chan,
+				  u8 portno)
 {
 	struct tegra_csi *csi = csi_chan->csi;
-	unsigned int portno = csi_chan->csi_port_num;
 	u8 clk_settle_time = 0;
 	u8 ths_settle_time = 10;
 	u32 val;
 
 	if (!csi_chan->pg_mode)
-		tegra_csi_calc_settle_time(csi_chan, &clk_settle_time,
+		tegra_csi_calc_settle_time(csi_chan, portno, &clk_settle_time,
 					   &ths_settle_time);
 
 	csi_write(csi, portno, TEGRA_CSI_CLKEN_OVERRIDE, 0);
@@ -903,10 +974,10 @@ static int tegra210_csi_start_streaming(struct tegra_csi_channel *csi_chan)
 	return 0;
 }
 
-static void tegra210_csi_stop_streaming(struct tegra_csi_channel *csi_chan)
+static void
+tegra210_csi_port_stop_streaming(struct tegra_csi_channel *csi_chan, u8 portno)
 {
 	struct tegra_csi *csi = csi_chan->csi;
-	unsigned int portno = csi_chan->csi_port_num;
 	u32 val;
 
 	val = pp_read(csi, portno, TEGRA_CSI_PIXEL_PARSER_STATUS);
@@ -944,6 +1015,35 @@ static void tegra210_csi_stop_streaming(struct tegra_csi_channel *csi_chan)
 	}
 }
 
+static int tegra210_csi_start_streaming(struct tegra_csi_channel *csi_chan)
+{
+	u8 *portnos = csi_chan->csi_port_nums;
+	int ret, i;
+
+	for (i = 0; i < csi_chan->numgangports; i++) {
+		ret = tegra210_csi_port_start_streaming(csi_chan, portnos[i]);
+		if (ret)
+			goto stream_start_fail;
+	}
+
+	return 0;
+
+stream_start_fail:
+	for (i = i - 1; i >= 0; i--)
+		tegra210_csi_port_stop_streaming(csi_chan, portnos[i]);
+
+	return ret;
+}
+
+static void tegra210_csi_stop_streaming(struct tegra_csi_channel *csi_chan)
+{
+	u8 *portnos = csi_chan->csi_port_nums;
+	int i;
+
+	for (i = 0; i < csi_chan->numgangports; i++)
+		tegra210_csi_port_stop_streaming(csi_chan, portnos[i]);
+}
+
 /*
  * Tegra210 CSI TPG frame rate table with horizontal and vertical
  * blanking intervals for corresponding format and resolution.
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index e866f7d..4812f2c 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -30,7 +30,6 @@
 #include "vi.h"
 #include "video.h"
 
-#define SURFACE_ALIGN_BYTES		64
 #define MAX_CID_CONTROLS		1
 
 static const struct tegra_video_format tegra_default_format = {
@@ -1090,12 +1089,20 @@ static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
 	return 0;
 }
 
+static void tegra_channel_host1x_syncpts_free(struct tegra_vi_channel *chan)
+{
+	int i;
+
+	for (i = 0; i < chan->numgangports; i++) {
+		host1x_syncpt_free(chan->mw_ack_sp[i]);
+		host1x_syncpt_free(chan->frame_start_sp[i]);
+	}
+}
+
 static void tegra_channel_cleanup(struct tegra_vi_channel *chan)
 {
 	v4l2_ctrl_handler_free(&chan->ctrl_handler);
 	media_entity_cleanup(&chan->video.entity);
-	host1x_syncpt_free(chan->mw_ack_sp);
-	host1x_syncpt_free(chan->frame_start_sp);
 	mutex_destroy(&chan->video_lock);
 }
 
@@ -1107,6 +1114,7 @@ void tegra_channels_cleanup(struct tegra_vi *vi)
 		return;
 
 	list_for_each_entry_safe(chan, tmp, &vi->vi_chans, list) {
+		tegra_channel_host1x_syncpts_free(chan);
 		tegra_channel_cleanup(chan);
 		list_del(&chan->list);
 		kfree(chan);
@@ -1117,7 +1125,6 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 {
 	struct tegra_vi *vi = chan->vi;
 	struct tegra_video_device *vid = dev_get_drvdata(vi->client.host);
-	unsigned long flags = HOST1X_SYNCPT_CLIENT_MANAGED;
 	int ret;
 
 	mutex_init(&chan->video_lock);
@@ -1125,7 +1132,6 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	INIT_LIST_HEAD(&chan->done);
 	spin_lock_init(&chan->start_lock);
 	spin_lock_init(&chan->done_lock);
-	spin_lock_init(&chan->sp_incr_lock);
 	init_waitqueue_head(&chan->start_wait);
 	init_waitqueue_head(&chan->done_wait);
 
@@ -1140,26 +1146,13 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	chan->format.sizeimage = chan->format.bytesperline * TEGRA_DEF_HEIGHT;
 	tegra_channel_fmt_align(chan, &chan->format, chan->fmtinfo->bpp);
 
-	chan->frame_start_sp = host1x_syncpt_request(&vi->client, flags);
-	if (!chan->frame_start_sp) {
-		dev_err(vi->dev, "failed to request frame start syncpoint\n");
-		return -ENOMEM;
-	}
-
-	chan->mw_ack_sp = host1x_syncpt_request(&vi->client, flags);
-	if (!chan->mw_ack_sp) {
-		dev_err(vi->dev, "failed to request memory ack syncpoint\n");
-		ret = -ENOMEM;
-		goto free_fs_syncpt;
-	}
-
 	/* initialize the media entity */
 	chan->pad.flags = MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&chan->video.entity, 1, &chan->pad);
 	if (ret < 0) {
 		dev_err(vi->dev,
 			"failed to initialize media entity: %d\n", ret);
-		goto free_mw_ack_syncpt;
+		return ret;
 	}
 
 	ret = v4l2_ctrl_handler_init(&chan->ctrl_handler, MAX_CID_CONTROLS);
@@ -1175,7 +1168,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	chan->video.release = video_device_release_empty;
 	chan->video.queue = &chan->queue;
 	snprintf(chan->video.name, sizeof(chan->video.name), "%s-%s-%u",
-		 dev_name(vi->dev), "output", chan->portno);
+		 dev_name(vi->dev), "output", chan->portnos[0]);
 	chan->video.vfl_type = VFL_TYPE_VIDEO;
 	chan->video.vfl_dir = VFL_DIR_RX;
 	chan->video.ioctl_ops = &tegra_channel_ioctl_ops;
@@ -1211,10 +1204,6 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	v4l2_ctrl_handler_free(&chan->ctrl_handler);
 cleanup_media:
 	media_entity_cleanup(&chan->video.entity);
-free_mw_ack_syncpt:
-	host1x_syncpt_free(chan->mw_ack_sp);
-free_fs_syncpt:
-	host1x_syncpt_free(chan->frame_start_sp);
 	return ret;
 }
 
@@ -1234,7 +1223,8 @@ static int tegra_vi_channel_alloc(struct tegra_vi *vi, unsigned int port_num,
 		return -ENOMEM;
 
 	chan->vi = vi;
-	chan->portno = port_num;
+	chan->portnos[0] = port_num;
+	chan->numgangports = 1;
 	chan->of_node = node;
 	list_add_tail(&chan->list, &vi->vi_chans);
 
@@ -1312,7 +1302,7 @@ static int tegra_vi_channels_init(struct tegra_vi *vi)
 		if (ret < 0) {
 			dev_err(vi->dev,
 				"failed to initialize channel-%d: %d\n",
-				chan->portno, ret);
+				chan->portnos[0], ret);
 			goto cleanup;
 		}
 	}
@@ -1326,6 +1316,46 @@ static int tegra_vi_channels_init(struct tegra_vi *vi)
 	return ret;
 }
 
+static int tegra_vi_channel_syncpt_init(struct tegra_vi *vi)
+{
+	struct tegra_vi_channel *chan;
+	unsigned long flags = HOST1X_SYNCPT_CLIENT_MANAGED;
+	struct host1x_syncpt *fs_sp;
+	struct host1x_syncpt *mw_sp;
+	int ret, i;
+
+	list_for_each_entry(chan, &vi->vi_chans, list) {
+		for (i = 0; i < chan->numgangports; i++) {
+			fs_sp = host1x_syncpt_request(&vi->client, flags);
+			if (!fs_sp) {
+				dev_err(vi->dev, "failed to request frame start syncpoint\n");
+				ret = -ENOMEM;
+				goto free_syncpts;
+			}
+
+			mw_sp = host1x_syncpt_request(&vi->client, flags);
+			if (!mw_sp) {
+				dev_err(vi->dev, "failed to request memory ack syncpoint\n");
+				ret = -ENOMEM;
+				host1x_syncpt_free(fs_sp);
+				goto free_syncpts;
+			}
+
+			chan->frame_start_sp[i] = fs_sp;
+			chan->mw_ack_sp[i] = mw_sp;
+			spin_lock_init(&chan->sp_incr_lock[i]);
+		}
+	}
+
+	return 0;
+
+free_syncpts:
+	list_for_each_entry_continue_reverse(chan, &vi->vi_chans, list)
+		tegra_channel_host1x_syncpts_free(chan);
+
+	return ret;
+}
+
 void tegra_v4l2_nodes_cleanup_tpg(struct tegra_video_device *vid)
 {
 	struct tegra_vi *vi = vid->vi;
@@ -1576,8 +1606,9 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	struct v4l2_async_subdev *asd;
 	struct v4l2_subdev *subdev;
 	struct tegra_vi_channel *chan;
+	struct tegra_csi_channel *csi_chan;
 	struct tegra_vi *vi;
-	int ret;
+	int ret, i;
 
 	chan = container_of(notifier, struct tegra_vi_channel, notifier);
 	vi = chan->vi;
@@ -1634,6 +1665,15 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 	v4l2_set_subdev_hostdata(subdev, chan);
 
+	/*
+	 * Retrieve number of gang ports from csi channel and add consecutive
+	 * ports to vi channel ports.
+	 */
+	csi_chan = v4l2_get_subdevdata(subdev);
+	chan->numgangports = csi_chan->numgangports;
+	for (i = 1; i < chan->numgangports; i++)
+		chan->portnos[i] = chan->portnos[0] + i * CSI_PORTS_PER_BRICK;
+
 	subdev = tegra_channel_get_remote_source_subdev(chan);
 	v4l2_set_subdev_hostdata(subdev, chan);
 
@@ -1759,7 +1799,8 @@ static int tegra_vi_graph_init(struct tegra_vi *vi)
 	 * next channels.
 	 */
 	list_for_each_entry(chan, &vi->vi_chans, list) {
-		remote = fwnode_graph_get_remote_node(fwnode, chan->portno, 0);
+		remote = fwnode_graph_get_remote_node(fwnode, chan->portnos[0],
+						      0);
 		if (!remote)
 			continue;
 
@@ -1774,7 +1815,7 @@ static int tegra_vi_graph_init(struct tegra_vi *vi)
 		if (ret < 0) {
 			dev_err(vi->dev,
 				"failed to register channel %d notifier: %d\n",
-				chan->portno, ret);
+				chan->portnos[0], ret);
 			v4l2_async_notifier_cleanup(&chan->notifier);
 		}
 	}
@@ -1825,11 +1866,27 @@ static int tegra_vi_init(struct host1x_client *client)
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)) {
 		ret = tegra_vi_graph_init(vi);
 		if (ret < 0)
-			goto free_chans;
+			goto cleanup_chans;
 	}
 
+	/*
+	 * x8 capture uses multiple ports as gang with simultaneous capture
+	 * of left half onto one x4 port and right half onto second x4 port.
+	 * Total ports grouped together as gang is retrieved from CSI subdev
+	 * during graph build.
+	 * So, create host1x syncpts for all ports in a gang after graph init.
+	 */
+	ret = tegra_vi_channel_syncpt_init(vi);
+	if (ret < 0)
+		goto cleanup_graph;
+
 	return 0;
 
+cleanup_graph:
+	tegra_vi_graph_cleanup(vi);
+cleanup_chans:
+	list_for_each_entry(chan, &vi->vi_chans, list)
+		tegra_channel_cleanup(chan);
 free_chans:
 	list_for_each_entry_safe(chan, tmp, &vi->vi_chans, list) {
 		list_del(&chan->list);
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 7d6b7a6..947e641 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -21,6 +21,8 @@
 #include <media/v4l2-subdev.h>
 #include <media/videobuf2-v4l2.h>
 
+#include "csi.h"
+
 #define TEGRA_MIN_WIDTH		32U
 #define TEGRA_MAX_WIDTH		32768U
 #define TEGRA_MIN_HEIGHT	32U
@@ -31,6 +33,7 @@
 #define TEGRA_IMAGE_FORMAT_DEF	32
 
 #define MAX_FORMAT_NUM		64
+#define SURFACE_ALIGN_BYTES	64
 
 enum tegra_vi_pg_mode {
 	TEGRA_VI_PG_DISABLED = 0,
@@ -151,7 +154,8 @@ struct tegra_vi_graph_entity {
  * @done: list of capture done queued buffers
  * @done_lock: protects the capture done queue list
  *
- * @portno: VI channel port number
+ * @portnos: VI channel port numbers
+ * @numgangports: number of ports combined together as a gang for capture
  * @of_node: device node of VI channel
  *
  * @ctrl_handler: V4L2 control handler of this video channel
@@ -168,10 +172,10 @@ struct tegra_vi_channel {
 	struct media_pad pad;
 
 	struct tegra_vi *vi;
-	struct host1x_syncpt *frame_start_sp;
-	struct host1x_syncpt *mw_ack_sp;
+	struct host1x_syncpt *frame_start_sp[GANG_PORTS_MAX];
+	struct host1x_syncpt *mw_ack_sp[GANG_PORTS_MAX];
 	/* protects the cpu syncpoint increment */
-	spinlock_t sp_incr_lock;
+	spinlock_t sp_incr_lock[GANG_PORTS_MAX];
 
 	struct task_struct *kthread_start_capture;
 	wait_queue_head_t start_wait;
@@ -190,7 +194,8 @@ struct tegra_vi_channel {
 	/* protects the capture done queue list */
 	spinlock_t done_lock;
 
-	unsigned char portno;
+	unsigned char portnos[GANG_PORTS_MAX];
+	u8 numgangports;
 	struct device_node *of_node;
 
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -216,7 +221,7 @@ struct tegra_channel_buffer {
 	struct list_head queue;
 	struct tegra_vi_channel *chan;
 	dma_addr_t addr;
-	u32 mw_ack_sp_thresh;
+	u32 mw_ack_sp_thresh[GANG_PORTS_MAX];
 };
 
 /*
-- 
2.7.4

