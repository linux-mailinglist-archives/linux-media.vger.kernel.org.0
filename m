Return-Path: <linux-media+bounces-1794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C78082BE
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 09:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A42B9283BDB
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 08:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AE3219ED;
	Thu,  7 Dec 2023 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSW8zgWr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2971700
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 00:19:05 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-333536432e0so593359f8f.3
        for <linux-media@vger.kernel.org>; Thu, 07 Dec 2023 00:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701937144; x=1702541944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lxIIeFXm3HLs/BlQvnqjwBqZ1r9Iv7H+PUcijZaIuwA=;
        b=hSW8zgWrAun/E9ao/V0J6NT92ijvYSObswMxsYCPhpZrETz1NMy/0sv8Wa6PleyP9A
         vQuFp9HHQ4xeJLnvHp/1UG7MIejR8qKel9iIwZDI3tdiwj/BfZl1peF/eu0ASllCr9nI
         QaWnuoVMZ2iM3akjp9P1E7e2ZzZOX8uIGbxyve5fZezMssSDkLsPwNRC22IvuA+Dcoq1
         HhhNR2FFp9GTJSpX+MX305RJiXqkzYNz7Mss6ct/H+t1o2rv58enSXkZ7lXVYbKV509B
         5h56SFsw/4adGuTDtRwQTOy4wQABcc3LPc1jT2MkAiHc3zVDJZfAUcKT/EpqkYN3uR/G
         KLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701937144; x=1702541944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lxIIeFXm3HLs/BlQvnqjwBqZ1r9Iv7H+PUcijZaIuwA=;
        b=MZ9Pt5yKgF/ecufxKpnbEHT/Z0m/D4X2RIuIxPr+fWY4JxGcjP8svnvVvX8fzPf6Ou
         Q8O2yEzpbJn47jc/q1hcti7jbcX8pIeRTLyvzpMuKTZRlu++rT4X3z/Bty6qXG36Zd9Y
         UY1c6U5Kv1u4E6FU7Ram5QkAIT7mnJGto/xMRpEJs8Igq4S/jLhqyqYhh0W7i3T6fFX7
         6W8i1yIPH62f3YYdfQhOboJH5dBpi2EM9idJIiC6P16CdmFu94IC6OdhDlhakfluT66B
         J5Bn/G0Msrlkyn8YneSfGiqe4w1YppTAOBVbtDTmiJXFLVYy7aJfwyum+xjlD//xAJql
         B1LA==
X-Gm-Message-State: AOJu0Ywqw/hrkJOduo0s1BPSgEW22HROJGR9S63xMtpYGrE53EXASnhF
	rXon9MXf7QAGvYLdOUpS285jvg==
X-Google-Smtp-Source: AGHT+IFQaRoO6sIgPcoZzJLqeoaQrgc/wUBzmml+tKRLY/qUhZXV47yh3BKlJ55aMJODV69Yl1HVAg==
X-Received: by 2002:adf:e443:0:b0:333:2dde:2e6f with SMTP id t3-20020adfe443000000b003332dde2e6fmr1247477wrm.54.1701937144267;
        Thu, 07 Dec 2023 00:19:04 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id o13-20020adfe80d000000b003333d46a9e8sm765592wrm.56.2023.12.07.00.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 00:19:03 -0800 (PST)
Message-ID: <c8e0ff23-9464-441d-bcaa-485a3eca0fcd@linaro.org>
Date: Thu, 7 Dec 2023 09:19:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: i2c: Add support for GC08A3 sensor
Content-Language: en-US
To: Zhi Mao <zhi.mao@mediatek.com>, mchehab@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: shengnan.wang@mediatek.com, yaya.chang@mediatek.com, 10572168@qq.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yunkec@chromium.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jacopo.mondi@ideasonboard.com,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, heiko@sntech.de,
 jernej.skrabec@gmail.com, macromorgan@hotmail.com, linus.walleij@linaro.org,
 laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net,
 andy.shevchenko@gmail.com, bingbu.cao@intel.com,
 dan.scally@ideasonboard.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231207052016.25954-1-zhi.mao@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231207052016.25954-1-zhi.mao@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/12/2023 06:20, Zhi Mao wrote:
> This series adds YAML DT binding and V4L2 sub-device driver for Galaxycore's
> GC08A3 8-megapixel 10-bit RAW CMOS 1/4" sensor, with an MIPI CSI-2 image data
> interface and the I2C control bus.
> 
> The driver is implemented with V4L2 framework.
>  - Async registered as a V4L2 sub-device.
>  - As the first component of camera system including Seninf, ISP pipeline.
>  - A media entity that provides one source pad in common.
>  - Used in camera features on ChromeOS application.
> 
> Also this driver supports following features:
>  - manual exposure and analog gain control support
>  - vertical blanking control support
>  - test pattern support
>  - media controller support
>  - runtime PM support
>  - support resolution: 3264x2448@30fps, 1920x1080@60fps
> 
> Previous versions of this patch-set can be found here:
>  v1: https://lore.kernel.org/linux-media/20231123115104.32094-1-zhi.mao@mediatek.com/
> 
> Changes of v2 mainly address comments from Krzysztof/Rob Herring&Conor Dooley.
> Compared to v1:
>   - Fix some review comments  

What exactly fixed? This cannot be that vague!



Best regards,
Krzysztof


