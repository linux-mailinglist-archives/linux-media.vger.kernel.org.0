Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79AE4269268
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 19:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgINRDL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 13:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgINPJD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 11:09:03 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2628C061788
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2020 08:09:02 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id b79so408732wmb.4
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2020 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VI16zOkopq38UY5ksQ29ftI2KFj5gS2cFaSWo1Ve15o=;
        b=Mih4nYYhkhaQcqCVJS8MqlDEgmqt3WYUcIVpPUyNjIu1cnvEIqri9i2h/HaiZLvG8N
         XYEi5M9UFMIyZmjUfeUHL5rxehg61cU/nLfM7eNzzTLel8jlt+Sa5TlvpwHYHn3I0lF1
         XDycbHF6DyZGVOMm1i7UhjPHCXy7WhHd0pqkbJ768GuYZGaNevw33gLuG4Ur9Jo9d+OD
         uL58fvb6d3Upp78/8TSOke+Qrh8VNYQ27A69dY1PDSWxBWlLBOSkHRHLNzmUdj2psPQI
         N35xH3ARoygFqeDF4YN2ekExYaeITehHE/HaX1y+KRlytuyafeJhEhIIVQX8DU7q/lHl
         XpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VI16zOkopq38UY5ksQ29ftI2KFj5gS2cFaSWo1Ve15o=;
        b=srQYUxEzLGY9hVQqTX66SFfLFzO6lrdslpfyJJRu2MkdMnXv5zGHObq204vAngvEKM
         X9UI4VdoTZW8qP/YhNewaMqjabvFqGBejTbX93HUcXX/X5oI45cl/YyU4KJ2+fqBDsg7
         ISZ4k7QJpHRHIbK1ey4zCkRQg/T5owBT2eLA7RTbyavCfDE8uFutL9bCtHq+4xBZA/xL
         rpLuYkzMz8coblEek/G+H+vLPXi6aZS9ueXme9wvgDNm2XoZmDaKp/ZetSVgZaJZ26BV
         iMOHiSPosRIvLpe2r/Ap4BPpB7BBENgmArQE75yf/la23dLueNI8mb8JFAMZ07Jm3pVD
         vNQw==
X-Gm-Message-State: AOAM530z6Ioo3Pvg8sEhvQggt0RCOra/X0LsOLE0a5ed6WUIUHmB5ODK
        XBde74vTJ/h6HBMgF9ZgGURmK6ymXQauwMZq
X-Google-Smtp-Source: ABdhPJzUmKcSU9cJGIlIt5VHLKDMJ+LjlhXr9NGJQ4ioOTrsEuB/P4xao+i4EQ/KvdiT7JMG8/T2Eg==
X-Received: by 2002:a1c:7502:: with SMTP id o2mr15135074wmc.29.1600096139022;
        Mon, 14 Sep 2020 08:08:59 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id p3sm18626678wmm.40.2020.09.14.08.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 08:08:58 -0700 (PDT)
Subject: Re: cio2 ipu3 module to automatically connect sensors via swnodes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        jorhand@linux.microsoft.com, Tsuchiya Yuto <kitakar@gmail.com>
References: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
 <20200909134053.GA3699980@kuha.fi.intel.com>
 <70b214fd-d199-ccb2-2a84-dc1f6f7c759f@gmail.com>
 <20200914145800.GF3956970@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <49c6f074-9eca-4d47-a5dc-a4ea0cda0836@gmail.com>
Date:   Mon, 14 Sep 2020 16:08:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914145800.GF3956970@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/09/2020 15:58, Andy Shevchenko wrote:
> On Sat, Sep 12, 2020 at 08:45:10AM +0100, Dan Scally wrote:
>> Hello Heikki
>>
>> On 09/09/2020 14:40, Heikki Krogerus wrote:
>>> I'm almost certain that my graph patch is broken. My tests did not
>>> cover nearly as much that is needed to properly test the patch. I
>>> think at least the refcount handling is totally broken in
>>> software_node_graph_get_next_endpoint(), so that function at least
>>> needs to be rewritten.
>>>
>>> Unfortunately I do not have time to work on that patch right now.
>>>
>>> thanks,
>>
>> I managed to get to the bottom of the remaining issue (which was the cause
>> of the problem I originally posted here about - that's now all resolved).
>> In addition to the refcount handling problems,
>> software_node_graph_get_next_endpoint() was occasionally passing an invalid
>> combination of parameters to software_node_get_next_child(); sometimes it
>> would pass an existing endpoint as old in combination with a port which was
>> not the endpoint's parent. Applying this on top of your patch seems to stop
>> both of those errors:
> 
> Can you send a formal patch where you will be a co-developer to Heikki?
> Though I don't remember if Heikki signed off it.
> 

The original has his Signed-off-by on it yes, but it wasn't raised as a 
formal patch. I'll raise one and send it yes; probably tomorrow.

Thanks,
Dan
