Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B416E131B70
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 23:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727221AbgAFW3y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 17:29:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:33334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726735AbgAFW3x (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jan 2020 17:29:53 -0500
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8374924687;
        Mon,  6 Jan 2020 22:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578349792;
        bh=1De1CokmZJzvWcJL3EL1QdC4D4rWqmpc0SisOSfVtB0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yqgOwbgI6EhCqdM8g9AQYz5x6tFbiGs87TCojq6MMCGjzBnGj9qM+OvtR3zCtxRhX
         Dr+7N4EW6o/9ptvy2xqkhWaWimTP7A4SicBarV7iCq/XZXm22PgTTKeW0VkcZjMsPx
         sYkyeuuOQGWd1cD6I3HOJpqJcbFYcc87GFqNFv5c=
Received: by mail-qv1-f43.google.com with SMTP id l14so19726009qvu.12;
        Mon, 06 Jan 2020 14:29:52 -0800 (PST)
X-Gm-Message-State: APjAAAXTKezVOBKcTEYxdBAa5w2N9vTKn07mdjz+b+3/dDXebXq4G/fb
        vhbQgNtyTaaQDJNNz4pk514kyW7FnqN3fLAUTQ==
X-Google-Smtp-Source: APXvYqzF+/+VjZiO27tMFOFZDdgfF2Kx9B2Ly1NVCZZoUZYFxwJPkkwCNae3ZKIHAXThR4kSNA6ABNukCDQkEY/s4/4=
X-Received: by 2002:ad4:4511:: with SMTP id k17mr77533622qvu.135.1578349791507;
 Mon, 06 Jan 2020 14:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20191227200116.2612137-1-helen.koike@collabora.com> <20191227200116.2612137-10-helen.koike@collabora.com>
In-Reply-To: <20191227200116.2612137-10-helen.koike@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 6 Jan 2020 16:29:39 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Oarx=Q95H+_mOYUiD0OpdxX6eMNJ0Dyv_zzSiEUzWaw@mail.gmail.com>
Message-ID: <CAL_Jsq+Oarx=Q95H+_mOYUiD0OpdxX6eMNJ0Dyv_zzSiEUzWaw@mail.gmail.com>
Subject: Re: [PATCH v12 09/11] media: staging: dt-bindings: add Rockchip MIPI
 RX D-PHY yaml bindings
To:     Helen Koike <helen.koike@collabora.com>
Cc:     "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Eddie Cai <eddie.cai.linux@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "heiko@sntech.de" <heiko@sntech.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        joacim.zetterling@gmail.com, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 27, 2019 at 2:02 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Add yaml DT bindings for Rockchip MIPI D-PHY RX
>
> This was tested and verified with:
> mv drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml  Documentation/devicetree/bindings/phy/
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>
> ---
>
> Changes in v12:
> - The commit replaces the following commit in previous series named
> media: staging: dt-bindings: Document the Rockchip MIPI RX D-PHY bindings
> This new patch adds yaml binding and was verified with
> make dtbs_check and make dt_binding_check
>
> Changes in v11: None
> Changes in v10:
> - unsquash
>
> Changes in v9:
> - fix title division style
> - squash
> - move to staging
>
> Changes in v8: None
> Changes in v7:
> - updated doc with new design and tested example
>
>  .../bindings/phy/rockchip-mipi-dphy.yaml      | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
