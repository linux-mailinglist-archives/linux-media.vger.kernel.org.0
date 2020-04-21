Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6801B1C7B
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 05:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgDUDRV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 23:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgDUDRV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 23:17:21 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E13C061A0E
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 20:17:20 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id rh22so9789098ejb.12
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 20:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1M1DoXOdUlhQRL4Qj1HrgtXV2Fi+FRpwecNzeFqUTZQ=;
        b=CQ9de2kVBGWn9Z04tve7cCLx61Dpcvb/5S6Slzj/ATMQ0BoVskM3YyKzWAg9jYz3tc
         IPizYoYSQ2s7ES4UZM/7dSfZlFcoeci1cLSV+l/Yz81fYGgTA848/bK8RN7bui0U2igs
         kHuNAsuxrszzxqnFrE+D+8IdWuaqvd0289KawEZQuFP3XScYqpy57EU1rPGcK2IZvEmw
         1q6FIlsKuC14w62QOsUIAw68DNejrBYCm/w2hsoko6z/tnz7zCDSZoDgiWRTcjuxd1GH
         b08yvQtN98WYnTqxTESnMt1HIODO8Ft3NMb3VLxWYf5gZlnEb+Rb6yfknOYOLPgDrjBp
         uOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1M1DoXOdUlhQRL4Qj1HrgtXV2Fi+FRpwecNzeFqUTZQ=;
        b=lIJwkAV7kzT8IMeDp1lLZ1xjkgptggnHVfJ6gKGaxNpW281/49u/LcxXqVSQm1urTr
         uZF1hRhtQWvPuNDuklLQWRe7435X57Yt37LcutM0uC7uyMitS6nwxl2iJ9u/4hMWTn8x
         av5GAA5imLQuN54ILLBt4wuR2KxdU1mJRwqeRHU2j682uOLSXQ/nuUf03FSzH4vI/fMy
         yydeTJ+Nj5q9cn9KpEvYFYpQ2+wAYvmsG0IEqICzNzlCPWsD/ZqL4Pfs/Yqvtl7I/6Bg
         s58BAUTwMS7824F5VWrbXGfSc0PbB+AyLXv/axpsYUv8uZ/z5iCRHO8hwCrshuOLf+fo
         QK8w==
X-Gm-Message-State: AGi0PubCIIuSDQM8P0TX9zzBSHWwUdKoHKb2Ydfq9a4n2bpubOQnbPnM
        SicQiW+fwtAFoEeWehmNFr7bWfm7ZXYHmZ99qQLcCN0PyqWxVQ==
X-Google-Smtp-Source: APiQypJrnbCg586F3RRfsGWowjSozTcpWdO70rhIB/MY8ymwiIrrdTj9yzfCykTQrFMiLPyMhRv8Hybyr0RVyzi6SwA=
X-Received: by 2002:a17:906:680b:: with SMTP id k11mr19174590ejr.46.1587439039335;
 Mon, 20 Apr 2020 20:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <56aaef4ea1c26d90952841fa32b2a14bcc27582a.1587401141.git.mchehab+huawei@kernel.org>
In-Reply-To: <56aaef4ea1c26d90952841fa32b2a14bcc27582a.1587401141.git.mchehab+huawei@kernel.org>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 21 Apr 2020 00:17:08 -0300
Message-ID: <CAAEAJfD=UtEDb4cgM_kqm7fJuwpDm3rMN+O1GuNY+NcBupzqwA@mail.gmail.com>
Subject: Re: [PATCH] media: staging: rkisp1 Kconfig: depends on OF
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Randy,

On Mon, 20 Apr 2020 at 13:45, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> building it with a random config causes a warning:
>
> WARNING: unmet direct dependencies detected for PHY_ROCKCHIP_DPHY_RX0
>   Depends on [n]: STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y]) && OF [=n]
>   Selected by [y]:
>   - VIDEO_ROCKCHIP_ISP1 [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && VIDEO_V4L2 [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y])
>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks for the patch. Please note this warning (plus another one),
is already fixed by a couple patches in this series:

https://patchwork.linuxtv.org/project/linux-media/list/?series=2094

Also, Arnd sent a similar fix recently:

https://lkml.org/lkml/2020/4/8/596

The series I posted is acked by Helen and should fix all issues,
so perhaps you can merge it before more people keep finding this :-)

Thanks,
Ezequiel

> ---
>  drivers/staging/media/rkisp1/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/rkisp1/Kconfig b/drivers/staging/media/rkisp1/Kconfig
> index 5ecbefa0f5ec..07e4a6e4458e 100644
> --- a/drivers/staging/media/rkisp1/Kconfig
> +++ b/drivers/staging/media/rkisp1/Kconfig
> @@ -2,7 +2,7 @@
>
>  config VIDEO_ROCKCHIP_ISP1
>         tristate "Rockchip Image Signal Processing v1 Unit driver"
> -       depends on VIDEO_V4L2
> +       depends on VIDEO_V4L2 && OF
>         depends on ARCH_ROCKCHIP || COMPILE_TEST
>         select MEDIA_CONTROLLER
>         select VIDEO_V4L2_SUBDEV_API
> --
> 2.25.2
>
