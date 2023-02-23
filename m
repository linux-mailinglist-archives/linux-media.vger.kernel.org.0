Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E85C36A0EFB
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 19:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjBWSDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Feb 2023 13:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjBWSDj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Feb 2023 13:03:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C9B4ECC5
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 10:03:38 -0800 (PST)
Received: from ideasonboard.com (host-87-16-53-160.retail.telecomitalia.it [87.16.53.160])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4CAD496;
        Thu, 23 Feb 2023 19:03:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677175417;
        bh=o6LS589nVoGAyGJaRMtZ66f7SnRzVxwi8+NkvWFONP0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZZaBlIMYrEECJ3m6o0nh1p1RjkbDp9rhW9TqKoyWtDVkeP4NwapGCvKCo7nUVbKIG
         S4+GdLcjmpiI5ljkx8cJ0091aNp10XWZGlktCVK1NhRWm3daiM+TKzQ5w86yZ/DmO5
         TliY8QuCzm7X8W3h0B1d164RcNCZDNaTUMHzIBHc=
Date:   Thu, 23 Feb 2023 19:03:25 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
Subject: Re: [PATCH v1 1/3] media: ti: cal: Add support for 1X16 mbus formats
Message-ID: <20230223180325.zicvisvqf6vv3ypa@uno.localdomain>
References: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
 <20230222125630.421020-2-tomi.valkeinen@ideasonboard.com>
 <20230223171021.ukttr2xwcuxlzdzu@uno.localdomain>
 <bca4cd33-eb4a-693f-5663-365459d89cc7@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bca4cd33-eb4a-693f-5663-365459d89cc7@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Thu, Feb 23, 2023 at 07:52:48PM +0200, Tomi Valkeinen wrote:
> On 23/02/2023 19:10, Jacopo Mondi wrote:
> > Hi Tomi
> >
> > On Wed, Feb 22, 2023 at 02:56:28PM +0200, Tomi Valkeinen wrote:
> > > For legacy reasons the CAL driver uses 2X8 mbus formats for the CSI-2
> > > link (e.g. MEDIA_BUS_FMT_YUYV8_2X8). 1X16 formats are more correct and
> > > used by many drivers, so add 1X16 support to CAL.
> > >
> > > We keep the 2X8 formats for backward compatibility.
> >
> > Eh, this is the usual question about what we should consider a
> > to be a userspace breakage or not.
> >
> > I presume the reason to maintain 2X8 formats is (assuming the CAL
> > interface is CSI-2 only, right ?) because sensor drivers that only
> > support 2X8 formats will then fail to link_validate() if you remove
>
> Yes.
>
> > all 2X8 formats here. I'm of the opinion that we should bite the
> > bullet and move to 1X16. If any driver that used to work with CAL now
> > breaks, the sensor driver will have to be fixed.
> >
> > In my humble experience, that's what we did with the ov5640 sensor. We
>
> Yes, you did.
>
> > removed the 2X8 formats in CSI-2 mode and some platform driver broke
> > and then had been fixed (it happened in the same release cycle), win win.
>
> No, CAL is still broken =). OV5640 is the only sensor I have. I just haven't
> had time to look at this and fix it (and no one has complained).
>

Ups, I was thinking at the ST and microchip receivers, I thought CAL
was fixed already :)

See ? win win (almost)

> > I know it's controversial, let's see what others think.
>
> I'm all for dropping the 2X8 formats, if that's the consensus. It would keep
> the driver simpler, as we could keep the 1:1 relationship between pixel
> formats and mbus codes.
>
> I'll look at your other comments tomorrow.
>

And I'll look at your last patch tomorrow if I can get a media graph
dump!

>  Tomi
>
