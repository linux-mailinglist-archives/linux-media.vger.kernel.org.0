Return-Path: <linux-media+bounces-48822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8302CBFB15
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 21:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DAD83015D22
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 20:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069C933FE34;
	Mon, 15 Dec 2025 19:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OX6SiOSJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E9D33FE23
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765827955; cv=none; b=RrVr7Gkf9lm62ujLOsk2MyO95HviWVhzBXCF/dV6BvgiloeBvUgW6d2ksQ0Qm/dK4pE+l3ZOEA/ZY1Xy5Jg1XS39ZIvtv9vmxIAX4qdB0YcdijqZhJ7ryZIZUeydrgutBpxJuuvsGDsF8EsoZNlQ8MDDjJ4aWW3ftIN1NbxLUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765827955; c=relaxed/simple;
	bh=9g15iSiY0C/hQfAnukHKAcrvJuMMy19SpMq0UV9+W0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPetUHkoxp7sYZZW8/ehh3jLp0Vs4ucOhg7iiRY5vFSGfUy06W3q+dTceJrWW314m3x0EmPQGwXPqSkf5CwtWpL4ccrVY9eMbncOaHJyOA6nPEfXrKXW63asft9kevUkpO91DZSzxtuZpeR10UtWdI43gT+mtLLHKNb0h5412bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OX6SiOSJ; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7c75fc222c3so1862039a34.0
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 11:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765827952; x=1766432752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EC6TchfuPtq0Tx7m8SfOG52/n04Y5VPNN+ycieQYdVI=;
        b=OX6SiOSJGR8s08lTLIDMR4i4SDVe+kg4FFfdi2UqiP4uCMN0GcYwS5yDSWNAIOu9aX
         oPWbsNUaXRxbBN6aqhWGqiSpOritrRlH5sxkvYr2/2UGwPB7Mm/1N3CDwr1olbcVOmMG
         qfkrTg7DBCAetauRbAb+2FZ2PSCSDYvKnZIcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765827952; x=1766432752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EC6TchfuPtq0Tx7m8SfOG52/n04Y5VPNN+ycieQYdVI=;
        b=B7uKPy2CMR8gMX6airQF/XOZ9FaOul2DOa/cQVn1q0N0egl4Uc3HCH0PLU5oCfYQ0L
         mkmvxdUBwr9fmB8NWKPBcbdBe3n2rlO3aoxTLwAHOxZSWPADsyYaxWUZ0vdvujs4NzOW
         VRZ24BpMKnQIJaw001020XUTAAMMgye0o3fcpdhO7QAGBSpGFjhC+YSqprrcjbiS7261
         C3rZlSakT3CqyBQGzbaszftPiI2WFg18E5fvkewsuGiEcl411/+Yonc6KqffMEJP2wuB
         A3qbmeq2BtBdSliUx1kElIcqn5QPIjjLEoHgT4TSDZ0eGkGhmBX+sUgK09DyjbBJgXkR
         CLUg==
X-Forwarded-Encrypted: i=1; AJvYcCUPJLONgOuLE/a4NLXtAR8Q4njssPZhPqJe8kmRB6BKskF7Ra4l3RGw2tAgyaMeAD2DZMSFGc272utPdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6WlEMGmcS+VzY3Qi39TheFmZMN70cyXYN/9TM2rd9KX+KZq0D
	/W/O5rDlyzHUL0oH8h5Ln/UPXYeFBv4h0SdAc64pfKopSqwFG6QlZxbLd5QmSZct68o=
X-Gm-Gg: AY/fxX5+KaUL0bgVkk+awhRn+3LxwhT8WkHO3IH3kY4UghCKLDyGotkYxQsC0vTBzvp
	5slM8Om0fNyP4cOy0xiiXZBxYX3rbHqo4zI0T5NDKXNsMJxRIr8kLuOoVfE4k9ZwujzM4w4zCeU
	f9h303Wuo/ao0hJgi/00p+zrw51VMgfEIfUnsgeJ8ZRRL8Qn3pVRV8qu0jdfOTKCmvZGYsI9EZ0
	3SJ7DdXdwEUG01PbMqcX04UKwNXWHdNm62sPXzRqkBh6SWiNf2wsQWJSEuGy5pWrU75mMaJDiYZ
	WmzxJAgYSRJPVpe+WVYc0U6LEIwkahO6YZE51SGW8o9RQRzl9q/QnufJUMma1IXo2PJTSY/js+r
	xNmPaR//87zbIT6t1/5GEfP4cf0DbNQ8YEkyr0xa0GDqP70a3MY6Yjx+ykYBO/eiSAvJcUevrA9
	U0AuizQYa/oBKnHETkha09KiU=
