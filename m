Return-Path: <linux-media+bounces-37526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF9DB0224C
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 19:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98C305A8498
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 17:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1742EF9B4;
	Fri, 11 Jul 2025 17:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMwT/msm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CDB2E7165;
	Fri, 11 Jul 2025 17:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752253572; cv=none; b=OefphHDFNsZgr3Ycd5Uj7/UIHACi3dJwYb45DN3Mg2JhEnorZ/l/xl8M8KUti2BmAA6a1zcTvNUIAXf39pc4Eq6iMT54BGT7f0XvIsbYXzx8LYbmN/yT4H1uUt47W3g8Xj/vPnJ84Z2iOotTbffyhjaUQJDrGM+VSYDmZypA9U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752253572; c=relaxed/simple;
	bh=WrvB8GsIeIreYnuKoMq5URVLOHQy+PAHYcyx6LKjwSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUMkMDSuvJv2U5q/rzhMIQDh/g4PZ0LX0Gw0R6PHuC6747FwPwjUDeAqMbYP9X84PQxoX7gbCeo+KUEkmu00Xl/MuhDOeXBsMhUF8foWtDPkebav2kNeNApMeEebZeMuESJHRAxr6J3bT8piHOCHE7AbMCTBK4FX/X+d3VBwkHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMwT/msm; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553e5df44f8so2118269e87.3;
        Fri, 11 Jul 2025 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752253569; x=1752858369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNAWGrPiwj3E1EhTq5Tl1CO6rinMEagBkU9r1o4zi7U=;
        b=QMwT/msmcMnpJRSHW17BZSqZokjvgeGiBzk5PTL3oL5ybb9yCAioDXFvqvTmg8p7Fl
         BBgAEOdf7xKCWsmlqfbTHyLeOhLOuo79usKoMmQqIVhqTgAHxxk3m8vJCd0N4pOfcHI2
         YG1PbtavdKAMeBsI/1VwOe0VQAwTSO0pM7vHS1XLhjeo1p3c9Q1ncp2ClEr795PO32HP
         SKim3YfezNQ2swazLGt1Vp8zt2hxrsc6P1ehle250GpOEIUdBJdHS/GL85jIpsZyQDKh
         fXDdkeRTZUQCT1x6GUNwyPerlXfT8Lfb/6+i7DApR4/h8viuRLfpQVQdeteGNVn6ovhp
         lZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752253569; x=1752858369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNAWGrPiwj3E1EhTq5Tl1CO6rinMEagBkU9r1o4zi7U=;
        b=xC0Go30WuBHI8U9f7ZoCWe7+MtSZePAmkUZtwu5K9yCXLyT2IKztdNJ1G7qSpGPSfc
         wwI2bXr6SZLPhzSWm75h2rfVPh7gjZY4LAS9b6QS3ZSB5QUqPqYg9wUaMztOsycgjd1A
         C50q4nzOnnLDIuUSP6yRXagQip5C3tshYTAmASNydEsE7Q63J7HmeQUKxDONGIlvFmE9
         fO1SR5B9Fc9if2hIAEF1hRAly5VXdac7Bl/KgU8KrmYPk+qQvFB/rYG9LtWUBDjWRXnh
         76raLGDVN0wMdAFkvK6SRd+Lc56nMnhrVfw2gVH9TDle1KD+TwPeXbD8UjGMPSvvjHq7
         +MqA==
X-Forwarded-Encrypted: i=1; AJvYcCXH0RkrosdEK8HmFCCMtC+HBrbWoMu5ychszG7qqznSWtUnnajPOuFh1Sar4Jxa2y/J36yrmeDJZPiW3HI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyxFEvSMUvHQBKlfeX4IQxHkHcGIRFnO/93sKiuC29g7t3TtXE
	Hjo8U3IYvqkodhA5ydA7SrhUPyEHGSRfFd3U0AmiteSHdQiJBoiDW5Gk
