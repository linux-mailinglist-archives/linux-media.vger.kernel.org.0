Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AF626FF7A
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 16:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgIROEn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 10:04:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:33636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgIROEm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 10:04:42 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0B28921D42;
        Fri, 18 Sep 2020 14:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600437882;
        bh=+AUjt8uHrU807ERl3qIjVJflDoMSNyT4i7yBC6dijrI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RVt4tQGL4NGqcuth0LV1JnlCXBW8SO30dOK+Lg8IIRjV0yOF0wWgsEgCOkBjFzk9s
         0Rn62vEFabnBsQPloLvnLHln9lSqPd+bL09xYBIprQJYenk2AZwnYvfpwWNJSXEtpi
         Ma7cMkDdiC5idrlwehKbmi2TBawmYb3NOOEdOvqA=
Received: by mail-ot1-f46.google.com with SMTP id o6so5487398ota.2;
        Fri, 18 Sep 2020 07:04:42 -0700 (PDT)
X-Gm-Message-State: AOAM533cVke0mnQfJA0wUEPcgv1aRdqq1RQ/33hOHw7ALWQz3A/lKeJO
        Slha96LyUppmCNiiofiq0v/XkF47MOg1/0sBlA==
X-Google-Smtp-Source: ABdhPJxRV95Yj/Uh3LvsS3bkFNGt2GCjGRYFMGcZ1fb2PKBNRXUO/m0gTSbm+YgzBtSAdBkO/WVadlDzl7cQpcm0zfE=
X-Received: by 2002:a9d:6ada:: with SMTP id m26mr9294255otq.192.1600437881398;
 Fri, 18 Sep 2020 07:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200722155533.252844-1-helen.koike@collabora.com> <20200722155533.252844-5-helen.koike@collabora.com>
In-Reply-To: <20200722155533.252844-5-helen.koike@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 18 Sep 2020 08:04:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJYTNBZQ08ORB01z+=We6tuvqK3MKgGNm-Yj7q2KAMcAQ@mail.gmail.com>
Message-ID: <CAL_JsqJYTNBZQ08ORB01z+=We6tuvqK3MKgGNm-Yj7q2KAMcAQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] media: staging: dt-bindings: rkisp1: drop parent
 unit address
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

On Wed, Jul 22, 2020 at 9:56 AM Helen Koike <helen.koike@collabora.com> wrote:
>
> Fix the following error found with make ARCH=arm64 dt_binding_check:
>
> Documentation/devicetree/bindings/media/rockchip-isp1.example.dts:24.27-101.11:
> Warning (unit_address_vs_reg): /example-0/parent@0: node has a unit name, but no reg or ranges property
>
> Reported-by: Johan Jonker <jbx6244@gmail.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> V5:
> - Patch re-written to drop the unit address instead of adding reg
>
> V3:
> - this is a new patch in the series
> ---
>  .../Documentation/devicetree/bindings/media/rockchip-isp1.yaml  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
