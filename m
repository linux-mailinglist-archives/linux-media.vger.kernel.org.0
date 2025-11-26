Return-Path: <linux-media+bounces-47741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9690CC88CDF
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 09:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E237351817
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 08:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB3331AF15;
	Wed, 26 Nov 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="faarhEay"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95A12C11F8
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147541; cv=none; b=Q1Ye5pRjzFzR5VtpuImqNKrfkASEtFZV5z0d9+q+bLlah5fJMMZmXaOR3MRrNla1djqHZdbEeA9N82dh0bwowfMKBTf/qZaMFDgoQdrqERW9rEeP8uebAxf102wibx3gr4LTt8j8KYOIqnb/QxAPig5Usp/6dHFc4ge661vD0Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147541; c=relaxed/simple;
	bh=nU9T+5BRaB/fG6RWKtMtWKMNEJMLJZh0XG1iyTeeGec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVm63MKbcCJNBvnAFehVbtn7tZydKBam0ZVAg2RxTgTcFPZ15tMITAc0vU5qnx1Vf141L/RjtWGzpCIYgIsEWme7wjtgkSol1c/3cs41FdxqQIlMu31LB4OlEdpTEiiC5OPdWjp8Td9kOYRw4VhUVbYk/L0axBLPo+LzZIrzW2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=faarhEay; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b427cda88so4347037f8f.0
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 00:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764147538; x=1764752338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/42H8lhYTk9A336jJOzqFf4ArqhwdfQJRSwAMTmYgKw=;
        b=faarhEayto4ghep1tOnl20UpBjexmnHOVnmxXLl3q7YnaBHo57suwzR+jobYILlhbW
         vjvuTt0doFCVqQVYZ99A5aZsxDVGJV/W3xf4plFJjwGJqVCgwQoP28yBdMkXHn0hmITq
         PqrDqdSa8TJz9WvkEhqzkj+McyOXLLBY4smijwK+F88/WAG4o2QjatQbvbgXNIbIKwWl
         1Fn83oIcoE0VqVOmDqsa70d6lYZUlL8G28f7IOg479d1jKCMGclWB2ewE81Q9Zr9s9hI
         wJDqnxLLTzbHekVBc1deRLlTrb2C4Z2obOFiHBYfJ6y0VTW+QzwYjtOn2VMJGGNuy2bO
         9oKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764147538; x=1764752338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/42H8lhYTk9A336jJOzqFf4ArqhwdfQJRSwAMTmYgKw=;
        b=CtaqcY1zL/peESS0JsDStTETgjAFYsfIF4JAdABhO+zJ2SEZvpzVVNfGEVxtNvmQY8
         moaw+5WM+MfvhSwbLvqaxCnA2LGOouBw/CBbMTuec82GFj0aiFAaHsYghxNk28hitkA+
         SmgwtYikE9yw1xhLgTnj/sY4ja89fbDy1THswLWCDFrP/PFAXdWX99Ci1H5NakCPC1d6
         UDWJvxiSM8J75nYYyLyl48PmTSWHmKZjwXvhqFgFKTUir5NRHDAxHTqzmLa+2SE6jr+U
         NkYQ6BmB44Pj5p+ld4qiPQfgNxzLlXqucb/P9/QRNuPeo224bpU4LaNUPTfgxX1EiLke
         KxJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1SG6Bdt/rqWTYKvXb0LwMJyIALgA2+J5dQXQ0ce2BAQKEz1udiKX/Nas/F8MuNcHvCPm1BVdjRIuvAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTQ9HG23nQ+9dxgJtIRkJ+YAKgK1exA4AI6/dyCpTksaFzPP34
	/FBLLy9gK6kDSGps+06hathPBQgfS/UwoM9Gx1nbPCw22HWkGf8nXDldqK1LwGWEj8k=
X-Gm-Gg: ASbGncs+HJyTXP8VzQhpIjcDQ8DT+lBLkSfCJ1JBKUXCuhVNCDMXu9nNN73bqkmIc1a
	3O6wjoY5PiYwKicBl8nzPBrOsZGKuErd84gDEDxWhhMxdpx/RWZDJY8rM1qrdb0T0949PpxDGcj
	FdfbuhvOd7gqlBc+Bd7wBXHEQ7sJiPznCan4UbFPTZ/loSuxlfsuvQzMYYxn9lSMBqUZIJo1Qi9
	zKB/vkKVeCj0y7ZUOuJPqKYjmz3hc7vVCIf2H6QPPTCUrKBqHaEg8qtDvEutSgIJUcDm4fwLVqu
	vA1KfF2itPNSrTOZnewKRO6RgsCIrk9QyK+TuxwEFUkkWDN+iJ6YlcDTV3SqaBi6RGYnAXrb7mk
	qtSgKZ1GS/16kPWA/NRD2YapwTI9wuyDbaEGLTpGwMhygIzCfGa3Fe/S6WZ+8CIWZGtUCLW2Uc2
	b5mSgMDe+2QsatfZcZ
X-Google-Smtp-Source: AGHT+IFv1Ops8n0OeoStz9TaphopQIFsUQ0FZ2Z6R6T+mCfhb8iJ7KwfJE3DEPeRt9VhmuTMP2gI6A==
X-Received: by 2002:a5d:5848:0:b0:427:8c85:a4ac with SMTP id ffacd0b85a97d-42cc1d0c9d6mr20256329f8f.47.1764147538171;
        Wed, 26 Nov 2025 00:58:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fba20esm39223866f8f.37.2025.11.26.00.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:58:57 -0800 (PST)
Date: Wed, 26 Nov 2025 11:58:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: tegra: vi: replace devm_kzalloc with kzalloc
 in probe
Message-ID: <aSbBTPXdk2wXQm7R@stanley.mountain>
References: <20251126065242.12186-1-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126065242.12186-1-dharanitharan725@gmail.com>

On Wed, Nov 26, 2025 at 06:52:42AM +0000, Dharanitharan R wrote:
> Replace devm_kzalloc() (line 1881) with kzalloc() in tegra_vi_probe()
> since memory must be freed manually in error paths. Freed via kfree() in
> rpm_disable, as recommended in the file comment (line 1204).
> 

drivers/staging/media/tegra-video/vi.c
  1197  static int tegra_vi_channel_alloc(struct tegra_vi *vi, unsigned int port_num,
  1198                                    struct device_node *node, unsigned int lanes)
  1199  {
  1200          struct tegra_vi_channel *chan;
  1201          unsigned int i;
  1202  
  1203          /*
  1204           * Do not use devm_kzalloc as memory is freed immediately
  1205           * when device instance is unbound but application might still
  1206           * be holding the device node open. Channel memory allocated
  1207           * with kzalloc is freed during video device release callback.
  1208           */
  1209          chan = kzalloc(sizeof(*chan), GFP_KERNEL);
  1210          if (!chan)
  1211                  return -ENOMEM;
  1212  

The comment is specific to "chan".

Your patch introduces a number of memory leaks and it's not
correct.

regards,
dan carpenter


