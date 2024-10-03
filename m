Return-Path: <linux-media+bounces-19021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F29E98EBB2
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 10:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 410FF1C22411
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 08:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D2B145A03;
	Thu,  3 Oct 2024 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMrzzQTR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D19013E41A;
	Thu,  3 Oct 2024 08:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727944492; cv=none; b=g1ABFSBpUkfuwt9qchRPxwhIm+6hmQL+rjKUr5Ln3mVj5dTZr8L4AJlrQYCAVbWVfrmgw4oYwTbiyYG/BYuB8SvydTtL6AkveecARx8ObEl8fTzQFvct/0b6XxhMN22E6wYiei0i0s1fhbjfPeaQTgLVc349ByxxkrNmGxqe/F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727944492; c=relaxed/simple;
	bh=depoTSniyt2pHdizgX8h/eGS3wMTqVguZQ59oJuJrtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDTxiKbYh0ATqpsHzGwVufA9mKo4RLR6MLe+q6kYm1eZJIGcs6S0P3kDSw/UphyQ1dYp7gIrRG5dE3CWJ9B+Rz9jdy3+MXGU/MGPF1W/WeSrXn6SwG4DcpAuBYKqhUy8jqaw/0hDEYlZdg760HqC+9JV0Q88IG3urloaqgznrOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMrzzQTR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so8977445e9.0;
        Thu, 03 Oct 2024 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727944489; x=1728549289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jga7af/0yZ1Zr0GRHjyr4J7ThGzd+ei050RU+9Ps6i0=;
        b=OMrzzQTRsJygvDvplrapQJTAIqixS1s9dWPLsonKLrlBCRxcjxLt2Iw0dKw9jstn64
         MbPidUoSXz32cUQQJe2SAmnGuXRKZ+IeICQuAtJkj/vx68YSKiZylbm9lk180ynlZk3w
         ku+tOWzlLN2N58Ie9SO5Q7/4JyRnze9QaUf8X0ap50OnvFjNqNOy1k2zZ+2CYshU+3rr
         0sZQqbjYKgL0BvYY6SQgUqm8k25E2w7nqyWsSKvaEphGwerWMoHxK1eZCSVuA6QJOuKq
         jVHJfscUdtieI3D9pl/NL8SwINNdEk3VJbdOf66zmgNqHwJoSITXe0k+lw13xCB7tFUf
         jmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727944489; x=1728549289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jga7af/0yZ1Zr0GRHjyr4J7ThGzd+ei050RU+9Ps6i0=;
        b=nEH6B2rTKe0NpIrqbMzxcb0aKqn+KOaOQ9bkTIeNsct6fCfFTpKtgy807OaPGSadun
         7kYBfyTSxeukuJbcDL6y4JXvkn90SsVixQEHr8+Ip6pjFrDsn04KK4DPDzxBLv+5lCvz
         JPo9DCB6lzTBaix77lTXHLMpaVq2+KCxaJcNtMGksvkU5x2tLou4plFL4zbtxM1Ra/1S
         rr6IW1BFy+g/UbHdzlGHr0I4vrP9hGCANBytEgqjfzK6H7Bf/5jCyNRLGBq0T2afNI8V
         XOpJ1+io/az6oQ5l1jhTFxiF3mReK4R0mkJ1Z6sUvab2JMm49CiWvMHnkrqN3WE6ul7T
         rReA==
X-Forwarded-Encrypted: i=1; AJvYcCUdnq4VdTwA3C6ZoZENv/pnhXCUrUTU2k+QrE5HlWSh+ub1Vv+Pmh2KgV6Ep5GXfz+4/Me8Oy3EDOuVOxU=@vger.kernel.org, AJvYcCVpmlzPUE1dD2eME8I/oGESbpR/fivXEGTNczsl3wJbZhcoh7mJg0rfTtcVsPdUeC34ecexa/fpV8urtweTzTA=@vger.kernel.org, AJvYcCXzJ8ApIICugrpyUsjjIAMAb/qvwTBuEwxbv2eNmbsEbvLmm3BTzTkZIcNL9i8722BdCaWoOLqyCrjaV88Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyHeJ4Mf4YpSJJnHh0TAmhD61tS/2KKbs3T9VvVF1PZ7tJ0JDRW
	OTHEeRH6M2AXGJj2iXQ1kunU4p7Sbv2JwBrONAU8ViVOuooYQsww
X-Google-Smtp-Source: AGHT+IH9D1jOIH/eLsK3Qc/Fd3oWjoALCAQTCBMk6aKstilIJwBvujp0TgRR71DtaXfi+IqRKuyxjQ==
X-Received: by 2002:adf:f285:0:b0:37c:cfbb:d357 with SMTP id ffacd0b85a97d-37cfb9d3385mr5283900f8f.30.1727944488501;
        Thu, 03 Oct 2024 01:34:48 -0700 (PDT)
Received: from void.void ([31.210.180.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d08245020sm744140f8f.53.2024.10.03.01.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 01:34:48 -0700 (PDT)
Date: Thu, 3 Oct 2024 11:34:45 +0300
From: Andrew Kreimer <algonell@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: platform: fix a typo
Message-ID: <Zv5XJXR3BVjy4dZ7@void.void>
References: <20241002212602.11601-1-algonell@gmail.com>
 <c6b148d6-a6e5-458c-97ed-28b64eb7b238@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6b148d6-a6e5-458c-97ed-28b64eb7b238@xs4all.nl>

On Thu, Oct 03, 2024 at 08:50:09AM +0200, Hans Verkuil wrote:
> Hi Andrew,
> 
> Please always include the driver name in the subject:
> 
> media: platform: ti: omap: fix a typo
> 
> That way whoever maintains the driver will trigger on this patch.
> 
> Regards,
> 
> 	Hans

Noted, thank you.