X-Google-Smtp-Source: AGHT+IH1MZr8tItEQwemOOcHJgkxPz9UKQuo1C18CzRUILzL71v1lnR1aIvKbfEjhEIpCUhLa8KO1A==
X-Received: by 2002:a4a:edc7:0:b0:659:9a49:8e84 with SMTP id 006d021491bc7-65b452c5696mr4437880eaf.84.1765827952432;
        Mon, 15 Dec 2025 11:45:52 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3f614e9991asm5203654fac.21.2025.12.15.11.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 11:45:52 -0800 (PST)
Message-ID: <0f4cc48f-01b8-46f7-9707-aee6de13ee2b@linuxfoundation.org>
Date: Mon, 15 Dec 2025 12:45:51 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: vimc: add RGB/YUV input entity and improve
 pipeline support
To: opensource india <opensource206@gmail.com>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20251120084926.18620-1-opensource206@gmail.com>
 <832f4621-53af-465a-a5e9-f7d65a082481@linuxfoundation.org>
 <CAKPKb8-qyqMmp6c9OnO+AapRRJyE8ygtQUyuUqK8+C0LvMTYTg@mail.gmail.com>
 <CAKPKb8-8ctSewOwBk7fFUMVnb-F_gXnyXS8gd9xJ-fpnW1_ZYA@mail.gmail.com>
 <b5240bd1-eee7-47fd-be70-88435519b12a@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <b5240bd1-eee7-47fd-be70-88435519b12a@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/15/25 12:10, Shuah Khan wrote:
> On 12/8/25 22:04, opensource india wrote:
>> On Fri, Nov 28, 2025 at 8:41 AM opensource india
>> <opensource206@gmail.com> wrote:
>>>
>>> On Thu, Nov 20, 2025 at 10:08 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>
>>>> On 11/20/25 01:49, Pavan Bobba wrote:
>>>>> This series extends the vimc test driver with a new RGB/YUV input entity,
>>>>> pipeline enhancements, and documentation updates.
>>>>> Pavan Bobba (5):
>>>>>     media: vimc: add RGB/YUV input entity implementation
>>>>>     media: vimc: add support for V4L2_FIELD_ALTERNATE in vimc-sensor
>>>>>     media: vimc: debayer: add support for multiple RGB formats
>>>>>     media: vimc: capture: support custom bytesperline values
>>>>>     docs: media: vimc: document RGB/YUV input entity
>>>>>
>>>>>    Documentation/admin-guide/media/vimc.rst      |  39 +++-
>>>>>    drivers/media/test-drivers/vimc/Makefile      |   3 +-
>>>>>    .../media/test-drivers/vimc/vimc-capture.c    |  15 +-
>>>>>    drivers/media/test-drivers/vimc/vimc-common.h |   1 +
>>>>>    drivers/media/test-drivers/vimc/vimc-core.c   |   3 +-
>>>>>    .../media/test-drivers/vimc/vimc-debayer.c    | 113 ++++++++--
>>>>>    drivers/media/test-drivers/vimc/vimc-input.c  | 210 ++++++++++++++++++
>>>>>    drivers/media/test-drivers/vimc/vimc-sensor.c |   9 +-
>>>>>    8 files changed, 352 insertions(+), 41 deletions(-)
>>>>>    create mode 100644 drivers/media/test-drivers/vimc/vimc-input.c
>>>>>
>>>>
>>>> Kieran and Hans, Do you have any feedback on this patch series?
>>>>
>>>> thanks,
>>>> -- Shuah
>>>>
>>>
>>> Hi Kieran and Hans,
>>> can you please review?
>>
>> Hi team, can someone please review?
> 
> I will send these up in my pull request to Mauro - it might be
> later in December of early January.
> 

Applied to git@gitolite.kernel.org:/pub/scm/linux/kernel/git/shuah/linux vimc branch

thanks,
-- Shuah


