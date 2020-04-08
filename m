Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB491A23F5
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 16:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728620AbgDHOVr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 10:21:47 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44884 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbgDHOVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 10:21:47 -0400
Received: by mail-lf1-f67.google.com with SMTP id 131so5226841lfh.11;
        Wed, 08 Apr 2020 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jf0MyvNrfZeSllBWGHedtbc9gbfyY6waAa4WK3aei6c=;
        b=BOgb6KT/XVKYSez/v8+1A9WWPBbubsoob5g6qXsuZVeNs532Z9I6fM8sF6fB8xghkY
         qP+dEBTK3mVa/tcTlHZM3L5qk2jePUvTQe1EPBVKBd33p1Xhlj+y6CbsghxHEgOzv94M
         ZbYM+/4LONvDQQCWBTTnaHppKB2T4SUourtCjXjhuDoaaWfkOlIwK1zkdJGHcvQl6w9h
         Rspvj2ZULbLC2F7ZLyhVDwX0sfTOrnJp23EJi2YOYjm80+kmfuPFnz/CUVaRvR+Xc7gB
         I+96QbxW8VNPc3bqnM6bQlwDWYsGuGiW8f+Wp3F7wyZ6Jv/bkjTyplevyjSjtwaJV+I9
         nh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jf0MyvNrfZeSllBWGHedtbc9gbfyY6waAa4WK3aei6c=;
        b=WTayKLloEeaC3ujWOb43MQ5a3oojmf4c9rNljAT6aLJm+mtjwVlXoTu0L/t8OKnra+
         P6ERGX2U7F7X8kOnqGiKrsTSlPx64tao/Zj1/bqpxsCKXh5AqJIBFlQ58xwf232kYaVJ
         JKwSfp9M6uQ5qATcdyD0P0irk0xPeazDZ1YX9czzzhr6wQHJyg+b9gpft2+u6Qu+xa2z
         twvWljQDLapS7I7a9G4PBJRd821LjNKWX0u5aQEcGxSnsmHGlLSwFqDIlvAH5PLBUfLi
         BlOgI3xTUstb6rB+34E4NKzx2Jm1kEHShRMHjduP0MFtZkeUoQasbJKQ1pFaTAdaSaSN
         0y3Q==
X-Gm-Message-State: AGi0Pub+E6AL4WNq+9zipRmww28Qv2974nn9LoSa7anUUC8KxzZDZ2Wa
        yEyD2/Ew/iUlF2mA4Exq9cdXSBXg
X-Google-Smtp-Source: APiQypI0mxuc5luIqiw00spdsT9+ePChmhF5+4Scec0luiKkg51AuPK0pfMQqpfnOGXrQXb29jk1/A==
X-Received: by 2002:ac2:58d7:: with SMTP id u23mr4817315lfo.182.1586355701563;
        Wed, 08 Apr 2020 07:21:41 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id v9sm13821994ljv.82.2020.04.08.07.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 07:21:40 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
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
 <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
 <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
 <db7c7051-5674-cdb9-0aa4-ee94125b3024@gmail.com>
 <1a31cd60-739f-0660-1c45-31487d2f2128@nvidia.com>
 <603084a5-249a-4fe2-3646-e9335ef9ab43@nvidia.com>
 <7895b9c6-f27d-8939-73d7-67d785e1a8b7@nvidia.com>
 <ea60b489-990e-4b15-e215-d93381a1371e@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b2405c2a-73c0-ad69-ccea-0388caf8045c@gmail.com>
Date:   Wed, 8 Apr 2020 17:21:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ea60b489-990e-4b15-e215-d93381a1371e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

08.04.2020 03:00, Sowjanya Komatineni пишет:
...
>>>>> I suppose that taking a shot takes at least few milliseconds, which
>>>>> should be unacceptable to waste.
>>>> As long as buffers are in queue we have to keep processing each
>>>> buffer and between buffers obviously we have to wait for previous
>>>> frames to finish and this why we have separate thread for frame
>>>> finish where we can have next buffer capture ready and issue while
>>>> previous frame memory write happens
>> Also we specified numbers buffers as 3 to vb2 queue. So this is rare
>> case but to prevent issuing more than 2 at a time as VI HW is only
>> double buffered and syncpt fifo max depth is 2 added this to be safer.
> 
> To be more clear, when more buffers are enqueued from userspace always
> capture list will be full and thread will be busy in capture till either
> error or stop stream request happens.
> 

If kthreads take more than 1% of CPU time during capture (video) with
more than 2 buffers in queue, then it's not good and I think you should
do something about it. If kthreads stay at ~0%, then it should be okay
as-is.
