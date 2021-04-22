Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3CF367F3E
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 13:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235863AbhDVLGY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 07:06:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60122 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbhDVLGX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 07:06:23 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lZX9U-0007S9-MP; Thu, 22 Apr 2021 11:05:44 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: remove redundant initializations of several variables
Date:   Thu, 22 Apr 2021 12:05:44 +0100
Message-Id: <20210422110544.244609-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Several variables are being initialized with values that is never
read and being updated later with a new value. The initializations
are redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c        | 2 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c        | 2 +-
 drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 2 +-
 drivers/staging/media/atomisp/pci/sh_css.c                | 4 ++--
 drivers/staging/media/atomisp/pci/sh_css_params.c         | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 78147ffb6099..f1ab7a0cab32 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -548,7 +548,7 @@ static int is_init;
 
 static int power_ctrl(struct v4l2_subdev *sd, bool flag)
 {
-	int ret = -1;
+	int ret;
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 
 	if (!dev || !dev->platform_data)
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 1209492c1826..17af178cd54c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -673,7 +673,7 @@ static int power_ctrl(struct v4l2_subdev *sd, bool flag)
 static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
 {
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
-	int ret = -1;
+	int ret;
 
 	if (!dev || !dev->platform_data)
 		return -ENODEV;
diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
index e698b63d6cb7..769dc122f266 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
@@ -932,7 +932,7 @@ static int ov5693_q_exposure(struct v4l2_subdev *sd, s32 *value)
 static int ad5823_t_focus_vcm(struct v4l2_subdev *sd, u16 val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = -EINVAL;
+	int ret;
 	u8 vcm_code;
 
 	ret = ad5823_i2c_read(client, AD5823_REG_VCM_CODE_MSB, &vcm_code);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 27dd8ce8ba0a..f6edb6171612 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -6259,7 +6259,7 @@ allocate_delay_frames(struct ia_css_pipe *pipe) {
 	unsigned int dvs_frame_delay = 0;
 	struct ia_css_frame_info ref_info;
 	int err = 0;
-	enum ia_css_pipe_id mode = IA_CSS_PIPE_ID_VIDEO;
+	enum ia_css_pipe_id mode;
 	struct ia_css_frame **delay_frames = NULL;
 
 	IA_CSS_ENTER_PRIVATE("");
@@ -8764,7 +8764,7 @@ int
 ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 			    const struct ia_css_pipe_extra_config *extra_config,
 			    struct ia_css_pipe **pipe) {
-	int err = -EINVAL;
+	int err;
 	struct ia_css_pipe *internal_pipe = NULL;
 	unsigned int i;
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 644e14575987..470a7af68ac1 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -3225,7 +3225,7 @@ sh_css_param_update_isp_params(struct ia_css_pipe *curr_pipe,
 	int err = 0;
 	ia_css_ptr cpy;
 	int i;
-	unsigned int raw_bit_depth = 10;
+	unsigned int raw_bit_depth;
 	unsigned int isp_pipe_version = SH_CSS_ISP_PIPE_VERSION_1;
 	bool acc_cluster_params_changed = false;
 	unsigned int thread_id, pipe_num;
-- 
2.30.2

