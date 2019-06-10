Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE1E3B5A9
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 15:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389881AbfFJNCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 09:02:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33979 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389045AbfFJNCD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 09:02:03 -0400
Received: by mail-lf1-f65.google.com with SMTP id y198so6580948lfa.1
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2019 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FvVmgwiazCcMY+QGQrVG7dPwBjyoAsTBZz5XDskINwU=;
        b=EMSHvZxrNj7zSeWW6JUMb1PjD7XA4L2F3EJBWazAQYFiTny584qw5TGz+HoR4WtRPs
         jt0BFoSOGoG5cEKmGnSsVNUFOekU91241Gxig8HqO889e0o8n1mR0IGZzek77ZNEH0nR
         HNZtFC0cMDMDejIk5zmWW2LivA0+TD8QfSWxb873mnou5gQReddEbu9l7uaLLRATj9k6
         J7joALu5V2Uz0HXzTFybC991OzTTITbWKqyzTde8jVHngHRLH1MBiA42vMBZWBfmHdmL
         TtBrP9BIUOsdEwIlfDTfHuA+NE+2ZOKsggvG/+JwOwZa8/YD8lsLqeWXSvXlt6BSuR9U
         fTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FvVmgwiazCcMY+QGQrVG7dPwBjyoAsTBZz5XDskINwU=;
        b=BNB9qKcZ4UwbRuNy731JVFeBcPH8e5QDoY7B9I0te5pxS3wzscf5oYFhomr/PLKURw
         NykIy+9zjIMWOwt2OG1BLcqdBOg+SkeMwIJSCNovpUCW7Ie7LQs024geX28IwEJbUfRu
         Nd8YYaPtgGv1S02z48EAdBt3K0LWhFARV+Jprg5hc415p2fZJdiSzAXVzLA3yKXPs8hV
         jBhqUYuDFnHLmWolIYn9lpMM88oWR4Jm8YI4vYVw7UdZFVZQqfxmQ0YqNONLkA85G3LI
         wq0FGzORW9JsfajKVU7vQjiZGti6Gf66mIPy8+iI0JMYS4P8h8WA6JkmCzCRHdi2IcFk
         Ry5g==
X-Gm-Message-State: APjAAAU3tHSWL7pdLNEEcVnNFXvifBCqPRizljTBFp3VJa6ShFTSrJvL
        6Bs3Sc00dP2+Mp++oj5hv6dKHEx6qCPVm3JwO+IaRQ==
X-Google-Smtp-Source: APXvYqztCweeAg9bUK/19CvnD4JyBvcZjEnwDj3sBiLhrLCK6pXF7PHLmDF1b1+3rnaeDnoReMLep6XRUs3DNxTDDHc=
X-Received: by 2002:a19:f601:: with SMTP id x1mr34368114lfe.182.1560171721490;
 Mon, 10 Jun 2019 06:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190606094736.23970-1-anders.roxell@linaro.org> <20190606105954.GZ2456@sirena.org.uk>
In-Reply-To: <20190606105954.GZ2456@sirena.org.uk>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Mon, 10 Jun 2019 15:01:50 +0200
Message-ID: <CADYN=9+5RCiSRQdV+vcUT9cqH6fMAMFpMUmApzT2hRfeivfhHg@mail.gmail.com>
Subject: Re: [PATCH 8/8] drivers: regulator: 88pm800: fix warning same module names
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, andrew@lunn.ch,
        vivien.didelot@gmail.com, f.fainelli@gmail.com, marex@denx.de,
        stefan@agner.ch, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, b.zolnierkie@samsung.com,
        a.hajda@samsung.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        p.zabel@pengutronix.de, hkallweit1@gmail.com,
        Lee Jones <lee.jones@linaro.org>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 6 Jun 2019 at 13:00, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jun 06, 2019 at 11:47:36AM +0200, Anders Roxell wrote:
>
> >  obj-$(CONFIG_REGULATOR_88PG86X) += 88pg86x.o
> > -obj-$(CONFIG_REGULATOR_88PM800) += 88pm800.o
> > +obj-$(CONFIG_REGULATOR_88PM800) += 88pm800-regulator.o
> > +88pm800-regulator-objs               := 88pm800.o
>
> Don't do this, no need for this driver to look different to all the
> others in the Makefile - just rename the whole file.

Thank you for your review, I'll rework and resend v2 shortly.

Cheers,
Anders
