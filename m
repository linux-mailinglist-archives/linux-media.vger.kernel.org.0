Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46C252DA3FC
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 00:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408949AbgLNXNR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 18:13:17 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39697 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408924AbgLNXNO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 18:13:14 -0500
Received: by mail-oi1-f193.google.com with SMTP id w124so18074441oia.6;
        Mon, 14 Dec 2020 15:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xEzETSLwFb14jsmrw0FlyX7cWx9XxZAaCfC6Tl6Q1gM=;
        b=OLh66mHEF4OxGlq+ZYHC/k28Wvc1y2sgqQe5j7jrkHI+1/qSYJ5/h44hwVCEJypJbh
         NUGToZGcNfyO/tX1yDZYdG+xgK8xzy+ljp+3BZQoeoCiD3SH5NUWciWMo830U6gZaTa7
         3fVem+h7PLlgXYPnq6GKmbKkdHhr9kV/HMy37WE+gT771C1dg9+mYC2EnHrdFOvwclGn
         O589F7OrlmUnJOlKxUpfYR77QZhGlxQ4QVRig/Qoa0otv7mqhiI6NxZeu1YTa70skPHR
         ggRO3lTWyX+U0k1h6A1Be1Uxt4qyaYBvqn3dlk6waEHd8lE1o3rVm9KeZXKAFJQ62RYr
         qYVQ==
X-Gm-Message-State: AOAM5302ztfkPAZLaNTHWoWABa61qm7EIiDwPeEhFstoeq92XmDe87kW
        owT9dB2w4M/v1tUP3DT/aw==
X-Google-Smtp-Source: ABdhPJzA/b4BevvSdW2BPBsRNI6l4NaGaCBla97jZ3xzwyR9BVSTVxGIWmfwoPP1/8/7Q5HiUv26Hw==
X-Received: by 2002:aca:3554:: with SMTP id c81mr15514729oia.23.1607987553638;
        Mon, 14 Dec 2020 15:12:33 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i82sm4612225oif.33.2020.12.14.15.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 15:12:32 -0800 (PST)
Received: (nullmailer pid 2557998 invoked by uid 1000);
        Mon, 14 Dec 2020 23:12:31 -0000
Date:   Mon, 14 Dec 2020 17:12:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-sunxi@googlegroups.com,
        linux-media@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        kevin.lhopital@hotmail.com,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yong Deng <yong.deng@magewell.com>,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH v3 06/15] dt-bindings: media: sun6i-a31-csi: Add MIPI
 CSI-2 input port
Message-ID: <20201214231231.GA2555279@robh.at.kernel.org>
References: <20201211155708.154710-1-paul.kocialkowski@bootlin.com>
 <20201211155708.154710-7-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211155708.154710-7-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 11 Dec 2020 16:56:59 +0100, Paul Kocialkowski wrote:
> The A31 CSI controller supports two distinct input interfaces:
> parallel and an external MIPI CSI-2 bridge. The parallel interface
> is often connected to a set of hardware pins while the MIPI CSI-2
> bridge is an internal FIFO-ish link. As a result, these two inputs
> are distinguished as two different ports.
> 
> Note that only one of the two may be present on a controller instance.
> For example, the V3s has one controller dedicated to MIPI-CSI2 and one
> dedicated to parallel.
> 
> Update the binding with an explicit ports node that holds two distinct
> port nodes: one for parallel input and one for MIPI CSI-2.
> 
> This is backward-compatible with the single-port approach that was
> previously taken for representing the parallel interface port, which
> stays enumerated as fwnode port 0.
> 
> Note that additional ports may be added in the future, especially to
> support feeding the CSI controller's output to the ISP.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/allwinner,sun6i-a31-csi.yaml        | 88 ++++++++++++++++---
>  1 file changed, 75 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

Though, it may need updating to use video-interfaces and graph 
schemas[1] depending what lands first.

[1] https://lore.kernel.org/linux-devicetree/20201210211625.3070388-4-robh@kernel.org/
