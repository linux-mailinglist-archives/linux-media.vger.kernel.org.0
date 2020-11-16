Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075902B50E6
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 20:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgKPTSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 14:18:17 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46416 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgKPTSR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 14:18:17 -0500
Received: by mail-ot1-f68.google.com with SMTP id g19so17061375otp.13;
        Mon, 16 Nov 2020 11:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EPhHNNZqdEahcd/eb53lKDLlEmin4saNiGp+SAL2Ql4=;
        b=pXb0+3mPKXedwBaVeYCZxIwu8Am88p3AHfBoCq81TWV41yGtko0bmvq2HZVTOKnqUL
         D57Wv3UaUitcbyvTek5szyS0aU7ZUMeuLlHnpzsCiR1a3DY7deNr/G8x6pWnjSITVh5n
         4gtzUCBkI3xRpIbawBJzOG8plMmfZLWrG8tsp7wPxl8inukcAxOwPbVc84/az10P3Wq5
         N6vwKWZJuwv3joUOI2AF/xSkSF5zEQKpHgzMtxdpYTtJ/v//f0Z1CQbqm3r+9R2wdUcJ
         jPRwLtq/7jvj9ahSB0Va+1ytEHgLj9dWxWHm5DkoyHtL3lZ2Zht2ibyJwZyqRe0+L6QU
         u90Q==
X-Gm-Message-State: AOAM533A7QkPZFP29oIxpdfNh2NkiPoslp7BQ84VAzXAxllEJrsv6jf4
        SYB2W8nCa+rktjmob7dXyg==
X-Google-Smtp-Source: ABdhPJyLw3/Yl1MuoY1Z0YNmqEjTb1i1kMhothk9Ti4ZvtaROgO/i20brbg8QEDjTSmSSiyhSlGURQ==
X-Received: by 2002:a9d:2c68:: with SMTP id f95mr604552otb.300.1605554294743;
        Mon, 16 Nov 2020 11:18:14 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v13sm5020814oic.17.2020.11.16.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 11:18:14 -0800 (PST)
Received: (nullmailer pid 1983723 invoked by uid 1000);
        Mon, 16 Nov 2020 19:18:12 -0000
Date:   Mon, 16 Nov 2020 13:18:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
Cc:     s.hauer@pengutronix.de, laurentiu.palcu@nxp.com,
        robert.chiras@nxp.com, hverkuil-cisco@xs4all.nl,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com, shawnguo@kernel.org,
        aisheng.dong@nxp.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, ezequiel@collabora.com,
        paul.kocialkowski@bootlin.com, linux-kernel@vger.kernel.org,
        p.zabel@pengutronix.de, Mirela Rabulea <mirela.rabulea@nxp.com>,
        mark.rutland@arm.com, daniel.baluta@nxp.com,
        laurent.pinchart+renesas@ideasonboard.com, robh+dt@kernel.org,
        linux-imx@nxp.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 03/10] media: dt-bindings: Add bindings for
 i.MX8QXP/QM JPEG driver
Message-ID: <20201116191812.GA1983669@bogus>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
 <20201112030557.8540-4-mirela.rabulea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112030557.8540-4-mirela.rabulea@oss.nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 12 Nov 2020 05:05:50 +0200, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Add bindings documentation for i.MX8QXP/QM JPEG decoder & encoder driver.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
> Changes in v5:
> changed compatible name to be SOC specific
> changed fsl->nxp
> rephrased a bit the interrupts description
> 
>  .../bindings/media/nxp,imx8-jpeg.yaml         | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
