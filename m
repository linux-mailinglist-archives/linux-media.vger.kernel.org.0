Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5C5C4B999E
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 08:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235979AbiBQHIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 02:08:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236022AbiBQHIk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 02:08:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11CC298AF4
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 23:08:26 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E023B25B;
        Thu, 17 Feb 2022 08:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645081705;
        bh=ym111bQMWrmQIUil42X3y/xx90T4X21a11qs+v4sPsA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YrWmWW1PTxkjpanlLCg68/ARh9sWuVll1zJ1hQMZDgjbyhDUhifOnEGfkRokJu6Gu
         oDdOobel1XjJ7XWwLdKFCd7YLJzIvdHORJAtsCDTbeqFDmnCNPgOtl7pzr4h62X8IY
         VmHVceogjiMghc41LjMzS83NcBMyoOkJ5aTTIxbc=
Date:   Thu, 17 Feb 2022 09:08:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v4 6/7] media: subdev: add v4l2_subdev_call_state_active()
Message-ID: <Yg30YK3HK52zrF/8@pendragon.ideasonboard.com>
References: <20220216130049.508664-1-tomi.valkeinen@ideasonboard.com>
 <20220216130049.508664-7-tomi.valkeinen@ideasonboard.com>
 <Yg1tC0dLieuZLbXy@pendragon.ideasonboard.com>
 <544bac78-715f-3db8-04f9-086f6fe49521@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <544bac78-715f-3db8-04f9-086f6fe49521@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Thu, Feb 17, 2022 at 06:19:15AM +0200, Tomi Valkeinen wrote:
> On 16/02/2022 23:30, Laurent Pinchart wrote:
> > On Wed, Feb 16, 2022 at 03:00:48PM +0200, Tomi Valkeinen wrote:
> >> Add v4l2_subdev_call_state_active() macro to help calling subdev ops
> >> that take a subdev state as a parameter.
> > 
> > We should not encourage subdev drivers to call into each other. There
> > may be some valid use cases for such a helper at this point, namely in
> > the .start_streaming() implementation in a vb2 queue, but even then, I
> > think it would be best to rework the pipeline start API to lock the
> > states of all subdevs in the pipeline (I've already improved pipeline
> > start on top of your streams series, the locking isn't there yet, but I
> > could give it a try).
> > 
> > On the other hand, this macro could help identifying drivers that handle
> > locking manually, helping reworking them once the pipeline start API
> > handles locking too.
> 
> I use this in the cal-video.c to implement the legacy non-MC support. 
> That is a bit special case, and I could do that with a CAL internal 
> helper. So I'm fine with dropping this if there won't be other users.

Ah yes, for legacy support we indeed need something. There are likely
other drivers that will need this then (why did we write legacy code in
the first place, really ? :-D). We could keep the macro, but we should
then document it as not being for non-legacy use cases, and not for new
drivers. It would be even nicer if we could enforce that at runtime.

Actually, thinking more about this, how about moving this macro to a new
v4l2-subdev-legacy.h header ?

-- 
Regards,

Laurent Pinchart
