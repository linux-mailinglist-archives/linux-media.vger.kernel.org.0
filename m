Return-Path: <linux-media+bounces-30965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A96CEA9BBA0
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 02:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11C309A0048
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 00:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1910F5227;
	Fri, 25 Apr 2025 00:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XgFoyDs+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AAC29A5
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 00:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540043; cv=none; b=j/8nSdlJA0qJBuoSqpeHCOleD1y8Zhq9kc2PNDQgxOTGnjQuhV9Jqc3N6PBE1YGKxMtI+nubznYVMNefXcmxXkZ6fn6HnMMWHXHjSZTgZmMFeRQl4mmzOY9kgonOJhH3p860CDKh38nrzNztBbyCpq8nBOxX0WzY7V5RCPfFqMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540043; c=relaxed/simple;
	bh=xrVUCjHF2GDru78rE0oor9FuAl7jfx+3P3yczM92YEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDrN677L2zjju73XH1cNTBGG4xBv4FfEooF8F+za5B44FPYhhayv8APhiNC393FkS7jC64fWHjcr57LgCa8XIFvDIrFerz6+72kCyxJ+beg9JG/NEIIGI/pZOlKptsmdc//ivvTt0dVSgiyjzBGtgXwAzpC3bG1nCBXReNIRsT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XgFoyDs+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549b116321aso1983519e87.3
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 17:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745540040; x=1746144840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weepQ3o3E6eVKCjaxY3CTZ3gGB6j9iWw3wdfeMK8HxI=;
        b=XgFoyDs+8KxX8ZClimhGGs6GrlgX6SkMv/innosc12qO+spCWfODN2e/bC2EqnyvfR
         oxnTmBB0NPzVEWxZe9lM7SwekXrg3f/JCcIGxZW72QlJyvKHn4MJTjP45w5RfZvIsTu1
         +I7LKBFNayY9zp5BwAEMWfhjgV2V60U8fMZnJO+ac8kXZVptli4MdQPajCiGCGyO1q97
         XSLfjDHhElWo/0wDt3EMnpqcbwlzUZ5sh8qkoeNb7qDv+3yBEQ3b58Fl5vy7OYo9XHHn
         Oyd7jtH4LoioQMJXu+kkMqSWp9kVRf2Z0BY+k7vSB98xTd5N6vw0Vl1k6DjBnsedWKXa
         eZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745540040; x=1746144840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weepQ3o3E6eVKCjaxY3CTZ3gGB6j9iWw3wdfeMK8HxI=;
        b=iKPGDReHFprOUa2ckLTEJfYzLq2NhSyG3g7J1D9Lcy9no5G0WKHpnX89ImGeXX9R45
         twv0dgJjSUziOdaoeW8h8icoLDrgEs6kTJDAtJFHhBfXmK03LaOEKWO6jUGpVHhnnqb0
         xHtCcaGcQPjlRT2mh3bHOBf0XhnUSJ0a9kPSCTW/UWlpi3sf9zJaoH35Z9sLINBe6m2p
         dts96nkimC1ANv0AB+1XJHWZF5HrWojconnEPBNXh1Jp3+missvSOwHdXnRMULy+w8+J
         wpuWbHQQ5TXdB1+SDBvCpZRwF2ZVvuj0wueDTYBVVyHtjenYuV/VnDsIXkaW5iRCqQvb
         OY/A==
X-Forwarded-Encrypted: i=1; AJvYcCU+gS/klWwBGyt64R5XprL76hONY+dudp59c9sefWyQUUil8BFiotqgJ/+4pmwL0QaT7Dse74v53aIucg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHk0kbQNGmzdlqw//5WLNBaEfYrHgr0eYwvh5nLXKdnryuYRjm
	vQeXjR16BodmwhbqPMJSusWnTaAcI2hNeV+O4Ykj3xqr4g51e2bKE6jOuA5XKftnFkFD4AqYLF9
	IdTSKDVctWXAG4a6GULbg3fwbJjvJBMlPcbM=
X-Gm-Gg: ASbGnctlMP4ihkGRiG/434OW/+xaxvatZi9n2+tXa09/ip18hmYfuM23XeYb6fNX+QD
	H8/2LPgZMdBUXBIM1P7axHwOQTo58M1G5ytun27gbUJt+pIEy+eIrXW4zbBovB1mHdEp5NhCqNt
	KJQTqAC97K1XRX5rQd/j/HWpRZfDEcdSWu9+BEt2Y8hZZ4DoU50IXalqkKGDhu2Eg=
X-Google-Smtp-Source: AGHT+IFupDhtk787UYFC+m51vWARrrW+g3qeY1nzKmRJUOvJStBMU1HIyqroJk5ca7MURfz+ouovj/qgbuHigNDZtwA=
X-Received: by 2002:a05:6512:ac5:b0:545:2871:7cd5 with SMTP id
 2adb3069b0e04-54e8cbce2bamr107809e87.15.1745540039297; Thu, 24 Apr 2025
 17:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com> <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat>
In-Reply-To: <20250424-sassy-cunning-pillbug-ffde51@houat>
From: John Stultz <jstultz@google.com>
Date: Thu, 24 Apr 2025 17:13:47 -0700
X-Gm-Features: ATxdqUEd-WZkBCWlXClEEov2Vu7arSm9wmBJpDM85wdm6VobmqGM8s292rnkW9E
Message-ID: <CANDhNCqfsUbN3aavAH5hi4wdcKuUkjLX4jqhKzy-q+jCEqpoow@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
To: Maxime Ripard <mripard@kernel.org>
Cc: Jared Kangas <jkangas@redhat.com>, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 1:34=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Tue, Apr 22, 2025 at 12:19:39PM -0700, Jared Kangas wrote:
> > @@ -22,6 +22,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> >
> > +#define DEFAULT_CMA_NAME "default_cma"
>
> I appreciate this is kind of bikeshed-color territory, but I think "cma"
> would be a better option here. There's nothing "default" about it.

I disagree.  It very much is "default" as it's returning the
dma_contiguous_default_area.

There can be multiple CMA areas, and out of tree, vendors do reserve
separate areas for specific purposes, exposing multiple CMA dmabuf
heaps.
There have been patches to expose multiple CMA heaps, but with no
upstream drivers using those purpose specific regions, we haven't
taken them yet.
I do hope as the drivers that utilize these purpose focused heaps go
upstream, we can add that logic, so I think being specific that this
is default CMA is a good idea.

thanks
-john

