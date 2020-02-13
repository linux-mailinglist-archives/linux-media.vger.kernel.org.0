Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E333715CA20
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 19:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgBMSRi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 13:17:38 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43036 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgBMSRi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 13:17:38 -0500
Received: by mail-pg1-f196.google.com with SMTP id u12so3172759pgb.10;
        Thu, 13 Feb 2020 10:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b85HmoU7b97JK+C46GgyWlG+CYZE3kmiSc0PmiJHXGE=;
        b=a0TWta1TDimDQB+xdv8tqJoFlhkrn5vM5Al0M7oRU61KYuHwxjCpUM0SrasNVvPLkN
         ESwy8jKjiu6uCK8bk9K41MQX87bi6raF1VD84w2R2JbM6Uz8ji0EniNhssnIa0dVtJrr
         /NhNcDAhSONOutSOrM52IaZF3mbfobk1aX/7IbeHrFRBGM5ro3124ikma370fwv5WaZM
         xp7vII/Q3oeByPVe7vgZDOB6mZohzh0vTXFvmtjhW+z+mhuZbUa0hI4imp+alPnllrzP
         zpIP7xPMbRFuXPAs5TDSgy64uupxDBMjJWLdY2zJNSabzXtPfsskoa88FDCjs1ELJZPj
         GsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=b85HmoU7b97JK+C46GgyWlG+CYZE3kmiSc0PmiJHXGE=;
        b=bZKSueg3cSl0NocSoR4Oqd+eb/Sk7n09zN7ekuYhObzfAuDJhmyz8+oFlXRS1vNFO6
         kCyG1up1/Ds4PcanVxtVWUi+RvRfJ94GZnsmQFv/0ZBtj/Wl9Fq8RYNfJqwj+GYWNk4n
         01Yhnp9Wn8qIEF3pcjmZIhpRyeIp647q4ap5fF0Rq6KqZDPKcZaaqWpQbYJyrCkvG38T
         ugEHf68UszRZJBladJ0pQcS7T4aXwCMd//kYYDdxqudd24I6UwDczlO7zTv61JOpQVUK
         u5+nQYj4UwiEoe2sctLMrKQ3HnkHQWMmM7yKHVCiZKuCScaLWAAgD4ECOVBBPUeJCqNf
         pl5A==
X-Gm-Message-State: APjAAAXwdr4i+VxRw61FQBVD980djs/eg2yUb5L1WPoBIQonInOH2CfP
        WSlvthopDyjOfMV+lzIDWSNjZKah
X-Google-Smtp-Source: APXvYqzxwMzYDpBdfER5tYXW3VkmPB2Owoa+PYfJsoqruXWXXCQLCeVhn3yomrW93IkcQGEeQLm9nQ==
X-Received: by 2002:a63:931e:: with SMTP id b30mr17477267pge.200.1581617857265;
        Thu, 13 Feb 2020 10:17:37 -0800 (PST)
Received: from ziggy.stardust ([37.223.145.31])
        by smtp.gmail.com with ESMTPSA id i6sm3949441pgm.93.2020.02.13.10.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 10:17:36 -0800 (PST)
Subject: Re: [resend PATCH v6 01/12] dt-bindings: display: mediatek: Add mmsys
 binding description
To:     CK Hu <ck.hu@mediatek.com>, matthias.bgg@kernel.org
Cc:     mark.rutland@arm.com, rdunlap@infradead.org, airlied@linux.ie,
        mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
        laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
        linux-clk@vger.kernel.org, drinkcat@chromium.org, wens@csie.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        frank-w@public-files.de, sean.wang@mediatek.com,
        robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
        hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org,
        mbrugger@suse.com, sboyd@kernel.org, sean.wang@kernel.org,
        linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
        enric.balletbo@collabora.com
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-2-matthias.bgg@kernel.org>
 <1575868373.7013.4.camel@mtksdaap41>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <77c9dd91-8f51-499b-3b1a-f5966f2ed35d@gmail.com>
