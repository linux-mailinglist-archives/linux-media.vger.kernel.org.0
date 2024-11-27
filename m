Return-Path: <linux-media+bounces-22198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C709DAFDA
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 00:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4956B161B81
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 23:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D53A17E01B;
	Wed, 27 Nov 2024 23:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mIw6eRuZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AC5189F20
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 23:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732750313; cv=none; b=CfH2hvI5FYa2Qp5dkxN2x7mVnSp79yUfIPLHpw26uasZ5wwE+jV6biEe5j/xYXCoDgFHEQkYKoH1dTigzwjCXczyJC3ngD18ss7EISvHeF3XYNIgcFSxTDgkf5b57hom/Ybc1YkgFZPUFCSND1ka1Aj/2Z2C3w+gi7M4lF9wZkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732750313; c=relaxed/simple;
	bh=GJUfjMiVlmYqqv6+oKXNJL3YxuOjqYeAo6snMabsX0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFjw4cRW1kEdPNAMRV8+DJgiRMHvaooY1cXJArK9x6itPW3HaR50V0EFzWv6/nN0/AqtLEI7+JPREtvhIRMq0ktaIuekV++ke/eGJE5ln70yNhatfC4vO7DBFCKd0T2dU1h+st2CX5Znr2MgSMTITT7+laKZEY2FYmNTq+CISd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mIw6eRuZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43494a20379so1920705e9.0
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 15:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732750310; x=1733355110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TszDdA28UmJNkLbj5Ys3Y092KyTg4JPf0GnkI2Cya8=;
        b=mIw6eRuZEf5s9PaR+8iMuSJ7+JWGvpuhjg5QRFOk3Xv4uJz7fiyCUcSrQX+XCjh2j1
         sIPglYzztxEYwNLaa8vfKtdVd5fRD63SjJQPlWZCq/C61v+ALkIDAr6weVbaWcCH2lH8
         XyCYcWmtdRUqe5Yk65fv9xxwzTmMZyfBcJHC4sHQhOrnXOrTrJ2gEP+wl6zSaMvXJvm/
         YonVZ/6AczcUlsSpOUkOt5BLYMBAJfnxwJv36BwJIg2+hdovBLw2oKzK9Mi1Ez4rlZCx
         CpN+x/FdNpbrEqV+4OfRLWPv2+zh0YRKUDVdEOPJRU86XLgM5nBykjiACeS702Trmm20
         GVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732750310; x=1733355110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TszDdA28UmJNkLbj5Ys3Y092KyTg4JPf0GnkI2Cya8=;
        b=xUDB1FM1Ei6j/Ss10YgWfoxQPrtBa9WmBSfrDGp1aQZ8HEmCnatEBZrXrkwLHOycN6
         IXVVoEkIFLTA1xp5lkB82IDhc54VsVtWE/DmHeo92rqaOEuaH+q6wj4KxTP0CIVeZpoL
         21Y5ayHc+SOqCdRQr38tO9LK0P2gQz2zIQ5E2w5/Sb6HdZW5ZMVoLav7r+3kKu3K8xTO
         V/8D2hS5bvZIQtvn/zYo8Aeg22edHP/dpd68jHcOuFE2n3WVq6ci6WGuZpmTprmJHMi1
         YQwvdSf+InChU7N1gH6dzet2Q5RGXK4HiGqr+Jtqz3oUDG8sDLAdL1mXZLNPvWkTView
         bqEA==
X-Forwarded-Encrypted: i=1; AJvYcCVnIujyiS5fwtlwi3xLqmJjb43MUJfZQt1F4GUdstFDdpMPOy+m8LWJnkCSc1rhS443bAqbsCh9wHxDEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPlE9cenh/yJ8oMFzkp0irHXRJIDvpcPB2A7YcQrvztUc8TYCL
	x1+Gm4kyF40bVHaWpMSeA0errgm289bYG6k0wIUC/mJSgLVQGGD06+cT1n+v+SE=
X-Gm-Gg: ASbGncuXV5z3+TdmrhmG18sdRPrIOjpxIy3PUyBb0yoyUi3fuTaPjTJ9uT+QW5fL+6h
	P5Yy2Hml70x72CubV1R3rL3vWO6ZS9ybuWRDH8ZTq+hAipjs9a9V6oD6BlxWmDiBENUW1XUw/j/
	bDDWeA6LbHFSxYmzlTc2aYO9QprSDi4XcA+2HGnEM6lrp3My5/dllVTlAoyY7Jgv4G6iWlcuF5b
	6SDrQQOT9JCMeBf2VKKqWsU+jFpUKXWfoekYqZRr77agUGEg8zNatjRVjvlsLc=
