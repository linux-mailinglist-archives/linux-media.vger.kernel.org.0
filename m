Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB539224220
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 19:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgGQRmo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 13:42:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:57510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgGQRmn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 13:42:43 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DEF46208DB;
        Fri, 17 Jul 2020 17:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595007763;
        bh=5QieGgazv24uxo8nfYhggh5x6thKh4BOctE0GCVxO54=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VnyyToPD2QmRCixgUxL7ZYeX4s31cJ7DgdiKq6YL0qwpngL+5VBaOtAFGPrkrSCmE
         1r3ehfgmYDRsoVWXdZ7Svif77TJMU8nBg5rNb777Ik3GrQIrgq55lJ+2Y6xKUkf5AC
         d62j6Nd/yc50//qZ8aMdwDI3Ld28wM8+WaArqz7o=
Received: by mail-ot1-f54.google.com with SMTP id c25so7450036otf.7;
        Fri, 17 Jul 2020 10:42:42 -0700 (PDT)
X-Gm-Message-State: AOAM53014OrQHvt18BNKp9/svvNP5OmBZW85xHixFD0I8pDqtI/PoUnJ
        /DklmBepkSNW8+WKZRB7MoWwpEkBNNXpNGb7Dw==
X-Google-Smtp-Source: ABdhPJzD3YUc/7CeZQ+EaWXw6Qv+Go+VXgLHLQ/PJovsvgRkjaTGFOIray60Uq73A/E9jWweZDFCEtTGocFzvzdEEgg=
X-Received: by 2002:a9d:4002:: with SMTP id m2mr9888236ote.129.1595007762224;
 Fri, 17 Jul 2020 10:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200702191322.2639681-1-helen.koike@collabora.com> <20200702191322.2639681-2-helen.koike@collabora.com>
In-Reply-To: <20200702191322.2639681-2-helen.koike@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 17 Jul 2020 11:42:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKLFanS_Vhsbxt5mibxCimDGoa=ShyjR0Qt9YPeazOmTg@mail.gmail.com>
Message-ID: <CAL_JsqKLFanS_Vhsbxt5mibxCimDGoa=ShyjR0Qt9YPeazOmTg@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] media: staging: dt-bindings: rkisp1: add missing
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 2, 2020 at 1:13 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Add missing required nodes in json-schema yaml file for
> Rockchip ISP1 dt-bindings.
>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
>
> Changes in v2:
> - New patch in the series
> ---
>  .../devicetree/bindings/media/rockchip-isp1.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
