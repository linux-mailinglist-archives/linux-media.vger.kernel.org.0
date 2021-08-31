Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00513FC015
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 02:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbhHaAmp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 20:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbhHaAmo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 20:42:44 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5CBC06175F
        for <linux-media@vger.kernel.org>; Mon, 30 Aug 2021 17:41:49 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id me10so34900471ejb.11
        for <linux-media@vger.kernel.org>; Mon, 30 Aug 2021 17:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t6EgJ/pBlXGjmQW+1kycNPH7wqBqGocIxe5B3vOVKdg=;
        b=ozqNjl0qJHwzCO4kLeRZtdKmVX6r37wi9a6tbMXD6kiNe89XfkdS2y1o/bSVxH2TB/
         kZZBD0cHymA0yyOmQyVDhSJ+oP/i6Faea7bdcgRwqRdX/5kGuH6qkyqN3AobnaWQxJcq
         Q/H5HFeNijuHcbSL5AYcJsE5vedAxWkGqU+/RPjCyM47uVUeg3N1i1Z3ZEOSCiXC4vTm
         56dUDooSPjrnIiRUPmKYf2ZWXS1gRvo/YbD0LTCA+nMrqprAvDc26WMudYtoz9BWzpIG
         z4H+/CullndzRIrgzLgm6xlJ78L8eiOHxSCSUXwCdBPHo0dWFuPVlP0Q7Br6L5OYcxn1
         VDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t6EgJ/pBlXGjmQW+1kycNPH7wqBqGocIxe5B3vOVKdg=;
        b=aQdqZIh4b9pnDAZRexTNWbfN6xfKnC1JYkZ1vmHrdRSA8vsIoQnUbvIBiEVarnHLJr
         GwJH5sp9QKFqK8NF8zpPUM/ylgn1wYE84FsfHIva6xfK6gfJAggvsXd85fYM4hn0XkXk
         VsJjk97wjbaw7DtBRsKVhh7LTv12eUiLSzfGYHXW0Eyl1RpFb58plIHP6e3uoJw4NVis
         NRiiySulSxfmPrg20a+fK39FqgUAr2PsSzQAjRq3N/AvM9eltQgUQFrTkxKTDeitGXS+
         h6OrFGvcbyfJBMjvQecrug9Df6eu871pFcByk50s+XOcKxzd/7sRM3LZfhj7PiY2K2Is
         r7wg==
X-Gm-Message-State: AOAM532FK3llO3HLXZ5z+AkeAKGEjKkyg3JdHJH7BRD4OX4z11h0GIcz
        TIQI0er0zUfed2rrTY/lWRiAqZzEKoEdX5Gy3HyZfw==
X-Google-Smtp-Source: ABdhPJwfDEapt8mz+NTo0uJkU3v5YR5ufjt/WlrI5Z+Q8KSQPjbjAOUEvNuF9+JEMzyiUG+AY7eqBrSXjXnTKMn6BMw=
X-Received: by 2002:a17:906:7749:: with SMTP id o9mr28291109ejn.141.1630370508559;
 Mon, 30 Aug 2021 17:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210830180758.251390-1-mike.rudenko@gmail.com>
 <20210830180758.251390-2-mike.rudenko@gmail.com> <6474995.6kXVAnRFRJ@diego>
In-Reply-To: <6474995.6kXVAnRFRJ@diego>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Mon, 30 Aug 2021 21:41:36 -0300
Message-ID: <CAAEAJfB6FBbeEPuzirP2nuU_J9nLFSrczgXYVfNQUZbEJrbc7Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] phy: phy-rockchip-dphy-rx0: refactor for tx1rx1 addition
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     linux-phy@lists.infradead.org,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

On Mon, 30 Aug 2021 at 17:46, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Mikhail,
>
> Am Montag, 30. August 2021, 20:07:50 CEST schrieb Mikhail Rudenko:
> > In order to accommodate for rk3399 tx1rx1 addition, make
> > enable/disable function calls indirect via function pointers in
> > rk_dphy_drv_data. Also rename rk_dphy_write and rk_dphy_enable to
> > avoid naming clashes.
>
> You're a bit too late to the party :-( .
>
> The tx1rx1 dphy is living _inside_ the 2nd DSI controller and is
> configured through it.
>

Would you be so kind to push a patch adding some comments to
drivers/phy/rockchip/phy-rockchip-dphy-rx0.c with this information?

Thanks,
Ezequiel
