Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE341A17C3
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 00:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgDGWId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 18:08:33 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34149 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgDGWId (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 18:08:33 -0400
Received: by mail-lj1-f194.google.com with SMTP id p10so5513492ljn.1;
        Tue, 07 Apr 2020 15:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+YQ6O1FoLb/MfQceNzDIXhdipEgwi9Vc6NSir8tVQ+0=;
        b=b5fGARpqiUJ7tcTmKi17zh32/umwOMmRpj5E7VyMWiIibjaXst8RmX8O8P35JUyxoB
         6Srx0qIWoyb0R3sr5KBfDQoEnvEurTVoixuY6pKVzK6V0nZZaH1WLBHJCgODTyUnqSxc
         X49o7q+1BAjWXdEHWcb5RBPbkGePf3ZQCcrHIE5gVg8G7dqkVWkgDJtyVY50t+6i1vz7
         9+Y6CsV3Op9HNxdA7AJcEIcqI4bhlCtefpVpxwuzjXqdpTabAAI1bMAa9VEIUEEBphEf
         Lr2sVn/gXiqQ8aZkkz6iklP4IDWSm7n0ZR9cfBzhbt+REFpmTKEw0cGFkseFcBPWz3N5
         wEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+YQ6O1FoLb/MfQceNzDIXhdipEgwi9Vc6NSir8tVQ+0=;
        b=Dp4ULi8Tx2TD3pOwYxK0SYA7e6/9aZK+GIh+WMGENsGl5IK8dOoRu/njwm/jGNfAYe
         2wwi+rk5fzARxszGXJ89KPXhe/Sosf/lZ++TPa2/9tXIPA1HPM/IywlrEbkU2fVsQfQw
         etV1bdtw+FyG5hf36IGdiDpVYHw3MyWlJ5DPuHog02H4XnFY8KDD6AbkMtAlDaM4vLDl
         iqDtCQTe4wGUsdqN17Kffqw0w/EBrKPtb7zTWiMK9ozOCyG9iNegr3B7xs1B2PsRRxon
         J55CeNOegIBQS8C4Gyw2qgzaFWAzJQrpwsZTacWsTpS7wZKIwWvMcPvFhlxxrRVRelcF
         lkqQ==
X-Gm-Message-State: AGi0Pub9aw+NbXq8RFYDMteL6jfWohVs82XHxfTmvN+4inkEsl3q9DEM
        42+hYCf3oX/SWVjlpc+VHPWQE2sZ
X-Google-Smtp-Source: APiQypIPFyOuiHqydgiWr6R4XGLm/DccgJs0gnd5vqagCP8wITfmTfFr2KFObqdKFiD8qLk0TEs8AA==
X-Received: by 2002:a2e:7d09:: with SMTP id y9mr2964718ljc.146.1586297309354;
        Tue, 07 Apr 2020 15:08:29 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id r23sm3140311lfi.33.2020.04.07.15.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 15:08:28 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
 <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
 <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
 <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
 <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
 <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
 <b1726d33-0d35-9323-a747-407148d0104e@gmail.com>
 <eb80178f-30f4-8f46-51cd-ea3f4914b81d@nvidia.com>
 <dd16c560-ba8f-e7df-5dc4-5227e0043196@nvidia.com>
 <fea4f0a1-4a20-34d4-9eda-e4a599eeeffc@nvidia.com>
 <760d071e-0cbc-b3eb-9231-fb9f9ecb44a6@nvidia.com>
 <9e317f65-8a02-3b15-cfec-8e0d8374130e@gmail.com>
 <97b35910-4c93-123a-43a0-eb14476ed0f3@nvidia.com>
 <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
Date:   Wed, 8 Apr 2020 01:08:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

08.04.2020 00:08, Sowjanya Komatineni пишет:
...
>>> I think you need a semaphore with resource count = 2.
>> we hold on to issuing capture if more than 2 buffers are queued and it
>> continues only after fifo has min 1 slot empty
> 
> 
> Just want to close on this part of feedback. Hope above explanation is
> clear regarding triggering/issuing at max 2 frame capture to VI HW and
> also regarding capture threads where they use wait_event_interruptible
> to prevent blocking waiting for buffers to be available for captures.
> 
> So no changes related to this part are needed in v7.
From what I see in the code, you "hold on" by making kthread to spin in
a busy-loop while caps_inflight >= SYNCPT_FIFO_DEPTH. So some change
should be needed to prevent this.

The wait_event_interruptible seems should be okay.
