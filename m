Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D10302D52
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 22:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732485AbhAYVLB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 16:11:01 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:44247 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732089AbhAYVKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 16:10:32 -0500
Received: by mail-oi1-f180.google.com with SMTP id n7so4388033oic.11;
        Mon, 25 Jan 2021 13:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8EGUy8U2RwJyq81BEAVJtm2VF5/FAEU46s/eVOgFMfY=;
        b=I02/ZqrT58cd8npMS6BWOi8dmx9cCrxCOS6xv22oEq7LvtqxLoSaPabbcOjqDH5dZN
         ztj/QED2M6gqLZww1iBM+wpmfWypn6xwgyk1wUdgSiRrf3CuS/5Pzgh1+iUbBauYGh6t
         +7Om6l7Yd5QhukxL9+Ll+J8D5DF6dumvT8a6nJ7ghJtZY7Jj+nqPO1BD3W7budJ2m837
         ev5FjtGW2pXizPJStn0u5G5b0fdXPHLM6q48w7gkac3+Ftvaz0Nd+BxBoWDPXYO8ZVbS
         uQh3m+OwXYvdEsuyI3s0+RilDjjIZpp5dM9depe4PFPt3juSLvtR8nHpdT3wScW8LjDG
         df5w==
X-Gm-Message-State: AOAM531ASsTZHq4+PlCGEK/+vsmGbPk9SIcc94I7zhraudaSDFXMjhk4
        kvWtAhRMZl4hlfV4UJp1Og==
X-Google-Smtp-Source: ABdhPJw/TL7yZ8JQWTLegv05bAk7wOK5tF1q2AOv/129pN+7Xi2JhuVEPqRl+CgJDDIq7XfPlIDQBA==
X-Received: by 2002:a05:6808:8e3:: with SMTP id d3mr820427oic.10.1611608991785;
        Mon, 25 Jan 2021 13:09:51 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n19sm3702063otk.57.2021.01.25.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 13:09:50 -0800 (PST)
Received: (nullmailer pid 997768 invoked by uid 1000);
        Mon, 25 Jan 2021 21:09:48 -0000
Date:   Mon, 25 Jan 2021 15:09:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     kishon@ti.com, kernel@pengutronix.de, linux-media@vger.kernel.org,
        linux-imx@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
        linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
        s.hauer@pengutronix.de, vkoul@kernel.org, jernej.skrabec@siol.net,
        mchehab@kernel.org, airlied@linux.ie,
        linux-arm-kernel@lists.infradead.org, jonas@kwiboo.se,
        a.hajda@samsung.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
Message-ID: <20210125210948.GA997706@robh.at.kernel.org>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
 <1610616132-8220-5-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610616132-8220-5-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 14 Jan 2021 17:22:02 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp pixel combiner.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Use graph schema. (Laurent)
> * Use enum instead of oneOf + const for the reg property of pixel combiner
>   channels. (Rob)
> 
>  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 144 +++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
