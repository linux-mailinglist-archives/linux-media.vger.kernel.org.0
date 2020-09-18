Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B0426FF78
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 16:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgIRODz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 10:03:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbgIRODz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 10:03:55 -0400
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8D7423719;
        Fri, 18 Sep 2020 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600437834;
        bh=jlUpQedx8lxFnhVYRHD0h2Z+8oE7QO6G9HDCL13E1RI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hkoxVra26u+srB3hgMaWdFmgKHe/+4D9c7Q77PzhLQCLd8LvMoHtcMKBh7PQDncaN
         WhnwOkhrhrLq+g1PHNFu7hThsMHxnIOZOo6nv6qUeAwFwKaEyXyzPYBsyOVWXCMMiU
         xqMhzUt8cjTHWfMlYqdGr9EXabKN1gD6ko272Aj0=
Received: by mail-oi1-f181.google.com with SMTP id z26so7096058oih.12;
        Fri, 18 Sep 2020 07:03:54 -0700 (PDT)
X-Gm-Message-State: AOAM532JipncXbaZOtm5TPhCe4a3Qp7FmFX0JNuAsIHoLT6houAwRXUO
        EJ+S+Tf3PRlofOmJ1Jq4fx8v082iSfI8irKDvw==
X-Google-Smtp-Source: ABdhPJw5PYmmyHWV1DhKrLllNfPExtmDPBfDoTPRLpa4UM124TtPu7YW7eKVG32FF/CjBLW9jymuFh3mRGXmtomX2ZE=
X-Received: by 2002:aca:4d58:: with SMTP id a85mr8881222oib.147.1600437834149;
 Fri, 18 Sep 2020 07:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200722155533.252844-1-helen.koike@collabora.com> <20200722155533.252844-3-helen.koike@collabora.com>
In-Reply-To: <20200722155533.252844-3-helen.koike@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 18 Sep 2020 08:03:43 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJgJYfT7iyxwfhixrBC3npUGZxMa_Dk4=XjKKN-AV7New@mail.gmail.com>
Message-ID: <CAL_JsqJgJYfT7iyxwfhixrBC3npUGZxMa_Dk4=XjKKN-AV7New@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] media: staging: dt-bindings: rkisp1: drop i2c unit address
To:     Helen Koike <helen.koike@collabora.com>
Cc:     devicetree@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "heiko@sntech.de" <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Collabora Kernel ML <kernel@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mark Rutland <mark.rutland@arm.com>, karthik.poduval@gmail.com,
        Johan Jonker <jbx6244@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 22, 2020 at 9:55 AM Helen Koike <helen.koike@collabora.com> wrote:
>
> Add missing required items in Rockchip ISP1 dt-bindings example for
> a complete i2c node.
> Drop unit address to Fix error:
> /example-0/parent/i2c@ff160000: node has a unit name, but no reg or ranges property
> Remove unecessary fields for the example.
>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
>
> Changes in v5:
> - Patch re-written to drop unity address instead of completing i2c node
>
> Changes in v2:
> - new patch in the series
>
> tmp: i2c drop fields
> ---
>  .../Documentation/devicetree/bindings/media/rockchip-isp1.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
