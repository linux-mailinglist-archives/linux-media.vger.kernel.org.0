Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09752131B2D
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 23:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgAFWQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 17:16:47 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40685 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgAFWQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 17:16:47 -0500
Received: by mail-oi1-f195.google.com with SMTP id c77so16534192oib.7
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 14:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JawZyvCEqxbxDbUWcz/6qCJtFgFJJZ6Kq0F51D4TyLs=;
        b=qDfx617ZPAI+Xzp68pqM1AF6eBOTt5Wl8mpFPWSogewYPneSbHUhLgZ5X+Be8Rif67
         joylxoU0i57THoQv5KdwE9OhwM+jxsWiELuBDujLflVIYF/bmDG+9Rk6OF6SYy0ZOirX
         thH+QUgWmZvNK1ukzF8BuZ4mMFpLKjygtTEIzOuEIKUGmQFgBMYgtM7niEv7lfaKoVb0
         GrWt9hMimc9o8kxi7wDR0K0BlARX7xykPjA68V3GHiToPAQDkgcXIOs5z2ZodHF0dddU
         H5S93VF47g+dB96xOoezjbMZnjpzNU6mgH6kudg0Ja3V12kxWrRHlVhKe6fIZ5kFj3hX
         QUnw==
X-Gm-Message-State: APjAAAXMonIf+3UhtbekqkOeZzgZyPolqpXe/CZ3oCFTTk/CrpEd6Tca
        aErkFrapQp1hn+PC3EjqSxjFtz8=
X-Google-Smtp-Source: APXvYqzuW/eWcfGT0HupE88tFQNx08u215i0CK63zu0fnKTUxJY7NXUjmV3cUsZf68xL/iydm8ZjrQ==
X-Received: by 2002:aca:1c1a:: with SMTP id c26mr6620473oic.75.1578349006410;
        Mon, 06 Jan 2020 14:16:46 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id u75sm17789418oie.15.2020.01.06.14.16.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:16:45 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22043f
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:16:43 -0600
Date:   Mon, 6 Jan 2020 16:16:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kamil Debski <kamil@wypas.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/20] dt-bindings: Rename Exynos to lowercase
Message-ID: <20200106221643.GA31683@bogus>
References: <20200104152107.11407-1-krzk@kernel.org>
 <20200104152107.11407-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200104152107.11407-2-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat,  4 Jan 2020 16:20:48 +0100, Krzysztof Kozlowski wrote:
> Fix up inconsistent usage of upper and lowercase letters in "Exynos"
> name.
> 
> "EXYNOS" is not an abbreviation but a regular trademarked name.
> Therefore it should be written with lowercase letters starting with
> capital letter.
> 
> The lowercase "Exynos" name is promoted by its manufacturer Samsung
> Electronics Co., Ltd., in advertisement materials and on website.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  .../devicetree/bindings/media/exynos-jpeg-codec.txt         | 2 +-
>  Documentation/devicetree/bindings/media/exynos5-gsc.txt     | 2 +-
>  Documentation/devicetree/bindings/media/samsung-fimc.txt    | 2 +-
>  .../devicetree/bindings/media/samsung-mipi-csis.txt         | 2 +-
>  Documentation/devicetree/bindings/phy/samsung-phy.txt       | 6 +++---
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 

Applied, thanks.

Rob
