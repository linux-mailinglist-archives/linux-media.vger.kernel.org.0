Return-Path: <linux-media+bounces-17120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE289640A3
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 11:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6249D283A1B
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD06018E042;
	Thu, 29 Aug 2024 09:54:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CCA166F01;
	Thu, 29 Aug 2024 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724925287; cv=none; b=HpDZeubbEg0DJz3zis5ZuUatjFfilRU8i5PtAhzs5umxQI/XKSwcpa4pnqG/vHTEjN7QfJc8v9VuhS7WYpb7LIwYvijXsGWqNrs/+2sHjtv3451YZKn3lHC7WCWrcFwxWZKiGSJR89WQDzkAvNvfVGNDESfUj7MQJiVyPyyD9o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724925287; c=relaxed/simple;
	bh=GR94o0/hnkFOcdTPGxx4YvT9bFyof/P6oOY80AzOvug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSH4DpLatewSnw8VKacDiI0pXwd++M8Bnem7VqisUi0vRANGCh+OHxs2naXcl6b3b7Q2DO57jLOqZ3LNYQoj2gS/GsKvy58wGINelrC4vDkgVVOLCtd2gCcPzwtOlibDEvypdbfuCVT8Vgnv55Romn6jwPAm9oSGu6++uJN87u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so4120465e9.2;
        Thu, 29 Aug 2024 02:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724925284; x=1725530084;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niPeFODUw2C4h49CRj80TyLm3GDcVImYtPd60cjwsbo=;
        b=UOxGKFeWloGXj55aHGGXpojkks7QCcru0G6QA48MYOdm3CTxfqb56ePv3SaMvruBSW
         nYeYI4a4iqYuq2StoSB0cL0BQonBmiVU1/LvvvWKy0BwLK6glJzcESKxdBnVBk6wc9MY
         Wpk9fJ3/qsIO+MCoRDaEJ8yvVIvYTAmVSNaBTKicIw4Zw+wpb240fE/VofcOR1wdFwW+
         gT2pu66hBMGJZSdoGchdCTEhiwfi3bJf+Lf5tNp1aYSiZQ6Wv+UVfnf3oWUVh4YVfFIJ
         M0jt8mReb11b1LqXV/b8RWSSbIwmOKAVEDrhT10462KLQWfO3djVXkuV5aylw5vRDz4b
         HnrA==
X-Forwarded-Encrypted: i=1; AJvYcCUPuBQ+MAkC0rZhvdacKda+YjK4SckigB2XFgyWmZtFFALCLMR2AI1Z7Mtviq6/dxl4joNdGhPBbX5mE5M=@vger.kernel.org, AJvYcCUlkP432LlqU636QsGNFb/wqEJI/LYg8tDLpwrThhBERy/aigjDpn6cEeKatCad0zfXwf9YXlTYI3/f14Gw@vger.kernel.org, AJvYcCVWLfX60udLjaZPliNtkNmXE5KjnALLDx0yxWsiXeEeLt+mMj+tvgHDcG0afW96bovkNKEwGV4/DsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHSwwmx9y5ZzZt2Wtka2KiQBa/KBJJxihRV9o8eOxoWHD0GP99
	ZpZc0IuQAoNEuWPVxDCuC8NcXBBg42pXvdqfS+Z14SNPYz8ULcQ4
X-Google-Smtp-Source: AGHT+IG70tYW460DCvJzDeWsHO1wfd/2vUM9RpiC4n27/tyqyqbizBuo09ss/RAsEqmMs5l+EniPgg==
X-Received: by 2002:a05:600c:1382:b0:426:6eac:8314 with SMTP id 5b1f17b1804b1-42bb02c1647mr17692475e9.1.1724925283521;
        Thu, 29 Aug 2024 02:54:43 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:69? ([2a0b:e7c0:0:107::aaaa:69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee7475dsm965033f8f.27.2024.08.29.02.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 02:54:42 -0700 (PDT)
Message-ID: <8bcddd10-6699-4e76-9eaf-8768f1c1ae66@kernel.org>
Date: Thu, 29 Aug 2024 11:54:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] math.h: Add macros for rounding to the closest
 value
To: Jani Nikula <jani.nikula@intel.com>, Devarsh Thakkar <devarsht@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sebastian.fricke@collabora.com, linux-doc@vger.kernel.org, praneeth@ti.com,
 nm@ti.com, vigneshr@ti.com, s-jain1@ti.com, r-donadkar@ti.com,
 b-brnich@ti.com, detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andi.shyti@linux.intel.com, nicolas@ndufresne.ca, davidgow@google.com,
 dlatypov@google.com, corbet@lwn.net, broonie@kernel.org,
 rdunlap@infradead.org, nik.borisov@suse.com, Dave.Martin@arm.com
References: <20240826150822.4057164-1-devarsht@ti.com>
 <20240826150822.4057164-2-devarsht@ti.com>
 <Zsy-8xXQ01-JhL0m@smile.fi.intel.com>
 <9c41f6b7-6b06-cd5b-74bd-24873c4beaf7@ti.com> <87frqqyw9r.fsf@intel.com>
 <0b06794b-34c5-ec0d-59c6-8412a8789eaf@ti.com> <878qwfy9cg.fsf@intel.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <878qwfy9cg.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29. 08. 24, 11:19, Jani Nikula wrote:
> The stupid thing here is, I still don't remember which one is the
> generic thing, rounddown() or round_down(). I have to look it up every
> single time to be sure. I refuse to believe I'd be the only one.
> 
> It's okay to accidentally use the generic version, no harm done. It's
> definitely not okay to accidentally use the special pow-2 version, so it
> should have a special name. I think _pow2() or _pow_2() is a fine
> suffix.

Concur.

-- 
js
suse labs


