Return-Path: <linux-media+bounces-25133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEADA192A2
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 14:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40EE21888D7A
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 13:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88D0211A3B;
	Wed, 22 Jan 2025 13:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AagZ32jl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B572884E1C
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737552829; cv=none; b=qf2NxgRXJxdqn9WG6gtMUOvudX6jlldsJEGjl3PBhtkDyKO6ZVCuE49H57i0Zid/QBz7H5UZ+17cURjU3D2WfLAtkMCElmUoiaTY/J3vPzmt52ilYzCzXDCtpCXAdlzD40D56nekcw79amRKz2uIYVVZe4Xtp99/w5lcb1UEvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737552829; c=relaxed/simple;
	bh=m00pGdrdiUbcfAFkoBJjrGn9EGlSBh3Nl74U3KWth1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWExw1KYsxw7PhOGfWNU51/i7l17dkX4sAPywzaqojQ+p3jDRPgtghXEwZ+SfbhLq7VRG/Du6IZ1I+fy1t2XJ8x5Hl8iziBS0dFCOFJSH7HPWSnV10IZR6PpAc5tCEQJfouCSVzw+lwKlJwKH5qrjCEHWM3xpu620IJ+F6ZFKtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AagZ32jl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so79563745e9.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 05:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737552826; x=1738157626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d3zmeBfIC61RiU96YsBq5R1wU/zQYsnrBBTYvAI31yc=;
        b=AagZ32jlKQJrXYTe2M9OfxBYmxrL2T9W9BanVkf50dWIv5zElHA8QyH5Zly+/oy9oY
         Xq+8JzdioR04x2SyIAZY4xhPufD3tiRqRoFZS8LVU71HoyDXEnNAUBF34Am/tUGU9vc3
         xoHkJUTKgJXl5DibgtOiSXSqFW3w/Wt6xvdsLHpODQohtAud4DeSw7yt+t4ck46PHgjW
         ycN2JZrNEfYbb2lfLvMS5Kaqz771QcbGCg1HFw4fk3Ixny3f+tQcJUenJMtSLUzfsa6Y
         EahQ3e/7qshmysyBaXuey/Ti09XdrPT09jiI/yhU8B1KdGsklhUyYVzAet/ki9cZ7gfS
         qmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737552826; x=1738157626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3zmeBfIC61RiU96YsBq5R1wU/zQYsnrBBTYvAI31yc=;
        b=lMckpDdKMZdOtOmg86n1ucuboUl8q1jkmGtAFfgM5Y9HXT2SVBbnJ8Ffb7i4Wt3o9z
         30s0qVS7s9FlRKJ1vEivgWtgjSaoAGsZFnMYURGEwDcpE4oFDGWhhGYddGVaiFkPscRs
         SW2AxyhHiDoTmb1YWrMMhnnxlyjhJ4Y9V4i1PKceR4te7dYJWkO6SHMHzr4uT0emykrn
         NtAoN57I7lWuYxzyVg9kN4iGayOeZf9ufwbP/Erd1kCVYtB0qcxGAYF0lAPMTnSRLsc1
         mRVrYUgrwubGfy9saFxYSA1FoLTqxO0xar9fWWrwIDv+9GDz5YJ7ScYeOoXleGy6JNA+
         hO4Q==
X-Gm-Message-State: AOJu0YxvPLE2YnvYYFiJ5aTnO3RDel9zQrUCl+nAn5pGskW6XTY7zjST
	YP7R0c+rxHHi7itFoc9DxF5fo15IOCe1oZgrjlF1UJ0BjZcJJmF8V8v5qdtvwgg=
X-Gm-Gg: ASbGncsuBsb+MtEH/gh8o3g3mbwDAzVX5w+GT+KsMVE1oRYxOOIaWltE6UQRsW+C+/U
	L3WaWWAyUsX6hgIkNX8vhMEzPRyQ3wE/3cnxpruz90bdCIjMy6E9LdbE0R04Wu87b1wKCJZiDLg
	GtiRlmySnILlBts6QXg3uGkuCev/ZHl4R/muaJqA0IWL2Z34A4/HAQ78vLKSvmFhqfKSm+CLQZv
	UXQqStaK5Hsz9Q8Le8GqRfMDSKrN1sD2GcBi7PN29cR5I77/vD56GykiEPNKOiYmcIAbelIj1/p
	mz4mSKc=
X-Google-Smtp-Source: AGHT+IHBSIsZ3dHZTyI5GvgwLt2i3aIBO7yUOm44moO+c0qsisQdHFooBLIXj5yWn+ZKDMN/HfTtAw==
X-Received: by 2002:a05:600c:4684:b0:434:ff25:19a0 with SMTP id 5b1f17b1804b1-4389141c420mr164276075e9.21.1737552825969;
        Wed, 22 Jan 2025 05:33:45 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221c30sm16572315f8f.32.2025.01.22.05.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 05:33:45 -0800 (PST)
Message-ID: <c36425d5-a131-447c-9ffc-ed90d8e18fc3@linaro.org>
Date: Wed, 22 Jan 2025 13:33:44 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] media: qcom: camss: Add CSID 680 support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-3-44c62a0edcd2@linaro.org>
 <62913113-e3de-48d1-9977-537d84ca8312@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <62913113-e3de-48d1-9977-537d84ca8312@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/01/2025 00:05, Vladimir Zapolskiy wrote:
> 
> Sorting order is not preserved by a preceding changeset, unfortunately.

No its not.

I'll just add a patch to fix it myself, no need to hold up Depeng any 
further.

---
bod

