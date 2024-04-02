Return-Path: <linux-media+bounces-8445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7B4895EBD
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 23:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32BF21F2334C
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 21:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73C015E816;
	Tue,  2 Apr 2024 21:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyINgnah"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26D215AAA7;
	Tue,  2 Apr 2024 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712093665; cv=none; b=sIbDXM5MqGtUog+s0xMJQqA94MI43NldgNa/o3W0pIYezsk09ctkkzWXwY3CwVf0tXi468C8rrCfni5Cx1TaaFVaclMaW7xBplcHrD3gcCuKJG/zNA76leUEwbZZmOtvla2437AOCN0aXEnpxeQCKh1HEvx/juyrSgmTaOvxo4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712093665; c=relaxed/simple;
	bh=NjpIe6N/SjAHimlEZIFmqpF22iAML1hvrDFwu3YoWkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPbpmLuPKSHfuv+BfjtqNclfKVqqewHfjy0Kc6FOpiHBOHIInKuiFCd6V7RDuBasg14YJ4WBdHHNYIYRfKKsruQAtw54Odc9jRZ3orTDMJLHh+Fmm3NmtAeSf+ZiiDrFnFTEr8qoBFOyjy4Y842HgcNkBTU20HBMyY95MrtehNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyINgnah; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-78a15537fa1so325898185a.1;
        Tue, 02 Apr 2024 14:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712093663; x=1712698463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmUrXqgBLSwLeRFDcbqii1ejScsAkMPF6OIvnfTquKU=;
        b=iyINgnahg/cvJILglrR3JAgsqn7Cg8Y2wTk2Rm+w/3u0G/cbP3AlCNbWEsswUH+My8
         Nwx5a3W3pPKAc1Ik/6+WbCcZ465HAWJ6cbJVn6C6yProEu0RubYZn50a9bh0GNv2zXsL
         5am4nacgVkENzQtirdZQAWjWFoY2yskDc4I/ic8mZMEmzFpjBSN3RvFx+O/IgS22WM0L
         AVuyurVRkV7odIylE2nI8JHZ08o+jBnap4DXWr0z0Yzp4dtQ1qAADHRtuh0MwRzU0e24
         LsHkVy/lfskKu3zqwpVDXrVCguWfQrGipglndLUquztNngjT6joIDxhQ9LykIsDXSHrK
         da/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712093663; x=1712698463;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmUrXqgBLSwLeRFDcbqii1ejScsAkMPF6OIvnfTquKU=;
        b=Bg6h0kIsYfD48O3EDmeuOoTlmr5TKQKhfPW5ss0yOu4mPbqyuno79O3tO0vKZa2LLp
         qufehVYZY3u5UwTSUtZa29BAfL9aAwlQe/8lRQ04WPeRiIAJPJOGjOHS+3huiLWfEcBH
         mR3CJmUjTrCn00rVFh0GveSBX3sFHO6hZThaPhWTkR79Uk+oVW4uBguy2owB3Mc5Q3kg
         Dlq8SjEgc25tTh2otEJGxWw7MIR6Tlggak7E8QZ5iB9Ks5qu/Z1H6yx2haXizi6swYy5
         p7zvbnLdBtP5NweHtwTyyL7GfQYsgt9Zsgyk1I3Qz4Z00mKJ1fvxkHsPz4dnOstROnVE
         8s9g==
X-Forwarded-Encrypted: i=1; AJvYcCWL+IIpQGeNjOveXtAaHmJoxvttDspkUPQgb7ILrH46Ui+vhcXnwuV77DXOQUiuLT69v1vGg5+vqpmlwMowjY89yx5q9PZuUS3JPw==
X-Gm-Message-State: AOJu0YyrQ8Q3oBfcM+AVcieZLwlMuInxppWWiYjr9YRdcTvCCGJ+V0oe
	Xk4veowyxtNdOXiKKNnUyWH5iKNUbhon3H9dnlawDtn4QuTNKpVh
X-Google-Smtp-Source: AGHT+IHdcmwFVens/o0b2BRQANLWOp/APwLFozlCwlp9tqu+G56ATKP4O0XN6DTgq4u+ZpuqM9DVlQ==
X-Received: by 2002:ae9:e607:0:b0:789:e28c:d73 with SMTP id z7-20020ae9e607000000b00789e28c0d73mr14294590qkf.49.1712093662714;
        Tue, 02 Apr 2024 14:34:22 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id t7-20020a05620a034700b0078bd1dc41c0sm3161382qkm.26.2024.04.02.14.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 14:34:22 -0700 (PDT)
Message-ID: <68b60c5d-3027-4a94-8f15-aed7c9b000bb@gmail.com>
Date: Tue, 2 Apr 2024 14:34:13 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] media: Add driver for the Raspberry Pi <5 CSI-2
 receiver
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-media@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Naushir Patuck <naush@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, kernel-list@raspberrypi.com,
 linux-rpi-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
 <20240402001111.GA4761@pendragon.ideasonboard.com>
 <0f5bc6e1-a8d8-4067-bd02-b3ec570f2936@broadcom.com>
 <20240402205310.GC16740@pendragon.ideasonboard.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240402205310.GC16740@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/24 13:53, Laurent Pinchart wrote:
> On Tue, Apr 02, 2024 at 01:46:44PM -0700, Florian Fainelli wrote:
>> Hello Laurent,
>>
>> On 4/1/24 17:11, Laurent Pinchart wrote:
>>> Hi Florian,
>>>
>>> I think patches 05/10 ("ARM: dts: bcm2835-rpi: Move duplicate
>>> firmware-clocks to bcm2835-rpi.dtsi"), 07/10 ("ARM: dts: bcm2711-rpi:
>>> Add pinctrl-based multiplexing for I2C0"), 08/10 ("ARM: dts:
>>> bcm2711-rpi-cm4-io: Add RTC on I2C0") and 09/10 ("ARM: dts:
>>> bcm2711-rpi-4-b: Add CAM1 regulator") are ready for you to merge. This
>>> would help reducing further iterations of this series.
>>
>> I could not locate the base commit this series was posted against
>> (58abf3672a73558149fa567eafff8d5b1cc0446b), so patch 5 unfortunately did
>> not apply cleanly due to v6.9-rc1 still having a "dma-ranges" property,
>> fixed that up and the rest applied fine.
> 
> The base is in the rpi/v6.9/unicam/next branch of
> https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git.
> This series applies on top of the 3 DT drive-by fixes I've sent
> separately.

Ah Ok, then I will swap the order in which I applied them locally. Thanks!
-- 
Florian


