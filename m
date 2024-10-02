Return-Path: <linux-media+bounces-19005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B743F98DFD8
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 17:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78575287FD5
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 15:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417ED1D0954;
	Wed,  2 Oct 2024 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tKLQ7PTM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422B18754F
	for <linux-media@vger.kernel.org>; Wed,  2 Oct 2024 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727884419; cv=none; b=LWvDGWFk345IjficruKco7CohIhf/uXrV8JoOWBNHVtJGH+sQgeoD0D6X2L4aHw7nMt6wJYVLcUGH1bP5ax1ukt/qxw49o/z4FgyiNJHbvVEO+vFG2Bj7lfEoy+sgMamN8mVTdc/bTAMJRju7ui5ryMJgyKNItv5eLv22OywFeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727884419; c=relaxed/simple;
	bh=sdxpKH9V4c5yfJjsw3qgNvWJOgyXW68pU2J1QpqbmCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHrJWbD3CPJJQ3jZURGt+DhtsdoQ5xTvZ3Zcb8E/3OsAi031oI1XjOWEpayDpfiH+TOzkJcB1rnpnLnYp7vfFjf/cUx4SZAh8LINurN92TDxqDSxWokffDaeFEnibrfWteG78gdefauaQmZoYAK11FHq2sf4OKLB0DcuoVshiT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tKLQ7PTM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so66535485e9.3
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2024 08:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727884415; x=1728489215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MdHSrW/ChJntpJXVDEopdglyYp7fbBJgyKHsyD0baf4=;
        b=tKLQ7PTMOzs6RQwnnu2CknlyaMsxc1GOig5/p8ywjUGH7oE3WIFixrzD2JSi5bvvyK
         SnDnSO5V1XFWSZ7Q4+TP3Aq3aDQm+nL2NJfqzufi0wONDMh29Qa0FNFk+yPPkK+DmGpb
         lfc4HoIqlJjT4n8EWUNL4WQjUCufWWo66ZuF84IgNkjUzLIjiPvCqV98sgfYuHWNsS5O
         sOO4JqL9/4hvebEzlMKlFBgxPiYnkXB9ZKCzVnAdh0Ig3Bti3y81DlYbMewHsgqDAJVC
         23rSKcIUURDGr5xkOCFYhED+nJbCWabb+KWBK6co7mzaBazBRqr5xQqH5MkDzCYnxLFy
         p3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727884415; x=1728489215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdHSrW/ChJntpJXVDEopdglyYp7fbBJgyKHsyD0baf4=;
        b=ogfR0I/69lWSb9opZHgTVwOi2JGlrJ10+361hv3ZuXzmge0LqlOxG86PLGenF92a5e
         XXxh1muMFYdZugfbAatudTBI4P1Ly3vasFTbRIUCGq7JMtyBiaKhBDepqa5EN2iYivEG
         vJV0/FvQfIXpRZcpi2K9mD5NpfTzlXqN4KjEYPFsvcJm3f62irbZ+lQqNR/AVcGJbt9Q
         Xz4flTUWFhqC5Nl6duB1B0QsInjLQlf6AcYEP44njocuaN/DYgjmcTmWB3SWW4lCXYH3
         lMZeGZJJeLasa+DjiMXI58+t3STUnkmDetw0zmyeFYs003sGLeC1bD3Us0KNpUscECPS
         r/rg==
X-Gm-Message-State: AOJu0YxabPp0wy28JTXZdYg2wvPygdsanFxbY7hG8rS4QLN8O3Wvcq5B
	K/5iFXtJhsxejTjl6wcJCOmCdMshgs8OU+rinFb0dN4ImTmMWnrETe7qLtW3mU0=
X-Google-Smtp-Source: AGHT+IErKLNJPzyffjAz6YIrrKSomVc/nej9Sz/s59zloqG0Mzrd8SoXK+sB4+dGv+nZ3cX0x1Gm+A==
X-Received: by 2002:a05:600c:358e:b0:42c:df54:18ec with SMTP id 5b1f17b1804b1-42f777ee3f9mr24259735e9.28.1727884415231;
        Wed, 02 Oct 2024 08:53:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79c67c5csm22433425e9.0.2024.10.02.08.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 08:53:32 -0700 (PDT)
Date: Wed, 2 Oct 2024 18:53:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hridesh MG <hridesh699@gmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: media: fix spelling mistakes
Message-ID: <8c62e5ce-3c01-4c1f-b8e0-1c6a0164670c@stanley.mountain>
References: <20241002152231.8828-1-hridesh699@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002152231.8828-1-hridesh699@gmail.com>

On Wed, Oct 02, 2024 at 08:52:30PM +0530, Hridesh MG wrote:
> Fix three minor spelling/grammar issues:
> 	chunck -> chunk
> 	procotol -> protocol
> 	follow -> following
> 
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


