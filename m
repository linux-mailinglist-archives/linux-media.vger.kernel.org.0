Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74D2F2E0634
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 07:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgLVGnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 01:43:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbgLVGng (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 01:43:36 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3BDC0617A6
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 22:42:56 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id n25so2260561pgb.0
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 22:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KcaYAZQ+AoDm9Jn9wokihL78HxRFsW+AhH8/h9c+1wA=;
        b=uR9O2EdLr4l+d+J8DstQgDPJiLPo1oLcBQPLe9jc2o++kue1dXZm05qdnvOIStsjzl
         LxGtFbuTHlEcESPdNBvcsJRRBnhcQ8k3qWJTtqEA9Vsn1CHhzGmqcZCHzFhyuPgQch7w
         ZkBOnZ/IbbjQIn9Vy+DguNDJMixeiercHvgjsHdWn/QJte3DEZIiQdkulmFdS91Y43F1
         vk9hBZZWmvz96CbVxWwTN4UuBDgRDzuMiUl3t0NwETYOL4uelpc2l16EUrg/gYEFZxFx
         bnyZzEsIobaE2fETZkKFj8q6rzCf48SfT+Z3B1NG0u7NFx+M3/vmtvFpKgR2lL4ATFSB
         92qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KcaYAZQ+AoDm9Jn9wokihL78HxRFsW+AhH8/h9c+1wA=;
        b=pKbGjT8Ffcw8QCR4q9zhpPtOQsV/H9Cgn3pMylttIE+u1RrQePGzXkeW0wdtfNNwle
         Lzb6BBE6bfWk7UTqnQ5HO7dobQb0Q3f34UphrHKS+BNbbNf5ZdThf+/xuknIU4EB2KCn
         R+uTrW0ax+rJ5Ki+DTvXCpW7Ig2grgoQ7FRPkRN0/TXzFEZmkf/GwAR7wQ5a7ZoN+vjX
         s0CLJa6OibEQ030cnexcZIP93WoyYiOpeWzaj9/8ChWL1bFu7YLbUc3qwHENJfBX1WcR
         sj/pvD4OHcf3L2+fXR88qKEnuktrNhx18AX/dcvWtN9XkyaIHnPC5hDOB3DG9411td2Y
         tZFQ==
X-Gm-Message-State: AOAM530lSfFFsooSFS8ESUelWNrlkAc2ADNsQ5iec+WvvAVrd4gSJBDg
        4Fb10bSs6tgIqrsLz39UAEeeBg==
X-Google-Smtp-Source: ABdhPJxBR/Z8Ma4PVg9ZbczgXmM2X91HSAXGveL8f8GmkDzgajqaFrdpkcD8mdHIemFfHzAJ0M1KFQ==
X-Received: by 2002:a62:61c5:0:b029:1a9:5a82:4227 with SMTP id v188-20020a6261c50000b02901a95a824227mr18914548pfb.61.1608619375827;
        Mon, 21 Dec 2020 22:42:55 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id 198sm18893827pfw.29.2020.12.21.22.42.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 22:42:55 -0800 (PST)
Date:   Tue, 22 Dec 2020 12:12:53 +0530
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
Subject: Re: [PATCH v2 11/48] opp: Add dev_pm_opp_find_level_ceil()
Message-ID: <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-12-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-12-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> Add a ceil version of the dev_pm_opp_find_level(). It's handy to have if
> levels don't start from 0 in OPP table and zero usually means a minimal
> level.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Why doesn't the exact version work for you here ?

-- 
viresh
