Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15D09114753
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 19:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729497AbfLESu7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 13:50:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:46466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbfLESu7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Dec 2019 13:50:59 -0500
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D544420637;
        Thu,  5 Dec 2019 18:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575571859;
        bh=2J8dGb3LKQ1NbtoXi2EBVOWgBZLtFsy9Ky5TBCacaiY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EBCsNjMDgXMFZXrcDooeWfc9lTvGQUYo6UW1MuEcj73auCI4K5vsWs0qYGz8E+5K9
         fHVJNauSqUHqVS0yHEzwu9ZmEyKqEVXUmH+ktkInnpyuDGqyXyShsK+2/OfHjqV6MJ
         7tuRbdPuZ6yLsdzheDC7FqGZPZvv5GfVeNMZd5qo=
Received: by mail-qk1-f180.google.com with SMTP id c124so4291480qkg.0;
        Thu, 05 Dec 2019 10:50:58 -0800 (PST)
X-Gm-Message-State: APjAAAUVju2bVbOdgw4JXNiMaJMXUe6viVeSvLD4KK5ePngbh7Kn4J3d
        T8atgrox7zK8K71CGBPBlRm6xTYqvcOBsbhesA==
X-Google-Smtp-Source: APXvYqxHRk7XLULW3uCK57I1LO+GYC0i7xE9PKzl0lYAajv5uAHzi3goaknvA1mi8cmpWUtzOFO+k3inbP9FBuI6+gc=
X-Received: by 2002:a37:85c4:: with SMTP id h187mr9650315qkd.223.1575571857971;
 Thu, 05 Dec 2019 10:50:57 -0800 (PST)
MIME-Version: 1.0
References: <20191205153408.26500-1-narmstrong@baylibre.com> <20191205153408.26500-3-narmstrong@baylibre.com>
In-Reply-To: <20191205153408.26500-3-narmstrong@baylibre.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 5 Dec 2019 12:50:46 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+ytVOw6pVaLo6pN_hM3gwk60d-hyx=P9ntcmunMLxOZg@mail.gmail.com>
Message-ID: <CAL_Jsq+ytVOw6pVaLo6pN_hM3gwk60d-hyx=P9ntcmunMLxOZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: media: amlogic,gx-vdec: add bindings
 for G12A family
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 5, 2019 at 9:34 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add bindings to support the Amlogic Video Decoder on the Amlogic G12A
> family.
>
> For the G12A family, a supplementary clock is needed to operate the
> HEVC/VP9 decoder.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/media/amlogic,gx-vdec.yaml       | 42 ++++++++++++++++---
>  1 file changed, 37 insertions(+), 5 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
