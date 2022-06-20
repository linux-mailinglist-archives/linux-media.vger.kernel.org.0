Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6568855176E
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 13:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240183AbiFTL2x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 07:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240776AbiFTL2u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 07:28:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E2014039
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 04:28:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9358225B;
        Mon, 20 Jun 2022 13:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655724525;
        bh=X6NZeA2/LFb1yuXoLh9Mi1avKYLUZKcSC/DsKhHwAVw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eX2d69OGW+VIymHTMKWv5kktaSAe0IGP1b2+gjdFo9kwKfstfRS8e5S3sfQiugXZN
         5d6xskXUYQC2TuPAkeOF2L3b2vwfnHw37t7qmBFpsDMTtUkD+RuBPEzhi+Y9MUUAtF
         rUa63WMVMpIXfKjGbmjs8kz/YfHanym5652UtZHo=
Date:   Mon, 20 Jun 2022 14:28:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: stm32: dcmi: Switch to __v4l2_subdev_state_alloc()
Message-ID: <YrBZ3t8LtnLM700I@pendragon.ideasonboard.com>
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 20, 2022 at 12:44:02PM +0300, Tomi Valkeinen wrote:
> On 19/06/2022 02:16, Laurent Pinchart wrote:
> > Hi Marek,
> > 
> > CC'ing Tomi to get his opinion.
> > 
> > On Sun, Jun 19, 2022 at 12:24:42AM +0200, Marek Vasut wrote:
> >> Any local subdev state should be allocated and free'd using
> >> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
> >> takes care of calling .init_cfg() subdev op. Without this,
> >> subdev internal state might be uninitialized by the time
> >> any other subdev op is called.
> 
> Does this fix a bug you have? Wasn't this broken even before the active 
> state, as init_cfg was not called?
> 
> In any case, I think we have to do something like this, as the source 
> subdev might depend on a valid subdev state.
> 
> It's not very nice to have the drivers using __v4l2_subdev_state_alloc, 
> though. But if non-MC drivers are not going away,

You know my opinion on this :-) We shouldn't have any new user of
__v4l2_subdev_state_alloc() in new drivers, but fixing issues in
existing drivers is a valid use case. I'd like if the dcmi driver could
be converted to be MC-centric, but that will likely not happen.

> and if they are going 
> to be calling ops in other subdevs with V4L2_SUBDEV_FORMAT_TRY, they 
> need to pass a valid subdev state...
> 
> I don't see a better way right away, so I think this is fine.
> 
> Do we need a v4l2_subdev_call_state_try(), similar to 
> v4l2_subdev_call_state_active()? It would handle allocating the state, 
> calling the op and freeing the state.

I could imagine the user trying multiple operations on the same state,
but maybe a single call is a common enough use case to implement a
dedicated helper ?

-- 
Regards,

Laurent Pinchart
