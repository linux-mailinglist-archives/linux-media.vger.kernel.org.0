Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33D6326FF71
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 16:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgIRODF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 10:03:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:32778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726273AbgIRODF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 10:03:05 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E8E7235FA;
        Fri, 18 Sep 2020 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600437784;
        bh=ceMp5e2PEx8+OXFUL08K6kd8nS2HTjT3yL8yWWmw/XY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aN1L5afhODcB6oZbb3gXe25GiRn6TznrDNDCmMA15uZWO5FXTxYUT2+HApeOJAZJX
         VRkk+dX1u/ZsU98LrqqKjArYsJ/0g1yO0a4xDO9IWfLu7EgS/m6jCTi1buG9DXSmHY
         N1vxXeFCCJxB/wvlroPm6j1i1QAPrPUSRfOP8C8M=
Received: by mail-ot1-f42.google.com with SMTP id n61so5446592ota.10;
        Fri, 18 Sep 2020 07:03:04 -0700 (PDT)
X-Gm-Message-State: AOAM533TAFbDPO2iUYBh45neEDqVGPxvbDW5lh566InUrvMg6XyDc0WS
        FKlMMo05/363oAa+FvelYfIezQthPGmbeOOmew==
X-Google-Smtp-Source: ABdhPJzFRdqI6xDMxO2WwbAZUoxvL1C2s8llhjhqxIM2uXpb4VM3ABM4S06vvLPwRuD/6HYmbQsubXallQ2te0BX6Og=
X-Received: by 2002:a9d:6ada:: with SMTP id m26mr9287562otq.192.1600437783776;
 Fri, 18 Sep 2020 07:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200722155533.252844-1-helen.koike@collabora.com> <20200722155533.252844-2-helen.koike@collabora.com>
In-Reply-To: <20200722155533.252844-2-helen.koike@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 18 Sep 2020 08:02:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLB2wJE0VBmonSC_hBETgE-he50HJGbBBKy8RKS6GyjxQ@mail.gmail.com>
Message-ID: <CAL_JsqLB2wJE0VBmonSC_hBETgE-he50HJGbBBKy8RKS6GyjxQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] media: staging: dt-bindings: rkisp1: add missing
 required nodes
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
> Add missing required nodes in json-schema yaml file for
> Rockchip ISP1 dt-bindings.
>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>
> Changes in v2:
> - New patch in the series
> ---
>  .../devicetree/bindings/media/rockchip-isp1.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)

Sorry, PW filters patches and this isn't under
Documentation/devicetree/bindings/.

Acked-by: Rob Herring <robh@kernel.org>
