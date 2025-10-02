Return-Path: <linux-media+bounces-43657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 779EDBB4449
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 17:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39898322F5F
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 15:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE6C17A2EC;
	Thu,  2 Oct 2025 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e8RbWs7N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F58F1B808
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 15:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759417663; cv=none; b=TxGZSFXnqrj8K/XZg3vnO2DaA9JAld8ELgM25hrn3+n5xmRgiqOFFt4wF7yXydfF+Uj7S14gtQNk0qH8mKx/kNoynOeUypl/UBGdbpVXEUe8KAB1EWSggwEQ4uki3FMIVm4XAC34g7aQbFIg4YsBVvx6f6vQp7/XPZaVHkjXhgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759417663; c=relaxed/simple;
	bh=syDziuqQRnZmZdyErzTSiDyfSgfFl/Ol2bR4kWM8Dh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=my2EAdMrpkK7++0Kvxrl786kqxyqwIz6bGY8148PfEOLJto9QZOssmAQtuybahyzEFwj8Q16EionIZJh/2g/b075MxeBcnRElHpzjyEmmZf/vkFzkSV429Tpi7ZMRVw1Jx4oSJstUDUQ6TUKP2sa+ZmsM6M0HRBgfM4Ok+L0Ap4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e8RbWs7N; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee12807d97so952539f8f.0
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 08:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759417659; x=1760022459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GxfinuLeRMqYDBdXF3QccjMF7z8zuMYOlZjx2g41Lkw=;
        b=e8RbWs7Nrv4XvsaklHsoCMQPCqJmy2L6FiFOL2fdsmFhJ5DwGyX02j74ihSi542GQl
         vIwcAZfw3oQ7APK4425UzxoSSBfbwdIq8m9+x4qs2jhAWhd3dxh9kSe7XCKIjQ9inwca
         vH/Ph3uzhXr42Bgk0MHPz76rplHpO73QOK3WzowoPY36ZsbpmxHtKPyi2gejgVGEuD19
         1ndAiLfP3545OK4b2lZQqFp9QLkVOxPzuSkgZ3h8rTPI2AGY2kC4IGVqtR4RSUv+51Ao
         xKOmrKYX6qtoC92NFR18VBv1OrRojLOg8qEf//j4NxDjuS0iEoYFF6A4oHTFWrFdJ96d
         aCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759417659; x=1760022459;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxfinuLeRMqYDBdXF3QccjMF7z8zuMYOlZjx2g41Lkw=;
        b=BGYiplGDLpVJaJwyllhBe7ROGdPXpwFg93prT+ZjE5EyNN0LSC+igD9AuAbjet6EMV
         jJCfYTTCuMK0wccE7ScHQXc6HK/ts+uhi3VLmM5GypkTkknSZHmgGDBw7KxIB4YVXkJI
         pnGlIspKYKU3LjntxkyJsTEvT1kPrxRfk1RpuzOWvwRcAQ+nitqvudbSjfFVAGbsHc4D
         QkPAFSCuBkWetFn81Cb9blkQmObNjdajLprphFgqlEJC/uJzFSC25H97mcHYZnYKjqD2
         Q+4hmYxbMpToO+ZG3rs0V08/7/+UBrKZ44vk+H27TjBQvzfMd6Udpx/mP0/+00YttlKj
         BOig==
X-Forwarded-Encrypted: i=1; AJvYcCVcb9/aLsq3Qj+QGr1qkdK0JJbjZJ9vO/aYdOnK/ynTkTlo+6jXMqdpBp3lZdPU0gxGNqqbi1apMXmAhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuNnCv8MfdHckHVV4TXnCHZlC2FrQb5Gh2EUi4zr97mXYhSZbH
	SAW34tNl1hKMvr15OAB5sq3HtbAkHUxlcW/rumGOG/fMoPY9llUEUOhXiWrU6irUQUo=
X-Gm-Gg: ASbGnct7/wddC1F/Cjs/+lhBsQAtZlqSR8DjuWl4JhL8cJLN63GOWuofoGgBPOpJLYP
	bLRQeuti9C1rH8Kf87c65HxK9iW+8PQJCF1RMJm8p3xAGpJCRIHQwxkyHlywaQbbGuKmWo0Rzsa
	IGl3K4V9Zo8BuOob6qHpzxYdBDDk8uwvj9THvg9B3JuFHW8UdTFbzxSd+yUITgmeOA3D0X5XhBZ
	bLOhECayQ8OEc29dgye8S7M5TOGjr2O2VQ/wicro69NkBWdJcZeX1jPgIPiVzzGRWPZytkI97xg
	eFqJYCbDli09a3yW/SgVyEWtzjKKUvIE993Co1P1/albxrsQC7H1jCwE4ZgMIcroYJWRHK+eQTn
	F/NWny30x446C71s9X2l+UOrqk+k+JU0BoZ9bwW4haJiiWLEjQLX9IPsGtXsRUdHnGX+e8kmvfh
	BDPBwxc0ukssUx9Mqj
X-Google-Smtp-Source: AGHT+IE7BF7Zob8VWImYE4jXaFtZGfHFdsSA4ziHHrbd1qrmktLS+xhjYgOnbKcchHYcVyfcNqs2jw==
X-Received: by 2002:a05:6000:2c06:b0:3ee:1461:165f with SMTP id ffacd0b85a97d-42557814772mr4929959f8f.31.1759417659262;
        Thu, 02 Oct 2025 08:07:39 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e693c33adsm37332995e9.18.2025.10.02.08.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 08:07:38 -0700 (PDT)
Message-ID: <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org>
Date: Thu, 2 Oct 2025 16:07:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
 <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
 <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2025 15:59, Dmitry Baryshkov wrote:
>> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
>>    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
>>
>> WDYT?
> Well, I think that potentially complicates the driver by requiring
> support for both HFIs for the same platform, it requires detection,

Doesn't have to be anything more complicated than a reserved string name.

BTW you're right the main reason to support this is - in effect - ending 
of support for gen1 firmware.

But then in reality if that is the direction of travel, its in the 
interests of upstream and users to make the transition.

---
bod

