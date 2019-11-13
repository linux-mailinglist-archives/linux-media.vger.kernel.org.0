Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5C9FBA03
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 21:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfKMUg1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 15:36:27 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41966 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfKMUg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 15:36:27 -0500
Received: by mail-wr1-f66.google.com with SMTP id b18so2452877wrj.8
        for <linux-media@vger.kernel.org>; Wed, 13 Nov 2019 12:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x9fl66UoRdW53QwPvMaDo94YOf2w49q/cf3RdWGDGHA=;
        b=T5T49n+OebYXNkSrEk/3Yz/Uzmjo+6Lg/Dfv7owJIcmSmc2OGTtUeFVVRA05jcxoJR
         Zx8WvIaGfn+glOXXHrDrAZW5TvzzJbmiFlIVA9mJwzF4qlXBtsZTsxNUhSv8wXbekW/h
         L+K0m2/9YaXQDtNrvriSKFnTPyg4YzyqmrgKbcHAaXGb5RJpukQdHClhzcDEJUoMskCy
         xwJr2ERpV0fzAz55YP7fOC7zy1i8tyi3Wt/ggcl0orKT++dIUVT0Q8C7wEBgAKTMD2Jq
         AdD7ICWcAI6CUphbrB38r9H1BxJFL1FiCGkY7LDqTyNfKLPqiNPosG9OXZlkWBZ1NZi8
         ZwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=x9fl66UoRdW53QwPvMaDo94YOf2w49q/cf3RdWGDGHA=;
        b=Yz14Izz7emMZBNA/Zb7DB/aq0v/lsl/Iz20dC95bYWXrhQSXhz5oMOWwWtErAteeLm
         iGqTVJSI6us9F0ErKqs18rVn0SvuaZmks6VFRXlq0Kw7BSLu4CqYVtDwsRPG8XYNCO/h
         7QdQi2x/1EyZfZcj4VmuSjUwyBNhVJy3UFrVdvgGdBrT3oPcAJKzYuV5Z19VLuThIM/3
         BBET2fR2DrXCdpsUzp8/Cf4mPplUjbqLQUPQmjq2TqLrB/HZHrcf7+29rPo5qkY391xm
         7ll2qyXhfo0dj8sav+qJBPOnhiV3vlT4Uuy5gupqeUN/4j3ASvVpi613wOhEIisYUL82
         vZ/Q==
X-Gm-Message-State: APjAAAUNNRls/W9VjfTrhNknrKm85GRbAFjON81etq/M9v11dPT3KQgP
        Yzb267gUk8dqBYx+wWsQQwk=
X-Google-Smtp-Source: APXvYqypx3VBKK3F36rmf/SYeNEwXWs5Os6CImBl6k7WTtL08lVV4tJBsedKiQddOK8OjBDjrX5Ong==
X-Received: by 2002:adf:8481:: with SMTP id 1mr5104984wrg.189.1573677383310;
        Wed, 13 Nov 2019 12:36:23 -0800 (PST)
Received: from [192.168.1.19] (bdu159.neoplus.adsl.tpnet.pl. [83.28.6.159])
        by smtp.gmail.com with ESMTPSA id d11sm4252093wrn.28.2019.11.13.12.36.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Nov 2019 12:36:22 -0800 (PST)
Subject: Re: [PATCH 0/5] v4l2 JPEG helpers and CODA960 JPEG decoder
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
 <e65ca03c095c99dc8482e9c36dcd099b6c69fc38.camel@collabora.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <35d04054-0ad4-4f4b-961a-2795e6f5cfa1@gmail.com>
Date:   Wed, 13 Nov 2019 21:36:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e65ca03c095c99dc8482e9c36dcd099b6c69fc38.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp, Ezequiel,

On 11/13/19 8:42 PM, Ezequiel Garcia wrote:
> Hi Philipp,
> 
> Thanks a lot for working on this. I'm so glad about
> both efforts: the CODA JPEG support and the JPEG
> helpers.
> 
> On Wed, 2019-11-13 at 16:05 +0100, Philipp Zabel wrote:
>> Hi,
>>
>> as far as I can tell we currently have three JPEG header parsers in the
>> media tree (in the rcar_jpu, s5p-jpeg, and mtk-jpeg drivers). I would
>> like to add support for the CODA960 JPEG decoder to the coda-vpu driver
>> without adding yet another.
>>
>> To this end, this patch series adds some common JPEG code to v4l2-core.
>> For now this just contains header parsing helpers (I have tried to keep
>> the terminology close to JPEG ITU-T.81) that should be usable for all of
>> the current drivers. In the future we might want to move JPEG header
>> generation for encoders and common quantization tables in there as well.
>>
> 
> Indeed, moving encoders to use these helpers sounds like the right thing
> to do. IIRC, quantization tables are implementation defined, and not imposed
> by anything. I believe gspca drivers use some tables that don't follow
> any recomendation.
> 
> I guess it's fine to leave some drivers unconverted, without using any helpers,
> and move others to use a helper-derived quantization table.  

I fully agree here. I don't have longer access to Exynos4x12 and 3250
based boards to test the patches and the volume of changes allows
to assume that not everything will go smoothly. That can lead to
unpleasant hangups during decoding, caused by not arrived IRQ when
e.g. unsupported JPEG->raw format subsampling transition is requested.

>> I have tested this on hardware only with coda-vpu, the other drivers are
>> just compile-tested.
>>
>> Feedback very welcome, especially whether this actually works for the
>> other drivers, and if this could be structured any better. I'm a bit
>> unhappy with the (current) need for separate frame/scan header and
>> quantization/hfufman table parsing functions, but those are required
>> by s5p-jpeg, which splits localization and parsing of the marker
>> segments. Also, could this be used for i.MX8 JPEGDEC as is?
>>
> [..]
> 
> Regards,
> Ezequiel
> 
> 

-- 
Best regards,
Jacek Anaszewski
