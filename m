Return-Path: <linux-media+bounces-41697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 137EFB42311
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE402206550
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDC3310650;
	Wed,  3 Sep 2025 14:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6A0lRSQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ED330E85F
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908316; cv=none; b=DM7BKb6U7ahI2gqf5VazPbO8oH9GgDAKxip8s53EcGG2zAkq2u26KLcb52Y7GErSqwrgLolhJMGOVk/jwFoUxT/kEf15Z1aBDbXpie00BNdL/n88aet5acmS0VuSbbicSQSGWtCUtoeqbLvxI+JG57/rl1d41f/0+I7+zRtgD20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908316; c=relaxed/simple;
	bh=p1lxtpJ7TjvFoHPJ/hZ3029ZCfEe68+gdc5pXFuSGH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXyTsoK8BH/vZqHrNfSOXgmcm4jqkieSIPOLcKSmdbgStQhCalas/2VlL10Ka8Sz5xrQCGx0pc6zCrlrwwZtaEaE9ugqUkcN2CehfB3dDK51QNSRJs3ZXllzjEsyLKn3UJK86gFmnWxd1reXiMYmFPjhkeAcKb4ExeKXDtTFLfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6A0lRSQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso385215f8f.0
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756908312; x=1757513112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QK1Plguf59MohKiPDL9B9tJ9p4M4VouT3+3TgzQ44t8=;
        b=s6A0lRSQEJ90tneUCy4zUGJz3L2E5jUu9WsMzIfv6g50o0+H8hjACes/xhJphVACrJ
         wY1XRLApmYh3RopjnhuBLvNY3qAYVViMH8S4T2lxPJTesKnZsjZiSxvGQlqw6MOLlZAd
         spHHgGYKFIqxBJXUa814BPmEowiwB6LyLnJmS5ReefQgeKwgRzD8qZY3cALUKn3qHYc1
         fBwZboS/iNUwRVy51FHS0tecA5Tr0p5Fi/fZEynI2SpJpN940MLe/WzIso3NlGan5fXc
         yPpYUIvYfnSNLVtFdXcWmJv1TshOwEhfJDkJobAuuFhJkRNvIxBDQSqsMlkOBGZnZn7s
         RHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908312; x=1757513112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QK1Plguf59MohKiPDL9B9tJ9p4M4VouT3+3TgzQ44t8=;
        b=KaB2SW5qt+NCLap7McAAUJPqEpNIdHA5nQSz7MATyb5ydbWiSdsKqkutv1jRB1NId+
         FoHwac8QJbvZy094GjnHaX2YJSNxdilVQGZV8BJkoKv9hlznQImBQzfRqOweeeZQ4kxM
         +zbK+5QUfvjxJrqaS4ClHSovgoXKpgtEJux93LvOJIMYFfzo0PNG/jaYmjDAUvNAsWae
         aWKqURQoWObL6+GQEUH8Tf0umnE43fSmOfFK6dTuc604Q04txkAfal2BkgfgIneSK3nS
         4KF/MM0qQeZKrj7OoPCy+a9Dr2KUy3cFqB0aazzyIKx3ALVc0nYNdFz8ZJ47Yugmgv5J
         OxQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdgu9L4qkptCR6VSTEQEIH4jP6xHoWVgDb4wrjKZXlN2reT/Re9ES8gHqNOXwmxmfh9I4nag0IC4E6nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPL9yoMq2YjVeFZ8EIUoudCICIhq8LVhkDzCklvXh1bdRUXYrL
	UdcjsoF3kE12qxjR8uZ7ulbuhTCos8NLF7EtV4YEECHG/ushFbSxnKBNmPH2Q3V4IwY=
X-Gm-Gg: ASbGncs9341nbr7qLXOor3rGrp66vlzLt+xx9TODY8hRzdJURQNtDndRqHdTmZ41Zp9
	JIKbtdPMXDNfzPUcg7sBFr6kW5Ry5QA8BubCZ2N1XY9RQ3WkmFEUHMcISa9CCo06saSrpbNni0s
	DeChMjawxr4nM93/hkRkWJNSj3wFLc4IbKZ/zJhX4CJCpcfuoYtW0sReBqL6KZ77WwTU/+IT4tw
	/tpbaqYygkEncTZBJQZlKWI6iehZBaszbgUphbtIzGalYrT33Uj92jNswykCQZ8aGM77yA8RA8u
	JyyrpyG6KAZhg1ezu7TquB6nHkqdiDDSTYsnT5Oqgmdt2hgyF0m6WOwiGZG2tT5LE8znt4ahRxB
	iQ1ThqzKfGB+mcxQ7Y5p4N0WNQjQv5jmyeAFOmMcAXGrc99wGYmTIzLlzSPGr+4QnxYP9Zr1Jd6
	wM9fflRK1Jts/NMBKarIba+oZepQP6cA==
X-Google-Smtp-Source: AGHT+IEZMZforlja2xX6xreLhIbpAVhCSknwT4/G7zI8fcA9TDR7jhhzcqogfHqvrdx3U1dTW1cIhg==
X-Received: by 2002:a5d:5887:0:b0:3db:f9f7:df86 with SMTP id ffacd0b85a97d-3dbf9f7e8d7mr2886230f8f.61.1756908312422;
        Wed, 03 Sep 2025 07:05:12 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm323422865e9.5.2025.09.03.07.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 07:05:11 -0700 (PDT)
Message-ID: <680de02a-6592-40a6-b25c-4d8fa85c4e81@linaro.org>
Date: Wed, 3 Sep 2025 15:05:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
 <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
 <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2025 15:02, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 02:31:55PM +0100, Bryan O'Donoghue wrote:
>> On 03/09/2025 12:56, Konrad Dybcio wrote:
>>>> Can you try with this next-20250814 tag ?
>>> You sent it on the 19th, so it's in your best interest to run a quick
>>>
>>> git rebase --onto linux-next/master $(git describe --abbrev=0)
>>>
>>> and giving the series a prompt re-test before sending, because there might have
>>> been incompatible changes, whether ones that would prevent applying, or break
>>> things functionally
>>
>> I can't even find that tag next-20250814 closets thing is
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20250814
> 
>>
>> | * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge tag
>> 'drm-xe-fixes-2025-08-14' of https://gitlab.freedesktop.org/drm/xe/kernel
>> into drm-fixes (3 weeks ago)
>>
>> but patch #9 in this series stubbornly won't apply to any SHA I've tried.
>>
>> meh
>>
>> ---
>> bod
> 

ah..

I fetched -stable

---
bod




