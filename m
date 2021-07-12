Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C043C64CD
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236730AbhGLUQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:16:27 -0400
Received: from mail-il1-f170.google.com ([209.85.166.170]:43934 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234060AbhGLUQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:16:27 -0400
Received: by mail-il1-f170.google.com with SMTP id w1so18856981ilg.10;
        Mon, 12 Jul 2021 13:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J4BE9HfxaLZmCvwhgA1QvJulPQBGkW1jQI+e/oTW1Ho=;
        b=Mk/VZqQvX6PmBHfwLfr+QU3Nvr3oeRKmiKf9EhtjLR8C5wHqA+O5JWs8PiLTtGF17X
         K13YNaEuPqN7WqmWmeGdpnExKRqF2E7r/PN1bh2m9i1/v1W7TE91Nd7mw8Bm34VAMhFw
         zWbHRhRWT9rIOGU3OBeYVQCL4BE09asbjyrTRmtmArIhX8D6TP5by+bN2BSkanWvRJo+
         kYxmi1wtTHa+f99ERSDYyGumI0CbFCVpT2TefN0eypp6VbV0uBNUlKJmiUX02TfpfU/u
         E7Qs6SoJ9WTWBnd/PLXCmNSAL5zY1WpgywGqf3YmQFhGhp7g8NuGR7RV0W1swswFKRja
         G4iA==
X-Gm-Message-State: AOAM530Aq1jHt+cJRGnhc5xYoPgCLuUNiekHM/Uf+TTOnTB0GSHfTC1d
        q+tin7HBeR7ocjZSrXIP7w==
X-Google-Smtp-Source: ABdhPJzJvSIq3juD8meJlVB+592itIP+P7qaJQlR7fMQnSh7K72wyxxHPKOD+Z2WC0QkyDA4uWbBtQ==
X-Received: by 2002:a92:3302:: with SMTP id a2mr436832ilf.62.1626120817448;
        Mon, 12 Jul 2021 13:13:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p19sm8586263iob.7.2021.07.12.13.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:13:36 -0700 (PDT)
Received: (nullmailer pid 2411363 invoked by uid 1000);
        Mon, 12 Jul 2021 20:13:33 -0000
Date:   Mon, 12 Jul 2021 14:13:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
Cc:     devicetree@vger.kernel.org, robert.chiras@nxp.com,
        linux-arm-kernel@lists.infradead.org, daniel.baluta@nxp.com,
        hverkuil-cisco@xs4all.nl, peng.fan@nxp.com, aisheng.dong@nxp.com,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, Mirela Rabulea <mirela.rabulea@nxp.com>,
        laurentiu.palcu@nxp.com, guoniu.zhou@nxp.com,
        paul.kocialkowski@bootlin.com, mchehab@kernel.org,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        shawnguo@kernel.org, kernel@pengutronix.de, ezequiel@collabora.com,
        p.zabel@pengutronix.de
Subject: Re: [PATCH v14 1/2] media: dt-bindings: imx-jpeg: Add compatible for
 i.MX8QM JPEG codec
Message-ID: <20210712201333.GA2411329@robh.at.kernel.org>
References: <20210619143611.17280-1-mirela.rabulea@oss.nxp.com>
 <20210619143611.17280-2-mirela.rabulea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210619143611.17280-2-mirela.rabulea@oss.nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 19 Jun 2021 17:36:10 +0300, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Add two more compatibles: "nxp,imx8qm-jpgdec" and " nxp,imx8qm-jpgenc".
> Also update the compatible property to ensure mutually exclusive usage of
> encoder and decoder compatibles.
> Update examples.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
> Changes in v14:
>   Address feedback from Aisheng Dong, do not use anyOf
> 
>  .../bindings/media/nxp,imx8-jpeg.yaml         | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
