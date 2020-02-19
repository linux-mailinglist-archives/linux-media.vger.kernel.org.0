Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44CF416524E
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 23:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbgBSWPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 17:15:42 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40831 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgBSWPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 17:15:42 -0500
Received: by mail-ot1-f65.google.com with SMTP id i6so1744871otr.7;
        Wed, 19 Feb 2020 14:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WzIeoOT3NhhISTBLIs8RivW4psLyHoVdfYsEuyb/QSI=;
        b=RYPM00V61j7gc7brP17cjbixFi9BJJbhEVkK4SM6Lw1WYbXJ0u4XPkUecikGQA2BTe
         kSZSYMeNYe7XdmkJXSrvLmCRW5BuyWt6MNeLJAMy4PMp86sxilsGR2SIfF8W41pFv/xk
         RtAYsBbf+rMchcmRMS5k0/Cn8ficVQ86Ap6bhQiW8iQtNIu9z06bEtfoz58YML3r4zfX
         kMdE200UL39XoLbnQq08bDyleaCbJv6WRFsnhJeVY2oQbGM3JqtV344mFZac2sKN/M8P
         FFYrqgg7MgWcMcAPiwrXAev7ujB8LS2mu1bsILro94sPNMMZAOCVz8UvXXAlKpwVH6sU
         5gKg==
X-Gm-Message-State: APjAAAU8bofSI2s3SU1bUHNkqYkuk5SDQZn9dxbFaHtAWyEJUyeqk2Nh
        ssmFIwNO2HWVHigORWQiKw==
X-Google-Smtp-Source: APXvYqxIABp99XeWrJisGt+NiZfYzH1F7NT6JQ1/wtvvqdH4nXrtC5nk7FIFIY5KOBh1PfJ1It659A==
X-Received: by 2002:a05:6830:1203:: with SMTP id r3mr21865059otp.230.1582150541357;
        Wed, 19 Feb 2020 14:15:41 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y13sm373699otk.40.2020.02.19.14.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:15:40 -0800 (PST)
Received: (nullmailer pid 2118 invoked by uid 1000);
        Wed, 19 Feb 2020 22:15:40 -0000
Date:   Wed, 19 Feb 2020 16:15:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        sakari.ailus@linux.intel.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, mchehab+huawei@kernel.org,
        linux-media@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] dt-bindings: media: csi: Fix clocks description
Message-ID: <20200219221540.GA2067@bogus>
References: <20200210100417.78583-1-maxime@cerno.tech>
 <20200210100417.78583-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210100417.78583-2-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 10 Feb 2020 11:04:17 +0100, Maxime Ripard wrote:
> Commit 1de243b07666 ("media: dt-bindings: media: sun4i-csi: Add compatible
> for CSI1 on A10/A20") introduced support for the CSI1 controller on A10 and
> A20 that unlike CSI0 doesn't have an ISP and therefore only have two
> clocks, the bus and module clocks.
> 
> The clocks and clock-names properties have thus been modified to allow
> either two or tree clocks. However, the current list has the ISP clock at
> the second position, which means the bindings expects a list of either
> bus and isp, or bus, isp and mod. The initial intent of the patch was
> obviously to have bus and mod in the former case.
> 
> Let's fix the binding so that it validates properly.
> 
> Fixes: 1de243b07666 ("media: dt-bindings: media: sun4i-csi: Add compatible for CSI1 on A10/A20")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../media/allwinner,sun4i-a10-csi.yaml        | 30 +++++++++++--------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 

Applied, thanks.

Rob
