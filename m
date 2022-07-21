Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1CFE57C9B9
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 13:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiGUL2j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 07:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiGUL2i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 07:28:38 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B351229C9D
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 04:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658402916; x=1689938916;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HgRy40GE+GrcAXieey35NpdXWfxFjyXGhSF9gQIIZjk=;
  b=FYFoqZRmGVKV8iScjJuiqXkekON8tH/Lskh2KTe/zBiTKhMabTd+VERf
   Q0I2mAEE/q1PYwh5xC/5EPpNAtXDdS8OHXQRb8yXx9sYBOJoRtQvoSxvI
   IpZP4YF7Ek3rbG86gP0CqysyLF0rAIOIA9nfaHsHIOaHTBFj6UJtWYkC7
   RFAEOiwaTkjIMD/Sr8ssbcWYWt3s8Y/yWdw8uc3aUAov0bJdSTMtg1t1E
   PSdUpvt2pSROa7kuT000KwRcWskYhB8vmXAu0wO9vvxKCI9g+9NXngDiH
   HjpGyv9jmckIV7/DUqfkuh+sd4MtNr/f0ToVyx8ZXoO6mNR+XajZksUb8
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25183277"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 13:28:34 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 13:28:35 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 13:28:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658402914; x=1689938914;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=HgRy40GE+GrcAXieey35NpdXWfxFjyXGhSF9gQIIZjk=;
  b=LuGLKP7sX91558OD+MlqLWc0ArypDx4/FXggRtY/hgpV4YTUhLWUveNc
   R9eGHLnT9kJvZtIrhTT2HBmzxnoctT840U1Z9fBAbjZxEOGQZex/ZRRF1
   ZYOC+o17944ZuVz7LBdg64kbddbhJmX8hmwqjlGMmfeZQBr80DbJZSOAq
   7pAK3+rRl3suGr0AKT09XiV+2xP3NS8H6ppVndJCIOaKEeUxhR0uq2uyn
   V+ZhDA5xTg1GJoQK1cfjq0dwCMtKyH75ofrouG8Ds9UT9Ldn6KAvHWGU5
   00Cg7vHvkuUNzQ1SLBIz8wBZDWzVTXLAu+WubEnn0dCtwPJ1anMcYtMHD
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25183276"
Subject: Re: Re: [PATCH 10/19] media: i2c: imx290: Define more register macros
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 13:28:34 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B3471280056;
        Thu, 21 Jul 2022 13:28:34 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 13:28:34 +0200
Message-ID: <14662940.dW097sEU6C@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YtkzlfWXKl2hZKy0@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <3429069.CQOukoFCf9@steina-w> <YtkzlfWXKl2hZKy0@pendragon.ideasonboard.com>
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

