Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D239126A3A7
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 12:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgIOKwM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 06:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgIOKmm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 06:42:42 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32008C06174A;
        Tue, 15 Sep 2020 03:42:41 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id jw11so1521730pjb.0;
        Tue, 15 Sep 2020 03:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IdU03k2T+rfb8VS3p8Sxk3R2bI7b0OTzVImyXev4JvY=;
        b=OA6iw8cQu4rEpiM1ivWrF1ZhfIK2qT3L9Pz7NYFH1grD2HRi0xgyfVqHMb0q2lZ9ZV
         y0OdNup0F0gLcsqC/VuvQmdh9j2sYZiobksC3Mshvn+46rT/OKdgKBb4nMama+zgA/s5
         N0aNc66SVEiwf6+NXEEnSZXKrnYg6D93YzULPQAFsUacDxClI1mgPvE0pP984QkPqwz2
         QI3IF3l/dYCC6pLyjoZ917Hx3wW/tNg4ZEzT5cdk62QwCsV1/rM3kK8EoIfXa2JXOCm0
         LcE0bqIgKDkK3Pgt4TwZsXFZNnItot5kzCoil7o4orfMwnaAjNGE3/j8rj4GNNPGGfPa
         i+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IdU03k2T+rfb8VS3p8Sxk3R2bI7b0OTzVImyXev4JvY=;
        b=mC4CEVVA5QwZDtRX3JacyltSIjOSVCVXP5Zf8/Gioa6Rda5teg9ZHBUDKHjgyl8LzB
         XV2TNDTVhDJSL1YS/Xpn3N+gEZfesxAMVPrxEx1PlLfUoIEOYyvP7Cz95/GBvjRQcSfo
         W/Pf28M6MSOxCmzlpAuyakJsLzj+mRRvHOb6zDlsJGg94+I5lGrJnIsxNH0qNNJaQNrO
         aSEW2LdERi5poZUpGDUDJsUMHTrrH0nq+wExilNurvjVOsd9QxXsj03Gl2KMPzb0NWW0
         jqZjDeStNa5g7nuWS7gN13wZOcNOAQ9wIeufPFPx5lWK50Ona1Y4HHbd1DRt6fhUmKJf
         nIZg==
X-Gm-Message-State: AOAM5321fVIYJJ5feKfsL6JMaJ3VxzXVDFWGywPz6g5ZawhR9KqsHiDP
        wxBvRbiuPEye7T8acO2du3YPzdsbkgc258TEP9Q=
X-Google-Smtp-Source: ABdhPJyoOiF8Ou32lwnqD0/pBoU1a1EmgDRsJ+Z6Pdii/LmAaLAMJUOGrPMqWD6pO1qAZ9JL4Xs/qizngyaBWgwSA+A=
X-Received: by 2002:a17:90b:fc4:: with SMTP id gd4mr3587838pjb.129.1600166561173;
 Tue, 15 Sep 2020 03:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200915150202.24165-1-qiangqing.zhang@nxp.com>
 <CAHp75Vftg3GmBsCCrZeXo4eofOYTJ2ii+s64hY5FqZadvX6Bww@mail.gmail.com> <DB8PR04MB6795840F4C0D938A14D1E3BEE6200@DB8PR04MB6795.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB6795840F4C0D938A14D1E3BEE6200@DB8PR04MB6795.eurprd04.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Sep 2020 13:42:23 +0300
Message-ID: <CAHp75Vdq2atO9MP8=cgHW9Rn8rSf+GdtmRThAXFB9LB-Ym95xg@mail.gmail.com>
Subject: Re: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle system
To:     Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     "sean@mess.org" <sean@mess.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 15, 2020 at 11:06 AM Joakim Zhang <qiangqing.zhang@nxp.com> wro=
te:
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> Sent: 2020=E5=B9=B49=E6=9C=8815=E6=97=A5 15:18
> To: Joakim Zhang <qiangqing.zhang@nxp.com>
> Cc: sean@mess.org; mchehab@kernel.org; linux-media@vger.kernel.org; linux=
-kernel@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle=
 system
> On Tuesday, September 15, 2020, Joakim Zhang <qiangqing.zhang@nxp.com> wr=
ote:




> +       ret =3D pm_runtime_get(dev);
> +       if (ret < 0)
>
>
>
> Here is reference counter leak.
>
>
>
> Thanks Andy for your kindly review.
>
> pm_runtime_get increase the usage_count even it fails, so need call pm_ru=
ntime_put_noidle here to balance the usage_count. Am I right?

Yes.

> +               return IRQ_NONE;


--=20
With Best Regards,
Andy Shevchenko
