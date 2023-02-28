Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413A66A63ED
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 00:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjB1Xzw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 18:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjB1Xzv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 18:55:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2F13028F
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 15:55:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (153.162-64-87.adsl-dyn.isp.belgacom.be [87.64.162.153])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01497890;
        Wed,  1 Mar 2023 00:55:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677628547;
        bh=2CP7rz42i6LnRBbLieW1P9DnIg2zR0mlF5JYBNayOjg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aUwMWqExm+be4It4LHLGKrjOAmLtrF3D4RT+cYV2Ym0CynAk4wOQ0qyQwumJQcxoG
         LtZmr8OfnYmHS8Aa9r9Kd29k1vH8YOc3slN0JClMLzoK90MdR40EbNludmXAhvkrhP
         AdNMsRggkvdzPL6ocwUSoKMFEA5+p+MyJfzW1Mmw=
Date:   Wed, 1 Mar 2023 01:55:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH 1/3] media: Zero-initialize all structures passed to
 subdev pad operations
Message-ID: <Y/6Ugu86FDL0Cv1s@pendragon.ideasonboard.com>
References: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
 <20230215165021.6628-2-laurent.pinchart@ideasonboard.com>
 <Y/3Rz5DRX9DnLe8E@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y/3Rz5DRX9DnLe8E@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Feb 28, 2023 at 12:05:03PM +0200, Sakari Ailus wrote:
> On Wed, Feb 15, 2023 at 06:50:19PM +0200, Laurent Pinchart wrote:
> > Several drivers call subdev pad operations, passing structures that are
> > not fully zeroed. While the drivers initialize the fields they care
> > about explicitly, this results in reserved fields having uninitialized
> > values. Future kernel API changes that make use of those fields thus
> > risk breaking proper driver operation in ways that could be hard to
> > detect.
> > 
> > To avoid this, make the code more robust by zero-initializing all the
> > structures passed to subdev pad operation. Maintain a consistent coding
> > style by preferring designated initializers (which zero-initialize all
> > the fields that are not specified) over memset() where possible, and
> > make variable declarations local to inner scopes where applicable. One
> > notable exception to this rule is in the ipu3 driver, where a memset()
> > is needed as the structure is not a local variable but a function
> > parameter provided by the caller.
> > 
> > Not all fields of those structures can be initialized when declaring the
> > variables, as the values for those fields are computed later in the
> > code. Initialize the 'which' field in all cases, and other fields when
> > the variable declaration is so close to the v4l2_subdev_call() call that
> > it keeps all the context easily visible when reading the code, to avoid
> > hindering readability.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ...
> 
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > index 3b76a9d0383a..3c84cb121632 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > @@ -1305,6 +1305,7 @@ static int cio2_subdev_link_validate_get_format(struct media_pad *pad,
> >  		struct v4l2_subdev *sd =
> >  			media_entity_to_v4l2_subdev(pad->entity);
> >  
> > +		memset(fmt, 0, sizeof(*fmt));
> >  		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
> >  		fmt->pad = pad->index;
> >  		return v4l2_subdev_call(sd, pad, get_fmt, NULL, fmt);
> 
> Instead I'd merge this with its only caller.
> 
> I can submit a patch on top of this one as it's just a small cleanup.

I'd prefer that, to keep this series as little intrusive as possible.

> For the set:
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thank you.

> The second latter of the subject of the 3 patch should be lower case.

-- 
Regards,

Laurent Pinchart