Am Donnerstag, 21. Juli 2022, 13:08:05 CEST schrieb Laurent Pinchart:
> Hi Alexander,
> 
> On Thu, Jul 21, 2022 at 12:00:55PM +0200, Alexander Stein wrote:
> > Am Donnerstag, 21. Juli 2022, 10:35:31 CEST schrieb Laurent Pinchart:
> > > Define macros for all registers programmed by the driver for which
> > > documentation is available to increase readability. This starts making
> > > use of 16-bit registers in the register arrays, so the value field has
> > > to be increased to 32 bits.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > 
> > >  drivers/media/i2c/imx290.c | 219 +++++++++++++++++++++----------------
> > >  1 file changed, 124 insertions(+), 95 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 5b7f9027b50f..bec326a83952 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -31,14 +31,73 @@
> > > 
> > >  #define IMX290_STANDBY					
IMX290_REG_8BIT(0x3000)
> > >  #define IMX290_REGHOLD					
IMX290_REG_8BIT(0x3001)
> > >  #define IMX290_XMSTA					
IMX290_REG_8BIT(0x3002)
> > > 
> > > +#define IMX290_ADBIT					
IMX290_REG_8BIT(0x3005)
> > > +#define IMX290_ADBIT_10BIT				(0 << 0)
> > > +#define IMX290_ADBIT_12BIT				(1 << 0)
> > > +#define IMX290_CTRL_07					
IMX290_REG_8BIT(0x3007)
> > > +#define IMX290_VREVERSE					
BIT(0)
> > > +#define IMX290_HREVERSE					
BIT(1)
> > > +#define IMX290_WINMODE_1080P				
(0 << 4)
> > > +#define IMX290_WINMODE_720P				
(1 << 4)
> > > +#define IMX290_WINMODE_CROP				
(4 << 4)
> > > 
> > >  #define IMX290_FR_FDG_SEL				
IMX290_REG_8BIT(0x3009)
> > >  #define IMX290_BLKLEVEL					
IMX290_REG_16BIT(0x300a)
> > >  #define IMX290_GAIN					
IMX290_REG_8BIT(0x3014)
> > > 
> > > +#define IMX290_VMAX					
IMX290_REG_24BIT(0x3018)
> > > 
> > >  #define IMX290_HMAX					
IMX290_REG_16BIT(0x301c)
> > > 
> > > +#define IMX290_SHS1					
IMX290_REG_24BIT(0x3020)
> > > +#define IMX290_WINWV_OB					
IMX290_REG_8BIT(0x303a)
> > > +#define IMX290_WINPV					
IMX290_REG_16BIT(0x303c)
> > > +#define IMX290_WINWV					
IMX290_REG_16BIT(0x303e)
> > > +#define IMX290_WINPH					
IMX290_REG_16BIT(0x3040)
> > > +#define IMX290_WINWH					
IMX290_REG_16BIT(0x3042)
> > > +#define IMX290_OUT_CTRL					
IMX290_REG_8BIT(0x3046)
> > > +#define IMX290_ODBIT_10BIT				(0 << 0)
> > > +#define IMX290_ODBIT_12BIT				(1 << 0)
> > 
> > ODBIT is fixed 1h for MIPI-CSI-2 output.
> > 
> > > +#define IMX290_OPORTSEL_PARALLEL			(0x0 << 4)
> > > +#define IMX290_OPORTSEL_LVDS_2CH			(0xd << 4)
> > > +#define IMX290_OPORTSEL_LVDS_4CH			(0xe << 4)
> > > +#define IMX290_OPORTSEL_LVDS_8CH			(0xf << 4)
> > 
> > This driver only supports MIPI-CSI-2 output, but these bits are don't
> > care,
> > you still want to list them here for completeness?
> 
> Yes, it could be useful later.

Ok, fine with me.

> > > +#define IMX290_XSOUTSEL					
IMX290_REG_8BIT(0x304b)
> > > +#define IMX290_XSOUTSEL_XVSOUTSEL_HIGH			
(0 << 0)
> > > +#define IMX290_XSOUTSEL_XVSOUTSEL_VSYNC			
(2 << 0)
> > > +#define IMX290_XSOUTSEL_XHSOUTSEL_HIGH			
(0 << 2)
> > > +#define IMX290_XSOUTSEL_XHSOUTSEL_HSYNC			
(2 << 2)
> > > +#define IMX290_INCKSEL1					
IMX290_REG_8BIT(0x305c)
> > > +#define IMX290_INCKSEL2					
IMX290_REG_8BIT(0x305d)
> > > +#define IMX290_INCKSEL3					
IMX290_REG_8BIT(0x305e)
> > > +#define IMX290_INCKSEL4					
IMX290_REG_8BIT(0x305f)
> > > 
> > >  #define IMX290_PGCTRL					
IMX290_REG_8BIT(0x308c)
> > > 
> > > +#define IMX290_ADBIT1					
IMX290_REG_8BIT(0x3129)
> > > +#define IMX290_ADBIT1_10BIT				
0x1d
> > > +#define IMX290_ADBIT1_12BIT				
0x00
> > > +#define IMX290_INCKSEL5					
IMX290_REG_8BIT(0x315e)
> > > +#define IMX290_INCKSEL6					
IMX290_REG_8BIT(0x3164)
> > 
> > Any reason to skip the bit defines for both supported input clocks?
> 
> I don't have access to information that describes the bits in those two
> registers, just magic values for the 37.125 MHz and 74.25 MHz input
> clocks. Would you happen to know more ?

