Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E06A331820
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 21:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbhCHUIy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 15:08:54 -0500
Received: from mail-il1-f178.google.com ([209.85.166.178]:39356 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbhCHUIv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 15:08:51 -0500
Received: by mail-il1-f178.google.com with SMTP id d5so10027254iln.6;
        Mon, 08 Mar 2021 12:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=89JRuh9tQEQ6fMlveO5xtA5I/16pwqBqFySAsay3IKY=;
        b=oTWU7csCQosim9rN8U+eyb0WdqmBbQyIfnTYo6H8PkI30ARWsbdG4DuXiqkgrgn7/m
         NiNSSjxYTvfyuOnfJG++d31XbtMty4170CHdH7tPUn5DJbevadbaTvXizsTfcLbtw1L9
         AftcbBhaSubxnivbjE8PdvYoZe9Uo5+YuABupkazGpHWGyjEOiBFpz7fZ+nwfO1fWcPf
         M7Chh54mmsi/knQwf6KMrYh41W9lStpZmBLCm9EQttV+eu7H4n/csjj/lmslPX8njour
         md3DmVTRXj68JXNP8/2EqvJKDpqWJoLYGTPuX3d5mFaa1CHygv9HO53BcaFsixK7TXFP
         fcyg==
X-Gm-Message-State: AOAM530memOi7VRQmmtCH+3JUypqAbXil8+zpnUP1R/+BtKQ45/JTCrM
        T8uQkfNz36Or9/0zbXMz2g==
X-Google-Smtp-Source: ABdhPJzxiaNR6oqsqybVnTWQJpRAagmn1BRONpJwC44uPTv4w+VvgAh7BNmETS8Lx8C9BXE/DJ1/8g==
X-Received: by 2002:a92:d5d2:: with SMTP id d18mr3972946ilq.50.1615234130405;
        Mon, 08 Mar 2021 12:08:50 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k3sm6428250ioj.35.2021.03.08.12.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 12:08:49 -0800 (PST)
Received: (nullmailer pid 2879384 invoked by uid 1000);
        Mon, 08 Mar 2021 20:08:47 -0000
Date:   Mon, 8 Mar 2021 13:08:47 -0700
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     p.zabel@pengutronix.de, peng.fan@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-rockchip@lists.infradead.org, shawnguo@kernel.org,
        mchehab@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, dan.carpenter@oracle.com, kernel@collabora.com,
        gregkh@linuxfoundation.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, wens@csie.org, festevam@gmail.com,
        s.hauer@pengutronix.de, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        jernej.skrabec@siol.net
Subject: Re: [PATCH v4 10/11] dt-bindings: media: nxp,imx8mq-vpu: Update
 bindings
Message-ID: <20210308200847.GA2879333@robh.at.kernel.org>
References: <20210303113952.178519-1-benjamin.gaignard@collabora.com>
 <20210303113952.178519-11-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303113952.178519-11-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 03 Mar 2021 12:39:51 +0100, Benjamin Gaignard wrote:
> The current bindings seem to make the assumption that the
> two VPUs hardware blocks (G1 and G2) are only one set of
> registers.
> After implementing the VPU reset driver and G2 decoder driver
> it shows that all the VPUs are independent and don't need to
> know about the registers of the other blocks.
> Remove from the bindings the need to set all blocks register
> but keep reg-names property because removing it from the driver
> may affect other variants.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 4:
> - rebase the change on top of VPU reset patches:
>   https://www.spinics.net/lists/arm-kernel/msg878440.html
> 
> version 2:
> - be more verbose about why I change the bindings
> Keep in mind that series comes after: https://www.spinics.net/lists/arm-kernel/msg875766.html
> without that review and ack it won't work
> 
>  .../bindings/media/nxp,imx8mq-vpu.yaml        | 46 ++++++++++++-------
>  1 file changed, 30 insertions(+), 16 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
