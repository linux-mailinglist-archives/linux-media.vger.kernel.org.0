Return-Path: <linux-media+bounces-43654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E40BB42A3
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 16:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFA513C5D82
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 14:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2268311C35;
	Thu,  2 Oct 2025 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zaWDrO06"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715765464D
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759415349; cv=none; b=G9D8nzRyIsMow7wzzmd0EJ272FP69vrJ3GI0kToGJLVh8KKhtiq12/pY3xAnpejjOIVyky+/zgjkyrSuDHgsxrdjSyVrwm7BVhK+MBjtaX0DPxfUR1exTQje9n5ZRVxDi44Acv91AZYLyk1rNsu2cYgsnz5xpnTwQvanC40do7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759415349; c=relaxed/simple;
	bh=lnVly7B/ynWFg1o/azppqD1otcdk0Nc+DkPvo+hfI+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0iehzCgIloDQgqZKLN+kMnJhM83HJ7sJaR7N5eW3e60U51quCBT4Gh6hTyGqp64eUO42r1/cv2PIaL45MdG+wEx8/yxJX+ULCWfcnXL7ff9pzckoL0SaX7FLXDiGDxMeRDQ2txHxBFi/0XBeenhLyw0dPIbLvmuy7yb2jhPtEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zaWDrO06; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b00a9989633so229097266b.0
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759415346; x=1760020146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQfCWHeADRMRctoSeDLhAiNPu6h3f7C5McM5+dE+g+A=;
        b=zaWDrO06iBE+DYvasS+jPRkOAOr6m79xzddWLRdsvSW4cLi0rnqtEEQn5/M/bK+fCZ
         khOe46JV1h8UnlfLji+HB3s+puPSkYNZHOO6EHm/PUXUAEV/zhJGfUtkFkNCFj0PZufU
         VgWHkicXE1ig6oMZ+THmBgkE7BvDKbNnrIM49hjrI7aQ53XFRNrY4D7Ubv1d+xNnMvwu
         MktpoCcyxi6ZVilzBhJKlAusXdRmXw6R+B9Go86OrC4PeH3dObMLbRrhSOdC+DCD3XP5
         IHZOpgalq3Wy3CsnOTAn4y6gnsma5lqeg88LH3uiQKF4792Glo8yu21FC0putvFLO+NY
         QAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759415346; x=1760020146;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQfCWHeADRMRctoSeDLhAiNPu6h3f7C5McM5+dE+g+A=;
        b=FMdzlkAdzNOsjJXVhiZaQjUi7FbJytgcb7Dwym3Cd/YMmtGydeYWwwCUiwVwJjiO2J
         qwJhDWZ+a9imZHeYO9eMnbtqXkjdUxBexXJlb7oLC5AnnK6cPnXdPhZKF6Dg+rmtlyZ9
         EX8mtPt65bzrAC+4e3x4f3s6Ceosy+/71iXRYxFmWaWVfFN5FFAK1mrWBJLcOB8tCkN9
         TrHHsaHZ6UhVl/H3q9/JezDgpA1aKEmkWD1s4kkwsAZSffcBlnhUnMShSKmVwjdohtCL
         iYELg4cCohtqY2nFBes6UCPkdPzvdiphUdFKr8Nv/29jwRYT1MGFjifSd7P89YIP8ws4
         +tZg==
X-Forwarded-Encrypted: i=1; AJvYcCVNTdmHprxeVoYaKMaJQWX8edILOkGkLZ+kvOeF1koeFUz2eHNz64/Vl0OQ3XYBBvWzKS8etncxYjteAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6HnWdDKfbCME09jmEq9GhMxU9DRVyD4pyQ/7IiSPktza+gzDm
	DECEDjCFZscZaQA574tv8VIG+cwUO7PYIYke2Sj8lmJn9O3G7FXyN/Yegu3DIUZElBo=
X-Gm-Gg: ASbGnctU2Ns9ZkLxuacp5BWlaQ0M1JeMMgg6fAVoq83Lmn4qzCbv1PS2KQtMsm8rQ2p
	prklNe/fsXDv9vLnhwb9/dtFdW3cYA/vsOLJJWqhVaFKjPx+7OB1gPZiKtvaK+8rZJ0eS1KkM2T
	yt4CtTPJzDleujIMVV/XFrTqRR4gq9TKkyUiiRjlL0aJbblYYjP5u62DwIb/6fJuycEXwPJFxVq
	hMm4mIjnRx7zP+fzY8ktOzxPnSxAaEFzA0QjOY1zuCrm2bFB/56aN/tGLPA/mba4AS2ejVbEa63
	JpzXQ1P3hMQnQowtjGg9RNZqYzcoMxaZ9aiYC8fPnun84fL7IY0ldL7uvBxRa0m2OANzlg1U/ZZ
	AQ1zOWag94Cdl4gO7DtWd6sZlNAGhY1SGxElBrjBeovtHl3JSvvGeQSsoUh2rnVPzGcxxYaPmQt
	6w/AeIuOcm6fMAR3jkWtlDooc9T88=
X-Google-Smtp-Source: AGHT+IGnulA+Q5h9/q8aA5Ppg3Byl6uFpjHjx1bhWf6x3fEjpyWL4Kz+sYqViTJlhMs3unwt4RSJ4g==
X-Received: by 2002:a17:906:c10a:b0:afe:159:14b1 with SMTP id a640c23a62f3a-b4859e7d413mr481034266b.9.1759415345681;
        Thu, 02 Oct 2025 07:29:05 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a26e639sm226244166b.98.2025.10.02.07.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 07:29:05 -0700 (PDT)
Message-ID: <7fca9e71-b9d4-427e-be66-56f813096cd0@linaro.org>
Date: Thu, 2 Oct 2025 15:29:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <25e6e163-f91f-4fe5-9454-641914d2eb43@linaro.org>
 <CAO9ioeUa2Ea7CNsXpUANyKiqfjzW0uQU_ZxgEw==uMA42eF1NQ@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAO9ioeUa2Ea7CNsXpUANyKiqfjzW0uQU_ZxgEw==uMA42eF1NQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2025 15:24, Dmitry Baryshkov wrote:
>> I think in fact it should be possible to point venus @ the gen1 firmware
>> file while pointing iris @ the gen2 file.
>>
>> Unless there's something here I'm missing, that should work for the
>> update and the agreement.
> Both drivers are supposed to work with the same DT entry (that was the
> agreement, they should be interchangeable for the migration time).
> Consider having a device fused to require vendor key and a venus node
> with the firmware-name pointing to the vendor-signed firmware. One of
> the drivers will fail to work in such a case.

Does it ?

Your firmware over-ride is in the DT - which is a downstream thing right 
now for sc7280, in which case you're required to manage your out-of-tree 
stuff yourself.

Else you operate from platfrom data buried in the driver which we 
control in upstream.

And my own thinking, I've been semi-convinced anyway, is that in reality 
the gen2 firmware is the only one that is going to "get any love" i.e. 
we are probably _only_ going to see time/money invested in that interface.

Hence its in the interests of 7280/6490 users to get onto gen2 firmware.

---
bod


