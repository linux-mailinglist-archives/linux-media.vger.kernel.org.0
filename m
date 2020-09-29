Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773DE27C0E2
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 11:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgI2JTB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 05:19:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:40618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727781AbgI2JTB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 05:19:01 -0400
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E734420C09;
        Tue, 29 Sep 2020 09:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601371140;
        bh=7d9m8YtmM0oZBYPyOHbYl7Ajwa8TOm2mgFhI2B2FaTY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QCn0viO1E7fFEdHcrG7XpKuS95w0MxGkvORWGZ4t8rgF0qiA1+8nlhMIYTEzkHgKO
         tMS3ZAI+vnstBUhPaeajoxZcysKp/06r7djzKNzINavjuKE453czOsxSWsXsDnekBQ
         3xwjgzTsTovs86xQb71msEABZM9wIK1RIrNEOwVk=
Received: by mail-ej1-f43.google.com with SMTP id i26so13940200ejb.12;
        Tue, 29 Sep 2020 02:18:59 -0700 (PDT)
X-Gm-Message-State: AOAM53181Mc47J8DKcZFghPN05OTCHF2YApuw7uNePPXbnKPgMW47C84
        wRR8rc3I0CfFCiH+qd2pO6pMjG21SvxzuU2indY=
X-Google-Smtp-Source: ABdhPJxGllGR2UiacyCTtjrgcZvi5cZtvrKkih45ZyLS0pOKgdvpZZMzMI6hYkQvt1+O3W0WIqLB4Ct0t3vT/qbhxdg=
X-Received: by 2002:a17:906:8401:: with SMTP id n1mr2757814ejx.215.1601371138361;
 Tue, 29 Sep 2020 02:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200923152129.21736-1-krzk@kernel.org> <20200929091512.GF26842@paasikivi.fi.intel.com>
In-Reply-To: <20200929091512.GF26842@paasikivi.fi.intel.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 29 Sep 2020 11:18:46 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfRnMg2sUO8dd8CRrwyQFNr-9HN5-QV7Uy4YTVrRJosWQ@mail.gmail.com>
Message-ID: <CAJKOXPfRnMg2sUO8dd8CRrwyQFNr-9HN5-QV7Uy4YTVrRJosWQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: media: imx258: add bindings for
 IMX258 sensor
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 29 Sep 2020 at 11:15, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Krzysztof,
>
> On Wed, Sep 23, 2020 at 05:21:26PM +0200, Krzysztof Kozlowski wrote:
> > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > driver, are quite limited, e.g. do not support regulator supplies.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v3:
> > 1. Document also two lane setup.
> >
> > Changes since v2:
> > 1. Remove clock-frequency, add reset GPIOs, add supplies.
>
> Oops. I missed this one.
>
> How does the driver know the appropriate clock frequency for the platform
> if it's not in DT? The sensor supports a range of frequencies, not a single
> frequency.
>
> Could you add clock-frequency back?

Not really, it was removed on Rob's request. The bindings do not
describe driver's behavior so how the driver gets frequency should not
be part of the bindings. Also it's not a real problem - the driver
just calls clk_get_rate().

Best regards,
Krzysztof
