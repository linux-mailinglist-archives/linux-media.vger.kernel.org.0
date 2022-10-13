Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA9D95FD71A
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 11:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiJMJcB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 05:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiJMJcA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 05:32:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D26FF276
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 02:32:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D64E492;
        Thu, 13 Oct 2022 11:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665653518;
        bh=ndkvDYTrEBOhqJRaZQvT8vv6Wbp/NmCGwI4kLTYcjfA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aHLrNeJDNJNupy/Wvn1lUFkB0O3NiDsPJ3+9ymab8psPSPuqbecrDUGEY2JNNFc3M
         hqORC/Ts2o5kfyQcWTzZlB4h23Oo8PTy0klKHgEqaDRjYL8qgFZh473WSD8z+2CiU8
         TsqZwpi42JXBJpzyoHMfJWqfOjq/ejEUF6xT5yck=
Date:   Thu, 13 Oct 2022 12:31:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 04/10] media: ar0521: Rework PLL computation
Message-ID: <Y0fbCJvJuGkuDuFb@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-5-jacopo@jmondi.org>
 <Y0Av8cjapldZhA96@pendragon.ideasonboard.com>
 <Y0cPKNN90wA6Bsrh@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y0cPKNN90wA6Bsrh@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Oct 12, 2022 at 10:02:00PM +0300, Sakari Ailus wrote:
> On Fri, Oct 07, 2022 at 04:56:01PM +0300, Laurent Pinchart wrote:
> > On Wed, Oct 05, 2022 at 09:06:07PM +0200, Jacopo Mondi wrote:
> > > Rework the PLL computation procedure to take into account the currently
> > > configured format bpp and the number of data lanes.
> > > 
> > > Comment the PLL configuration procedure with information provided by the
> > > sensor chip manual and remove the hardcoded divider from the pixel clock
> > > calculation.
> > > 
> > > The PLL configuration procedure has been verified by forcing a pixel
> > > rate of 414 MHz and verify that the effective output pixel rate matches
> > > the expected 60 frames per second.
> > 
> > This is the kind of code that would benefit from testing with kunit.
> > 
> > > Do not modify the default pixel rate for the moment as it will be made
> > > configurable through V4L2_CID_LINK_FREQ in subsequent patches.
> > > 
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > 
> > I think we should extract the PLL calculation code from the CCS driver
> > into a library. Sakari ? :-)
> 
> It already is a module. I think there is another driver using it, written
> by you. :-)

Oh indeed. I wonder how I missed that.

> Some PLLs are as in CCS but there are different ones, too, especially in
> Omnivision sensors. Sometimes CCS PLL calculator can be used on non-CCS sensors
> by fixing one of the multipliers or divisors to 1.

I think the AR0521 PLL could match, but I also think there are some
mistakes in the documentation, so this would need to be checked.

-- 
Regards,

Laurent Pinchart
