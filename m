Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF80719FF0E
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 22:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgDFU26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 16:28:58 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38956 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFU26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 16:28:58 -0400
Received: by mail-lj1-f193.google.com with SMTP id i20so1182784ljn.6;
        Mon, 06 Apr 2020 13:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lJzB2qZkJhYdfThuvVVq+84k4SnINb0Pufm3PfivT+U=;
        b=ph8eoJCSZbKOljhrDczfxooijkzZxrANpq0PkWABZ73QdojoixxG9sPBDfj4LKWY1T
         ddQw6UMM3cx/BoQmfsFDLuuQMC8aziPTJibwZJNDaJcLUETmUOPJ8jgoIfE6A26UpUtH
         oNAsGk6P3h2TwW9CJFUmVM5OOiuh3ICYvs1k/YQ76unIuUU7tX4+RHoaxAVJQVqB5RJa
         NE+3Y5LJLJnyy+hzgwrJmTe1EMxLCT61sYrw+ZzivveoVTKoXivecgm5ht2eiydgxHPs
         r9XHpBfzLnaI52GNO7jDhHDVCgP9r8qqsggwOFObaMVS6eEmfWrvbTBX7rvh8ocCd/Ir
         3ZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lJzB2qZkJhYdfThuvVVq+84k4SnINb0Pufm3PfivT+U=;
        b=gVkog2OeTFkPxMtyXHg30h03oQYXAK9fPmL1uCh7IasJ8C66coxKmYNbpsfw+wjjgQ
         fu0WWG4D8CKrUEzQEvXYOF/KLDdiiAoXfgr3/9Y3sV1k8T5/2IZFaHRgvnagyMt/OOxB
         l6DY0oUER+oPdjbMHdIs77Krh751yLIceX2APOQQVGZ3jV8SX7LlsXL6CR06H9F5XhHD
         phctx1JzJLvV7+fjW/zxPTsik6LmBkUK2IZLIKCvNdW3l3qqeypqw70fYmsNsyI14uUX
         HrLTxoXzIHQEdcfNKZcaVXYaaG8Opw4pQCU0laMLgTuKN7N7QUbzJjfKWLGZpAkUVBP5
         7GhQ==
X-Gm-Message-State: AGi0PuYF8V7qw82qiTRfqXnf9XrwIJrn8ueAK121vmWoQVXT/RaV5sNX
        kTk78cDRl+NDtkIhXdDuL75uqOPs
X-Google-Smtp-Source: APiQypKDf+gQwAn3HM92Vomnfc7TfHznh8qKbDGFmMNsgPo+nPQp6uQixmPQ3wh+5l3PYzX6xlRyew==
X-Received: by 2002:a2e:7513:: with SMTP id q19mr637081ljc.221.1586204933160;
        Mon, 06 Apr 2020 13:28:53 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id v3sm12214514lfq.16.2020.04.06.13.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 13:28:52 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <38d921a7-5cdf-8d0a-2772-4399dd1a96a0@gmail.com>
 <9b8cf37b-d2ad-9df2-aad8-216c2c954e69@nvidia.com>
 <1a12974a-7cc7-2c3a-3995-076b9956714d@gmail.com>
 <66cc8646-43d3-3fc8-c31d-d0d2efac505f@nvidia.com>
 <f000f6b9-0f05-b2a5-6dad-37b09803711d@gmail.com>
 <fe6a17c1-fae2-a365-4dd6-6d3a25d47d54@nvidia.com>
 <9038ce90-ac53-93e7-ce65-57f6ff1e9b30@nvidia.com>
 <abe82fd1-0464-0627-6c97-39c896e53dd0@gmail.com>
 <36b5627a-8639-6244-8620-4f23828e0638@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1c2c921e-daef-ba0f-5d1a-b58aa0b940fb@gmail.com>
Date:   Mon, 6 Apr 2020 23:28:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <36b5627a-8639-6244-8620-4f23828e0638@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.04.2020 23:05, Sowjanya Komatineni пишет:
..
>>> Wait time for HW syncpt to reach threshold is tuned to work for all
>>> frame rates. So if increment doesn't happen by then, its definitely
>>> missed event.
>> This is questionable. Technically, speculating about whether the tuned
>> value is good for all possible cases is incorrect thing to do.
>>
>> Although, I guess in practice it should be good enough for the starter
>> and could be improved later on, once the host1x driver will be improved.
> 
> By tuned value I meant about 200ms wait timeout for frame event to
> happen is what we have been using in downstream and with BSP release
> images which works good for all sensors and bridges we supported so far.

I don't know anything about the state of today's downstream, but
downstream of older Tegra SoCs was pretty awful in regards to the host1x
syncing, unfortunately it was borrowed into the upstream host1x years
ago and nothing was done about it so far. I'd suggest to be careful
about it.
