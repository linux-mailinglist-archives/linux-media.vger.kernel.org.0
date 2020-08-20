Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B7B24C6A3
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 22:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgHTUKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 16:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgHTUKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 16:10:32 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2C9C061385;
        Thu, 20 Aug 2020 13:10:31 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id t23so3520391ljc.3;
        Thu, 20 Aug 2020 13:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aGDq3G61oS7LkIVvcYe8gs5DEBUj3X0IY6+Ho7L4bXc=;
        b=aaI2XwvNa4jYT+ZP++lm8ICOT30vbHbYUWZ2eapjPgVOrbFZiW0JrsNRnHrkHauDAe
         F+tXGAAqJ4vzEu+ctIrX4IM+yBsxNUqux5EEMIr8tDiF5nelEImI1pAGijUjDb9sdpr+
         3jhTQx0pxPCjI9Yjxp5eOYRJHWEFTz3Q/JDopYi/d21uwf6ydkQJd8zd0nrYHrBm51gj
         IJ251b8BXCu/KouQNs7VyVjZaRoQ6EfqJzBBwEfbvaelF0x0hTDyx36zN9EiD0UZhoes
         jE4vU9heUNNm5TPrDjhlMPFoFqDRVuH+5P+XTNd0kuG1aP3MnluFFFC7ajaNVZ0Eb9HZ
         g3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aGDq3G61oS7LkIVvcYe8gs5DEBUj3X0IY6+Ho7L4bXc=;
        b=UFRwC7JdxU4LSgFhJO3IYezDLwGVjyRuW8fVoLjVjD7Z82LD6xMFuELxtiL82UjWGK
         Yp1j2JjA/cNUFAjJk0QUOXMEGwAiUtA/PbSsbpQ1sMLKkBiU7+EyULcMVbv4xwfXB+Xw
         6XNMTo2+B9J0qfH+etdcZ4xW/NTZHJlQXSpMUggcAxW5BBEPvpNn+7XBPNcXfLET6Th0
         TU5Jlp8BKhG21o8zp9h4cUPWpO+qz9yXSXE+lxzqh1p3Ztl4d0ma46rdnWiURH6t4UC3
         Sn2M1/P5BkQXGa0qVbDkfhBdA9VM4r0IY5NzYz/6T3IrpmUfQqH1WpiMWWAdMKQLvKCV
         nBBg==
X-Gm-Message-State: AOAM530+foEzpgeJ87L+z5BmUErLmNAWQWsG6X1WfjUwKikjM9qRZMKR
        /RoFioN50VZngixOBYTlhITuuHsd+rw=
X-Google-Smtp-Source: ABdhPJwerR6+NSwUtwLl00X9aib7HLlZlj50J5PUAv4AGloGJDrAm7Kb1tk696rJXQBYokDQvzy/bw==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr684ljj.258.1597954226414;
        Thu, 20 Aug 2020 13:10:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id f23sm633489ljk.74.2020.08.20.13.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 13:10:25 -0700 (PDT)
Subject: Re: [PATCH 16/18] staging/media/tegra-vde: Clean up IOMMU workaround
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
 <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
Message-ID: <ebc9c605-b986-daef-9f2c-1834437fd292@gmail.com>
Date:   Thu, 20 Aug 2020 23:10:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

20.08.2020 22:51, Dmitry Osipenko пишет:
> Alternatively, the Tegra SMMU could be changed such that the devices
> will be attached to a domain at the time of a first IOMMU mapping
> invocation instead of attaching at the time of attach_dev() callback
> invocation.
> 
> Or maybe even IOMMU core could be changed to attach devices at the time
> of the first IOMMU mapping invocation? This could be a universal
> solution for all drivers.

Although, please scratch this :) I'll need to revisit how DMA mapping
API works.
