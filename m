Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C89A457DA44
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 08:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbiGVG3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 02:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiGVG3A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 02:29:00 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F02886C24
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 23:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658471339; x=1690007339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=W4bX0Lij7bid4a0KJp8DZEp8fFhpDaCHa0xc8GKDNLw=;
  b=f35H4Y1EiMT9Oqu71QNN1S3tngMuJn8YHwdScGMRAhpzPbBNTvnhsNZM
   zF3oM4vqPYwev2yvtuDN/cJYbbDmrARhP96wnkLL7MvO6oqi4xJ8bToN4
   wit0oPDFD5GK/CN4miuOECmlxVjcxHqFc4GFjxFxJVtGLHnB9FWZtqFFB
   6n+ksfuL+U5mEuneVuRcNig9ql3THAVofGDlyO+4woPFf1g+luWjoh7aQ
   nMOsSfoUlL7RfWtixxRzOVPtSxhh0ltHhDRnrrybd9kmE3ClVu6p2dnrf
   z/BDIP1j4SHjPo0JCzKop8uJf78gqRG81PCwcZaJ6AHqUmskzmJL5oRGi
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="270282004"
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="270282004"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 23:28:59 -0700
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="595869568"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 23:28:58 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id F083C20282;
        Fri, 22 Jul 2022 09:28:55 +0300 (EEST)
Date:   Fri, 22 Jul 2022 06:28:55 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org
Subject: Re: Re: [PATCH 1/1] media: v4l2-core: v4l2-i2c: Fix default device
 name
Message-ID: <YtpDp3ahpabQ1ubY@paasikivi.fi.intel.com>
References: <20220718120151.425388-1-alexander.stein@ew.tq-group.com>
 <YtWo33+6J9DBtG0z@paasikivi.fi.intel.com>
 <44845826.fMDQidcC6G@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44845826.fMDQidcC6G@steina-w>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Wed, Jul 20, 2022 at 09:54:40AM +0200, Alexander Stein wrote:
> Hi Sakari,
> 
> thanks for the feedback.
> 
> Am Montag, 18. Juli 2022, 20:39:27 CEST schrieb Sakari Ailus:
> > Hi Alexander,
> > 
> > Thanks for the patch.
> > 
> > On Mon, Jul 18, 2022 at 02:01:51PM +0200, Alexander Stein wrote:
> > > Documentation to v4l2_i2c_subdev_set_name says I²C device name if
> > > devname parameter is NULL. But instead the I²C driver name is assigned.
> > > Fix this by actually using the i2c_client->name for the subdev name.
> > > 
> > > Fixes: 0658293012af ("media: v4l: subdev: Add a function to set an I²C
> > > sub-device's name") Signed-off-by: Alexander Stein
> > > <alexander.stein@ew.tq-group.com>
> > > ---
> > > Having a sensor node in DT with compatible = "ovti,ov9281" the subdev
> > > name is "ov9282" without this patch. With this patch applied it is
> > > "ov9281". The i2c_client->name is "ov9281" in every case.
> > > 
> > >  drivers/media/v4l2-core/v4l2-i2c.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-i2c.c
> > > b/drivers/media/v4l2-core/v4l2-i2c.c index b4acca75644b..90c3c799317a
> > > 100644
> > > --- a/drivers/media/v4l2-core/v4l2-i2c.c
> > > +++ b/drivers/media/v4l2-core/v4l2-i2c.c
> > > @@ -33,7 +33,7 @@ void v4l2_i2c_subdev_set_name(struct v4l2_subdev *sd,
> > > 
> > >  			      const char *devname, const char 
> *postfix)
> > >  
> > >  {
> > >  
> > >  	if (!devname)
> > > 
> > > -		devname = client->dev.driver->name;
> > > +		devname = client->name;
> > 
> > This would work OF somehow but not on ACPI. At the moment, at least, I think
> > this information needs to come from the driver itself.
> 
> I've not much experience regarding ACPI, nor can I test anything. Which 
> information from ACPI should be used as devname? AFAICS i2c_acpi_fill_info 
> need to be modified to set info->type as well. This should fix the ACPI case.

Where would that information come from?

> 
> Nevertheless currently either the documentation or the implementation needs a 
> fix, they don't match. You can also opt to driver name in case client->name is 
> empty. Is this acceptable?

How would you "fix" it? It currently uses the driver name unless the driver
set the name for the device. This works reasonably well in all cases.

-- 
Regards,

Sakari Ailus
