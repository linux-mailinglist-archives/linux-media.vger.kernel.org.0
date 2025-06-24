Return-Path: <linux-media+bounces-35807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC33AE6C6F
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA525A577E
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577CB2E1759;
	Tue, 24 Jun 2025 16:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SsG3HCXj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B171218ABA
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782662; cv=none; b=ODYZ0ZA416oqRrtCPtm67AF8OjNaMzgjOqgGQ2WynLOFv/SPQYdOQI187642jv6fyN3TcfaW9zvTtkUDwU0nopSAxjSMg/C5y13TqkRudVrnpXKfLE9HwRUE+54KN+nT68NrWDmyYUQpKyw6EwxD9B2gZrvC6GmqjVPZjuTPRJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782662; c=relaxed/simple;
	bh=QcvjBdtjzx4el21ou2AyjFk3PoVeXVF0t0TqhAXdQAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuiXwDOcIa8M/5MgLVK9vLSJc9nXxVLwMXLcgxmqz4dps57q9PL69y5phJNc849d+Nw7kCd5C72HNypsrPYgBdE1YSjcNUfbgE2oRFoal/uMJyok9gOK200VKmjF85zIAFUPm6AEh0ahz5ZBSp00HmtJte/Y/6wsmoTx8hR94/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SsG3HCXj; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2ef54471bdfso760952fac.3
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750782660; x=1751387460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xauWGZibla3a88RvY6yarAsOrTLbYeOTyPsrWKTduDk=;
        b=SsG3HCXjT86W2z+kyYtR7KnyLvzyrEQiKMcrLmW8aWzE+86Fz6qU5yIBFJkgHckvCF
         aNDx78E9wslGgIaRLZclnj1AYcsaibfpisdhzQppVGM3NKItmdLkdRX2dl0uJFTaivdb
         4qAQZBWZW+38PZkey/MXgWJkMZcvB8hmRw7xYlqdkIcYmJ3R2p6cuhha8m5JKOUZvSIc
         xVquArpvN4jXW3AeOYtm9LP8RM4/VpvwJTvLm+1G1gR613ypw0vFFxBhnu1UFsjnxdpv
         WjaewyPG5LYJpyhDuKj3D+mcTdVdUBrsfAGl+Qdy2HrpqA6Zg2LeP3tL5oJvzbQEGyQC
         kyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782660; x=1751387460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xauWGZibla3a88RvY6yarAsOrTLbYeOTyPsrWKTduDk=;
        b=ryWca5sBGyfPXWcc5LLMBGiilgmJvgqHf9r0/r/7sajzOdYf/3l2mq3Vi2fSqAbO2g
         vQ1a9gRRjjORRuBrGXvS3pZjPyi36oRr6xY5Zlp4u8XyV98uLz/+Pb85YdjgHC3xuuM4
         Wy3ruNmOLUok9k3+zTPjFx9vxTUSGJ3ZVZG3zIwHxhsgbxvIG5l+r486zzH9pSPOpgxm
         0AgZwNIunwt8G5A5xV4D6oyqKbPsmG/sna+jyRdVfcfpLAkO8j8X//Ifwyf3Vw6iI/vh
         LRw8Oug3PQ/YJJI+bjIC9BM3V9FC9cvI7qJeLhyDjbyHQXBfMECTmW7xiRFCQo2zLpyG
         M42g==
X-Forwarded-Encrypted: i=1; AJvYcCU9N5ctPK44SXk5Pu6+k4G5yXKfeyPuJrVxTa7adFawBFQKX/aGh5Wg0Dr1hiIxsP6CDLMNg0WRdVDtEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhSqUQJlB1eyA+gsF1I1NgL5TRxZuRXDsLOmHfl6ImxO2JyRGk
	ObNJclqkRYwTp7aA3FFgGgrA3pqxB14vPKUVqF0GF/1EZgW7I1MHkmh2jYalzjh8FG0=
X-Gm-Gg: ASbGncu6uQUax0/uMPo2d544LlPcB5DLIlSOA6q2PI6k1DpRfCNBYhMnlpCgwvKeA9A
	buVLSogeUwmGG/itgO4iU3hhqrRUUq4QBzeREl8IZOJ/p7Qa8UOayGBRgv+nYzPTihMUrHtFtt7
	T/00mlzmer2yJ1S21TmrS8mxZ9GS+ehCPZ/vvBo6p0och1A6X6FiObl+SuumU3k6SSd+oXVw0Pc
	HqTnPqSVLFqVo89IHs0BAoS9XH9OC8h/jQyvNFREsql0g2MUTXVnJNyFIXE46D0FaDAylv+j/3a
	mKR2W/GZ7syMU+3kEJw00VU26glkXVN0zBwO59fNCtIzvzz7rctyWKkyGN85Zg8bXr0+05FaEup
	u5vum
X-Google-Smtp-Source: AGHT+IGcNnn1LPrlnNqMBw8pIeYo2YoTiOvJeFOaf225KGbqOfzpC8jSGqoDPVjT+4qvrB73k5LY2g==
X-Received: by 2002:a05:6870:2b14:b0:29e:5dfd:1e17 with SMTP id 586e51a60fabf-2eeee5773e2mr12099997fac.23.1750782660133;
        Tue, 24 Jun 2025 09:31:00 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee664c3cb9sm2167708fac.6.2025.06.24.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:30:59 -0700 (PDT)
Date: Tue, 24 Jun 2025 19:30:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>

On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
>  int hmm_init(void)
>  {
>  	int ret;
> @@ -130,14 +48,6 @@ int hmm_init(void)
>  	 */
>  	dummy_ptr = hmm_alloc(1);
>  
> -	if (!ret) {
> -		ret = sysfs_create_group(&atomisp_dev->kobj,
> -					 atomisp_attribute_group);
> -		if (ret)
> -			dev_err(atomisp_dev,
> -				"%s Failed to create sysfs\n", __func__);
> -	}
> -
>  	return ret;


It's really unclear how this "return ret;" is supposed to work.  Was
that part of the sysfs_create_group()?

>  }
>  
> @@ -145,7 +55,7 @@ void hmm_cleanup(void)
>  {
>  	if (dummy_ptr == mmgr_EXCEPTION)
>  		return;
> -	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
> +
>  

You've introduced two blank lines in a row here.  (checkpatch.pl -f
will complain).

regards,
dan carpenter

>  	/* free dummy memory first */
>  	hmm_free(dummy_ptr);
> -- 
> 2.25.1
> 

