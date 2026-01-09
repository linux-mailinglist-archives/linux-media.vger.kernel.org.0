Return-Path: <linux-media+bounces-50284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C44D0AC40
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 15:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DB643016BAC
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 14:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB553115B0;
	Fri,  9 Jan 2026 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="laVuaSkZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945E73115AE
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970709; cv=none; b=RGNd8aEQBlw/djQ3rH1MUEsT5tKuYd1WucO5efKgr/1c/LSTONL3R9ju5Jjkge8bRgP2K6JuMqZ4haPlAMSlMZBCkL9/u4a3jqWGfoelc2w8LaEUhPLMO+6UR5enlPpi+l76pTlj5VFRYcdACgfNBLy3RZEztC3VLcdPR+4VlgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970709; c=relaxed/simple;
	bh=beZLShpvCx6q40/gob7SBHTRFvOC3vhNmXrChey/qHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ltOKqY5UD6Bda9KFPrGOtZuD4IrbA3+V+1wWW4e6rxQpu52GLWSVs7JX/NHFDJZCI+1MvduOshPKCm+1XWIoogEOBV1cxnCaVAOuoS1+le4muuWULIVeW3XpwRfDvhlFIA9CI58T5qujDJ027EgRfNdS5n4x3IB8p9Mcyk0q4As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=laVuaSkZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so24520595e9.0
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 06:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767970706; x=1768575506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3y7l6Oksk3QzETmQ7FC3JjIhgTCh90d664PehqE/z0=;
        b=laVuaSkZYsMQLD5cEQD9OZwcNVWOl7GZmJqd/Q672mvj72aTKPSJPXKeCFhytDYZUY
         MSvEXFuq5+2UhrXu0qSMWFHoZWAuS5cyWcJ+O/7ulkeS1UZAkuacJVkIc0maOtwmNu7u
         8KEOTxBHtiNvyMBR3sxpgPis524XguKbxIYiFsbzbKhTXY16dF/R+iOzCGXe7K3DklkB
         QSALVGzLlEFwoBO3A2sRNo8CG+Ofhl+/pG1BtMO/VzxItDN732vHjBMdhSJN6467r5Ko
         A6wzTf3RN1Da9K7eupWfZVCYvwGygLXzX8WWEpIUOnUXIQ3yg+0RrWfoOSd9oM+R4Rzp
         CmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767970706; x=1768575506;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3y7l6Oksk3QzETmQ7FC3JjIhgTCh90d664PehqE/z0=;
        b=QgDz3gpm+Z8jifvOCP9jmpJKOvViuG7qYhK1RToTdfPMhnC2UdirtXoaGstl1lbZ//
         MFrETBkIDTx0JxQ54xVSM9iTvXwECr+Ma0YmXBplQZceJh4Ey/r7HNQCEgmH8Y6kOEWv
         9YNQh5VvHQuzPkdawQ2Y/jKqgCTWMfi3NEWzTCXcTqqOQ06/hFvbuypqKIkf18uqPkkT
         SrG3lgdbBhZJosRkdxfrFP3YsNO6wg4P/ssOGYgxgF6hFrr9HLGxZCwxiWaAC+G/eRrM
         9r1qbvG1TYwvA0K1guaC/dTQXbtZbZbxxahKXxQl79+8zZULJpjkgHv6s1CnnXIBCdwZ
         ILJw==
X-Forwarded-Encrypted: i=1; AJvYcCWstORW7CNg6fhmhzFGe10jYWyvIcLeaBWBkHl3W5xDi/RvpbXr785nCGcSYhPF7goXqauWFEWSaZ/ZmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz27N280LuV8W8yl+vOuwdFaSUIkLcIt21Pyzh+k2DmJeVMRy7w
	GAeyZuJLbDJM+lOaFN0V2dDb5XBUgEsX5vZOXdO127fiz7CQkKvojh81iWnLj0pyugo=
