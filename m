Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456A42E24D2
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 07:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgLXG3L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Dec 2020 01:29:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbgLXG3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Dec 2020 01:29:11 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AFEC061282
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 22:28:30 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id 4so853761plk.5
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 22:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=EjusjKqe1uD5qVIhtNFzzFr/40x6TzvZ/Sd3W/PBS+U=;
        b=fkgyFFom2uaI6UYerCixgJyMGXGGZzyzPl2pC34SDHHWr//SHmo19YSii8QHZaSaa0
         uZC2skGBke5PtP9vslEZombfKjKIAYRw9D3l2M5uGrJ+VkC9bDxNBcQDONWQUC2dmGxG
         6UJpFpuY87irp1H90rXExkNF0g2y+4HLV3Ep3/gdgJBqsszg3FbKmgil0GqbQ6dTgEnh
         DrDRzMipJyOMadGCFG5+H9D0UVs6y0l4FAVZ+I0/J5ZdR5hXHDE2454h+0iAD/EAVgA3
         IDDlN9SUV6QyhslIyk38zgEDS9uC1vEdXUB6uhGhlyh9+PUCifXrT875haF9d9ipr3qB
         NnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=EjusjKqe1uD5qVIhtNFzzFr/40x6TzvZ/Sd3W/PBS+U=;
        b=sFQZrjrQQtQpB6+tN53l/jJtnP+3b+Y/ZYV7OIRo7inMz4g9ke6tETONA+kLzMz3et
         Q7+Sxlz8rBRsZVzsJBd+kXSuzOK/XwF1q/HSFRF6k9KHAdfbdQNb4677tmDKCwVW2p35
         e+egpk8tE83g/fX9Zgpnzc7FvH5e00mVoSZXhU9LmMRCnRyr1E7WPbpB1q7jBienAvZZ
         pPhG5rgX5XAi7hK0w4dBDL+rWjAFHJOeyG65NNNxx9CC2nsZm3pwz+aZ5IPwGULTeeHR
         wdgTN5cQpvvO1STNXo9UvME8eMh441cjGBeRBvlkXtg+TanfBWhqWQ3oiTefUIJXvsf0
         pWEg==
X-Gm-Message-State: AOAM533yhSSLcupWmjSelzSqYKvNtvILr6LsIrDM6iKj4cU33dv7XtFO
        V/URZ1AfdRaKZIxPqjck/TyGjQ==
X-Google-Smtp-Source: ABdhPJwZjLbo7aGBJ7sNLaIhWcs4xnkHkI7BDfYQrcbWA55ODln8fkpMZgsIP8pDydfAZ37ygqOZVA==
X-Received: by 2002:a17:90a:380c:: with SMTP id w12mr2982286pjb.117.1608791310121;
        Wed, 23 Dec 2020 22:28:30 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id t18sm25653088pfl.138.2020.12.23.22.28.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Dec 2020 22:28:29 -0800 (PST)
Date:   Thu, 24 Dec 2020 11:58:27 +0530
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
Subject: Re: [PATCH v2 19/48] opp: Fix adding OPP entries in a wrong order if
 rate is unavailable
Message-ID: <20201224062826.frppxddfinjomfui@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-20-digetx@gmail.com>
 <20201222091255.wentz5hyt726qezg@vireshk-i7>
 <db6273e6-8406-b7ae-b51d-48ceb6d21962@gmail.com>
 <20201223043443.rklw5er6hck3gl4y@vireshk-i7>
 <7688d6b9-52a2-d30f-123f-43c01e03b968@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7688d6b9-52a2-d30f-123f-43c01e03b968@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23-12-20, 23:36, Dmitry Osipenko wrote:
> 23.12.2020 07:34, Viresh Kumar пишет:
> > On 22-12-20, 22:19, Dmitry Osipenko wrote:
> >> 22.12.2020 12:12, Viresh Kumar пишет:
> >>> rate will be 0 for both the OPPs here if rate_not_available is true and so this
> >>> change shouldn't be required.
> >>
> >> The rate_not_available is negated in the condition. This change is
> >> required because both rates are 0 and then we should proceed to the
> >> levels comparison.
> > 
> > Won't that happen without this patch ?
> 
> No

This is how the code looks like currently:

int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2)
{
	if (opp1->rate != opp2->rate)
		return opp1->rate < opp2->rate ? -1 : 1;
	if (opp1->bandwidth && opp2->bandwidth &&
	    opp1->bandwidth[0].peak != opp2->bandwidth[0].peak)
		return opp1->bandwidth[0].peak < opp2->bandwidth[0].peak ? -1 : 1;
	if (opp1->level != opp2->level)
		return opp1->level < opp2->level ? -1 : 1;
	return 0;
}

Lets consider the case you are focussing on, where rate is 0 for both the OPPs,
bandwidth isn't there and we want to run the level comparison here.

Since both the rates are 0, (opp1->rate != opp2->rate) will fail and so we will
move to bandwidth check which will fail too. And so we will get to the level
comparison.

What am I missing here ? I am sure there is something for sure as you won't have
missed this..

-- 
viresh
