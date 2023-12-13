Return-Path: <linux-media+bounces-2311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EA5810DB4
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 10:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0E30B20C88
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 09:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639A9219E1;
	Wed, 13 Dec 2023 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QL+ePHGN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A2E101
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 01:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702461095; x=1733997095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/KrpMOD6NuWUXxEdrOJ73fnsdSfxkkwu4IU25Fw/CYE=;
  b=QL+ePHGNs4K8UJj8Lcgxa1Q5c9Z5ZvcDq8ag1I10hBoGnmyEKzk0xTHB
   Hof0t9OdzszroFEG78E1XA5GSPI4NxOT2EavnnTr2VtV6RxLAkELFZgQP
   MC8nK8Xf8OjM/WeFVHVPmtN5eloL6/FG01qkg1pW7jE9ozVaDdP8wxdds
   p3owF5SkUZStiCEell0kCTupbUDIkYK81dgfR6PhD0zqBkK0d+eFH6b/h
   pjBwZ4T4b67hS3MqFaBAryWqAXbJwiHQh1UUGINWM79FscKMLlGHmwfC6
   5cYl5HnRoTQES45XjPlxIgK8keiJ8A0xXf/Q1H75fWcoWN3NOwoGGFC7l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1753755"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="1753755"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 01:51:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917605456"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="917605456"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 01:51:32 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 00F5811F7E4;
	Wed, 13 Dec 2023 11:51:30 +0200 (EET)
Date: Wed, 13 Dec 2023 09:51:29 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Cao, Bingbu" <bingbu.cao@intel.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 3/4] media: imx319: Use v4l2_link_frequencies_to_bitmap
 helper
Message-ID: <ZXl-obqJfltIgOqC@kekkonen.localdomain>
References: <20231211140658.366268-1-sakari.ailus@linux.intel.com>
 <20231211140658.366268-4-sakari.ailus@linux.intel.com>
 <DM8PR11MB5653BF1531D11FF180CA5EB4998DA@DM8PR11MB5653.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB5653BF1531D11FF180CA5EB4998DA@DM8PR11MB5653.namprd11.prod.outlook.com>

Hi Bingbu,

