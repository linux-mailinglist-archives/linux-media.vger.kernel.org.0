Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8415D2CCDED
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 05:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgLCE3n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 23:29:43 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:35554 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgLCE3n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 23:29:43 -0500
Received: by mail-qk1-f196.google.com with SMTP id v143so1066489qkb.2;
        Wed, 02 Dec 2020 20:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DcIEExrbxW09u75pxnwKALCT9ZbEoGFab0Y+pgzyv5k=;
        b=Gz7f8G+TpgpAUj7pZxVsL6iuLqZU+H/j1wQBwFbA8pEliS92eHWD4sJDsdVlwrB+YN
         Et0loy/ew7qmxeQjWJV6dIW+UeQDi09fpAF2iZdKOuYdG4krxSV+eRTAfzcvK/D/JlaA
         mRXIBziYkFx4NqLUCG1wt4iIlw9/II6QXIFolBTlGPTckzddEnV3BwPYGLquYQOVXaup
         iZ6rqxNtMNSYj4XVYtgtS6OZNie7vx5BdmFsJXghihPxw3mF+FhwyT6SisqjXSoVxbqR
         Vba3D/pacmtBjpZ+xP9EwQKPqCvKjd9hXsk4IYOE98iYyZYYe6SI+cNsWnThUX0DF83a
         1iSQ==
X-Gm-Message-State: AOAM5316g4qiET1rNc8tGoi8BSGZSRNOFXqKBeu1KOTuFiSrovFi439A
        wN+w6XZ6dWxKSb9OZFou6Inv413E9pJPjlTc
X-Google-Smtp-Source: ABdhPJyc2xOJw1yO2Fn14MAayfYE3pAKQPvvTbwe7d0AkzqyjbxH26GqGz6jlYDKCnJ23zjz3+pYPg==
X-Received: by 2002:ae9:f506:: with SMTP id o6mr1165363qkg.414.1606969741537;
        Wed, 02 Dec 2020 20:29:01 -0800 (PST)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id c14sm12429qtc.90.2020.12.02.20.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 20:29:01 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id 4so394118qvh.1;
        Wed, 02 Dec 2020 20:29:01 -0800 (PST)
X-Received: by 2002:a05:6102:832:: with SMTP id k18mr1065101vsb.2.1606969257087;
 Wed, 02 Dec 2020 20:20:57 -0800 (PST)
MIME-Version: 1.0
References: <20201116125617.7597-1-m.cerveny@computer.org> <20201116125617.7597-4-m.cerveny@computer.org>
In-Reply-To: <20201116125617.7597-4-m.cerveny@computer.org>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Thu, 3 Dec 2020 12:20:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v66T9aakxRQNBbA+=EC-d5EpmUrZSK5xTW=orK6Z7PyG9Q@mail.gmail.com>
Message-ID: <CAGb2v66T9aakxRQNBbA+=EC-d5EpmUrZSK5xTW=orK6Z7PyG9Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] ARM: dts: sun8i: v3s: Add node for system control
To:     Martin Cerveny <m.cerveny@computer.org>
Cc:     Maxime Ripard <mripard@kernel.org>, devel@driverdev.osuosl.org,
        devicetree <devicetree@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, Nov 16, 2020 at 8:57 PM Martin Cerveny <m.cerveny@computer.org> wrote:
>
> Allwinner V3s has system control and SRAM C1 region similar to H3.
>
> Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
> ---
>  arch/arm/boot/dts/sun8i-v3s.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
> index 0c7341676921..70193512c222 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -161,6 +161,20 @@ syscon: system-control@1c00000 {
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>                         ranges;
> +
> +                       sram_c: sram@1d00000 {
> +                               compatible = "mmio-sram";
> +                               reg = <0x01d00000 0x80000>;

How was this address derived? Did you check that there is actually SRAM here?

ChenYu

> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               ranges = <0 0x01d00000 0x80000>;
> +
> +                               ve_sram: sram-section@0 {
> +                                       compatible = "allwinner,sun8i-v3s-sram-c1",
> +                                                    "allwinner,sun4i-a10-sram-c1";
> +                                       reg = <0x000000 0x80000>;
> +                               };
> +                       };
>                 };
>
>                 tcon0: lcd-controller@1c0c000 {
> --
> 2.25.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
