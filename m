Return-Path: <linux-media+bounces-19034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5A998ED70
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 12:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AB48B228DC
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 10:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8DD1531F2;
	Thu,  3 Oct 2024 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFcOa2P+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06E215099D
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727952950; cv=none; b=kEhajzKyWrhf7tnLXmHlP9Bz8ErixVwDo/cLEx/9nU/m6koyEU4hylSgDOcfOqMX3ZtzVOg6Md6Mno04kzupsHvmsuhbMKU7GoN5tQis6doJ4uzA8+4DqQQV3pb9sysjguARdqlhzq0pcPzRwnF4g/c/r2oHFUDr22ktiKWlDHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727952950; c=relaxed/simple;
	bh=bl1J9uHL1t+SxYiDrslfTGhb7ZWw75hcSPtQ9oEB1o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBuZ/Ux/2mxodsQ80m96EA5VROYw9x1R1lTbG3X+Z6jXaoAO9HjSe1JjqD8/0aNiJmtXFVBH3/Rv3eXHU+9LfZRpjutbpn8bFiIz7sltjNmCWPq6JpSglH3LMKRGzfoX/L7mVjz+DdXSxt+Ll0BarQkp0HnVERK9DZw64Q50tEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFcOa2P+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso8187935e9.2
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2024 03:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727952947; x=1728557747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIJ29ZZmbuiCOz/H02yJqh7NW6JNH11aYozskl/CpkY=;
        b=YFcOa2P+bivYLBnCVO70jaIXwBZUAdJIH79rOJfnk+ndAw/q049ZTSqCXQ5JUuK9Vr
         qTRm9XkjOYRTtaH54S34wRPY9uq505hoCVVnu5QJ1YiZUWQ5Fe955rraAisOBnXkVJIX
         lDIf9UGcswXojpeXHSQN287/IbgQP3ShyhSSZiuKrlZft0tXHTmurEawe0vPrhsmijH8
         Fm0IgtBzejARYFk6IUuXHmRZujWtNL/P5A1d0gX2mvGDkNWfE0uI2qW01uky6CKEtuz3
         PN2h/1va/4tu988lpPeKag95O+2AUnkXznhquA006AlvoIX/ZsPelVOU8G/dl/bzGa7s
         JSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727952947; x=1728557747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIJ29ZZmbuiCOz/H02yJqh7NW6JNH11aYozskl/CpkY=;
        b=U4LF+4K4tu5F7U8YH011Kc2Iqj0rHB3dO7Tec2dZtUMOQR14MIHBDGJI8ai1RpBwqq
         ehAikrPdQFrg1U393un+00PjIu/nSZFmIA5w9Q9ZAOlL8Jx8rHIgcoB/fQVHZBN9YeNB
         V+IRD6uHd8xM3J0Q9/CH6QrFBUIA48x5s1kMGkbA1VOgnmvhWN3EgV/GzHFu70uoka2J
         EY7Fd9JDYY0HxeU/0uhuByg+8CHviZdgyJMScr7cvUbSMfOe8/AEp5hrNrMxBQHsT3JC
         YiUW+b4jxVls+5Pm62WEZ1tf2XZ30y41w2viUFMB+Z1bCe/1+KpmIAqTkT74VEvvAVEK
         nRNw==
X-Forwarded-Encrypted: i=1; AJvYcCVIwdY7GbU/AFaF0Sd8PIMz/xW7ovHuRMUw7E55purqHcmhIFtRGYm/uyXSe29VGt2KKRfwPc6z4K864g==@vger.kernel.org
X-Gm-Message-State: AOJu0YymekYZtXYiH1jsPH+UawL7gWtnF0KUNx8XddFocTUXeLLfxSt8
	29u31xmP8m4FTR3Q9CIf1sMKd4bSYaFzjLYbIUUqoYWJ53q8K5hqXbq4au/2reY=
X-Google-Smtp-Source: AGHT+IHseLyKrntM/k8lPBcSYPGxSnth29/1KsSzPhnElZMTWDE1jxRrCCO1LeVe4WcDE8gvczpQNg==
X-Received: by 2002:a05:600c:3504:b0:42c:af06:718 with SMTP id 5b1f17b1804b1-42f778f3619mr44325955e9.28.1727952947074;
        Thu, 03 Oct 2024 03:55:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79d8d2fcsm41802035e9.9.2024.10.03.03.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 03:55:46 -0700 (PDT)
Date: Thu, 3 Oct 2024 13:55:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] media: platform: ti: omap: fix a typo
Message-ID: <9a0c9644-cbd7-4d9c-9a73-d5b37380fd70@stanley.mountain>
References: <20241003105158.15702-1-algonell@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003105158.15702-1-algonell@gmail.com>

On Thu, Oct 03, 2024 at 01:51:58PM +0300, Andrew Kreimer wrote:
> Fix a typo in comments "tobe -> to be".
> 
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> ---
> v2:
>   - Add driver name to subject.
>   - Elaborate on the change.

Thanks!

regards,
dan carpenter


