Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D996D57CA03
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 13:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiGULyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 07:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbiGULyV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 07:54:21 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DAC28322E
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 04:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658404460; x=1689940460;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0a/iSWA1ln88fBJC5NMGO7lQMxP+8QmwgWOq133Y11Q=;
  b=qR9D4mb5HUpfoo9il0jZVWqFkcRK4YOSpZ3MMYvPjjntPJGPUetphg+I
   vuSJb/wMvbGY/46x6tjHB0w4O0rU4yol/n7DtrkswclLy6fAZTEEsVzFl
   KxQv9/ZHqu/La4mRHPi8XBSLggj4RGJMvpv4ny7MuWKP+7amdbCz0iIZF
   7lzTQsbe63NQ0BBBxpqVuOe1UikFwZVa6DAGbhQdKIkBHHdE8662Mu3nO
   NG2KnUYSE8fe7QllqFqagxRfLCyKDqVHF/ivQC7xL1/eu2Dyp+YYWinmo
   5qud9A41QarYfcIgakKVyuMnuS7yw9kdz1jAoRtfvAI6O3q5iIly1U4fA
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25184154"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 13:54:18 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 13:54:18 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 13:54:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658404458; x=1689940458;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=0a/iSWA1ln88fBJC5NMGO7lQMxP+8QmwgWOq133Y11Q=;
  b=JENM/7zTRevr9OaayvlDsykKiZ52JFh1ipFm60txqirUCI4skCqid003
   n23F5CguInID7cx4wgFzIhapXa1JNfWrOjFXY76YmdK7AUFWOInI84KPF
   MLrRoITsKzNVnAtbCRCeCQmSWXToQ6/jZp5/YjUsBrOummPBkQX5isUUF
   IeurTpwK7xWfqLo+M8p4rGDvOmaVEE3/JhW9PXc4doitrLTVpROyJUDmY
   ihbS04ZDQKl8WRV8E4l+bK2XtUGUB7xPUF/Cm/os/hYxRMnEXZHT4dhQ5
   nAavu7tgHC7OlYJ14uno07Ogw/I5gJ/mHuVtn6/5H0rj4SVZ55InPi14r
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25184153"
Subject: Re: Re: [PATCH 03/19] media: i2c: imx290: Specify HMAX values in decimal
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 13:54:18 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A86D8280056;
        Thu, 21 Jul 2022 13:54:18 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 13:54:18 +0200
Message-ID: <3293452.QkHrqEjB74@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Ytk5LAizibrAraFd@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <3848757.ElGaqSPkdT@steina-w> <Ytk5LAizibrAraFd@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Am Donnerstag, 21. Juli 2022, 13:31:56 CEST schrieb Laurent Pinchart:
> Hi Alexander,
> 
> On Thu, Jul 21, 2022 at 11:18:24AM +0200, Alexander Stein wrote:
> > Hi Laurent,
> > 
> > thanks for working on this, I've also some patches on top for imx327
> > support.
> I'm using an IMX327 with this driver without any need for additional
> patches :-) I'd be happy to test our patches though.

Same for me, but I feel unpleasent writing to reserved bits ;-)

> > Am Donnerstag, 21. Juli 2022, 10:35:24 CEST schrieb Laurent Pinchart:
> > > The HMAX value specifies the total line length in pixels. It's thus more
> > > readable in decimal than hexadecimal. Fix it.
> > 
> > I understand the motivation, pixels are more natural in decimal numbers,
> > but e.g. what is 4400 pixels on this sensor? It is only mentioned
> > sparsely and 3300d is not mentioned at all, 0ce4h is instead.
> 
> I'm not even sure if HMAX is expressed in pixels or in cycles of some
> internal clock different than the pixel clocks.
> 
> > I also like to have the hexadecimal numbers here as you can find them
> > directly in the datasheet. To me this seems more sensible for
> > cross-checking. Just my opinion.
> 
> It's a matter of readability of the driver code vs. matching with the
> datasheet. I have a preference for decimal numbers here, but I don't
> mind too much. What I would actually like is dropping the hmax value
> from the imx290_mode structure and computing it dynamically based on a
> hblank value set by userspace. Do you think you could help me doing so ?

Well, in my patch stack there is one adding vmax to this struct ;-)
It works without modification but this is essentially the so called 'long 
exposure operation'.
Reducing vmax on 720p increases the FPS, so this is a sensible thing to do. 
The exposure has to be recalculated from that (dynamic) vmax value.

But computing those values completely dynamically seems a sensible thing to 
do. Until it is fully understood I would prefer keeping hexadecimal values.
I mean do you know why it is 4400 pixels for 1080p and 6600 for 720p on 2 
lanes?

I know this is part of your [1] branch. So I'll post my patches once this 
series is settled.

Best regards,
Alexander

[1] https://gitlab.com/ideasonboard/nxp/linux/-/commits/pinchartl/v5.19/
sensors/imx

> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > 
> > >  drivers/media/i2c/imx290.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 64bd43813dbf..f60a4135dc9c 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -308,7 +308,7 @@ static const struct imx290_mode
> > > imx290_modes_2lanes[] =
> > > { {
> > > 
> > >  		.width = 1920,
> > >  		.height = 1080,
> > > 
> > > -		.hmax = 0x1130,
> > > +		.hmax = 4400,
> > > 
> > >  		.link_freq_index = FREQ_INDEX_1080P,
> > >  		.data = imx290_1080p_settings,
> > >  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> > > 
> > > @@ -316,7 +316,7 @@ static const struct imx290_mode
> > > imx290_modes_2lanes[] =
> > > { {
> > > 
> > >  		.width = 1280,
> > >  		.height = 720,
> > > 
> > > -		.hmax = 0x19c8,
> > > +		.hmax = 6600,
> > > 
> > >  		.link_freq_index = FREQ_INDEX_720P,
> > >  		.data = imx290_720p_settings,
> > >  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> > > 
> > > @@ -327,7 +327,7 @@ static const struct imx290_mode
> > > imx290_modes_4lanes[] =
> > > { {
> > > 
> > >  		.width = 1920,
> > >  		.height = 1080,
> > > 
> > > -		.hmax = 0x0898,
> > > +		.hmax = 2200,
> > > 
> > >  		.link_freq_index = FREQ_INDEX_1080P,
> > >  		.data = imx290_1080p_settings,
> > >  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> > > 
> > > @@ -335,7 +335,7 @@ static const struct imx290_mode
> > > imx290_modes_4lanes[] =
> > > { {
> > > 
> > >  		.width = 1280,
> > >  		.height = 720,
> > > 
> > > -		.hmax = 0x0ce4,
> > > +		.hmax = 3300,
> > > 
> > >  		.link_freq_index = FREQ_INDEX_720P,
> > >  		.data = imx290_720p_settings,
> > >  		.data_size = ARRAY_SIZE(imx290_720p_settings),




