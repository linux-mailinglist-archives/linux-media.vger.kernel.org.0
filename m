Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB2166904FB
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 11:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbjBIKen (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 05:34:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjBIKeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 05:34:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E643011663
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 02:31:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED6879CA;
        Thu,  9 Feb 2023 11:31:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675938708;
        bh=IFH57KJA3pDUcEpYqg9pcwc55BqbfsSm4P7fDGdt1i8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mFsBNgLUiK7bvy5e3afQww0e7Bmeyw41OXFxFB1x1YuDD2ogManAcaAC+OunDmCLN
         XOlrkzHlVjmgFntA8sOiaJkS9VN7hRBx/acXVv8nHok7+LlG5gDlWQYttu9C/Ziz2Q
         9+gbtHN37rmZJX1Y+zsCX3i2FZKYid/5viGaZ6bA=
Date:   Thu, 9 Feb 2023 12:31:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+TLk4Oyb4QkJr22@pendragon.ideasonboard.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <CAHp75VcyvON1-yoBsTsZDmjsA-527xyvF+weEXWcXjO3Y2hBrA@mail.gmail.com>
 <Y+PCulPVN7GGz2T7@pendragon.ideasonboard.com>
 <CAHp75VcEaEwFVyAm1QijXjw0tF+D9JSr2JET0RJUNMea4nGMew@mail.gmail.com>
 <Y+PH7V9vggOLDybV@pendragon.ideasonboard.com>
 <CAHp75VeC8UM8WA-EECB98n+DZQ5J5kgdx5yrxnpYjpBRQjtQ-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHp75VeC8UM8WA-EECB98n+DZQ5J5kgdx5yrxnpYjpBRQjtQ-g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Wed, Feb 08, 2023 at 07:31:43PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 8, 2023 at 6:04 PM Laurent Pinchart wrote:
> > On Wed, Feb 08, 2023 at 05:50:26PM +0200, Andy Shevchenko wrote:
> > > On Wed, Feb 8, 2023 at 5:41 PM Laurent Pinchart wrote:
> > > > On Wed, Feb 08, 2023 at 01:27:37PM +0200, Andy Shevchenko wrote:
> > > > > On Wed, Feb 8, 2023 at 11:52 AM Laurent Pinchart wrote:
> > > > > > On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
> 
> ...
> 
> > > > > > > Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > > > > > > versions of these register access helpers, so that this code duplication
> > > > > > > can be removed.
> > > > > >
> > > > > > Any reason to hand-roll those instead of using regmap ? Also, may I
> > > > > > suggest to have a look at drivers/media/i2c/imx290.c
> > > > >
> > > > > While this is a bit error prone example, a patch is on its way, ...
> > > >
> > > > The two cleanups are nice, but they're cleanup, not error fixes :-)
> > >
> > > It depends on which side you look at it. I admit I haven't dug into
> > > the code to see if endianess can be an issue there, but the code
> > > itself is not written well, esp. when one offers it as an example. So
> > > definitely there is a fix on the upper layer.
> >
> > Did I miss something ? Your two patches replace a tiny amount of code
> > with helper functions that don't change any behaviour. It's nicer with
> > those helpers, no question about that, but "not written well" is a bit
> > of a stretch and feels quite insulting.
> 
> Sorry for your feelings, what I meant is the pure educational purposes
> of the example. When one takes the mentioned driver as an example and
> uses the code in a slightly different environment the endianess issue
> may become a real one. That's why we have helpers in kernel to improve
> robustness against blind copy'n'paste approach. It does not mean your
> code is broken per se.

Reference code should be pristine as much as possible, no disagreement
there. That's why I think your two patches are good :-)

> > Feel free to submit patches that
> > add new "well-written" helpers.

-- 
Regards,

Laurent Pinchart
