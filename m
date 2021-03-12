Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A98433856E
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 06:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbhCLFdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 00:33:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbhCLFdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 00:33:15 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D19C061761
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 21:33:15 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id e2so6129985pld.9
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 21:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yn9um0RUV5qS6ZDS+XmJIEF5UruSaGYqcCAn+8nlwK0=;
        b=AsT0a31K/s61Ur3ZyBxZIWuCMUPx2OBLJZtWxZ9I7oct+ejDM6jX9oK7HtwlYiPt7T
         dQjLuYCZAG8rAuj79j6RFrwqsCBWIHl1zZxIxaGWyL3wXzAFxfvOrg1KVUKkCisdS34d
         5unwD/W+yvGr48R+MEJBx6+vSiF9GuC3bTT6PSiuioz6uxAswGWKYpDGRzTepzNoAdRP
         3zIxwnJJsHmQdX+JNQmt3cWaVTgrPnJuzFDEUWUoCjL87wnD0EeFgsqOudsTwbftnhUq
         yCyR5d02IREhzNavc0wn85MY5VtSWg6BNEHGcN1VNCOVrtgMOvXZX1TUN4TzPyMcy21z
         fhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yn9um0RUV5qS6ZDS+XmJIEF5UruSaGYqcCAn+8nlwK0=;
        b=Ik5lsm3zFuiDLaP+SVKMkxnA6iI/rhAdBjrEPvR6naHcfB4p67ivNzHdCheo0C4r1Q
         UpCVN4mlQ/8rZUSTC3NaF6re9lZdaaqyF4+oBOXMfFb3yxbdaHP7DU6jB0815+c0k4ew
         5ne2YisVvjScgFFRRvMUCW5+cj78GfC9pDRiKwm2obtNT+VmNnvqKdVRK4xfPB0SWXe9
         FO6wtmtq+iuTf6WWA026omtu/Eaf+vseD2f9wGQ14/jZ+UkO/n+rMpKl3wf4uPGaOyEQ
         7a75ffH2nNbz7OW5assWuxcLA/YViyAvllWPWg0qzxRun8zC32G5qWsZKVUKVFMPufFL
         1r+g==
X-Gm-Message-State: AOAM530i1HxbfUyb9VTzjdNBrI8fPqfi88T+p4PyAXyutTuAOEmz3LL+
        SsNgfvLLtTovOKugky3O8YQR5Q==
X-Google-Smtp-Source: ABdhPJyDxvuOHwV2kjRNLGoR8RcX493onMZPdYf0HajVty4Da/2VfFbEKgGgJtSunQpX+xy+QefzoQ==
X-Received: by 2002:a17:902:e78e:b029:e4:84c1:51ce with SMTP id cp14-20020a170902e78eb02900e484c151cemr11595726plb.25.1615527194476;
        Thu, 11 Mar 2021 21:33:14 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id z2sm4059367pfq.198.2021.03.11.21.33.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Mar 2021 21:33:13 -0800 (PST)
Date:   Fri, 12 Mar 2021 11:03:12 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
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
Subject: Re: [PATCH v2 01/14] opp: Add devres wrapper for
 dev_pm_opp_set_clkname
Message-ID: <20210312053312.zgke2mzjkqmwn67i@vireshk-i7>
References: <20210311192105.14998-1-digetx@gmail.com>
 <20210311192105.14998-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311192105.14998-2-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11-03-21, 22:20, Dmitry Osipenko wrote:
> +struct opp_table *devm_pm_opp_set_clkname(struct device *dev, const char *name)
> +{
> +	struct opp_table *opp_table;
> +	int err;
> +
> +	opp_table = dev_pm_opp_set_clkname(dev, name);
> +	if (IS_ERR(opp_table))
> +		return opp_table;
> +
> +	err = devm_add_action_or_reset(dev, devm_pm_opp_clkname_release, opp_table);
> +	if (err)
> +		opp_table = ERR_PTR(err);
> +
> +	return opp_table;
> +}

I wonder if we still need to return opp_table from here, or a simple
integer is fine.. The callers shouldn't be required to use the OPP
table directly anymore I believe and so better simplify the return
part of this and all other routines you are adding here..

If there is a user which needs the opp_table, let it use the regular
non-devm variant.

-- 
viresh
