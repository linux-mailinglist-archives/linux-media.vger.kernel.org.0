Return-Path: <linux-media+bounces-47258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 381C4C68A19
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 10:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 237E64ECB25
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 09:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C8831AF06;
	Tue, 18 Nov 2025 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZIlT2ByV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903B42FE574
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458996; cv=none; b=n4agVzzinVVlyx42N+8fzOFz0JjS61WbZBfAYXwyUnEIMoQQx0Dhu+vD4FmR9vf1Onyl9rfjWQFTUunhaKE0YIK5gMkQhnNUaPpUzmPQNcPuQr+xIPijAQn9IxnxXBq3LDNcY6IyFT9gcwbb0FzKfxWvsIOPWCzu7KcTp4EOm3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458996; c=relaxed/simple;
	bh=1SKTsuMZ09cU2qi7YSDt1PNXOc9+i0J0/0Ce2PFpCVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2Jc83RP5tWLLas0Hgc2OD6XyTFbGOOcVt6dj5DfpXAuwA/rLcOWWnx4DBYsie1TEHrOVX9J0LYhYrnCH2PYG4GOEch9wLqxJbDe0dUpZR+0YsIz7iI9c7OjaWIrHAuqshtzsnu3o7Gcb9/JEGXP54pXondXcsmV7C3SwmZQrgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZIlT2ByV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47774d3536dso43375315e9.0
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763458993; x=1764063793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iB0FYmKAkv20ezZVBmoH4VVIfKxjQ8IHeyF2X6WY62c=;
        b=ZIlT2ByVDyD6ecIYWq103w3m2CVQeu8v4FJYHZwtkCV1/kVLG9wo0oLVi1whge+ZyW
         ywAEr1sYWPjOEZmcQcBC/c6nY+fdNp5Yjr2SWTM9p1gQRDtxUsvgRkpDNUVnHlQzj78U
         ALciZ4AVddctkJpvV5rKQNokwulZ0jvjrrQrk435ifrQRzRf4vuF18xGmFC+y9qHvFBr
         dquatW8jpcw1C96c2fSZGeZqrXt0k4VFr8lfO+mpZCA7Rr1EIoau5QR43P3+rQqc+oEg
         1YXtwq5C69hXp7duZj8N6gZXBsmqzJySl/RSAsCaITtF0jARvemGDz4t8tOW/Z5/JDfl
         DPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458993; x=1764063793;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iB0FYmKAkv20ezZVBmoH4VVIfKxjQ8IHeyF2X6WY62c=;
        b=CjEi5QESFvc412/pnTx5Can5ymOUj6c/VdrnZedmTgqSmMZBhnIvqlnJIdaFQ3jlGc
         t/cLW+Sn5MC8CT1/jd6QvUVkF27gZh+4WNw3vyQcjzmEiLQbuEvvLiizYRJ1yMsxIKx9
         kWhmyRM1K72QyMf9Q7VDrVJQa4xzf3sh8adn236t96uWYg71i+0u6fAKyWnouMOa7LMw
         HgdModix6YigK2uWa+5qT9bLKcM86QN7dMpds2zR4MenlTMACDWrLB2AoiL1NAoMpQFY
         Mis28yc74G+rKotAyrxuIvfqmTZmfM/wLmplVmuP8pCbpfN8eLXpKnn0CbUmEvemIV7K
         mOtA==
X-Forwarded-Encrypted: i=1; AJvYcCVNZ47Y39f6rBn8xKH7CdpSTQUz55ZJ35EKM8PpNw6cbEYkNPl94gPpK7No2nOhY5mqTO7dbcbBSY/xFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxNUROOBu7Mt7vFoFWDl2UWeeg6APXG7PvooGYxo+sAClqvefz
	N02pa3GCh3i7XAZoMSJDgde3RV9s+4hFrpswCPWLAPWXXTO7ISabagDkmtjNBgyMuKE=
X-Gm-Gg: ASbGncuzg+lEN6F2yjGJUe6f0lCiCnU8+eEQjC3h8+69Cr3kxKYr42VDplsu2ZU3J+X
	Dy+Bq7h26PtjKA/Pd+AC1+dSPVRhOp2Euz7hgIOCqNf5dEiTOT1HAtuPsNcARxf1uqUmubMMiTk
	wO8swi4iaYMkfZlo34MtZY4YpwudcK85dGig8tJXQfmHJct6/9mkyD7w11hzqVrcR5fJICP9nDL
	uM3+L/4ChijGlDAL4TW8SS4DslDVSM9z2+b4g2e6ZO2/ufu3Cg7YG0Hk1bBrxaTr5hUh9XzMkLz
	73EflLh0Vmx2p+mkrTI3wRLy46NeStharAjh8AwVPLHlj4jCRPjH7XWiUVoZ3JsmwvGYscyjg23
	ZPDown3D/LEsXokMTLA70gUstflJ22LcBXbL6XIsnmRYsOPBt1e/O3IE5Jsko5FilTmeokYn7S3
	Fjg33+ZbnDlQHVd8M6Byg0rXyp8hdVMHnjvs6nIDLQamdxifPBXaNqSSm9tXvMji4=
X-Google-Smtp-Source: AGHT+IHHdoFqpKUQLxIM3QeSwIPeudb1hZjwgw5UdoKIA0vKRvCW44lxSj82+G822eE3K7XX/YCudg==
X-Received: by 2002:a05:600c:4e8b:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-477a94fce0dmr24988945e9.14.1763458992803;
        Tue, 18 Nov 2025 01:43:12 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e35b7esm363766205e9.4.2025.11.18.01.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:43:11 -0800 (PST)
Message-ID: <79097e86-1570-440d-b18c-43b143f9ab54@linaro.org>
Date: Tue, 18 Nov 2025 09:43:09 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] media: qcom: camss: csid: Add support for CSID
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-4-1e6038785a8e@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-4-1e6038785a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 03:29, Hangxiang Ma wrote:
> +			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
> +				/*
> +				 * buf done and RUP IRQ have been moved to CSID from VFE.
> +				 * Once CSID received buf done, need notify VFE of this
> +				 * event and trigger VFE to handle buf done process.
> +				 */
> +				camss_buf_done(csid->camss, csid->id, i);
> +			}

Somebody needs to have a conversation with the Si design people to tell 
them to stop moving this functionality around... its completely demented.

---
bod

