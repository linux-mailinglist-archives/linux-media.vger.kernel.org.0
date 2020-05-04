Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF5D31C3F07
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 17:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgEDPxT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 11:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728873AbgEDPxT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 11:53:19 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6931C061A0E;
        Mon,  4 May 2020 08:53:18 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a21so10158480ljj.11;
        Mon, 04 May 2020 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Uaqoisb/ISvzu7HtxB7/o6dTkuqP/WZqu9coo5sj/rM=;
        b=oXvlHJUwcUAMcJO2folcLpAl4lu16ZdbHEUsIwKLpxhkbVjp+Pqsf29yGIQ0ZQ6CBp
         mkb8I6hfNPtNe84cp72KKyuFGdD3W1dErn9FwHRIjfgpjPbyO46oblD3L3JLxYVdCVil
         06P5osWdgGoXea5Xlh9Bruoxw8N41BiwWFhg2BmrbbgqRvK9fSODQpe0FI1jt8QYhr6x
         xu0IwDh0VcEuPOL89Gub9MpeSnnhXmjuBLzBtUKq7QFLTv+M+g82rGvR402vk7AxuR63
         SiC1judP6Hz6poiGeRWSoY8uO6voUtRJpGW87jlvaXJO+umnBTCbIpEbcEkoafq47WPr
         Wfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Uaqoisb/ISvzu7HtxB7/o6dTkuqP/WZqu9coo5sj/rM=;
        b=iBNDwPcFSe/QIs3ltR+WmYgg50G4X8R3+zlKPJeEgVinyZrtfsxSI0QHs4UNfC2ojZ
         U5iu+Za/JJWDJrhxdEoMcxgd9DlRVND9id+hpjlE3avW16kVEmoUacFSaqWEMkUd9WqI
         fWQahgRkm5VqQzRkNCruNPE56eEh/cJ2ZdqhQtfk06AaYEqBgRLUAwk4Xc9MEKcpqguG
         DFhFgfS6AOh2tkbCdJx8BFE+cinRJNBIseFEHDuyUKbWaiHCNTIPLrluVeZo0UQ+IUrJ
         uSUIDkwWBxnaSLc4S8rwMHxgCF9YXEycuZ2oA7TAPg/2K3aBj9yNLR+zDf1fUTbE8VK/
         Csaw==
X-Gm-Message-State: AGi0PuYmj0M9ltIVVSNK2evH+au9kVY6b1BElA1pvrjWtLinGwheaEQE
        VU3zsZMi/aMWP9W0L+x3zGrRj1XQ
X-Google-Smtp-Source: APiQypIYu3Eg7NEgNAgIjKBlQAKZLAcXDN2o4QVrIrfX6wXxEGW7JxgFHm/j+Ij7gLyXdheePb6ZUg==
X-Received: by 2002:a2e:8884:: with SMTP id k4mr11003642lji.267.1588607596749;
        Mon, 04 May 2020 08:53:16 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id o18sm10053646lfb.13.2020.05.04.08.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 08:53:15 -0700 (PDT)
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
 <4da289e6-036f-853b-beb4-379d6462adb0@gmail.com>
 <c6d54885-6f23-f60c-a17b-3481fc4d6adf@gmail.com>
 <b14b9dc5-7ac9-7735-d98d-eebc7e151cba@nvidia.com>
 <7d31d24f-f353-7e82-3ff9-cdba8b773d1e@nvidia.com>
 <06a4a067-8d54-4322-b2a6-14e82eaeda29@nvidia.com>
 <47873bbd-cf90-4595-5a99-7e9113327ecc@nvidia.com>
 <f6088e0f-4ac7-a6be-3ede-0233dc88ef2c@nvidia.com>
 <71532440-f455-cc24-74f7-9ccad5947099@gmail.com>
 <960d2715-a717-0cc3-df19-ff78dc426535@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <23520fa4-4d8f-b083-0ad3-b249339ee032@gmail.com>
Date:   Mon, 4 May 2020 18:53:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <960d2715-a717-0cc3-df19-ff78dc426535@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

04.05.2020 17:53, Sowjanya Komatineni пишет:
> 
> On 4/30/20 12:33 PM, Dmitry Osipenko wrote:
>>>>> Hi Dmitry,
>>>>>
>>>>> Will update in v12 to not allow freeze in middle of a frame capture.
>>>>>
>>>>> Can you please confirm on above if you agree to allow freeze to
>>>>> happen in b/w frame captures?
>>>>>
>>>>> Also as most feedback has been received from you by now, appreciate
>>>>> if you can provide all in this v11 if you have anything else so we
>>>>> will not have any new changes after v12.
>> I'll take another look tomorrow / during weekend and let you know.
> 
> Hi Dmitry,
> 
> Will send v12 if there is no more feedback. Please let me know.

Hello Sowjanya,

I don't have any more comments to add, looking forward to v12.