X-Gm-Gg: AY/fxX4FQDGIK/uJ5HS1JCdqbotUXGbBfTPtKgZuTz/lI5+5Ro6UPbjeW0BxJ9qdhjY
	bi7lbzYnCJEsIpUI/+Otned1q0VdwK2R25sD6j/2TV+Gqj2qH2rNSreC8mL2eYOz/PvNl1yox4S
	3L09YnqOnqjCHs6TdO5sGfTV2W3tOHY9I9AFSTLyP8YTSKs524VQoRGy0RuZoVd7vKOhL/BaKNd
	BAH/nuT/H37Yojb9Wjwq2yVum1DYQ4GlZHOX28MRjN1M/LIv6Y7vQbeEnuWvMzmLp3ZPHcNHnsU
	esIa56kKm/Krg18VVppE1HlIhSmi9j/vqSffvt2MCbA4LOV/xIlWEFO0047SbRIz+VbAPjrw/Ka
	0Pi33Ln68dMt8UMAKXd2sKpRK2v4lVyS34KoQQ3itTpsPmqpXJPvsdWeIGHUmfhM4Tt3DhB8698
	H/wXSzUup3X1H5Er5Z1gjNOQ7sLNge68+MYg9r/ker/jzr0M8GTsTRqs9IkBl3qGk=
X-Google-Smtp-Source: AGHT+IE10qtTTvpifNaH6iGjIokQigTLlrCWVS3rMBPmfZRI782VaqCSwvzKVAeRor6aTRGNE8/Bdw==
X-Received: by 2002:a05:600c:3b28:b0:477:8a2a:123e with SMTP id 5b1f17b1804b1-47d84b41bbfmr114581785e9.33.1767970705825;
        Fri, 09 Jan 2026 06:58:25 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636cb0dsm75966465e9.0.2026.01.09.06.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 06:58:25 -0800 (PST)
Message-ID: <073784d1-d798-43b6-b6e1-baf818a66fb1@linaro.org>
Date: Fri, 9 Jan 2026 14:58:24 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/5] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com>
 <20251211-add-support-for-camss-on-kaanapali-v10-3-39e8874dcd27@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251211-add-support-for-camss-on-kaanapali-v10-3-39e8874dcd27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/12/2025 12:03, Hangxiang Ma wrote:
> Add more detailed resource information for CSIPHY devices in the camss
> driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
> that is responsible for the PHY lane register configuration, module
> reset and interrupt handling.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

I'm giving up on this series, please rebase.

╰─$ git apply --3way < /tmp/\[PATCH\ v10\ 3_5\]\ media:\ qcom:\ camss:\ 
csiphy:\ Add\ support\ for\ v2.4.0\ two-phase\ CSIPHY\ -\ Hangxiang\ Ma\ 
\<hangxiang.ma@oss.qualcomm.com\>\ -\ 2025-12-11\ 1203.eml
error: repository lacks the necessary blob to perform 3-way merge.
Falling back to direct application...
error: patch failed: 
drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:588
error: drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c: patch 
does not apply
error: patch failed: drivers/media/platform/qcom/camss/camss.c:34
Falling back to direct application...
error: patch failed: drivers/media/platform/qcom/camss/camss.c:34
error: drivers/media/platform/qcom/camss/camss.c: patch does not apply

╭─deckard@sagittarius-a 
~/Development/worktree/merges/media-committers-next-qcom ‹knp-test●›
╰─$ git-log-graph 
  
                                     1 ↵
* 84de87a909327 - (HEAD -> knp-test) media: qcom: camss: Add Kaanapali 
compatible camss driver (62 seconds ago)
* d6a22e0ea1d47 - media: dt-bindings: Add CAMSS device for Kaanapali (70 
seconds ago)
* 336367fab9b96 - (media-committers/next, media-committers/HEAD) media: 
chips-media: wave5: Fix Potential Probe Resource Leak (4 days ago)


