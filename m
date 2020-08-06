Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C026923DCF3
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 18:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbgHFQ6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 12:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728975AbgHFQkm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:40:42 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D5DC00216C;
        Thu,  6 Aug 2020 09:10:56 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id k13so26439147lfo.0;
        Thu, 06 Aug 2020 09:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CARAOasIFak870VufiBClJ7GzwKqbGWjQPwUf4dCREk=;
        b=OmngnfVzaAJ9jJNJdEi4kf1hA9P2f7ak2OMok4/yWOq+hkeBgCSKcgzjtw27fGmOWn
         3Zr8eTtteML9DsrP8N8PGLMwnxXtz2X5uWtxhQ1b1Hp0lQ3K227+u3B9Y44NmKqsDiAI
         PoGdUJrtbj5F5PHsAbCQ/Xlg8BGF/H+5Ji8upNSdPxqYHp69l0/gw5+WAhPBzdU851Y4
         OZngM7HgmAS0C6TzfrcDz3JJ+k9LNjkmAOqZ2kkNckw+xhrNxNuoyiHIk+KPqIxMpngc
         uoTKka3sq9RAXGa3rl6n/LiXS1X1o1Bw47L3qLOompZl1KYCytoql8VhP2iFa6gGlKSe
         pKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CARAOasIFak870VufiBClJ7GzwKqbGWjQPwUf4dCREk=;
        b=Rvn61SHyDSvs5LrCpe/XgfFQ3dEjZFqOttgbjSenDllbn2EbA24HCi3tXS7LHFkVKA
         IpNwRX6sTVVqW8fo81W5muMITeogvfY0ca/Df1fKrGqLn/YfoZ/nO9rwQjg8HCZjVXQr
         7MfdpUJhrbxXn1RasPv6VsbrGWNvv+xMVa66s0LlUvjzTACWpm7c3mh9aXwXWFxpz2qZ
         RV8PG2IZTNTLsYsWprVkEF6wuQvLFqWXfQ84V+5PlbSQqHjT6vY90FMfMncdXPIUm6Lh
         MyLqyxOW5AOy1NID9a6YJPT6QF3gYDdjKCpCy3/IdKrE6BdVeGH7yC6enWUOOleI9N8K
         dmiw==
X-Gm-Message-State: AOAM531GHmPIi40RDNQY+rUuoncj4bLLlHiwcWnqj8qg9a7DDmSsDT27
        cEkOGxyyRw89HhhZF1KPf5Js9ujy
X-Google-Smtp-Source: ABdhPJzuFA0l+OQL4YSNgzVA9hLB2nNjiEMtvYCJAZAFfYBW6wFxaQDOT3HDYMkQDm5DZYd2Vh+F6Q==
X-Received: by 2002:ac2:5ec8:: with SMTP id d8mr4213855lfq.169.1596730253375;
        Thu, 06 Aug 2020 09:10:53 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id y1sm3096536lfb.45.2020.08.06.09.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 09:10:52 -0700 (PDT)
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
 <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
 <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
 <ed80bf2f-213f-286a-59b2-fc85e4181b3d@gmail.com>
 <6eede805-80fd-016f-22f8-b6d25f6587af@nvidia.com>
 <1c12e40e-de7f-0599-a941-82760b4c7668@gmail.com>
 <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
 <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
 <0e78c5ca-c529-1e98-891d-30351c9aae81@gmail.com>
 <b2098a68-d02f-b406-fc57-56e3ff5d8d1a@nvidia.com>
 <309e3b66-9288-91ef-71b4-be73eacbbd62@nvidia.com>
 <fde2431a-0585-ac32-ac25-73e198aaa948@nvidia.com>
 <4025a458-fa78-924d-c84f-166f82df0f8e@gmail.com>
 <4f15d655-3d62-cf9f-82da-eae379d60fa6@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b5612e93-f1c4-4762-baa1-5d85eb1edbe1@gmail.com>
Date:   Thu, 6 Aug 2020 19:10:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4f15d655-3d62-cf9f-82da-eae379d60fa6@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.08.2020 18:59, Sowjanya Komatineni пишет:
...
>>> Confirmed from HW designer, calibration FSM to finish takes worst case
>>> 72uS so by the time it gets to sensor stream it will be done its
>>> sequence and will be waiting for DONE bit.
>>>
>>> So disabling MIPI CAL clock on sensor stream fails is safe.
>>
>> 72us is quite a lot of time, what will happen if LP-11 happens before
>> FSM finished calibration?
>>
>> Maybe the finish_calibration() needs to split into two parts:
>>
>>   1. wait for CAL_STATUS_ACTIVE before enabling sensor
>>   2. wait for CAL_STATUS_DONE after enabling sensor
> 
> I don't think we need to split for active and done. Active will be 1 as
> long as other pads are in calibration as well.
> 
> We cant use active status check for specific pads under calibration.
> This is common bit for all pads.

Does hardware have a single FSM block shared by all pads or there is FSM
per group of pads?

> Unfortunately HW don't have separate status indicating when sequence is
> done to indicate its waiting for LP11.
> 
> 
> To avoid all this, will remove cancel_calibration() totally and use same
> finish calibration even in case of stream failure then.
> 

What about to add 72us delay to the end of start_calibration() in order
to ensure that FSM is finished before LP-11?
