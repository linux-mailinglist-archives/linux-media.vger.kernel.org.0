Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417DA2E0343
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 01:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgLVAKW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 19:10:22 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:44600 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbgLVAKV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 19:10:21 -0500
Received: by mail-ot1-f47.google.com with SMTP id f16so10416093otl.11;
        Mon, 21 Dec 2020 16:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zG6sef2nkyQSD9FdWc29n10NLZhBWeYXF5IDEZb5IhM=;
        b=CL51228cSSnN2XOBwhl9xIAbhmeJaYoPqBZesVwjff3NOyXxS0U0vGcc8+jw74vxmA
         k0QDRU+Un4AvY6nHsfSMszEZAww55uf9C/NO44trbv0c8ZnIUbp45qTz6clJ+1ocYhEo
         UwmQRoiedZefPoVaHBtoKRy1f47B/pn/5GvBXiqe8L0md/a7DGnhJ3L1RJDAkJNWGOD5
         rQ+6tvXinSgTL5DVERbuPdeISHIeSLRIddjxc0na9WNNyrOs+CXjz6ZisMmDakUBQIdg
         WHB4W+brVGb1Fqqx1lZYXrWTyAhF5SPLP3WvkTa2IVVdVgNlDHTwW3ygDd48PVCXrSKs
         zqOw==
X-Gm-Message-State: AOAM531snWH9DYsGGeDB1dZrmESR2D89jLEjzvN33vBvtP/T+6BYbBfl
        nOGarbqARgb7wryVNo5oQg==
X-Google-Smtp-Source: ABdhPJwa/MJznhmRcGcjWOgAZbEZa6yOwQv7k06wvfAOPLk4hqYxA5oYyJHesaXDPyJ+9+6d0SNL5Q==
X-Received: by 2002:a05:6830:214c:: with SMTP id r12mr13953591otd.208.1608595778499;
        Mon, 21 Dec 2020 16:09:38 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id r15sm3884964oie.33.2020.12.21.16.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 16:09:37 -0800 (PST)
Received: (nullmailer pid 891719 invoked by uid 1000);
        Tue, 22 Dec 2020 00:09:34 -0000
Date:   Mon, 21 Dec 2020 17:09:34 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-media@vger.kernel.org,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        linux-clk@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kevin Hilman <khilman@kernel.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 05/48] media: dt: bindings: tegra-vde: Document OPP
 and power domain properties
Message-ID: <20201222000934.GA891659@robh.at.kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-6-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 17 Dec 2020 21:05:55 +0300, Dmitry Osipenko wrote:
> Document new DVFS OPP table and power domain properties of the video
> decoder engine.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/media/nvidia,tegra-vde.txt   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
