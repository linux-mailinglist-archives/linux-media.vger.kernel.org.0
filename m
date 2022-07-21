Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 829F357C98F
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 13:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232907AbiGULI1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 07:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbiGULIZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 07:08:25 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C91182FA8
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 04:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658401704; x=1689937704;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sFTqeTj2EiGftuPjuP5QNITwV2uXGksBWCPxgJEstc0=;
  b=KVWtF7jcoLS0ASIFaE+LnICxWHtAraFdTCdRppD9Zo5OFBl4QwquwB7r
   blTEh37ipSmhemhaSj26hUu3GC6GG8A8vQVxx9O4CqvMyRtuqsdZpHepm
   8TVtlmYlWWN8ZsQbSrxeag2lgnJlVkrF8rtG5HmEuDkEJ4Dm9ScgdJHuH
   LR2yufAqSnnSinzWhyP0tR+NR7hT+W9qfPSzZ662jhpsGx7NBvVzdAbZX
   kcnedVYNf+Da8GtEkdFU3gU3DElmfVqIH/lt/OleRdUeqYYjBPLxG0t5/
   wrgGI2cRINh3QSyIwJU9TNXmXYCW4fAQG7ikNpfouRO2299OqpYSSq8QK
   A==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25182818"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 13:08:22 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 13:08:22 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 13:08:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658401702; x=1689937702;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=sFTqeTj2EiGftuPjuP5QNITwV2uXGksBWCPxgJEstc0=;
  b=IwkvClDpGVBbw1eMFlwXjTx/wCsZy3TKiP69/g+kR7KxkQ3DyI3BO3dl
   jQ0chXXktSzo+brk5IQgUwD5CvzDRhn93Y02OLcnTDrI+j4Mx0LQG0DwY
   dRTD+KpDzm1oG7BWMsKQUaBL3jxq7qbSyG5p93lYeje/uv6I7bg5tOAVI
   SgbQSyRQr4oNJMrt2o18ZxhmREnbq1WACb28VeeHuLVW1HUIjKOLPbHhI
   Pkdt91c/7v7ddgCm0n2dz/J0YN85BYORscGCQdf42JmDUd73FotxOXjlf
   8g9uKwM7Fb6lPdRkhz/2TNTJkk00nX6T4GFyITPNY6FSSKY7mdddx1o5O
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25182817"
Subject: Re: Re: [PATCH 16/19] media: i2c: imx290: Move registers with fixed value to
 init array
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 13:08:22 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 776D9280056;
        Thu, 21 Jul 2022 13:08:22 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 13:08:22 +0200
Message-ID: <4314456.BEx9A2HvPv@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YtktJD/HQu44jTdr@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <3980578.jE0xQCEvom@steina-w> <YtktJD/HQu44jTdr@pendragon.ideasonboard.com>
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

Hello Laurent,

Am Donnerstag, 21. Juli 2022, 12:40:36 CEST schrieb Laurent Pinchart:
> Hi Alexander,
> 
> On Thu, Jul 21, 2022 at 12:08:50PM +0200, Alexander Stein wrote:
> > Am Donnerstag, 21. Juli 2022, 10:35:37 CEST schrieb Laurent Pinchart:
> > > Registers 0x3012, 0x3013 and 0x3480 are not documented and are set in
> > > the per-mode register arrays with values indentical for all modes. Move
> > > them to the common array.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > 
> > >  drivers/media/i2c/imx290.c | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 78772c6327a2..fc6e87fada1c 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -192,6 +192,7 @@ static const struct imx290_regval
> > > imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x300f), 0x00 },
> > > 
> > >  	{ IMX290_REG_8BIT(0x3010), 0x21 },
> > >  	{ IMX290_REG_8BIT(0x3012), 0x64 },
> > > 
> > > +	{ IMX290_REG_8BIT(0x3013), 0x00 },
> > > 
> > >  	{ IMX290_REG_8BIT(0x3016), 0x09 },
> > >  	{ IMX290_REG_8BIT(0x3070), 0x02 },
> > >  	{ IMX290_REG_8BIT(0x3071), 0x11 },
> > > 
> > > @@ -230,6 +231,7 @@ static const struct imx290_regval
> > > imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x33b0), 0x50 },
> > > 
> > >  	{ IMX290_REG_8BIT(0x33b2), 0x1a },
> > >  	{ IMX290_REG_8BIT(0x33b3), 0x04 },
> > > 
> > > +	{ IMX290_REG_8BIT(0x3480), 0x49 },
> > > 
> > >  };
> > >  
> > >  static const struct imx290_regval imx290_1080p_settings[] = {
> > > 
> > > @@ -239,15 +241,12 @@ static const struct imx290_regval
> > > imx290_1080p_settings[] = { { IMX290_OPB_SIZE_V, 10 },
> > > 
> > >  	{ IMX290_X_OUT_SIZE, 1920 },
> > >  	{ IMX290_Y_OUT_SIZE, 1080 },
> > > 
> > > -	{ IMX290_REG_8BIT(0x3012), 0x64 },
> > > -	{ IMX290_REG_8BIT(0x3013), 0x00 },
> > > 
> > >  	{ IMX290_INCKSEL1, 0x18 },
> > >  	{ IMX290_INCKSEL2, 0x03 },
> > >  	{ IMX290_INCKSEL3, 0x20 },
> > >  	{ IMX290_INCKSEL4, 0x01 },
> > >  	{ IMX290_INCKSEL5, 0x1a },
> > >  	{ IMX290_INCKSEL6, 0x1a },
> > > 
> > > -	{ IMX290_REG_8BIT(0x3480), 0x49 },
> > > 
> > >  	/* data rate settings */
> > >  	{ IMX290_REPETITION, 0x10 },
> > >  	{ IMX290_TCLKPOST, 87 },
> > > 
> > > @@ -267,15 +266,12 @@ static const struct imx290_regval
> > > imx290_720p_settings[] = { { IMX290_OPB_SIZE_V, 4 },
> > > 
> > >  	{ IMX290_X_OUT_SIZE, 1280 },
> > >  	{ IMX290_Y_OUT_SIZE, 720 },
> > > 
> > > -	{ IMX290_REG_8BIT(0x3012), 0x64 },
> > > -	{ IMX290_REG_8BIT(0x3013), 0x00 },
> > > 
> > >  	{ IMX290_INCKSEL1, 0x20 },
> > >  	{ IMX290_INCKSEL2, 0x00 },
> > >  	{ IMX290_INCKSEL3, 0x20 },
> > >  	{ IMX290_INCKSEL4, 0x01 },
> > >  	{ IMX290_INCKSEL5, 0x1a },
> > >  	{ IMX290_INCKSEL6, 0x1a },
> > > 
> > > -	{ IMX290_REG_8BIT(0x3480), 0x49 },
> > > 
> > >  	/* data rate settings */
> > >  	{ IMX290_REPETITION, 0x10 },
> > >  	{ IMX290_TCLKPOST, 79 },
> > 
> > 0x3480 is INCKSEL7 for imx327, not sure if that should be set yet for
> > imx290 (only) driver, without proper imx327 support.
> 
> Do you mean the register doesn't exist on the IMX290 ? We could make it
> conditional on the sensor model, but it's not added by this patch, it
> has been there since the first version of the driver, so I'd rather do
> that on top.

As far as I know INCKSEL7 is only valid on imx327. On imx290 the whole 
0x300-0x34ff range is reserved.
I agree this should be conditional on the sensor model. If you want to keep 
it, because it is not new, I'm fine with that.

Best regards,
Alexander



