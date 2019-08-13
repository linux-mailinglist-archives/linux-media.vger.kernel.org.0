Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3D98C39E
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 23:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfHMV0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 17:26:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:56598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726631AbfHMV0I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 17:26:08 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1AE1B20843;
        Tue, 13 Aug 2019 21:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565731567;
        bh=GM23DGhyg+mtBCE8YlRJbCakPF/+Hq09zu3D+TE+XK4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VxkNvHzW5zFD9wl7s36dXRTvfAss97andtV1hadpeobFxj5vhBypMZHkF24mLp/1H
         rWBgnA98YgmnYDGLxMU91+UCVUqy2r+pIhrusWyKwIlM6WRraIuKtRs0ILti79Befk
         d4dP2GbwhwL3JXhQK1P1FV5Fjhqq82IW+MmiARak=
Received: by mail-qk1-f181.google.com with SMTP id d23so6112086qko.3;
        Tue, 13 Aug 2019 14:26:07 -0700 (PDT)
X-Gm-Message-State: APjAAAXCyl+2wOuvjkgQxiv+ouchJeEKX/9r7rT4Ltv1zUzOKthgkPA7
        sxFq/0h2/hxKAMUV7H3daA8YklEpDhnaTT1zgA==
X-Google-Smtp-Source: APXvYqww0rswwh3lSXwVgzazVtv7axCmSc4uhEaJfwxBqHXdcPCfjRZvDPnHTIKk86sXYyVlAWoAz/lP9mYw9zUw0OU=
X-Received: by 2002:a37:a010:: with SMTP id j16mr35848216qke.152.1565731566318;
 Tue, 13 Aug 2019 14:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190813124513.31413-1-mripard@kernel.org> <20190813124513.31413-2-mripard@kernel.org>
In-Reply-To: <20190813124513.31413-2-mripard@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 13 Aug 2019 15:25:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJKw=UaZPzXZu7jCvzeVO7zNcb4mCC-eVmn8DMxsm5cXA@mail.gmail.com>
Message-ID: <CAL_JsqJKw=UaZPzXZu7jCvzeVO7zNcb4mCC-eVmn8DMxsm5cXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: media: Convert Allwinner A10 IR to a schema
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 13, 2019 at 6:45 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The older Allwinner SoCs have a IR receiver supported in Linux, with a
> matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../media/allwinner,sun4i-a10-ir.yaml         | 80 +++++++++++++++++++
>  .../devicetree/bindings/media/sunxi-ir.txt    | 35 --------
>  2 files changed, 80 insertions(+), 35 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/sunxi-ir.txt

Reviewed-by: Rob Herring <robh@kernel.org>
