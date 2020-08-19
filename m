Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E26824A16F
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 16:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbgHSOMy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 10:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbgHSOMv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 10:12:51 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2643C061757;
        Wed, 19 Aug 2020 07:12:50 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 184so2371299wmb.0;
        Wed, 19 Aug 2020 07:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=55r+GV0StXEJZBwRtdXkjylCJHQxIxHaBu6RkMedZ5s=;
        b=n9nVudICteJ8j8jIz2NDG/6H2TmtP0ZZ3sNQu4a4sX+HsPGokvcMPcd5eK/ak7uVzk
         EO4U4x5+otGuSXT/ZlaNT9dAnuFwzmDZy3tU+ppJ34p+5QfcyMiLSodJNeDF429j+Sfs
         FUCYaoTMhssIx2/pI7ONtXMyMKdEhFKxsH8hKDGwIdXQxLNUTaCo7suyeJ63v7CS1uw0
         qYn7p3ADh/49MX/2hE1ErCfPQ6vq+HFRUHFZ43lO8Qm8eGxe2eRCOzseEM+TSPlAfdTN
         s8DvqllDABmt/BkKBewXh/t2WkbJmbIOSdNZlBdFR5SmOTNzJ4dZXnndTNuAS+wOaVHK
         NZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=55r+GV0StXEJZBwRtdXkjylCJHQxIxHaBu6RkMedZ5s=;
        b=JxCzYU1npR4zNn7Wyt4imXZHZZpy6j2cK7Lz5w54k5cT5BzNOn1yQsg19gxy9w6FFc
         bQSzuehUQjY+qRDNboAg0MEDcP3o+jQwnE7NecunnkibCwr0UC3rIXu0qHcPIrUw0ddy
         MJGj0GB5iZu6svZc/KKgBmo7Zbx3ddLpg+hbTyC20ffU28JuMgaUDq2J3+5wz0heCdHq
         Wi9uSi+8Wqudc9sEsiYt4d3sWqNaYN6JGzdovGdc6PQMJmThgeLT30Z7Kvr1bmWj7VKO
         6bPhbSVp0v+t/r5VXKFz+HZnE6RGTgEtBOaz8WM2A68NquSJAmH+C9zysKrplvHl+o6X
         jC6g==
X-Gm-Message-State: AOAM530koOWDgq/vWH6LJoZQl+p/ALJmw1IujyKUFZXD4b/veEn0YckC
        Ho9Y19Y7PYh8gjepC9kgtYI=
X-Google-Smtp-Source: ABdhPJx79OShzlNMo4wqrn3MV3o9egwejruvp6/fPqtC7XwO8xvrjNWbjTttIaLlH12tU80UuPi3AA==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr561763wmj.47.1597846369566;
        Wed, 19 Aug 2020 07:12:49 -0700 (PDT)
Received: from ziggy.stardust ([93.176.180.54])
        by smtp.gmail.com with ESMTPSA id h11sm40724588wrb.68.2020.08.19.07.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 07:12:47 -0700 (PDT)
Subject: Re: [PATCH v12 25/29] arm: dts: mt2701: Add jpeg enc device tree node
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rick Chang <rick.chang@mediatek.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
        senozhatsky@chromium.org, mojahsu@chromium.org,
        drinkcat@chromium.org, maoguang.meng@mediatek.com
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
 <20200814071202.25067-27-xia.jiang@mediatek.com>
 <9a35791d-51f6-2429-5bcc-2149ac1b60c7@xs4all.nl>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <355e2b60-d024-b76c-f0c6-ac599efd2999@gmail.com>
Date:   Wed, 19 Aug 2020 16:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9a35791d-51f6-2429-5bcc-2149ac1b60c7@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 19/08/2020 13:37, Hans Verkuil wrote:
> Hi Xia,
> 
> I made a PR for all other patches of this series for 5.10, so this patch can be merged
> by whoever takes care of these dts patches.

That's me. :)
Patch now applied to v5.9-next/dts32

Thanks!
Matthias

> 
> Regards,
> 
> 	Hans
> 
> On 14/08/2020 09:11, Xia Jiang wrote:
>> Add jpeg enc device tree node.
>>
>> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
>> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
>> ---
>> v12: no changes
>> ---
>>   arch/arm/boot/dts/mt2701.dtsi | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
>> index 8d43a502aada..1c1c2132234f 100644
>> --- a/arch/arm/boot/dts/mt2701.dtsi
>> +++ b/arch/arm/boot/dts/mt2701.dtsi
>> @@ -568,6 +568,19 @@
>>   			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
>>   	};
>>   
>> +	jpegenc: jpegenc@1500a000 {
>> +		compatible = "mediatek,mt2701-jpgenc",
>> +			     "mediatek,mtk-jpgenc";
>> +		reg = <0 0x1500a000 0 0x1000>;
>> +		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
>> +		clocks =  <&imgsys CLK_IMG_VENC>;
>> +		clock-names = "jpgenc";
>> +		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
>> +		mediatek,larb = <&larb2>;
>> +		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
>> +			 <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
>> +	};
>> +
>>   	vdecsys: syscon@16000000 {
>>   		compatible = "mediatek,mt2701-vdecsys", "syscon";
>>   		reg = <0 0x16000000 0 0x1000>;
>>
> 
