Return-Path: <linux-media+bounces-37707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA169B047CB
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 21:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C4C91886480
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05989277C83;
	Mon, 14 Jul 2025 19:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CTR7KAVX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD0026FA6C
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 19:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752520440; cv=none; b=ENOYgb4BR9W3gigcfT88GcCSqR4mUlWc815AdXY5CtdOsoIacePHPduFYYRz6ztD0zToHsc9u5mqC4Uyhn+jQax3+AnbmNLeJ5nGzgcFcUuIIJcS52ohyM3OPk8R9dVnvY/sIlNu0HrxDB+ia5/WJi29rXoIBvtAa7mUPhiSd2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752520440; c=relaxed/simple;
	bh=aWSA0NeB2N8SKMfIQkj++0xm9IpdgexztD+pfuz+xao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJuLyQbj4AtM7qHOffU9RMA5CjeU8pckkKJMWQX+uy2XzfYHs5xQZ0ZX737H+RgzCpwGhzgXglYRfre2++2mWJtH9He8nBl9eR5UjAOU5qsGUM/ZK3ekROpwaFk6/ER+9peXSXWbpZKqPk4JXupv8O+YENP3/u7JbRc35s/B8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CTR7KAVX; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-41b357ba04fso293640b6e.2
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 12:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752520438; x=1753125238; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/UVaYjGM1v55Zie9CqXx+YSNagSNn6vwPpEb5of7g80=;
        b=CTR7KAVXBYq0M5GGNfmzNan5xSSN8E0B0EbBALerk57MpZ9azOv3McEftFIg7Ripy/
         tWSje2/eFWDYNYoyiu1y9yJWSbcTOMNw/J5LvbCQ13a6jqbKAXxzyzmw6UMLUE5tf4NG
         Mj/MiujMf/5sM5fFSIhw3Fb1UgS2hX2PmhrGnmRKMosZ5OTSXFCFpml6zID/j5jOzbjV
         a3SEvYnOIhCaaTguLroZBzLaXDEs4NlZL99gKk2c+EycMkIWZz7dFtgoqqzDgkSISwCI
         0zqSoDYfK2BsHzb/zDvylEEaoy2HTqSa7Fph+TYDYCYhat7oN300pZYndJT72GtEAOGk
         aSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752520438; x=1753125238;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/UVaYjGM1v55Zie9CqXx+YSNagSNn6vwPpEb5of7g80=;
        b=FidUj7lJh2dpuhS1f3a+7RbqMmIROz8zX+U1HSlgXWweEXYJfi0TMF+/VQwjyjnlvZ
         aa+FkaoEa5gkYirRXgR0JSfRzUHzEZRBVGLHhyimMpc48fpqY4Orh13ZAgFY3koz5kPF
         ygeY+qnc8anPCr8wDJHPmz4FDl7/0UDonS+/nPIKHR/kq/YwX1Xj2KOEOTxidsIKH2id
         aNMBywnf2zxz/5O6NU0WifeIf8DSroOLPIoR+qC/azOjDh/NJBOp8wq33ZcbFAYe95D5
         x+sb4XeEQFZUceNyQJCjMr1r+n1cAyXrNKCUGlbbIo1MRKYcL4wHpTuxQJL9ntgwPfsr
         Cjxg==
X-Forwarded-Encrypted: i=1; AJvYcCWuWsqNgiC2xI6TnnhjJyPSUV1yTkuDfMBwwmKpaMFr02TpmaZrEVJ6y2y3xJN9h/ZOr6SnucVNGwYp0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRD44ieYjGAQxqUSJkMzpE+ERtZiEeNtUhqOV0rgUTmL7Le3YI
	czBa5rgmvec6LKSYbH2CDX8ElHvdx+vAjhvX7q7wph8VQbfyX2dh1bp+vA1VgkuAeYs=
X-Gm-Gg: ASbGncuwBi6l4UwEZ1qs0VBb6vEFGOffSnLc5Kc6iqN4LsgMGQSiRdEMfUCpzpjbbUq
	9nPVxP7ny0L2TbbwQBrZCR3Fmw1RABYuYXsvnEKxOgd1G5HlfH91WeeyUE8k9nC3yVk3o5wQcLE
	0k6YOq7wDFhdG/Kwwz0yLEjTfN3Jg/+3PD8pxDbGx+WFYKkNyDD+dDI+RUickJLPHynfM4DT8m/
	PqJpmKPt8IDg8vOKMixpuPTscLj9UreN5ylYNbq3Tkif+e4cULuKDdqYc/2hgc/YC8NOWJmAWgP
	+MUNawf15VvIFsjxpgKZKZq6YBgXdc4ERFciKcGCb7seeZXRfXu7VFnesx6qhfWBpY2fj+ujxxa
	F4PnOmGd9mfHYECk+8Hro7D1NkapbC9LEm+U20uSa
X-Google-Smtp-Source: AGHT+IFH25xfCXqy4HNmWhH2hdq7v13qGSG5LkuyX6YKupHH2sypWxOCMXdK0skrCkcbTnCc9rgkLQ==
X-Received: by 2002:a05:6808:15a4:b0:40c:5b58:c9f9 with SMTP id 5614622812f47-415393d693bmr10038069b6e.22.1752520437869;
        Mon, 14 Jul 2025 12:13:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-414161e2b74sm1622747b6e.0.2025.07.14.12.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:13:57 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:13:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, mchehab@kernel.org,
	sakari.ailus@linux.intel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 1/2] staging: media: atomisp: return early on
 hmm_bo_device_init() failure
Message-ID: <8372cba0-61da-468d-97b2-85deb8bd4129@suswa.mountain>
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
 <20250707140923.58935-2-abdelrahmanfekry375@gmail.com>
 <00673c30-8233-417a-9f8b-2ab91381fa4d@kernel.org>
 <CAGn2d8PjT+gE2EH0+YT_-ivfcXBuBM1OxTLEAvy+sFctpc66Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn2d8PjT+gE2EH0+YT_-ivfcXBuBM1OxTLEAvy+sFctpc66Aw@mail.gmail.com>

On Mon, Jul 07, 2025 at 05:15:20PM +0300, Abdelrahman Fekry wrote:
> Hi Hans.
> On Mon, Jul 7, 2025 at 5:12 PM Hans de Goede <hansg@kernel.org> wrote:
> >
> > Hi Abdelrahman,
> >
> > On 7-Jul-25 16:09, Abdelrahman Fekry wrote:
> > > hmm_init() would continue execution even if hmm_bo_device_init() failed,
> > > potentially leading to bad behaviour when calling hmm_alloc().
> > >
> > > - returns the error immediately if hmm_bo_device_init() fails.
> > >
> > > Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> > > ---
> > >  drivers/staging/media/atomisp/pci/hmm/hmm.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > > index f998b57f90c4..c2ee9d2ec0d5 100644
> > > --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > > +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > > @@ -36,6 +36,7 @@ int hmm_init(void)
> > >                                ISP_VM_START, ISP_VM_SIZE);
> > >       if (ret)
> > >               dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
> > > +             return ret;
> >
> > You need to add { } here otherwise the "return ret;" will
> > always get executed since it is not part of the code block
> > guarded by the if (despite the indentation).
> >
> Yes , sorry for this dumb mistake. I will send v2.
> 

Smatch has a check for this.

~/smatch/smatch_scripts/kchecker drivers/staging/media/atomisp/pci/hmm/hmm.c

regards,
dan carpenter


