Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78A5D68F241
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 16:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbjBHPmD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 10:42:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbjBHPmC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 10:42:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B26A27A
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 07:41:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2D50E79;
        Wed,  8 Feb 2023 16:41:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675870908;
        bh=i51ERP0xrqN7mXHtKDcAXZg79/tk6kkoX8flGdEGcMA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NHFhLeYgXA6hgyLBE8zZQor8DODz1awmM797PLJEeG7HMlZ2QvfXo5T8BVH8rvU1M
         qZPuKlpx11IOkArD49JKDbrl9/mpJB2icHZPJqzIIm5NUo3UwZNfeENXqicGcnPDCi
         YIDLTg/TVNuN/Nkrimcce1vBfSqlisADRkcckfz0=
Date:   Wed, 8 Feb 2023 17:41:46 +0200
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
Message-ID: <Y+PCulPVN7GGz2T7@pendragon.ideasonboard.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <CAHp75VcyvON1-yoBsTsZDmjsA-527xyvF+weEXWcXjO3Y2hBrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHp75VcyvON1-yoBsTsZDmjsA-527xyvF+weEXWcXjO3Y2hBrA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 08, 2023 at 01:27:37PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 8, 2023 at 11:52 AM Laurent Pinchart wrote:
> > On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
> 
> ...
> 
> > > Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > > versions of these register access helpers, so that this code duplication
> > > can be removed.
> >
> > Any reason to hand-roll those instead of using regmap ? Also, may I
> > suggest to have a look at drivers/media/i2c/imx290.c
> 
> While this is a bit error prone example, a patch is on its way, ...

The two cleanups are nice, but they're cleanup, not error fixes :-)

> > for an example of
> > how registers of different sizes can be handled in a less error-prone
> > way, using single read/write functions that adapt to the size
> > automatically ?
> 
> ...with regmap fields I believe you can avoid even that and use proper
> regmap accessors directly.

I haven't looked at regmap fields so I don't know if they're the right
tool for the job. If we can use the regmap API as-is without any
wrapper, even better. Otherwise, new regmap helpers and/or I2C helpers
may also be an option. This is a very common use case, not limited to OV
camera sensors, or even camera sensors in general.

-- 
Regards,

Laurent Pinchart
