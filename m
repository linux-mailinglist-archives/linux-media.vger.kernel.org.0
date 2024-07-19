Return-Path: <linux-media+bounces-15161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E726A937D74
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 23:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B7E71F215AE
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 21:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE062146D6A;
	Fri, 19 Jul 2024 21:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="nFnkxPAM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AD639AEB
	for <linux-media@vger.kernel.org>; Fri, 19 Jul 2024 21:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721423962; cv=none; b=aNb1Nx+p/aKwzzdycF3IU5G6h84NaqqGrwv/uByO40UIHZ4b+HLQWsnbNR0AoAbEjRssdr03jr/Lug3BNVc9lBY6JwEbRAs4bISZ3dWUgrQas/TwFTCxqXrOMp7LpjOVQ+3MXsIWiNu/1YrPkexss8LUc6ME9Mo4UJhYsslX+gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721423962; c=relaxed/simple;
	bh=anGPe1jL8mfkeZ3rYjZ4CEW7jbXetH2GTg9kNGwce0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+lF3A62/5iAtvKHsf8D/6VJxS5f1OAVdnLi0asRbvoJh3rk5w8cyro2AgXb/9NDFLZPcJ91kl6zCGTfHG17+EDfoX0nYQPMV3H5uX4xbhCSXpbDuy9CTzB2DiUyyuOHzWwUn4QXZ8eZPShmCt6DGHFAgd/uYg3Ou7/j6XOetf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=nFnkxPAM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5a1337cfbb5so1637690a12.3
        for <linux-media@vger.kernel.org>; Fri, 19 Jul 2024 14:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1721423959; x=1722028759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2pdweT5noKAcgg/o24Ev1dG79b9ijlNqQ085cphOCo=;
        b=nFnkxPAMj2Zi4rZFLAiebqd/ArQvkXnWxQEP8DLk43K18z+bad48y7cz2mBsmfbiGz
         PK3XcU+8LoS0PbQw6VW83yMTQhyH0SacP80/5/abz9wbGRE0Z28cgQzLS8zPsrduLvdu
         s1s4KoIrtIEt3cwfBZREbgp5yjLjDwUpd+Rgfz/Af15PzsvbwNMgUlWweRJp9GlZf39v
         kPzdce/s1Vw8Xzd+iiJWcOGYXCJ4oC47I+Pj28RRpZnonv32xXNPw0/tXWYdaTkno2ls
         NPMxqUhsBPGlbwmxTy8CuOie+H0dITwdt5n4XoGgT4yWbSSVRfs1D9t9IG8U9/H1MrL2
         srDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721423959; x=1722028759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X2pdweT5noKAcgg/o24Ev1dG79b9ijlNqQ085cphOCo=;
        b=h59qlUCoYdPRitaDkEApejXXewzyfURriBaBsb5g7ZcYU5AdamXl/+7tava0kegDKD
         MiD+6RskDSX3idrA4Szln3XObFB9oEVJAjfC3/YB1EoD5xtbD0Wbzal07OxTB5sSeGV0
         y0hyCH6eboCoOAzwX7uhhhnx6lboUu+tySUjrNYtmJIJNclOSRr5jBE02qUnyaltlXrj
         2fTaQOf7HRWygz002muTeb7AWPPoGf4UGgbs+frwBJRSevpU6CBmYy31CdwfOOEsO4Y5
         ZmiXkjohjV//FyCSuYtOnN9Of6wxzBBSBpzBuWK1Fgz4kess5BWxTV6acqzRL5gadBtB
         W6MA==
X-Gm-Message-State: AOJu0Yw3VwOQsMCrm6/WtltsCSwTThzeBUrR30D8e5gji33SjhCRlBuv
	hlwySgtkHGbUMneoIMVWcjDCyC/Rlip6J+ZGz8QFfLpbgwi4/MzCgUGtKA==
X-Google-Smtp-Source: AGHT+IH/uQLC2OyqdGWzAQ8uPxwsz1NzhX8F++8NvbgEhoqlbfMtZx5mZsqHc7WWmxyBZW3wJwrnqw==
X-Received: by 2002:a17:906:ccda:b0:a77:c080:11fa with SMTP id a640c23a62f3a-a7a01337711mr571129866b.48.1721423958527;
        Fri, 19 Jul 2024 14:19:18 -0700 (PDT)
Received: from [192.168.0.155] ([91.67.17.104])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c7be6e2sm76475966b.81.2024.07.19.14.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 14:19:17 -0700 (PDT)
Message-ID: <7de82157-adc9-4402-9e60-92aae885a776@googlemail.com>
Date: Fri, 19 Jul 2024 23:19:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can you make a new v4l-utils release?
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>
References: <13a4e596-1854-44b0-842a-8f19f17fce15@xs4all.nl>
From: Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <13a4e596-1854-44b0-842a-8f19f17fce15@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Hans,

On 19.07.24 08:19, Hans Verkuil wrote:
> Hi Gregor,
> 
> The last v4l-utils release is over half a year ago, and Nicolas would like to
> have a new release that includes the new v4l2-tracer utility.
> 
> Do you have time to prepare a new release?

I released and tagged 1.28.0.

While preparing the updated Debian package I wondered if I could safely 
switch from Qt5 to Qt6. Do you see any blockers?

Thanks,
Gregor

