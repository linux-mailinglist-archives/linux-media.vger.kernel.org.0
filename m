Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E4924EFEC
	for <lists+linux-media@lfdr.de>; Sun, 23 Aug 2020 23:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgHWVmI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Aug 2020 17:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgHWVmI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Aug 2020 17:42:08 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFE4C061573;
        Sun, 23 Aug 2020 14:42:07 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 145so551565lfi.8;
        Sun, 23 Aug 2020 14:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wc4iGC6lUOkdFB1yl61K549g5r3SOsu5JHxiruFQCrg=;
        b=Bi3p+Cp3Oib9xYvfFtUZm0Uf4rS7f9RNyKsd3tWxxONpQQc3PTzptgnmmrY8S6kGoN
         MOvAz8xOUY9ngcOmmuv32FeGCODgI3+OG2C1ZfXRwC80bdmDQFHZhV0g8e/8gqYcSkMK
         VnOoZTXbShIC6Bch87KRpZNeDTivaN6dRe3bl07uV2weQcOSTlnP8PSnJSpTAz6UwHXh
         jfkfJtWP6VTM0IVwVX0tTJylC0DIYkRTaV1fnQyEsy7T5f3ySgDBw7pvJhI1XA7xov8H
         aaOCGtjqie8LdeYqkGUwj5n+Z1y9yL6cENlISNUIdyKKFk/8rZaF0QyYzMRltPEBVOw0
         WQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wc4iGC6lUOkdFB1yl61K549g5r3SOsu5JHxiruFQCrg=;
        b=jd3Vih/FsjJhqubomzZZG87XosGkGn8YTp7d1WD+lscweSinc4Z8WoPThpQOpxmfdA
         K2BzfICAhxTFIYxsJ2tMGPN8GSuD2HujHjB0NmnUW6fDJnRwfW5i/GZGyIOllWkMJAZb
         s5Ae1wiSIYViSv/BG2nuLCe4M0VoARGymNEZ1C14kP64XfX5lWJfvtF/Enhl8zlq61Zr
         ir4cFp958112iym8s1jgJPzofVgnLl89Fm7qrMzbmOixX5NZx+Ynw/qT4K6ZeO7UExDb
         QY172l9qGp1W3AcVg8NRUfMyJx61CvsTag1kWG1JjAsCBMy1RAP9aVyi874k8x0wrSN3
         ufnA==
X-Gm-Message-State: AOAM531gNIji4+LPCakX2stA4t4QDkyH64iX3mlaamKx/+ksN+jZgdn1
        fwHGRTr66eG9/Aw1pTVjkfmEEpIJsco=
X-Google-Smtp-Source: ABdhPJzBkQVyR54HEK+tqk6nv9UaSdmG4fAbLjgLYrMh+ECOQvZhJQPh8Uzu3899cmc9YqmRioxiNg==
X-Received: by 2002:a19:4ace:: with SMTP id x197mr1185909lfa.70.1598218924740;
        Sun, 23 Aug 2020 14:42:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id w8sm1807687ljm.48.2020.08.23.14.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2020 14:42:03 -0700 (PDT)
Subject: Re: [PATCH 12/18] iommu/tegra-gart: Add IOMMU_DOMAIN_DMA support
To:     Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
        linux@armlinux.org.uk
Cc:     will@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, m.szyprowski@samsung.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, vdumpa@nvidia.com,
        matthias.bgg@gmail.com, yong.wu@mediatek.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, t-kristo@ti.com,
        s-anna@ti.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1597931875.git.robin.murphy@arm.com>
 <516b33118d489e56499ff8c64c019709b744110c.1597931876.git.robin.murphy@arm.com>
 <081f7532-9ca0-0af3-35a1-cbaba0782237@gmail.com>
 <3a132bb0-f2e6-6f8d-6d0c-bc925dd23f06@arm.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ceccd3d1-2510-c289-c063-681ae005da85@gmail.com>
Date:   Mon, 24 Aug 2020 00:42:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3a132bb0-f2e6-6f8d-6d0c-bc925dd23f06@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

21.08.2020 03:28, Robin Murphy пишет:
...
>> Will a returned NULL tell to IOMMU core that implicit domain shouldn't
>> be used? Is it possible to leave this driver as-is?
> 
> The aim of this patch was just to make the conversion without functional
> changes wherever possible, i.e. maintain an equivalent to the existing
> ARM behaviour of allocating its own implicit domains for everything. It
> doesn't represent any judgement of whether that was ever appropriate for
> this driver in the first place ;)
> 
> Hopefully my other reply already covered the degree of control drivers
> can have with proper default domains, but do shout if anything wasn't
> clear.

Thank you for the detailed comments! I wasn't watching closely all the
recent iommu/ changes and yours clarification is very helpful!

My current understanding is that the GART driver will need to support
the IOMMU_DOMAIN_IDENTITY and set def_domain_type to
IOMMU_DOMAIN_IDENTITY for all devices.

Meanwhile, today's upstream drivers don't use GART, hence this patch
should be okay. Although, it's a bit unlikely that the IOMMU_DOMAIN_DMA
type will ever be useful for the GART, and thus, I'm still thinking that
will be a bit nicer to keep GART driver as-is for now.
