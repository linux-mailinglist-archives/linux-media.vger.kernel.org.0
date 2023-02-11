Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B156933B0
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 21:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjBKUmE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 15:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBKUmC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 15:42:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E14AD35
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 12:41:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DBF66CF;
        Sat, 11 Feb 2023 21:41:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676148115;
        bh=Mom3S0dHFH3hMmjWardYEBLH9uqApCxydug0aecy8Xo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WD8QEIw6bYTv1eqORBSSzyj8dtkJoSm07DF1XxMeh1BUgZxA/Fls2N+m7mcXPw2Qx
         6ro0P4EK2SaboNuQmrpVooMu+OW3FvRsKI+MRQSRXDmRQVQykUKQRVyrqIrzjHWkXe
         K++qEkSoFprRIP9FZWDHgOM2XKozIdwqc84CdjfU=
Date:   Sat, 11 Feb 2023 22:41:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, ezequiel@collabora.com,
        gjasny@googlemail.com, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sakari.ailus@iki.fi, sean@mess.org,
        user.vdr@gmail.com, xavier.claessens@collabora.com
Subject: Re: [PATCH v7 0/5] Switch build system to meson
Message-ID: <Y+f9kQAM0KaE/Y82@pendragon.ideasonboard.com>
References: <20220909134412.21934-1-laurent.pinchart@ideasonboard.com>
 <70f0700c-6fc3-e172-da52-25d484a5e824@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <70f0700c-6fc3-e172-da52-25d484a5e824@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Sep 23, 2022 at 12:54:34PM +0200, Hans Verkuil wrote:
> On 09/09/2022 15:44, Laurent Pinchart wrote:
> > Hello everybody,
> > 
> > This series is the latest (and greatest) attempt to switch v4l-utils
> > from autotools to meson.
> > 
> > Compared to v6, the first noticeable change is that fixups have been
> > squashed into their corresponding commit. Detailed changelogs are now
> > included in individual patches.
> > 
> > The second big change is that the last patch from v6 ("Makefile.am:
> > Distribute meson related files") got replaced by 5/5 which drops
> > autotools support, completing the switch from autotools to meson.
> > 
> > A branch that includes this series can be found at
> > 
> >         git://linuxtv.org/pinchartl/v4l-utils.git meson
> 
> I'm trying to use this new build system in our internal cross compilation
> environment, and I am running into problems.
> 
> What we did with the autotools setup is to configure everything, but just
> build a select set of utilities from the utils directory, without needing to
> link to anything in lib. So basically: cd utils/v4l2-ctl; make; make install
> 
> Trying to cross compile in lib fails with strange errors, but I don't really
> want to build anything in lib anyway, I don't need it at all.
> 
> Is there a way to tell ninja to build just one utility? Or are you forced to
> build everything?

You can build targets individually, for instance

ninja utils/v4l2-ctl/v4l2-ctl

-- 
Regards,

Laurent Pinchart
