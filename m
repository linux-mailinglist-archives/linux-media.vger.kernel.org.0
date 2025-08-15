Return-Path: <linux-media+bounces-39998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EFDB286E0
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 22:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21B801896DE2
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 20:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029EA2C08C3;
	Fri, 15 Aug 2025 20:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ancCptUe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05DF2BE7B1
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 20:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755288251; cv=none; b=d9CheKdrOuQerwvPmKDGVffzBbt3JSO4kG9gJ9IFnQ5h0YcJC1PsJ/QE0OKQBe64M8W+K1zfIhna3hlGKVNj0J6zFjlMI9p25FVddOpra5iYej80Ke3ZQPU70jzlfW0sXGvTWjvfqVHCv508f/y/vrPDLgXMRkA+2JbT6CcApoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755288251; c=relaxed/simple;
	bh=AYbiIeF6iptLsGoDj6CX8UYKKLMHp5WQuDxStj51bMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlpMle7Aj+h4BDmaUMuYeF09WMkFOXcG3Da0r2PSK6ol/RZzWbLLRp4dINxeR0YYLY4maTIfZj3clmQNhSYvlPvgbwFhtrY9fBH+xdxZ+RXU+mCUNVgkZa84vM+DHg/Cxj6C6kHNtOt7/Ys4DT8gw+NHupYuTxiFliUHqqXH/7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ancCptUe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9dc5cd4cbso1724292f8f.1
        for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 13:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755288248; x=1755893048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/dVp3c/mL+kWmyAxnHEJ2Rjfw36Df5+7d/WFZD+6RK8=;
        b=ancCptUeDTVMs75AWKFX91fKsRYKtP4j/9K9C+OD+IliLIrizIB8KmddZXY5+UjJzT
         T0uE0w3otjfY+JdIkY8kSONQ/CMnHvEQofpjXljuCVwBpm7RghqjRhIGY86W/KylFpsM
         Hp0reFIZ+FBEY3wMhdl6B45goL1V9Soib+MVtu108VOSi7bnFlSvtR+a74SuvxGvfwEw
         PBV9OyTydwamgfhe9dEbQ9uyZ41hBRGjy3lxmxSaeLqMC8FnPEKwDAffvtyAYRqaBW6r
         f+RAvKSrj6wR/xTpZs91zE97g5rompNZ5OL3DkHW664C06sCeY10jy1z14vCjnEPEA8B
         owdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755288248; x=1755893048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dVp3c/mL+kWmyAxnHEJ2Rjfw36Df5+7d/WFZD+6RK8=;
        b=sO9yhcdxGec4HwxVC5Jg1T4ZopdSqaJSYnShjW/0nj0zR3knCLeTUXxp0likaHph9B
         RZgnbohEKnHPcfESOOkrEMRbvYq72XL2bJ/H5XwbMaKVZvWChbMIS9ZPYyzYWrHdq2pW
         llRuq5VUAlXwP3JyGw84CNLi8JqpPvdG+Z3PSUtWGqHaL55CFaNwIEGJdkrli4NhTynu
         25jHXdLuj+c3IZg21zZogcprepnKnJ6Oc2TNvZljtzPWvsWa4euai1crBVIDbxUC1xQN
         03wHuraRGc0PfwXyfO9soKOQMyT7T/XMOkn0rWig4VmXHU9i+2nSPoXETKEmAAWZuG6Z
         7Mzg==
X-Forwarded-Encrypted: i=1; AJvYcCUlU2g/omIFZ33p6sPgy7++BkxvLVmD6FvJP21u7VKXTAd2rkE0pFXBeoGYLeXuilmRhN/wxoqxK2ms9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuHuy3wCxym+A5NwN4vnwl79c7f2fRDDxWZxJdbMqCP3IhR17c
	XQy+TcJfOi5BpJtZ7frWzx1Cmy4KGTsYDaqMqTvQ1F906teBCTVYBF744M3JGdrwB4E=
X-Gm-Gg: ASbGncvN68i9Dzcp2FeAqWLaH+e8C56jcP65b/nClpVZ2AoOnTJXQlHIAv7H0J0VuzQ
	QI9MK4Gwvij/Dde9K7KOtXgOYa2IeNrrCdEB7WC2wGSkz5EZHHSyrcSHSDwqCSth+hs71S4Ej0J
	lrAbKxV9lz7vpcIGxkCSy8NIHZNxCm1B/sxZxYu49EJ8ueLTzh2dyVsCReXzzQ45DP8u26ijrIK
	S0Hyv1sfNt5dNV5kWN0P3zqamOVAMC3KDP4SwZrrr8KgH713+kjJbbz41p/oceEdcF286QkSpz4
	TdSb6TOERR7ydmq3F+bHNwKm6JYrAvy83Npd/s72B2fckszXUsFZTkUzDTIEGGRpJX5igrg1PRZ
	04Swoxr2BsQd3YfSS6Sobp7EMohk=
X-Google-Smtp-Source: AGHT+IFeT3WqPGdZuR7vMkj7YvcRJntIuG00A/c4v4eSx+o5nUwQFOtRCUjiC2QXYMDK3VHtd0TfNQ==
X-Received: by 2002:a5d:5f91:0:b0:3b7:8146:4642 with SMTP id ffacd0b85a97d-3bb670ffc24mr2519110f8f.20.1755288248212;
        Fri, 15 Aug 2025 13:04:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb680798dcsm3060951f8f.54.2025.08.15.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 13:04:07 -0700 (PDT)
Date: Fri, 15 Aug 2025 23:04:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] media: atomisp: Add lock asserts for mutex protection
Message-ID: <aJ-StLSBnHmHHGUX@stanley.mountain>
References: <20250815182411.36092-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815182411.36092-1-abdelrahmanfekry375@gmail.com>

On Fri, Aug 15, 2025 at 09:24:11PM +0300, Abdelrahman Fekry wrote:
> Add lockdep_assert_held(&isp->mutex) to critical functions accessing
> shared device state. This enforces proper locking and detects violations.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> 
> ---
> v2:
> - Fix Typos
> - tested by building the driver
> 
> v1: https://lore.kernel.org/all/20250815170901.32105-1-abdelrahmanfekry375@gmail.com/

Same comments.  Best to wait a day between resends.

regards,
dan carpenter


