Return-Path: <linux-media+bounces-32611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB8AB8E70
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 20:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5956817CC40
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 18:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D160F25A627;
	Thu, 15 May 2025 18:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="iM/RebzE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A194721C160
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 18:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332298; cv=none; b=CGsNXNJFhhfA++oEvDpnNLN04Jc4W3sEOCGbZM6yKWMjD0JnWY3FkEeg/KsvVk9KN9yq1DjMKi6ukkeQltmuN4496/b11VQIwdv4egl1rYtq0HcQOwrW7+rmIwy3OyS15hIyujYL9H/ulOWGqDHyT9bLnRPNC1P+7OZOJxrVabs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332298; c=relaxed/simple;
	bh=MeW2imbD+0sbVbaIbmZsCArhOObxP247tps4EkCCdJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=qI8kmx+UH/sdirVqNxk43LEQckyDplko+lz++JJnquE6f++coAi/cyqwYTozoVN5JCJ6JcEtLIybAA/kq9TcogLFOUMSZgqeD1lvapXRNvZzafAdbfUU3bHpZD1Hy9COBov4Gm6x5GyUt8jRWy6SDLA85poxUXMDhDK6cqe+Uwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=iM/RebzE; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476f4e9cf92so9871351cf.3
        for <linux-media@vger.kernel.org>; Thu, 15 May 2025 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1747332295; x=1747937095; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SqENoL4aMLDUtpJ6J41zIxw9AQzbwBrm9u1/bZHdjuY=;
        b=iM/RebzExkNQVQ6EtT7OmMwDzXu2wio5qrDY1W3ppc+eSJiZHR22gIRk8C/ylXzspv
         KoHZUAYv0/l8VNaEN34pKAkpLTXoJ5XHmiAgF5t5P7WzLvsaZyuXtQtFJDY/ubD8zlxy
         kw2fLzJlOoqFbtY5IKHpsgCi30z/E539ywxisUdmhs/kNEOvF/Li6xkGVIvSwzrsOylH
         m/f1q19ETQzKj3O1wFUr+ajFAht8BzkJaueMDL9zwmNCs+ShfAE4Z3zUrF8dh8FQ3oDU
         +uQAriHofF+t34B7eYMad+LqcN+UN6/qMlIMvTk7j0v8z4PH3oEleWkbZMIWuLn94diq
         Q01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747332295; x=1747937095;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqENoL4aMLDUtpJ6J41zIxw9AQzbwBrm9u1/bZHdjuY=;
        b=R3LJSzQjVHp9Fg6+kwSyKpayoOhNELsWqKh1TgNAWTTw3Tpmu58vLZCowSAw9Kg3Sr
         W6jW2o7jHF+R6ieHWMm/132sjvoss6/6lrm9ZZV5FS3MfG3r5NjsPptAxh/0SZDw2QkS
         dUN8Xg33Blav9An+tK79Z5BkYYERdaKQftXRnUsChwbQHLP7m6x5qTEsV/qVAaUa6/la
         +fHUm8cCXwx6qNXOVgD5Qt7M5Bt2ldm7fMumgEXMxvqbwpdJRYT7C7CnCgxH2IG5Qrns
         OsgXhX+ndYvzqIHaQ1sa4I/jjftWRRa0dr0zWZkiYNTnMIzLXQKH81mgiizKnvahba2C
         OalA==
X-Forwarded-Encrypted: i=1; AJvYcCWwKrFmFaTtBzYoBMq5xLO+Lw78k1TvxEfpQRRylk2ZFEdJKZNGUPzjcPsGj7AKnhDil6GbNCPqKT09fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2G36tScYXh390Umh3NeU2570/Aw8Rf6pKAiwAZOvw3tGehuCx
	ICIB40skheyixxLGRUT0GGdMrEEOGniIHHD6jKccyzBp32zcJyr2UfXVDSLwmV4coE9op0z1QbT
	ZyC449gK0jDx+X/CqzskqHQSvhKTQMA/o6OlBoPRtEA==
X-Gm-Gg: ASbGncsDJ/nnQyBHgqLZ5eABt9pZ0baKMddwHxgcYB+Lm0yYxtDLwkWZja2KllRZzNA
	1qLQntA1QdRd6Qk1twHCu/RsYDPf88NLL2AYRjQqLeIsjmM5IsieZu73L7kldkcjyVn5BDV0yyf
	x68/OFrvQh1/GLH9prgniURUx5Ot0KFUk=
X-Google-Smtp-Source: AGHT+IGFQP++c9XJDNDJpVGCGwvgZpf4fTxFvv688y33OjFyfYfYLK9l//bZATh/43rI6k4OFGCYqhyQBM5SOYRCBtA=
X-Received: by 2002:a05:622a:59ca:b0:476:9b40:c2cd with SMTP id
 d75a77b69052e-494ae49f4e0mr5251951cf.47.1747332295147; Thu, 15 May 2025
 11:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160713.1363985-1-adrian.larumbe@collabora.com>
 <20250507160713.1363985-4-adrian.larumbe@collabora.com> <9c0b95c8-bf2d-4689-ac1f-ccacba826060@arm.com>
In-Reply-To: <9c0b95c8-bf2d-4689-ac1f-ccacba826060@arm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 15 May 2025 19:04:44 +0100
X-Gm-Features: AX0GCFuRDimE2NPezlvg51LNRrQrl-sYF337fsjOpF63sMhVPLZez7fPK-61IS0
Message-ID: <CAPj87rOiEa1bTOPqyauYhoVoXEtNeDjE+DkLbzeGVJ1tW9fJcQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panfrost: show device-wide list of DRM GEM
 objects over DebugFS
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com, 
	Rob Herring <robh@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Steven,

On Thu, 8 May 2025 at 11:42, Steven Price <steven.price@arm.com> wrote:
> I'm also seeing a splat when running this, see below. I haven't got my
> head around how this is happening, but I see it when glmark quits at the
> end of the test.
>
> [  399.505066] Unable to handle kernel NULL pointer dereference at virtual address 00000004 when write
> [...]
> [  399.882216] Call trace:
> [  399.882222]  panfrost_gem_free_object [panfrost] from drm_gem_handle_delete+0x84/0xb0
> [  399.893813]  drm_gem_handle_delete from drm_ioctl+0x2b8/0x4f4
> [  399.900237]  drm_ioctl from sys_ioctl+0x428/0xe30
> [  399.905496]  sys_ioctl from ret_fast_syscall+0x0/0x1c

Soooo. Let's assume it has to actually occur in
panfrost_gem_debugfs_bo_rm(), since that's all that's changed here.

I don't think pfdev can be NULL here, because we've already
dereferenced ptdev and written to a structure member earlier in
panfrost_gem_free_object(). I don't think it can be the debugfs mutex,
because a) that's initialised with the device, and b) wouldn't be
offset 0x4.

I'm looking then at list_del_init(&bo->debugfs.node), which would
effectively execute bo->debugfs.node->next->prev =
bo->debugfs.node->prev. So if bo->debugfs.node->next was NULL, that
would explain a write to 0x4 on 32-bit systems.

What I _can't_ see is how that would be. Even a double-free calls
list_del_init() so we're all good. If the shmem alloc failed then this
would splat because panfrost_gem_debugfs_bo_add() happens too late,
and we end up with an uninitialised list head - so that's one to fix.
But I assume that isn't what happens here. I wonder if it's the import
path, and the panfrost_gem_debugfs_bo_add() call instead needs to be
in the panfrost_gem_create_object() callback rather than only
panfrost_gem_create() which is called through the ioctl?

Cheers,
Daniel

