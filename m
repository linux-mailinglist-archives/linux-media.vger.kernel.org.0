Return-Path: <linux-media+bounces-22873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE329E9148
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 071501885C0F
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 11:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9C121884E;
	Mon,  9 Dec 2024 11:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SCbItoKL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252EA218597
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742084; cv=none; b=ckKRBOEkfFila4quDsEV/kEQxe9taEPIUTomVsU6sx5Jio7Uvqpl9CrCC8ZPkXdcBleQxB54THtQHu1UDh1CG8WqJG8C1MtcadkZs+H90aFOjtk3t4w1Cae3KmPpZc+9ukzP23htvkyBNzblwGC1Tk9X5A2a3pUtfDFyat8aHTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742084; c=relaxed/simple;
	bh=T+YxWHS3C9ZSiHc+chPHEh+AeP96E4yR7QuzR5ljdKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g/QHStZavpos+9PSdfn1NkkGIzcL5JaOad+PTp85Cre9Cs1bRcMls5EAIc1XUsW9Vmr6YdYo/JVx/1IykteRBfk9hS68bmke2huGOlYh/kNWnRaHjVpCYltRTR81VlTaJsZsLUy6lZxB9Mv1lVNUvpJBmuO/kj50KSO3qAbGicE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SCbItoKL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733742080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NO6ec67okvv9M56zFhDtp0FFmwC2iQhXha5CQcXffcY=;
	b=SCbItoKLlyv42iSW0V33izv3sOHlvtObHCZ+xUf21QJ0FQTBfQaQfwO++6M3eVxx+slYZM
	3evj0dzbKNxA6DHk8IfmnG0dAL7eIh1ogmD8TT3HRT5h3PNyq7LncdgVXCU/7iF7CyV6Cv
	qyC27xxG9eocy7CyfQynSJObrUOvAX4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-FzJxCDuQNtqobu7SVJE_qg-1; Mon, 09 Dec 2024 06:01:19 -0500
X-MC-Unique: FzJxCDuQNtqobu7SVJE_qg-1
X-Mimecast-MFC-AGG-ID: FzJxCDuQNtqobu7SVJE_qg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa6869e15ebso97095266b.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 03:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742078; x=1734346878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NO6ec67okvv9M56zFhDtp0FFmwC2iQhXha5CQcXffcY=;
        b=okZG+d8NhVPNwPLE5t0MrDNZe2+R9Afxwl7LohAqR6CAzMBWilM9kgGVPu4r4F3Ekp
         2Ha//aUdyZJrwdXPJ7L4SNfDX0RVuWmqwGNs2URl2WSQfG9gSgw39AgWVztec1qcPI3h
         JgGpX53lQdaUoKofAkQZx9iLrBndVtYStUG4yNKOZy9UKJ088w7Q6wGqaxZ2JzS14BaN
         9VqcoNEkvcfBGxDXA7Mc78lBgHCU4O4G+Zom0ij8akXmPVCErmM7rUyDq/vEMpdgWOzW
         ARFYlT47TZFHg1x62ZcuFH4Rn/I/B6vPBn1y9m7OP+oZ7yG9nD8n5WIjdeMgxqKF9F0w
         ikcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOytmq1v94kjeQWf0yAjif9rJ4UOaXnrgL6QcesCglhr2RviN2AQ0UCG8orPyYM6g+ip655jFreJDSbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEDRBm2q1t+bdDRBJ/E6u2jqORauI6Lb+1FHzhWRbkvKDc14sM
	mas/LrS9cMt3CQBYiwQdYheHsAiIcgnrXmf3VixQKLCICPWukV5Lq++e+Rznn2W6KhBrQ8SV3FP
	N2IuNJzPJyp42lzg+8bgkzjr4kdLc8rRRR9XA9tYJk0H2ITTEYZUwP1dwz+Z/kuH6p5pH
