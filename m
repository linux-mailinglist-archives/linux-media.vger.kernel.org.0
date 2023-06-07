Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9799B726D9D
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 22:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234560AbjFGUoK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 16:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234625AbjFGUoI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 16:44:08 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D631BC2
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 13:43:46 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337466161"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="337466161"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 13:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="799532217"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="799532217"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Jun 2023 13:43:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1q6zzn-002019-0P;
        Wed, 07 Jun 2023 23:43:07 +0300
Date:   Wed, 7 Jun 2023 23:43:06 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 10/28] media: ov2680: Store dev instead of i2c_client in
 ov2680_dev
Message-ID: <ZIDr2jkAy8ToqOOo@smile.fi.intel.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-11-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607164712.63579-11-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 07, 2023 at 06:46:54PM +0200, Hans de Goede wrote:
> Now that the cci_* register access helpers are used access to
> the i2c_client after probe() is no longer necessary.

And even if needed can be retrieved from the dev anyway.

> Directly store a struct device *dev pointing to &client->dev inside
> ov2680_dev to make the code simpler.

...

> +static int ov2680_v4l2_register(struct ov2680_dev *sensor, struct i2c_client *client)
>  {
>  	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
>  	struct ov2680_ctrls *ctrls = &sensor->ctrls;
>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
>  	int ret = 0;
>  
> -	v4l2_i2c_subdev_init(&sensor->sd, sensor->i2c_client,
> -			     &ov2680_subdev_ops);
> +	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);

So, not sure if you prefer

	struct i2c_client *client = to_i2c_client(sensor->dev);

here instead of adding a new parameter.

-- 
With Best Regards,
Andy Shevchenko


