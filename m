Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 312303DAF42
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 00:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbhG2Wia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 18:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbhG2Wi2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 18:38:28 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A6AC0613C1
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 15:38:24 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id v21so13319084ejg.1
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 15:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DGi+ps2vveNC4U22oo2ps7NKilQXroVrMceExeQ1swo=;
        b=kB+CJqOov7B81LMuZf3CxSJQVkA0P7jyaZOMbTvsGe1n/LUGX+CZgJzwojKs/s/VPh
         8bGxufJVw3VaQg54+/VPPBfDcOgTXsNo7fY8lK+7lqIWwKwM3PFf4/PoB64TTRTXKYCG
         vrQPvLVnVgSEk6AiNZW3wKptlIW/ztCcZ4GaJEK7oC2b8vEqksvKUlzCtR26zmYo6//O
         onLPH5T6h6Esh4Fgb8/gZ+0uW3Iz1RzNJd4aOLel2L8f3Th81G2ViPI1Yn59m7mv1/Z0
         nnl2wS2qT+DYSthdf55hsnOTQo7PP8qe4kRI8ur7TeDTtw03kO312ErXKcMLhG71BGBj
         ea8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DGi+ps2vveNC4U22oo2ps7NKilQXroVrMceExeQ1swo=;
        b=f00URxerQ9GA3pmsPiyTwytptqYf3u32g1yU9YBuvzcbAyfofBVEu5Ve/hM9hV+qS5
         C6SjwQ8MMjqViYnIi/tv6Z1FaQiekLZaaOrLGpMSrxe0R4vehpyfb3nyK0Dyg9liknWE
         gsew9Cc8Ha05P/rgF65nsVZZ6Jz6k2RGsu7A4dLQI+Qdo0l1R8mbb0STftlvAJBssc7Y
         wOVe9dOsUV3VGy2MlYrE0grtf2AuzRyQ0EnHSIjylqwWhEC/Y6DRXs9sotNQPDQK4F7Y
         ho2BzaddfH/bw1Rv52alyUjwfPs0ijTZpGU1JftfsBNf8eYOj2kdpbgJtyrwiMAm6eXj
         wnDA==
X-Gm-Message-State: AOAM5332MRbfzvAHtZLk1n7Fmh8W+C2pTqykcN4W/bE55MoX7twZVgcj
        q+2YA8P8lXCCkJyFK7SkMttyRiCfxB/9c8f2VPji5g==
X-Google-Smtp-Source: ABdhPJwKtCeuoJfkZrzUiTcremVdc5cGF6hBMnBaOV7axWAjJOuuLje0I++9Q6udDc1mKpgMRyxHPr+2ALq3uh2VwCs=
X-Received: by 2002:a17:906:2ad5:: with SMTP id m21mr6733756eje.88.1627598303282;
 Thu, 29 Jul 2021 15:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <AM0PR04MB5825DA3C650C569F69B99EF898EB9@AM0PR04MB5825.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB5825DA3C650C569F69B99EF898EB9@AM0PR04MB5825.eurprd04.prod.outlook.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 29 Jul 2021 19:38:11 -0300
Message-ID: <CAAEAJfDjGBBO4gL3gnn7qsmMHb+2MT2LNJ_Ctt7EqRoycj934A@mail.gmail.com>
Subject: Re: media: platform/rockchip/rkisp1 - v4l-compliance reports errors
To:     Jens Korinth <jens.korinth@trinamix.de>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Helen Koike <helen.koike@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(Adding Dafna and Helen)

On Thu, 29 Jul 2021 at 09:36, Jens Korinth <jens.korinth@trinamix.de> wrote=
:
>
> Hi *,
>
> I am working on a camera system on Rockchip RK3399 board (Firefly ROC-RK3=
399-PC-Plus). Tried to use the rkisp1 driver, but was unable to connect to =
the rkisp1_mainpath output node, because format negotiation failed; so I ra=
n v4l-compliance next and found that it reports several errors (see attache=
d report).
>
> Upon closer inspection I noticed in the VIDIOC_ENUM_FMT handler in driver=
s/media/platform/rockchip/rkisp1/rkisp1-dev.c:1169+ that
>
> 1) the "reserved" member is not zeroed,
> 2) the userspace pointer to the v4l2_fmtdesc f is not checked via access_=
ok, and
> 3) it isn't copied from/to userspace using copy_from_user/copy_to_user.
>
> I'm not sure if this is necessary in general, but at least on my platform=
 the zeroing of the reserved member only worked correctly when I added the =
userspace copies. But even after these fixes, v4l-compliance reports furthe=
r issues in format enumeration and negotiation. Is this a known issue?
>
> Thanks!
> -Jens
