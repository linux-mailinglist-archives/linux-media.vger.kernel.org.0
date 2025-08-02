Return-Path: <linux-media+bounces-38767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97250B18C7A
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06A091894C8F
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A7A271444;
	Sat,  2 Aug 2025 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bO9ZV45x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4612B27054A;
	Sat,  2 Aug 2025 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754126894; cv=none; b=TvxGUxuasdTd+2EuJLDmS4hvruxgSXZDVldHYQY+Z7QLiIaSYaWGNvnXJFfRoT9WC1QrsEO/U2kH584F68OjJzIV5ElTvMQce2O9Y813g4KtHfbxANMFZr9ryd+xUoPx8EzRwltniqzKwRGir41AnQJ8d32ilrKpbNK3E/XbUA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754126894; c=relaxed/simple;
	bh=50vYXEGhZeTzddTpY4VW3qqWt6o/oRzLVr9heRBb344=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=How0PajXaVLeqqpYvuskaVUjk461sTzdrdocWgKFXjqmbwHUqOtBrnD0bZ+xADMgIDSRdvgTNHQU8AU2HLVuhooXflUXoK81JOlZ3S2+vY5k+qPRTTZcFR9RN+RSdkI6MWiPtWppHKG14jmQLsHa2BzzVgvYGMCtwXEqVPDo3Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bO9ZV45x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE6443B8B;
	Sat,  2 Aug 2025 11:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754126845;
	bh=50vYXEGhZeTzddTpY4VW3qqWt6o/oRzLVr9heRBb344=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bO9ZV45xEGgF6pwv4xOp/UHbDpRuyn3tsM5Ps8cKLkUxOwstVyEmE52BbRzyaxnPi
	 RejLuvxRjfRvLuJdJHjNNrN9exsHVyD1VwXr3a55aLgI0Cc7LVsjh6E6VonxeaDjK6
	 ZFCSwB7kkcd7rfn+xRvUFNpPtTnXo2hQg3lcZ0EU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:22:50 +0200
Subject: [PATCH 28/65] media: v4l2-ioctl: Access v4l2_fh from private_data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-28-eb140ddd6a9d@ideasonboard.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
In-Reply-To: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Christian Gromm <christian.gromm@microchip.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>, 
 Zhou Peng <eagle.zhou@nxp.com>, 
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, 
 Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Corentin Labbe <clabbe@baylibre.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-tegra@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6102;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=50vYXEGhZeTzddTpY4VW3qqWt6o/oRzLVr9heRBb344=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj6BS2OkLRIRXzaVdf/zNJM4Q4XKjnvniijd
 fboQzcTYIyJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y+gAKCRByNAaPFqFW
 PFmQD/wOSAarhR1JioG20KiYPWKE7F1VDzwex19iOgZ3opz7/FURvUVDym7b666cyh2qCgiZgwH
 UptIgDpZRKRd949B8/ze4g0rQq9lEcIFAoTG6ELQzVXKlE4Xo1A1AywpEIuSDOqss2HguWiclXD
 xlkbmtDShmuRY8o79e9VNxhlDzDuYGgkXYcwTWTuYiKYmp1/x9HQq8XxdkJmIsB4jlkVIxsv+En
 Vys4x++KRGGfLo8TcaE48yyO7w/avATN3ZsZhHaEJ32Kp/0USpuNsgrNSrrH4BOvF88Ut3gVBVS
 6wrvQqkiePkw95y4c7bN6bCoWdAsWxEvV91DhkHXO1q8K3q8hISLyJc8HKtlCruwfZmJJg44jQo
 T5ClGMTBO0xYbiL2e+Y/5zdGRR31dIKoS6ptm3CvqlQ/CbrguuS/Rfz/4Tb/36mMr/+fe9AyuZu
 x9BchltjTcciuZHQChHl+P+qI7bQTTo9EZJgoIw+xWyffKaCxVvRJGPuWtGslIb+dqcqJGY4f8q
 8o42ieKDM8ILzrxk+neDKYp2tkMbesSWcUwpwP3kG084u+8ei9qJCbrkg1qBrLBgxloK9IuPKE0
 yvbsJLuB1QptIUH2eYuA9guw/0Lr5vX6S9RUldh4Ki7dAAt7pk3mVT4S6neF9Fmhq5AlYtN/4Kr
 CkVxUsTH44vt4mg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Now that it is guaranteed that file->private_data is set to point to the
