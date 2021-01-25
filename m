Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33BF302D5A
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 22:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732532AbhAYVL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 16:11:56 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:45385 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbhAYVLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 16:11:42 -0500
Received: by mail-ot1-f47.google.com with SMTP id n42so14186367ota.12;
        Mon, 25 Jan 2021 13:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5rv/ynLKLcNOD8tStBWcOGrqLQK2Fpzkv048yHsc+gs=;
        b=A2IfYiHSqMpB8QwAVXyt+3zvDiSoWRzRYAMrqW7iXT3/08exLfiOOJucWHXJJk91Wg
         ezsiODc9SBS6GLDIl//hsZm81zj5DVAwB46e1HXz//x23SPayeBvQYhyTHI0tmn3phrh
         BVk0OYUONllWgm1ChD1liICQHfjzlHVFytVvtUa+yWp21QhY76220C3M1kJZ1id+dmv1
         ns5dKhy3mRkwkwNc7DM07C9Q3M/zxWa1VWRZ1FvqeRmVMjDSsmfgvZeUP+F+cp1NkUuL
         kHifw/A/3+WBqVMK07r58OGgJ1c33tR5HDTnRGV6hGiUmjnyfvIp8YC12v57PjEfu/h+
         tMLw==
X-Gm-Message-State: AOAM532KQYuttAu3IlxSiALmMshFuAUZbvvn5qyZQZVFnCaBIbsUyWWh
        YeO477rvzq2+5Dq2ZvPNEg==
X-Google-Smtp-Source: ABdhPJxDsaucQgVi892KMjm0PBvfYbJsVpa43ZGWtFR8jAosVF8CGYvu0R7Kmmjkkyqeme9P/SisrA==
X-Received: by 2002:a05:6830:1dc8:: with SMTP id a8mr1789278otj.26.1611609061509;
        Mon, 25 Jan 2021 13:11:01 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l70sm3756988oih.56.2021.01.25.13.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 13:11:00 -0800 (PST)
Received: (nullmailer pid 999929 invoked by uid 1000);
        Mon, 25 Jan 2021 21:10:58 -0000
Date:   Mon, 25 Jan 2021 15:10:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     linux-media@vger.kernel.org, vkoul@kernel.org,
        Laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
        jernej.skrabec@siol.net, devicetree@vger.kernel.org,
        kernel@pengutronix.de, mchehab@kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com,
        linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
        robh+dt@kernel.org, a.hajda@samsung.com, shawnguo@kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 06/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Message-ID: <20210125211058.GA999869@robh.at.kernel.org>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
 <1610616132-8220-7-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610616132-8220-7-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 14 Jan 2021 17:22:04 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp display pixel link.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Use graph schema. (Laurent)
> * Require all four pixel link output ports. (Laurent)
> * Mention pixel link is accessed via SCU firmware. (Rob)
> 
>  .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 106 +++++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
