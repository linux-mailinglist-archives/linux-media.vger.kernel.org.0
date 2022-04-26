Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8E2C50F388
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 10:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344545AbiDZIV4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 04:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237842AbiDZIVz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 04:21:55 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2282337A8F
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650961129; x=1682497129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=adz2Xj8kuV48kHS7KzL8P5eZQis0L/6fZkgXFulmLVE=;
  b=GyeakDXCcNWBhiWJIrJIS+Xdxb9T4Zhifjyo+EaYAQ7xCS3yAoplqSMq
   SkdmuNtZEcyQk4WgoQeM8d9PvrALEMcpvtgC5FkM3h6EMtHGUqHVYU1Ey
   hBcrFMGZauiWj9sw7qWxeytRiTXnsul9NH0m/yZUj8OLDvbLGoTsZfcFD
   MnzSZPOriwTFfoEYBuUoUQXIIx4vs9/rybZocpmUq6f6ITAWTDptJP1H9
   B6IuyvlkdSO/GmjCVoiCpoqw+thiwA/QHOEaVl7hm7PQ5ilH3SubJvZVX
   eItZWfQ8cH0tYuiOxiB65+yRLD2e2O8MGqucVJYLDKqtHsQrfpGS/gFys
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="290638370"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="290638370"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 01:18:48 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="595647428"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 01:18:47 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 65CF5203C9;
        Tue, 26 Apr 2022 11:18:45 +0300 (EEST)
Date:   Tue, 26 Apr 2022 11:18:45 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: dw9714: Return zero in remove callback
Message-ID: <Ymeq5Q4kVu1yoKFq@paasikivi.fi.intel.com>
References: <20220331133132.296971-1-u.kleine-koenig@pengutronix.de>
 <20220425191345.utl5jz5ajbzeqost@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220425191345.utl5jz5ajbzeqost@pengutronix.de>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Uwe,

On Mon, Apr 25, 2022 at 09:13:45PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Mar 31, 2022 at 03:31:32PM +0200, Uwe Kleine-König wrote:
> > The only effect of returning an error code in an i2c remove callback is
> > that the i2c core emits a generic warning and still removes the device.
> > 
> > So even if disabling the regulator fails it's sensible to further cleanup
> > and then return zero to only emit a single error message.
> > 
> > This patch is a preparation for making i2c remove callbacks return void.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/media/i2c/dw9714.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
> > index cd7008ad8f2f..982ed8afebf5 100644
> > --- a/drivers/media/i2c/dw9714.c
> > +++ b/drivers/media/i2c/dw9714.c
> > @@ -201,7 +201,6 @@ static int dw9714_remove(struct i2c_client *client)
> >  		if (ret) {
> >  			dev_err(&client->dev,
> >  				"Failed to disable vcc: %d\n", ret);
> > -			return ret;
> >  		}
> >  	}
> >  	pm_runtime_set_suspended(&client->dev);
> 
> Who cares for this driver and so for this patch?

I do.

The patch is in the media stage tree now (you should have received an
e-mail about it) from where it eventually gets to the media tree.

-- 
Kind regards,

Sakari Ailus
