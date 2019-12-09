Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2610C116895
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 09:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbfLIIsY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 03:48:24 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39264 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbfLIIsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 03:48:24 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 4B35028D7A3
Subject: Re: [resend PATCH v6 01/12] dt-bindings: display: mediatek: Add mmsys
 binding description
To:     CK Hu <ck.hu@mediatek.com>, matthias.bgg@kernel.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        airlied@linux.ie, mturquette@baylibre.com, sboyd@kernel.org,
        ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com,
        sean.wang@mediatek.com, sean.wang@kernel.org,
        rdunlap@infradead.org, wens@csie.org, hsinyi@chromium.org,
        frank-w@public-files.de, drinkcat@chromium.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mbrugger@suse.com
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-2-matthias.bgg@kernel.org>
 <1575868373.7013.4.camel@mtksdaap41>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <dec02ff4-6627-2755-b05b-2ab0560feee7@collabora.com>
Date:   Mon, 9 Dec 2019 09:48:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1575868373.7013.4.camel@mtksdaap41>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Matthias,

On 9/12/19 6:12, CK Hu wrote:
> Hi, Matthias:
> 
> On Sat, 2019-12-07 at 23:47 +0100, matthias.bgg@kernel.org wrote:
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> The MediaTek DRM has a block called mmsys, which sets
>> the routing and enalbes the different blocks.

Typo s/enalbes/enables/

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
> 
> Regards,
> CK
> 
>> +
>>  - reg: Physical base address and length of the function block register space
>>  - interrupts: The interrupt signal from the function block (required, except for
>>    merge and split function blocks).
> 
