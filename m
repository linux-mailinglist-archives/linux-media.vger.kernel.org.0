Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E080615D73C
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 13:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbgBNMTe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 07:19:34 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44828 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbgBNMTe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 07:19:34 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 5E10528D7ED
Subject: Re: [PATCH v7 01/13] dt-bindings: arm: move mmsys description to
 display
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, matthias.bgg@kernel.org
Cc:     mark.rutland@arm.com, airlied@linux.ie, mturquette@baylibre.com,
        dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
        ulrich.hecht+renesas@gmail.com, linux-clk@vger.kernel.org,
        drinkcat@chromium.org, Weiyi Lu <weiyi.lu@mediatek.com>,
        wens@csie.org, mtk01761 <wendell.lin@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>, frank-w@public-files.de,
        sean.wang@mediatek.com, robh+dt@kernel.org,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        Matthias Brugger <mbrugger@suse.com>, sboyd@kernel.org,
        rdunlap@infradead.org, linux-kernel@vger.kernel.org,
        p.zabel@pengutronix.de
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
 <20200213201953.15268-2-matthias.bgg@kernel.org>
 <1581662577.17949.3.camel@mtksdaap41>
 <2bda2dd7-9ed2-8b4c-897e-e585ccfa1fa5@gmail.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <022e8f64-b414-67a5-722e-bdd7c00230ff@collabora.com>
Date:   Fri, 14 Feb 2020 13:19:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <2bda2dd7-9ed2-8b4c-897e-e585ccfa1fa5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi CK,

On 14/2/20 11:01, Matthias Brugger wrote:
> 
> 
> On 14/02/2020 07:42, CK Hu wrote:
>> Hi, Matthias:
>>
>> On Thu, 2020-02-13 at 21:19 +0100, matthias.bgg@kernel.org wrote:
>>> From: Matthias Brugger <mbrugger@suse.com>
>>>
>>> The mmsys block provides registers and clocks for the display
>>> subsystem. The binding description should therefore live together with
>>> the rest of the display descriptions. Move it to display/mediatek.
>>>
>>
>> Yes, for the upstreamed driver, only display (DRM) use mmsys clock. For
>> some MDP patches [1] in progress, MDP also use mmsys clock. So we just
>> consider what's upstreamed now?
> 

Let me jump into the discussion, and sorry if my question is silly because I'm
just starting to look at this code.

IMO we should consider all the cases to find a proper fix on all this, and if
MDP uses also mmsys clocks this approach will not work. I think the main problem
here and the big question is what exactly is the MMSYS block, is an independent
clock controller that provides clocks to DRM and other blocks? or is hardly tied
to the DRM block in some way?

Could you give us a block schema on how the things are interconnected?

If is an independent clock controller I think there was a mistake when the first
drm driver was pushed by using the compatible = "mediatek,mt8173-mmsys" as id
for that driver.

Thanks,
 Enric


> I'm not sure if I understand you correctly. Are you proposing to keep the
> binding description in arm/mediatek?
> 
> Regards,
> Matthias
> 
>>
>> [1] https://patchwork.kernel.org/patch/11140747/
>>
>> Regards,
>> CK
>>
>>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>>>
>>> ---
>>>
>>> Changes in v7:
>>> - move the binding description
>>>
>>> Changes in v6: None
>>> Changes in v5: None
>>> Changes in v4: None
>>> Changes in v3: None
>>> Changes in v2: None
>>>
>>>  .../bindings/{arm => display}/mediatek/mediatek,mmsys.txt         | 0
>>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>>  rename Documentation/devicetree/bindings/{arm => display}/mediatek/mediatek,mmsys.txt (100%)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
>>> similarity index 100%
>>> rename from Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>>> rename to Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
