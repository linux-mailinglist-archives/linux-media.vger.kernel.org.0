Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FE72D6444
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 19:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392426AbgLJR74 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 12:59:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:40678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387836AbgLJR7w (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 12:59:52 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 18FE223D57;
        Thu, 10 Dec 2020 17:59:12 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1knQDe-000EFC-23; Thu, 10 Dec 2020 17:59:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 10 Dec 2020 17:59:09 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-rpi-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 01/15] irqchip: Allow to compile bcmstb on other platforms
In-Reply-To: <20201210134648.272857-2-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-2-maxime@cerno.tech>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <e0f1aed2b0007eab6e9192ac73fd411f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: maxime@cerno.tech, eric@anholt.net, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, daniel.vetter@intel.com, airlied@linux.ie, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org, mchehab@kernel.org, tglx@linutronix.de, dave.stevenson@raspberrypi.com, linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On 2020-12-10 13:46, Maxime Ripard wrote:
> The BCM2711 uses a number of instances of the bcmstb-l2 controller in 
> its
> display engine. Let's allow the driver to be enabled through KConfig.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/irqchip/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index c6098eee0c7c..f1e58de117dc 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -131,7 +131,7 @@ config BCM7120_L2_IRQ
>  	select IRQ_DOMAIN
> 
>  config BRCMSTB_L2_IRQ
> -	bool
> +	bool "Broadcom STB L2 Interrupt Controller"
>  	select GENERIC_IRQ_CHIP
>  	select IRQ_DOMAIN

I'm always sceptical of making interrupt controllers user-selectable.
Who is going to know that they need to pick that one?

I'd be much more in favour of directly selecting this symbol
from DRM_VC4_HDMI_CEC, since there is an obvious dependency.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
