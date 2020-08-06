Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98FF323E150
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 20:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbgHFSmh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 14:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727939AbgHFSUB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 14:20:01 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B82DC0617A2;
        Thu,  6 Aug 2020 11:18:39 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b30so26611445lfj.12;
        Thu, 06 Aug 2020 11:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zyDgQ58yfMwWuCC3duccdkOno3vWVcRNh6nKRXhidek=;
        b=MyRZbQfGm1TKcB+zBssqDMtxcidwjYO7hE4TlnATgTe0SqNa0BctoPeiVmFPhWxaxw
         9HgsPi+ytgS6C+dLS5cbg0t0zGUI60l7w7qf/X76752INI/nDLHSPBvwvEwIxHkg72yr
         t1fYK9Exm0UHawEzsVglsQvCFsKhh/WbzOc/0g23Wo7JMNB/zosNweCHyQ2LegAovw05
         WJ3fpKjmLSt7TgLgMRKQU3ArR+P/c9OM3aRMi98LMDd/HJX3vg5qP+/AzIuUBlYSNOkA
         oQyNWVqpRJlY7P35stTlbYDVn/6G4U4AAhKrSI/lKFSErmYn1AgtYwJ6iTmw+k9jSvsP
         9WdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zyDgQ58yfMwWuCC3duccdkOno3vWVcRNh6nKRXhidek=;
        b=FhyP0Nfzr24jUSUFQ8fqTltCvBNEe8LZsNSLvoewUNY6us5ZV+uc4+4yoFMEKQNjDB
         9GljJU84S5p+pAUZBWt5bJnl6TebTu+TgcRXHxhWPdVvJz/R6wtAvBRFwBk5J3IGWGy4
         T533yTqL5lkDKBneHhlMwgd0bndgCKkCHWEKNs5JOQSUqPR6/LJuGPsZmW+vMEi3HnDm
         RZwxmocv6A0sMC7sc8+VmDQLVlc+k2pMQ2+3Iz93vUWvoJOcdyoklMGBZxJRdizQ6vSn
         MoqA3zqBJja5TNDX1OkIPuw052LzSe8VEUx+y488bnJuMIekgleSIceyokd43z+xOvLJ
         +b3A==
X-Gm-Message-State: AOAM530qLF2xi/+NlrRlTq0Pd+RyCpcAKc0S3CbFxTui5x4WomIuD8WU
        VUvazRwHhNA1LM+T2k8PBu1D1lEA
X-Google-Smtp-Source: ABdhPJwsXrrzhKIHd4U+0mxTpUSDS+7zShPN2F0Yc4n/A8sv96yqeEPFnojDg1v3UbYpBfNORZD/4A==
X-Received: by 2002:ac2:5e2c:: with SMTP id o12mr4378022lfg.71.1596737916355;
        Thu, 06 Aug 2020 11:18:36 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id 1sm2751561ljr.6.2020.08.06.11.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:18:35 -0700 (PDT)
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
 <b5612e93-f1c4-4762-baa1-5d85eb1edbe1@gmail.com>
 <412f8c53-1aca-db31-99a1-a0ecb2081ca5@nvidia.com>
 <61275bd6-58e7-887f-aa7d-8e60895e7b2b@nvidia.com>
 <6ff57c38-9847-42b0-643b-0d167c13779f@gmail.com>
 <c6ef5e77-2b0a-1712-ca58-dbd8d232e1f1@nvidia.com>
 <ed79b201-85ba-f725-c5fa-fcde0761bc3d@nvidia.com>
 <26ed2841-db5d-aeb0-11c7-cbe2ddd1d76b@gmail.com>
 <eddfdaf0-818a-c4dd-e3b4-4d432af56982@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e965076a-dc31-5774-dd27-98c992331bd2@gmail.com>
Date:   Thu, 6 Aug 2020 21:18:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eddfdaf0-818a-c4dd-e3b4-4d432af56982@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.08.2020 21:07, Sowjanya Komatineni пишет:
> 
> On 8/6/20 11:01 AM, Dmitry Osipenko wrote:
>> 06.08.2020 20:52, Sowjanya Komatineni пишет:
>> ...
>>> Right mutex_unlock should happen at end of finish_calibration.
>>>
>>> With keeping mutex locked in start, we dont have to check for active to
>>> be 0 to issue start as mutex will keep it locked and other pads
>>> calibration can only go thru when current one is done.
>>>
>>> So instead of below sequence, its simpler to do this way?
>>>
>>> start_calibration()
>>>
>>> - mutex_lock
>>>
>>> - wait for 72uS after start
>>>
>>> finish_calibration()
>>>
>>> - keep check for ACTIVE = 0 and DONE = 1
>> I think only the DONE bits which correspond to the mipi_device->pads
>> bitmask should be awaited.
> 
> As next START can't be triggered when auto cal is ACTIVE, we should keep
> this in finish.
> 
> As we do mutex_unlock only at end of finish, other pads calibrations
> dont go thru till the one in process is finished.
> 
> So in this case ACTIVE applies to current selected pads that are under
> calibration.

Should be better to check only the relevant bits in order to catch bugs,
otherwise you may get a DONE status from the irrelevant pads.

>>> - mutex_unlock()
>> Perhaps the start_calibration() also needs to be changed to not touch
>> the MIPI_CAL_CONFIG bits of the unrelated pads?
> Driver already takes care of programming corresponding pads config only.

It writes 0 to the config of the unrelated pads, which probably isn't
nice if some pads use periodic auto-calibration.

https://elixir.bootlin.com/linux/v5.8/source/drivers/gpu/host1x/mipi.c#L350

Although looks like auto-calibration isn't supported by the current driver.
