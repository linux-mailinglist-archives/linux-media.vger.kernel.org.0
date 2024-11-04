Return-Path: <linux-media+bounces-20789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 528939BB30B
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 12:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 706D71C21797
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 11:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9A21B9831;
	Mon,  4 Nov 2024 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vd0z46qn"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5FD1D514E
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718723; cv=none; b=H3HPceyEk+RoNcoOXyT78Rtn8Nc1i891KlqNcfLJl9/hWY1i7nWnsqQhoNoGqwCT8ozreSAUZchGnBkcyHdFNVMDvU3ZrAvA3ZnQU4Q+Fjb0Pk468zV9MB7YjEG3y/twB+sQqhO4485R+DQUxhBw3WE47mtbjP3AhqAG7PSCg94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718723; c=relaxed/simple;
	bh=sk3d/FHYhRaJyGTKGAjIhgq4yCrcH1MmP5JNRYYh0mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A9AoZOp9j9rmKgPoMrbCvRXpRsRui9o7v4Hy1C3uOKGe+BlpO9fBGYTVY8VZLpm8p58+Rw/nlyWQ/wVS8dwpEAsUxBFzbtRtuvcHRpOPJCNfNaycJ4cWGiNLtwcAXYsto3NCCZfAzQLjV294L/GFLPuupf98f+ExiFh79XPKkN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vd0z46qn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730718720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=heB7JxUhN8OMarE9DCmGTXKR/9N4xli4VLKntPUX0uo=;
	b=Vd0z46qnCEoY+wOtYvDQ1hl4MCfeM0JfjM1Q/1Pm9gEseOlNKB6aUWEWk8yYB3eoGvjG6w
	rvl2EJjE+JrYE1G76cgeLm2OzjMNKp1naKO0gGjG2oXDi5XrT5K5HQx6Zuu7UtF+phm1Pc
	ZnsdNThLS0k8Q45jc7w+MJpc2XnOpp0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-1-BGqkgcOdaYU2ahaDqF-w-1; Mon, 04 Nov 2024 06:11:59 -0500
X-MC-Unique: 1-BGqkgcOdaYU2ahaDqF-w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9e0574854dso351399666b.2
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 03:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718718; x=1731323518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heB7JxUhN8OMarE9DCmGTXKR/9N4xli4VLKntPUX0uo=;
        b=r9Ybz1PTw2un3x+jf/+5Qdcpi6NClROrv+c1KSsxKmzgrZ8XPzJFv61ptxh8FX292u
         a6W0dcrl2M0R1iFixs3Km4sr/ijKPcT7vPc0GVnYnsgzVJUk4odsL1XIzBZgUuUF9AvV
         TcnU1m0DGp1o393PpmVyPeZvf4He7EQSsuH/OeLvwpq+Q2zOP/QmoC75e8P75aXbbg7B
         jB/d/US4bmgAZ95KY7G01bhtKmYLjaJrnTvxg4ScEHhVOLzcX/fvdS7Lby+4V+YZNfy/
         FwJzTw1r1sVM4Xp8F+oCLl7LK7yMJFjuC7WcDjxNRGwM/9MyE+K1rUIEjGeVRUjfWncw
         Gj9A==
X-Forwarded-Encrypted: i=1; AJvYcCWeHUK3lOxns6MVETgZRoL21HNlgmAxaQQ3rEurxXWsLMmHtrZLPEL76BKhiyTmQNHJ+bABMTWRa4JqmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZKH7dyZ22S8gBUsru2UcYKXG216kfLr/mGBqTeVCCQwBblc1G
	ql8w7UNjt7er2RTlz/ZMBEwv1KIT562tXdKCyKJCN+a+sPDEayR/Qk5ELIAK/SFkzeMQlK1OdaB
	M7dEV/YoVeFj08JUVT1q3Y0kFRrCIwEs3D4ocMqutz7vC0UWx7UXTJNO5LlcO
X-Received: by 2002:a17:906:6a1d:b0:a99:f91e:4abb with SMTP id a640c23a62f3a-a9e509390fbmr1467888266b.27.1730718718200;
        Mon, 04 Nov 2024 03:11:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESr0znc6ICl868V7IWLvnxc5lZHB9YcsEzyyAb2F6XqyxC0yWNsunfqaaaTCjKGcIigUv94Q==
