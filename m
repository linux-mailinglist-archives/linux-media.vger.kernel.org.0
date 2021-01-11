Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC7A2F2297
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 23:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389791AbhAKWUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 17:20:51 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:35496 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389420AbhAKWUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 17:20:49 -0500
Received: by mail-ot1-f45.google.com with SMTP id i6so435232otr.2;
        Mon, 11 Jan 2021 14:20:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VyFCFff7hYJpxW+Rad4By7LUlx7N6qhPoYPEaO1tJps=;
        b=NxtbbNjHq6wTCHvDZqGd7CCrZuktBH1DDLrVUUMM1eCbueN18rWYeATbjloawk95CZ
         VlUmjyKBTrZQyKO4VErMMZ41Fi3j0uMOnW1pBenVgTDCXPdqONPXXUoLLvnqnfgecS0e
         /Rz/n2OqoWnY9KTPxoHoDtmsGD28haLssjkgdhuUrzoKubQCP0tYXFy6IS9jt+LdNh7J
         le2CZf/xTQlMgSwiRyR3MRs+Oq354cU7TCb/w/BK5Xt7cOaCFGBDDB8p8mAyKvqBIrvF
         XOIouR8lgxfjT8U2mO4gwVEexLu5ie8+oll8cSebexyi7uoSSkuxK+yzxktVslUrL1Z4
         WrMw==
X-Gm-Message-State: AOAM531KjYYU6rV9MFIK1F7uLScHrvo3A3AYSITXXGcPDMvt1fEmcCqg
        ix9B0peSA4A+jFXa6MCXFw==
X-Google-Smtp-Source: ABdhPJwU6Becx7jAKNM9/tRzPRBw1eNYiQOnEXAerdi4abgkEPy3hpSEyntlUQKR5I5QMiNGp8R4gg==
X-Received: by 2002:a9d:5f9a:: with SMTP id g26mr843215oti.241.1610403608789;
        Mon, 11 Jan 2021 14:20:08 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p10sm67054otp.43.2021.01.11.14.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:20:07 -0800 (PST)
Received: (nullmailer pid 3160469 invoked by uid 1000);
        Mon, 11 Jan 2021 22:20:05 -0000
Date:   Mon, 11 Jan 2021 16:20:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Chen-Yu Tsai <wens@csie.org>, Vinod Koul <vkoul@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yong Deng <yong.deng@magewell.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        devel@driverdev.osuosl.org, kevin.lhopital@hotmail.com,
        Maxime Ripard <mripard@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v4 08/15] dt-bindings: media: Add A31 MIPI CSI-2 bindings
 documentation
Message-ID: <20210111222005.GA3160418@robh.at.kernel.org>
References: <20201231142948.3241780-1-paul.kocialkowski@bootlin.com>
 <20201231142948.3241780-9-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201231142948.3241780-9-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 31 Dec 2020 15:29:41 +0100, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the A31 MIPI CSI-2
> controller.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
