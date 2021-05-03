Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D42372110
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 22:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbhECUDl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 16:03:41 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:38596 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbhECUDk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 May 2021 16:03:40 -0400
Received: by mail-oi1-f174.google.com with SMTP id d25so6567437oij.5;
        Mon, 03 May 2021 13:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tlVcbWxU8A4MpsymAErnTlb8ex26tnEUc1jrAssV4LI=;
        b=qo7chC7aQxuNxQvLMkkZfP8qStHBS+OF9XMPfNo33+DqXEa+v2+B6KlLddxbQ6Lh8q
         d/3QBmkNVxpjOEwystY/LCAm0rlG2hacs42XcuV+NV3etvB9jhOUgO2hxMFxgs94Ojj9
         SLnoBaHxsAR4XmnCEWWoFzilTKIsoGVUtMLMe3v8wOt9RmizHvDCQN3RKZci5xc/HrB5
         segfqGiie/gpdvA4vbNbrLjdqIwJj8I2XDgaHZNU8fAoPwawaBdS5SxhEH+mqR2gd2gs
         dqterpbM2Obm0R9t03HIbfvsx3wCtceg1g3oZ0EBI4GWblMWLug5rtp3CiwpIig9PtB2
         29qw==
X-Gm-Message-State: AOAM530OxilNDwfqW83c+ciZS/uNVItkX9iB68YyFNvWYlWlBjiwxE50
        FQvImP8ZzES3CR8XRbK5VLd3ldVmHA==
X-Google-Smtp-Source: ABdhPJxxGYe73pUJsg9Hd/f3oZBFw7GMjTo47Hgojq4F4V3KAcPdJLsERFFsd1uEUSR7ArpxIi6CNw==
X-Received: by 2002:a05:6808:982:: with SMTP id a2mr5735571oic.117.1620072166843;
        Mon, 03 May 2021 13:02:46 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d3sm174441oic.48.2021.05.03.13.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 13:02:46 -0700 (PDT)
Received: (nullmailer pid 2298513 invoked by uid 1000);
        Mon, 03 May 2021 20:02:45 -0000
Date:   Mon, 3 May 2021 15:02:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] dt-bindings: media: renesas,vin: Make resets optional on
 R-Car Gen1
Message-ID: <20210503200245.GA2298465@robh.at.kernel.org>
References: <217c8197efaee7d803b22d433abb0ea8e33b84c6.1619700314.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <217c8197efaee7d803b22d433abb0ea8e33b84c6.1619700314.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 29 Apr 2021 14:45:52 +0200, Geert Uytterhoeven wrote:
> The "resets" property is not present on R-Car Gen1 SoCs.
> Supporting it would require migrating from renesas,cpg-clocks to
> renesas,cpg-mssr.
> 
> Fixes: 905fc6b1bfb4a631 ("dt-bindings: rcar-vin: Convert bindings to json-schema")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Note that VIN is not yet enabled in r8a777[89].dtsi.
> ---
>  .../bindings/media/renesas,vin.yaml           | 46 ++++++++++++-------
>  1 file changed, 29 insertions(+), 17 deletions(-)
> 

Applied, thanks!
