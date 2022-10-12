Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A09F5FCB40
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 21:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbiJLTCG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 15:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbiJLTCE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 15:02:04 -0400
X-Greylist: delayed 35708 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 12 Oct 2022 12:02:02 PDT
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B3A22BD0
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 12:02:02 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 92EDD203BE;
        Wed, 12 Oct 2022 22:02:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1665601320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qvsGcvatRJhuIhRIso4XTTrVj7h45my1d2kQf4Cw3xc=;
        b=bes8fZFsR0GkhV/Vlj4clFrpnOtxU1TYOYBafsuCBpJi/w7c/S6cbSnnUCIRLvht5Q3nRW
        7jt90THw0hFLpjH22ZCNcmvgnaizWHWayqOBss70Qx9+4xfkfUSe9x3/oHQmQtgTMLcFPT
        H19hsG1AupmzFVuC+Dc50BAOH0k0HXU=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 475F3634C93;
        Wed, 12 Oct 2022 22:02:00 +0300 (EEST)
Date:   Wed, 12 Oct 2022 22:02:00 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 04/10] media: ar0521: Rework PLL computation
Message-ID: <Y0cPKNN90wA6Bsrh@valkosipuli.retiisi.eu>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-5-jacopo@jmondi.org>
 <Y0Av8cjapldZhA96@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0Av8cjapldZhA96@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1665601320; a=rsa-sha256; cv=none;
        b=KjsizHQeeEob1F0cydKZTNcTmOzHDuesZ2Wzkc/FHM+Cfeq4q2A1FKv8jDQprVaiBq1RJy
        xCHJlcfrgVx70cZd6K0QFvJAJXERB1iGDpKxJN3rQRPkQHSN9udLeuVpvqDVL9aZcIfBDt
        ikTYQVqr9nnAUGOrum1Pjv6tg17RyvY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1665601320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qvsGcvatRJhuIhRIso4XTTrVj7h45my1d2kQf4Cw3xc=;
        b=FrhqAF3bUFC0lNphWQZJaEGdFqMoLeRbbc63Kd90Cop2TI6bOUoZlw+oSYhEdrfafJH3fL
        32qH66PVkKQqSlZF1Qq5+MwG+UdU0ZVhG9tjigo9FKpVsX6WX9JhNltvvB4/PHzmHxQs+f
        FFxOR0jO+/KGaF2K3auWnXcMkSLatXk=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Oct 07, 2022 at 04:56:01PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Wed, Oct 05, 2022 at 09:06:07PM +0200, Jacopo Mondi wrote:
> > Rework the PLL computation procedure to take into account the currently
> > configured format bpp and the number of data lanes.
> > 
> > Comment the PLL configuration procedure with information provided by the
> > sensor chip manual and remove the hardcoded divider from the pixel clock
> > calculation.
> > 
> > The PLL configuration procedure has been verified by forcing a pixel
> > rate of 414 MHz and verify that the effective output pixel rate matches
> > the expected 60 frames per second.
> 
> This is the kind of code that would benefit from testing with kunit.
> 
> > Do not modify the default pixel rate for the moment as it will be made
> > configurable through V4L2_CID_LINK_FREQ in subsequent patches.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> I think we should extract the PLL calculation code from the CCS driver
> into a library. Sakari ? :-)

It already is a module. I think there is another driver using it, written
by you. :-)

Some PLLs are as in CCS but there are different ones, too, especially in
Omnivision sensors. Sometimes CCS PLL calculator can be used on non-CCS sensors
by fixing one of the multipliers or divisors to 1.

-- 
Sakari Ailus