Date:   Thu, 13 Feb 2020 19:17:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1575868373.7013.4.camel@mtksdaap41>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 09/12/2019 06:12, CK Hu wrote:
> Hi, Matthias:
> 
> On Sat, 2019-12-07 at 23:47 +0100, matthias.bgg@kernel.org wrote:
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> The MediaTek DRM has a block called mmsys, which sets
>> the routing and enalbes the different blocks.
>> This patch adds one line for the mmsys bindings description.
>>
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>> ---
>>  .../display/mediatek/mediatek,disp.txt        | 28 ++++++++++---------
>>  1 file changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
>> index 8469de510001..c71c8a4b73ff 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
>> @@ -27,20 +27,22 @@ Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
>>  
>>  Required properties (all function blocks):
>>  - compatible: "mediatek,<chip>-disp-<function>", one of
>> -	"mediatek,<chip>-disp-ovl"   - overlay (4 layers, blending, csc)
>> -	"mediatek,<chip>-disp-rdma"  - read DMA / line buffer
>> -	"mediatek,<chip>-disp-wdma"  - write DMA
>> -	"mediatek,<chip>-disp-color" - color processor
>> -	"mediatek,<chip>-disp-aal"   - adaptive ambient light controller
>> -	"mediatek,<chip>-disp-gamma" - gamma correction
>> -	"mediatek,<chip>-disp-merge" - merge streams from two RDMA sources
>> -	"mediatek,<chip>-disp-split" - split stream to two encoders
>> -	"mediatek,<chip>-disp-ufoe"  - data compression engine
>> -	"mediatek,<chip>-dsi"        - DSI controller, see mediatek,dsi.txt
>> -	"mediatek,<chip>-dpi"        - DPI controller, see mediatek,dpi.txt
>> -	"mediatek,<chip>-disp-mutex" - display mutex
>> -	"mediatek,<chip>-disp-od"    - overdrive
>> +	"mediatek,<chip>-disp-ovl"		- overlay (4 layers, blending, csc)
> 
> This patch conflicts with 5.5-rc, please resend this patch base on
> 5.5-rc1.
> 
>> +	"mediatek,<chip>-disp-rdma"		- read DMA / line buffer
>> +	"mediatek,<chip>-disp-wdma"		- write DMA
>> +	"mediatek,<chip>-disp-color"		- color processor
>> +	"mediatek,<chip>-disp-aal"		- adaptive ambient light controller
>> +	"mediatek,<chip>-disp-gamma"		- gamma correction
>> +	"mediatek,<chip>-disp-merge"		- merge streams from two RDMA sources
>> +	"mediatek,<chip>-disp-split"		- split stream to two encoders
>> +	"mediatek,<chip>-disp-ufoe"		- data compression engine
>> +	"mediatek,<chip>-dsi"			- DSI controller, see mediatek,dsi.txt
>> +	"mediatek,<chip>-dpi"			- DPI controller, see mediatek,dpi.txt
>> +	"mediatek,<chip>-disp-mutex"		- display mutex
>> +	"mediatek,<chip>-disp-od"		- overdrive
>> +	"mediatek,<chip>-mmsys", "syscon"	- provide clocks and components management
>>    the supported chips are mt2701, mt2712 and mt8173.
> 
> The original binding document for mmsys is in [1], I think we should not
> define it in duplicate. Maybe you could remove the original document.
> 
> [1]
> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/mediatek/mediatek%2Cmmsys.txt

I think we should keep it, as it describes some requirements that are otherwise
lost. I'll adapt the  mmsys description and add a hint to it, like we do for dsi
and dpi.

Regards,
Matthias

> 
> Regards,
> CK
> 
>> +
>>  - reg: Physical base address and length of the function block register space
>>  - interrupts: The interrupt signal from the function block (required, except for
>>    merge and split function blocks).
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
