Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5D53F5CC2
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 13:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236462AbhHXLDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 07:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234569AbhHXLDv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 07:03:51 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B820C061757
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 04:03:07 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id lc21so11072640ejc.7
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 04:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a2CBr8Y/Dow61CgVXEVrXJocGobHhog5GoqPqKXEIU0=;
        b=xLUhwRfV6ghCPJC9K9hAyn3lJmTZl/DPfNh7qdJTbfFUdd7Z43g9wfrtJ/V6wRdFrc
         UdhpDEjRz2b0DfILeEiM+bdHLCwuXcqg3tmMkKkZke6rhQ6REb0HoVzWjOMc89Lm9jC8
         VHyt2FAY/uGShYY8f2R+xP/K+v1cGW3RnX1ogPkVxHUObnE5nbw3dHb1RvvW+O2D7XsH
         Bfy5VC3eRBD+PmgLryCqdfLgN8cZv16LDuesONnf6cgyy9y0G6U76+HozeHu9e5ucHaa
         CIIyS0iopDqAtc6Dbgse7V6P7IXCenRKpL0AlhpCmjhcYBZpJFsqCoBkZfTww495S6uj
         5saA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a2CBr8Y/Dow61CgVXEVrXJocGobHhog5GoqPqKXEIU0=;
        b=esOvS+/durxpaTpUWYts3MBgRP0yXl1XLrbnSbLjJh1LbxhHVZJgxT/7EhBKcwxmNq
         kFLm+L5k2bIMBFiV4MtCwkWphMsT5+/AbQrqRU8AjE9IgSHJQffL7/ilKhrFjTrh0ikI
         0Tp6Lon7G72AtJY2aZW9hc7WrY+l4bmc6yov97fmB+ubuTkKH+9VXpv1OkF3PEr0UjD6
         0cmnMWHvDl8OKgaoHK85kdwRXeM1CmZ9E8qG0VDMDZLdmc7YxtVr7avjLQ3YopdF9+P3
         BcZT8FUnLhfoGongiimRXKUR3YrhsT72pUXGfs4sKhdLW85KYEoEpOaZI/JRRzGj0s04
         JNtQ==
X-Gm-Message-State: AOAM532xxjgPcLJbElrvsuMEilAc+EPpd5cGfk4ygU7yyErYkL0sXx3r
        j414z4I5VPhksh23kMmGUpdtfSt/UgD1L+JynItirw==
X-Google-Smtp-Source: ABdhPJy4RlvmR3GM4zZQW53D/YonuubsjtWskr93uh0HMIKrEIy6PvPo+v9bss3hc/9UYs1ggviBpLB43fyvBWQVFR8=
X-Received: by 2002:a17:906:a0c9:: with SMTP id bh9mr8326387ejb.51.1629802986001;
 Tue, 24 Aug 2021 04:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210816105934.28265-1-irui.wang@mediatek.com> <20210816105934.28265-2-irui.wang@mediatek.com>
In-Reply-To: <20210816105934.28265-2-irui.wang@mediatek.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 24 Aug 2021 08:02:54 -0300
Message-ID: <CAAEAJfDoSW3F85bFKTRvvGZXTZbCBRpUwZzEyx3zhrA6psiZfA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: media: mtk-vcodec: Add binding for
 MT8195 two venc cores
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Irui,

On Mon, 16 Aug 2021 at 08:00, Irui Wang <irui.wang@mediatek.com> wrote:
>
> Enable MT8195 two H.264 venc cores, updates vcodec binding document.
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index de961699ba0a..eb2e24c32426 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -11,6 +11,8 @@ Required properties:
>    "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
>    "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
>    "mediatek,mt8195-vcodec-enc" for MT8195 encoder.
> +  "mediatek,mtk-venc-core0" for MT8195 avc core0 device.
> +  "mediatek,mtk-venc-core1" for MT8195 avc core1 device.

What is the difference between core0 and core1?

Thanks,
Ezequiel
