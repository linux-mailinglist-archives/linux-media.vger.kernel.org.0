Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D77286FF025
	for <lists+linux-media@lfdr.de>; Thu, 11 May 2023 12:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237773AbjEKKvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 May 2023 06:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbjEKKvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 May 2023 06:51:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59FB44230
        for <linux-media@vger.kernel.org>; Thu, 11 May 2023 03:51:20 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2059755;
        Thu, 11 May 2023 12:51:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683802270;
        bh=iOZxfB/J+3u4Qr3mzuUmCu1LVDCnnzhJshLkmXOYloQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UnnXPVi0HMvz6j5fo0cqVndlE1tR1EqTHWk5IvrhUtFIaXV8i5Z490MUA5nZWiqdV
         g+DvJ+qKaXOJMbG56tXIUiJgZI+cvisRbhSc7yTz9iuVJXifFVoHBsc8yAAJIkYiqf
         uNpJlJ0XlqLaeq4QMnIdSVla+VBD0L6FCl1nKYFU=
Date:   Thu, 11 May 2023 12:51:15 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     "G.N. Zhou" <guoniu.zhou@nxp.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>
Subject: Re: [EXT] [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
Message-ID: <oq4iteqfxl6sbegwdiuuxtib3udi6yruyj6qiwb5bcg2hdjkof@cdlqt4oxw4yg>
References: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
 <AS8PR04MB90800B7B9BA75668DC82624BFA729@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <AS8PR04MB9080676E7B0CB32E37AACB9AFA749@AS8PR04MB9080.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB9080676E7B0CB32E37AACB9AFA749@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

On Thu, May 11, 2023 at 09:14:11AM +0000, G.N. Zhou wrote:
> I tested the patch on NXP iMX8MP platform and no issues found.
>

Thanks for testing

> Test-by: Guoniu.zhou <guoniu.zhou@nxp.com>

FYI the tag is meant to be

Tested-by:

Thanks for testing

>
> > -----Original Message-----
> > From: G.N. Zhou
> > Sent: 2023年5月5日 16:03
> > To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Cc: slongerbeam@gmail.com; linux-media@vger.kernel.org;
> > mchehab@kernel.org
> > Subject: RE: [EXT] [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
> >
> > Sure, will update later.
> >
> > > -----Original Message-----
> > > From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Sent: 2023年5月5日 15:16
> > > To: G.N. Zhou <guoniu.zhou@nxp.com>
> > > Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>;
> > > slongerbeam@gmail.com; linux-media@vger.kernel.org;
> > mchehab@kernel.org
> > > Subject: [EXT] [PATCH 0/2] media: ov5640: drive-by frame_interval
> > > cleanups
> > >
> > > Caution: This is an external email. Please take care when clicking
> > > links or opening attachments. When in doubt, report the message using the
> > 'Report this email'
> > > button
> > >
> > >
> > > While looking at Guoniu Zhou patches I noticed that there were a few
> > > cleanups related to the usage of frame_interval fileds for MIPI CSI-2
> > > framerate calculations.
> > >
> > > No functional changes intended, just cleanups.
> > >
> > > Guoniu: could you please test these on your setup as well ? A
> > > tested-by tag would be useful!
> > >
> > > Thanks
> > >   j
> > >
> > > Jacopo Mondi (2):
> > >   media: ov5640: Remove unused 'framerate' parameter
> > >   media: ov5640: Drop dead code using frame_interval
> > >
> > >  drivers/media/i2c/ov5640.c | 17 +----------------
> > >  1 file changed, 1 insertion(+), 16 deletions(-)
> > >
> > > --
> > > 2.40.1
>