On Wed, Dec 13, 2023 at 02:16:31AM +0000, Cao, Bingbu wrote:
> Sakari, 
> 
> Thanks for the patch.
> 
> ------------------------------------------------------------------------
> BRs,  
> Bingbu Cao 
> 
> >-----Original Message-----
> >From: Sakari Ailus <sakari.ailus@linux.intel.com>
> >Sent: Monday, December 11, 2023 10:07 PM
> >To: linux-media@vger.kernel.org
> >Cc: laurent.pinchart@ideasonboard.com; jacopo.mondi@ideasonboard.com; Cao,
> >Bingbu <bingbu.cao@intel.com>; Qiu, Tian Shu <tian.shu.qiu@intel.com>; Hans
> >Verkuil <hverkuil-cisco@xs4all.nl>
> >Subject: [PATCH 3/4] media: imx319: Use v4l2_link_frequencies_to_bitmap
> >helper
> >
> >Use the v4l2_link_frequencies_to_bitmap() helper to figure out which
> >driver-supported link frequencies can be used on a given system.
> >
> >Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >---
> > drivers/media/i2c/imx319.c | 53 ++++++++++----------------------------
> > 1 file changed, 14 insertions(+), 39 deletions(-)
> >
> >diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c index
> >e47eff672e0c..3fdda6f7d01a 100644
> >--- a/drivers/media/i2c/imx319.c
> >+++ b/drivers/media/i2c/imx319.c
> >@@ -70,7 +70,7 @@
> > #define IMX319_REG_ORIENTATION		0x0101
> >
> > /* default link frequency and external clock */
> >-#define IMX319_LINK_FREQ_DEFAULT	482400000
> >+#define IMX319_LINK_FREQ_DEFAULT	482400000LL
> > #define IMX319_EXT_CLK			19200000
> > #define IMX319_LINK_FREQ_INDEX		0
> >
> >@@ -107,8 +107,7 @@ struct imx319_mode {
> >
> > struct imx319_hwcfg {
> > 	u32 ext_clk;			/* sensor external clk */
> >-	s64 *link_freqs;		/* CSI-2 link frequencies */
> >-	unsigned int nr_of_link_freqs;
> >+	unsigned long link_freq_bitmap;
> > };
> >
> > struct imx319 {
> >@@ -129,7 +128,6 @@ struct imx319 {
> > 	const struct imx319_mode *cur_mode;
> >
> > 	struct imx319_hwcfg *hwcfg;
> >-	s64 link_def_freq;	/* CSI-2 link default frequency */
> >
> > 	/*
> > 	 * Mutex for serialized access:
> >@@ -1654,7 +1652,10 @@ static const char * const imx319_test_pattern_menu[]
> >= {
> > 	"Pseudorandom Sequence (PN9)",
> > };
> >
> >-/* supported link frequencies */
> >+/*
> >+ * When adding more than the one below, make sure the disallowed ones
> >+will
> >+ * actually be disabled in the LINK_FREQ control.
> >+ */
> > static const s64 link_freq_menu_items[] = {
> > 	IMX319_LINK_FREQ_DEFAULT,
> > };
> >@@ -2058,7 +2059,7 @@ imx319_set_pad_format(struct v4l2_subdev *sd,
> > 		*framefmt = fmt->format;
> > 	} else {
> > 		imx319->cur_mode = mode;
> >-		pixel_rate = imx319->link_def_freq * 2 * 4;
> >+		pixel_rate = IMX319_LINK_FREQ_DEFAULT * 2 * 4;
> > 		do_div(pixel_rate, 10);
> > 		__v4l2_ctrl_s_ctrl_int64(imx319->pixel_rate, pixel_rate);
> > 		/* Update limits and set FPS to default */ @@ -2255,7 +2256,7
> >@@ static int imx319_init_controls(struct imx319 *imx319)
> > 		imx319->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> > 	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> >-	pixel_rate = imx319->link_def_freq * 2 * 4;
> >+	pixel_rate = IMX319_LINK_FREQ_DEFAULT * 2 * 4;
> > 	do_div(pixel_rate, 10);
> > 	/* By default, PIXEL_RATE is read only */
> > 	imx319->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops,
> >@@ -2332,7 +2333,6 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct
> >device *dev)
> > 	};
> > 	struct fwnode_handle *ep;
> > 	struct fwnode_handle *fwnode = dev_fwnode(dev);
> >-	unsigned int i;
> > 	int ret;
> >
> > 	if (!fwnode)
> >@@ -2364,24 +2364,14 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct
> >device *dev)
> > 		goto out_err;
> > 	}
> >
> >-	dev_dbg(dev, "num of link freqs: %d",
> >bus_cfg.nr_of_link_frequencies);
> >-	if (!bus_cfg.nr_of_link_frequencies) {
> >-		dev_warn(dev, "no link frequencies defined");
> >-		goto out_err;
> >-	}
> >-
> >-	cfg->nr_of_link_freqs = bus_cfg.nr_of_link_frequencies;
> >-	cfg->link_freqs = devm_kcalloc(dev,
> >-				       bus_cfg.nr_of_link_frequencies + 1,
> >-				       sizeof(*cfg->link_freqs), GFP_KERNEL);
> >-	if (!cfg->link_freqs)
> >+	ret = v4l2_link_frequencies_to_bitmap(dev, bus_cfg.link_frequencies,
> >+					      bus_cfg.nr_of_link_frequencies,
> >+					      link_freq_menu_items,
> >+					      ARRAY_SIZE(link_freq_menu_items),
> >+					      &cfg->link_freq_bitmap);
> >+	if (ret)
> > 		goto out_err;
> >
> >-	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> >-		cfg->link_freqs[i] = bus_cfg.link_frequencies[i];
> >-		dev_dbg(dev, "link_freq[%d] = %lld", i, cfg->link_freqs[i]);
> >-	}
> >-
> > 	v4l2_fwnode_endpoint_free(&bus_cfg);
> > 	fwnode_handle_put(ep);
> > 	return cfg;
> >@@ -2397,7 +2387,6 @@ static int imx319_probe(struct i2c_client *client)
> > 	struct imx319 *imx319;
> > 	bool full_power;
> > 	int ret;
> >-	u32 i;
> >
> > 	imx319 = devm_kzalloc(&client->dev, sizeof(*imx319), GFP_KERNEL);
> > 	if (!imx319)
> >@@ -2425,20 +2414,6 @@ static int imx319_probe(struct i2c_client *client)
> > 		goto error_probe;
> > 	}
> >
> >-	imx319->link_def_freq = link_freq_menu_items[IMX319_LINK_FREQ_INDEX];
> >-	for (i = 0; i < imx319->hwcfg->nr_of_link_freqs; i++) {
> >-		if (imx319->hwcfg->link_freqs[i] == imx319->link_def_freq) {
> >-			dev_dbg(&client->dev, "link freq index %d matched", i);
> >-			break;
> >-		}
> >-	}
> >-
> >-	if (i == imx319->hwcfg->nr_of_link_freqs) {
> >-		dev_err(&client->dev, "no link frequency supported");
> >-		ret = -EINVAL;
> >-		goto error_probe;
> >-	}
> >-
> 
> Do we also need change the link frequency ctrl *max* value once we get
> The bitmap?

The driver supports a single value, so in this case not. We also have a
mask of supported values so min and max are less critical. It would
actually be good to have a helper to set up the control correctly, too.
Unfortunately the function creating the control doesn't take a mask as
argument.

-- 
Sakari Ailus

