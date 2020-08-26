Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388B4252C10
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 13:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbgHZLEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 07:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728660AbgHZLAi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 07:00:38 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6961C061574;
        Wed, 26 Aug 2020 04:00:37 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id w25so1802186ljo.12;
        Wed, 26 Aug 2020 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IrP6ayckjNJ1DXpVyleRBUcFlQaxWlVGGvYCRU/uzd4=;
        b=twlNdYtBtcwaVvGPQQqBMGYo+BCqGNAMnQ06scY1fvZsCpKwWZRwSByvNXbYYnRfPu
         9bHzuP2ndjv2STYV5bjZ0ZArEPuWmY++WTwVe6+fioivo83/P+iA4jK9tENhV4b40Qar
         YuRhz3Qgr6mWXHMLKdDoV4yUjhv6aAXsVl20wj6VxzH/5KGABewzMz2J+8caqlFiWqMh
         XhFfcXdRWAvNaBCe+jUzB5jEAABOgKFbixVC6GIwJhflNmvOXylZ9k75sijC6TnL5CMa
         kfGa/rHeWDHedGF59eqknU2Aupage26bsMENg5mNG9ohiFwl9Q/o8O2WOmNHorNqQ0Un
         AR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IrP6ayckjNJ1DXpVyleRBUcFlQaxWlVGGvYCRU/uzd4=;
        b=caiMLUZm0QvXudMQxYri6GAp2g7KfVoIY5onI3wx/FzcA/MMVe3NIXAujX1lw8o+KP
         Glw2qICivtJYlQxXtcJKSpQEw7qiUdqFhhhmuItUGitrz8DhWPgwMacg2+OdaS4yKa1t
         bPFqGS8irAx/GziluopyQM8VG0ZfKbLYXAjJ/p0QU/8G6ISMdJklaX1d4F3e6SW4vM+A
         Bnm0wbpLXhVkSfpfOCp7Wqta7VxHT0iPXoG9e6TfWURGSwnKx2U3zAfa5KVimqMQn31p
         ZoYutt/SiZB/c5h2LoUtldcGgi9CdDJd6INbtXRne7kntOcI3IkSGuFCcHLYaj7qAvy1
         J2GQ==
X-Gm-Message-State: AOAM532GN/p0KXZBojAnQu+Or3WitpPdos6TTSdTVRs9t39RrWEZrKtj
        oCfiIBUQJzERi64N5NhobbpKj8U3iXsJ5CTQOVr/IAz4
X-Google-Smtp-Source: ABdhPJyYPUaNdwhtweLVaLU70yKQWGzSfUwIGGvMtGw/Dd2GWNDaKIongg6kM6TSRpOEJEd3h9eF8RvYzzWvJQt2VgA=
X-Received: by 2002:a2e:80d3:: with SMTP id r19mr7356055ljg.310.1598439635750;
 Wed, 26 Aug 2020 04:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200826092606.2910-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20200826092606.2910-1-dinghao.liu@zju.edu.cn>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 26 Aug 2020 08:00:24 -0300
Message-ID: <CAOMZO5BCZYVj-C70XhwiaWVAZ8ViiBcErRP79eu3=m=aCWvZnw@mail.gmail.com>
Subject: Re: [PATCH] [v2] media: mx2_emmaprp: Fix memleak in emmaprp_probe
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dinghao,

On Wed, Aug 26, 2020 at 6:31 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
>
> When platform_get_irq() fails, we should release
> vfd and unregister pcdev->v4l2_dev just like the
> subsequent error paths.
>
> Fixes: d4e192cc44914 ("media: mx2_emmaprp: Check for platform_get_irq() error")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Thanks for the fix:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
