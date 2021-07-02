Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D843BA323
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 18:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhGBQSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 12:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbhGBQSE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 12:18:04 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2672C061762;
        Fri,  2 Jul 2021 09:15:31 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id t3so13951073edc.7;
        Fri, 02 Jul 2021 09:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0CyPLvqK+Q8NHzNuZTr5kPFxjhrjFYWhZY35XEzbiOQ=;
        b=IbAqmb9ygFZk9a887t8qEkrN+RXWoHARiWHkHfVhqOrfUeyc5C9KeLOPdVZrHk2SVx
         gyxP3zCIzw+ztAO+vEn42sXTsh6h61gb5b76gPnChKNurlELilaYebJuqwgBUd1N5npb
         2UOAW6deQdfsq5DuDPWNRO0bW7/tGuEgUQk6jiHYWTI4klcfT8Be9PutLc+GLf7l7FDI
         T2zucV7K6m8be2MAb4KqkkBgSSDJcVB5ajBC5egeKZuo5JMTncsxWB/dC3ln5YsvylpT
         Y+SpGsQ+urLTsoI0AALKG3blP6Ud+U0jjQj9NXor35I1PG53iU8rD86ifFVgQxkHD/6O
         OiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0CyPLvqK+Q8NHzNuZTr5kPFxjhrjFYWhZY35XEzbiOQ=;
        b=L2qGVSn8IJSaVr4rHEzsELfK6uHK8TQP1gkuQkD/LQ3f7lVg+7KWDu6fBzBfVOb2KC
         UtC1l4xFEoqgH7TbiL+i2pbcbmMxfYPvLkQSEPjDywqxAIY8gaKObjoqXmtQ/Eiup2TV
         Mt7aDItjuRzZOEQqU+AQGtVCGRDW97qTqu600qwWgX30YzHd/KImRDHOK3U+xhgSY4PR
         eYWSBiLouihQbQ3obTMOFdMTiovA01mpxaYsnl7t4Kn2BCQwAukfYQgF4HO7p8nTpf36
         uswS+oaEtRrH+vUGIUjAjuTfxdUWQpYxJ1j2pjInxm+lXkRp7Km2auIyOga+NI7ZBBc+
         9bRQ==
X-Gm-Message-State: AOAM532i+fDLPbGySBNKwaFiJyBEa+HoQbegmEVRj+fFXltxcLhLZFAx
        8/VvYTxo35uXz11g5EWN+gFPZ3xexEAbsQxHQ0w=
X-Google-Smtp-Source: ABdhPJzTplJzJDgwT4b8/ikKLT8jsa9voYiaeLlsSCeJmsriCnofP+WlAfCEAN/jEj1wU+EwgK6wXThHemjJnDqwhik=
X-Received: by 2002:aa7:d8d4:: with SMTP id k20mr266060eds.143.1625242530226;
 Fri, 02 Jul 2021 09:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
 <20210701215132.16317-3-viktor.prutyanov@phystech.edu> <20210701224646.GA18540@gofer.mess.org>
In-Reply-To: <20210701224646.GA18540@gofer.mess.org>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Fri, 2 Jul 2021 18:15:18 +0200
Message-ID: <CAFBinCA+zud1THT6z2QsGCqXMT-3nqN_S4nR0FhaDGhcKzoe-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: rc: introduce Meson IR blaster driver
To:     Sean Young <sean@mess.org>
Cc:     Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
        mchehab@kernel.org, robh+dt@kernel.org, khilman@baylibre.com,
        Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

On Fri, Jul 2, 2021 at 12:46 AM Sean Young <sean@mess.org> wrote:
>
> Hi Viktor,
>
> Thank you for your driver. Is there a datasheet available for this hardware?
The public S905X datasheet [0] (starting at page 515) and the public
S905D3 datasheet [1] (starting at page 1105) document the registers.
If Viktor has additional or better information then it would be great
if he could share it with us.


Best regards,
Martin


[0] https://dl.khadas.com/Hardware/VIM1/Datasheet/S905X_Datasheet%20V0.3%2020170314publicversion-Wesion.pdf
[1] https://dl.khadas.com/Hardware/VIM3/Datasheet/S905D3_datasheet_0.2_Wesion.pdf
