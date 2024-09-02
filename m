Return-Path: <linux-media+bounces-17331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C87968436
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 12:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB1D21C228CA
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3853A183CA5;
	Mon,  2 Sep 2024 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fe8m+bT3"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D479513AD37
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271850; cv=none; b=YA4uwtZUyJ8t1I6jjuo/naBPwCUabgPoEni/8OpVqL2bDwo3FwTTwTwa5yKOKu6DYgl4fJYczn+93Rsrjycd+Bfgp8guqSBne8IMyamyKr40jPTAr4MK86WaT2M7YXwIDSGsREQaFxtPW8sjmIiQexqCTsu3i48w6kM6dRFQIeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271850; c=relaxed/simple;
	bh=vjEG4yTZwz2x2AHPoS0jcARdsLxSSxZ+JUhFPRRJUIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPVfq2XN8pT+cOzPGgb2TkmEvMpHL1DJVs8l8p1WE08/tNAJ2I6tJP0TdoJTssR0LxVVrCTew//lmHww6viOZbRtdLtC3mcuGkhN0DyrNYYppTtFOVCDYQPx0yOLjkWtrcmyGOwwrSBnUURVW2zba5UjlbZr7WcqyvWKcKYGASk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fe8m+bT3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725271848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H9RKF9H7s72V4OZfPOTUgjyYaIyw8mcKokBoElqIGAw=;
	b=fe8m+bT30rJT2I+27TytAmsJikIu37VrTtKkCqktbt9HF1GW9V8mg26qUxdSVbbDzEoFGG
	QGScUB3K9OwvBa5kNrs90dQfDfIbURxW4KsvRAEjTYZMvpk3S5lcybHnI81aMJDf1Jh+nr
	vvfHkjZHraMn0gR9NDz7qNC3VkdGFCM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-XkRCJ5ebMSqHdbsg5i50vA-1; Mon, 02 Sep 2024 06:10:46 -0400
X-MC-Unique: XkRCJ5ebMSqHdbsg5i50vA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-533500041b1so4632640e87.3
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2024 03:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271845; x=1725876645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9RKF9H7s72V4OZfPOTUgjyYaIyw8mcKokBoElqIGAw=;
        b=JHNkvPVqorXVk5ebkeghlTAUbOfYQoDzsT4HsxxULS7Y+0myeLSYc/Gyua+n4Lg+lq
         bHelNdSjEAEInGWW8OdlRSraXwC5LPeyJw81j/4ZT7KfzI6VdmqL2N8RWF/TrV6fSpU9
         s23NXlQQEbtgTDUaq+7Nbl9bFub7cJSoLQLbCg70BPpWBC590NBdPuIlDs4fl34V5KYh
         S9AJO7klD9D1bVDo47D4WutGXPjIlPenKALhJ4C6DNfvh5Hx5DYcgLWvxDKtyVMnH6Rx
         dKvuE5bj2QxY/HtqELUx1RSDkefd+nMn4LaHNYRiLdelXTaViMuCvubYIxW9+32YmHu1
         nKlA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9LsWr52lR6W415cGq16xWGtQtvzCAA27GIjEO/R81u5MmDEXc6Ck50dhmoBywcAyQwhSc8UeH/f7Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXmLxDGSPg7er4LehoIzX+NzZI8AkxzeHzpIAgGxroqOC7f/mK
	4uh0EMBi1essfPQzlBt0Rjj2JG6mhQ5IKTAYU4+bmrQS4jvw9lUV5ztwmh+CLwyFPLvWE9aFKWW
	eJZYDZrqoSxhLsZPDUFYY+UdAjQvYABubrX0/0yuXZVsQ1OEDAB00HOnyB+oe
X-Received: by 2002:a05:6512:b15:b0:52e:976a:b34b with SMTP id 2adb3069b0e04-53546b33aadmr8012008e87.15.1725271845227;
        Mon, 02 Sep 2024 03:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYItbefjD4lhCqtpm3GS4ZxCJzNfGCn2KlBrohSSQm0qTa4hwnKBwDrS5pTLOuniFpdKxW/Q==
X-Received: by 2002:a05:6512:b15:b0:52e:976a:b34b with SMTP id 2adb3069b0e04-53546b33aadmr8011985e87.15.1725271844799;
        Mon, 02 Sep 2024 03:10:44 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb410sm540035566b.21.2024.09.02.03.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:10:44 -0700 (PDT)
Message-ID: <389b81a7-a7be-48c0-adc0-40d313a38c5d@redhat.com>
Date: Mon, 2 Sep 2024 12:10:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: move trailing statement to next line.
To: Sakirnth Nagarasa <sakirnth@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com
References: <sakirnth@gmail.com> <20240730084220.38204-1-sakirnth@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240730084220.38204-1-sakirnth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/30/24 10:42 AM, Sakirnth Nagarasa wrote:
> Fix checkpath error "ERROR: trailing statements should be on next line"
> in ia_css_fpn.host.c:46.
> 
> Signed-off-by: Sakirnth Nagarasa <sakirnth@gmail.com>


Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
> 
> Hello, this is my first patch to the kernel.
> ---
>  .../atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c      | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
> index 57b5e11e1..8ccfa99c6 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
> @@ -43,7 +43,8 @@ ia_css_fpn_dump(
>      const struct sh_css_isp_fpn_params *fpn,
>      unsigned int level)
>  {
> -	if (!fpn) return;
> +	if (!fpn)
> +		return;
>  	ia_css_debug_dtrace(level, "Fixed Pattern Noise Reduction:\n");
>  	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
>  			    "fpn_shift", fpn->shift);


