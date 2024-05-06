Return-Path: <linux-media+bounces-10892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE17A8BD0BF
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A2D928DC47
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0845315380D;
	Mon,  6 May 2024 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="b2tbhVl4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3BA154433
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715007068; cv=none; b=fQbcAtPeUslFquHJg7qaV6QajMyIZSvv4ArFNKxeyiFmqKCqqosue1boAjJUowMhQ2zHQ+6hslPuRpsUFk0ihmRQ3HXmJerVUU3TZIz0ecwtABafhb6FNHYW46lxsRZ443rcI/lrqunFDRefn5bExiGCNrtN5THccEQiDFf0Lvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715007068; c=relaxed/simple;
	bh=7iDH+N4dqEAyUlSQDlKArZom8EBUBD3poBUiJ60lMGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b61r+mGisGpMPsP0yHYZCqJAxs6FUZbsxOl8eU92m2cqtOWbkJk4eJ8fL0hOxqhzramwZaEaL6zY4hEWyv0QQeLgoghw6xt9TKOdQfUdcPpi+slYKqX2bF0iLfhrntFeCdA+KYvB2xYCf99DfVcVaqqDg8fQgqRKuFmBU+eUefM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=b2tbhVl4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34db6a299b2so1814727f8f.3
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 07:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715007063; x=1715611863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s25nNsZfQA5RmRKiUCh/t8nrLzDrKkJ43LxgVyizmD4=;
        b=b2tbhVl4XNL7z9VJm8J6AJqim28IW0jhxwkWTsAx/md/NspgjIJYek9Qeay56dXMw+
         ZhR21uaOU4j5tv2gHf2bYFv6TYZ5+WqraxA5LQt4lK/u1qZrePN9EZjLRz2FjWNsk2ZW
         yZHiYYXlO2kN4RraJY6RPHwX41hcaSYMs3IfEOPIO9HT9vjtj6KcZCU5DUalG960k4Qt
         Bqszzh53ABam5xddvbnNIzX60v2fEJqtTS9FzDY5Mf8xJhEPp8xoc5zvF7jfpu2X20ox
         9OhucEs4gsMrE8JRyPyhn70BblHeYvs84LnIvMY41sKqTn7bE30ckx7oXtp4nrs6gu8t
         5bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715007063; x=1715611863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s25nNsZfQA5RmRKiUCh/t8nrLzDrKkJ43LxgVyizmD4=;
        b=KUIAKlxwFMSDV5BO4ixxuiKHEQyfMW1i6MsR2QJLFSzjZo/ekwdA+DfDsuvp2td/Iv
         0JxTZnPt6J/ab41VOdOtaQkhallWSfcErttipiX79RMn1w58KxCQq00HgHCTZJ7ZnySI
         ygwkq3xzFaVzhUBXNx7Bb7/99h40/HEsJkxzzn2Aub2my62+C3MMyooXf8ZCVpUOAZuJ
         QTZ9P4N4p0bYu90PAOt0y8XeuqLEudvSN5VzuaCwMxcxNYpsIwn6Q459NOSkUS8dAqDV
         aU5qThRucpeW//Q9fqe9b8d5TQ1TKuvgcrx/FHze84JNqeajkzxPtJJCEGGg6msvEize
         IEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7nNdocRPjur4LffvlSrJZouYN1CDLiiKg0+6Id2jN7U0sfeWaXGQcudVfQ8l1g+empXZQV/iXiVZH3qJS0JWFSuduzVLnfByJMUs=
X-Gm-Message-State: AOJu0YztKk87K6bUi4nrwEVeuOF3XG3m//X7AuNuJZpXmcrCj/XTa/W6
	Q6Xw5I7bgvT8YfjMXZCSMxgckRQgtM07YzCwkkpUSSpFYtVze8WY/LCDFIoOkSA=
X-Google-Smtp-Source: AGHT+IFoP4sD7V1fmiJRQwVHulmnwjUmlkDpvPyjrs2aw3izXS0DOoteipwwYPOAeJK5o2JUSbOdWA==
X-Received: by 2002:adf:a29e:0:b0:34d:99ac:dcd0 with SMTP id s30-20020adfa29e000000b0034d99acdcd0mr6277700wra.49.1715007063674;
        Mon, 06 May 2024 07:51:03 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id v6-20020a5d6106000000b0034d743eb8dfsm10852322wrt.29.2024.05.06.07.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 07:51:03 -0700 (PDT)
Message-ID: <4349e7ea-380d-4c91-83be-d74983e2cdb0@freebox.fr>
Date: Mon, 6 May 2024 16:51:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: venus: add msm8998 support
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <72860c1d-7434-4be6-8c1d-9ea177602802@freebox.fr>
 <14bda891-5035-433c-888e-b3c330eeffaf@freebox.fr>
 <803b267b-9171-8234-aa3a-fba0d738a64d@quicinc.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <803b267b-9171-8234-aa3a-fba0d738a64d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2024 16:43, Vikash Garodia wrote:

> On 5/6/2024 7:17 PM, Marc Gonzalez wrote:
>
>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>
>> Add the missing bits for msm8998 support.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>  drivers/media/platform/qcom/venus/core.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index ce206b7097541..064120127cb86 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -554,6 +554,9 @@ static const struct venus_resources msm8916_res = {
>>  	.fwname = "qcom/venus-1.8/venus.mbn",
>>  };
>>  
>> +/*
>> + * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blame/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8996-v3.dtsi#L403-414
>> + */
>
> There is no need to add the link to downstream code in comments. Please remove them.

They are needed somewhere, to double check the values.
Otherwise, it's just voodoo programming.

If not in the code, then maybe in the commit message?

Since qcom doesn't publish datasheets, downstream code
is the best we've got.

Regards