See [1] and line 354 as well. This register is depending on the external 
clock.

[1] https://github.com/tq-systems/linux-tqmaxx/blob/TQMa8-fslc-5.10-2.1.x-imx/
drivers/media/i2c/imx290.c#L344

> > > +#define IMX290_ADBIT2					
IMX290_REG_8BIT(0x317c)
> > > +#define IMX290_ADBIT2_10BIT				
0x12
> > > +#define IMX290_ADBIT2_12BIT				
0x00
> > > 
> > >  #define IMX290_CHIP_ID					
IMX290_REG_16BIT(0x319a)
> > > 
> > > +#define IMX290_ADBIT3					
IMX290_REG_16BIT(0x31ec)
> > > +#define IMX290_ADBIT3_10BIT				
0x37
> > > +#define IMX290_ADBIT3_12BIT				
0x0e
> > > +#define IMX290_REPETITION				
IMX290_REG_8BIT(0x3405)
> > > 
> > >  #define IMX290_PHY_LANE_NUM				
IMX290_REG_8BIT(0x3407)
> > > 
> > > +#define IMX290_OPB_SIZE_V				
IMX290_REG_8BIT(0x3414)
> > > +#define IMX290_Y_OUT_SIZE				
IMX290_REG_16BIT(0x3418)
> > > +#define IMX290_CSI_DT_FMT				
IMX290_REG_16BIT(0x3441)
> > > +#define IMX290_CSI_DT_FMT_RAW10				
0x0a0a
> > > +#define IMX290_CSI_DT_FMT_RAW12				
0x0c0c
> > > 
> > >  #define IMX290_CSI_LANE_MODE				
IMX290_REG_8BIT(0x3443)
> > > 
> > > +#define IMX290_EXTCK_FREQ				
IMX290_REG_16BIT(0x3444)
> > 
> > Same here.
> 
> Same explanation as above :-)

This register also depends on external clock, see [2] and line 228 as well.

[2] https://github.com/tq-systems/linux-tqmaxx/blob/TQMa8-fslc-5.10-2.1.x-imx/
drivers/media/i2c/imx290.c#L218

Best regards,
Alexander

