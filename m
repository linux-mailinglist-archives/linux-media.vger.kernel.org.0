Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBE95789A4
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 20:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbiGRSjd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 14:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbiGRSjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 14:39:31 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7ACE2CDF7
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 11:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658169571; x=1689705571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yeGKLQ+N++cvbrFF38iJ/xk16Rh4E4c7WhZ0gsNMsaU=;
  b=YCzl6T3LBg3BRPT5IWeR00voczbng7Xn6szTY6S4de82+loMP/jJO4Jd
   qcFy0yTKUdzL0sds9Xn9eYbthBxoNBtEjvGlrFl1WNanu7uX4bLq1Z9MS
   mZJmlLnGAkbtEdfMJmBxmT//ztqqzEk6SGzNMNYLBsPrmQ+ZI6rCh036Z
   xz37Gv39wy5127TeVsYkzFB9V4fsWgdUipyvPWPLx4i36+zdiq1eHJL54
   jgUy68FBBMtxCAfjpgOJgEXOmOuU+D9E3dnr8ROXoVnOMtmJvgFQzFUwA
   n4pWAGwx3nxDIWx3j2WZm5Hoz2wLZR2nBq+3vCbscxZaW13l04l5gGbw/
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="347983245"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="347983245"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 11:39:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="686835394"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 11:39:29 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 1775C20462;
        Mon, 18 Jul 2022 21:39:27 +0300 (EEST)
Date:   Mon, 18 Jul 2022 18:39:27 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: v4l2-core: v4l2-i2c: Fix default device name
Message-ID: <YtWo33+6J9DBtG0z@paasikivi.fi.intel.com>
References: <20220718120151.425388-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220718120151.425388-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thanks for the patch.

On Mon, Jul 18, 2022 at 02:01:51PM +0200, Alexander Stein wrote:
> Documentation to v4l2_i2c_subdev_set_name says I²C device name if
> devname parameter is NULL. But instead the I²C driver name is assigned.
> Fix this by actually using the i2c_client->name for the subdev name.
> 
> Fixes: 0658293012af ("media: v4l: subdev: Add a function to set an I²C sub-device's name")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Having a sensor node in DT with compatible = "ovti,ov9281" the subdev
> name is "ov9282" without this patch. With this patch applied it is
> "ov9281". The i2c_client->name is "ov9281" in every case.
> 
>  drivers/media/v4l2-core/v4l2-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-i2c.c b/drivers/media/v4l2-core/v4l2-i2c.c
> index b4acca75644b..90c3c799317a 100644
> --- a/drivers/media/v4l2-core/v4l2-i2c.c
> +++ b/drivers/media/v4l2-core/v4l2-i2c.c
> @@ -33,7 +33,7 @@ void v4l2_i2c_subdev_set_name(struct v4l2_subdev *sd,
>  			      const char *devname, const char *postfix)
>  {
>  	if (!devname)
> -		devname = client->dev.driver->name;
> +		devname = client->name;

This would work OF somehow but not on ACPI. At the moment, at least, I think
this information needs to come from the driver itself.

>  	if (!postfix)
>  		postfix = "";
>  

-- 
Kind regards,

Sakari Ailus
