Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F26145284B
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 04:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344169AbhKPDOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 22:14:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351573AbhKPDNm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 22:13:42 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37192C0432FA
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 15:43:29 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so1005228wme.4
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 15:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DzUmMBv3Ht2UpY91r9TcV4z0Xl21KrBCpA7XOjrZu8M=;
        b=KmXc3ahxEQzyXfViVUzzfd1ZKJmckV7Po2xRHLIaqMa/aKuykU8BRcM/t/tAMzWurZ
         XkwMyCQM0QRNW79GbMzidtiUtuMnl92rHnYRX319i8Zzgq4rXtluqE3H300sGeJ4LTo/
         S1gh8mOddHhsgT3D56x3nq1VWpES5Pac6MnkTidardqX9SC8QHhJdvlLSBhi5ArG5u40
         2USN1SfZUSXxeJRR7XfYPcLSwafhzYqGAfpZoyrGROI06WtsEOMc8oh6ghTtF0CjnJo/
         QobJuVciefsDX0Sw8ZFYFtyHMOhf6oOZJsrtiArFklpF1RVU0IG1U3oS2gkv45ODw4Xk
         X9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DzUmMBv3Ht2UpY91r9TcV4z0Xl21KrBCpA7XOjrZu8M=;
        b=XfCJN4RYhaheG64atK4WYJNjODtq9yzbsX47QtUxiIYxpkZAc0Q0OLMnvp9GeEfYu+
         E2VroMK/AXr6iZEsiIpqSAli3vMN91xiH08dGZC6EXgnxzPtfZU36ddrub8+Y99oC13i
         IDnkn5v2q33D7/DiyoONXMIulzVkLfwR4kiSZLWt6jzsU5n5to7M/YUt2s/QhlPkJOFP
         r8zDqLpi745kduHsLI8oDCYDcmxapTDnKIq1p70SfQbzKd/RbRK774tgeGscSYpP5Nq1
         lXm9LucWKYOUK7hQDviQEQjRa6IsgJy+fH07NLIrJxLLsBrhP1zhrqcHqp9/nfuImflN
         r62w==
X-Gm-Message-State: AOAM533zAIFxN8Ldk4IdbH0/wiIPW45PD40UCPWwfZLoDys9KWPVNNzV
        jhpNVelwglcbEblKPe3GMXGIoNu24kE=
X-Google-Smtp-Source: ABdhPJxzBwFrrIIDj8iOfurQtkpYAvlaJNyxJydJQuFHN5ZA+u8rrAGm/iz5XjjFiDbH5CbEvwEokA==
X-Received: by 2002:a1c:cc0f:: with SMTP id h15mr2715962wmb.37.1637019807764;
        Mon, 15 Nov 2021 15:43:27 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o5sm15140597wrx.83.2021.11.15.15.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 15:43:27 -0800 (PST)
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
 <d0f969f6-e029-7c28-17ce-79b8228ddaee@gmail.com>
 <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
 <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com>
 <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
 <90a31605-49c9-9e4b-765f-c8f8773b3ba0@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <cdcac7f1-7d03-9521-98f4-fabb56283b37@gmail.com>
Date:   Mon, 15 Nov 2021 23:43:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <90a31605-49c9-9e4b-765f-c8f8773b3ba0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 11/11/2021 15:59, Hans de Goede wrote:
> Hi,
>
> On 11/9/21 17:35, Daniel Scally wrote:
>
> <snip>
>
>>> Talking about this Dell Latitude 7285, I haven't had a chance to
>>> look into this at all. But chances are I will need to do some
>>> I2C-register dumps under Windows, last time you mentioned you
>>> had some small tool for this ? It is ok if it is a bit hackish,
>>> it will still be very useful to have :)  And I believe I will
>>> also need to override the DSDT under Windows for this, right?
>>> I should be able to cope with that too.
>>
>> So the tool I was using was the I2cTestTool [1], which requires you to
>> first hack the DSDT to enable usermode access [2]. You need the
>> Microsoft ASL compiler [3] to insert the new DSDT, but fwiw I gave up
>> trying to use their tool to actually compile the table and just did it
>> running Ubuntu with iasl, then saved the file onto the Go2's SD card and
>> loaded it using asl.exe in Windows...the MS tool just wouldn't compile
>> for whatever reason.
>>
>>
>> All that said; you don't actually need to do this for the Latitude 7285
>> - on the Github thread a chap with that device found the schematics and
>> posted them [4], so we should already have the information we need to
>> populate the board data for that one. The sensor drivers need some work
>> though - the ov9734 I have a series somewhere that I think should work
>> but haven't ever tested, the ov8858 I don't think anyone's looked at yet.
> Awesome, thank you very much for these links.
>
> If you can dig up the ov9734 patch series you have and email me a copy (1),
> that would be great, then I can start looking into getting things to work
> on the Latitude 7285.


Sorry for the late reply - kid's birthday this weekend so haven't had
much time to do anything. I had a look for this but I suspect I spring
cleaned that branch as I can't find it, sorry. I can recall changing
ov9734_check_hwcfg() to return -EPROBE_DEFER if
fwnode_graph_get_next_endpoint() returns NULL (because the cio2-bridge
can build that endpoint later), and adding the entry for this sensor to
the cio2-bridge, with the 180MHz link frequency from the driver, but
past that memory fails.


> Regards,
>
> Hans
>
>
> 1) No need to make it compile with the latest, I can take care of that
> just email me what you have :)
>
>
