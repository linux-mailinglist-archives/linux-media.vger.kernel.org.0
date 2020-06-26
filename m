Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53B420A9CC
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 02:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgFZAR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 20:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgFZAR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 20:17:26 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9878C08C5C1;
        Thu, 25 Jun 2020 17:17:25 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id t9so4197351lfl.5;
        Thu, 25 Jun 2020 17:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KK6PtY8pcNXP5gzO5UgZaFW1H+cyyPPgMqvwAKW3sW8=;
        b=DLDmezHNEgW1lPl4CVB6KIX1vPcwpTxUVTM8PWvkbEDV0UunB4q9ZHgWkv6bmRxAcm
         qs+Dk3PuIFz6zX2IiC8la9qDO4rTowUU0wkMmpzK7fT6DDeFat8Dqy/iRRWQp9kaS1gp
         SBpyRgRS3iGiKaey6Ta77m/LqxIasW/jX3GMPH2j2rlnMNJr7ddz7x/tFGy1lwzuosS/
         uxKXrpZ08sjUkCy++4BCOflkY8gJPzX8GWXhw/vtE+WYT1lG81ojrQal5p6EdwO2iHOt
         NCGHd8US2Ki/CkqgYPAJicC8HMkbeBW9gJjvh3xQEAqab5WwxBDDcEnK2r69ErVcf+vS
         odXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KK6PtY8pcNXP5gzO5UgZaFW1H+cyyPPgMqvwAKW3sW8=;
        b=FKlwexVxD16QHlVVkqkXo7P2X19kIfR06B+ZCz3jOVyw2pvHgK4GW8OiC7c+s0/HKL
         UDOhhoUNMKcb22szBtCysEWxHT44nW1oMzjDK5LbxvRUE4lRWmoVh/8SVogWcXABGXUU
         6Y75V82EG/B9boUmEAW1PV6278AIJQEJVHpif3i7krHMtWLX9NgIHNQLc6/V/+naDGbc
         wL/Sb2JBkTGZSeFxmAXdatvPKWHynYrPFKLVR16FsDU8T+WwwBCjfK3uRI5cUXV1J8rk
         WZTvSN9ziijQNX3R88QiGChXebxHH77Y4f6YlEl449cVtzeSLEvUIeXPi4u5Ud5SjbGz
         NvIw==
X-Gm-Message-State: AOAM533q5FW7OTSHLQbxCs9G80yWEbjm9jHQQ75G0Ll8JHFbjgLqrfO/
        gDUtLrRoVUyU/SyztW6eXAvKO8HDkkA=
X-Google-Smtp-Source: ABdhPJzauRiZb4C+F6R6DOWxZgKYoDplYwoRTe7M+AlkO2GC5Qkor2GNAAJoT96EMiuI02kB1VpN3g==
X-Received: by 2002:a19:911:: with SMTP id 17mr319525lfj.80.1593130643810;
        Thu, 25 Jun 2020 17:17:23 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id y25sm1177397ljc.29.2020.06.25.17.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 17:17:22 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] Tegra Video Decoder driver power management
 corrections
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20200624150847.22672-1-digetx@gmail.com>
 <90323aa6-38b5-0a45-69a7-ccf380690a78@xs4all.nl>
 <23cbaa18-9461-8f72-3d43-aa14cd0c1095@gmail.com>
Message-ID: <0e14df05-8299-52d6-df8f-0dd476f4109d@gmail.com>
Date:   Fri, 26 Jun 2020 03:17:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <23cbaa18-9461-8f72-3d43-aa14cd0c1095@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.06.2020 18:23, Dmitry Osipenko пишет:
> 24.06.2020 18:16, Hans Verkuil пишет:
>> On 24/06/2020 17:08, Dmitry Osipenko wrote:
>>> Hello,
>>>
>>> This small series addresses a Runtime PM issue that was discovered during
>>> of Tegra VI driver reviewing by balancing RPM usage count on RPM resume
>>> failure. Secondly it fixes reboot on some Tegra devices due to bootloader
>>> expecting VDE power partition to be ON at the boot time, which wasn't
>>> happening in case of a warm re-booting (i.e. by PMC resetting).
>>
>> Can you rebase this on top of the media_tree master branch? I think a variant
>> of patch 1 has already been applied. I found a mail today where you mentioned
>> that you preferred your version (it looks like I missed that) so you'll need to
>> rework patch 1.
> 
> Hello Hans,
> 
> I'll take a look at what patches has been applied, my bad for sending
> the v2 too late. Thank you for the heads up!
> 

I tested the already-applied variant of the patch 1 and it has the same
behaviour as my variant, so it's okay.

Would you want me to send a v3 without the conflicting patch 1 or you
could apply the patches 2-4 from this series?
