Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88A4D573D53
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 21:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbiGMTrg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 15:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbiGMTrg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 15:47:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DE120BC2
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 12:47:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74A14305;
        Wed, 13 Jul 2022 21:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657741652;
        bh=iiyc2mWwY3Tniixzfn13YpZB6QiW5gtGfapf7vZ6Cio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uWXnoSrKSC9brNiZ6S70lgrHrZiu5Ib3PgdopQPRFdxaUxI9sf2tCxzs0RfoHGLsM
         yNJwN0BImaPuWZSPM8K8XswarzHKBdrjANY8DD5mRn40mVG8+gE0ggrvIz5cWNyCw5
         1Y5wW6VWLg3HY27Cv02j23Yx5Q8tn5gCira4hRwk=
Date:   Wed, 13 Jul 2022 22:47:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] v4l: Kconfig: Drop subdev API option help text
Message-ID: <Ys8hNg87Ar9MTryZ@pendragon.ideasonboard.com>
References: <20220713173920.222394-1-sakari.ailus@linux.intel.com>
 <Ys8GxF91rx32ZRAX@pendragon.ideasonboard.com>
 <Ys8d54l85k8Cwxne@pendragon.ideasonboard.com>
 <Ys8fzV1H8iFwqoHA@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ys8fzV1H8iFwqoHA@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 13, 2022 at 10:41:01PM +0300, Sakari Ailus wrote:
> On Wed, Jul 13, 2022 at 10:32:55PM +0300, Laurent Pinchart wrote:
> > On Wed, Jul 13, 2022 at 08:54:12PM +0300, Laurent Pinchart wrote:
> > > Hi Sakari,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Wed, Jul 13, 2022 at 08:39:20PM +0300, Sakari Ailus wrote:
> > > > The config option text was recently removed, also remove the help text.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Actually, on second thought, isn't it useful to keep the help text as
> > documentation ?
> 
> We haven't generally done that for other such options either. This was
> intended for end users IMO.

I don't have a strong opinion, but this came to my attention when
reviewing your patch that adds selection of GENERIC_PHY_MIPI_DPHY for
sun6i. The GENERIC_PHY_MIPI_DPHY symbol isn't user-selectable but has a
help text. A short documentation is useful in my opinion.

-- 
Regards,

Laurent Pinchart
