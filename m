Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8419857DB48
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 09:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234156AbiGVHbu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 03:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234180AbiGVHbk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 03:31:40 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D418097D79
        for <linux-media@vger.kernel.org>; Fri, 22 Jul 2022 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658475099; x=1690011099;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=y2+5JIPW1vWh8eC3Fv1p8RsYRGAqE1s7IyZc/AeaOts=;
  b=WhBqnhf1lhwaRp2RbCKTke6/9+yJqD/yFVmV/FX+OrfQ8apNhkEp0CKX
   YxXoBYPFpUMzKciP/Or5gMfbkkMH68puCNSPeUrKd7TBEUCbaHgm+X9ak
   4muP0UlPPioPmeJf8ir+4r+ZWpEApowm+UZ5iK67LmDr1PH05mGXJCLQE
   nmGgAGnBm7SinT4qUIo9RBxhWYDyszKyBxWai+5vWnsE955UeeolkDlPz
   41ulkvj57+FlcKWkIhkhO2FHy6OwqL/Ah3FXKrGi69zH6xCg1AiUJdypG
   m1fmsH9RdNVVdxuEBZa/gq5AzS5L+KzJSb6BPiffqlOkF8wAntniaWmVn
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="284810702"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; 
   d="scan'208";a="284810702"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2022 00:31:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; 
   d="scan'208";a="657113204"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2022 00:31:38 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id D9B6520359;
        Fri, 22 Jul 2022 10:31:35 +0300 (EEST)
Date:   Fri, 22 Jul 2022 07:31:35 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org
Subject: Re: Re: [PATCH 1/1] media: v4l2-core: v4l2-i2c: Fix default device
 name
Message-ID: <YtpSV5hs1tlmfrj1@paasikivi.fi.intel.com>
References: <20220718120151.425388-1-alexander.stein@ew.tq-group.com>
 <44845826.fMDQidcC6G@steina-w>
 <YtpDp3ahpabQ1ubY@paasikivi.fi.intel.com>
 <4191972.Isy0gbHreE@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4191972.Isy0gbHreE@steina-w>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Fri, Jul 22, 2022 at 09:09:59AM +0200, Alexander Stein wrote:
> Hi Sakari,
> 
> Am Freitag, 22. Juli 2022, 08:28:55 CEST schrieb Sakari Ailus:
> > Hi Alexander,
> > 
> > On Wed, Jul 20, 2022 at 09:54:40AM +0200, Alexander Stein wrote:
> > > Hi Sakari,
> > > 
> > > thanks for the feedback.
> > > 
> > > Am Montag, 18. Juli 2022, 20:39:27 CEST schrieb Sakari Ailus:
> > > > Hi Alexander,
> > > > 
> > > > Thanks for the patch.
> > > > 
> > > > On Mon, Jul 18, 2022 at 02:01:51PM +0200, Alexander Stein wrote:
> > > > > Documentation to v4l2_i2c_subdev_set_name says I²C device name if
> > > > > devname parameter is NULL. But instead the I²C driver name is
> > > > > assigned.
> > > > > Fix this by actually using the i2c_client->name for the subdev name.
> > > > > 
> > > > > Fixes: 0658293012af ("media: v4l: subdev: Add a function to set an I²C
> > > > > sub-device's name") Signed-off-by: Alexander Stein
> > > > > <alexander.stein@ew.tq-group.com>
> > > > > ---
> > > > > Having a sensor node in DT with compatible = "ovti,ov9281" the subdev
> > > > > name is "ov9282" without this patch. With this patch applied it is
> > > > > "ov9281". The i2c_client->name is "ov9281" in every case.
> > > > > 
> > > > >  drivers/media/v4l2-core/v4l2-i2c.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-i2c.c
> > > > > b/drivers/media/v4l2-core/v4l2-i2c.c index b4acca75644b..90c3c799317a
> > > > > 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-i2c.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-i2c.c
> > > > > @@ -33,7 +33,7 @@ void v4l2_i2c_subdev_set_name(struct v4l2_subdev
> > > > > *sd,
> > > > > 
> > > > >  			      const char *devname, const char
> > > 
> > > *postfix)
> > > 
> > > > >  {
> > > > >  
> > > > >  	if (!devname)
> > > > > 
> > > > > -		devname = client->dev.driver->name;
> > > > > +		devname = client->name;
> > > > 
> > > > This would work OF somehow but not on ACPI. At the moment, at least, I
> > > > think this information needs to come from the driver itself.
> > > 
> > > I've not much experience regarding ACPI, nor can I test anything. Which
> > > information from ACPI should be used as devname? AFAICS i2c_acpi_fill_info
> > > need to be modified to set info->type as well. This should fix the ACPI
> > > case.
> > Where would that information come from?
> 
> I don't have experience with ACPI. So you essentially are saying ACPI can't 
> provide this kind of information?

In ACPI devices are associated with drivers by _HID and _CID objects
that are 8-character strings split evenly to vendor and device parts. I.e.
human-readable device names such as in DT aren't available.

-- 
Sakari Ailus
