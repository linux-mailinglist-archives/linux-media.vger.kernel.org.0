Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69DFF8B1E9
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 09:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbfHMH7p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 03:59:45 -0400
Received: from mga05.intel.com ([192.55.52.43]:53078 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727451AbfHMH7o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 03:59:44 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 00:59:44 -0700
X-IronPort-AV: E=Sophos;i="5.64,380,1559545200"; 
   d="scan'208";a="170323126"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 00:59:43 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 6D6942076C; Tue, 13 Aug 2019 10:58:34 +0300 (EEST)
Date:   Tue, 13 Aug 2019 10:58:34 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Shawnx Tu <shawnx.tu@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com
Subject: Re: [PATCH v2] ov5675: Add support for OV5675 sensor
Message-ID: <20190813075834.GB5329@paasikivi.fi.intel.com>
References: <1565172476-3487-1-git-send-email-shawnx.tu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565172476-3487-1-git-send-email-shawnx.tu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

On Wed, Aug 07, 2019 at 06:07:56PM +0800, Shawnx Tu wrote:
> From: Shawn Tu <shawnx.tu@intel.com>
> 
> Add a V4L2 sub-device driver for Omnivision ov5675 image sensor.
> This is a camera sensor using the I2C bus for control and the
> CSI-2 bus for data.
> 
> This driver supports following features:
> - manual exposure and analog/digital gain control support
> - vblank/hblank control support
> - test pattern support
> - media controller support
> - runtime PM support
> - support following resolutions:
>   + 2592x1944 at 30FPS
>   + 1296x972  at 30FPS
> 
> Signed-off-by: Shawn Tu <shawnx.tu@intel.com>

Applied, with the following diff (was over 80 characters per line):

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index a35b9fb8b908..81593aebf262 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -646,7 +646,8 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		ret = ov5675_write_reg(ov5675, OV5675_REG_VTS,
 				       OV5675_REG_VALUE_16BIT,
-				       ov5675->cur_mode->height + ctrl->val + 10);
+				       ov5675->cur_mode->height + ctrl->val +
+				       10);
 		break;
 
 	case V4L2_CID_TEST_PATTERN:
@@ -710,7 +711,8 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
 			  OV5675_DGTL_GAIN_MIN, OV5675_DGTL_GAIN_MAX,
 			  OV5675_DGTL_GAIN_STEP, OV5675_DGTL_GAIN_DEFAULT);
-	exposure_max = (ov5675->cur_mode->vts_def - OV5675_EXPOSURE_MAX_MARGIN)/2;
+	exposure_max = (ov5675->cur_mode->vts_def -
+			OV5675_EXPOSURE_MAX_MARGIN) / 2;
 	ov5675->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     OV5675_EXPOSURE_MIN, exposure_max,


-- 
Sakari Ailus
sakari.ailus@linux.intel.com
