Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B77273D12
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 10:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgIVIQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 04:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbgIVIQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 04:16:18 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6367C061755;
        Tue, 22 Sep 2020 01:16:17 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s12so15993065wrw.11;
        Tue, 22 Sep 2020 01:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=aKRxZL4FGN5j/4WkJ9pynD3NUqlurooCForAs/j+ntg=;
        b=dmDw9QZtzmevLAins9hFvEC4NiX8Xs22crn3GDX855fYgxS+DwvN15/80NgKOmLAdv
         o30HhP+xH6uizb79qkXdUrkVRmuvgBH93Hknh3dBGT2IG2AVrDH/Oqb1OzY2g8WhhL/o
         X4r04M4SUNb9SoMJznOcJtkp1CRsQlQG+SFFdRCAd9sQbW9KbFkRKR9jgr6v3pUA+8R3
         lsZmOP230jBbi+gHRI1xP5RtBEn0mlEHwoNxNqwZTWL0RRtsMFZYphVQ+qX47K4kf4to
         BsBhOYdjiaV6bxdXcGuX56cv0322/21x2fhtpc2EOuVRsm6HoO7VtwUrEL1W/EMDs5Zj
         6/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aKRxZL4FGN5j/4WkJ9pynD3NUqlurooCForAs/j+ntg=;
        b=WHfoRUnH/WTavmgAIRh0rPFzMzaqUlEoxUcFBbjlnPu94D2hkfkDwX9mYEhNrCFRJB
         f5CuP4zwcE/I6vsF7AcTHlImZ9eE7n3KBlHRWneaV+q8FdCv8rqTMZTGV4A/al4bJZ9k
         jWIt4t96jYjHZ5iDNa5Em8OQ08vAhaqSgAI7it3KDpnZfsEBW1DCqMqPjaYOlJ4Md3pH
         bIqOQPdBHbIoCuqQEvyYMXu9sCr9hiPrJ7kZ+aNoINhA6cyxw9aNw7oPy0MooQkauPXX
         QofqC5R9HhxWU0GUt6DF+4FhL60yNdVdifK3Vox1gkc39P2yh8hbwYk7e3sWfNsmQkjV
         EWEA==
X-Gm-Message-State: AOAM5324TAkenZULTC4xPHh9+hFrhHM1Vji1czfiQHD3DBoQHZKJ/J+r
        31yq0Aj7npl4C6jRrRy+11es9ZRQFUvtPmqC
X-Google-Smtp-Source: ABdhPJxRolYELjQplUMesH1+RAkghTXRZcshi7uZA4CNsT8JzclYHqmvQmiEn/M9dR8aCWrWQmvlgw==
X-Received: by 2002:a5d:680b:: with SMTP id w11mr4182872wru.73.1600762576158;
        Tue, 22 Sep 2020 01:16:16 -0700 (PDT)
Received: from [192.168.0.64] (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id j14sm25702629wrr.66.2020.09.22.01.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 01:16:15 -0700 (PDT)
Subject: Re: [PATCH RESEND 0/5] atomisp: Fixes and cleanups
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20200921215359.45003-1-alex.dewar90@gmail.com>
 <20200922101143.28779711@coco.lan>
From:   Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <21f18dc2-a1bc-0a37-0336-fc35170a40e9@gmail.com>
Date:   Tue, 22 Sep 2020 09:16:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922101143.28779711@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/09/2020 09:11, Mauro Carvalho Chehab wrote:
> Em Mon, 21 Sep 2020 22:53:49 +0100
> Alex Dewar <alex.dewar90@gmail.com> escreveu:
>
>> Hi Mauro,
>>
>> Over the last month I've sent a few scattered patches to fix various
>> warnings from static analysers, but they seem to have fallen through the
>> cracks? I'm reposting them here as a series to make them easier to
>> review. If you do have any feedback that'd be great :)
> Usually, there's no need to re-send the patches, as we pick them
> from a patchwork queue.
>
> However, only one of the patches actually applied against the
> linux-media tree.
>
> So, please rebased the remaining patches on the top of it.
>
> Thanks,
> Mauro
That's weird. They applied cleanly against yesterday's linux-next for 
me... I'll rebase on linux-media and resend.

Best,
Alex