X-Gm-Gg: ASbGncvlNgXGic8F+vj/cBVxZYIFiFy8WH2isgZLRcUhpA1Kw6YHMNROcHNDlavmlR1
	GmmBh4lEm6syB6ePu6kXE+mNoC4F1mVPzecB0stTxRnSSeHIp+VXMm+u36evO+W8GNdxojlMe7v
	uE39JJRal8FHGxXJBNoOkZOSzRNN1DcVo58xVKwIvCpzXIDfUgfC4A2ae7PMiwz8z0SrCKtocy9
	WI9+j4xcEfCVypWNOxX4owMAnNZ/pqsBGNfcX0pbF5n36cnG3gQJA==
X-Received: by 2002:a17:907:7854:b0:aa6:79c0:d8ce with SMTP id a640c23a62f3a-aa679c0dd17mr431692366b.1.1733742077714;
        Mon, 09 Dec 2024 03:01:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn/LCpkxsb9dv/71P5EH3sArKezZObZ8yWTt35AHgOIcEPgweUp9Z0CUhOTo5YwwEpuOfKYw==
X-Received: by 2002:a17:907:7854:b0:aa6:79c0:d8ce with SMTP id a640c23a62f3a-aa679c0dd17mr431688966b.1.1733742077280;
        Mon, 09 Dec 2024 03:01:17 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69448304asm65009866b.45.2024.12.09.03.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 03:01:16 -0800 (PST)
Message-ID: <e3316372-d109-4d2e-ad2b-8989babdf546@redhat.com>
Date: Mon, 9 Dec 2024 12:01:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] media: uvcvideo: Two +1 fixes for async controls
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Dec-24 10:20 PM, Ricardo Ribalda wrote:
> This patchset fixes two +1 bugs with the async controls for the uvc driver.
> 
> They were found while implementing the granular PM, but I am sending
> them as a separate patches, so they can be reviewed sooner. They fix
> real issues in the driver that need to be taken care.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Ricardo, Thank you for your patches.

I have merged patches 1-4 into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

now.

Regards,

Hans



> ---
> Changes in v6:
> - Swap order of patches
> - Use uvc_ctrl_set_handle again
> - Move loaded=0 to uvc_ctrl_status_event()
> - Link to v5: https://lore.kernel.org/r/20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org
> 
> Changes in v5:
> - Move set handle to the entity_commit
> - Replace uvc_ctrl_set_handle with get/put_handle.
> - Add a patch to flush the cache of async controls.
> - Link to v4: https://lore.kernel.org/r/20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org
> 
> Changes in v4:
> - Fix implementation of uvc_ctrl_set_handle.
> - Link to v3: https://lore.kernel.org/r/20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org
> 
> Changes in v3:
> - change again! order of patches.
> - Introduce uvc_ctrl_set_handle.
> - Do not change ctrl->handle if it is not NULL.
> 
> Changes in v2:
> - Annotate lockdep
> - ctrl->handle != handle
> - Change order of patches
> - Move documentation of mutex
> - Link to v1: https://lore.kernel.org/r/20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org
> 
> ---
> Ricardo Ribalda (5):
>       media: uvcvideo: Only save async fh if success
>       media: uvcvideo: Remove redundant NULL assignment
>       media: uvcvideo: Remove dangling pointers
>       media: uvcvideo: Annotate lock requirements for uvc_ctrl_set
>       media: uvcvideo: Flush the control cache when we get an event
> 
>  drivers/media/usb/uvc/uvc_ctrl.c | 83 ++++++++++++++++++++++++++++++++++------
>  drivers/media/usb/uvc/uvc_v4l2.c |  2 +
>  drivers/media/usb/uvc/uvcvideo.h |  9 ++++-
>  3 files changed, 82 insertions(+), 12 deletions(-)
> ---
> base-commit: 291a8d98186f0a704cb954855d2ae3233971f07d
> change-id: 20241127-uvc-fix-async-2c9d40413ad8
> 
> Best regards,


