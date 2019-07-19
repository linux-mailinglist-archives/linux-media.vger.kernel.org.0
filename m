Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 880656E154
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2019 09:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbfGSHCU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jul 2019 03:02:20 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42683 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbfGSHCU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jul 2019 03:02:20 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so13745983pff.9
        for <linux-media@vger.kernel.org>; Fri, 19 Jul 2019 00:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=KtGfxMvpEldrgQj9ma7A+9ulqI+LPdWDrlkqFw7DP3Y=;
        b=H3LlCQmC5y0pJI3k/kvaomLvI7DCcVu1LuZ+uqQaDhJi1jp5Dc4O1/hCKu/aYvymvI
         cLegq9VyqW2a/UHTSqnCHamptiALJLc+fjqLKAJ4Y2Trsr113H78ThSLLOuYazi2ihIz
         wDIka56WIfft0exGESh5gviE2TNrIQwYXR05J1tO1rCCLEdKiB3xprXLofNoESEjrtjf
         znS+ubN2DDB4/b1iSkwA8R2AkkX9ecaliTf93Bq1hv61bugz+vkvJamvNpMfdgH/8/6s
         Nc1VHto24+p/QsDf/SaFevx01syMLePClmM3GpxyzF/B2xQSb3Gal3E5prmrkIaemTIE
         7+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KtGfxMvpEldrgQj9ma7A+9ulqI+LPdWDrlkqFw7DP3Y=;
        b=G+YJJxEAR1udA4/1LxLscvmJ7qdfkLm8xPOIKs68XN+GHbo2igveEZKDoixKzp1PGk
         05KDkvQNkt61Yrxwoi+yn7BpruuYA4uK0Hfc4gipJihOYuXZadcA+boyyQmecAfaFTc5
         lS1TMqBXbj3Jj6mLDGYWEvQDxeHaOhxClesbIzd7NO/rcPZIAUpVJTM7FmJYnTGDRCqP
         44FiSxBVR8KJqxdUyG7MM8WPU2Grf3/KmIhoNqkgu8mjF18Rkn7IGkQKzImwwbmbCWdc
         wjk7hP4CFzfOS6y4V5rYYsRDX23SilvyCmd4SWWxLZKFyLJZAK8DXGvk+Y4Ge4balFDU
         MXvQ==
X-Gm-Message-State: APjAAAUS/jiZKzMxz6GHFbwkxoUgtNp125tjRqVSRT0VpVP1qSw0AKeY
        HqMjUmTIF/Him4KmQMQtw7sVO/n3
X-Google-Smtp-Source: APXvYqywUb39/1RPRGcCcqZCFcnMUOb/hkbgYaWTZJM5xyNtISoeL7jWkdC6EIiE5FiKaHrtF1dIww==
X-Received: by 2002:a63:ff20:: with SMTP id k32mr52558808pgi.445.1563519739148;
        Fri, 19 Jul 2019 00:02:19 -0700 (PDT)
Received: from [192.168.1.10] ([117.248.75.47])
        by smtp.gmail.com with ESMTPSA id b16sm44757290pfo.54.2019.07.19.00.02.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 00:02:18 -0700 (PDT)
Subject: Re: [PATCH] media:dvb-frontends:Return if Max devices are added in
 dvb_pll_attach().
To:     Akihiro TSUKADA <tskd08@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20190717141204.19433-1-bnvandana@gmail.com>
 <f8d9af33-d7d8-22d1-428f-b7b7c1d84062@gmail.com>
 <1c150bc5-0b15-23bf-2170-758c9cc046e3@gmail.com>
 <2912b5af-ae8f-e6c9-0e74-8790f5762997@gmail.com>
From:   Vandana BN <bnvandana@gmail.com>
Message-ID: <0cfa5617-7517-fc7c-0630-46cf854bf8d2@gmail.com>
Date:   Fri, 19 Jul 2019 12:32:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2912b5af-ae8f-e6c9-0e74-8790f5762997@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 19/07/19 7:11 AM, Akihiro TSUKADA wrote:
>> Will it be better, if dvb_pll_devcount is decremented in dvb_pll_release(),  instead of removing module params?
> But you cannot know deterministically which device corrensponds to
> what "id" (when you have multiple dvb_pll devices),
> since "id" is dependent on the history of register and unregister
> of dvb_pll devices.
dvb_pll_release() frees  fe->tuner_priv, and priv->nr is dvb_pll_devcount, but, decrementing  count will only tell array has a free slot, and now if that free slot needs to be used it will have to either maintain free index list to be consumed next or convert array id to a list.
> So I wonder about the benefit / practical usecase of "id" parameter.

Ok, I will remove the module parameters and send a patch.

Thanks,

Vandana.

>
> --
> Akihiro
