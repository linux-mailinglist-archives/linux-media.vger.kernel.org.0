Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED04348C3F
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 10:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhCYJJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 05:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbhCYJJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 05:09:12 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EFC2C0613D7
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 02:09:12 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id r17so1186670pgi.0
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VWsn6esj8imf1uae7i0PYfEIqahCeH1CMSkS7p/mVYk=;
        b=HIBYhMJ3tP1aKPSwg0gUFOAmtXGabKSCvtt0vxq0cKr4wnvUWwGpH5l0/daMM0gb/q
         eIwN1cktfuMgY07XYtnR4aTFv6SgzyJlgqyBDscikKf+wOHVSMQVAuIXcbyikkFclA/K
         MuGM/06m6QL2fjldeVmJVaoJ/1ivyC1rsOIPx9oWGRx1XrxxHELz9ghFbUAAZcItYjAX
         62xPTBRZVJzPGGYRrt1LTVxDKe/NVKOQ3EyxKwXzDRmp9/8Q35XveLxwWjLE3b4jWTiY
         TguamkqvVDR4TQ+2YgOyTpHcp1WGhmTN0kndzst7ijFQqpPPyH+K2OR8r/0QkVhkChQD
         PfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VWsn6esj8imf1uae7i0PYfEIqahCeH1CMSkS7p/mVYk=;
        b=EP62uE0izIuRX17Ck/Ae7StHZlLMKBSrgjv5v51BsAxFGIgtSBElOG4zeZENmzIV2a
         XuVN/mNucc4xSi4UIScHFWrFsqmyG1Tr7fKL1ApEeTx4IUd53RVVMJ6OU2UsHWoSfj5A
         SGaSHdo0Ps/9bWjbwVr/eK0KnDDKqK/pYEElHL2KGrfKIUVod9mEfSAcoX3UB1YfdEUo
         6CvVyjXfDTjr0k/jeg8RzA9pnpQjopdcgGWv/LyS1MuPELIT9QlZz7ncXVZ51bgtf5af
         lRrwc9ZI7EsBPY3KDQJTrnHYx9gWRQ8UFpIJaO5eYl6qKJ+7YrhKW3YigQilRJLi3f5L
         aDvA==
X-Gm-Message-State: AOAM530wH9d7rt+oRQxsJvknMUGGQkYiNMCPJMNsandsdm8oY3FDHBzo
        P/ZiAuulljBpYEOQnLK6ISrfXQ==
X-Google-Smtp-Source: ABdhPJx75YaqoIXZKRzV6JNv+rXXkBOJ5fO88bVSyJdWvRiD9Mrig/3TUZdgxk+pZ1DK2jZHu6G8NA==
X-Received: by 2002:a63:e44a:: with SMTP id i10mr6546829pgk.404.1616663351651;
        Thu, 25 Mar 2021 02:09:11 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id s184sm5341831pgb.63.2021.03.25.02.09.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Mar 2021 02:09:10 -0700 (PDT)
Date:   Thu, 25 Mar 2021 14:39:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>, Qiang Yu <yuq825@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 14/15] media: venus: Convert to use resource-managed
 OPP API
Message-ID: <20210325090909.pyzyt3xds2ajvm7i@vireshk-i7>
References: <20210314163408.22292-1-digetx@gmail.com>
 <20210314163408.22292-15-digetx@gmail.com>
 <b780c19f-7f5d-5453-dec1-062fa7c1dc07@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b780c19f-7f5d-5453-dec1-062fa7c1dc07@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25-03-21, 10:13, Stanimir Varbanov wrote:
> Hi,
> 
> On 3/14/21 6:34 PM, Dmitry Osipenko wrote:
> > From: Yangtao Li <tiny.windzz@gmail.com>
> > 
> > Use resource-managed OPP API to simplify code.
> > 
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/media/platform/qcom/venus/core.h      |  1 -
> >  .../media/platform/qcom/venus/pm_helpers.c    | 35 +++++--------------
> >  2 files changed, 8 insertions(+), 28 deletions(-)
> 
> 
> I'll take this through media-tree once OPP API changes are merged.

Okay, dropped from my tree.

Thanks.

-- 
viresh