X-Received: by 2002:a17:906:6a1d:b0:a99:f91e:4abb with SMTP id a640c23a62f3a-a9e509390fbmr1467885066b.27.1730718717741;
        Mon, 04 Nov 2024 03:11:57 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56641223sm536105766b.153.2024.11.04.03.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:11:57 -0800 (PST)
Message-ID: <770ad2e1-ceed-40b7-82ae-57534f7790d5@redhat.com>
Date: Mon, 4 Nov 2024 12:11:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: atomisp: Fix typos in comment
To: Yu Jiaoliang <yujiaoliang@vivo.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jonathan Bergh <bergh.jonathan@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Dipendra Khadka <kdipendra88@gmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Cc: opensource.kernel@vivo.com
References: <20240923033032.2420839-1-yujiaoliang@vivo.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240923033032.2420839-1-yujiaoliang@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Sep-24 5:30 AM, Yu Jiaoliang wrote:
> Corrected typos:
> componnet->component,
> cofiguration->configuration,
> doubtfull->doubtful,
> consisit->consist,
> coppied->copied.
> 
> These changes fix the typos in the comment,
> without affecting the functionality.
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c                | 2 +-
>  .../media/atomisp/pci/hive_isp_css_common/host/input_system.c   | 2 +-
>  drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c   | 2 +-
>  drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c     | 2 +-
>  drivers/staging/media/atomisp/pci/sh_css_mipi.c                 | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index c9984f1557b0..eb46ba4f4f13 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -55,7 +55,7 @@
>  /* G-Min addition: pull this in from intel_mid_pm.h */
>  #define CSTATE_EXIT_LATENCY_C1  1
>  
> -/* cross componnet debug message flag */
> +/* cross component debug message flag */
>  int dbg_level;
>  module_param(dbg_level, int, 0644);
>  MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> index 8f2f4e8eddd9..c18f62fe66b3 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> @@ -406,7 +406,7 @@ input_system_err_t input_system_configuration_reset(void)
>  	config.unallocated_ib_mem_words			 = IB_CAPACITY_IN_WORDS;
>  	//config.acq_allocated_ib_mem_words		 = 0;
>  
> -	// Set the start of the session cofiguration.
> +	// Set the start of the session configuration.
>  	config.session_flags = INPUT_SYSTEM_CFG_FLAG_REQUIRED;
>  
>  	return INPUT_SYSTEM_ERR_NO_ERROR;
> diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> index 7ce2b2d6da11..3bfaf52c5cdd 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> @@ -951,7 +951,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
>  	unsigned int i;
>  
>  	assert(descr);
> -	/* MW: used after an error check, may accept NULL, but doubtfull */
> +	/* MW: used after an error check, may accept NULL, but doubtful */
>  	assert(binary);
>  
>  	dev_dbg(atomisp_dev, "ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
> diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
> index 2d7fddb114f6..0ab83e1b51b8 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
> @@ -362,7 +362,7 @@ void ia_css_frame_free_multiple(unsigned int num_frames,
>  int ia_css_frame_allocate_with_buffer_size(struct ia_css_frame **frame,
>  					   const unsigned int buffer_size_bytes)
>  {
> -	/* AM: Body coppied from frame_allocate_with_data(). */
> +	/* AM: Body copied from frame_allocate_with_data(). */
>  	int err;
>  	struct ia_css_frame *me = frame_create(0, 0,
>  					       IA_CSS_FRAME_FORMAT_NUM,/* Not valid format yet */
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> index 80f0395cc560..710744ff0b24 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> @@ -169,7 +169,7 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
>  	/* ceil(words_per_odd_line/8); mem_word = 32 bytes, 8 words */
>  	mem_words_for_first_line = (words_for_first_line + 7) >> 3;
>  	mem_words_per_even_line  = (words_per_even_line + 7) >> 3;
> -	mem_words_for_EOF        = 1; /* last line consisit of the optional (EOL) and EOF */
> +	mem_words_for_EOF        = 1; /* last line consist of the optional (EOL) and EOF */
>  
>  	mem_words = ((embedded_data_size_words + 7) >> 3) +
>  	mem_words_for_first_line +


