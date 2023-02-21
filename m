Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97D9E69E2AC
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 15:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbjBUOvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 09:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233887AbjBUOvb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 09:51:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAAB1C5A8
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:51:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C34A519;
        Tue, 21 Feb 2023 15:51:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676991088;
        bh=Waq3PY35xFEhXoL4XPRkn1hm+vov4EKmle1Ndv/hfFs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NerwvLwrQ8CBVcFUa+elc3ZxikJOgILKnS/fuOl8PNax4rNzbsSAyHq1dTkHsDrEY
         Ns0WqH4bi8MLrrxu8ER5h0emmJ5+dLzZbqVU/axtC2URJ/KhvoNI0wv0kchZitnlfz
         AH8EPdjZ3qFas4oVuSWgLWgYWyNGNmsqkudHKXnc=
Date:   Tue, 21 Feb 2023 16:51:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, gjasny@googlemail.com,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar,
        tomi.valkeinen@ideasonboard.com
Subject: Re: [v4l-utils] [PATCH v9 3/7] Add support for meson building
Message-ID: <Y/Tab2i9eA+wcoF2@pendragon.ideasonboard.com>
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221143204.26591-4-laurent.pinchart@ideasonboard.com>
 <0da1d7df-5ba5-c6ce-afa0-3450ea3e8ed3@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0da1d7df-5ba5-c6ce-afa0-3450ea3e8ed3@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Feb 21, 2023 at 03:43:12PM +0100, Hans Verkuil wrote:
> On 2/21/23 15:32, Laurent Pinchart wrote:
> > From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > 
> > Supports building libraries and tools found in contrib/, lib/ and
> > utils/ directories, along with the implemented gettext translations.
> > 
> > Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Acked-by: Gregor Jasny <gjasny@googlemail.com>
> > [Gregor: Control symbol visibility]
> > Signed-off-by: Gregor Jasny <gjasny@googlemail.com>
> > Tested-by: Gregor Jasny <gjasny@googlemail.com>
> > Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > ---
> > Changes since v8:
> > 
> > - Fix LIBTRACER_PATH
> > - Update project version to 1.22.0
> 
> I don't think this is right: 1.22.0 has already been released, see the
> tags in the git repo: https://git.linuxtv.org/v4l-utils.git/
> 
> The current development version number is 1.23.0 (releases are even,
> development has odd version numbers).

Indeed, my bad. I'll fix that.

> I wonder if we shouldn't make a 1.24 stable release first without this patch
> series, then introduce meson with version 1.25. Besides, the last stable release
> was 16 months ago, so I think it is high time for a new stable anyway.

Works for me.

> Gregor, any opinion?
> 
> > - Update installation documentation to specify build directory in
> >   command lines
> > - Move '-I.' from common_arguments to v4l2_utils_incdir_arr

-- 
Regards,

Laurent Pinchart
