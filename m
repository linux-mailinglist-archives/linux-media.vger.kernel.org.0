Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1F732F563
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 22:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhCEVlz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 16:41:55 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:46288 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbhCEVln (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 16:41:43 -0500
Received: by mail-ot1-f45.google.com with SMTP id 97so3188432otf.13;
        Fri, 05 Mar 2021 13:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TuNADRGQs/aq2elAfuxDx5mGvqF72XSZmGQq6TUsz+g=;
        b=iUITGdGqFawQB/XD9PuzFIaEnvhILILXH5OKfYF8XP1LYb8d9hTQWv+6BlMvSUOcK/
         6el6KgyO80l2IRQQJYIqyJ9EUQBP+LWa+WeK0wRy6E9+mtxt7xrPWCrPsAB7rpjZvSL1
         D15iHvHmz9IlWjAUjx90TAUEd5lbBSvEDJqdgeK5Jb5Z6+gtwP2kPD4RNHAUvjYRxBZR
         BwEoosLsDl3YASUTJwvH30E5gT8oSOqVgJT8gNtYVXrM7rGDTtpmA24Ss9vmyOe18Mb0
         LqaA0YlJrIL8ICFd5ctb+aC8u/WxmjRlRlpBabpMcROWFSKNC/0TTKo8SCYr336cF0GS
         rKpQ==
X-Gm-Message-State: AOAM53070zJSd84UCC2n21iGVjKqWDxn47GHx3VuuBgci8xYWU9UaMiY
        0bw/GZw8SQ9H3ZnxYJJ8vg==
X-Google-Smtp-Source: ABdhPJw9O7L+6Yhujdec4829irVylAv0JPjuW79mOwLp+5uaAoiaoV1Vp8mfHAhqBDitcY9j4AYrDA==
X-Received: by 2002:a9d:6f09:: with SMTP id n9mr9937132otq.352.1614980503103;
        Fri, 05 Mar 2021 13:41:43 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f197sm857749oob.38.2021.03.05.13.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 13:41:42 -0800 (PST)
Received: (nullmailer pid 694682 invoked by uid 1000);
        Fri, 05 Mar 2021 21:41:41 -0000
Date:   Fri, 5 Mar 2021 15:41:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v2 58/77] dt-bindings: media: nxp,imx7-mipi-csi2: Drop
 the reset-names property
Message-ID: <20210305214141.GA694630@robh.at.kernel.org>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <20210215042741.28850-59-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215042741.28850-59-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 15 Feb 2021 06:27:22 +0200, Laurent Pinchart wrote:
> The reset-names property is incorrect, as it references the reset of the
> MIPI D-PHY master, which is used by the DSI controller. Fixing the
> property name would create backward-compatibility issues. As the device
> has a single reset, we can instead drop reset-names completely, which
> also simplifies the binding.
> 
> Fix the example accordingly to use the correct reset.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
> ---
>  .../devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml        | 5 -----
>  1 file changed, 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
