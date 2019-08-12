Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF5198A10F
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 16:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbfHLO1e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 10:27:34 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41258 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbfHLO1e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 10:27:34 -0400
Received: by mail-ot1-f68.google.com with SMTP id o101so6495975ota.8
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2019 07:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iB0JWM7h1gxHw3EITq7Z+ghm7p6Q9nTkPir7Y/G4NH8=;
        b=TZc9ggBowRmmtGuC8ttoadFm5vz2RNC35ZL0jQEW8J4nIC/wah+7aT1ZVTL8JXEnt9
         Pfu07LhqpOmZZ46/ccWdmiRlXjW42Izow1P9kDlGqDd7Hd2czIF2QlOF2N28AcnYdtkX
         JDn/O9InIP/aYT4ciYOi5C+4hFHdJM1sgwXJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iB0JWM7h1gxHw3EITq7Z+ghm7p6Q9nTkPir7Y/G4NH8=;
        b=G1VTFXCCKS21zInLSEkfvCQqy2S3sl0l6yo8a2sTufC9IHLInCaZecMSTlfXy9pR73
         ELmPT0HM/7uVtQ5K9whQiv5CftPMOT3wwtaOpjeP7fEY8Q5i0wYO500clBoj+81oSOiv
         EK+Dzo3OxDcKyhju36WB+Cz060g+SVrUyhwudAV6mfI8T4gPVbx0ImqJnKGM5WUsQCes
         NomhlbeZ8Yapphi9SRp+Z/IYR2kgEjhtckx3Bkh6D+mdJmDy6TMcgdkRCfyoJumSAI/C
         mbxL/rEl0GKPUTxH8SKam2lbFQXxwGIlXF8qTrOuBAphMYJxEz/xen4EWVnzLHbgCltl
         lZGA==
X-Gm-Message-State: APjAAAWyzCz25qr5NrL9yPI8aVEogcPsckbwG+365tvFSSilDfWyatqg
        9OW7QYez7iw7dgOyMePfTJvfXQ==
X-Google-Smtp-Source: APXvYqxKpM3w/vMiS/JBa38QJi5ADvN199ViP/KkzVP1/OxWlB0VBqt0i1aaSCaBQG+ri38z3vnHQA==
X-Received: by 2002:a6b:730f:: with SMTP id e15mr33995089ioh.74.1565620053420;
        Mon, 12 Aug 2019 07:27:33 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d6sm20462220iod.17.2019.08.12.07.27.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 07:27:32 -0700 (PDT)
Subject: Re: [PATCH 1/3] media: vimc: move private defines to a common header
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     helen.koike@collabora.com,
        =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        mchehab@kernel.org, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <cover.1565386363.git.skhan@linuxfoundation.org>
 <142cc5a6a10f75ed97de8b2d9b1e73b034a88b2f.1565386363.git.skhan@linuxfoundation.org>
 <20190810141432.GA30451@pendragon.ideasonboard.com>
 <ab0b316c-8b6d-0faf-b046-97c8065b8afd@linuxfoundation.org>
 <20190812142447.GF5006@pendragon.ideasonboard.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <8e5206fe-240e-e5d3-c675-255aa0df7d57@linuxfoundation.org>
Date:   Mon, 12 Aug 2019 08:27:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812142447.GF5006@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/12/19 8:24 AM, Laurent Pinchart wrote:
> Hi Shua,
> 
> On Mon, Aug 12, 2019 at 08:19:27AM -0600, Shuah Khan wrote:
>> On 8/10/19 8:14 AM, Laurent Pinchart wrote:
>>> On Fri, Aug 09, 2019 at 03:45:41PM -0600, Shuah Khan wrote:
>>>> In preparation for collapsing the component driver structure into
>>>> a monolith, move private device structure defines to a new common
>>>> header file.
>>>
>>> Apart from the vimc_device structure, this doesn't seem to be needed.
>>> I'd rather keep each structure private to the .c file that handles it,
>>> and only share vimc_device globally.
>>
>> Right. I initially thought that I needed these global. Once I completed
>> the patches without needing these as global, I overlooked updating the
>> patches.
>>
>> I will take care of that. Any thoughts on vimc.h vs. adding vimc_device
>> struct to existing vimc-common.h
>>
>> As I explained to Helen in response to her comment about:
>>
>> "My thinking is that vimc-common.h is common for all the subdevs and
>> putting vimc-core defines and structures it shares it with the subdev
>> files can be in a separate file.
>>
>> It is more of design choice to keep structures and defined organized.
>> Originally I was thinking all the subdev device structires need to be
>> global, and my patch set I sent out as such doesn't need that. I just
>> overlooked that when I sent the patches out.
>>
>> This reduces the number of things that need to be common, I don't really
>> have any strong reasons for either choice of adding common defines to
>> vimc-common.h vs vimc.h - maybe with a slight tilt towards vimc.h"
> 
> The vimc_device structure fits nicely in vimc-common.h in my opinion, as
> it's used by every component. I don't care much either way.
> 

Sounds good to me.

thanks,
-- Shuah
