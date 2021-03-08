Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C5B3312C5
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 17:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhCHQCc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 11:02:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhCHQCH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 11:02:07 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0F0C06174A
        for <linux-media@vger.kernel.org>; Mon,  8 Mar 2021 08:02:07 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id h26so1871824uax.3
        for <linux-media@vger.kernel.org>; Mon, 08 Mar 2021 08:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=An011ivT1O5IqSBEP+Exr4/mnv85DViHzOw1dLqooWM=;
        b=jeekrIFCRYpPa+xsnZZ0w38J4frFu3ydE5//Ca6SwxwiJuOBITzb8myXXxB2epwxuW
         QXhA0GsxH5Kzy+w/NLBijDaExj4XxJLpS0t12VGvm3drSXU3uYkQFjZAANJI/fqR6Nph
         gsKPjQ4kMSdZYsb4Zne/nZUft7dzr562wi66gmN4jy5EpU/GBYcCWav2RihEOzrGDsHa
         0pjHJLsw8Gmlu69SlBE3wNGCmClYiQQvP6hIm/vyisD+vfpZJ64W+ruYA3M+V7fqYXRz
         bcP2vhChHWWvXtUCl6oNO2ZJmfLt1sB9KH0hlzu1ZN+qSzk0edH0a0EUmTDPuS+GmE0U
         vcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=An011ivT1O5IqSBEP+Exr4/mnv85DViHzOw1dLqooWM=;
        b=o54/CwZ4j/azZzeApJkXltOJtlVLAnMqv1SVNiXqiaRTkYLR6XvtMAH0l6Ke0uXIzW
         4+fR+47wr1AnyAF3h2dy9HED4cFeYclTN/XjLP01Vo07QDIvg2Rqg9EEFQ5fPrikbgU6
         u5lcvgB54iHmUD/GY5swmlHeivrKPyFpnKPlwiUJsS51W/bb8srrfjMJC1TzpdT6H8f/
         zHvdza8NDo++OzAiluGpiByGV9EzuA10kC3Z5alqZrb58mpSunxesk0/aOGniCOxDRy1
         +GPBsTdExfnEE6AtznchynXwhR2soUogY+xcEgR8693NhHGPpae9oBljYZGEZ13+T1c/
         oGgQ==
X-Gm-Message-State: AOAM533o1W5rkUuuxgs9w7BtMAJmYFfMd81aAC91xD9bn+Q4lamhZ6zE
        bEl5yJAAmuFUIbihAGy1tK3GZu0xCkbQ9T+DoiY=
X-Google-Smtp-Source: ABdhPJwuFYQnKSyKc5E1TZUyp9J9Sp60E60qo2mEIw3WxuI/ANDkpscroQkTo0tFo+0nFPEO/vB6lShkVnmIEsS29mw=
X-Received: by 2002:ab0:382:: with SMTP id 2mr14186118uau.46.1615219326677;
 Mon, 08 Mar 2021 08:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
 <20210305183924.1754026-5-emil.l.velikov@gmail.com> <20210308135704.GB18168@pengutronix.de>
In-Reply-To: <20210308135704.GB18168@pengutronix.de>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Mon, 8 Mar 2021 16:01:55 +0000
Message-ID: <CACvgo52e8be9MqHOiq4V4a7QnHq__34GcSeOn4scmydW-=vvSA@mail.gmail.com>
Subject: Re: [PATCH 4/7] media: hantro: imx: remove unused include
To:     Philipp Zabel <pza@pengutronix.de>
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 8 Mar 2021 at 13:57, Philipp Zabel <pza@pengutronix.de> wrote:
>
> Hi Emil,
>
> On Fri, Mar 05, 2021 at 06:39:21PM +0000, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > The current imx8 code does not use the jpeg encoder. Remove the
> > unnecessary include.
> >
> > Cc: Ezequiel Garcia <ezequiel@collabora.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-rockchip@lists.infradead.org
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
>
> thank you, patches 2-4 could be tagged
>
> Fixes: 8e4aaa687863 ("media: hantro: add initial i.MX8MQ support")
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>
Much appreciated. Will add all the tags for v2.

-Emil
