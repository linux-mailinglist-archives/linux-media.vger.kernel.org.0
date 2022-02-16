Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E954B835A
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 09:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbiBPIuR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 03:50:17 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbiBPIuQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 03:50:16 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A40A2AA3B2
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 00:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645001404; x=1676537404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rrBvVbu61hx4T28nbuzqiGixr90MQOnjrq5iD6VzmK0=;
  b=jPqezsyYVIGOYBnVKrhNDVAOdqYSNXmmtppyi2J9cRAOAYE09XqxJHXP
   txhaGfilThunnYa9nI5tonBGlcSzK7W/URLg2DgJxOGLCbGOwW6IbV/fP
   A6EPol949T9gaS2glyqkEvlSbwByTFytcmf9ADs8K/f/pt1ELED6w9HxD
   NjmdzZMmnh9iDntECD3Slo8HD2yomPXQzAVAbNckQnuDCiXS7if1dPrdH
   7rhXzYInsscvMsbJsVvYwI8aUiLJ3jgMFQDeA0wutRlDkvzcmV8T+JhWQ
   zWDLFw624dCZxwt979XnkhOl84g3bluxsCkKpry3IK4ZXKEhQF45KOKK3
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="230518353"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="230518353"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 00:50:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="544810031"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 00:50:02 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1044120087;
        Wed, 16 Feb 2022 10:49:57 +0200 (EET)
Date:   Wed, 16 Feb 2022 10:49:57 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Shawnx Tu <shawnx.tu@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com
Subject: Re: [PATCH v1] media: Add a driver for the og01a1b camera sensor
Message-ID: <Ygy6tT7eA8mFA0Og@paasikivi.fi.intel.com>
References: <20220215151345.10679-1-shawnx.tu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215151345.10679-1-shawnx.tu@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

On Tue, Feb 15, 2022 at 11:13:45PM +0800, Shawnx Tu wrote:
> From: Shawn Tu <shawnx.tu@intel.com>
> 
> Add a V4L2 sub-device driver for Omnivision og01a1b b&w
> image sensor. This is a camera sensor using the I2C bus
> for control and the CSI-2 bus for data.
> 
> This driver supports following features:
> - manual exposure and analog/digital gain control support
> - vblank/hblank control support
> - test pattern support
> - media controller support
> - runtime PM support
> - support following resolutions:
>   + 1280x1024 at 120FPS
> 
> Signed-off-by: Shawn Tu <shawnx.tu@intel.com>

Thanks for the patch. I'lve applied it with this diff:

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 05538184d95a..87179fc04e00 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -1071,7 +1071,7 @@ static int og01a1b_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor_common(&og01a1b->sd);
+	ret = v4l2_async_register_subdev_sensor(&og01a1b->sd);
 	if (ret < 0) {
 		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
 			ret);

-- 
Kind regards,

Sakari Ailus
