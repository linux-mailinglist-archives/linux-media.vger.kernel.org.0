Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6F0272569A
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 09:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236306AbjFGH5x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 03:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235470AbjFGH5w (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 03:57:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFBB184
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 00:57:51 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64EEC75B;
        Wed,  7 Jun 2023 09:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686124642;
        bh=EWa0GrDGyeyDBCKLXa0cusvhsTCfPZak7q4RPWSJEkE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UACdPP9ef3316qcnjr7kQRKXMZZalXI0dgTsXcRLzVd0txedm6wGcOlSPTwUOsFU5
         Da67lG5xZGDelKr2JstLPJ2FqEusS3pknhAa+F0monFQkkSu+PjM+X+gKv0NXv2cuB
         lgEZeteSjbpmUrKsRnchBeRw/OA/r9I675GIhRvQ=
Date:   Wed, 7 Jun 2023 09:57:44 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     "G.N. Zhou" <guoniu.zhou@nxp.com>
Cc:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: ov5640: fix low resolution image abnormal issue
Message-ID: <edcjyd3k35h5mbk2t3pqxpj5blrcmxiytce7v5at4u6pntiyoz@3utgqjdbmr3m>
References: <20230518100557.2495843-1-guoniu.zhou@oss.nxp.com>
 <AS8PR04MB9080182A18EB8A338087F419FA53A@AS8PR04MB9080.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB9080182A18EB8A338087F419FA53A@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Guoniu Zhou

On Wed, Jun 07, 2023 at 06:26:22AM +0000, G.N. Zhou wrote:
> Hi ALL,
>
> Is there any comments or update? I will appreciate that if there are any.

You're very right, sorry about the delay

>
> Best Regards
> G.N Zhou
>
>
> > -----Original Message-----
> > From: G.N. Zhou (OSS)
> > Sent: 2023年5月18日 18:01
> > To: linux-media@vger.kernel.org; mchehab@kernel.org;
> > slongerbeam@gmail.com; jacopo@jmondi.org; sakari.ailus@linux.intel.com
> > Cc: laurent.pinchart@ideasonboard.com
> > Subject: [PATCH] media: ov5640: fix low resolution image abnormal issue
> >
> > From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> >
> > OV5640 will output abnormal image data when work at low resolution (320x240,
> > 176x144 and 160x120) after switching from high resolution, such as 1080P, the
> > time interval between high and low switching must be less than 1000ms in order
> > to OV5640 don't enter suspend state during the time.
> >

Thanks for finding this out, I presume it took quite some effort to
dig that register out.

However I don't have the register documented anywhere. Do you ?

> > The reason is by 0x3824 value don't restore to initialize value when do resolution
> > switching. In high resolution setting array, 0x3824 is set to 0x04, but low

Why I do see:
ov5640_setting_QSXGA_2592_1944[] = { ... {0x3824, 0x02, 0, 0},.. };

Have you tested switching to full-resolution mode to a lower
resolution ?

> > resolution setting array remove 0x3824 in commit db15c1957a2d ("media:
> > ov5640: Remove duplicated mode settings"). So when do resolution switching
> > from high to low, such as 1080P to 320x240, and the time interval is less than
> > auto suspend delay time which means global initialize setting array will not be
> > loaded, the output image data are abnormal.
> >

Ok, this was possibily either a micro-optimization or a plain mistake
as I do see in commit db15c1957a2d the ov5640_setting_low_res[] array
being introduced, but compared to the register tables it replaces it
is missing:

        {0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
        {0x3824, 0x02, 0, 0}

These registers are already programmed with these values by
ov5640_init_setting[], that might be the reason I left them out from
ov5640_setting_low_res[].

But as you have correctly noticed, switching between modes doesn't go
through ov5640_init_setting[] (of course) so I can only conclude the
above register should all be re-introduced in
ov5640_setting_low_res[]. What do you think ?

Thanks again!


> > Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c index
> > 1536649b9e90..b1a4565fdc0f 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -634,7 +634,7 @@ static const struct reg_value ov5640_setting_low_res[]
> > = {
> >  	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
> >  	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
> >  	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> > -	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
> > +	{0x4407, 0x04, 0, 0}, {0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> >  };
> >
> >  static const struct reg_value ov5640_setting_720P_1280_720[] = {
> > --
> > 2.37.1
>
