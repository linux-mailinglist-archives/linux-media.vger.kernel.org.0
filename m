Return-Path: <linux-media+bounces-5492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F77A85B9B7
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 11:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3D1CB23F88
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 10:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B7F657CA;
	Tue, 20 Feb 2024 10:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="iGzX1dRr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8E629FD
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708426599; cv=none; b=Jh0KzL5k0vIP1BCGXHhjZrbUfET8zRx0o7H/4dlgne+D7pjZp2lXDx0LQGDUgunI39Fn2kdibfKgHq+S4FyUh2WBchjGwqOW+yOiD0LqOF4u7g4LmTOWf43QvkCr+UnbhiqGhVdLm5nX99dHe3L7PiKv5PSkY0rXCuiAZS551ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708426599; c=relaxed/simple;
	bh=ItcZXiwx0pn9pwbWyTyXC3iPYxq91O+Pq8jBE7oWMmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PgrPijeJ8ibKQ4Ong2b+3AgFH4bIsYQzP572SVzQwc8BZimGGRkDAdY2U4mlZPderigFSBZxZbpuEEqJBW4nQ7Ihm/HDGmo3bSo6/C1dPI1yIFealo36z/3906vbHJE6YgCHEJ3W9g8s1KCjmEGXAe6CIGIGQCgWl2vARY0bn9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=iGzX1dRr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33ce8cbf465so2577780f8f.3
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 02:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1708426595; x=1709031395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fI4R5r0KNJPe3HSPx51xZM8JsxxzPIp8jg35tmYYxDU=;
        b=iGzX1dRrOK7IDSuLaQ+iomD7+f8cEWldHokAyCrEGXVDogSgK/iuYPH6lf8G+Jq4yn
         qiHtX30RUuYaVC3tsJdoeh2ah0YXPYmN2Xqw2ajxnj3i5qQgPfD6MQr4j3OW40u0AHs2
         hhVFzizTwlG6O/fKhhPinjcPEILFYP+Q+m1+xi7gqMOACPqAA64uzojMu68gTHtcFqgk
         2zIVw/sdR90SJqotZtPeWxyT0xaYD3GwT7K8vZcKn/i/r/vsJiQ9AoBSK9p85nPsmwpf
         Qv5gI1Q1sITf4ZyWQ8M6sEI/EG0svj8fscNYTjWRuXwz5QsduQtm6kgfUQ8yHTK5fSj2
         oApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708426595; x=1709031395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fI4R5r0KNJPe3HSPx51xZM8JsxxzPIp8jg35tmYYxDU=;
        b=Ag9vgi6fi0UbLpwbZdhfU+872QHBB/N7gYyR6LH7vPfhVpt9Z/SIv9dFRMQXVrc92N
         4a6C0inFeFdczucV7AXbFgvbCgVQGD88sIa72FSOiJ2BXP8tC5ZQZ2CqHbmniYNsvDsv
         scYC/jY8OzwDuyZRmUXvXYvPFJESKMzEmRI0+HvX35S9ysvou+eJVc14vddr+9Id3gBf
         4j/PYnJi01D5WFmiHsoGIxqeAW8LogHP1/dbhPoGkLnG0eX9BJ21USFIVKWAgLRsgZFJ
         fT4kGrcqJYAstoV6T44gzrW0lpDY98eo56b2jVbmP/9zCjt0w4n9rB7+Oz2CFgON1FsK
         OcmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+H4NLW+D6ocLDKGtHaob35oHNpdyS23XEdKVOp2lalg4YUF+2FwiWhqrpPwl98iBQdVuGw3wY5gUJ7yr53Gh4mIjXCuPZ9EAx6p0=
X-Gm-Message-State: AOJu0YxclkliHZmusI3bfvGT8atVPq1b8p47oQJxmU7BsmihkAogCUfe
	gGs3yuhsjfEXj5B3TT/du9LxiK2KFHlSgGhCcBr1BDk9vexjm12iEOxa4fROAwk=
X-Google-Smtp-Source: AGHT+IGApatcDJbsg9w739dtr2C68EHiOexix3zbasgEM50vzI9etj5RWluvQJQh4ukw4yzcsKiaVw==
X-Received: by 2002:a5d:5309:0:b0:33d:20f4:def with SMTP id e9-20020a5d5309000000b0033d20f40defmr6830654wrv.59.1708426595328;
        Tue, 20 Feb 2024 02:56:35 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id df2-20020a5d5b82000000b0033d6c928a95sm1430407wrb.63.2024.02.20.02.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 02:56:35 -0800 (PST)
Message-ID: <b8325dbf-67c5-4898-bc23-ff093ae6e14a@freebox.fr>
Date: Tue, 20 Feb 2024 11:56:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: DT <devicetree@vger.kernel.org>, linux-media
 <linux-media@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phh@phh.me>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
 <f6e68756-72a1-4c32-968d-3d6adaa153c9@linaro.org>
 <CAA8EJpq=G21h87W69_4U-BZ=Sa5VEs15Y-zE-G5x9VxVx4qjsA@mail.gmail.com>
 <81dc6452-4039-4eb4-92ba-df248215fca2@linaro.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <81dc6452-4039-4eb4-92ba-df248215fca2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/02/2024 20:24, Bryan O'Donoghue wrote:

> On 19/02/2024 5:44 p.m., Dmitry Baryshkov wrote:
>
>> On Mon, 19 Feb 2024 at 19:29, Konrad Dybcio wrote:
>>>
>>> On 19.02.2024 18:18, Marc Gonzalez wrote:
>>>
>>>> On our msm8998-based device, calling venus_sys_set_power_control()
>>>> breaks playback. Since the vendor kernel never calls it, we assume
>>>> it should not be called for this device/FW combo.
>>>
>>> FWIW, this is also broken on other SoCs.. 8280/8350 and 6115
>>> to name a couple.
>>
>> Then let's just disable it until it gets unbroken?
> 
> Its functional on most of our upstream stuff though, why switch if off 
> unless necessary ?
> 
> Maybe it should be an opt-in instead of an opt-out, TBH my own feeling 
> is its better to minimize the amount of work and opt as per the proposed 
> patch.
> 
> Perhaps the qcom vidc team can give insights on 8280xp and 8350 when we 
> come to tackling new HFI6XX and later SoCs ...

I was wondering if the chosen property name might cause issues later...

Thinking "qcom,no-low-power" might be a bit too general?
Perhaps would need to mention venus somewhere in the name,
to limit this to the video decoder?

Regards


