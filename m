Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 890303506E4
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 20:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbhCaSxc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 14:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233888AbhCaSx3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 14:53:29 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F10EC061574;
        Wed, 31 Mar 2021 11:53:29 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id v23so6442763uaq.13;
        Wed, 31 Mar 2021 11:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/DTSYMrEtM32KqUkoX69dgcR0XfKVqt64r7rpIZMI+o=;
        b=lzBUVM7fAdQp6jF1nv79FrRYbTDgKatA7+5Xc/NDE1pKgF1sRIJbbhYMcnSNhx+OWG
         I/KAtnlPCwyJtlTkwvB6xg6zj/0krE2VJD+vis2HeaW5myJa3pamZhdsKiWzWJx0x/DY
         C7+X2OptR8BlNJoPLjjOj+SgOLOlEoXahAUGcwxvzSFQBlkaxa/GXXrjW+usZ4X4xg/r
         BOY4aguhPcNSzZzG0DvBmIb5AF2PF+MaastcJng1hUvOzYOdkHvYThjQSNb5vOeB5Ypt
         o1S7e9VbhAOoBak9AUJoa89iTcY9AQ34GW05OdjxsCR/jrIgn8dUrlgQcVtFnRh3M+cA
         gXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/DTSYMrEtM32KqUkoX69dgcR0XfKVqt64r7rpIZMI+o=;
        b=rKvSQlY6mx5XVgtfE+I2Q1B8EyMJH05718Oa/VGW+PnveZBk2oUmqiwG8M6X48J7kV
         lHgXLkjENaf6RO9K0LXuTSN7oEBHRmwpt+wS8siLJkelzGKGdqa33EOv8t0p0NIdGTFR
         xV5TJhKZFakAveBWoP1bjvxMhGcuD2VRTJUrzPnSM39zvfMdrr1xm1cHmXealzZq5bza
         xvpYORyFRsTJomL247HRnmvpF/IpPSj30kgLdrmzEog9ZQIUDTqodRyAQK48QD47auXf
         6pS+rGDFDMszd26QhTWoQiVUomA6CuNx2q4EK0dn+BH9r1GMdXp2SKnIjqQwwdKec5IN
         7D8w==
X-Gm-Message-State: AOAM532U3WbTi7zNAkCtk2N7AKLGeUm2K/0GgGOIVqy2dmXw0Niklj1S
        5fgp6o+lHc58nkUk4IOO5xadqOKU4pWGNvo+LQlWTs3Cf3pelw==
X-Google-Smtp-Source: ABdhPJwmPNCFsiJzns1U1Ag88HVXFSC8Gu6TlDAr9HbjDdXBoq3OeZwlIhn43M5A/GfVl61XXISCL4WZKbRk/lKveSA=
X-Received: by 2002:ab0:32d0:: with SMTP id f16mr2628332uao.64.1617216808828;
 Wed, 31 Mar 2021 11:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210331173520.184191-1-emil.l.velikov@gmail.com> <20210331173520.184191-8-emil.l.velikov@gmail.com>
In-Reply-To: <20210331173520.184191-8-emil.l.velikov@gmail.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Wed, 31 Mar 2021 19:53:17 +0100
Message-ID: <CACvgo524v7pib6L0Bgx8Ygx5E+_Hg0fVEz+LQ_V_GshOghZZUw@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] media: dt-bindings: Document SAMA5D4 VDEC bindings
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>
Cc:     Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 31 Mar 2021 at 18:35, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> From: Emil Velikov <emil.velikov@collabora.com>
>
> Add devicetree binding documentation for the Hantro G1/G2 VDEC on
> the Microchip SAMAS5D4 SoC.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> v2
>  - Newly introduced
>  - s/Atmel/Microchip/ (Nicolas)
>  - Drop leading 0 in node name/address
> ---

Please ignore this patch, I might have forgotten to squash the fixup :-]
v3.5 has just been sent out [1].

Thanks
Emil

[1] https://lore.kernel.org/linux-media/20210331173520.184191-8-emil.l.velikov@gmail.com/T/#mf6b5c1f2be535abba8b254f11c9f3017c1c9fc86
