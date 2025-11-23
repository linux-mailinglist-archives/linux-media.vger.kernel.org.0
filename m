Return-Path: <linux-media+bounces-47633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79723C7E9DC
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 00:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D72633A44F3
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 23:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F15277029;
	Sun, 23 Nov 2025 23:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nOxm2x8a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC0323ABA9
	for <linux-media@vger.kernel.org>; Sun, 23 Nov 2025 23:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763941678; cv=none; b=Yhi9Qb7DVd2kZ6nToBDmmYMyM9IiIbvoYC3IuREHbxg5vStFM03ybpGpJ/D8q5T5Wd1RBzoLUy4LX61bTHG0AA0kqmeTj6Yxu73yPCSpfEkXj71wMaveK58gScy4C02zzK1iOsJzR7k5LFnDDWW3/X5jkJb96Et1u81+VrkRKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763941678; c=relaxed/simple;
	bh=TJIcmKvYcwLavlNS6SXJ/86zVoDsC8q0zbps/byk9vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjaW+MLRfu7/qxHJJT3aPcfOkavavUwn/JANvOW4D2xTGpO7ug1d8Y99OlevHVXJ8w0Ex26ovKx0wgN9lZ94oP+gh2kPy7NiRE7zc2Wh/XDVg+Iu+0bsgvePH5NdvlqI9W6sXq+gs0yYjfs/y/wKY19hGUu6t46asuLgV/4+ILw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nOxm2x8a; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-429c7869704so3114032f8f.2
        for <linux-media@vger.kernel.org>; Sun, 23 Nov 2025 15:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763941675; x=1764546475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9WpSd2LefLOPcYBkAZyB05aqITFj4fqTlh36DvQaccA=;
        b=nOxm2x8a5wSNm37ObdH4mYUiP0sSwgBDm83oiyPM4k06PVw5QHFtzSvd+/tY1kpSPy
         8FDn8VMyk8s/93EG8KRk5xQR4fU3CvJ5uPl72UgRac7h1vZ9vMD0/WApAEMSOxD6oHqA
         iJaB3dtPgJhrdD6W22SiQFrQajjEoqgEg68VhUr4LPKzh71IgFpUOijWdnFPlqS+TygL
         9jTr6+0DCKTEFq5jB183Sd4vV4LYHaWmZdbMtPJiaNPoApTYX/6Gyzv6NUgvGX1aYoRY
         2hNvi/Iiz7aL5sjnK37C2VFrYBZ5h/5cEgEY3uxelR2gUvSCe5Yzu86YzDfGYG67txGn
         rpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763941675; x=1764546475;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WpSd2LefLOPcYBkAZyB05aqITFj4fqTlh36DvQaccA=;
        b=hqSYv5EHnTfwm348JXoebPaNSontGYyiwhuNOY9NKeh7//Hj+2cD+gZAMiCnuUkl8+
         JZEMdYYCcVk0BHzd+Hs9nyaqf+yNpaYQF+rcBCQ98XzIe/OsXgoUwPDqJ9mbzHYfME6N
         +1MVpHpaCuW/PTVCimbRoc8ET/KQE4QXaPR5DuM7LbOqt/9Be/lVIcPDiuEcCREGggkN
         AeOV7koYIx+KOJIsz4BVzDeZrJ3traRHR+JXc/l7twIkG2Vb0CktikaolU2odVT+L7Jy
         KeDBropSUAFZrVh2QOYxp1WS/CplxoWA0GeW5DzE9ahOCT3NyCBjpcFpx5UXNUisXYOL
         Po+w==
X-Forwarded-Encrypted: i=1; AJvYcCVk8lBWXJ/dnUpM6Y+xpFtXLrjdNt6fdktA6jAXdFJBH9lDEXjVCTXT/+k5M+snyTrj1iKTBQ7hXxXm7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+4+3/w0DkUlMdMDdnx0xqE/GSesnvaAq5SAT4J4PaZGFGq3B
	mgXJA1IWwk007qXW6yiQHOs/Bkp+m9GPzpWCQieTml2O36ksfkJIpQBYMK/qzqhtfeQ=
X-Gm-Gg: ASbGncsovAm1ioVuHqRjLGUKN6OL4MEjMEcDi8dLvaoRkRqETBsgt9zp6m4fLr6xVnJ
	aaU5gfs8Z1iQ51ah0YltvwCcKZ61wJT14O2RpQn4H68u3hq3aljoGl50cv2+MxNDqckUGNYFc/g
	xuUCvah4TFTVbFwNCK5Zba0hNPumw2brGqjceNgBF0l246tauyVYxUbxMgdF+YBYbyWQ7RqZiQP
	XdcdyVT1FmJH2ynZy1MCEb0ujRfqu0p217WGj2i34O0Qb4jNrMPTvbUHonaX6ItuuXft/SVC1cz
	Jsyg4nYxSmdfepSjsW6pVGiVfSmEDF6/TiFeAKmZTA0rzrazluI8zcMVcZoKRAgMVmH+izxE4ie
	VQKJI4DwMi/iffpea4hS/sZl5rXkHeVN/4tKP4aBAR7R07GtIgops2IsPGJK8lcUNrUfYdqYXTQ
	/lbbvLHtmWQLr20OZw5mSD5eutW5jldHzHX30Nfwg1ugTSm7OoPk98
X-Google-Smtp-Source: AGHT+IHVxdc0S4p7GcNa9n3stpz6wIbEUwBNlaz8lj7snVGYZFGdUkAQ9qLVQVzs619DRkEviJfz+Q==
X-Received: by 2002:a05:6000:250a:b0:42b:4961:eb4c with SMTP id ffacd0b85a97d-42cc1cd5cc1mr10385337f8f.1.1763941675585;
        Sun, 23 Nov 2025 15:47:55 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e598sm24494734f8f.4.2025.11.23.15.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 15:47:54 -0800 (PST)
Message-ID: <0b2b8352-4ac1-4a5e-be73-67b5cffdb934@linaro.org>
Date: Sun, 23 Nov 2025 23:47:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
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
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com>
 <20251120-add-support-for-camss-on-kaanapali-v7-1-de27f9a67ce6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251120-add-support-for-camss-on-kaanapali-v7-1-de27f9a67ce6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2025 04:43, Hangxiang Ma wrote:
> The Kaanapali platform provides:
> - 3 x VFE, 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> - 3 x CSID
> - 2 x CSID Lite
> - 6 x CSIPHY

Another nit-pick which you don't have to fix, I can do this in the 
commit log - but, you've not detailed the new regs added below.

---
bod

