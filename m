Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E36915F77DB
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 14:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiJGMMG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 08:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiJGMMF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 08:12:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B00D0CF2
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 05:12:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6584BBE;
        Fri,  7 Oct 2022 14:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665144723;
        bh=gf2N/1YxoJUwCXjvbJtpB0+pbult3RA3p9c8TYjhPhY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fiSxsUDVFN6MGRhGOWX9Bwh1aA+QCDu59osfW7XKn4u5Axq/xntuuh5fvkGWA8Dcp
         cjjNRlSv83TDPi0uWXqP/PXYr/5lBIsy8Hbm46xgZEeM6jmY3TMF5jYRH+06KJx9+C
         oV4m+6vztm43eTHhwPkGQ2vXtIs3Nhiqhr1OVHog=
Date:   Fri, 7 Oct 2022 15:11:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <Y0AXj32rub14CDWY@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-3-jacopo@jmondi.org>
 <m31qrk6wgc.fsf@t19.piap.pl>
 <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
 <m3wn9b4zl0.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3wn9b4zl0.fsf@t19.piap.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 07, 2022 at 01:56:11PM +0200, Krzysztof Hałasa wrote:
> Jacopo Mondi writes:
> 
> >> BTW ISP can't really do that color balancing for you, since the sensor
> >> operates at its native bit resolution and ISP is limited to the output
> >> format, which is currently only 8-bit.
> >
> > I'm not sure what do you mean here either :)
> 
> Well, the sensor does DSP on 12 bits internally, or something alike.
> Then it outputs (currently) 8 bits of data, the rest being lost. If you
> do color balancing etc. on this, you may get worse results (like color
> banding).

But if you apply colour gains in the sensor, they will apply before
black level correction or lens shading compensation in the ISP, which I
think will cause other issues, possibly worse.

Out of curiosity, if you can tell, what do you use this sensor with ?

-- 
Regards,

Laurent Pinchart
