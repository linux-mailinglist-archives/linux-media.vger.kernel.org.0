Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5C66226F2
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 10:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiKIJ3x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 04:29:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbiKIJ3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 04:29:51 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B978A1C92C;
        Wed,  9 Nov 2022 01:29:46 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id F376320048;
        Wed,  9 Nov 2022 11:29:41 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1667986182;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TMcDUDiGEL4Agv9pG42gxI6criAHP2kTQk6GXFR7o6k=;
        b=x87uDsUVS3kAkKx7EwtEczL0NjTKwK2nKCsVTdNudiN2E0SWZ5RzwuWhVt2+qtZKpBQ1aU
        anlrOFwxNyOZt6HBxian4fdb6z8szIsiD7SUYxT1SnxPMGK3N58k+zi8Q7cfb6bZpMLsIX
        4+MuqbvaFdvaBKNDyI9LjwarDLKKD8w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1667986182;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TMcDUDiGEL4Agv9pG42gxI6criAHP2kTQk6GXFR7o6k=;
        b=TtB0oyQxUBCSaGxdUzf6NmCYJQPq7tY+n+IYxTCuGheDoGZH2jFNqOIoOeHyn9tNJBfT6f
        IjKGnETR8DdmxcMcESIpdW2WluYIraXWnLyOYRBifoXIau4xTmTNP0djj8EcCkb9NexoC3
        PeikirxXSw71pWRl+Cu8hFBeHM/VQpE=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1667986182; a=rsa-sha256; cv=none;
        b=YGTCKWB2pO9kdU/xAn41kTsbTxN+n4hROLqH2awnsk0eB+P9c3C2Q1+eu+utPeRsqgl4wp
        PN2PlckYa307UaQne7mgnaPpIX4TGY0RrERFqiK1jsX9VgT9CQPp6fGbu1Mi8oa6WKo3UZ
        r7J8zWT5gGVW/gyCzAVCdsoObt2xvRc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 88182634CCC;
        Wed,  9 Nov 2022 11:29:41 +0200 (EET)
Date:   Wed, 9 Nov 2022 11:29:41 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-media@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: exynos4-is: don't rely on the v4l2_async_subdev
 internals
Message-ID: <Y2tzBUXHnZmZNClM@valkosipuli.retiisi.eu>
References: <CGME20220923094232eucas1p1deb3985c9637a0876609c75967175e9b@eucas1p1.samsung.com>
 <20220923094201.18047-1-m.szyprowski@samsung.com>
 <ad5d4efb-c31f-585a-cdc5-c66744deee59@samsung.com>
 <fa77dbaa-e62a-b365-3b54-357e2074932f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa77dbaa-e62a-b365-3b54-357e2074932f@samsung.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On Tue, Nov 08, 2022 at 03:14:14PM +0100, Marek Szyprowski wrote:
> On 05.10.2022 16:47, Sylwester Nawrocki wrote:
> > On 23.09.2022 11:42, Marek Szyprowski wrote:
> >> Commit 1f391df44607 ("media: v4l2-async: Use endpoints in
> >> __v4l2_async_nf_add_fwnode_remote()") changed the data that is stored in
> >> the v4l2_async_subdev internals from the fwnode pointer to the parent
> >> device to the fwnode pointer to the matched endpoint. This broke the
> >> sensor matching code, which relied on the particular fwnode data in the
> >> v4l2_async_subdev internals. Fix this by simply matching the
> >> v4l2_async_subdev pointer, which is already available there.
> >>
> >> Reported-by: Daniel Scally <djrscally@gmail.com>
> >> Fixes: fa91f1056f17 ("[media] exynos4-is: Add support for asynchronous subdevices registration")
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> Gentle ping for merging this fix.

It's in my PR to Mauro:

<URL:https://patchwork.linuxtv.org/project/linux-media/patch/Y1uVp8hHo7DYUK82@valkosipuli.retiisi.eu/>

-- 
Sakari Ailus
