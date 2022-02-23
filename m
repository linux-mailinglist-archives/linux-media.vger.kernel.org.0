Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA614C153F
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 15:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241485AbiBWOSw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 09:18:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234631AbiBWOSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 09:18:51 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED66B0D0D;
        Wed, 23 Feb 2022 06:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645625904; x=1677161904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=crq1RQf8JYsNnbTFUCounwd1wHEYciMzKMAUGyE7U0E=;
  b=nOam0reJjskYH6zRei5Ip4EGifKszNTAJXCBily/TCgZdd2CdipzgDed
   ZlZEr6BNAXaC75gN1m8cei/yU8DPHJbLe/mOzmg279G/20CPRfYDQ+Cyh
   3XkXJ6Pj0jOn0fR1ubtoU6AM55b0CIe3V8kZ8iRNXkJpKYwJ3pqAt1smd
   Fdy1XMnbsRo6ew5XrlrfjOPgcJrL0eEmBiVwf976usNOTnRFhyz7Nvrs0
   V0viGlZOuWs/GPxmzuN9p8eIMpDolLYDK9EActvYQ6HpZ90LbQi9alWyY
   nZnzmPjQFcMfaSO0KYd7OgSxwMTTgcvcyTZ6v+8KkSY7LTBcGRAzdIp1n
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="276591593"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="276591593"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:18:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="548266192"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 06:18:21 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E6E1C201C2;
        Wed, 23 Feb 2022 16:18:18 +0200 (EET)
Date:   Wed, 23 Feb 2022 16:18:18 +0200
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
Message-ID: <YhZCKsiUgyh3HodU@paasikivi.fi.intel.com>
References: <20220217154407.2892822-1-m.tretter@pengutronix.de>
 <20220217154407.2892822-3-m.tretter@pengutronix.de>
 <2a2038bc-9f84-c451-deb3-1e807ac2f0d3@xs4all.nl>
 <YhYlnEBAh0QtRXZ0@paasikivi.fi.intel.com>
 <YhYuogHaHuyVPd2C@paasikivi.fi.intel.com>
 <2c0b387c-d636-bc0c-74b1-f1eba3d89254@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c0b387c-d636-bc0c-74b1-f1eba3d89254@xs4all.nl>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 23, 2022 at 02:04:48PM +0100, Hans Verkuil wrote:
> On 2/23/22 13:54, Sakari Ailus wrote:
> > Hi Hans, Michael,
> > 
> > On Wed, Feb 23, 2022 at 02:16:28PM +0200, Sakari Ailus wrote:
> >>>> +static int isl7998x_pre_streamon(struct v4l2_subdev *sd, u32 flags)
> >>>> +{
> >>>> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> >>>> +	struct device *dev = &client->dev;
> >>>> +
> >>>> +	if (flags & V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP)
> >>>> +		return pm_runtime_resume_and_get(dev);
> >>>> +
> >>>> +	return 0;
> >>>
> >>> This feels a bit scary: if V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP is NOT
> >>> set, then pm_runtime_resume_and_get() isn't called, but this function
> >>> still returns success...
> >>
> >> Good find.
> >>
> >> pm_runtime_resume_and_get() need to be called unconditionally.
> >>
> >> Alternatively, store what was done here, and put the PM use count
> >> accordingly below. But I see no reason to do that.
> > 
> > But I think the driver is otherwise good to go.
> > 
> > Unless there are objections, I'll drop the check in the pre_streamon()
> > callback and apply it into my tree.
> > 
> 
> OK, with that change you can add my:
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> to this patch. I'll delegate the series to you in patchwork.

Thanks!

-- 
Sakari Ailus
