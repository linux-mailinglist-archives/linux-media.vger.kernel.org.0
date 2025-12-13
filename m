Return-Path: <linux-media+bounces-48739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E5CBB444
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 22:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97AB4300C0FB
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 21:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6A630AAAF;
	Sat, 13 Dec 2025 21:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPBhEL5+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4401A2C0B
	for <linux-media@vger.kernel.org>; Sat, 13 Dec 2025 21:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765662596; cv=none; b=tBdMAqc/zNIC/7Fjxj3QhWYtNkp3qGtyas8Us7fQhQ+7WIkIYR/Udb11fQWZW0UJFXxuUCkRJ3jHVj85kTNYXHMU50lOiSRyergoP+bL3zJMuiMXgsZKK3gNYw6pehvHxQN6zwAXz80TA6g9LQs5WJ3TmUhV0T6dH8N3ndlNo4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765662596; c=relaxed/simple;
	bh=e2pcb55PyYuPeFtBxr5wEMCUjpf0rvklOlW57bPjGFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2f6F8wc1oAx9kWLngsQjM1zDED38ExO6CwXFwoXhdp33ab4NvTGf08mBMYrLfCfMDiClOUhz0+I6l1uq2TkyKqwx5OkH7pCR+uIin1/xiKBtCsKfPd/d12GBKj033vYaGBjpYD56PTs0XuTmulgMWD0rOrfSVCp4RtQ/83LS+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPBhEL5+; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-888310b91c5so20633776d6.1
        for <linux-media@vger.kernel.org>; Sat, 13 Dec 2025 13:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765662594; x=1766267394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/YKlck/CCtYd4yJQrHwKCnRYQwMh7R9tEpASg0oKNV0=;
        b=TPBhEL5+75p74zT4KCeLOjfS/5m0h7WpMelWc+6Y79dzgFURMv95p4Z1scfTYzzS+S
         m2Z31PnBRC+IMmdIdVJ+gWA8S8DsfFM+PxxS/TchblkJR9dlr9dhbS5nI+Li9wh3DhyH
         ox1sRLSxHjvJ4we7bk1HV9zL4DmzEWq/Ma3hCsW8BelQqpdftm9+49wNaSQfKMDNeA0B
         q9To8mRnxdkOwlJ79jLDpj80ff59kLye92HmkSCpuzg1hRUGfX0PpQpXwcvHUDflKkR5
         yMQiTVVk0cos4LgCJFZXn0SG+1lL6ej5pngpjbRkVwmVAuBNPEkaO/RFfFTSliyWMDZ2
         I1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765662594; x=1766267394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YKlck/CCtYd4yJQrHwKCnRYQwMh7R9tEpASg0oKNV0=;
        b=SQ07D6i9QG75HMuH+0ZGVafmY3gDZI//cjhpICX4n/Spe3swF9q0zcEE2jM+qwQNCo
         V4uiBvYEsew3uOG/h0rAAfISR3icBs/aq4G3tnFW2eakz1HQPp2qprc5sit/IaL8izkg
         S0pZ97D6GWXuEJw3/6VYTjC5ndzgW7gl7nF45nN+A29Iy9AobTr3+mXnI2haz/n+QOpM
         OwTR5jVh2bSXc0g9cMAE8LgH+95L9cLkxVkBayBW9vO/pss6e8VKq81yn2Yd/LTKUIUe
         NIvd/bf/dMC3wMtzu/7kvlpbm4MHElHEV/Xbr/z8HzMpghNMBkENy+wGJ9+LFdnv1u9h
         0nKg==
X-Forwarded-Encrypted: i=1; AJvYcCVrLXfDrwzIxjIvRJdjTecqhyAL6il2CYy23n8IpWAKWegGpqjoirAO/QhjHA2TEMLBa3KPQS9iFf76Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqZPd6Ru7IUnfmJojvkPYDKTByuEyp6pfhOR4BMKvzU7faVkaS
	gzXEB0nck1En7JaL4UqZknMpk3LcUpZUz7YVNoGwVN94upxE3mEKiSVv
X-Gm-Gg: AY/fxX42FKUuFIGz6yiALv7U8JMHD8oUnF/rRMU1imfeRiNVJeUG+HACDlJ0g7cHPap
	8e7zv86u4D2MCUHphZ2iH/5ajxjdWQJDn2cSdJ70gPgQ2X7iU+oPXtySdv06x660M70z2ixup9i
	NM1H6e0aR7WqJEGbA8t8I+NbjVZgvTtUrei/xLDNnPp3Nsx3Uq/RBdfN2cIQ/Q5Tp2gFJd4+brf
	v/S4CpR/PRGGBtK4um3p+KuDHIHX8OEl85kzqC7Yw3qLaWatxvI6oqR6G1vkXe1yoOWpjbmkMYv
	c8kaJ+hpluiihq2EkBCheAvQiHHKrjCLbw9QALBynlrxmyNv2v1rWqnEnu/V4DSqwliLdF7MXIi
	SWse4qGqTadtQfO5Ch5zG+jE8yXQqY6SfuLGFJZ3Rf+ixqBDTv1SN95mCCvNZEdK1DnRp9NtmGX
	liURnZSNq9IeBLqg==
X-Google-Smtp-Source: AGHT+IFYIq8qsqW619ZKElnaxqHH6op4Y8u4AELFLc0W1TCE8Lq3LVxJ+0WCm0xzFjN8cNlD19ZF1g==
X-Received: by 2002:a05:6214:da3:b0:880:837d:aa4c with SMTP id 6a1803df08f44-8887f2ecb40mr91238556d6.28.1765662594142;
        Sat, 13 Dec 2025 13:49:54 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88993b59838sm20844186d6.13.2025.12.13.13.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 13:49:53 -0800 (PST)
Date: Sat, 13 Dec 2025 16:50:07 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <aT3eUlQuwXptSFGD@rdacayan>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-2-mailingradian@gmail.com>
 <25c8ad84-2a3f-4e09-a32f-8af68379858e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25c8ad84-2a3f-4e09-a32f-8af68379858e@linaro.org>

On Thu, Dec 11, 2025 at 01:02:49PM +0200, Vladimir Zapolskiy wrote:
> On 12/11/25 03:48, Richard Acayan wrote:
<snip>
> > +  reset-gpios:
> > +    maxItems: 1
> 
> Please explicitly document that the reset GPIO is active low, and make
> the correspondent dts changes.

On my local copy, the DTS already specifies active low, and I haven't
changed it since sending. I'll just change the dt-bindings.

