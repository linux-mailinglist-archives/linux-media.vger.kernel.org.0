Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC6C116524B
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 23:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgBSWPW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 17:15:22 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39478 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbgBSWPW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 17:15:22 -0500
Received: by mail-ot1-f66.google.com with SMTP id 77so1752211oty.6;
        Wed, 19 Feb 2020 14:15:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EsyWvJOyrd+rl8zt/yVD/N5zbUQ/a+iWqVsccdyLl7c=;
        b=REDC1tWh2UVn7cCpH8lW3xidpVHkEf5xvVR1usgBxIwEzCsVtfvmKETRffbtIy/f5m
         hpv8dhLjpWzGVjxdHtQkfONXBsENZoJC7O4i1G9F7cjeBdnhfoyTPWe9AG3PkMCvPZEy
         R/Ee7Z6OsLlXASRJBsLjqDFJ756N3ZQSyOy+/kLdF5npi0Va+sIurfY7EYH9Cw7p7J5c
         VcwNY+vwPOmTKYaXGy1J18JY9h9B1aCG3pbDYsIhzhxMAy+P5b/SyRdcCNSa4KVHzgf8
         M7VxydvjP9Y0GeQ5Ks64pXaqyJywCir767yrcdNlSUhBni1IdWAqeJkd4/8FAOfKQc+S
         ci7w==
X-Gm-Message-State: APjAAAWt8KiFDv+6ovIHDQj9ZYVrdwnk8/yaDEcdZV5em8DmXk+tAD6u
        5ClVVChuNANHp52BQr3C0Q==
X-Google-Smtp-Source: APXvYqxrUC2cR1cmZAnZ2pXCjXxrWUGvheKcevmkbL0KODlWdGTFn9ryHxdhD9TA1gW4M9OcUDhS8w==
X-Received: by 2002:a9d:6443:: with SMTP id m3mr20508149otl.20.1582150521498;
        Wed, 19 Feb 2020 14:15:21 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i13sm402628oik.7.2020.02.19.14.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:15:20 -0800 (PST)
Received: (nullmailer pid 1518 invoked by uid 1000);
        Wed, 19 Feb 2020 22:15:20 -0000
Date:   Wed, 19 Feb 2020 16:15:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        sakari.ailus@linux.intel.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, mchehab+huawei@kernel.org,
        linux-media@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/2] dt-bindings: media: csi: Add interconnects properties
Message-ID: <20200219221520.GA1461@bogus>
References: <20200210100417.78583-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210100417.78583-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 10 Feb 2020 11:04:16 +0100, Maxime Ripard wrote:
> The Allwinner CSI controller is sitting beside the MBUS that is represented
> as an interconnect.
> 
> Make sure that the interconnect properties are valid in the binding.
> 
> Fixes: 7866d6903ce8 ("media: dt-bindings: media: sun4i-csi: Add compatible for CSI0 on R40")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/media/allwinner,sun4i-a10-csi.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Applied, thanks.

Rob
