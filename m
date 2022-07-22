Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3927257D9DA
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 07:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbiGVFx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 01:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiGVFxy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 01:53:54 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAF24599E
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 22:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658469233; x=1690005233;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S0zKaM3Bi4fYvR4sf5mwD/1ZAQTaNcD9WDMqlzSRtC8=;
  b=cG6Z++jcECRpv/E0jqgDSqWzeSGur0K8CDOzIrS4fSmMVlaSRBfAbIqq
   EWmBYNtv3Loj+4xebm7qe6HLNq11LDOQaHFLUnXNapTN3N+gam/+3TF7Y
   +TWLjEBRilTsAcZZ2gbhLD57Wo8Tx4Z44wyQBwoRnvY8rZAIfM+A55xAu
   2t7ps7XT5JZzDzNfX8B8qQP9iQcU3Ji+olqi1OGX2PDa75BlfJS9Z5P6j
   ZHqIPYt/WRyGDGP8ewcNLNOmQTP4oKTQ9DwU06p+oDi5qbBcYDqobxlnn
   7youBz+yZ95YrGjV/TGhUOZFkef2+X8Ju96zT4YHl/IbokUZ++itXO4WB
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,184,1654552800"; 
   d="scan'208";a="25198425"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jul 2022 07:53:51 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 22 Jul 2022 07:53:51 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 22 Jul 2022 07:53:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658469231; x=1690005231;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=S0zKaM3Bi4fYvR4sf5mwD/1ZAQTaNcD9WDMqlzSRtC8=;
  b=P0KoARAcCSsSE1+G9n8PlapW+f02t70Ojt14awQJtiQvpxZVfWrE/NZo
   OLOP330pIjSDpEaQcO2X3j/1P9Usgi8J3N2FTnd4B1kVg/Hzb7N2wbe+S
   VeCDYmosiH2Z6OdcT6qBBHttEECQ4wxCVv913GnZb2oUKf+OGxEkNGGmp
   E8eGQ8sfcvw2nlZi00UDUPy5G7ukagzoshSP/Xtk/+u6vtUhKYDKQyele
   PO1Bh7aEv4oj78kJCQPD3jbleauOZX/QZy5anQujeLxloRQjUT5NLty5g
   jynK56CivHl2gzYu1L0b857Ev3MnK958kwqqckm6swZOpKfeopazYS7y4
   A==;
X-IronPort-AV: E=Sophos;i="5.93,184,1654552800"; 
   d="scan'208";a="25198424"
Subject: Re: Re: Re: [PATCH 16/19] media: i2c: imx290: Move registers with fixed
 value to init array
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jul 2022 07:53:51 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DB055280056;
        Fri, 22 Jul 2022 07:53:50 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Fri, 22 Jul 2022 07:53:48 +0200
Message-ID: <3555790.PIDvDuAF1L@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAPY8ntBRQJFwFX1sV7kjUDwK2iHSqbTyUmEie2RFH-BVvyHcyQ@mail.gmail.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <4314456.BEx9A2HvPv@steina-w> <CAPY8ntBRQJFwFX1sV7kjUDwK2iHSqbTyUmEie2RFH-BVvyHcyQ@mail.gmail.com>
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

Hello Dave,