X-Google-Smtp-Source: AGHT+IHgjc2cPrbC0aZV2S7sqJrkCbPea2u3Owx10Tid0gPuuY71KlejV3dkLQN2GcvQx8LRjYj36g==
X-Received: by 2002:a05:600c:5101:b0:434:9dfe:20e6 with SMTP id 5b1f17b1804b1-434a9df71c6mr39451865e9.23.1732750309839;
        Wed, 27 Nov 2024 15:31:49 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc6831sm3374985e9.20.2024.11.27.15.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 15:31:48 -0800 (PST)
Message-ID: <25f89e78-faec-4eba-887b-019eed752064@linaro.org>
Date: Wed, 27 Nov 2024 23:31:46 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
 <20241127100421.3447601-2-quic_vikramsa@quicinc.com>
 <1a87e9d9-da7e-4b8b-807e-f56aa15acfc2@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1a87e9d9-da7e-4b8b-807e-f56aa15acfc2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/11/2024 12:57, Vladimir Zapolskiy wrote:
>>
>> +        camss: camss@acaf000 {
>> +            compatible = "qcom,sc7280-camss";
>> +
>> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
>> +                  <0x0 0x0acc8000 0x0 0x1000>,
> 
> Unsurprisingly above is the error, which has been already reported for
> enumerous amount of times, I wish to stop poking it eventually, please
> reference to the previously given review comments and fix all of them
> before sending a new version of the changes.

So just to be clear what is wrong here because it may not be clear.

1. Sort by IP name
2. The first address @ reg should be equal to the address @ camss

-> Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml

     camss: camss@1b00020 {
         compatible = "qcom,msm8953-camss";

         reg = <0x1b00020 0x10>,
               <0x1b30000 0x100>,
               <0x1b30400 0x100>,
               <0x1b30800 0x100>,
               <0x1b34000 0x1000>,
               <0x1b00030 0x4>,
               <0x1b35000 0x1000>,
               <0x1b00038 0x4>,
               <0x1b36000 0x1000>,
               <0x1b00040 0x4>,
               <0x1b31000 0x500>,
               <0x1b10000 0x1000>,
               <0x1b14000 0x1000>;
         reg-names = "csi_clk_mux",
                     "csid0",
                     "csid1",
                     "csid2",
                     "csiphy0",
                     "csiphy0_clk_mux",
                     "csiphy1",
                     "csiphy1_clk_mux",
                     "csiphy2",
                     "csiphy2_clk_mux",
                     "ispif",
                     "vfe0",
                     "vfe1";
So:

         camss: camss@acaf000 {
             compatible = "qcom,sc7280-camss";

             reg = <0x0 0x0acaf000 0x0 0x4000>,
                   <0x0 0x0acb3000 0x0 0x1000>,
                   <0x0 0x0acc8000 0x0 0x1000>,
                   <0x0 0x0acba000 0x0 0x1000>,
                   <0x0 0x0accf000 0x0 0x1000>,
                   <0x0 0x0acc1000 0x0 0x1000>,
                   <0x0 0x0ace0000 0x0 0x2000>,
                   <0x0 0x0ace2000 0x0 0x2000>,
                   <0x0 0x0ace4000 0x0 0x2000>,
                   <0x0 0x0ace6000 0x0 0x2000>,
                   <0x0 0x0ace8000 0x0 0x2000>,
                   <0x0 0x0acc4000 0x0 0x4000>,
                   <0x0 0x0acb6000 0x0 0x4000>,
                   <0x0 0x0accb000 0x0 0x4000>,
                   <0x0 0x0acbd000 0x0 0x4000>;
             reg-names = "vfe0",
                         "csid0",
                         "csid0_lite",
                         "csid1",
                         "csid1_lite",
                         "csid2",
                         "csiphy0",
                         "csiphy1",
                         "csiphy2",
                         "csiphy3",
                         "csiphy4",
                         "vfe0_lite",
                         "vfe1",
                         "vfe1_lite",
                         "vfe2";
:(
---
bod

