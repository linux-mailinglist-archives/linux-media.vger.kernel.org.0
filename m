Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D97169237E
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 17:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbjBJQj1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 11:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbjBJQj1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 11:39:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F5B75F4F
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 08:39:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9F24904;
        Fri, 10 Feb 2023 17:39:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676047153;
        bh=OVWaSRHapYrvP1K43v4EuoEA36uuJ+A5IlLZYjH6QVA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iBlOFlL1B2GuWCas6fuJwmetaW+9SXX4vOLydQkfdXSJY9rm55bmKzVzKjkdFDV7f
         taeiPo5x2SdILNM9U6akRZ9nhBAShCkYrq/UWD2M702NonMgcx8GqZifl64rzDvzz1
         4QMojlFSpa/LvoE69f4wT2sQkijAstpKgws31oPg=
Date:   Fri, 10 Feb 2023 18:39:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+ZzL5gWUg79wDX+@pendragon.ideasonboard.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
 <Y+Y39+IRyjwQi7Jr@kekkonen.localdomain>
 <Y+Zl4UfRN6sgcaf4@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+Zl4UfRN6sgcaf4@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 10, 2023 at 05:42:25PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 10, 2023 at 02:26:31PM +0200, Sakari Ailus wrote:
> > On Fri, Feb 10, 2023 at 01:45:10PM +0200, Laurent Pinchart wrote:
> > > Regarding the width-specific versions of the helpers, I really think
> > > encoding the size in the register macros is the best option. It makes
> > > life easier for driver authors (only one function to call, no need to
> > > think about the register width to pick the appropriate function in each
> > > call) and reviewers (same reason), without any drawback in my opinion.
> > 
> > As I noted previously, this works well for drivers that need to access
> > registers with multiple widths, which indeed applies to the vast majority
> > of camera sensor drivers, but not to e.g. flash or lens VCM drivers. Fixed
> > width registers are better served with a width-specific function. But these
> > can be always added later on.
> 
> Again, we can extend regmap to have something like
> 
> 	int (*reg_width)(regmap *, offset)
> 
> callback added that will tell the regmap bus underneath what size to use.
> 
> In the driver one will define the respective method to return these widths.

I don't think that's worth it, it would make drivers quite complex
compared to encoding the register width in the register address macros.
We're dealing with devices that have hundreds of registers of various
widths interleaved, a big switch/case for every write isn't great.

-- 
Regards,

Laurent Pinchart
