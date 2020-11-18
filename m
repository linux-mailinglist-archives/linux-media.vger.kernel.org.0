Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48162B7727
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 08:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgKRHsR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 02:48:17 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36417 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbgKRHsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 02:48:16 -0500
Received: by mail-ed1-f65.google.com with SMTP id m16so957325edr.3;
        Tue, 17 Nov 2020 23:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/VBymVKVFuIaMs6diTaKJdglBbHoKWE5HN40ZxS82fM=;
        b=ZoQXuxH+O+bMZf6e01a5OMk9ERHYOga+zduslROkrb0PoC1qdpsAMBS9m/r9xs3xdH
         pOAsqdM5IZIe1OxHvwq5MbntFv8ZylO2ufc66o6O9BzN42J4XzXkM2kzOe2zcX4X50+J
         8vfTwwj0xleWzXBBKaa0wNRfEjexpfgMkMVPS1jJbBsPNbakT5sK3J1r9WOZVI0DPg0U
         EXSKz+EUgP3H4o8h8t7eu3FY72qnHRXJxGr/fs2Tw1qYAcbj0upMEdRAJfaphMMg7JEw
         fBJzInSNZAL0tFu0X5HbAoaCGTIyHBJgjL+ojNgF51Ueb+99jWoTXX+Hc72pAr+Hxp+D
         rlXQ==
X-Gm-Message-State: AOAM532hxQ6o2qZiFQE4V99fQQOBcX0g+PRAVF52+kEU5JTFEIah4p27
        ZhqHJry+Vx9AKUUNfEMFZpQ=
X-Google-Smtp-Source: ABdhPJx+aZjGIA58JBNNsU2EYJuORCMi9eVDKQ3IfVQdHZjH8ummbU4/k0jvYclGpHK/bGP8ytcepg==
X-Received: by 2002:aa7:c2c3:: with SMTP id m3mr24597168edp.361.1605685694599;
        Tue, 17 Nov 2020 23:48:14 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id g7sm13224731edl.5.2020.11.17.23.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 23:48:13 -0800 (PST)
Date:   Wed, 18 Nov 2020 08:48:12 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: fix redefinition of clk_prepare on MIPS with
 HAVE_LEGACY_CLK
Message-ID: <20201118074812.GA5803@kozik-lap>
References: <20201115170950.304460-1-krzk@kernel.org>
 <20201115170950.304460-2-krzk@kernel.org>
 <160568531746.60232.15496517544781609246@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <160568531746.60232.15496517544781609246@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 17, 2020 at 11:41:57PM -0800, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2020-11-15 09:09:48)
> > COMMON_CLK even though is a user-selectable symbol, is still selected by
> > multiple other config options.  COMMON_CLK should not be used when
> > legacy clocks are provided by architecture, so it correctly depends on
> > !HAVE_LEGACY_CLK.
> > 
> > However it is possible to create a config which selects both COMMON_CLK
> > (by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (by SOC_RT305X) which leads to
> 
> Why is SND_SUN8I_CODEC selecting COMMON_CLK? Or really, why is
> SOC_RT305X selecting HAVE_LEGACY_CLK?

The SND_SUN8I_CODEC I fixed in following patch (I sent separately v2 of
it).

The SOC_RT305X select HAVE_LEGACY_CLK? because it is an old, Ralink
platform, not converted to Common clock frm. Few clock operations are
defined in: arch/mips/ralink/clk.c

Best regards,
Krzysztof

