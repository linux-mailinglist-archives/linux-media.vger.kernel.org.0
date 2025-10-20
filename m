Return-Path: <linux-media+bounces-45081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF46BF34EB
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 21:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69B8C4F23D5
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 19:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C487D2C327C;
	Mon, 20 Oct 2025 19:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WkeJBh/G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63255332EBD
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 19:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760990352; cv=none; b=N9M5m++S8/4fOIbtggxHgT44QzN5vpxS5U4pqAULH5F+5P96k9XcmfJVSoy9MRFOC+k3aF3gQveAFCimxx8U3RTrxb+MWzlHErglZApc0AwayUDgTMoB1cfHdLQestYP57MTtgGgA1t800DrNKxdO+GelJ8QkEONkkWruNdhr2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760990352; c=relaxed/simple;
	bh=RGfpAN5rzMHTTLTFD3Loxuaxwb3861xuxa5WQkx+zXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fj6pVXIHMOXifpWayngl02kmNRWPL+ZcbvLKhNPQ5S3f1QeZg9IgT9NU7dTluEEJVLXkwW1V69PoalWGJygzgPbqlOLgBoLjDymaKbMLt8hHY6jU7iji2l+AnISCWs0Uu64KFpUtcI6xg1PJoHNil7/FUks9kub87zQGB9mU52g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WkeJBh/G; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-471b80b994bso28354135e9.3
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 12:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760990349; x=1761595149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGfpAN5rzMHTTLTFD3Loxuaxwb3861xuxa5WQkx+zXw=;
        b=WkeJBh/GhWNSApkJsZAVMbPiFNLpdO876HgkWJdzb9VP2jbuW1zwgZglrrkN6KYALG
         BCtVRlA5lRrBgZg+Rtw0CxE8iy0/x/spNUHaOkXaueLrK4wBDNG0l0LRP6BiSHOl+W9Q
         1Zq5SzvKF6E9GI+zsojA72FKsiOjlLF77Me90JIkujGAZVkuxGB2MgVKdXtppKQJa34M
         LqprURPuLU3hhqGO3LXlQHYyLX1DvUZMOp8/A5FLRgunTmc816GkVlHXjm/jnTAUVsox
         2mAHrqOXwcyiaFc036goSvI/yg4benKqGINRMrrv2IxbM6xM5kkRudprrL/G5fKQycDq
         7jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760990349; x=1761595149;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RGfpAN5rzMHTTLTFD3Loxuaxwb3861xuxa5WQkx+zXw=;
        b=mICLF3xgEP/lnwgYbuK2QRobqe4U+BieUuiN0xJjLSZTKL9iQIkqJ5pwTq5lLzw8JX
         bAjF2WJjC6q4DG3wADCi55KS+cVVyJRZvXyXMHPicqQnf5N0P5SpFK7eevfERfRy82V1
         /e3y1bamsZv4RA99NOKOhafjPhJjc8CIufqdlFbj9wOUoXbW4VVwZCBjwEmSIX2cllCS
         jngdZwwl/FxSc2Yxn4mneI8EDJoIOAdkB2Vm3D8L4sye8wM1+JxIM6lXWevzoO3H1+NE
         Yw+dH0t3O4TwWOtp4nqi2ToXNT00ATAVq3rSWKvHEc5j4ntPskCzpGM/M9L7QJU8JaQy
         C4ig==
X-Forwarded-Encrypted: i=1; AJvYcCWYRlN0rvZLs1xiqmVwZS9ARFT6gFKrXblT4MWoiTjPqGrtvWVE+1OZgVS4lfKtyQtJVioeJRKpyW8PoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLeN+H21OgcwDShgklI4HIK9mKLRpPexjm8V19GPelAuzvtk4R
	RvetA6sZGnzgJqzpewR7JXJjsnQi9F5g7nkAQ0TL4xir/IFMbngB0leIP4V+MkODPhQ=
X-Gm-Gg: ASbGnctt1MO2YqWkbOMIvTmhxNCr0Pxz4xWRPXzGxrqr/KPyxy0FlbWySe40EFK28Z7
	99oZq3HZFJj/P8NbDE6hED/aaE9tyOEccu2dGZwj1ee8k9ADrwsRLzC0eMg58UHQCWcnCxakx5o
	k6KEmVim4457tb4+0vs4MqXR7+k2aXRIkfnLzLWu+FOdkncF9G/cufUQcVeECSkRLNzlS0FrTrR
	9mMWl/xzsVczEkX7/tu+Jt7NBv0h1awcYIiEXZDtc1bhmTIiZXl2lsjr74WnoHW+AF1nJWPiDq6
	oNB6+R/rifQnGw+PsgdSkmOJ5PP31TbMsrdTgefCJgwxttk8OfUEwZ1k/JpE8/8Ffx2FZ4LJzQ9
	y7mt3Tsx1lWJroLa2PqgM7mAyKCPKpxAYyveMpxy5vVmWHlQ7JHg8br1pUkqb7PUnfIfTiKqX3G
	cM9/fBoShcNAl1pA9LI8bJo9IWJJ3/TmN6nfhhzmF6O7zi/QCqPyxV1g==
X-Google-Smtp-Source: AGHT+IGvccbSI11XJaSMgNlpFHKrVHSLfRMXa/L8Zy3VVZh4FfZmD5f/hOBseLwrd7XiHIRl8wNufg==
X-Received: by 2002:a05:600c:5298:b0:46e:432f:32ab with SMTP id 5b1f17b1804b1-4711791d1e3mr108234665e9.33.1760990348602;
        Mon, 20 Oct 2025 12:59:08 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c900asm247164875e9.16.2025.10.20.12.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:59:08 -0700 (PDT)
Message-ID: <c1fae486-ee56-41bf-b3e9-e2e2a9338d1f@linaro.org>
Date: Mon, 20 Oct 2025 20:59:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] media: qcom: camss: Add common TPG support
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
 <20251017-camss_tpg-v5-1-cafe3ad42163@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017-camss_tpg-v5-1-cafe3ad42163@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 06:06, Wenmeng Liu wrote:
> + * Rreturn 0 on success

You might as well zap this too since you're v6ing.

---
bod

