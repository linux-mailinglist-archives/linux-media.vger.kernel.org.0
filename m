Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D472FA85B
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 19:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407435AbhARSBO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 13:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406376AbhARSAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 13:00:43 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFD1C061573;
        Mon, 18 Jan 2021 10:00:02 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CF5DBC6398; Mon, 18 Jan 2021 17:59:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1610992798; bh=dUnol4dNLt4sxGL9jTPjSsDKqZnkTEIQQ+kgAK0Zsa4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k23ozMbBIxCmX0mx16Dztfjapk5c303qZVpO73WYW4utMCqh4h3PRRVfNpxn1e12a
         YXEFOk3vGxucBQ8mQD4CGjrTpWsKBYxcaikcf5w2aL1wLiKH0KlerboKaIHpan8Yp5
         SANkCM5DS2S3NOyDuYMou6y4hB5WsUugoPIBwiT2uYv83V+dmuW8PGPz+c+TSqQmfn
         43AS7QUFymR5bRrzh/qQbH6w4BpGCEwsQW1pcxECP6NpJOT48Y143oYSnq6peKQb4K
         oEAhXc+4a4dxKULm1hhDZ5IgzNqqIMc8pWrZeQUb4roTxqhmXaUxRFh3vYjd4qxxeM
         9tbKyXPfR2zZw==
Date:   Mon, 18 Jan 2021 17:59:58 +0000
From:   Sean Young <sean@mess.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 0/4] media: sunxi-cir: Cleanup and power management
Message-ID: <20210118175958.GA3682@gofer.mess.org>
References: <20210118060048.22267-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118060048.22267-1-samuel@sholland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 18, 2021 at 12:00:44AM -0600, Samuel Holland wrote:
> This series cleans up some dead code in the sunxi-cir driver and adds
> system power management hooks.
> 
> ---
> Changes from v1:
>   - Unregister the RC device first thing in sunxi_ir_remove() [3]
> 

Thanks. I've tested it on my Cubieboard1 and everything looks fine.

I've applied it to my tree.

Sean

> Samuel Holland (4):
>   media: sunxi-cir: Clean up dead register writes
>   media: sunxi-cir: Remove unnecessary spinlock
>   media: sunxi-cir: Factor out hardware initialization
>   media: sunxi-cir: Implement suspend/resume/shutdown callbacks
> 
>  drivers/media/rc/sunxi-cir.c | 169 ++++++++++++++++++++---------------
>  1 file changed, 95 insertions(+), 74 deletions(-)
> 
> -- 
> 2.26.2
