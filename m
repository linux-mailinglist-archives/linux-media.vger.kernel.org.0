Return-Path: <linux-media+bounces-17338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB64F9684F5
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 12:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCD751C22C0E
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6875183CBC;
	Mon,  2 Sep 2024 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="So7GMvUX"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779AE183CA4
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273559; cv=none; b=SHwN7NmVIhP+77h/yghf1KapZpuueFq5x1OMKtVNQ1v3VDVJq3L4nD9Xr7YtvDEiKE2Z3Ye7bri1PNnGb51GOeXes0S7i6pLnc6MlMLQgTGCyhrFTxLhtL2E6i1sV3TCX0it2U6YdZvuDMngBU1K7s5RK0EuODBsRZNLbpA7ekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273559; c=relaxed/simple;
	bh=se/003ORR+bexekGJlJlAT8+LSdavfTNjy2iZuwLRM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mF5NoreVP4AvnLRS4q85RSYAWdymbGr2HdBiGkMaWXvyQrY7d5theRWAVxM35sjYVJ03VnOrjeXqxnC4HOAlmp2YUOftaiT7QqN+WhccHsHaTD8L7Ws3Rx8dBTDR3ujT7PfRBDdFstPElv0/SumtXN6CyiwzSBt/voABNYtudWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=So7GMvUX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725273556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n8nl/XqwOtp/y2rM8eup84lZdKxq+P3395D4mXeu/jg=;
	b=So7GMvUXrijGJDiIwd7zjTrPshifomCt/hw4rKfe7JUt9wsP/KoYHiE4HiR3jkJh/xvFT9
	tlYMVwXAAxOdGgyQhgcv3+6jPgAJ50jKAVLdzoKEKMt791mvxcG8X4mxWcbZct4+RpGNut
	2aCmXwimbDH0fTNs93iXFFDuGMA5Roc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-rsbsQDBEOOqZLlEe5vuWvw-1; Mon, 02 Sep 2024 06:39:15 -0400
X-MC-Unique: rsbsQDBEOOqZLlEe5vuWvw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5334573b3e6so4011151e87.2
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2024 03:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273553; x=1725878353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8nl/XqwOtp/y2rM8eup84lZdKxq+P3395D4mXeu/jg=;
        b=YQx5VKNn6cITX+814CskmxRuTAneULnh+/Nq9cuygW7h9PllNzEL9LkwFT7QgEmUoc
         bsigCvu6ekfHKM5kzZaYSBP0ZFLIcVXPEImEc1oIs0vUWxUGudGDx3C9+BDCqoLQoLiq
         C7wSfBpaCdY1QPx/5EFK2EvjS5q4pdY3exVqiIQnsHrwkGq1SOmvzt4IHBlyjAAyO1KO
         4o+R2NvX0pXqREtLst6NEOmbfKxlVZvOJ1mHE/8YCYwnxkJh4nzO/zap9g1wG+wvmsI4
         2Y4HUfJk/DOCUw5M1Q1xq4dHC4/tfVUz3+B3VPt11dyhFib6nevkMlC+Ok6v9VgzwVrA
         QnfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMCBjk7FZmCe0V83kc3KBsV2333nQQuhenU8iYdp4Q7trIQwZTKA/FImXLDmS/70ONYXiXCgniQZ4pvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK08dlWbnKv9s97qsLK5BYkphBfEwUGzWRDmgoEfiFNJdr0lkv
	AmmzaRomeblzVhb/w6J+1KljW5UXZNcuVUWWTTXCQHb20u7sOioJjP4uy4BmwgNKpVsw8ZMmY1z
	LYGrVjuvb+tptmAOBT14eo56whTvSAm/uYDca03FeJU3YxZxD+b9zRGMRZLFqfhFrAuQ66NM=
X-Received: by 2002:a05:6512:2206:b0:52e:fd53:a25e with SMTP id 2adb3069b0e04-53546aefe69mr6516190e87.2.1725273552943;
        Mon, 02 Sep 2024 03:39:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsp6AYb07IuljjWOBugVezON5ju+NpTJb1ajwUFe1m9NynakmuZ8uGQ+dTn2+8jpFwp5XlNA==
X-Received: by 2002:a05:6512:2206:b0:52e:fd53:a25e with SMTP id 2adb3069b0e04-53546aefe69mr6516167e87.2.1725273552315;
        Mon, 02 Sep 2024 03:39:12 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feae63sm543041566b.35.2024.09.02.03.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:39:11 -0700 (PDT)
Message-ID: <5e8e08e9-d807-4626-8e9b-b34fe6cef447@redhat.com>
Date: Mon, 2 Sep 2024 12:39:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: atomisp: add missing wait_prepare/finish ops
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
References: <cover.1725265884.git.hverkuil-cisco@xs4all.nl>
 <9f401f3732dd728e3d2ca508002c97b80a2eae30.1725265884.git.hverkuil-cisco@xs4all.nl>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9f401f3732dd728e3d2ca508002c97b80a2eae30.1725265884.git.hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hans,

On 9/2/24 10:31 AM, Hans Verkuil wrote:
> Without these ops the v4l2-compliance blocking wait test will fail.
> These ops are required to ensure that when VIDIOC_DQBUF has to
> wait for buffers to arrive, the queue lock is correctly released
> and retaken. Otherwise the wait for a buffer would block all other
> queue ioctls.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Hans de Goede <hdegoede@redhat.com>

Thank you for this patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

I'll run some tests when I'm back home tonight (with access to
atomisp2 hw) before included this in my upcoming atomisp pull-request
for 6.12.

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/atomisp_fops.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index 50c4123ba006..b180fcbea9b1 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -441,6 +441,8 @@ const struct vb2_ops atomisp_vb2_ops = {
>  	.buf_queue		= atomisp_buf_queue,
>  	.start_streaming	= atomisp_start_streaming,
>  	.stop_streaming		= atomisp_stop_streaming,
> +	.wait_prepare		= vb2_ops_wait_prepare,
> +	.wait_finish		= vb2_ops_wait_finish,
>  };
>  
>  static void atomisp_dev_init_struct(struct atomisp_device *isp)


