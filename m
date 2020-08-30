Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9AFE257041
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 21:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgH3Ton (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 15:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgH3Tom (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 15:44:42 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708DEC061573;
        Sun, 30 Aug 2020 12:44:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c2so229856ljj.12;
        Sun, 30 Aug 2020 12:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w2b3uQ3grQuHzLpPQOfEHno6ki6zY9r+UONQurulOvI=;
        b=fhzf3GQjA1EtS/4zAwotNBVfEP5BgQC/vHh7NlqVuoqdj7ROn0tVvewLZVBzxTj4Pv
         4uAEsVCRdvMO7MN38yRhvjx55DRhviVUp+DeySquLtSENxd8LUNUq5mIKtUDp7268hWj
         EiAUYpoHBSpKqaW7iOB+cqshvXFhudBmVbsI7vuQfku+8lEdvR++g+KmaUBIrqUudFxn
         W8bUy8KkEXDCgYhxAAGz+7w9KmUMEitnB8JF5nbRsi/deNwUInd6AYGqmk3s0Ib8ljbl
         l0EyB1+767rr0k5EB5hEav1tXcXzg8p3RaCj4yuxNRG9oCWCo1/o1xG6lEcvfnnZFy/d
         3pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w2b3uQ3grQuHzLpPQOfEHno6ki6zY9r+UONQurulOvI=;
        b=leG/wgtrMJFH5J1J6VxTS5Hd9aNg/sD84usrjAA03Y1WiJFHL4z0fproDJoB7tZcAL
         64na/53cO6FqPjD53NATlKU+XdzYTqaZK6RXa5Tzy/xcHKDjRrmc1FwbKQ0alVVFyx1l
         rUciuBZv4gnUyPPz95rSjHMUOwjfMxcLqt1KrEbWowTn5W/NQLmeq8nYdsxxZ319OF5V
         HdHM5iyf0h4q1Z6QO0wEx8cEHseIRCq6bUp+ZNkg+3wZrQWED/tbQOXW3dHOW2y5UWB5
         TkWkcCJOypZMplVCrlU6gWw1a+GlGk0roCnk6JjsbxNd0OcjMXmYy21aRkSfK4ebEzgD
         3Xxg==
X-Gm-Message-State: AOAM530wrMXZiGXqjocBQznwdUCvRy6X8lg5eIBDvQkGtFfKVewLDvZT
        NcfpDvUyAuhtxtARDPDNifjjow+d+5c=
X-Google-Smtp-Source: ABdhPJz59TfkPi8wlRB5m8RE5yjEcxQe68Z6X9P8P2LdznriMOncqOezMDUqioFbPNx1FbZLjJi8TA==
X-Received: by 2002:a05:651c:11c5:: with SMTP id z5mr3132694ljo.74.1598816680601;
        Sun, 30 Aug 2020 12:44:40 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id e8sm1114886lja.93.2020.08.30.12.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2020 12:44:39 -0700 (PDT)
Subject: Re: [PATCH 16/18] staging/media/tegra-vde: Clean up IOMMU workaround
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
        linux@armlinux.org.uk, will@kernel.org, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        m.szyprowski@samsung.com, agross@kernel.org,
        bjorn.andersson@linaro.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com, matthias.bgg@gmail.com, yong.wu@mediatek.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, t-kristo@ti.com,
        s-anna@ti.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1597931875.git.robin.murphy@arm.com>
 <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
 <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
 <cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com>
 <62a72187-442b-2103-46c3-39d3cd999f54@gmail.com>
 <affe2cfb-19e8-8e55-acd0-7170e274ab34@arm.com>
 <f1923a53-e799-e63c-fd22-4a6cca3b8212@gmail.com>
 <20200827155446.GB1660457@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f6240633-feed-70b7-2fe8-49fcee687676@gmail.com>
Date:   Sun, 30 Aug 2020 22:44:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827155446.GB1660457@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

27.08.2020 18:54, Thierry Reding пишет:
...
>> The Tegra DRM has a very special quirk for ARM32 that was added in this
>> commit [2] and driver relies on checking of whether explicit or implicit
>> IOMMU is used in order to activate the quirk.
>>
>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=273da5a046965ccf0ec79eb63f2d5173467e20fa
>>
>> Once the implicit IOMMU is used for the DRM driver, the quirk no longer
>> works (if I'm not missing something). This problem needs to be resolved
>> before implicit IOMMU could be used by the Tegra DRM on ARM32.
...
> I do have a patch lying around somewhere that implements the mapping
> cache that was referenced in the above commit. Let me know if I should
> dig that up and send it out.

Hello, Thierry! It certainly will be interesting to take a look at yours
patch!

I think that the caching shouldn't be strictly necessary for keeping the
current workaround working and it should be possible to keep the code
as-is by replacing the domain-type checking with the SoC-generation
check in the Tegra DRM driver.

In general, IMO it should be better to stash the complex changes until
we'll get closer to adopting the new UAPI as it will certainly touch the
aspect of the per-device mappings. But if yours patch is less than 100
LOC, then maybe we could consider applying it right now!
