Return-Path: <linux-media+bounces-11319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5354A8C2554
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C571F2378E
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 13:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C00129A8D;
	Fri, 10 May 2024 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="crVkqiIA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EAA127E01
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 13:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715346081; cv=none; b=nWqbwnC6FteYaXPkUAU4hI5YC/lxNdCNHuj4nfccQKAclModn7V+QlkWt4PksQoIRKdNLiZ8e8dwnEu/6UcGt0Aj3z0XAw54btstnf9GuMG+ET7gDqP/CHZN+i3aKHmiIUgXfDC2mP7KEDqzqxRjx6snK3t7ntLbjr+uxGBJEho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715346081; c=relaxed/simple;
	bh=xsCgUTQujSpA87EGwezOFO4IkwKTUzAnJXwXCKepl10=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JiWTctq0wyibtiHX+JGsG+qlpn5LXZ92kzjiadLmlUQBLhusAjB7hBJNJg/SBpmI6Dgjrod6IbJ6k03h14l7UYNYRZwMyb7unlVcK+98NA6fTqf8U1MfKUAmfoHNQISQO3aR7l1WFKeXfAx1rKToMjteSGHAZBtWNu91KGTplSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=crVkqiIA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-34db6a29a1eso1651742f8f.1
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 06:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715346076; x=1715950876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EuOqAb8ZpUuVP1mrlb2cKpurEJ0bRaZYBd2TNR0xxGs=;
        b=crVkqiIAkpGhPg2PhxnH0MUtf8I7DlEpb8NReO57skFh+IvC+Yjv6AktbtO9kx9haU
         4vhDBC262Gz9JSV2G72rTPyM5tisB8lO1NvoteP4ZGlxqFygM13S+5AKjwtl8da6Pw/j
         WkCc3d5Gh9lNkBxE3x4eeGwWhT5cevrdkJ/3Es7Y6ZYjQ+DrtE/QJ4ynVVLq334rRviT
         Yy2KJJ2bUI8bV50DjDnHyw9PMOnnu7w1sNzccwyTTYL87vUgKXNfIBlKjcOqgQ0BITAP
         AtdowtOyXSedQF89v33akaewvf/M9E+p2fi1Ohwd5Qqsx4IokQe9RnpqwFzb1Ecgs/1O
         Zrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715346076; x=1715950876;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EuOqAb8ZpUuVP1mrlb2cKpurEJ0bRaZYBd2TNR0xxGs=;
        b=eor7kAYN9QOCTyAq/zPSC1yCg7mRANA0aodq3BB4lpUjwUNqbkV0NBBzdktEybgg5A
         hFA2FtSLqRhQTkkaLQ63ZKPJTRWXlBwVNSsSoTJmrM+C0iC2Lsf/a0NnFSIeJPZ1BahE
         nLxQHHTRld/aGC4qpH7TxSozF5Sv2wjWai9xeXa3UdEbJWtOgR3tWgFBZ61wHbRxPvEJ
         QYIqEBK7Ks4eIaHXv4g6dMt8LtYjK7ES+tdJ1hNhjSIUZQZLGgIAcmgODKrlhmGjg7No
         NG+QUOS8eUaPBvX/3zC0zJHuf78t9CN6UvbufJopiJ7kvdm8SuxXAmA3+XsZ54Cu0aEj
         VeXA==
X-Forwarded-Encrypted: i=1; AJvYcCX67+FgluDc5YV2/jWxByxEKVJSnvrmk81//xfE7X2gVocmSAz/tLTIat1n18o0wDildzPgDbmzo8EvrwtS3mOc/mAyr9nMI5wwDOs=
X-Gm-Message-State: AOJu0Yyy2Bo2E8C476tQ1lQNNqFH9ZQ110magG5Z3TBN4Cf56DB1ldlw
	WHqJF/kt/NMTHdZPwXcp7QhiCoW+WPEWp+kkTL68svGtlOLVPfeLQUU4I53RhJU=
X-Google-Smtp-Source: AGHT+IH4l5dMeOQQ9CIlOmZviv3DR34gB+WFmPnfVAb0EORzuTaQVImXvg2bsbUFlg3yyxbsNPswOQ==
X-Received: by 2002:a05:6000:440e:b0:350:4c83:d669 with SMTP id ffacd0b85a97d-3504c83d8d8mr1455017f8f.1.1715346075781;
        Fri, 10 May 2024 06:01:15 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad04dsm4512060f8f.81.2024.05.10.06.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 06:01:15 -0700 (PDT)
Message-ID: <d2e55523-f8fd-4cbe-909c-57de241107e8@linaro.org>
Date: Fri, 10 May 2024 14:01:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 RESEND 5/5] venus: pm_helpers: Use
 dev_pm_genpd_set_hwmode to switch GDSC mode on V6
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>
References: <20240413152013.22307-1-quic_jkona@quicinc.com>
 <20240413152013.22307-6-quic_jkona@quicinc.com>
 <5c78ad52-524b-4ad7-b149-0e7252abc2ee@linaro.org>
 <b96ef82c-4033-43e0-9c1e-347ffb500751@quicinc.com>
 <a522f25f-bb38-4ae1-8f13-8e56934e5ef5@linaro.org>
 <dbd1b86c-7b5f-4b92-ab1f-fecfe1486cfc@quicinc.com>
 <621dbaaa-6b86-45b5-988e-a6d9c39b13d7@linaro.org>
 <d36c1163-a3f0-4034-a430-91986e5bbce8@linaro.org>
 <ef194e5c-f136-4dba-bfe0-2c6439892e34@linaro.org>
Content-Language: en-US
In-Reply-To: <ef194e5c-f136-4dba-bfe0-2c6439892e34@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2024 10:14, Bryan O'Donoghue wrote:
> On 30/04/2024 21:01, Konrad Dybcio wrote:
>> On 24.04.2024 11:50 AM, Bryan O'Donoghue wrote:
>>> On 24/04/2024 10:45, Jagadeesh Kona wrote:
>>>>
>>>> Thanks Bryan for testing this series. Can you please confirm if this 
>>>> issue is observed in every run or only seen during the first run? 
>>>> Also please let me know on which platform this issue is observed?
>>>>
>>>> Thanks,
>>>> Jagadeesh
>>>
>>> rb5/sm8250
>>>
>>> My observation was on a previous _boot_ the stuttering was worse. 
>>> There is in the video capture three times that I count where the 
>>> video halts briefly, I guess we need to vote or set an OPP so the 
>>> firmware knows not to power-collapse quite so aggressively.
>>
>> We seem to be having some qualcomm-wide variance on perf/pwr usage on 
>> some
>> odd boots.. Any chance you could try like 5 times and see if it was a 
>> fluke?
>>
>> Konrad
> 
> Sure.
> 
> The first time I tried it, it was much worse.
> 
> The second time, captured in the video is only noticeable because I was 
> *looking* for this specific error i.e. I don't think I would have 
> noticed the error on the second run, had I not seen the first run.
> 
> I'll find some time to do 5x with and 5x without.
> 
> ---
> bod

ping bod please remember to do this thanks

---
bod

