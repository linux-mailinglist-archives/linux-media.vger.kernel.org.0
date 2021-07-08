Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7C13C13E3
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 15:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbhGHNM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 09:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhGHNM0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 09:12:26 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78989C061574;
        Thu,  8 Jul 2021 06:09:43 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id t10so2348206eds.2;
        Thu, 08 Jul 2021 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rVMZlgd8HuXH+Zr7CeIddNtS2E8VXF0s39JXMW69Eds=;
        b=lVCw9jTMb5lp5exvkpdXQ418ElmBbZFSFW2gy3wU7jTzyKswXLZXYm+IF1tIL4NJn2
         BohNTFGfgApKj0Gp9C3kEd32STFbV3umWDo6SwLQ3tHyRB//mhf7GmpOWrSIEF/wzIMA
         EEXtC6hXxnRJAozcBcFQVwQ23oN29mDCqmFitXm2tn8mI0YXZPUHx/a9VVwHNCvNClBm
         mmQ3RiMQhAFwI82vpjYu2ReLpjBApi1SF06+R4Z9ZOmOpNOV9RTiDeZvnChTlYU2dVMo
         6dFA8hZb1I+ZArLyghvJ5GDq/NYuemLoZjuJdG1xY4M6iIiSYHR0mEzFfwH9ufjwRpMR
         pCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rVMZlgd8HuXH+Zr7CeIddNtS2E8VXF0s39JXMW69Eds=;
        b=hMS3t3weiDCWHEk7PwDLaOefAMx9MzeljPpoKp6eSuFD1MzKzqncThcJwQmz0okcBm
         DrTfbsSHSwIVTA1M7PGe7OwQDYrmvtxBz/jH9UYKBP76YGcEMGs3bcTPLVrzVZfXN4sA
         bzREqawpT4cnHZyjLXhF3QaBcjce3RxD6p0XOWGgxR4V3ILK3zVTHe5LUl2Y0jSM3dfw
         r9Y6wEgnIvFSU5L8AT+pvKftG2DM4rCuVtQRo+o34XHfCKQi8P9kmNOg2IQJCD6fJpUI
         6tjNjBFS5QYcMvpV0GorI9HaLXveDCEMbudnnVPuTiu9+/Z2rCFpBsEi6gEL6Iu45oqJ
         f/Sg==
X-Gm-Message-State: AOAM532dGCW6S2L+1ZGmctuti+U+Ww7XKii+GdWKbCzSpVMoh9wQts10
        JovMH+L2Vh83OQQsXJQILLw6hNiTazehpYPJ3Jk=
X-Google-Smtp-Source: ABdhPJwMuFfbqYswXBcN5yyjqiaonc89pYus9l6+a2zeMi0Vj6ymwjSLurSB4NuRp3SuW+C5oIeDeODQ0LtBBknkkM0=
X-Received: by 2002:a05:6402:510d:: with SMTP id m13mr37825520edd.179.1625749782093;
 Thu, 08 Jul 2021 06:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210707141323.20757-1-viktor.prutyanov@phystech.edu> <20210707141323.20757-2-viktor.prutyanov@phystech.edu>
In-Reply-To: <20210707141323.20757-2-viktor.prutyanov@phystech.edu>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 8 Jul 2021 15:09:30 +0200
Message-ID: <CAFBinCDgQHA1vmunNBdER0BfiKt8XYZ+-VBs3c21+S3bYP7GZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: rc: meson-irblaster: document device tree bindings
To:     Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
        jbrunet@baylibre.com, linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Viktor,

On Wed, Jul 7, 2021 at 4:13 PM Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
>
> This patch adds binding documentation for the IR transmitter
> available in Amlogic Meson SoCs.
>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>  changes in v2:
>    - compatible = "amlogic,meson-g12a-irblaster" added
>    - clocks, clock-names and mod-clock updated
thanks for updating this patch with my feedback!

[...]
> +  mod-clock:
> +    maxItems: 1
in the change-log for this patch you mentioned that mod-clock is updated as well
I think that mod-clock (as a whole property) should only be added if
it's an external input to the IR blaster IP block


Best regards,
Martin
