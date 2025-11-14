Return-Path: <linux-media+bounces-47084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC1C5D34E
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 14:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A4A65358806
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 13:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9061024678A;
	Fri, 14 Nov 2025 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZbqfK4m0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3688524336D
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763125187; cv=none; b=EUtLhYeD9gMYUjdA2+E+yu3ycAq36mppcsOglRm+2LE1G+fdbExN47PYHEJt0+LkZlaCLdkbAi3wuAVpS2OpVyou1xfVwR91kLEvi95IvbFunxddkva84IwilKljzXnHvcyWYRGH3VE2SqrVS4j5r2H3H9Kbx/HMzH06mHHmwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763125187; c=relaxed/simple;
	bh=OwXqaVYjP+AYjhrqdV/iUf65lNBgi6i65jcAVuzkims=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjZJjE5gbb4LKu8UGUbKuoSuW5Snyrz7xioSAUDhAOPYpwxGt8A/2GU9HON6jHQJ/xDcxS7L2d7EVt5EdQZip3kfkmPq8Wn0IamV0R7bbIFYWEMFgeps5tTi7MdHwpfalO/xf5xxsa+GU12UYKV/Tfpg2+eURAtujE2ELdEE7Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZbqfK4m0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b472842981fso243729566b.1
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 04:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763125183; x=1763729983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lIa30kEZfIOzXn6c2Ch+jzSexECrPYWXzGffwwy3r9Q=;
        b=ZbqfK4m0Vk3QZZMUhnZ65dzeU/GFengPpj80uV976TTNT6cF3kLVFLU8dNGFNmtTBM
         4qOp9/GpfWs9OKiNwe0QHH/jcW19OTYlr1meSgMwyMFng3k0InkVtUKHBwfo5BNYqFr+
         4lFMJhMGNriMqn3fozHBGzFjOKEU5kUtemJ7mYPxBLflIyzVat1J4pYAXgbN4B2YnyYG
         82UWE3kzLCNGqMlMm3yvbYBMH3F7S7iX89IYp4nrzQpu+C75oEGN3b+p3276ZuRBY6eY
         kmTlfbRGGr9zKGdLcC+V/1s+Tfa76MlJmsfSuKTulTxUlUvcI4E9GKJuCGZhh00S7xuu
         FnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763125184; x=1763729984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIa30kEZfIOzXn6c2Ch+jzSexECrPYWXzGffwwy3r9Q=;
        b=YbbP8lb+2PQal2URxxbEljRcJhGVb7xPiWzQrxkARXlKQ3RlxBMZypdSLJ8chcxzcF
         K/MFawJ6d88xfYD6psJMCV18poloWn3AMavVS9Uzw8LK9pP9qvpCyvcADI6l5NaxQ5o4
         aP+eAn1jhxossbD/NilZkErVGeKpxuYgecYzGQzbwtnCP7wRvoYmv/toUG1RXk7isxYi
         9nTjMP5niM0eO3E0CPlS7qZIq7ag5kDXbGy8SezIM43rF//Uj/zcXY8WhqvR95MQ0vTg
         3HtMoQBQF7JWvTQ5hZYfnHPZdmmkCtI3wsYFM5lF8d/YNhoArFRy8ACC1uGQaOPpz/TD
         b7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8zeqfvIArUjDlKOTWqETFgzzdxfxSN/txNRQFTeg87aLlGus5SnjrJW+/7b+U+dA37N7Ehwrdvvoicg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweQAP71aWbNKkEgooCfYldU5gKQR38wNg02Aid57wdgWEMKE/z
	j/XYbb2CZTzIRFWhjF5IZ8VCgiu1I/9UbGBcEA9l88gkWeKXU48XAF6qZWu2uqiwFRs=
X-Gm-Gg: ASbGnctlQnfWF4C5pVJIVHJU51lqyth2a9LRj5zhIXscXeLMNWfugXUVHlaHjXmmfKX
	cWhrAtVBDgu6Ryg3M362lPOHBcebG14JZ1h6TD8aS8UpMLoiPPuyung27QwdceXeslJb5Fe2AGX
	kveTUlYahXtUrqFFwJTLC/CmJcWPnEf5HfOy7D/BlVYTd2y+c/UZdSE9vVgXyx5/Bnb/RutDLgH
	PH/ESoKj8hpC0lcRhOIryjq2Ccnp1GmABWOSYN/z7BPgO3vbiMyOxf//QPlNs+SjGawcyfeLGiK
	H7EkOLlKkZd59Bv4dO20giixsPP6aGblkgM1SbCd6T7Ctg4kspYZynCz2PUryiGDgiBjSxUBGTb
	uhpyqHZ3z6SuCCmhYzfH4wRYpjg7pGk7niQQChBjfPyDXN/Pz1JvOYhHieFzOc/3VOqOCeS6k5f
	UbRhc=
X-Google-Smtp-Source: AGHT+IH6H5eoyoDiGCawX8hcyfAIsFqjcgfKx5GqQ3M5ZUeRqB23EXgoQaPPEhXoJ1r2rQPfP0tLQA==
X-Received: by 2002:a17:906:f105:b0:b73:7652:ef9e with SMTP id a640c23a62f3a-b737652f76bmr38125366b.55.1763125183501;
        Fri, 14 Nov 2025 04:59:43 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80a3asm382714666b.37.2025.11.14.04.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:59:42 -0800 (PST)
Date: Fri, 14 Nov 2025 13:59:38 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Vitaly Lifshits <vitaly.lifshits@intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Sagi Maimon <maimon.sagi@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 01/21] lib/vsprintf: Add specifier for printing struct
 timespec64
Message-ID: <aRcnug35DOZ3IGNi@pathway.suse.cz>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <20251113150217.3030010-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113150217.3030010-2-andriy.shevchenko@linux.intel.com>

On Thu 2025-11-13 15:32:15, Andy Shevchenko wrote:
> A handful drivers want to print a content of the struct timespec64
> in a format of %lld:%09ld. In order to make their lives easier, add
> the respecting specifier directly to the printf() implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks goor to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

I wonder how to move forward. I could take the whole patchset via
printk tree. There is no conflict with linux-next at the moment.

It seems that only 3 patches haven't got any ack yet. I am going
to wait for more feedback and push it later the following week
(Wednesday or so) unless anyone complains.

Best Regards,
Petr

