Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503E53700D4
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 20:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhD3S4e convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 30 Apr 2021 14:56:34 -0400
Received: from mailoutvs45.siol.net ([185.57.226.236]:37899 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231140AbhD3S4e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 14:56:34 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id DB54D52608B;
        Fri, 30 Apr 2021 20:55:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id mz00d_SGf7gT; Fri, 30 Apr 2021 20:55:43 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 8C84D52608C;
        Fri, 30 Apr 2021 20:55:43 +0200 (CEST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 0E69052608B;
        Fri, 30 Apr 2021 20:55:43 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [RFC] Moving codec drivers out of staging
Date:   Fri, 30 Apr 2021 20:55:42 +0200
Message-ID: <3110900.0JWCESFCPG@jernej-laptop>
In-Reply-To: <9bde97ea-aea7-3db4-407b-2ac9e13a9a28@xs4all.nl>
References: <9bde97ea-aea7-3db4-407b-2ac9e13a9a28@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi¨

Dne petek, 30. april 2021 ob 08:48:45 CEST je Hans Verkuil napisal(a):
> Hi all,
> 
> I just posted the pull request to move the MPEG-2 stateless codec API out of
> staging, so after that only the HEVC stateless codec API is still in
> staging.
> 
> I think it is time to move the stateless codec drivers out of staging, and
> use a kernel config option to enable/disable the staging HEVC API:
> 

I agree with that.

> ---------------------------------------------------------------------------
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
> index ca59986b20f8..faa2fbeb29f0 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -22,6 +22,15 @@ if STAGING_MEDIA && MEDIA_SUPPORT
>  # Please keep them in alphabetic order
>  source "drivers/staging/media/atomisp/Kconfig"
> 
> +menuconfig STAGING_MEDIA_HEVC
> +	bool "Support HEVC in stateless codec drivers"
> +	default n
> +	help
> +	  This option allows you to enable support for the HEVC codec in
> +	  stateless codec drivers. The public API for HEVC is still under
> +	  development and is guaranteed to change in the future, so this
> +	  option should not be enabled unless you know what you are doing!
> +
>  source "drivers/staging/media/hantro/Kconfig"
> 
>  source "drivers/staging/media/imx/Kconfig"
> ---------------------------------------------------------------------------
> 
> Is there any reason why hantro cannot be moved to mainline? It doesn't
> support HEVC, so it can just be moved. Ezequiel, can you check the TODO?
> I don't think there is anything there that prevents moving it.
> 
> Same question for rkvdec, that too looks ready to move over to mainline.
> 
> Same question for the cedrus driver, that too should be ready to move.
> It only needs to be patched so that it depends on the suggested kernel
> option above. Everything in the TODO is done, so there is no reason to keep
> it in staging.

There is one note about encoder, but in my opinion that's not really a 
problem. I vote for moving it out of staging.

Best regards,
Jernej