X-Gm-Gg: ASbGnctPeiQQ3hUTujE8Dqw3jqGTvsycKlg0dv+g6SKAusFutBvRizb38uTTvkf4Rzj
	aVx5yX0yOr1sKdy6ZjtX+i+jfbPJ3CL0/I0tdqHoHjb0ao0PD8xz2WVIYEMgXWxn+DQUaJ4ezeX
	mPihTnHd2m3TVJyOwQTT60tQAezkfyGKv4fMoLmhc+d4EJmsHXH5S+EdB48ODgixZ2xRbEWcdB6
	wiQGdIJ7B9yEgkGciSSzX+XZfDt801viSyrrNjuJ1bnoUnr32nKuwlJMRw2MgLZVaoGBXDQfmHG
	mV7XkD5cOnoC2xZAN4sP4uPZyurcmpIWedikoTpaQqj8vbyQW8HUJvj/kDn88NBuf4gYZdhYwk0
	v/gCsnrt7Ld/VAeVi6nEePidF5DUEQSVNNZWPd2fvIa9r1HIGqbyy12HhM99FXlJ3vIszZKBNVW
	NVeGe6oGinDm9Cl4IrIZ+RHjghwl6ltAOCzCfGNL5oM5tpfC8aSdb02YqIZBzb3Q==
X-Google-Smtp-Source: AGHT+IGXo0leNEZOdpcDo5mboEAsYRR7bsRSf0EC+JdFXlc+xOggVj+ftQvTd/RTlrxgZhW5tHX3RQ==
X-Received: by 2002:a05:6512:ea1:b0:553:2c58:f973 with SMTP id 2adb3069b0e04-55a046733b8mr1503974e87.52.1752253568879;
        Fri, 11 Jul 2025 10:06:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:6e:3100:ed74:9560:782d:a190? (2001-14ba-6e-3100-ed74-9560-782d-a190.rev.dnainternet.fi. [2001:14ba:6e:3100:ed74:9560:782d:a190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d0f2asm1009210e87.131.2025.07.11.10.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 10:05:55 -0700 (PDT)
Message-ID: <6b872eb0-22ca-408e-9c4e-8f094c3580ae@gmail.com>
Date: Fri, 11 Jul 2025 20:05:51 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: Documentation: Improve grammar in DVB API
To: Brigham Campbell <me@brighamcampbell.com>,
 David Hunter <david.hunter.linux@gmail.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20250708155206.91281-1-hannelotta@gmail.com>
 <680b91c0-0fae-4230-9fa1-da988cb82e65@gmail.com>
 <DB8S4WLTG1SS.NVODTL6KNFXF@brighamcampbell.com>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <DB8S4WLTG1SS.NVODTL6KNFXF@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 7/11/25 2:55 AM, Brigham Campbell wrote:
> On Wed Jul 9, 2025 at 10:22 PM MDT, David Hunter wrote:
>> On 7/8/25 11:52, Hanne-Lotta Mäenpää wrote:
>>> Fix typos and punctuation and improve grammar in documentation.
>>>
>>> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
>>
>> Overall, good work. Here is a suggestion for future patch series:
>>
>> Subsequent versions of patch series should be posted as replies in the same thread. Currently, each version is its own independent thread, which makes it hard to track changes. This link has the documentation for the proper way to handle subsequent patches:
>>
>> https://www.kernel.org/pub/software/scm/git/docs/SubmittingPatches.html
>>
>> The relevant part starts at "To that end, send them as replies to either..."
> 
> This documentation you've linked is specific to git, not the linux
> kernel.
> 
> The kernel documentation argues against doing what you suggest [1]: "for
> a multi-patch series, it is generally best to avoid using In-Reply-To:
> to link to older versions of the series. This way multiple versions of
> the patch don’t become an unmanageable forest of references in email
> clients."
> 
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> 

Right, that clears it up. On a closer look, the URL indicates which 
documentation is for git development.

> 
> Nice work, as usual, Hanne-Lotta.
> 
> Brigham
> 

I really appreciate this comment. Thank you for your encouragement!

Best regards,

Hanne-Lotta Mäenpää


