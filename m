Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1001B89B7
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 00:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgDYWIH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 18:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgDYWIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 18:08:06 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D44C09B04F;
        Sat, 25 Apr 2020 15:08:06 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id t11so10679918lfe.4;
        Sat, 25 Apr 2020 15:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=stKhy/h17mAoYghX4I6mRLwgtGhKJwi/X0wHAwKsRfA=;
        b=nkdAxr8G/h5QMxMQ9/0+z2TWsdx8OXFRV84cGL/0tawE+iOu7o/nCj4il4G4CQQWH2
         YxQQPBwb7kFRDeoF7664tHtQtx7LXr/YR9YEUcoezdCu+5wjkOPKCV5vdI2TU8SZw/JC
         Qt3QNALge3rxc3i+4l4vhGWNRhE9fRtFFXKBEz/k+TuQY80Oq1FSY8FeyS9FjFBigkgR
         DYoNYP0BytvKxuz30uvOSaaNRcfh7YB5gnK1ritRDzK7YKrljKO62bccDfdpv6/+dma8
         NYCZ/uyRbZ0tDxomDcTauOL/p0NlXLlbE1L116d24Syr5TNmuR+zgjGe48BgfIp18kyD
         qjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=stKhy/h17mAoYghX4I6mRLwgtGhKJwi/X0wHAwKsRfA=;
        b=SzdVkcG9UZrxaR6+1QTZ49pHfiGzLkOvq/bdC5FmcVQehp20PKTTXYdJeZfOv01iGn
         YoLLV4ZzgJ2FR/dQobgiXoi54r/qBXgU5QLH4EhzOfC7EzHOktnt0SgfvR0sTbv8duhm
         fjvG/Yb1cnyjQvVRiDOCsOeCf1zb+O7vNmufWYJjzK4SSjz0ja6d/6bvtk9Ic88GMoDO
         Pu0uJaeiT+r1zMuVOfLHZHN9dHR/5W88K3v45Gmxtgg+dLkkyPV8+jScwFJJ/RvNSwCQ
         NyXO17/1N3ZCSYqZtvkPNK4g6TmM53K/YWvk/H5RVzV2/CuQN5XmRw7J59shXjgk8ryk
         PPCQ==
X-Gm-Message-State: AGi0PuZMoRlMFE53W223D+n4zNicXvo4CfSydhY+OT2W4/BEcDndW1Yz
        VyAo+ZiBDaqJG9RF6b3PWVNjx8qV
X-Google-Smtp-Source: APiQypJBj4/s4vaQgtuniB+FW/ntlwSg1bwGWcRhW63q5PuexDleztxn7q3vyN2ftsUWnXOncpip9w==
X-Received: by 2002:ac2:52b9:: with SMTP id r25mr10877874lfm.156.1587852484346;
        Sat, 25 Apr 2020 15:08:04 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id k2sm6889535ljg.7.2020.04.25.15.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 15:08:03 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <3155e0d2-94b0-6e0a-bf35-b3560c201039@gmail.com>
 <fffc09d1-a25f-2d6e-83bd-f7657dd2ff16@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e5602c48-a73e-8e71-188d-6a53ebf8e4a4@gmail.com>
Date:   Sun, 26 Apr 2020 01:08:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fffc09d1-a25f-2d6e-83bd-f7657dd2ff16@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

25.04.2020 01:00, Sowjanya Komatineni пишет:
> 
> On 4/24/20 8:07 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 24.04.2020 06:55, Sowjanya Komatineni пишет:
>>
>> Is this driver compiled as a single kernel module file?
>>
>>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>>> +MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
>>> +MODULE_LICENSE("GPL v2");
>> ...
>>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>>> +MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
>>> +MODULE_LICENSE("GPL v2");
>> I don't think that these macros are needed in that case.
>> The video.c should be enough, isn't it?
> yes these can be removed

It will be nice to factor out the Tegra210-specific VI/CSI OPS into a
separate driver module (say tegra210-vi) to ease supporting of other
Tegra versions. Of course this could be done later on, although I
suppose the amount of hassle could be reduced if it's done from the start.
