Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D502E18AA
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 06:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgLWF6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 00:58:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726361AbgLWF57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 00:57:59 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40598C0613D6
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 21:57:19 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id j13so2609158pjz.3
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 21:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lJW5Pmu0e9Bh/oQqoiiF+Gb9g3MgQRYVOM3hqkPUzNs=;
        b=W5YJc6EiiWk23cUCGsgoEZThjaHKBFlEG4O2cgRcXu+x5+1ODHw6d3bAyttpAh4Npy
         yhDhQA4+L+oz4wy8QflysfNhX4OfzqA0qNs/SHpKza5WXKgrPbKjAZqXsxt3M6+5uj5+
         VPzhmEJIKzlbozEEPWm1XL8KIXiyyOKO2HmVu9XxWuzA1/dlfxbwhMlk6o4r2lNa/tYB
         koUJs3PACOOeP10gRbtLplfNUPU/AAwjZHrgwyo0byxhHtSGWR9eYNFuLyVygLLz+QCX
         6yGQiSn1spMfKd1SRklgKWo8kYn0YWbHteDUGgx/252nlqC2vuCSM8Grhs1IDDtLRYP5
         ah0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=lJW5Pmu0e9Bh/oQqoiiF+Gb9g3MgQRYVOM3hqkPUzNs=;
        b=Afnm70r/9B6Oy9XgSrD6NfKV8x/DM4qTmB/Ohs+RlSQFmvQO8ac9A42So0+oU21G7r
         PgoKeVBYOdlOAUSMoaT+oS/RKki3twAzwnpZQhHMo7mLAXKdd2co9I43V1r6aL3wXZRG
         M/JmPwvkpFeXlOM4ELQDGMVYGyhX3ISX50ki0pB2k8I3t3yXR7SxPjT2en3zSP0tLWwH
         mCjBM57UgKITTP/4Xr78iTzp/ONhR3c1q/nMtS7SlNpZ165bise0LdCNRJ3DG4CmKDVK
         MVGG3S+3P4MGUlFyyWmY6nvSEZdaKIv9J/WzBWmBafiTY+n+r+LhCL3k6j7iEWiZvhlo
         kKUw==
X-Gm-Message-State: AOAM532CbWOPIMwa/2n7Xqd6IDYw4OXC9lfbeXAjAk0kHS+EIJ3RNl+v
        E29kKEqqA+FdmoTbRDb+GzDrJw==
X-Google-Smtp-Source: ABdhPJwsLgoGssujAxswnWOsu8NXhLnCPjFpMxnGOCgLNcgnd+pdiKB2jV1BoCNGdPUko3cGZpeLtQ==
X-Received: by 2002:a17:90a:cb84:: with SMTP id a4mr25789987pju.50.1608703038680;
        Tue, 22 Dec 2020 21:57:18 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id w7sm22839140pgr.48.2020.12.22.21.57.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 21:57:17 -0800 (PST)
Date:   Wed, 23 Dec 2020 11:27:15 +0530
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
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
Message-ID: <20201223055715.2n5eba7fohrwpgr5@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-29-digetx@gmail.com>
 <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
 <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
 <3a5c00e5-2cdd-35ce-2714-d4ffbf9d516a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a5c00e5-2cdd-35ce-2714-d4ffbf9d516a@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-12-20, 22:39, Dmitry Osipenko wrote:
> 22.12.2020 22:21, Dmitry Osipenko пишет:
> >>> +	if (IS_ERR(opp)) {
> >>> +		dev_err(&genpd->dev, "failed to find OPP for level %u: %pe\n",
> >>> +			level, opp);
> >>> +		return PTR_ERR(opp);
> >>> +	}
> >>> +
> >>> +	err = dev_pm_opp_set_voltage(&genpd->dev, opp);
> >> IIUC, you implemented this callback because you want to use the voltage triplet
> >> present in the OPP table ?
> >>
> >> And so you are setting the regulator ("power") later in this patch ?
> > yes
> > 
> >> I am not in favor of implementing this routine, as it just adds a wrapper above
> >> the regulator API. What you should be doing rather is get the regulator by
> >> yourself here (instead of depending on the OPP core). And then you can do
> >> dev_pm_opp_get_voltage() here and set the voltage yourself. You may want to
> >> implement a version supporting triplet here though for the same.
> >>
> >> And you won't require the sync version of the API as well then.
> >>
> > That's what I initially did for this driver. I don't mind to revert back
> > to the initial variant in v3, it appeared to me that it will be nicer
> > and cleaner to have OPP API managing everything here.
> 
> I forgot one important detail (why the initial variant wasn't good)..
> OPP entries that have unsupportable voltages should be filtered out and
> OPP core performs the filtering only if regulator is assigned to the OPP
> table.
> 
> If regulator is assigned to the OPP table, then we need to use OPP API
> for driving the regulator, hence that's why I added
> dev_pm_opp_sync_regulators() and dev_pm_opp_set_voltage().
> 
> Perhaps it should be possible to add dev_pm_opp_get_regulator() that

What's wrong with getting the regulator in the driver as well ? Apart from the
OPP core ?

> will return the OPP table regulator in order to allow driver to use the
> regulator directly. But I'm not sure whether this is a much better
> option than the opp_sync_regulators() and opp_set_voltage() APIs.

set_voltage() is still fine as there is some data that the OPP core has, but
sync_regulator() has nothing to do with OPP core.

And this may lead to more wrapper helpers in the OPP core, which I am afraid of.
And so even if it is not the best, I would like the OPP core to provide the data
and not get into this. Ofcourse there is an exception to this, opp_set_rate.

-- 
viresh
