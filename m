Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC652E0333
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 01:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgLVAJw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 19:09:52 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:32961 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgLVAJv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 19:09:51 -0500
Received: by mail-ot1-f48.google.com with SMTP id b24so10472661otj.0;
        Mon, 21 Dec 2020 16:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ItdUMRfTDsdb0hqe14rohMJr65K3UQ/22dOQXCjLzFE=;
        b=hTxveqQvXsV9RrHnVd0CXndrl5WaQehAELKJozIa8PRHdnadD2xNUP9V1EDZDAOhYX
         zcPsATqoDUlOKe4PcG4jWNrpYanhp2QoNbdtxlmXUtvTRNXwdNSak4fxtIQHlG5M7m6k
         dag1ShlbN8MDi1gnUp8XehqNbnHo2MA0vh1kLeHgKbvhUujisoUnLk26uUuoUAJ25/WB
         yRyQ/lHEcviEuZNcoxXtjrd+7pEKANfEqFtBC6Sax8y6Ur3MqaWbXVfX+Hg7CT7J1Fpc
         0tNEOnYJFvF91G/CD0XsnmAeukYkpReqkL5BpjyMW6a3f4zpqlw+dWoBIX+URv495nsn
         jYtA==
X-Gm-Message-State: AOAM530phHUofm7CLkvnHBxRp1HKkdThuYO9EG+DWFk061q1Rj70+gFO
        nRpBZsnb/wDBPQ5sVKtrow==
X-Google-Smtp-Source: ABdhPJy4jl6IQt5jJ5yPRdxdZBTTS1Nugckix9YOiNWPt3ntEL9GZvmZ7XQ1+laNFn9KbtQIJ5+hQA==
X-Received: by 2002:a9d:470f:: with SMTP id a15mr14177036otf.62.1608595750781;
        Mon, 21 Dec 2020 16:09:10 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id s77sm4075422oos.27.2020.12.21.16.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 16:09:09 -0800 (PST)
Received: (nullmailer pid 890725 invoked by uid 1000);
        Tue, 22 Dec 2020 00:09:04 -0000
Date:   Mon, 21 Dec 2020 17:09:04 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolas Chauvet <kwizart@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        linux-tegra@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
        Kevin Hilman <khilman@kernel.org>, linux-clk@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        devel@driverdev.osuosl.org,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 04/48] dt-bindings: host1x: Document OPP and power
 domain properties
Message-ID: <20201222000904.GA890651@robh.at.kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-5-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 17 Dec 2020 21:05:54 +0300, Dmitry Osipenko wrote:
> Document new DVFS OPP table and power domain properties of the Host1x bus
> and devices sitting on the bus.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt   | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
