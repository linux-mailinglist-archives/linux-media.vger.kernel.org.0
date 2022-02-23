Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7D04C134C
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 13:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238951AbiBWMz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 07:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiBWMz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 07:55:56 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A799397B96;
        Wed, 23 Feb 2022 04:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645620928; x=1677156928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yj1iRZc5qHxepJ/WE4+wHca4wPR0DNIu5U+/2LhzzO8=;
  b=ZIdWy6F0QB44ZSTQk+SGyAKYq5e4qFXpuRxw7eHOipFMofnNRNC3B9l1
   SuJHqHR0Fcvy0TRBk1FNyoxrXokvN0NOmDHfHfrosZTplKTGZo/mAkPHL
   2cIkGF3L0oMohyquZUpviIlB9UngQoA4JYE4a1lyqBowcu6SVXg5fI67j
   ODYyQOmp8aONVj5bKoUEJnNyjKsKzzShPDH6Zp4ppfOZwLtLV9uVa9yLI
   r0rwO2IufuF/4X/sm4o5BWFBhj2NRxH13a5E2oD5e2R1eOLbEseDKBohA
   /j3jqV0J0erFfW9lit2r/l0rD5voi6shX3DHRvub0SjKwv497RanbnRyW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="315181123"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="315181123"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 04:55:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="543305210"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 04:55:00 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id AB5FF2028B;
        Wed, 23 Feb 2022 14:54:58 +0200 (EET)
Date:   Wed, 23 Feb 2022 14:54:58 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v10 2/2] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Message-ID: <YhYuogHaHuyVPd2C@paasikivi.fi.intel.com>
References: <20220217154407.2892822-1-m.tretter@pengutronix.de>
 <20220217154407.2892822-3-m.tretter@pengutronix.de>
 <2a2038bc-9f84-c451-deb3-1e807ac2f0d3@xs4all.nl>
 <YhYlnEBAh0QtRXZ0@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhYlnEBAh0QtRXZ0@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Michael,

On Wed, Feb 23, 2022 at 02:16:28PM +0200, Sakari Ailus wrote:
> > > +static int isl7998x_pre_streamon(struct v4l2_subdev *sd, u32 flags)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > > +	struct device *dev = &client->dev;
> > > +
> > > +	if (flags & V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP)
> > > +		return pm_runtime_resume_and_get(dev);
> > > +
> > > +	return 0;
> > 
> > This feels a bit scary: if V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP is NOT
> > set, then pm_runtime_resume_and_get() isn't called, but this function
> > still returns success...
> 
> Good find.
> 
> pm_runtime_resume_and_get() need to be called unconditionally.
> 
> Alternatively, store what was done here, and put the PM use count
> accordingly below. But I see no reason to do that.

But I think the driver is otherwise good to go.

Unless there are objections, I'll drop the check in the pre_streamon()
callback and apply it into my tree.

-- 
Kind regards,

Sakari Ailus
