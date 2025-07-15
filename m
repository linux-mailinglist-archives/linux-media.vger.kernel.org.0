Return-Path: <linux-media+bounces-37810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEEEB067C2
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 22:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67EA0504860
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D4C2BE657;
	Tue, 15 Jul 2025 20:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o80VFCWa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF5D72615
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 20:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752611443; cv=none; b=gH/57APzfQDJ85Scp8gwfvNeXJ+FkIHzYp/KNCuqmxKNsQtFXGhBhcJJsfgrCDfLpcgGIpTnW4t82IYHFdd084NgrWzowP2trfZ9PpFy/8kXC8EcCGGBAISSfocJzGayok4oAzJdpMFyWIf9XES0amAfqixLbvtRK9ft0WD2y+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752611443; c=relaxed/simple;
	bh=1yQoQkvqX9mmnClp25QvfEznRInvWZaMgXS1yJYfpKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psS2ih/nPK1MPnylEBM9uI/1PnclcyVpqC3zbzYEmWA74J7YKDmSxcCxRabEA6gq2x5CJywZYuy3SNEC3Mgg+U8Jc37aIj3MZWStxaFxwaFGofUz1RI+dxJXh4loGyEo9CQhMuMtZPgzZd+t79nHGflNfvCaBbyTC7xzenrMheo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o80VFCWa; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2ef493de975so3293792fac.1
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752611441; x=1753216241; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0qnU3e/UbtN7g5RYL6+3ED+hDCWkfgVIl5O8F9TCC94=;
        b=o80VFCWabZ/3WVXTGYfeKQDdL8dvQcOHeyuQFiGAosWJsOuj/xMWNqLSAPb5IYrUNh
         EgkahYwN9Sv3euL904+AHmdBfs9EeyAs08cHhab30exeYinRr1E2Q0cgmO1XBtlUSHlV
         hrSSA3RSPiweRUUoSwUvQVoUzyQA0H1YCqz4nt14H9/rOW7/VUwZIt2dlvHJzu+eWyG6
         TyjOgkkxibChGCTMzCSzkKRL0evEF++g2F3r68o84YwpOEHjzADyvdgdKPkopQw7feb6
         M13O3nADsaxPBAOasrfnWcXbvDLLba1vWW8QB1mTOKpOzs1lPw9mWp+zjVYrxh/vRqlE
         m8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611441; x=1753216241;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0qnU3e/UbtN7g5RYL6+3ED+hDCWkfgVIl5O8F9TCC94=;
        b=RehN6oB+rBrEFopjuscCCtsOyIllhZT9C5wd8RMyPZDBbh+ZIXSQ7bUmdDefxyVhkL
         0wfposo84GXQWGZGdpBnGjtHJeaohd9HFeSOhrvOfEmKKZgJH3JK4TLBMchOV7Zm5Dil
         Z/h+/gWfoUMJ2208077TC2ZtOs4TLamFldK9Z5ASP8FwJR1aczvyy1J2ue8yuhPfVBt7
         sf6mQ8yy3k0k1pH/ujCDpK7b3soCwAkhRATD+P5fak8zYI4BC/VaEKfBP3dzMeJkb9DS
         bts9hgDpPEPcZO6BPdI+bzLhamVjXd3P6vb1SfK4CbiU0ZJbiML/zkSllo5HbTSEDE8U
         Ufpw==
X-Forwarded-Encrypted: i=1; AJvYcCX5YQNbcqaY/YrEiKEN3oVsnwNVGY32kKwjPIhkvwg8caXhgXEnQ2CY+rYyUfLxjxylDJ+nGA8Pf2/78Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJswkLSI+beWsipRIw6F7F3ls6gc7Ck8jhBhrzRLgguJ1LCboj
	sL/fwOsLQ9UBpZpiZhufKvv+3GCc4XlLxjNoi3ks6+DhNgfkxSJjEnC/TQX9v2XxTH8=
X-Gm-Gg: ASbGncu18cbBp396uunoTRgEPHh9wG/5FDTRE2+HTmDO1VDEMwoTYZwQrsznPNz2Btg
	OUmbPm2vD98Xu7kOlWlZ2+oZR6vBARA4w2TEESrYnalEe30WvmD0ZUonOrfQ3HwPErEFy5Lwu+e
	Z+rcLZ1nIu8PwbWdOPvLCHDovt/DUtT/pDnfEc9UnVoBQ9qI6f960pFPH1hOY4lefa0R3rtQ+2x
	SICmb84CGftNqw6lwEPpG6m+BX4Dzouq4obJXhnhq9dfI8djbkxZVu/cnpAEZY2ifS/MdLBRXE/
	xaVhwqpHw3xElAWfvQfkBGXNtubTpGUr0517fN5WzEJbcK/kL4i4YNcZ8kJ9uLWKWmUapPmlyl9
	hL2VAegpRyBCkczlLk4U2cCxHOuwd
X-Google-Smtp-Source: AGHT+IG2+pwfhzJLrz8IScyfJm6Y2ziaIzZQnZsetieX7P83RKFLQioSOUBeRHkfbvI6bsQBYcAosQ==
X-Received: by 2002:a05:6871:780f:b0:2ff:8956:fd45 with SMTP id 586e51a60fabf-2ffb1eafe32mr237804fac.0.1752611440637;
        Tue, 15 Jul 2025 13:30:40 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff11235201sm2896491fac.12.2025.07.15.13.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:30:39 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:30:38 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: rkvdec: Fix a NULL vs IS_ERR() bug in probe()
Message-ID: <e4d9553b-34b2-4c2e-8d56-f86f3d51fcfe@sabinyo.mountain>
References: <696219e9-a1c7-4c87-b15c-1ffd42c95d58@sabinyo.mountain>
 <6ac8b8db02190da7d2edc9ce4abe5e7a7cab70d6.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ac8b8db02190da7d2edc9ce4abe5e7a7cab70d6.camel@collabora.com>

On Wed, Jun 25, 2025 at 12:13:20PM -0400, Nicolas Dufresne wrote:
> Hi,
> 
> Le mercredi 25 juin 2025 à 10:23 -0500, Dan Carpenter a écrit :
> > The iommu_paging_domain_alloc() function doesn't return NULL on error it
> > returns error pointers.  Update the check and then set ->empty_domain to
> > NULL because the rest of the driver assumes it can be NULL.
> >
> > Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
> 
> Oh, sorry about that, I'll will test your patch this week, but otherwise
> looks good to me, fixing yet one more error path. I'll take the time
> to test dropping the iommu node from the DT while at it, as I simply
> don't remember if that was re-tested after that change.
> 
> regards,
> Nicolas
> 

Ping?

regards,
dan carpenter


