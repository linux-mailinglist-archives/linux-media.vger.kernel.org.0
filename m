Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540D6345D1E
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 12:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhCWLj4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 07:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhCWLja (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 07:39:30 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4C2C061574;
        Tue, 23 Mar 2021 04:39:29 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id c13so6568590uao.10;
        Tue, 23 Mar 2021 04:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jWd4Ah9+UKZUMTNKlTR6tTi9e4IEQ3A7/7UYNOEhWgk=;
        b=Zy0LI4WgEinuGCSgciAuIi220oIK1wYFSJTIlGZ8zZ0qH//GmPNYXWNzhWx6qFuptr
         LkywILx6bDxhBWiVlPWg0v4UtYz9r/nh2h5q5zOqBM0MipuV4swdT2bkpn4/x3KAVZMd
         hJ3zBKhlNaC7VVWwtRvrY/QfmUf1Y7b0qL3ToDm7K/+nqPCmFl8tTscsFroStqV5q4s+
         jO5MM4TD04/08tRO331LuMZ1H3ty1zvzysxOnH/UR5wXFP9GNTyDkZG+ELM9cUibE+bO
         tyDga7Eua0Ddxh3I0Cb/MZtaf0y0lApnq4sPpW7KjXiZJnW9vWc7nC5b7lQJWCZhYjSa
         Xi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jWd4Ah9+UKZUMTNKlTR6tTi9e4IEQ3A7/7UYNOEhWgk=;
        b=bCRNDXHsN6APpjlkITh8+JteoE0iTH2/WyEG2Sf+MhWaP6NJaJO47/9Pg20OqSAAM1
         0wW7Wokkt0Up+iih0PhIyTjpbx2HW+TAG37qL/KviRoWjtR/lkYyU7tsljss6smcCKED
         6SgpqHoOJDYzjinFDSy/GYxY8q3NU61xSMqSma1BuJU8FV2Q3xuZEBM2LsRq39saUUQq
         pgvZtfW1hHtlkCuZMS5Cnw4Nqhtc/vGnBVTjL4WBmfWhuk3RpzO9kltgBdojngyF/oJG
         unPvnL7rKqJ8pJmYMmfsbz98f8AGxX1G4xaADn5Pnx6iba3PhfyxeS+Q+FeOPQM6L8B8
         rr4A==
X-Gm-Message-State: AOAM533SF/VZhz7dGan4vO1DzJ5xEpCd0lkfStLQ4yiFhD06q8ik3k5Q
        eQpYQf3IWIi5AvWU6xcsltw6L/2cKmL28hIk7Ko=
X-Google-Smtp-Source: ABdhPJzKaAFGxeyxpFpXgX6baOVQd4rV8AdYt/v5U5rOjJZkuMeUlGuvkjXtOlp6aD/2LJ0tH21yM/B9ocGridIkhnM=
X-Received: by 2002:a9f:2d90:: with SMTP id v16mr2777321uaj.138.1616499569175;
 Tue, 23 Mar 2021 04:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <1616467572-112804-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1616467572-112804-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Christian Gmeiner <christian.gmeiner@gmail.com>
Date:   Tue, 23 Mar 2021 12:39:19 +0100
Message-ID: <CAH9NwWffN0zAYSTg-zuB=cfSbNeB-J1ddpoM_7knD+inEbTFGw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Remove redundant NULL check
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linaro MM SIG Mailman List <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Di., 23. M=C3=A4rz 2021 um 03:46 Uhr schrieb Jiapeng Chong
<jiapeng.chong@linux.alibaba.com>:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:622:2-8: WARNING: NULL
> check before some freeing functions is not needed.
>
> ./drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:618:2-8: WARNING: NULL
> check before some freeing functions is not needed.
>
> ./drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:616:2-8: WARNING: NULL
> check before some freeing functions is not needed.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
