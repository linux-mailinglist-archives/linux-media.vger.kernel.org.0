Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B44F7405EE
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 23:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjF0Vt5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 17:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbjF0Vt4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 17:49:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC47410F
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 14:49:55 -0700 (PDT)
Received: from ideasonboard.com (85-160-38-115.reb.o2.cz [85.160.38.115])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09C00556;
        Tue, 27 Jun 2023 23:49:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687902554;
        bh=5Lwrra0zPL04jEYuKARSs/ReVZgriRenb5PtAEGQtcg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g4/X+lh46ma0Nd9A0fl/M7Fv8nR4y6Zo/EM92bAWvSiq//J/ycD5gLkoTkSxGpF53
         ooLDlwVV6ZbDyl4lEukHhwZlC5NySE9c9IgsM3htULiDBl2FkUlE2l2QDwzW4QKbZm
         dgfscXCfVN5Pt9l6qpk4nBChtMOFun/V43GByF2M=
Date:   Tue, 27 Jun 2023 23:49:50 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 07/29] media: ov2680: Fix ov2680_set_fmt() which ==
 V4L2_SUBDEV_FORMAT_TRY not working
Message-ID: <wsgfyyvxj3cphyk5ym6xztmr65xs7lcxe6unmxwjswwevezfjz@2si4oclfhsbp>
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-8-hdegoede@redhat.com>
 <abnylacvx7hhhvpu7bmcuyf7cwm2g7snmbngwi3ckaowfakuqe@yvk7ghilhru5>
 <ZJsUlErfzcpBNljz@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZJsUlErfzcpBNljz@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On Tue, Jun 27, 2023 at 07:55:48PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 27, 2023 at 05:08:39PM +0200, Jacopo Mondi wrote:
> > On Tue, Jun 27, 2023 at 03:18:08PM +0200, Hans de Goede wrote:
>
> ...
>
> > >  	mode = v4l2_find_nearest_size(ov2680_mode_data,
> > > -				      ARRAY_SIZE(ov2680_mode_data), width,
> > > -				      height, fmt->width, fmt->height);
> > > +				      ARRAY_SIZE(ov2680_mode_data),
> > > +				      width, height,
> > > +				      format->format.width,
> > > +				      format->format.height);
> > >  	if (!mode)
> > >  		return -EINVAL;
> >
> > Nit: only if you have to resend, could this be dropped? mode will be NULL
> > only if ov2680_mode_data[] has no entries.
>
> We shouldn't rely on the implementation details of some API if it's not
> advertised that way. Even if it is, the robustness of the code is better with
> this check.

I don't 100% agree here. the s_fmt subdev operation is not supposed to
return -EINVAL if the requested configuration cannot be found. So when
I saw -EINVAL here it throw me off a little, until I didn't look into
v4l2_find_nearest_size() implementation and realized this can't
actually happen.

But as Hans said, this is going away in the next patches, something I
didn't notice when I wrote this comment, so no need to bother :)

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
