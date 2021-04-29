Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FB336E972
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 13:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbhD2LQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 07:16:51 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:35451 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229792AbhD2LQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 07:16:50 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id c4eDlaqJQk1MGc4eHlQHFU; Thu, 29 Apr 2021 13:16:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619694962; bh=YrojQE9ERQiZNfb7RIe79VsZbxw01qfhdFXpj3i6hGo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DHumpr44aBiQWb/UXwg5d1PH+wSzzQYZO1aj12K0q8l43CJ5Lcl87dEE3T4JnVD5/
         aIZSwVdGjryRoPBcW9EBxKUYjZuEvCSwhxKYP/ChX1qAcd/FuTIMNXlaGDKjYHD3vF
         pvRTY4D8OWvmzbeuCJDy9C/2tb/wDbzMBOjhUt20fpuP5I4X4mJRmPB8frvH6ZolB+
         I0o8PCFcnvGI08Y/QIjxRv4GtAhgL1hBmltgKGpSAK8gVzaybrcgWn4gC5R/kHV0ZL
         9YNVISsL4EVHug9iviScgXMZBgDJoMtPmq/rJvIlTn2MxkV4MwXtKMGlljVl/DaBWn
         HFJ/Ku8i1mQeA==
Subject: Re: [PATCH 1/5] dt-bindings: media: mtk-vcodec: Add dma-ranges
 property
To:     Irui Wang <irui.wang@mediatek.com>, Rob Herring <robh@kernel.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org
References: <20210203083752.12586-1-irui.wang@mediatek.com>
 <20210203083752.12586-2-irui.wang@mediatek.com>
 <20210210225323.GA2961490@robh.at.kernel.org>
 <1614581129.14457.0.camel@mhfsdcap03>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2b97b41c-d5d8-ac32-a9cf-c7bef09ed8ef@xs4all.nl>
Date:   Thu, 29 Apr 2021 13:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1614581129.14457.0.camel@mhfsdcap03>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNrow+hJPzbDwnSzPIM2iA7/r7UP/AhJJatUskZ25uvvarllQW6GBPr2wazwYt9NN71N3GOTusnxmHuukAG4ZvotrrHOVv1QJzl+rOcQ51QRhCgUM1Qn
 M4Anh50GGMSX3hNWob2kxFFJsFPAt+QRqVAJoTwjo7smyyOLDcMJtGyaZ3TgMhtN9V6x+ebu/AQDYYpRyVjeAmaBRIs8OaBe6M3Ab0jMcfr/oGd3yqbFLsWq
 HAB7BJyvNa8uX2DVXaJ40NKBPLSSq9pShFG/Y88QJHXwJo2fQdBA3zT29ORmDgvVbXfP4I73uwejQ09AVB+xnIhm+RchvJ0zHMhP+7OhGw95BY2EeX7WpNk2
 lwkDpd//gfTKnAmrkm7w9Rhc0tidSRMyjq2gOdPGEkSen8s+9g2y+CHUAyGZIUBUOONXTPywleMtQr/7mgCu7NSR3qhyHlTr/WOOrAg5FF+KD9u5vnakyqa9
 Ng89ajdZgRZytq9Cs2obvrBfEVWcZtUQaQ0WU8khZ07re67MwdIcQU9MLMYDn6gfF6SCKbWSZRyMtwJ2mtcEbHF3XFJ9ika1R8Vjr0mLa4fcrl1y6AmZLyal
 l/W8Abl+tyKVObjfMUZdge6lgAIAH9pRUUVJo/qHo8RE4xfCtgF2H5vx2MFNfUVTkYLkaZdrqkN6wbPJB7iEu6FuhQpkR+e2tbeZHRxDk2oRu+bqOjhcC4f/
 5glUCzyJmy9H0WJ8wq4b9D963MgjdPedHi39frvMKOj4nih7X3vR3OdbBj8W7CVBSUAZKz28DHp1oYjFrbnI1cyos4GfvEy1rKm4vuGf53t6bDic+iyrfTYo
 ndwfDRFZZdYSu/jln5U=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On 01/03/2021 07:45, Irui Wang wrote:
> On Wed, 2021-02-10 at 16:53 -0600, Rob Herring wrote:
>> On Wed, Feb 03, 2021 at 04:37:48PM +0800, Irui Wang wrote:
>>> Adds dma-ranges property for DMA addresses translation.
>>>
>>> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
>>> ---
>>>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
>>> index f85276e629bf..e4644f8caee9 100644
>>> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
>>> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
>>> @@ -23,6 +23,8 @@ Required properties:
>>>  - iommus : should point to the respective IOMMU block with master port as
>>>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>>>    for details.
>>> +- dma-ranges : describes how the physical address space of the IOMMU maps
>>> +  to memory.
>>
>> dma-ranges is supposed to be in a bus/parent node.
> Dear Rob,
> 
> The mt8192 iommu support 0~16GB iova. We separate it to four banks:
> 0~4G; 4G~8G; 8G~12G; 12G~16G.
> 
> The "dma-ranges" could be used to adjust the bank we locate.
> If we don't set this property. The default range always is 0~4G.
> 
> Here we don't have actual bus/parent concept here.  And the iova
> requirement is for our HW. Thus put the property in our node.
> 
> Is this OK? If this is ok for you, I will put this message in the commit
> message and binding in next version.

Can you answer Irui's question? Just a reminder...

Much appreciated!

Regards,

	Hans

> 
> Regards
>>
>>>  One of the two following nodes:
>>>  - mediatek,vpu : the node of the video processor unit, if using VPU.
>>>  - mediatek,scp : the node of the SCP unit, if using SCP.
>>> -- 
>>> 2.25.1
>>>
> 

