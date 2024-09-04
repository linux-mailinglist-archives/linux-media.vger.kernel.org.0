Return-Path: <linux-media+bounces-17618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54596C735
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804241C24EE4
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 19:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742AD1E4126;
	Wed,  4 Sep 2024 19:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E27ROuvq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493531E4101
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 19:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725477129; cv=none; b=mhsaaPpSlA6Bc+lX1yydv2jzh3LJfgHX4QbUXCAOGRpKAnaw++PQhCAnBLaxxr4WNaILwaPtUcd5+njWIJQyJcpukXJRbT6fOKI4kaxfB16NtHFXzQvJPt76yoibbP9rHHzlFKYO1ZNBvKco9CZckkYvzrLlC6udCtlMtOhxVfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725477129; c=relaxed/simple;
	bh=ruLjwy2jFV+ghDFSNtgYsZSJsAG96sW8A464lo1E1rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nP53dkWfzgvkZmWwcojgPNYv2zvpeMvw4W3BJNo3U7ABx3buAuv78R9o0RnVDCR/WWEfrBWcLKYqEJdtuzbhEnpIrWi6EcrDuIFBokJU9GNNuTHpeRrH7pAgsRF8l4zZg8jZ/EAkpi3ZKxM02M6wChblF2umUuyWk1sbsTAbDCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E27ROuvq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725477127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjS+J0To6FVRmBqGu5USy4NMnRdqHmPZWkcBkzToclI=;
	b=E27ROuvqpsIN47cLlZioMXXjzqvlzYwQVs7pkFuLGOjSe43cG+PkIBb3VetafJvPs0596d
	AJL6PqTl6pUS1FxXwteF0529wN9qYp8nzzilRsfKPj3AKFP5+utkMVEgTzTqlRgsXWPKtS
	rnHlNQHib0JkHBUn1u5oWrIykkjKiM4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-a99enW1ENIKJkeCHRS1P4A-1; Wed, 04 Sep 2024 15:12:05 -0400
X-MC-Unique: a99enW1ENIKJkeCHRS1P4A-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c24b4a57b4so3044760a12.2
        for <linux-media@vger.kernel.org>; Wed, 04 Sep 2024 12:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725477125; x=1726081925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjS+J0To6FVRmBqGu5USy4NMnRdqHmPZWkcBkzToclI=;
        b=gImfujbgUhqRH4KSk97zMftGuq0qxwqxDHFVYhvRj6S4941ewq3D4nAIuOiwMszcnZ
         fpSAcdEl6ls327d0+wcabi4ZkM/3muGbHoC+zba9WjVk+B4xJ8zwbnDZKTofdoAbTD21
         6E8uaTMVlpmkeD+lib9GvjNbBY1JS8Cntv1/JXH4wyQ/50kEinQFIyOlTYJT6VAyvyQg
         nz5E5rYQh5aRiuVn9FDuPUM2ua3KmaYCPZ+O0READzdnJB++476J9lbhsE7nQLQ8T7Bq
         N8aOKKd75bvK4iheCvlp3VUfTA6ETx2w9OaBMC/JcqUkNRBBSvVEqdKtVzue0O0dmLnV
         jTnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAyMF1/jztICZ2w8M2uCLl15YO9YR/OGxHMIXqYWmY1PKYASKfolUY3gnB1a6pCK+iIMDmQ9fXqPGLNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb8eJrDNSqw0/PBxkNTakELE/1AK3rEKWTRMUag2NTtf4euIoN
	XZAvAWAaFzrxWzhvdL5yHrU8DePlIAmfpHd0qDBNQI1E3piDnVajeGs9Ny6yBTV830g7zmC91Gp
	4cYrSVXhpVDpXS/tA+EkuZfDKpK1VNgfc+wy13ygtKfUdAy1XNK+Z0eyHWNZd
X-Received: by 2002:a17:907:72c9:b0:a7a:83f8:cfd5 with SMTP id a640c23a62f3a-a897f83506cmr1728239566b.18.1725477124613;
        Wed, 04 Sep 2024 12:12:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyjKhNfCOaCxIiv6uycQna1F0qrwg+75CiwEi5Uhl0ou+4uRNnGGTQ5BozarWRqgiWs0NXBQ==
X-Received: by 2002:a17:907:72c9:b0:a7a:83f8:cfd5 with SMTP id a640c23a62f3a-a897f83506cmr1728237166b.18.1725477124025;
        Wed, 04 Sep 2024 12:12:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623a68eesm25281566b.165.2024.09.04.12.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:12:03 -0700 (PDT)
Message-ID: <dfbf0064-4b8b-49f8-89ef-19a028a359ca@redhat.com>
Date: Wed, 4 Sep 2024 21:12:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: Add driver for AD5823 VCM
To: kernel test robot <lkp@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
References: <20240901211834.145186-3-hdegoede@redhat.com>
 <202409040751.A1Dm1pgG-lkp@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202409040751.A1Dm1pgG-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/4/24 1:59 AM, kernel test robot wrote:
> Hi Hans,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on media-tree/master]
> [also build test ERROR on linuxtv-media-stage/master sailus-media-tree/master linus/master v6.11-rc6 next-20240903]
> [cannot apply to sailus-media-tree/streams]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l-Call-s_stream-on-VCM-when-it-is-called-on-the-associated-sensor/20240902-052000
> base:   git://linuxtv.org/media_tree.git master
> patch link:    https://lore.kernel.org/r/20240901211834.145186-3-hdegoede%40redhat.com
> patch subject: [PATCH 2/2] media: i2c: Add driver for AD5823 VCM
> config: x86_64-randconfig-121-20240904 (https://download.01.org/0day-ci/archive/20240904/202409040751.A1Dm1pgG-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040751.A1Dm1pgG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409040751.A1Dm1pgG-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    drivers/media/i2c/ad5823.c: In function 'ad5823_probe':
>>> drivers/media/i2c/ad5823.c:203:26: error: implicit declaration of function 'devm_cci_regmap_init_i2c' [-Werror=implicit-function-declaration]
>      203 |         ad5823->regmap = devm_cci_regmap_init_i2c(client, 8);
>          |                          ^~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/media/i2c/ad5823.c:203:24: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      203 |         ad5823->regmap = devm_cci_regmap_init_i2c(client, 8);
>          |                        ^
>    cc1: some warnings being treated as errors


This is caused by a missing "select V4L2_CCI_I2C" I have fixed this
in my local tree and this fix will be included in v2 when I get
around to posting v2 (which also depends on the discussion
surrounding patch 1/2).

Regards,

Hans



