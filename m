Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC4B457290
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 17:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236314AbhKSQRk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 11:17:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbhKSQRk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 11:17:40 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1577DC061574;
        Fri, 19 Nov 2021 08:14:38 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id k37so45789345lfv.3;
        Fri, 19 Nov 2021 08:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CVt00Cx1G7U8YuaydLPRKeb99+KAqAPpcKxsRo0Aya0=;
        b=RafOqQK7mPPCgY98rBc+Sd0SB6lWfmDwHiTOEX4DVMci2mmIseoG0o1AyUaEWOqZaN
         qxalOyWR8C5wSq+bqZx/cBK8t/FQ1AT4rcQUC1qLFfGEmYKrttH3Tjj58aJbGkzr+Z8N
         c5s3GCrvJX9xXFhjMGaEYVgij2KMSwmZ6ns1WGW0HKTKWhidmGXkpBcvfht8CdvB7niV
         xHJIoynaVpNdTweIo35hQzaWZO4YLei390F6v1YowvaZGCTWXWuL1wCH9OF9H1GtM3vc
         ikSwW02TInMoK7wXODQzUnOV4rkcd11E0YgDd+FTRd6YKFGLv0XWfTia4+m7dtcA4Y4F
         AZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CVt00Cx1G7U8YuaydLPRKeb99+KAqAPpcKxsRo0Aya0=;
        b=VhSyhRDUS5MTAm/wcArjyiVjQaTSvgJU9P+Fo/UU+/KZz1RnagYYTuvGHMJ/7xYHSS
         sOTpdFK+Nw5ywxBaGKkOa+fb0iIXbW2EpYKPeCTk4W4TkB0rAELU6PwFsFi7orQcQ3e7
         smtVmRNAZBBHVgzwDpHLpaImzLTspvBOwu6HtE6dXWUdo7dO2y6XW/XY8akeWO1e8KK6
         gqvHEkIj4qwDBB7eyC5B9Mhk0im/YyQLQdYMIA93EWmPSrLue5eKxUTTEyAsuwvw9X0k
         GVxYe2jqi/0aAeBMPHc85Vyqb4lMmvw/DJuZhLMB+plZg7dZUGo8smz1/8zYYASkDDXE
         U49A==
X-Gm-Message-State: AOAM5302lqfOGNxfELDjcMCJb3CIKGA0Zc6AOCa5AoS95Rhtb+4Jmyvy
        jOLMVdOC+aBzUWRmlsj9yEbxM/6QGts=
X-Google-Smtp-Source: ABdhPJw1wjBYBR1zg/q9N01rP3fcpd1YoL3lTmx4i87xCIdjzz3P3x6SQy6gVCrAKkSEGDTvgZzhLA==
X-Received: by 2002:a05:6512:15a7:: with SMTP id bp39mr34306157lfb.145.1637338476327;
        Fri, 19 Nov 2021 08:14:36 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id a28sm15456ljd.65.2021.11.19.08.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 08:14:35 -0800 (PST)
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, smatch@vger.kernel.org
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
 <20211115124402.GE26989@kadam>
 <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
 <20211115154858.GG27562@kadam>
 <89166c20-6b05-ed4b-ed45-451f4f1e10bc@gmail.com>
 <20211118061418.GO26989@kadam>
 <a7238d27-6f9a-58ac-1acd-44fa6ea0727d@gmail.com>
 <20211119123001.GR27562@kadam>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4bddc31f-de23-8c50-bad2-e23c2729e119@gmail.com>
Date:   Fri, 19 Nov 2021 19:14:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119123001.GR27562@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

19.11.2021 15:30, Dan Carpenter пишет:
> On Thu, Nov 18, 2021 at 04:56:38PM +0300, Dmitry Osipenko wrote:
>> 18.11.2021 09:14, Dan Carpenter пишет:
>>> It's not hard to run Smatch yourself...
>>>
>>> Depending on if you're on a apt distro or yum distro then fetch the
>>> dependencies with one of the follow commands:
>>> apt-get install gcc make sqlite3 libsqlite3-dev libdbd-sqlite3-perl libssl-dev libtry-tiny-perl
>>> yum install gcc make sqlite3 sqlite-devel sqlite perl-DBD-SQLite openssl-devel perl-Try-Tiny
>>>
>>> git clone https://github.com/error27/smatch 
>>> cd smatch
>>> make
>>> cd ~/kernel_source/
>>> ~/smatch/smatch_scripts/kchecker drivers/subsystem/
>>
>> Thanks, I was running Smatch couple times in the past. Finding how to
>> run Smatch isn't the problem, the thing is that Smatch either isn't
>> packaged by distros or packaged version is outdated, hence there is a
>> need to maintain it by yourself.
>>
>> Also, is it guaranteed that Smatch will always work properly with
>> linux-next?
> 
> I work against linux-next every day so generally, yes.  But that reminds
> me that linux-next broke while I was on vacation and I haven't yet
> pushed the fixes.
> 
>>
>> I imagine more developers could start to engage in using Smatch if
>> kernel supported 'make smatch' command which would automate the process
>> of fetching, building and running Smatch.
>>
>> Couldn't the "kernel" version of Smatch reside in the kernel's tools/?
>> Or maybe just the parts of Smatch that are necessary for kernel
>> checking, like kernel's DB/scripts and etc. Doesn't it make sense?
> 
> I'm not sure that makes sense really...  I'll expand on that in a bit
> but the shorter answer is also that I don't have the bandwidth to make
> it work.  I just suck at releases and testing.  So this would bitrot and
> be horrible.
> 
> Smatch does need a better way to manage data for other projects.  Right
> now linux-next is the first class citizen.  It's the only thing where
> I'm positive that it gets tested regularly.  All the data in
> smatch_data/ is from linux-next.
> 
> And also there should be a better way to check specific version of the
> kernel because people quite often use the same directory and just check
> out v4.12 to test that and switch back.  I do that and I've got scripts
> on my system ./switch_to_tree4v1.sh which set up the symlinks for me.
> 
> But for linux-next it's fine.  Also by the time kernels have been
> released the remaining Smatch warnings are almost all false positives.
> 
> To me the data in smatch_data/ is not so important as the cross function
> database.  And the cross function database can't be distributed.  It's
> too huge and it's specific to a given .config.

Thank you for the clarification.
