Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3340E4C5C61
	for <lists+linux-media@lfdr.de>; Sun, 27 Feb 2022 15:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbiB0OlQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Feb 2022 09:41:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiB0OlQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Feb 2022 09:41:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB175AED8
        for <linux-media@vger.kernel.org>; Sun, 27 Feb 2022 06:40:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A547478;
        Sun, 27 Feb 2022 15:40:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645972837;
        bh=XXHHt+QclRwHT6JgWDV/mQfM/1YEEroYA3EUNjExmls=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cvgIktbLhZD1wKVJtXadMOo82k9UA+2PgFJoqtYQCEim0CxOSPQlN+1CgWv5ExFbb
         GHXYOl9zTlDp8HY+34ySW1Gc8T539hQ41VQ4fNLU5tG2HJwbRQa8y0ZpMU/ZxKm0t+
         Usf2qrd+cp9gVylynmDX+CFJ4pnG4DoJL9ozGW2k=
Date:   Sun, 27 Feb 2022 16:40:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tfiga@chromium.org, helen.fornazier@gmail.com,
        kernel@collabora.com, Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH] media: MAINTAINERS: update rksip1 maintainers info
Message-ID: <YhuNWceDZKzG2m23@pendragon.ideasonboard.com>
References: <20220226113538.13105-1-dafna@fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220226113538.13105-1-dafna@fastmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

(CC'ing Paul)

Thank you for the patch.

On Sat, Feb 26, 2022 at 01:35:38PM +0200, Dafna Hirschfeld wrote:
> Due to changes in maintainers info/position

We're actively working on this driver, do you want a co-maintainer ?

> Signed-off-by: Dafna Hirschfeld <dafna@fastmail.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 83d27b57016f..2d6682e6d86c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16621,8 +16621,7 @@ F:	Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
>  F:	sound/soc/rockchip/rockchip_i2s_tdm.*
>  
>  ROCKCHIP ISP V1 DRIVER
> -M:	Helen Koike <helen.koike@collabora.com>
> -M:	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> +M:	Dafna Hirschfeld <dafna@fastmail.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-rockchip@lists.infradead.org
>  S:	Maintained

-- 
Regards,

Laurent Pinchart
