Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0308A32F56E
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 22:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhCEVoI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 16:44:08 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:34150 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhCEVoB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 16:44:01 -0500
Received: by mail-ot1-f42.google.com with SMTP id h10so3265361otm.1;
        Fri, 05 Mar 2021 13:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Mdhbj/ybzMFgoRBlXJh9obTkm/YPMOJyq2FlFfgheoE=;
        b=F6GFM51/rLgg7KhwM/8H7DZs/wzVRH4OmWEsE3uOmJDHiJpITRX9VQaALy8yQx80hW
         O4kK1Gt8XLfFMaKKJVdaAwp82MKOVhXUj5LyqXHh4fCZSndew+l4IQeBFcieIvfbkHK5
         8VYWR5oelEcbgOr3Q9XevkiQNTeUkYwZeJv6TaoSivMned/901HZgbLlXdRXoEvXYlkt
         vaGRk+tqkviWGxyamnIeF6y87fsGd2sOMVIDmXSBYmdsSFFFANVcIOw4w9S9N+eZFwLc
         LpUoiQyWVWZnbFPD7iUrLuungap8/AaBwHtpzC7HOasfjTC50kXaN0wsV+w81eIb4IJW
         O96Q==
X-Gm-Message-State: AOAM532hKNmYK40NFKf1t8vbs1mhutH6LSK4/VdaCCW39qyGAO6rCP3x
        zzN0zs7+jdlR6cOLbvSCPA==
X-Google-Smtp-Source: ABdhPJyGJVym7uPhsTlT/ptWtpum3ENxuh3fTdQyoDCwDu5TglLaVCob5G69DAOCmejvIoDyDD6XXQ==
X-Received: by 2002:a05:6830:920:: with SMTP id v32mr9931189ott.138.1614980640646;
        Fri, 05 Mar 2021 13:44:00 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y10sm850151otg.77.2021.03.05.13.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 13:44:00 -0800 (PST)
Received: (nullmailer pid 698062 invoked by uid 1000);
        Fri, 05 Mar 2021 21:43:59 -0000
Date:   Fri, 5 Mar 2021 15:43:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v2 61/77] dt-bindings: media: nxp,imx7-mipi-csi2: Expand
 descriptions
Message-ID: <20210305214359.GA698008@robh.at.kernel.org>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <20210215042741.28850-62-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215042741.28850-62-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 15 Feb 2021 06:27:25 +0200, Laurent Pinchart wrote:
> Expand the description of the binding itself and of individual
> properties to include additional information that may not be immediately
> appartent from reading the reference manual. Drop the last sentence of
> the phy-supply description that refers to the driver's implementation.
> 
> While at it, fix the capitalization of MIPI CSI-2 in the title.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 29 +++++++++++--------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
