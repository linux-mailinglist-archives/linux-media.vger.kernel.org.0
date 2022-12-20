Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85EA6651D8B
	for <lists+linux-media@lfdr.de>; Tue, 20 Dec 2022 10:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233253AbiLTJgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Dec 2022 04:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbiLTJgk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Dec 2022 04:36:40 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF361123;
        Tue, 20 Dec 2022 01:36:39 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkv67ytyxtq-05sj69vvy-3.rev.dnainternet.fi [IPv6:2001:14ba:4475:b040:1383:7fec:bcfa:ec62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 3D8CC1B001B6;
        Tue, 20 Dec 2022 11:36:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1671528996;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=83o3+NNaC/IgbT55ZoIsDuRVomAnlgiNTgekNRp8Oe4=;
        b=N/estAzXDOLwJ/ZgEDSd5fUkF9asqAQZoDXq7Dxv+kNjokoUKgxMp/2fRmo06bO+1zIS9N
        M54qcPjz1GPwIGlq6twaXCCQz5TpuU0fhNY5fBNer5xxD4F6LIetJ1KO0ktSPr2nbk2ktd
        GA1BmXTiZQO2ETEU57u4+kKCFPXhUKgMm+TiagDFXG9yl2AYdh0nrbVImtANyBDWZN0YWy
        FvxgBxk2wUaHGzNgysOrAcn0apaDd/rYHvGsQ6TvXqt/yi5/Fh1Llj/CozBl79wWnkmHZh
        lQIblgZ1wMtbgVXjSMXXxpD3i+zCqPXe2sLD9oHxKCobgUGDz99Mw+vfIfIcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1671528996;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=83o3+NNaC/IgbT55ZoIsDuRVomAnlgiNTgekNRp8Oe4=;
        b=PNbx2Hbg9paDq7amLvz6wBqL7uRPv1ZhD8LA9Gd0O/MFnPBNtDmhvk4/Hsz5lDMDle+whj
        F8CqNKBFpVxiX4lRlz7Hz88BoPhmNg0KybZiyG1gIORRv713z3eoqI1BpIeR1uHJEUn45e
        IrX+t6gNCamFQ+BsC0V86P8x1axoltmr6erG8XADhH22RGRiqR92BhFSMyQQCbzf8dJWZj
        oU1Hm50fL2KB0FR5e1eDrck3YGXdwmEhNrRjIxZ5n+i6Itc7+JS/KPwp61Q9UwUQ+HRNs+
        a3ly0rm3TuBUANdo39KQtFv+ep22B6Ax0OtKmbO7MpWovbn1ixdu+JMVVD4D2Q==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1671528996; a=rsa-sha256;
        cv=none;
        b=ZHaNfD4cQR0HwvJFj8seG1y4wTYjzRdUGR4HytEMS8GbF6CaNeF9PZQutfopf8+xucYCsT
        cypEOVhaZVG5myIpVeGrx40kvqGScHnfbqRQigtyQl/qDQ0XDnS2p5hn7dU5CyLJArftT1
        RNvn4OnGNvNqe8Le9TYdkaKvMmkvqDL3/L96/BzIBX0z3yht4OaeQis/WbG88xdkpjmTyj
        PKg0L2naxtM/677oJU7lyQH15PGJPoB5e+r4v8H7bosBT6xbtS81meklx3ZQ555uOqZFNq
        q4nX5pFOkAGtReZJokAKCCBYIc/s0cYLrKIrTrllQd/4aYUj28NTvOk6x4q87g==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C667C634C92;
        Tue, 20 Dec 2022 11:36:35 +0200 (EET)
Date:   Tue, 20 Dec 2022 11:36:35 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 7/7] drm: rcar-du: Add new formats (2-10-10-10 ARGB,
 Y210)
Message-ID: <Y6GCI3PV3/WhyZBR@valkosipuli.retiisi.eu>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6Db2C+JehUPYSQp@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6Db2C+JehUPYSQp@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Dec 19, 2022 at 11:47:04PM +0200, Laurent Pinchart wrote:
> Hi Tomi,
> 
> (CC'ing Sakari and Hans)
> 
> Thank you for the patch.
> 
> On Mon, Dec 19, 2022 at 04:01:39PM +0200, Tomi Valkeinen wrote:
> > Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010 and Y210.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 24 +++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 49 +++++++++++++++++++++++++--
> >  2 files changed, 71 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index 8c2719efda2a..8ccabf5a30c4 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -259,6 +259,24 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> >  		.bpp = 32,
> >  		.planes = 1,
> >  		.hsub = 1,
> > +	}, {
> > +		.fourcc = DRM_FORMAT_RGBX1010102,
> 
> Ah, here the format makes sense.
> 
> > +		.v4l2 = V4L2_PIX_FMT_XBGR2101010,
> 
> But this is horrible :-( Could we use the same names as DRM for new
> formats, when there is no conflict with existing V4L2 formats ?
> 
> Sakari, Hans, what do you think ? Please see patch 1/7 in the series for
> the format definitions.

I think it'd be good to have only one set of definitions.

Can we can sort the endianness question in a reasonable way?

Also new Bayer formats will probably be still needed on V4L2 side but will
they be relevant for DRM? I suppose that would mean new DRM format for
each pixel order, too? Or can we think of something smarter that would
still work reasonably with existing formats?

-- 
Kind regards,

Sakari Ailus
