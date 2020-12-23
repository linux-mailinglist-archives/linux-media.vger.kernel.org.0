Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76A82E1827
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 05:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbgLWEf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 23:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbgLWEfz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 23:35:55 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E47C0611C5
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 20:34:50 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id s21so9644975pfu.13
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 20:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=n/wQ/8FF3ZQQmDW8wRJInIGGffY6h+3NeQmSLgJVsG0=;
        b=OFVqi0FZly+cr6h2L4MgV3W+0bqGCFrv37DumbpBBHHWKR10mlk8j96RhehvYC0ZKZ
         A7gveeGO4wUPNnptPGhKrlG+oY9ETV8EggwWNNJcSxmSKnIhp4D6iv6jEddwltALPRsH
         XoYuBifhBdhegWVRfh980lFbJW3ZCSqNzWxi8omP37WhPmGjiRZ+cWui/1OKijohx3Ni
         VZ3o0KDN4OIc1fPJ6UYDAexLzU558i9zpREZpptiCrCuZwWp74C+otCB7ziEAp6JpBCe
         /0WINPCLg0o7wHc+WB03uTQnpOkKqeEM2Jo/o42Mju6zYgkhMy6UlsZnrI4SeRLP+Rxr
         M+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=n/wQ/8FF3ZQQmDW8wRJInIGGffY6h+3NeQmSLgJVsG0=;
        b=Bu15DUmZ51oXqTl6xG4kGxOz6hb2pKofKQANJbL0YWxI+3Y6nkJV9VHOo8tcenzo4H
         x1nRlJHqCg6qVs4xCHDIOua3IiiPgGYhhCA01QH3ONUTqiNabrZwvr+CgDOG09jOvZNd
         rwhBe2HRdSMtB93SklVRHShNB3mhGDL194TQszYfhyDF+WUzCTSIfs5bEkxS3g0VfzaB
         I8HU2XiFJb26dqxOZkbMLNWFSnhOt98bV8uPMqsOuh8ZUjJlO6N5JLTxJyEJ+k0B/KVZ
         I/auYCzvHZulChzSoGk5IvX2aXbr8mAT+Ew2Wr6FoHzga9ALsJ9XX1uAuIZlvTXdybcl
         Hw9A==
X-Gm-Message-State: AOAM530YJGMIPC6gxPkxU76Xf0P0c38faPc+8nw9rrTpqm/+vLpxZEST
        kgdfgeHmu8ynn7PBLr50j0xtvQ==
X-Google-Smtp-Source: ABdhPJy/6iEXMfinC0IgZ7fpt7I2g+zIxTjZQnxLRTk8cjqPdAagKq6g9nUKUea3gO9B/DZE0Q9zrw==
X-Received: by 2002:a63:6305:: with SMTP id x5mr22354072pgb.216.1608698089700;
        Tue, 22 Dec 2020 20:34:49 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id p16sm21154516pju.47.2020.12.22.20.34.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 20:34:48 -0800 (PST)
Date:   Wed, 23 Dec 2020 10:04:43 +0530
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
Message-ID: <20201223043443.rklw5er6hck3gl4y@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-20-digetx@gmail.com>
 <20201222091255.wentz5hyt726qezg@vireshk-i7>
 <db6273e6-8406-b7ae-b51d-48ceb6d21962@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db6273e6-8406-b7ae-b51d-48ceb6d21962@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-12-20, 22:19, Dmitry Osipenko wrote:
> 22.12.2020 12:12, Viresh Kumar пишет:
> > On 17-12-20, 21:06, Dmitry Osipenko wrote:
> >> Fix adding OPP entries in a wrong (opposite) order if OPP rate is
> >> unavailable. The OPP comparison is erroneously skipped if OPP rate is
> >> missing, thus OPPs are left unsorted.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/opp/core.c | 23 ++++++++++++-----------
> >>  drivers/opp/opp.h  |  2 +-
> >>  2 files changed, 13 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> >> index 34f7e530d941..5c7f130a8de2 100644
> >> --- a/drivers/opp/core.c
> >> +++ b/drivers/opp/core.c
> >> @@ -1531,9 +1531,10 @@ static bool _opp_supported_by_regulators(struct dev_pm_opp *opp,
> >>  	return true;
> >>  }
> >>  
> >> -int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2)
> >> +int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2,
> >> +		     bool rate_not_available)
> >>  {
> >> -	if (opp1->rate != opp2->rate)
> >> +	if (!rate_not_available && opp1->rate != opp2->rate)
> > 
> > rate will be 0 for both the OPPs here if rate_not_available is true and so this
> > change shouldn't be required.
> 
> The rate_not_available is negated in the condition. This change is
> required because both rates are 0 and then we should proceed to the
> levels comparison.

Won't that happen without this patch ?

> I guess it's not clear by looking at this patch, please see a full
> version of the function:
> 
> int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2,
>          bool rate_not_available)
> {
>   if (!rate_not_available && opp1->rate != opp2->rate)
>     return opp1->rate < opp2->rate ? -1 : 1;
>   if (opp1->bandwidth && opp2->bandwidth &&
>       opp1->bandwidth[0].peak != opp2->bandwidth[0].peak)
>     return opp1->bandwidth[0].peak < opp2->bandwidth[0].peak ? -1 : 1;
>   if (opp1->level != opp2->level)
>     return opp1->level < opp2->level ? -1 : 1;
>   return 0;
> }
> 
> Perhaps we could check whether opp1->rate=0, like it's done for the
> opp1->bandwidth. I'll consider this variant for v3, thanks.

-- 
viresh