> > > +#define IMX290_TCLKPOST					
IMX290_REG_16BIT(0x3446)
> > > +#define IMX290_THSZERO					
IMX290_REG_16BIT(0x3448)
> > > +#define IMX290_THSPREPARE				
IMX290_REG_16BIT(0x344a)
> > > +#define IMX290_TCLKTRAIL				
IMX290_REG_16BIT(0x344c)
> > > +#define IMX290_THSTRAIL					
IMX290_REG_16BIT(0x344e)
> > > +#define IMX290_TCLKZERO					
IMX290_REG_16BIT(0x3450)
> > > +#define IMX290_TCLKPREPARE				
IMX290_REG_16BIT(0x3452)
> > > +#define IMX290_TLPX					
IMX290_REG_16BIT(0x3454)
> > > +#define IMX290_X_OUT_SIZE				
IMX290_REG_16BIT(0x3472)
> > > 
> > >  #define IMX290_PGCTRL_REGEN				
BIT(0)
> > >  #define IMX290_PGCTRL_THRU				BIT(1)
> > > 
> > > @@ -54,7 +113,7 @@ static const char * const imx290_supply_name[] = {
> > > 
> > >  struct imx290_regval {
> > >  
> > >  	u32 reg;
> > > 
> > > -	u8 val;
> > > +	u32 val;
> > > 
> > >  };
> > >  
> > >  struct imx290_mode {
> > > 
> > > @@ -116,22 +175,16 @@ static const char * const
> > > imx290_test_pattern_menu[] = { };
> > > 
> > >  static const struct imx290_regval imx290_global_init_settings[] = {
> > > 
> > > -	{ IMX290_REG_8BIT(0x3007), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3018), 0x65 },
> > > -	{ IMX290_REG_8BIT(0x3019), 0x04 },
> > > -	{ IMX290_REG_8BIT(0x301a), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3444), 0x20 },
> > > -	{ IMX290_REG_8BIT(0x3445), 0x25 },
> > > -	{ IMX290_REG_8BIT(0x303a), 0x0c },
> > > -	{ IMX290_REG_8BIT(0x3040), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3041), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x303c), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x303d), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3042), 0x9c },
> > > -	{ IMX290_REG_8BIT(0x3043), 0x07 },
> > > -	{ IMX290_REG_8BIT(0x303e), 0x49 },
> > > -	{ IMX290_REG_8BIT(0x303f), 0x04 },
> > > -	{ IMX290_REG_8BIT(0x304b), 0x0a },
> > > +	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
> > > +	{ IMX290_VMAX, 1125 },
> > > +	{ IMX290_EXTCK_FREQ, 0x2520 },
> > > +	{ IMX290_WINWV_OB, 12 },
> > > +	{ IMX290_WINPH, 0 },
> > > +	{ IMX290_WINPV, 0 },
> > > +	{ IMX290_WINWH, 1948 },
> > > +	{ IMX290_WINWV, 1097 },
> > > +	{ IMX290_XSOUTSEL, IMX290_XSOUTSEL_XVSOUTSEL_VSYNC |
> > > +			   IMX290_XSOUTSEL_XHSOUTSEL_HSYNC },
> > > 
> > >  	{ IMX290_REG_8BIT(0x300f), 0x00 },
> > >  	{ IMX290_REG_8BIT(0x3010), 0x21 },
> > >  	{ IMX290_REG_8BIT(0x3012), 0x64 },
> > > 
> > > @@ -177,102 +230,78 @@ static const struct imx290_regval
> > > imx290_global_init_settings[] = {
> > > 
> > >  static const struct imx290_regval imx290_1080p_settings[] = {
> > >  
> > >  	/* mode settings */
> > > 
> > > -	{ IMX290_REG_8BIT(0x3007), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x303a), 0x0c },
> > > -	{ IMX290_REG_8BIT(0x3414), 0x0a },
> > > -	{ IMX290_REG_8BIT(0x3472), 0x80 },
> > > -	{ IMX290_REG_8BIT(0x3473), 0x07 },
> > > -	{ IMX290_REG_8BIT(0x3418), 0x38 },
> > > -	{ IMX290_REG_8BIT(0x3419), 0x04 },
> > > +	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
> > > +	{ IMX290_WINWV_OB, 12 },
> > > +	{ IMX290_OPB_SIZE_V, 10 },
> > > +	{ IMX290_X_OUT_SIZE, 1920 },
> > > +	{ IMX290_Y_OUT_SIZE, 1080 },
> > > 
> > >  	{ IMX290_REG_8BIT(0x3012), 0x64 },
> > >  	{ IMX290_REG_8BIT(0x3013), 0x00 },
> > > 
> > > -	{ IMX290_REG_8BIT(0x305c), 0x18 },
> > > -	{ IMX290_REG_8BIT(0x305d), 0x03 },
> > > -	{ IMX290_REG_8BIT(0x305e), 0x20 },
> > > -	{ IMX290_REG_8BIT(0x305f), 0x01 },
> > > -	{ IMX290_REG_8BIT(0x315e), 0x1a },
> > > -	{ IMX290_REG_8BIT(0x3164), 0x1a },
> > > +	{ IMX290_INCKSEL1, 0x18 },
> > > +	{ IMX290_INCKSEL2, 0x03 },
> > > +	{ IMX290_INCKSEL3, 0x20 },
> > > +	{ IMX290_INCKSEL4, 0x01 },
> > > +	{ IMX290_INCKSEL5, 0x1a },
> > > +	{ IMX290_INCKSEL6, 0x1a },
> > > 
> > >  	{ IMX290_REG_8BIT(0x3480), 0x49 },
> > >  	/* data rate settings */
> > > 
> > > -	{ IMX290_REG_8BIT(0x3405), 0x10 },
> > > -	{ IMX290_REG_8BIT(0x3446), 0x57 },
> > > -	{ IMX290_REG_8BIT(0x3447), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3448), 0x37 },
> > > -	{ IMX290_REG_8BIT(0x3449), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x344a), 0x1f },
> > > -	{ IMX290_REG_8BIT(0x344b), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x344c), 0x1f },
> > > -	{ IMX290_REG_8BIT(0x344d), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x344e), 0x1f },
> > > -	{ IMX290_REG_8BIT(0x344f), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3450), 0x77 },
> > > -	{ IMX290_REG_8BIT(0x3451), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3452), 0x1f },
> > > -	{ IMX290_REG_8BIT(0x3453), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3454), 0x17 },
> > > -	{ IMX290_REG_8BIT(0x3455), 0x00 },
> > > +	{ IMX290_REPETITION, 0x10 },
> > > +	{ IMX290_TCLKPOST, 87 },
> > > +	{ IMX290_THSZERO, 55 },
> > > +	{ IMX290_THSPREPARE, 31 },
> > > +	{ IMX290_TCLKTRAIL, 31 },
> > > +	{ IMX290_THSTRAIL, 31 },
> > > +	{ IMX290_TCLKZERO, 119 },
> > > +	{ IMX290_TCLKPREPARE, 31 },
> > > +	{ IMX290_TLPX, 23 },
> > > 
> > >  };
> > >  
> > >  static const struct imx290_regval imx290_720p_settings[] = {
> > >  
> > >  	/* mode settings */
> > > 
> > > -	{ IMX290_REG_8BIT(0x3007), 0x10 },
> > > -	{ IMX290_REG_8BIT(0x303a), 0x06 },
> > > -	{ IMX290_REG_8BIT(0x3414), 0x04 },
> > > -	{ IMX290_REG_8BIT(0x3472), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3473), 0x05 },
> > > -	{ IMX290_REG_8BIT(0x3418), 0xd0 },
> > > -	{ IMX290_REG_8BIT(0x3419), 0x02 },
> > > +	{ IMX290_CTRL_07, IMX290_WINMODE_720P },
> > > +	{ IMX290_WINWV_OB, 6 },
> > > +	{ IMX290_OPB_SIZE_V, 4 },
> > > +	{ IMX290_X_OUT_SIZE, 1280 },
> > > +	{ IMX290_Y_OUT_SIZE, 720 },
> > > 
> > >  	{ IMX290_REG_8BIT(0x3012), 0x64 },
> > >  	{ IMX290_REG_8BIT(0x3013), 0x00 },
> > > 
> > > -	{ IMX290_REG_8BIT(0x305c), 0x20 },
> > > -	{ IMX290_REG_8BIT(0x305d), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x305e), 0x20 },
> > > -	{ IMX290_REG_8BIT(0x305f), 0x01 },
> > > -	{ IMX290_REG_8BIT(0x315e), 0x1a },
> > > -	{ IMX290_REG_8BIT(0x3164), 0x1a },
> > > +	{ IMX290_INCKSEL1, 0x20 },
> > > +	{ IMX290_INCKSEL2, 0x00 },
> > > +	{ IMX290_INCKSEL3, 0x20 },
> > > +	{ IMX290_INCKSEL4, 0x01 },
> > > +	{ IMX290_INCKSEL5, 0x1a },
> > > +	{ IMX290_INCKSEL6, 0x1a },
> > > 
> > >  	{ IMX290_REG_8BIT(0x3480), 0x49 },
> > >  	/* data rate settings */
> > > 
> > > -	{ IMX290_REG_8BIT(0x3405), 0x10 },
> > > -	{ IMX290_REG_8BIT(0x3446), 0x4f },
> > > -	{ IMX290_REG_8BIT(0x3447), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3448), 0x2f },
> > > -	{ IMX290_REG_8BIT(0x3449), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x344a), 0x17 },
> > > -	{ IMX290_REG_8BIT(0x344b), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x344c), 0x17 },
> > > -	{ IMX290_REG_8BIT(0x344d), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x344e), 0x17 },
> > > -	{ IMX290_REG_8BIT(0x344f), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3450), 0x57 },
> > > -	{ IMX290_REG_8BIT(0x3451), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3452), 0x17 },
> > > -	{ IMX290_REG_8BIT(0x3453), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x3454), 0x17 },
> > > -	{ IMX290_REG_8BIT(0x3455), 0x00 },
> > > +	{ IMX290_REPETITION, 0x10 },
> > > +	{ IMX290_TCLKPOST, 79 },
> > > +	{ IMX290_THSZERO, 47 },
> > > +	{ IMX290_THSPREPARE, 23 },
> > > +	{ IMX290_TCLKTRAIL, 23 },
> > > +	{ IMX290_THSTRAIL, 23 },
> > > +	{ IMX290_TCLKZERO, 87 },
> > > +	{ IMX290_TCLKPREPARE, 23 },
> > > +	{ IMX290_TLPX, 23 },
> > > 
> > >  };
> > >  
> > >  static const struct imx290_regval imx290_10bit_settings[] = {
> > > 
> > > -	{ IMX290_REG_8BIT(0x3005), 0x00},
> > > -	{ IMX290_REG_8BIT(0x3046), 0x00},
> > > -	{ IMX290_REG_8BIT(0x3129), 0x1d},
> > > -	{ IMX290_REG_8BIT(0x317c), 0x12},
> > > -	{ IMX290_REG_8BIT(0x31ec), 0x37},
> > > -	{ IMX290_REG_8BIT(0x3441), 0x0a},
> > > -	{ IMX290_REG_8BIT(0x3442), 0x0a},
> > > -	{ IMX290_REG_8BIT(0x300a), 0x3c},
> > > -	{ IMX290_REG_8BIT(0x300b), 0x00},
> > > +	{ IMX290_ADBIT, IMX290_ADBIT_10BIT },
> > > +	{ IMX290_OUT_CTRL, IMX290_ODBIT_10BIT },
> > > +	{ IMX290_ADBIT1, IMX290_ADBIT1_10BIT },
> > > +	{ IMX290_ADBIT2, IMX290_ADBIT2_10BIT },
> > > +	{ IMX290_ADBIT3, IMX290_ADBIT3_10BIT },
> > > +	{ IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW10 },
> > > +	{ IMX290_BLKLEVEL, 60 },
> > > 
> > >  };
> > >  
> > >  static const struct imx290_regval imx290_12bit_settings[] = {
> > > 
> > > -	{ IMX290_REG_8BIT(0x3005), 0x01 },
> > > -	{ IMX290_REG_8BIT(0x3046), 0x01 },
> > > -	{ IMX290_REG_8BIT(0x3129), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x317c), 0x00 },
> > > -	{ IMX290_REG_8BIT(0x31ec), 0x0e },
> > > -	{ IMX290_REG_8BIT(0x3441), 0x0c },
> > > -	{ IMX290_REG_8BIT(0x3442), 0x0c },
> > > -	{ IMX290_REG_8BIT(0x300a), 0xf0 },
> > > -	{ IMX290_REG_8BIT(0x300b), 0x00 },
> > > +	{ IMX290_ADBIT, IMX290_ADBIT_12BIT },
> > > +	{ IMX290_OUT_CTRL, IMX290_ODBIT_12BIT },
> > > +	{ IMX290_ADBIT1, IMX290_ADBIT1_12BIT },
> > > +	{ IMX290_ADBIT2, IMX290_ADBIT2_12BIT },
> > > +	{ IMX290_ADBIT3, IMX290_ADBIT3_12BIT },
> > > +	{ IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
> > > +	{ IMX290_BLKLEVEL, 240 },
> > > 
> > >  };
> > >  
> > >  /* supported link frequencies */