Am Donnerstag, 21. Juli 2022, 18:19:56 CEST schrieb Dave Stevenson:
> Hi Laurent and Alexander
> 
> On Thu, 21 Jul 2022 at 12:08, Alexander Stein
> 
> <alexander.stein@ew.tq-group.com> wrote:
> > Hello Laurent,
> > 
> > Am Donnerstag, 21. Juli 2022, 12:40:36 CEST schrieb Laurent Pinchart:
> > > Hi Alexander,
> > > 
> > > On Thu, Jul 21, 2022 at 12:08:50PM +0200, Alexander Stein wrote:
> > > > Am Donnerstag, 21. Juli 2022, 10:35:37 CEST schrieb Laurent Pinchart:
> > > > > Registers 0x3012, 0x3013 and 0x3480 are not documented and are set
> > > > > in
> > > > > the per-mode register arrays with values indentical for all modes.
> > > > > Move
> > > > > them to the common array.
> > > > > 
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> > > > > 
> > > > >  drivers/media/i2c/imx290.c | 8 ++------
> > > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > > index 78772c6327a2..fc6e87fada1c 100644
> > > > > --- a/drivers/media/i2c/imx290.c
> > > > > +++ b/drivers/media/i2c/imx290.c
> > > > > @@ -192,6 +192,7 @@ static const struct imx290_regval
> > > > > imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x300f), 0x00 },
> > > > > 
> > > > >   { IMX290_REG_8BIT(0x3010), 0x21 },
> > > > >   { IMX290_REG_8BIT(0x3012), 0x64 },
> > > > > 
> > > > > + { IMX290_REG_8BIT(0x3013), 0x00 },
> > > > > 
> > > > >   { IMX290_REG_8BIT(0x3016), 0x09 },
> > > > >   { IMX290_REG_8BIT(0x3070), 0x02 },
> > > > >   { IMX290_REG_8BIT(0x3071), 0x11 },
> > > > > 
> > > > > @@ -230,6 +231,7 @@ static const struct imx290_regval
> > > > > imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x33b0), 0x50 },
> > > > > 
> > > > >   { IMX290_REG_8BIT(0x33b2), 0x1a },
> > > > >   { IMX290_REG_8BIT(0x33b3), 0x04 },
> > > > > 
> > > > > + { IMX290_REG_8BIT(0x3480), 0x49 },
> > > > > 
> > > > >  };
> > > > >  
> > > > >  static const struct imx290_regval imx290_1080p_settings[] = {
> > > > > 
> > > > > @@ -239,15 +241,12 @@ static const struct imx290_regval
> > > > > imx290_1080p_settings[] = { { IMX290_OPB_SIZE_V, 10 },
> > > > > 
> > > > >   { IMX290_X_OUT_SIZE, 1920 },
> > > > >   { IMX290_Y_OUT_SIZE, 1080 },
> > > > > 
> > > > > - { IMX290_REG_8BIT(0x3012), 0x64 },
> > > > > - { IMX290_REG_8BIT(0x3013), 0x00 },
> > > > > 
> > > > >   { IMX290_INCKSEL1, 0x18 },
> > > > >   { IMX290_INCKSEL2, 0x03 },
> > > > >   { IMX290_INCKSEL3, 0x20 },
> > > > >   { IMX290_INCKSEL4, 0x01 },
> > > > >   { IMX290_INCKSEL5, 0x1a },
> > > > >   { IMX290_INCKSEL6, 0x1a },
> > > > > 
> > > > > - { IMX290_REG_8BIT(0x3480), 0x49 },
> > > > > 
> > > > >   /* data rate settings */
> > > > >   { IMX290_REPETITION, 0x10 },
> > > > >   { IMX290_TCLKPOST, 87 },
> > > > > 
> > > > > @@ -267,15 +266,12 @@ static const struct imx290_regval
> > > > > imx290_720p_settings[] = { { IMX290_OPB_SIZE_V, 4 },
> > > > > 
> > > > >   { IMX290_X_OUT_SIZE, 1280 },
> > > > >   { IMX290_Y_OUT_SIZE, 720 },
> > > > > 
> > > > > - { IMX290_REG_8BIT(0x3012), 0x64 },
> > > > > - { IMX290_REG_8BIT(0x3013), 0x00 },
> > > > > 
> > > > >   { IMX290_INCKSEL1, 0x20 },
> > > > >   { IMX290_INCKSEL2, 0x00 },
> > > > >   { IMX290_INCKSEL3, 0x20 },
> > > > >   { IMX290_INCKSEL4, 0x01 },
> > > > >   { IMX290_INCKSEL5, 0x1a },
> > > > >   { IMX290_INCKSEL6, 0x1a },
> > > > > 
> > > > > - { IMX290_REG_8BIT(0x3480), 0x49 },
> > > > > 
> > > > >   /* data rate settings */
> > > > >   { IMX290_REPETITION, 0x10 },
> > > > >   { IMX290_TCLKPOST, 79 },
> > > > 
> > > > 0x3480 is INCKSEL7 for imx327, not sure if that should be set yet for
> > > > imx290 (only) driver, without proper imx327 support.
> > > 
> > > Do you mean the register doesn't exist on the IMX290 ? We could make it
> > > conditional on the sensor model, but it's not added by this patch, it
> > > has been there since the first version of the driver, so I'd rather do
> > > that on top.
> > 
> > As far as I know INCKSEL7 is only valid on imx327. On imx290 the whole
> > 0x300-0x34ff range is reserved.
> 
> IMX290_CSI_LANE_MODE to select the number of CSI2 data lanes is
> 0x3443, so clearly the whole range is not reserved.

You are right, I was looking at the wrong table, my bad.

> > I agree this should be conditional on the sensor model. If you want to
> > keep
> > it, because it is not new, I'm fine with that.
> 
> 0x3840 is documented in my IMX290 datasheet as being INCKSEL7. 0x49
> for 37.125MHz clock. 0x92 for 74.25MHz (default).
> Removing it *will* break this driver for existing platforms as the
> rest of the code configures a 37.125MHz clock.

I guess you mean 0x3480, just a small typo. Just to be sure.
Interesting, the datasheet for imx290 I found doesn't contain INCKSEL7 at all. 
But good to know, that this register applies to imx290 as well.
Thanks for that information.

Best regards,
Alexander

> See [1] for adding 74.25MHz clock support.
> 
>   Dave
> 
> [1]
> https://github.com/raspberrypi/linux/commit/125f7e7ef1194d4849c74b25c87d18a
> ea9de2de7




