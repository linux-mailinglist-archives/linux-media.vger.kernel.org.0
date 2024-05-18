Return-Path: <linux-media+bounces-11629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1518C91CB
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2024 20:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 889F9B21253
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2024 18:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762614D59F;
	Sat, 18 May 2024 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dypsSydO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A49848CFC
	for <linux-media@vger.kernel.org>; Sat, 18 May 2024 18:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716055590; cv=none; b=jNG14l07z0Qi9msj3sjio2XFWi8pnkGQiPtzcB914KJR2/DZhixiAUWRzOGRJIYArYOANg9ZbGd9JI7Xguv4D86veS/a4afDxGWdH3+UCcgCZI6zzoMwvWHg4VR6BfX1AItC1y55wKXxRGsL0T4jfQoR2hDGqQI8+cRILcA4tdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716055590; c=relaxed/simple;
	bh=SFtO3a4RKrkjrGHguXWwcDovKIMDazuVdb4cBPkaPTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJuJac0LZDEjgf1aTA3VGIOv1zG37MhW0mfgOnowwcjoDx96YQHEzVtD5a10k5si4BbC9piaPvtBGhlNdy0qPLb6RKgAP7lBR/KwoJpcuRUYV0DiLiUp4tSejLNuc6TAz++GKTQk3LgXn2L47RouvayvTwMahLLwAKEfqcj/paA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dypsSydO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f4603237e0so838344b3a.0
        for <linux-media@vger.kernel.org>; Sat, 18 May 2024 11:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716055589; x=1716660389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eNjtPFN4gwk8FY4XhBI0pqmWHSzhdefGp6JGYF0RnSc=;
        b=dypsSydO/wW0nk8lSSROpX0nlTLl0hYxzIVWa8PD8KvF6CVya4v2vQHt83QgCCv467
         JkY4vrQDAuV7qZqFnkdZ2tV3gi0zz9HT7PvzNoRTUjKMC3PZyvH1KeAyHjebPDfSRxOo
         z8KZic9m1yBDUulQ1evYi6/Rj9ab2ow+Yxt0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716055589; x=1716660389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNjtPFN4gwk8FY4XhBI0pqmWHSzhdefGp6JGYF0RnSc=;
        b=NPQFI7TjY/JK7cmq2Sj+GKHtIeuHsj4by4MfQsKXXaiYktq1IAxcJx/yGPpaDnTdTu
         rSsGRe3KcNdfIutajmdQzwgFWPPv3TUyfXdnpwbXZTinuumvAM4LjLOWzbURqtbSltt5
         9zOKwZlLlMyCjisHRiqLpyXEmbNULN5Bu2rDHOdniX2kO0k/ZsBLDcLFmOmK1fORwesv
         Ptgosyyjhg19gl4KCABGKeIPTqd69Rkt5OBv/SCFEEAm8sgo4yboPf02dAfyrte6Rm0E
         x78CBPiV70ZUEzNxShG9kFikpyP5YfQlGWyHQekKsfZfxKuAs1qlnPQZYklZSb0e4ctK
         O9Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWVbtXxbSOyworZdiazCVOKNuXyervHCWjjKtEa61MADasm/YjhtQv9FJS7GVrjWJp2lsjgx1M0//jIylTFbuKX+vF1DNr86tgPmUc=
X-Gm-Message-State: AOJu0YyMV61RMBoGv+ypa+YkhoLohVMLhpIJ8khUZufdHju3v8BY6hQo
	MdgCA6JLZg02Hu+NMmecjFVDXf0rX9VlvBYekWaM1BqMcm+xWjhasgZ7cIzC4jbqVMGoAVWDK7M
	=
X-Google-Smtp-Source: AGHT+IHKKqnL3U4K71hLrs2mUP7g9TMCITdHz9CzBkr4YA8T0fm3oAZPwvplNN097FJEGyMYNzbtLA==
X-Received: by 2002:a05:6a00:17a7:b0:6f6:7c56:e989 with SMTP id d2e1a72fcca58-6f69fb7d5d7mr3783518b3a.2.1716055588805;
        Sat, 18 May 2024 11:06:28 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f67a5ffc54sm5978034b3a.34.2024.05.18.11.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 11:06:28 -0700 (PDT)
Date: Sat, 18 May 2024 11:06:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] dma-buf/fence-array: Add flex array to struct
 dma_fence_array
Message-ID: <202405181106.99C0C03BB@keescook>
References: <d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr>

On Sat, May 18, 2024 at 07:47:02PM +0200, Christophe JAILLET wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1][2].
> 
> The "struct dma_fence_array" can be refactored to add a flex array in order
> to have the "callback structures allocated behind the array" be more
> explicit.
> 
> Do so:
>    - makes the code more readable and safer.
>    - allows using __counted_by() for additional checks
>    - avoids some pointer arithmetic in dma_fence_array_enable_signaling()
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Yes please! :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

