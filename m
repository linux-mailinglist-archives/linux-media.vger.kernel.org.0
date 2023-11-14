Return-Path: <linux-media+bounces-341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 696957EB4B6
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 17:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86EBF1C20AC4
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 16:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45762AF01;
	Tue, 14 Nov 2023 16:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MOBhll3t"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0522AEE1
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 16:24:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3933D10E
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 08:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699979045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OMAt2bbB2OtDJnSmDdv+SlogJ2MSXP9BdKgitEjjES4=;
	b=MOBhll3t70mujD+V3M6p6KdQro+7Ycw5hYiOhhdGMsMshPkfC6L9yWklMZQmJPu0Ty2gG/
	k/6I+s2QNBHbFnEoS38oTelU9LexWA+chTe1ANEES6HFbJpLTD6Ck0lH3TWD4cr2YEYskD
	J2zNsc8t9ymHmBqsOwYwWb3ElnC8Wnc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-3fXMQehiOLCWQWm-F8_aSA-1; Tue, 14 Nov 2023 11:24:03 -0500
X-MC-Unique: 3fXMQehiOLCWQWm-F8_aSA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-67166648d77so73771356d6.3
        for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 08:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979043; x=1700583843;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMAt2bbB2OtDJnSmDdv+SlogJ2MSXP9BdKgitEjjES4=;
        b=BlTU6iesmIE8k+7rl8fw10EyOSay9/qlEYC4NSprx+gjFXJX4XzzcW3rb7IWNzbH56
         kL3TqgsABO46ecn61rAwcMaQh0J2qvuuZn3bAa8vRtU4dena0g3ccGBNth7lFg/z9ABF
         xMnbf3qmDDzax3qFY6vW+p5q2zwEDyW8NQ5GjqVZBur2AbKVVMYBc9siBRBggDH+ZKb8
         9uWBKOCeZTvsCJlBRbYW4Ki0jHUd77b4ZnSUORDZTitepSDWhl4yWRQKVnPYo3rQ2EKT
         hOqCd515FUsNlw6uQASac2N0kR8oLKULp1XSOf2SOmaN9Tum+WieISw2lAFAlnUzIses
         Sxdg==
X-Gm-Message-State: AOJu0Yz+GOoIP5Gm/IYmj+JmcuZeh2/qNOhD9HWNIFb8QaBp22niySte
	bSfJxDtj1ad8Ow3ym2mp0ISL2w2K11Dk/HIOUeAVSVKmBbHU5WlpSJMdQaJoSVGj7Xk1UsTzf2r
	4cv6ci5W9E950yI570zPX8vU=
X-Received: by 2002:a05:6214:326:b0:66d:630a:79b9 with SMTP id j6-20020a056214032600b0066d630a79b9mr2571509qvu.40.1699979043485;
        Tue, 14 Nov 2023 08:24:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHi30kHAx5KL8eGl/LlTeExArejiri6J6i2eS/UN/F1fLR88NH5AhNiHw7NXj2GlJ54m2/4ew==
X-Received: by 2002:a05:6214:326:b0:66d:630a:79b9 with SMTP id j6-20020a056214032600b0066d630a79b9mr2571490qvu.40.1699979043228;
        Tue, 14 Nov 2023 08:24:03 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b? ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ee11-20020a0562140a4b00b0066d0ab215b5sm3054571qvb.13.2023.11.14.08.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 08:24:02 -0800 (PST)
Message-ID: <6a1ebcef-bade-45a0-9bd9-c05f0226eb88@redhat.com>
Date: Tue, 14 Nov 2023 17:23:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Prevents NULL pointer dereference in
 nouveau_uvmm_sm_prepare
Content-Language: en-US
To: Yuran Pereira <yuran.pereira@hotmail.com>, airlied@gmail.com
Cc: kherbst@redhat.com, lyude@redhat.com, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <DB3PR10MB6835FA6E15F3C830FC793D2EE8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <DB3PR10MB6835FA6E15F3C830FC793D2EE8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yuran,

On 10/26/23 19:03, Yuran Pereira wrote:
> There are instances where the "args" argument passed to
> nouveau_uvmm_sm_prepare() is NULL.
> 
> I.e. when nouveau_uvmm_sm_prepare() is called from
> nouveau_uvmm_sm_unmap_prepare()
> 
> ```
> static int
> nouveau_uvmm_sm_unmap_prepare(struct nouveau_uvmm *uvmm,
> ...
> {
>      return nouveau_uvmm_sm_prepare(uvmm, new, ops, NULL);
> }
> ```
> 
> The problem is that op_map_prepare() which nouveau_uvmm_sm_prepare
> calls, dereferences this value, which can lead to a NULL pointer
> dereference.

op_map_prepare() can't be called with `args` being NULL, since when called
through nouveau_uvmm_sm_unmap_prepare() we can't hit the DRM_GPUVA_OP_MAP
case at all.

Unmapping something never leads to a new mapping being created, it can lead
to remaps though.

> 
> ```
> static int
> op_map_prepare(struct nouveau_uvmm *uvmm,
> ...
> {
>      ...
>      uvma->region = args->region; <-- Dereferencing of possibly NULL pointer
>      uvma->kind = args->kind;     <--
>      ...
> }
> ```
> 
> ```
> static int
> nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
> ...
>              struct uvmm_map_args *args)
> {
>      struct drm_gpuva_op *op;
>      u64 vmm_get_start = args ? args->addr : 0;
>      u64 vmm_get_end = args ? args->addr + args->range : 0;
>      int ret;
> 
>      drm_gpuva_for_each_op(op, ops) {
>          switch (op->op) {
>          case DRM_GPUVA_OP_MAP: {
>              u64 vmm_get_range = vmm_get_end - vmm_get_start;
> 
>              ret = op_map_prepare(uvmm, &new->map, &op->map, args); <---
>              if (ret)
>                  goto unwind;
> 
>              if (args && vmm_get_range) {
>                  ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
>                                 vmm_get_range);
>                  if (ret) {
>                      op_map_prepare_unwind(new->map);
>                      goto unwind;
>                  }
>              }
>      ...
> ```
> 
> Since the switch "case DRM_GPUVA_OP_MAP", also NULL checks "args"

This check is not required for the reason given above. If you like, you
can change this patch up to remove the args check and add a comment like:

/* args can't be NULL when called for a map operation. */

> after the call to op_map_prepare(), my guess is that we should
> probably relocate this check to a point before op_map_prepare()
> is called.

Yeah, I see how this unnecessary check made you think so.

- Danilo

> 
> This patch ensures that the value of args is checked before
> calling op_map_prepare()
> 
> Addresses-Coverity-ID: 1544574 ("Dereference after null check")
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index aae780e4a4aa..6baa481eb2c8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -620,11 +620,14 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
>   		case DRM_GPUVA_OP_MAP: {
>   			u64 vmm_get_range = vmm_get_end - vmm_get_start;
>   
> +			if (!args)
> +				goto unwind;
> +
>   			ret = op_map_prepare(uvmm, &new->map, &op->map, args);
>   			if (ret)
>   				goto unwind;
>   
> -			if (args && vmm_get_range) {
> +			if (vmm_get_range) {
>   				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
>   							   vmm_get_range);
>   				if (ret) {


