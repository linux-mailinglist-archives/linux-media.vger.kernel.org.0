Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B232A85C9
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 19:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730862AbgKESMa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 13:12:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgKESM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 13:12:29 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60848C0613D3
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 10:12:29 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id g12so2842707wrp.10
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 10:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ic+OQ+6OsCx7cFXr4JAm3oNxN2Q6/gjUkT+ZKV1Hdn8=;
        b=z7PPYcDnQviEoc/NsFlZZbqRuYfpjYIygazPCOrkSgHhTI2t+ZgLTpPzO3Zl8poseB
         0rZqhEErwPkjLRMiEaevcCKADxlaiGS0QHxhYz6fV+wLpLfina9I0+F3jr2OSBSj+k5W
         SeqXNp0L+q2rgHZsfM9EmRUTPBi8upchSzrxXPOh9POtBeBFsOHeJyobHvKMeX7WP91k
         5HIkeJVdb32QoUO6rO+DBO7yBqn35/4s5G6uYQRkUqNie8K5vk0tuYMXCr9PZy3Hadxc
         VUmKB/NkmFLZDX1EdjK52aYAb4gkUdWu5L3I1ddLvzodlid/pTO69skeMQk4zG8pK5Zg
         oNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ic+OQ+6OsCx7cFXr4JAm3oNxN2Q6/gjUkT+ZKV1Hdn8=;
        b=AyyDd4M/TF9R8ACwjeVbHldXHZ/qBCzXDiXz9gfbh5jnExjPIcFResPLiGXmCCuR2u
         S83s+zX6L6FlBrCaB0jG5PqNZSpdcWZHALKHgw2gom5d4GQp5HDNW7CpDAdu1IYOJsEd
         6wg4LeF8uYqYZcwqNmrPieqpCmQhEDfN00IMNL42Gh5WhI0Wq0JAXa9whBawGHC09mim
         LKzifcGrLBtnPxZMQaq4qtep2aRf+Nlv/kdET+43vxdSGOdZSdn/G/tk6NubFPB2e5h7
         WVatQDhyXDF/IqobGWcNU7dDnzm/gQJwDtbYcdrSzqrodLytVdbyCCyK0lF2MSUC/VRo
         +T1A==
X-Gm-Message-State: AOAM533TKDgFHwqP6B3XAQf8w29SFJ69ZjMZtsRxxvEPM4er+hmoq1vk
        Q1/ih7DrQ+dZ3lkfQKgciu+xlg==
X-Google-Smtp-Source: ABdhPJwTA5RTYhIiZWN3Q1b8BKggEpACTRVotMVkDJ/e+Bs6VZmMVWLdr8tXiLM5Q6NXEuVyXn6Zbw==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr4571549wrq.106.1604599948074;
        Thu, 05 Nov 2020 10:12:28 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id s12sm3394261wmc.6.2020.11.05.10.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 10:12:27 -0800 (PST)
Date:   Thu, 5 Nov 2020 18:12:23 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        David Francis <David.Francis@amd.com>,
        dri-devel@lists.freedesktop.org,
        Fabio Estevam <festevam@gmail.com>,
        Gareth Hughes <gareth@valinux.com>,
        Huang Rui <ray.huang@amd.com>, Jason Yan <yanaijie@huawei.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jingoo Han <jg1.han@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linaro-mm-sig@lists.linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        Lyude Paul <lyude@redhat.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <rob.clark@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 00/19] [Set 1] Rid W=1 warnings from GPU
Message-ID: <20201105181223.GQ4488@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105163831.GA86540@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201105163831.GA86540@ravnborg.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 05 Nov 2020, Sam Ravnborg wrote:

> Hi Lee.
> 
> On Thu, Nov 05, 2020 at 02:44:58PM +0000, Lee Jones wrote:
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> 
> Thanks for looking into this.
> 
> > There are 5000 warnings to work through.
> > 
> > It will take a couple more sets.
> :-)
> 
> >   gpu: drm: panel: panel-simple: Fix 'struct panel_desc's header
> I have a patch here that inline the comments - and fix the warning as a
> side effect. I will get it posted tonight as this is better.
> 
> >   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
> >     'analogix_dp_write_byte_to_dpcd'
> When I looked at his I had another unused function after removing the
> first.
> 
> >   gpu: drm: panel: panel-ilitek-ili9322: Demote non-conformant
> >     kernel-doc header
> Agree on this simple approch, will apply.
> 
> >   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
> >     'analogix_dp_start_aux_transaction'
> OK, this was the one I referred to above. They should be squashed into
> one patch.

I can squash them if you prefer.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
