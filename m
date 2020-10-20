Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A0D29396B
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 12:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392307AbgJTKyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 06:54:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:58974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392290AbgJTKyY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 06:54:24 -0400
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBC0422404;
        Tue, 20 Oct 2020 10:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603191263;
        bh=hp9UnoqlHA0qRuSh68YiQSm49gjLgBjCPA1yHdszyaI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JxZgWbDTa4whJLLURjKV37fRFsLXkAE6s/yTFKYgi5vdEfn2gStzkD1BIJ885IhSK
         rxYEL0U9oYyI+2iVxAU0aPx11xGHOoqiPwUUne97ksM3/4n3bFbR4vosm0QFjtE5go
         GZ8SiDF0WTbxnTBHQJ1JnfLnYzL0VsK2MzwrgcGQ=
Received: by mail-ej1-f43.google.com with SMTP id md26so1977248ejb.10;
        Tue, 20 Oct 2020 03:54:22 -0700 (PDT)
X-Gm-Message-State: AOAM532WZ/pOMYpuxfc3KSkyg6pzTDL4U/X6jEuqL9gi+2wTvbCHZ0jf
        xorNwnoyn8uFHZx4dWoU4xAGSeLLdz3m1WS9wAk=
X-Google-Smtp-Source: ABdhPJyuih4+evGE7IK26IbJOQ7i2MpEqP7AmbQkTm1rbqJCo3zhlb5MJVxbu3M8P3axXm597GbG+llA1YVfsEzgmks=
X-Received: by 2002:a17:907:43c0:: with SMTP id ok24mr2462537ejb.385.1603191261238;
 Tue, 20 Oct 2020 03:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201019170247.92002-1-krzk@kernel.org> <20201020103833.GT13341@paasikivi.fi.intel.com>
In-Reply-To: <20201020103833.GT13341@paasikivi.fi.intel.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 20 Oct 2020 12:54:09 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdKHCQikYDLKDS2Y3NVyCjMYYH1pcxgaMoYgOK19vQCrQ@mail.gmail.com>
Message-ID: <CAJKOXPdKHCQikYDLKDS2Y3NVyCjMYYH1pcxgaMoYgOK19vQCrQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: media: imx258: add bindings for
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 20 Oct 2020 at 12:38, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Krzysztof,
>
> On Mon, Oct 19, 2020 at 07:02:44PM +0200, Krzysztof Kozlowski wrote:
> > Add bindings for the IMX258 camera sensor.  The bindings, just like the
> > driver, are quite limited, e.g. do not support regulator supplies.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > ---
> >
> > Changes since v4:
> > 1. Add clock-lanes,
> > 2. Add Rob's review,
> > 3. Add one more example and extend existing one,
> > 4. Add common clock properties (assigned-*).
>
> Using the assigned-* clock properties may be workable for this driver at
> the moment. But using these properties does not guarantee the external
> clock frequency intended to be used on the hardware.

It guarantees it. The clock frequency will be as expected (except if
someone misconfigures the DTS).

> Using other
> frequencies *is not* expected to work. That applies to this driver as well.

This is the binding which is HW description. According to HW datasheet
other frequencies from described range are accepted and expected to
work.

> This, instead of the clock-frequency property, effectively removes the
> ability to set the correct frequency from the driver, at least with current
> set of the used APIs.

It seems you confuse DT bindings with some specific driver
implementation. Bindings do not describe the driver behavior but the
HW. The ability to set the correct frequency from the driver is not
removed. It was never part of the bindings and never should. It is
part of the driver.

>
> I suppose you could add a function to set the assigned clock frequency and
> keep it, just as clk_set_rate_exclusive does?
>
> Cc the common clock framework list + maintainers.

The bindings have Rob review which is the DT maintainer. His
ack/review is needed for the bindings to be accepted. What more do you
need? Shall I point to submitting-bindings document?

I am really tired of discussing this. You raise some concerns about
driver behavior in the wrong context - in the patch for device tree
bindings. You use the arguments about the driver while we talk about
bindings. This is clearly not correct. I am all the time repeating
myself - the bindings describe the hardware, not the driver.

Best regards,
Krzysztof
