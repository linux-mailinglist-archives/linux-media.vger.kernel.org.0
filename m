Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE0F91A17D7
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 00:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgDGWOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 18:14:10 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36116 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDGWOK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 18:14:10 -0400
Received: by mail-lf1-f65.google.com with SMTP id w145so3627481lff.3;
        Tue, 07 Apr 2020 15:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6uRUHjT3H2vueqpdrwwP13xe2CMDcv0WafFpeyYI7lU=;
        b=rAbkst+fkeSxUghjYacRPqyPdtQYTMTxLi0WEDiLh/eeZIOXvyTJMVDNdpP7PCvHKj
         UbvmD4JHXfPK56f/bwbNd63eJem8edKGcsuJ5TFFIIyr5fvsv7D5XJrg2AVYmEbFZ1sN
         fUQEAuLZ4WqDpYFUeEWRWwdNcEh4Okv0DTOlKYHi0PuHzvBVyJi65DHjEax9WpbKyWmK
         1t39Snwf4LIo5wv4RoHnO47DmCIh0tA3qXUp17JpCc+dGFA1oWCfj41VTXsbr7UEMJBf
         5pUceT7Y8uET2RHGMktMxypggnKcT4sc3XJyCmY1P8hQSDUM/mBJDbq21AAsL3ijkAR4
         b+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6uRUHjT3H2vueqpdrwwP13xe2CMDcv0WafFpeyYI7lU=;
        b=Ttbe0enW28GkvvD4dElaRdHa9FhrL6wzCwZd2tqUb5M3h9GJ8SZjJaYr3qhs5gv/Rb
         t4m6jz4oQDJHANBspppCTZWhDT6SqauNEcOAbuDtDThvsi+2mXqVUgBy7glxnJdB5TMt
         BBTALXyNhn7tMhKk5p7trKeNaDPip8IO87kwKG31a9qw5LPKUr/UTSoIpSyaU+wl3Sp1
         grH2jijQmrAMpB1D9AIv/MWzK4ydT2NdRa10cksuGI4YNPIKyignK9vdpUQZI0UvfeMf
         2H+MDkRhQ2HBL0TAEg6th9IHPN5pzy2DdjKKWnxzzUVQ1yh3aVRRdK4JMysEzc9ltSlv
         /wnQ==
X-Gm-Message-State: AGi0PuaD1dsQQiKYYLmmBaVTku+zITE3NWqA7wTcJGKG9yjokdeLRyFH
        +6RYWsRyiBAP3MXyj3kC+oUdIrrp
X-Google-Smtp-Source: APiQypIugZXxUsd6hzBRHuCzJVvozH9gSOdzFAkV/cOyC5kvexLHlgQQHLEyOFzolrIVXQv3Be/QaA==
X-Received: by 2002:ac2:46e5:: with SMTP id q5mr1912441lfo.11.1586297646938;
        Tue, 07 Apr 2020 15:14:06 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id l13sm12381613ljc.84.2020.04.07.15.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 15:14:06 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
 <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
 <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
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
Message-ID: <ee4cce05-2c60-6de1-2639-fe54abbf8345@gmail.com>
Date:   Wed, 8 Apr 2020 01:14:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

08.04.2020 01:08, Dmitry Osipenko пишет:
> 08.04.2020 00:08, Sowjanya Komatineni пишет:
> ...
>>>> I think you need a semaphore with resource count = 2.
>>> we hold on to issuing capture if more than 2 buffers are queued and it
>>> continues only after fifo has min 1 slot empty
>>
>>
>> Just want to close on this part of feedback. Hope above explanation is
>> clear regarding triggering/issuing at max 2 frame capture to VI HW and
>> also regarding capture threads where they use wait_event_interruptible
>> to prevent blocking waiting for buffers to be available for captures.
>>
>> So no changes related to this part are needed in v7.
> From what I see in the code, you "hold on" by making kthread to spin in
> a busy-loop while caps_inflight >= SYNCPT_FIFO_DEPTH. So some change
> should be needed to prevent this.

Looks like some other media drivers do:

	schedule_timeout_uninterruptible(1);

to avoid CPU hogging when contention is detected.
