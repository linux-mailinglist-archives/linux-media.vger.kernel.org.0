Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4ED5F7530
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 10:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiJGIUY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 04:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiJGIUV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 04:20:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33B058171
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 01:20:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAEA74D3;
        Fri,  7 Oct 2022 10:20:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665130818;
        bh=iIvTwR5mIq2UreFyWnhOZE60FDsU+RwQ9yYRa/C7qds=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ivVqhYlRjlH1yQIOOLdRAinv9qZK2qpiRL5a+W6MQykdC16DnkvAT9h+BWsekBO7n
         Wge47qXZUAr9PvqCT+oCTAJ4KFZL9pkA8mo50pxWrTkZO08M9crUShwyFzs8DjsfVn
         kZ7bDl2z18NLGxoj6u9KYLpJkSvgmNm+N4GIt4u8=
Date:   Fri, 7 Oct 2022 11:20:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <Yz/hPRyc13LmY3Lh@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-3-jacopo@jmondi.org>
 <CAPY8ntB48837t+UN_6k5DJ6QBJvgz0Ohc4w4=7044amrdCy1=A@mail.gmail.com>
 <20221006150015.7p7qlab4dbaldnsg@uno.localdomain>
 <Yz7u0LT2kwhyhc8x@pendragon.ideasonboard.com>
 <m3wn9c5hip.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3wn9c5hip.fsf@t19.piap.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Fri, Oct 07, 2022 at 07:28:46AM +0200, Krzysztof Hałasa wrote:
> Laurent Pinchart writes:
> 
> > I'm tempted to drop support for the colour gains really, and turn the
> > V4L2_CID_GAIN into V4L2_CID_DIGITAL_GAIN. Digital colour gains can still
> > be useful on platforms that have no ISP, but I think we need an array of
> > gains in that case, not abusing V4L2_CID_RED_BALANCE and
> > V4L2_CID_BLUE_BALANCE. Any objection ?
> 
> I'm fine with spliting it into analog/digital as long as there is a way
> to set individual R/G/B (digital) gain values.

With the controls we have today in V4L2, we could map
V4L2_CID_RED_BALANCE and V4L2_CID_BLUE_BALANCE to the red and blue
digital gains, with V4L2_CID_DIGITAL_GAIN setting the global digital
gain.

I'm tempted to bite the bullet and define a new
V4L2_CID_DIGITAL_COLOR_GAINS control that would expose an array of
gains, but if we extend the API for that, I think we should also include
support for HDR at the same time, with at least T1/T2 sets of gains.

Sakari, any opinion ?

-- 
Regards,

Laurent Pinchart
