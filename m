Return-Path: <linux-media+bounces-4224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 504F483DDEF
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 16:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BD5928829C
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 15:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643801D55F;
	Fri, 26 Jan 2024 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E559q+Aw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A91CFB4
	for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 15:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706284041; cv=none; b=MPSNCNJGga8b3SsPc6oNUC/10k+6p+tQZgIzaFqW7pEeJKmEcw0AJIndyCY4LpwnI6OXrmyMgb39V7w/ypmY17rKxYy006EDZptrCc0gMrwcsjvtd5TbfO5ZB0goAHpLwNIucMD78J64VrqGELXydfBXqTghP4wU0qAapyCkV4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706284041; c=relaxed/simple;
	bh=DAs3V7HyP/XpBmzo6+7opXgyjmtVQeAlOfAKpgpolnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9SzqDBgMqDnGBAxU4ixhsjuDoOcH8fNEaf+ZuDmMWm9tn/wy2K+qPj0+A/fipIoCSr9QATyOcfxDG29neBwQ44+wHcsSmjBGq86A0E4a/khpThVmHZePkj8z/ijqle97uj8zvTy1HUN+pI0+T4VKVsBX925/QNu5KM3UeGyhFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E559q+Aw; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ddcfbc5a5fso575367b3a.2
        for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 07:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706284039; x=1706888839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qc1S48vRk0PGvch6nvXwWAPqcctjRQ+0B+3F6wtfmnc=;
        b=E559q+AwFJjqEi55Z4vyCd3yvwAGIp8fpPZMnkysor/Xi1qSjQbgqj8zzH6JVImibB
         MwR2w0KFLZ+idj3V1UH3jaF/Ty/TMx0a6Fj+rQGhjfOw9TPAm15GZA8u+rF3kHq7BUaY
         1RZ+wuX2VM8LM5KLnnkWPMUIUZDGpwCt5jKTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706284039; x=1706888839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qc1S48vRk0PGvch6nvXwWAPqcctjRQ+0B+3F6wtfmnc=;
        b=aFRW4lEnHcjgTT+GpYzjBefw3uFpC0/eG2ZImWKHJP/a8TSrejA3TxbeJki+EsW2Nn
         q9hsEHJY/sjByVLstOrAfCo9lhGcgNPwc/cx4Ug7v3dtn20xSuHPUcwHtZZmgMJvD/ga
         cEKYXJO5LVxbGebNXOHgLxpEBZDzmT5KzKOBt1+HR14uJhXlRQWounl3ircliJf5tR33
         xrsH+vf8QwxR7azz8SCIh7BkrevwFfipOVQk4H5LII30rKwQPPcU0F88CXvFjRGVCgzO
         to/WiFglAUlHUyI3GxAd8yrjr8RKFIU7gEsKjKUPmlRXE4aTSlVJgzuBWn02hzcDVFuD
         4XRw==
X-Gm-Message-State: AOJu0YxTvD+ZKcx8PP1Ecng1jVp8ysL81gHF/LbII3p9PhPWcvccub8H
	/tjlqE1Ajlmhb8K3vLKaecEITJlaQ4At1oXdu0XEh/4gwOOzRhoEry8Bkwgevg==
X-Google-Smtp-Source: AGHT+IHzsnw5TGHNhM9GaI5lNXsmzH1jBjkNdTyXdBCPgQ7tx5bVGYxMba+mPuyXqYN+9sJJoRpaoA==
X-Received: by 2002:aa7:9ec8:0:b0:6de:a18:70b with SMTP id r8-20020aa79ec8000000b006de0a18070bmr355100pfq.45.1706284039622;
        Fri, 26 Jan 2024 07:47:19 -0800 (PST)
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id j8-20020a056a00234800b006d6b91c6eb6sm1271255pfj.13.2024.01.26.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 07:47:19 -0800 (PST)
Date: Sat, 27 Jan 2024 00:47:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Jason Chen <jason.z.chen@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [sailus-media-tree:master 18/18]
 drivers/media/i2c/ov08x40.c:1783:23: error: no member named 'exposure_shift'
 in 'struct ov08x40_mode'
Message-ID: <20240126154714.GB194356@google.com>
References: <202401261628.dWEtdXLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401261628.dWEtdXLE-lkp@intel.com>

On (24/01/26 16:47), kernel test robot wrote:
> tree:   git://linuxtv.org/sailus/media_tree.git master
> head:   f76be7216c3df5f563353bd7a6aaf5076b118943
> commit: f76be7216c3df5f563353bd7a6aaf5076b118943 [18/18] media: ov08x40: Reduce start streaming time
> config: i386-randconfig-003-20240126 (https://download.01.org/0day-ci/archive/20240126/202401261628.dWEtdXLE-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261628.dWEtdXLE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401261628.dWEtdXLE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/media/i2c/ov08x40.c:1783:23: error: no member named 'exposure_shift' in 'struct ov08x40_mode'
>     1783 |         if (ov08x->cur_mode->exposure_shift == 1) {
>          |             ~~~~~~~~~~~~~~~  ^
>    1 error generated.

This CL depends on https://patchwork.kernel.org/patch/13426393

