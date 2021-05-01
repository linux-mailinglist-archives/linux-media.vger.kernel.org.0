Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF1137073B
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 14:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbhEAMop convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 1 May 2021 08:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbhEAMol (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 May 2021 08:44:41 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23845C06174A
        for <linux-media@vger.kernel.org>; Sat,  1 May 2021 05:43:50 -0700 (PDT)
Received: from chickenburger.collabora.co.uk (chickenburger.collabora.co.uk [46.235.227.242])
        by bhuna.collabora.co.uk (Postfix) with ESMTP id 82F0B1F434E5;
        Sat,  1 May 2021 13:43:48 +0100 (BST)
From:   "Ezequiel Garcia" <ezequiel@collabora.com>
In-Reply-To: <9bde97ea-aea7-3db4-407b-2ac9e13a9a28@xs4all.nl>
Content-Type: text/plain; charset="utf-8"
X-Forward: 190.2.109.197
Date:   Sat, 01 May 2021 13:43:48 +0100
Cc:     "Linux Media Mailing List" <linux-media@vger.kernel.org>,
        "Daniel Almeida" <daniel.almeida@collabora.com>,
        =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
        "Nicolas Dufresne" <nicolas@ndufresne.ca>,
        "Jonas Karlman" <jonas@kwiboo.se>,
        "Maxime Ripard" <mripard@kernel.org>,
        "Paul Kocialkowski" <paul.kocialkowski@bootlin.com>
To:     "Hans Verkuil" <hverkuil@xs4all.nl>
MIME-Version: 1.0
Message-ID: <49b1-608d4d00-2b-62afdf80@101971638>
Subject: =?utf-8?q?Re=3A?= [RFC] Moving codec drivers out of staging
User-Agent: SOGoMail 5.0.1
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Friday, April 30, 2021 03:48 -03, Hans Verkuil <hverkuil@xs4all.nl> wrote: 
 
> Hi all,
> 
> I just posted the pull request to move the MPEG-2 stateless codec API out of staging,
> so after that only the HEVC stateless codec API is still in staging.
> 
> I think it is time to move the stateless codec drivers out of staging, and use a
> kernel config option to enable/disable the staging HEVC API:
> 
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

Hantro HEVC patches are posted :-)

> Same question for rkvdec, that too looks ready to move over to mainline.
> 

These drivers are used in production, so moving out of staging sounds great.  

Note that we have some patches for Hantro (SAMA5 support and HEVC support). I wouldn't want to ask a rebase for these, so can we first merge them and then move? It all sounds doable in the next cycle.

Thanks a lot!
Ezequiel

