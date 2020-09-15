Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E772826AE79
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 22:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbgIOUKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 16:10:24 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:35299 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727689AbgIOUJD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 16:09:03 -0400
Received: by mail-il1-f195.google.com with SMTP id y9so4270956ilq.2;
        Tue, 15 Sep 2020 13:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z099OMUu4JAkwl7GyJrAZSH3l2c7R6DshTsxGw2FUyE=;
        b=HMTp2BxsurgdVdzAqiI1u+xz7XCwnMFzyfArYE1EnTC3qijRA32uWrzDriE6RjDjLD
         12zol3q7rdLRsoVh3JXdNC7ssmkMX1dnfClMaQbdyKgPf7V6+pjkbhwboIjC6xyg71u0
         01Sa3TBh5Hr/gbn5BEDPMUYVRffUoPe+SsuwhrFraPToWg2AjZ/pcmSY09K5jmmEeFiU
         a6bQcvXAYEIgSiDt8LAQasNdpmUNdraRUdbTkUZGrhx8bLjW09YC0L8sBJS4iG0KVx1i
         RgW3hSqb1kqUGPxPdXF+3vJ5U0+h84Dg2Ma5eFNKTPEDXkheTtdOsWxVW+1hGCk4gNBv
         5Iiw==
X-Gm-Message-State: AOAM531F1HHPFGPjjEhawpod+wH0Ntiuztcj5ourEyWGryTg8mUwDcwm
        Il5Sxet14B0RNNTfmvvy93RcXPlbovzW86A=
X-Google-Smtp-Source: ABdhPJwJzHD9BVUu9bnff8U/VaTgj5a0GnVvOzzKL4mSzbPCQpKI+xamIwPt0xGqtd2Sn3dTOpqUVQ==
X-Received: by 2002:a92:9907:: with SMTP id p7mr8128232ili.200.1600200533706;
        Tue, 15 Sep 2020 13:08:53 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c6sm5456503ils.86.2020.09.15.13.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 13:08:52 -0700 (PDT)
Received: (nullmailer pid 2422715 invoked by uid 1000);
        Tue, 15 Sep 2020 20:08:51 -0000
Date:   Tue, 15 Sep 2020 14:08:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, luca@lucaceresoli.net,
        devicetree@vger.kernel.org, Leon Luo <leonl@leopardimaging.com>,
        sakari.ailus@linux.intel.com,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-renesas-soc@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v6] dt-bindings: media: imx274: Convert to json-schema
Message-ID: <20200915200851.GA2422660@bogus>
References: <20200912103045.14375-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200912103045.14375-1-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 12 Sep 2020 12:30:45 +0200, Jacopo Mondi wrote:
> Convert the imx274 bindings document to json-schema and update
> the MAINTAINERS file accordingly.
> 
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> 
> v5->v6:
> - Fix supplies description and use uppercase 'V' voltage symbol.
> - Thanks Luca Laurent and Sakari and sorry for dragging this to v6.
> 
> v4->v5:
> - Add optional properties that were upstreamed in v5.9-rc2 in the textual
>   bindings
> - Move them to be lowercase: this patch should be fast-tracked through the
>   fixes branch to make sure it gets in before v5.9 is released, otherwise the
>   textual bindings will have supplies names in uppercase
> 
> ---
>  .../devicetree/bindings/media/i2c/imx274.txt  | 38 ----------
>  .../bindings/media/i2c/sony,imx274.yaml       | 76 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 77 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
