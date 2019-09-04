Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1EB1A79A4
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 06:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbfIDEWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 00:22:08 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38717 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbfIDEWH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 00:22:07 -0400
Received: by mail-pf1-f195.google.com with SMTP id h195so5827270pfe.5
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2019 21:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mp9OFto0GZk4OjRyXFJjH2s7yGAsAoKG/MS1RCQlOQQ=;
        b=WTaHHGrvlniplupbKSJNlsKOyzptXQwVRIDf/qjEm017VJXU41Gqqe7UGNTMvw+xr1
         X/Exx7zSW6qtWV0hqB/b1rm6eB8sFQZF3IEyfn4muy2wof4P7S9FI4Ih2W+phAM/mB6v
         MH0YehfS5rswTZLZ5xuvJWwKp3LhQyQci8S6k0ayZhWecsjSeTTGyImkQ8hKFty96iAv
         XqIF2NlBPKrvRq4n2tvwHudYolOwY3909VFrEpPhf4MO0gDSYIbyABo1OrcRUEisCNY+
         Y04TNkzvmezmQ08TLjm54UkOF6PngEAWlWs/gFJAjfXrpUS/OKhkbgDaibCdA7illKDe
         0s0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mp9OFto0GZk4OjRyXFJjH2s7yGAsAoKG/MS1RCQlOQQ=;
        b=QqrSq/xnRKP9/WJt+anFRTuYrVbSXOiqg42cmcIeRPyxbt9Vql7GR0O0HSIZQNdQ/J
         Gt6sVey8rq7cD2uh/YzFmfsiEAd/XcShCubY8Cv7SmQ3i2Pey9GQzwhVAPRYefO90rMe
         orM2EH7ZNF84OxDl/UPbIK6PfKXI+TAEhxnoI4hKAJuDhxJvG/DW7EHUe69BGPRewfFA
         q/fbIHcJUgWBOVwE7BWtZOg1UOGOcsBPIXDZVTUktF/IyJQwLep1BHYFLoExScBgWOhV
         YZ4aXSTK5vBBtNH6GVEB0CnybKUSd2awOlXWrov9cwxVunkDbt2j9s2uml0sp3huZ3FI
         aeKQ==
X-Gm-Message-State: APjAAAVZo9jlHY72fMfuwzTMqR5MzSCP1tO4W1AvWqtlolzF9MGyZ94L
        0ULRZ2rKiLY/TwZB6UBZln7Ulw==
X-Google-Smtp-Source: APXvYqy5gQpkWB1S0s/wrl3Q+cVrKMEMuWNE1UjfGFaNKX5PQ/qnJ8QVZhQCfwLSEncF+vh+M6lJhA==
X-Received: by 2002:aa7:8a98:: with SMTP id a24mr40799576pfc.101.1567570927082;
        Tue, 03 Sep 2019 21:22:07 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j7sm10505053pfi.96.2019.09.03.21.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 21:22:06 -0700 (PDT)
Date:   Tue, 3 Sep 2019 21:22:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Aniket Masule <amasule@codeaurora.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Subject: Re: [PATCH 1/2] venus: use on-chip interconnect API
Message-ID: <20190904042203.GC3081@tuxbook-pro>
References: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
 <20190814084701.25455-2-stanimir.varbanov@linaro.org>
 <cc85f55c-3d21-c3b2-6848-e48513263e39@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc85f55c-3d21-c3b2-6848-e48513263e39@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue 20 Aug 02:34 PDT 2019, Georgi Djakov wrote:

> Hi Stan,
> 
> On 8/14/19 11:47, Stanimir Varbanov wrote:
> > This aims to add a requests for bandwidth scaling depending
> > on the resolution and framerate (macroblocks per second). The
> > exact value ff the requested bandwidth is get from a
> 
> s/ff/of/
> 
> > pre-calculated tables for encoder and decoder.
> > 
> > Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > ---
> >  drivers/media/platform/qcom/venus/core.c    | 34 +++++++++++
> >  drivers/media/platform/qcom/venus/core.h    | 14 +++++
> >  drivers/media/platform/qcom/venus/helpers.c | 67 ++++++++++++++++++++-
> >  3 files changed, 114 insertions(+), 1 deletion(-)
> 
> It looks like venus can be built-in, so how about the case when venus is
> built-in and the interconnect provider is a module? Maybe add a dependency in
> Kconfig to depend on INTERCONNECT || !INTERCONNECT?
> 

I've been struggling down this road for remoteproc et al for a long
time, I strongly suggest that you make the INTERCONNECT config bool, to
ensure that we don't see this problem for every client.

The interconnect framework should hide the fact that the provider is
module.


But with this in place is there actually a dependency? Won't the include
file provide stubs in the case of !INTERCONNECT?

Regards,
Bjorn

> > 
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > index 0acc7576cc58..19cbe9d5d028 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -5,6 +5,7 @@
> >   */
> >  #include <linux/clk.h>
> >  #include <linux/init.h>
> > +#include <linux/interconnect.h>
> >  #include <linux/ioctl.h>
> >  #include <linux/list.h>
> >  #include <linux/module.h>
> > @@ -239,6 +240,14 @@ static int venus_probe(struct platform_device *pdev)
> >  	if (IS_ERR(core->base))
> >  		return PTR_ERR(core->base);
> >  
> > +	core->video_path = of_icc_get(dev, "video-mem");
> > +	if (IS_ERR(core->video_path))
> > +		return PTR_ERR(core->video_path);
> > +
> > +	core->cpucfg_path = of_icc_get(dev, "cpu-cfg");
> > +	if (IS_ERR(core->cpucfg_path))
> > +		return PTR_ERR(core->cpucfg_path);
> > +
> >  	core->irq = platform_get_irq(pdev, 0);
> >  	if (core->irq < 0)
> >  		return core->irq;
> > @@ -273,6 +282,10 @@ static int venus_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > +	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = hfi_create(core, &venus_core_ops);
> >  	if (ret)
> >  		return ret;
> > @@ -355,6 +368,9 @@ static int venus_remove(struct platform_device *pdev)
> >  	pm_runtime_put_sync(dev);
> >  	pm_runtime_disable(dev);
> >  
> > +	icc_put(core->video_path);
> > +	icc_put(core->cpucfg_path);
> > +
> 
> Do you have any plans to scale the bandwidth on suspend/resume too?
> 
> Thanks,
> Georgi
