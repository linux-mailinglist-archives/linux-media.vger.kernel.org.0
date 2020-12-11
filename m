Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0C52D6E62
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 04:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392159AbgLKDNK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 22:13:10 -0500
Received: from mail-oo1-f65.google.com ([209.85.161.65]:41028 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389864AbgLKDMu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 22:12:50 -0500
Received: by mail-oo1-f65.google.com with SMTP id q6so1021228ooo.8;
        Thu, 10 Dec 2020 19:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=20FUrkWgYAPacYXxuWXY+xSuM7UzPwHMJmdN/diicTY=;
        b=AGNFSUdDPq9/57f9mlK/N+NsHz3h8CYkH1WiBVo7JEzWScDSBLw+VL/ls6ZP7D81WK
         /+HnmCvcTo9tJquaSqXe8lyhWS25rYy50gmX9TsJ0WiUhbGlFNFGPwk5fNrJ25R8AR9F
         Ck6oxh/S/YPSdWhuPQbgVXZsKHI88/YvaEAwtuZ+3YFvePG8jUqyBO6ZWazTe72v6qsU
         1uv9fkvhTqgNRGUb5ZY88nijAtfXNV48msEWGroUWBULcdYoCsmBf91h2o9+Ncz8chyZ
         OAgKxXvyA6AztpAmtML+deSRgFHHM5vczS2a5wX9vWRR0+MARDKYYf+p7iqZjWGJDCO8
         rb6A==
X-Gm-Message-State: AOAM533xlnLqMjpzVCjigYFnoLtBzGgE9Il1jbEwlzKV5+lHMGUhdAp4
        B07GxQkPlmTShPaqb4abdQ==
X-Google-Smtp-Source: ABdhPJwohjal/Q+JcqCNbtBwiT+Ur1QE8QEtsOSmxZ6JD0zWUlTAcOoTlEyI60ZGWGKBfLTL5wWqQA==
X-Received: by 2002:a4a:bc8d:: with SMTP id m13mr8457514oop.63.1607656329889;
        Thu, 10 Dec 2020 19:12:09 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o63sm1500679ooa.10.2020.12.10.19.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 19:12:08 -0800 (PST)
Received: (nullmailer pid 3555218 invoked by uid 1000);
        Fri, 11 Dec 2020 03:12:07 -0000
Date:   Thu, 10 Dec 2020 21:12:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com, Jonathan Corbet <corbet@lwn.net>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        kevin.lhopital@hotmail.com, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 16/19] dt-bindings: media: Add A83T MIPI CSI-2
 bindings documentation
Message-ID: <20201211031207.GA3555125@robh.at.kernel.org>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-17-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201128142839.517949-17-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 28 Nov 2020 15:28:36 +0100, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the A83T MIPI CSI-2
> controller.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/allwinner,sun8i-a83t-mipi-csi2.yaml | 147 ++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-csi2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
