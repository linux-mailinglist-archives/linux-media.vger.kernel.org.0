Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D63A311D792
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 20:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730771AbfLLT6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 14:58:09 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36797 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730753AbfLLT6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 14:58:08 -0500
Received: by mail-ot1-f67.google.com with SMTP id i4so3264408otr.3;
        Thu, 12 Dec 2019 11:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DFLlahyHI5CWddupsVreSqNy/vA0cEJats5492jOSIs=;
        b=TD7g7jwnUfDkDTZXvxve3OJXxK3GHfe5bBkdC7pt5OmvM0NMo9LVvJUmtVK+yMpQgy
         vQgMoNCRNgIPGk6R5mhXxZWioE7nsHSI6ypVusSjEl7CjyUu3EgqXGSybzS7OkzpOsSb
         mcmhXX1vYjnkVSefiLRylfhtoyJ9Vy39jDMVZLuZYqVTpzRQWrobagHQbcOPc1HsXqqF
         y/kSNaw3ZaaGT3WDFKb/HmEQ8tHXojg9ICTqbAEDBP/HnjJ5Rbzd8E4ODkxLXWOHxQgZ
         kjs1aVUkYxcYB1+tQil4sFBJqJe4E+3ubKfq45Cxfg8dyMV0PoAWKl+Ix78PTZOq33op
         TL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DFLlahyHI5CWddupsVreSqNy/vA0cEJats5492jOSIs=;
        b=unx/b/p803mFfIaldC6Mbv0Uvp0bBq8c9AvbCmwF3iNIahcmFJYA2d4GKACAw4nzvj
         hv7ObH2L5fgBsqRxVoynu8x+oR6+JnwbQKNvY4VrXUvP7+WjaMt1nn+qF+FpkTS6PfF7
         AWB/N9Cfu17THiEhXeR0GMKxJKDEngaSd0ayP46b0uOA1GqeuFRGDy4T4qQXCoFN0o+l
         S6CYcBR1Muo5nX3OKqhxPkPozNKuyZFhhfcL7DNPN2j8nje6Q/2c3qYLgUa+vAbnuGNd
         l+CeHirhfUeh4jp9LgsyFY2QcwL9lqnXqFxeBW65szEJipp592a/pXv41lOOpm6a9Yzi
         Nd4Q==
X-Gm-Message-State: APjAAAVPKKop0m2fkhdpfbYU6amms6RiuSAWmJ4WR0xRQsxbOZrVhksx
        r32eSVoDF1qiOeXpFRSS+8MJFBjQ+HnsrAt86hc=
X-Google-Smtp-Source: APXvYqzBv7wgx408g13iewCw+znrFEZiUL++7s01qX7XO3cSWn27p9E1tGYyz8Gwyf9GVrZPOlySmA8XV5OfmM/myAQ=
X-Received: by 2002:a9d:6a4c:: with SMTP id h12mr10313165otn.81.1576180687595;
 Thu, 12 Dec 2019 11:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20191212145925.32123-1-glaroque@baylibre.com> <20191212145925.32123-4-glaroque@baylibre.com>
In-Reply-To: <20191212145925.32123-4-glaroque@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 12 Dec 2019 20:57:56 +0100
Message-ID: <CAFBinCDjfzQX=ZG=cgTYo=icGNU-t4Kqnu0Bu5qRLsRk_s6S_Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: platform: meson-ao-cec-g12a: add wakeup support
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, khilman@baylibre.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guillaume,

(I don't know the specifics of this hardware but I have two general
comments below)

On Thu, Dec 12, 2019 at 4:00 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:
> +#define CECB_FUNC_CFG_REG              0xA0
> +#define CECB_FUNC_CFG_MASK             GENMASK(6, 0)
> +#define CECB_FUNC_CFG_CEC_ON           0x01
> +#define CECB_FUNC_CFG_OTP_ON           0x02
> +#define CECB_FUNC_CFG_AUTO_STANDBY     0x04
> +#define CECB_FUNC_CFG_AUTO_POWER_ON    0x08
> +#define CECB_FUNC_CFG_ALL              0x2f
> +#define CECB_FUNC_CFG_NONE             0x0
> +
> +#define CECB_LOG_ADDR_REG      0xA4
> +#define CECB_LOG_ADDR_MASK     GENMASK(22, 16)
do these registers have some RTI_* prefix in the datasheet?
that would make it easier to spot that these registers belong to AO /
RTI (while all other registers belong to the CEC controller)

[...]
> +       if (ao_cec->regmap_ao_sysctrl)
> +               ret |= regmap_update_bits(ao_cec->regmap_ao_sysctrl,
> +                                        CECB_LOG_ADDR_REG,
> +                                         CECB_FUNC_CFG_MASK,
why do we need to mask CECB_FUNC_CFG_MASK (from register 0xa0) in the
CECB_LOG_ADDR_REG register (0xa4)?

> +                                         logical_addr << CECB_LOG_ADDR_SHIFT);
FIELD_PREP(CECB_FUNC_CFG_MASK, logical_addr) would make it consistent
with the rest of the driver
then you can also drop the #define CECB_LOG_ADDR_SHIFT


Martin
