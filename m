Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD345275B29
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 17:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgIWPGo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 11:06:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:52640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbgIWPGm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 11:06:42 -0400
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9AE5D23119;
        Wed, 23 Sep 2020 15:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600873601;
        bh=OvVQCoqK76PnVayVef+eyOe3qVoNcxHgcMGbxGzsbms=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=c8JWlEocwvO1ONAyQcrbBNKereMYLF+HXvsetBwE70zA/8YKWPwhaP3fCYsJYunho
         AkvwuUInDaSlp1fJsT06+rxZ+Qsc8l0pskNz6994SDs8CbfVwL2Xn2DidODsn8MgLx
         6JKQppjSNk5zWJvPoacLlNvZw8j+61u+mLrcoJNs=
Received: by mail-ej1-f42.google.com with SMTP id z23so40320ejr.13;
        Wed, 23 Sep 2020 08:06:41 -0700 (PDT)
X-Gm-Message-State: AOAM531SWrq17zinprjGrI6jOSVHQfSZGEU4LjCBELtzyfAIKItGHMHY
        xL0gwBZr8zR8+bFs9yRdxGVVzsd5yTYSuhwlN3U=
X-Google-Smtp-Source: ABdhPJw2OR65sE0ouKRBJG8zu9JqRIJtV6E2+4agvXD5tSdjXqiFUk+yeliH8xvrLDUXbKzW19aU6o7AJ+uEzRoHji4=
X-Received: by 2002:a17:906:4046:: with SMTP id y6mr119390ejj.148.1600873600132;
 Wed, 23 Sep 2020 08:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <1599031090-21608-1-git-send-email-krzk@kernel.org>
 <20200914201310.GA154873@bogus> <20200921112635.GA1233@kozik-lap> <CAL_Jsq+gT3WSCAsKTrjZMh+vF4mx-m51rO=Wv+YcNxNhjEoO8A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+gT3WSCAsKTrjZMh+vF4mx-m51rO=Wv+YcNxNhjEoO8A@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 23 Sep 2020 17:06:27 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe7KgRLzrqMrWgmVcimvGO5N3028NPwJgXzZb76gz2MuQ@mail.gmail.com>
Message-ID: <CAJKOXPe7KgRLzrqMrWgmVcimvGO5N3028NPwJgXzZb76gz2MuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: imx258: Add bindings for
 IMX258 sensor
To:     Rob Herring <robh@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 22 Sep 2020 at 21:23, Rob Herring <robh@kernel.org> wrote:
>
> > > If this is the only config, why does it need to be in DT?
> >
> > The sensor is capable of two settings: two lanes (1 and 2) and four
> > lanes described above.  However Linux driver requires the latter (four
> > lanes, 1+2+3+4).
> >
> > If I were to describe the bindings for HW, someone would really be
> > confused and try to use two lanes setup, which won't work. Driver won't
> > allow it.
>
> If someone has h/w with only 2 lanes connected, then they have to go
> add support to the driver whether we've documented 2 lanes in the
> binding or not.
>
> > I understand that bindings document the HW and describe its interface
> > but do we really want to put "theoretical" bindings which cannot be used
> > in practice with Linux kernel?
> >
> > If yes, how to nicely document this that only one setting is currently
> > working?
>
> You don't, at least in the binding. That's a driver issue. Bindings
> are separate. They are stored in the kernel tree for convenience, not
> because they are part of the kernel.

Mhmm... okay. I already sent v3 for this with fixed four lanes so I
will re-spin with 2 or 4 lanes setup.

Thanks for the review!

Best regards,
Krzysztof
