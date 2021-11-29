Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D6F460BBB
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 01:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376386AbhK2AlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Nov 2021 19:41:23 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:35715 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbhK2AjW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Nov 2021 19:39:22 -0500
Received: by mail-oi1-f181.google.com with SMTP id m6so31380491oim.2;
        Sun, 28 Nov 2021 16:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jSca/qz7Xz2AoLTK+/1dfNvABucZ5mhk9L2r3aO62DA=;
        b=vhetq0Z8Rgu0S8rYZWRDlBV4WByBejYYIuktfTHrpiUBDXtjmxSrmz5hzNhzxNX0Oe
         ntDD5MfVlGGDuejSi8eIDnTH51o+jWzloKcfwJOxcES3aYuxAZd0ygBMY/XID/HZGG1n
         CwVcO053xVB/8sx/20A3sufoxjG4g81XbCf5OS96hq0iguC9uQjLchKOOP3i4ttefxxu
         L3UfHwT3GD0/LVxoverkCR4DTN4nRIJeaertQcgQHxhhNIFOBgR/6RthHiXrYJllfwdz
         eioEVH8CQXPav4O69Wo+7LOESr81tQcEJlTQB9rzMKLskaXTfLNYiK57ux0VxIWBAeLe
         NjZA==
X-Gm-Message-State: AOAM533KweQGOLK9avc6jD6bsjyG0k6Pw8rmEBaAtdr1eP2UbRreabj8
        KzQ1GDpFtcqeXyviWsoZBw==
X-Google-Smtp-Source: ABdhPJzM40Rn69ul9X0GXhHAYE0i/NjN5WrFw/dtdtSTOQzLR4BqefZd5S2+ozFxOX9kSKg/smeyTg==
X-Received: by 2002:a05:6808:1589:: with SMTP id t9mr38143955oiw.108.1638146164959;
        Sun, 28 Nov 2021 16:36:04 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
        by smtp.gmail.com with ESMTPSA id be12sm2750673oib.50.2021.11.28.16.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:36:04 -0800 (PST)
Received: (nullmailer pid 2898332 invoked by uid 1000);
        Mon, 29 Nov 2021 00:36:01 -0000
Date:   Sun, 28 Nov 2021 18:36:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     devicetree@vger.kernel.org, shawnguo@kernel.org, linux-imx@nxp.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        rmfrfs@gmail.com, linux-media@vger.kernel.org, mchehab@kernel.org,
        kernel@puri.sm
Subject: Re: [PATCH v3 2/2] dt-bindings: media: document imx8mq support for
 imx7-csi
Message-ID: <YaQgcVuQwr0DhR/B@robh.at.kernel.org>
References: <20211122072708.95269-1-martin.kepplinger@puri.sm>
 <20211122072708.95269-2-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122072708.95269-2-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 22 Nov 2021 08:27:08 +0100, Martin Kepplinger wrote:
> Add the fsl,imx8mq-csi compatible string to the bindings for nxp,imx7-csi.
> The i.MX8MQ SoC contains the same CSI bridge controller as the i.MX7.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