'struct v4l2_fh' initialised by v4l2_fh_add() the v4l2-ioctl layer can
be modified to retrieve the v4l2_fh pointer from the file *.

As the __video_do_ioctl() function, that calls all the handlers modified
by this patch goes as:

static long __video_do_ioctl(struct file *file,
		unsigned int cmd, void *arg)
{
	void *fh = file->private_data;

	...

	ret = info->func(ops, file, fh, arg);

}

This patch introduces no functional changes and makes it possible to
remove in future the 'fh' argument to all ioctl handlers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 46 ++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 8c81852c30466865eca36fd41923f6d05dbf9293..44c2f5ef3dae407d9786c5278d13efc982be2ff0 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2297,8 +2297,8 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_query_ext_ctrl qec = {};
 	struct v4l2_queryctrl *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ?
+			      file_to_v4l2_fh(file) : NULL;
 	int ret;
 
 	if (vfh && vfh->ctrl_handler)
@@ -2322,8 +2322,8 @@ static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_query_ext_ctrl *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ?
+			      file_to_v4l2_fh(file) : NULL;
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_query_ext_ctrl(vfh->ctrl_handler, p);
@@ -2339,8 +2339,8 @@ static int v4l_querymenu(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_querymenu *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ?
+			      file_to_v4l2_fh(file) : NULL;
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_querymenu(vfh->ctrl_handler, p);
@@ -2356,8 +2356,8 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_control *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ?
+			      file_to_v4l2_fh(file) : NULL;
 	struct v4l2_ext_controls ctrls;
 	struct v4l2_ext_control ctrl;
 
@@ -2388,8 +2388,8 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_control *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ?
+			      file_to_v4l2_fh(file) : NULL;
 	struct v4l2_ext_controls ctrls;
 	struct v4l2_ext_control ctrl;
 	int ret;
@@ -2418,8 +2418,8 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_ext_controls *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ?
+			      file_to_v4l2_fh(file) : NULL;
 
 	p->error_idx = p->count;
 	if (vfh && vfh->ctrl_handler)
@@ -2439,8 +2439,8 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_ext_controls *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ?
+			      file_to_v4l2_fh(file) : NULL;
 
 	p->error_idx = p->count;
 	if (vfh && vfh->ctrl_handler)
@@ -2460,8 +2460,8 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_ext_controls *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ?
+			      file_to_v4l2_fh(file) : NULL;
 
 	p->error_idx = p->count;
 	if (vfh && vfh->ctrl_handler)
@@ -2756,19 +2756,25 @@ static int v4l_dbg_g_chip_info(const struct v4l2_ioctl_ops *ops,
 static int v4l_dqevent(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
-	return v4l2_event_dequeue(fh, arg, file->f_flags & O_NONBLOCK);
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
+
+	return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
 }
 
 static int v4l_subscribe_event(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
-	return ops->vidioc_subscribe_event(fh, arg);
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
+
+	return ops->vidioc_subscribe_event(vfh, arg);
 }
 
 static int v4l_unsubscribe_event(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
-	return ops->vidioc_unsubscribe_event(fh, arg);
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
+
+	return ops->vidioc_unsubscribe_event(vfh, arg);
 }
 
 static int v4l_g_sliced_vbi_cap(const struct v4l2_ioctl_ops *ops,
@@ -3072,7 +3078,7 @@ static long __video_do_ioctl(struct file *file,
 	bool write_only = false;
 	struct v4l2_ioctl_info default_info;
 	const struct v4l2_ioctl_info *info;
-	void *fh = file->private_data;
+	void *fh = file_to_v4l2_fh(file);
 	struct v4l2_fh *vfh = NULL;
 	int dev_debug = vfd->dev_debug;
 	long ret = -ENOTTY;

-- 
2.49.0


