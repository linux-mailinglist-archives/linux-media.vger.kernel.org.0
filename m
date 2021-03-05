Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7608732F565
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 22:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhCEVm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 16:42:27 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:33979 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhCEVmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 16:42:07 -0500
Received: by mail-ot1-f49.google.com with SMTP id h10so3261419otm.1;
        Fri, 05 Mar 2021 13:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AbsSe+tQapqd3sfaxSbF5JZCY3fN7o31BCHAIM4JOPA=;
        b=Hzn3EByJT2ygo7LI06jVEsS9WA6qxn+WeQu22grHIj+QVNLpTL2E/bvhuVYOWnNQUt
         WzvryvN+lZ7SEk4BsTg1En6OOYzQkDaSSIG3FIZtnystLiJq6CKVgpVLmYirgwTtflkL
         PIhsv1H5L35tAcaHnG6/FHwqS27DagYi+sZO6Lah2A3wHTpToZLgf8FAiA0eLl3klHLf
         zHos9+kKDra2OwS9j0LehtPB1tMAVrcTPsU5TKq59V65SZti/JyIJfIXdURgcb8V0Grt
         P/rZWwZpb6lw3HxOlwHpn+z28EQiqD+qxH5gOMagI10gwnWf+b9T7RmZhTa1/lYs4gxL
         9VrA==
X-Gm-Message-State: AOAM5318UUx8iAcNTw+Sb3XhKg6FmOLLdznR6GkEzjbmzGzILDY+6wwM
        fRFEMXflJ0OAS306lhZs8w==
X-Google-Smtp-Source: ABdhPJwie16wOB6P+F7dMvgiu3dRiLWpDIxZxPJgBNS7NRdC991I54ILw33IyftgcWPlnw/8B2iL/A==
X-Received: by 2002:a05:6830:1241:: with SMTP id s1mr4543591otp.360.1614980526557;
        Fri, 05 Mar 2021 13:42:06 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i21sm884123otj.33.2021.03.05.13.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 13:42:06 -0800 (PST)
Received: (nullmailer pid 695323 invoked by uid 1000);
        Fri, 05 Mar 2021 21:42:05 -0000
Date:   Fri, 5 Mar 2021 15:42:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        devicetree@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 59/77] dt-bindings: media: nxp,imx7-mipi-csi2: Drop
 fsl,csis-hs-settle property
Message-ID: <20210305214205.GA695268@robh.at.kernel.org>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <20210215042741.28850-60-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215042741.28850-60-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 15 Feb 2021 06:27:23 +0200, Laurent Pinchart wrote:
> The fsl,csis-hs-settle property isn't used by the driver anymore. Drop
> it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
> ---
>  .../devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml       | 6 ------
>  1 file changed, 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
