Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C36B2D0D51
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 10:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgLGJqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 04:46:45 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37538 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgLGJqp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 04:46:45 -0500
Received: by mail-wr1-f68.google.com with SMTP id i2so12099796wrs.4;
        Mon, 07 Dec 2020 01:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+iF0UwoQAartcj9GjM2K27xCIppkWZEbeKDby1umTRA=;
        b=kEOMav7yiTi7yu7SFc+uHlJH+CMewtyrdifSNhWva6XVN94cQ4Ryu2k+oWr0zrYZzU
         sug7wvc4r3YfmQxpgpU5HGULmQgj2KQTIVIfnkYDXxPu5e3mtrvopZFweFDAnOmOHSv2
         UyuGGZob/Tw9ioZ6wCG+NnGkGi6Xg6nMnlxt82aShi+M1G7VtIuezn9U2C+l3G74nHTs
         CKgtJ6I6OcQLjOI14FwgElrQbWDq6Irux/Fo2Ttshrl5DFGBe+yWRgNtruNnCjzRQRCx
         U/MYB0Qf6Eu6tj6Ebpy1Qrwbx+RP5b+mCh/Qh+tKy5R6oxBobk0WCJBrRBA2LbgRfNjh
         okhQ==
X-Gm-Message-State: AOAM533dMNTqddh9kpXFog5dBfWUnUwA1xYiN83VD5BDUUa922LsJrMT
        tm//Zp9lyQhf8jR8GSyp8E8=
X-Google-Smtp-Source: ABdhPJyCaP912scxnKcpThPiSEtSZ45ZAhoLAsJQ+Nrb/u370zr8R3PaD4ObvRiKmhkcxaawBn2GjA==
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr18090846wro.415.1607334363529;
        Mon, 07 Dec 2020 01:46:03 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id r13sm14218808wrm.25.2020.12.07.01.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 01:46:02 -0800 (PST)
Date:   Mon, 7 Dec 2020 10:46:00 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     michael.srba@seznam.cz
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] media: dt-bindings: media: i2c: imx219: document
 clock-frequency property
Message-ID: <20201207094600.GB17448@kozik-lap>
References: <20201205183355.6488-1-michael.srba@seznam.cz>
 <20201205183355.6488-2-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201205183355.6488-2-michael.srba@seznam.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Dec 05, 2020 at 07:33:54PM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch documents the clock-frequency property, which allows the driver
> to change the clock frequency from it's default value.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  Documentation/devicetree/bindings/media/i2c/imx219.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> index dfc4d29a4f04..666b8a9da5be 100644
> --- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> @@ -27,6 +27,10 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  clock-frequency:
> +    description:
> +      Frequency of the input clock in Hertz.
> +
>    VDIG-supply:
>      description:
>        Digital I/O voltage supply, 1.8 volts
> @@ -78,6 +82,7 @@ required:
>    - compatible
>    - reg
>    - clocks
> +  - clock-frequency

Although you can make the field required in bindings, your driver
implementation must support older DTBs.

Best regards,
Krzysztof
