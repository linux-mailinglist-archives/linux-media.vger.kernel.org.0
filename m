Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FA43B4DB7
	for <lists+linux-media@lfdr.de>; Sat, 26 Jun 2021 10:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhFZIvj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Jun 2021 04:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhFZIvj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Jun 2021 04:51:39 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAE0C061574
        for <linux-media@vger.kernel.org>; Sat, 26 Jun 2021 01:49:17 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id v20-20020a05600c2154b02901dcefb16af0so7346699wml.5
        for <linux-media@vger.kernel.org>; Sat, 26 Jun 2021 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8hyjQG/8ZtR+zruu+pHjSC1nQQI21DGhQRwkVFXoSLs=;
        b=XmeXV5K1USPCFgWA/8f13fc1KVYPgTnaaUeQi6N6ZwayImqP42h7MRLmFwpmlBuZO+
         so98kwpLh9Ifkq0TwJkz4aBxdzubgwlHvTeeKXw/kvzhX99Br9fPxtd79BpDK9GqWM2U
         9CF4LMNLvNvusSUcQQLQYKa4B76XOaU7MwJiI/66/1sEvBf6luhD0Hjzxy80iAqmGLoR
         SaQ7MYGE6qrxFsjSmNre0lIAYgUoDfgSu32cQn9uVpvscyeHomu0zajomV6kOYX6OVJL
         UJkE465HnJtJ1yP2VyrjkYNHhaDL9CsOy6iVjFHfQS1xuLDk9EscxW2UGpBoOANlVUf9
         bRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8hyjQG/8ZtR+zruu+pHjSC1nQQI21DGhQRwkVFXoSLs=;
        b=jYBkz8KNWt7N4z4ZLzgsfEGKES6uPQ9e0btnLnxC8y4Y42Zg6JGPXBea3lDQvfZvFY
         HDmvgDWBq33/KacEdCtVc6I2o3KA+gbP/gLAMGa6qmS2aEYxe5SuWHpNI35BGPmORSua
         XRvk2efNvDWKdDbwt3cipwCTMotNXcgTtibNEBNiZPHZi5gF4Y+T5GeNxxiWnrgSeqnQ
         2A4Dx9EEzR+Y0S2nXRIF3s72rgJAZJv8TjCzkQFpNTUpE5QKOghlCfv+MO9MHSP8x/Ks
         OMtNtskW+U32jHn88nInP5Hu7wrifLcUAVpzIpDNdx0d7xO2ryPvhCqh5FnHVGghNauY
         7Dcg==
X-Gm-Message-State: AOAM532Aafa+loMQ7GnEJhCJprYH3gAnSeI9c3cW6AatfLvEsI3p1HxI
        obcPjVO5yX0F0VypmZYN+w==
X-Google-Smtp-Source: ABdhPJyMocTcpeFQS+yBf05Omw7Y8Z4YKA7ZhlBw7Emox3gLjmdxe1H1PtGJF2w/epn05UHPytCPaw==
X-Received: by 2002:a1c:df09:: with SMTP id w9mr15326740wmg.91.1624697354057;
        Sat, 26 Jun 2021 01:49:14 -0700 (PDT)
Received: from [192.168.200.247] (ip5b434b8b.dynamic.kabel-deutschland.de. [91.67.75.139])
        by smtp.gmail.com with ESMTPSA id q6sm13412798wma.16.2021.06.26.01.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jun 2021 01:49:13 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH 10/12] dt-bindings: media: rockchip-vpu: Add PX30
 compatible
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>, kernel@collabora.com
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-11-ezequiel@collabora.com>
 <176dce10-8e8c-b34b-8b9c-1a0a6a5501ba@collabora.com>
 <4445849f5c93b886db207a190d4931fba0ef6b14.camel@collabora.com>
Message-ID: <aedc8b01-f891-ba8f-b1f3-82918cb87f09@gmail.com>
Date:   Sat, 26 Jun 2021 10:49:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4445849f5c93b886db207a190d4931fba0ef6b14.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Am 26.06.21 um 02:47 schrieb Ezequiel Garcia:
> Hey Dafna,
>
> Thanks a lot for reviewing this.
>
> On Fri, 2021-06-25 at 12:21 +0300, Dafna Hirschfeld wrote:
>> Hi,
>>
>> On 24.06.21 21:26, Ezequiel Garcia wrote:
>>> From: Paul Kocialkowski<paul.kocialkowski@bootlin.com>
>>>
>>> The Rockchip PX30 SoC has a Hantro VPU that features a decoder (VDPU2)
>>> and an encoder (VEPU2).
>>>
>>> Signed-off-by: Paul Kocialkowski<paul.kocialkowski@bootlin.com>
>>> Signed-off-by: Ezequiel Garcia<ezequiel@collabora.com>
>>> ---
>>>    Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>>> index b88172a59de7..3b9c5aa91fcc 100644
>>> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>>> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>>> @@ -28,6 +28,9 @@ properties:
>>>          - items:
>>>              - const: rockchip,rk3228-vpu
>>>              - const: rockchip,rk3399-vpu
>>> +      - items:
>>> +          - const: rockchip,px30-vpu
>>> +          - const: rockchip,rk3399-vpu
>> This rk3399 compatible is already mentioned in the last 'items' list, should we add it again?
>>
> What we are mandating here is that "rockchip,px30-vpu" can only be used
> with "rockchip,rk3399-vpu".
>
> I.e.:
>
>    compatible = "rockchip,px30-vpu", "rockchip,rk3399-vpu";
>
So why not making the already existing to:

       - items:
           - enum:
               - rockchip,px30-vpu
               - rockchip,rk3228-vpu
           - const: rockchip,rk3399-vpu

Alex
