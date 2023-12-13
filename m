Return-Path: <linux-media+bounces-2369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AAD81182E
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 16:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19CAD282B2F
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 15:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D438D381DF;
	Wed, 13 Dec 2023 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7H7pIKY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A291FE9;
	Wed, 13 Dec 2023 07:42:48 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d08a924fcfso65789135ad.2;
        Wed, 13 Dec 2023 07:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702482168; x=1703086968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNspfJlVqkGI+84+zJiCPcimkPN1petzpe1fNUwvChk=;
        b=g7H7pIKYpMHdERLUpKkjWvQNiOaz7pl5Io1GNIopRJ74K6UJwNU6rtIZfbvLmGqfez
         23vnbNVIi82rl9dYuFBEK+0PPvzQ7AXaNJyL3Jix1filIeqKC/z91iajFxbsvI3v2QTW
         eky8J85Jz83Un4YD+LLUZxckXGR/QvSfy0HenS9Q3PfM4eStW/w8UYkVqEzBVbfFAVPB
         G1L/wRs30YzAV/bwOb3xZiHxRxT3VHkNCow/RfnpE/mlgONo5QxBAe6LNohqED2QIFXC
         1FZDlIsx+KaZ4k335RPmFTLJThkXWmLzUcbDHsYZdqf+sN1oWmZ8bVbTdkeWqG+s2eOM
         qLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482168; x=1703086968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pNspfJlVqkGI+84+zJiCPcimkPN1petzpe1fNUwvChk=;
        b=BUBIPqERIFJGmEdH0Tj3CkJeR9OZf9D9Urk8m1KDR7B1qUNj79fR0o2yf+3JCA//Co
         drt3ixH6KaaKKFDDldd1Dgb9wkXQ75fZquiqxbwnTL/+w/YnIWs8PaZOWItESLFx4XO6
         /tZP0dk7Mxn8CG46/8k/yCOB9oaQZMocOSVFZd6bSvGOzcqiy1SkFDDczeKj4AMt63Zt
         Y56sg2bkYhTWl3wMPOVbaKSFsgbn4EJWKsjW24bXXbxjw5iAdRZOoVTMGPUcuZRvnV9G
         A6CGwwwwejDS5lbQCbPNSEOzaCgkl1+iFs1JLmpapsJTrONOeKctulNPpVcofs3n4jDz
         cJQw==
X-Gm-Message-State: AOJu0YxD2NZWyUrrm1ICfzIKtKmNVXlucwNM8Lu/B6yoDEjhJCrOfeAV
	Gh6EjnVN2l/VfDIb6lsTWcA=
X-Google-Smtp-Source: AGHT+IHBOmXf4W3D6sBHrUVLG4Oj7Nofh5iZLh4OH7v6/MiahFsCTPrQJunt/keLomAhjqB+bETPbA==
X-Received: by 2002:a17:903:244e:b0:1d0:cd48:e05c with SMTP id l14-20020a170903244e00b001d0cd48e05cmr10561199pls.75.1702482167534;
        Wed, 13 Dec 2023 07:42:47 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id jf18-20020a170903269200b001d087d2c42fsm10685463plb.24.2023.12.13.07.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 07:42:47 -0800 (PST)
Message-ID: <d58dd14b-1a61-4377-9477-1af1346147a5@gmail.com>
Date: Thu, 14 Dec 2023 00:42:44 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: sphinx/requirement.txt: Reflect recommended Sphinx
 version
To: kernel test robot <lkp@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <50830030-dca7-4c43-bcc8-449c7cfa9fbb@gmail.com>
 <202312120740.HxQGwUoL-lkp@intel.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <202312120740.HxQGwUoL-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023/12/12 8:27, kernel test robot wrote:
> Hi Akira,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on lwn/docs-next]
> [also build test WARNING on linus/master v6.7-rc5 next-20231211]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Akira-Yokosawa/docs-sphinx-requirement-txt-Reflect-recommended-Sphinx-version/20231210-074628
> base:   git://git.lwn.net/linux.git docs-next
> patch link:    https://lore.kernel.org/r/50830030-dca7-4c43-bcc8-449c7cfa9fbb%40gmail.com
> patch subject: [PATCH] docs: sphinx/requirement.txt: Reflect recommended Sphinx version
> reproduce: (https://download.01.org/0day-ci/archive/20231212/202312120740.HxQGwUoL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312120740.HxQGwUoL-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Documentation/gpu/drm-kms:360: ./drivers/gpu/drm/drm_fourcc.c:344: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:39.
>>> Documentation/gpu/drm-kms:461: ./drivers/gpu/drm/drm_modeset_lock.c:392: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:49.
>>> Documentation/gpu/drm-uapi:434: ./drivers/gpu/drm/drm_ioctl.c:928: WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:70.
> 

These warnings on duplicate C decl are expected when you upgrade
Sphinx to >= 3.1.
See https://github.com/sphinx-doc/sphinx/issues/7819 for the long
standing bug of Sphinx. 

Anyway, I can't do anything in response to this report.

Regards,
Akira

