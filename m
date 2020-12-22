Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8902E0791
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 09:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgLVI4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 03:56:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgLVI4j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 03:56:39 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6065AC0613D6
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 00:55:59 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id x126so8076993pfc.7
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 00:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vFzkf9KGKvhutZbig0u7i/t+IYvhk4nnFQKLcFcxsq4=;
        b=vAsAJop5QL87eRDzT5DTHMtwoNPt0CQSIkdTqkJeziTI1AZMtMAcIEm3Kl9fhnTk5V
         vB/lYkBRouI/12yFv6A1dCSOIC7zvTsWExhCNxYa4+Oefx74oga8DDnN983sE8WuR0Lw
         A/n6+TWPt+hiOGv4RVjVlrk029VE+mVsDRs23XZwxscocW8GlofyFgohPX99nF5S7Xwf
         uRZL+JFGs5YKyoIHowFMNinq/TGTNXJtfDFp0L89tHOseHc6j2SMhTv475d9VkLlcOL+
         Iu/sAsOo0E5YMGvGAyoXhWoXv1Ygp7453JTCPAWJO9u4w7D6CKSImKmQS5VN3jjIJN38
         c4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vFzkf9KGKvhutZbig0u7i/t+IYvhk4nnFQKLcFcxsq4=;
        b=YduyCn4YMaaoNYet46owk2oqqYMaLHSQ6suyJnhpvC8PFJrvoXEFl9V955Wi0v8kCh
         Fn1A7bIxVEHMms7rlVyH4wVnJtvMeH0pegzsAVRvWi7VtWyc+yPZwbGsdEbDfwSXFOTi
         DNINxsPMgHtLkvlNI6M0+gNo0kLdNYOgXHLKru9umkf4sHjYOJsGtNWjTO8hbJq3TBGh
         /zFCHPAqeVGFXOoq71nLW2llG83fuJAiylY8VwS7fbLXHUwinUpC9aKmSQoBZKSidcvW
         kml8skQLQTZpDkrvyr1MPKBdaCX4XNdPoiSOQywMXPNAYKhRn+jl5ioVBKBfIEpIs1Td
         PVvg==
X-Gm-Message-State: AOAM533sXTrITHnLtFuykRC0k5FB2Jou+g2ne6/q71gOnnXFxEPgByav
        goKnM62d99SoaTGz4+wp1AO3pQ==
X-Google-Smtp-Source: ABdhPJywc6LY9gPB8aIXdU8FTmnJRcbIf3Irdo/T2lGMg7jN2SK9J2SNLPjpJEYbiKAaBbTsluyTwA==
X-Received: by 2002:a63:6806:: with SMTP id d6mr18604366pgc.205.1608627358914;
        Tue, 22 Dec 2020 00:55:58 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id t7sm19377680pfe.179.2020.12.22.00.55.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 00:55:58 -0800 (PST)
Date:   Tue, 22 Dec 2020 14:25:56 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 13/48] opp: Add resource-managed versions of OPP API
 functions
Message-ID: <20201222085556.kce4dcwumk4u6ttm@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-14-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-14-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> Add resource-managed versions of OPP API functions. This removes a need
> from drivers to store and manage OPP table pointers.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c     | 173 +++++++++++++++++++++++++++++++++++++++++
>  drivers/opp/of.c       |  25 ++++++
>  include/linux/pm_opp.h |  51 ++++++++++++
>  3 files changed, 249 insertions(+)

Please send a patchset of its own for this patch, along with updates to all the
existing code that can make use of these.

-- 
viresh
