Return-Path: <linux-media+bounces-53414-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLr8AQNTn2mraAQAu9opvQ
	(envelope-from <linux-media+bounces-53414-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:52:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1746519CF22
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5EC663012828
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 19:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100443DA7C7;
	Wed, 25 Feb 2026 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nxSBaU9w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E692C15BE
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772049149; cv=pass; b=CygXAlQJUnk42NeKw5BOl+OtTkqbPKURMBt8Na7YVfQA2F/GaV4h+4J+dGF2Ryl7CyTcYL4ucrpg9S8C7us+C2PTbJcg5JJlZNCKzZ3l70Cb2WoVtprctITBJ+LcZSLvmI7YWr4xcdBiL82tNaKMkq5gqFDSirvveUhWflNe4Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772049149; c=relaxed/simple;
	bh=GOCqpqP4xulPNkLV+0mavDjGZp2jPKuE2l1wLsJLWlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkCZ2h83xO81uhFyDCQ+LPd6Ayblu3h5yeh+Pv56is7HA+y+roxYBkcjQE8FmCSln/8arJaY0Z+u/fOAF3T71SE/7kpIWiTVJcRhC2iZWza7hvJPn0HsZlU/hLOKdzt1xUmBcItTvJ3oZgQtaCdnjoVoKTbQ9kvFjkGI7iammYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nxSBaU9w; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48318d08ec2so11075e9.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 11:52:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772049147; cv=none;
        d=google.com; s=arc-20240605;
        b=TtKCgoqu9zUeiIQYEQK9Mdh0taMJAFHcZq0KjHffexdOKdPhesALSxryf1MAxvmPQd
         0wOvfoKUD8xNTNj+CHAxCPRBoFTGTQ0aY8GcJZqOgD2YOWcddSMqmV82W59NbHogqDW9
         jsQ5nY0Csc8vIB3+Oz1XWJ0Ti88vV8u18rld3j+ITII1QUOggnLOCXmZ/QsCZwi5ZIP8
         DDftN6Ylnnsu2U3mluhIC6mZwOxBJMKcx/CLOu08oZ2aLb2gxXgsausLA8CgXa+WVmE2
         nFmHYA9g47I+z+KIvXEqi4H9eOYwRnHXVVi1gfQrcES/PV3rcGqqsBRl8fgb0+Uoy/tS
         KiJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOCqpqP4xulPNkLV+0mavDjGZp2jPKuE2l1wLsJLWlw=;
        fh=AJTwf+h0xRoW/CIE+JE0ixW5dIMY7PtA/Ul9RWwIDqA=;
        b=FUXzsu2cNt9BVuUwvwgGHf0D/00sK4wVQrAMdYAaFe5T9qFmTiG3GENkOwA1KqvkWN
         oqYBycj1iv+aFQsOoO//JH69a2q2kTW9FRSh1TK2UVSwMHIIrVdotVuSM+rdScS2l+00
         TFyw2VvsTlaZ6S9+l0DFid8higtMDZa9Ph4uwuP7KGgoW9mpxjHPWe4eKROgB6apgQ0N
         UzsGHd3q0y8sCqbVhxBA8xgVrbxezRiAY+KyAXZJr7XLsKigcOEv18L8wBBxKBUjEX4M
         saj4/w74Q2B0szrAbK6wmsFcwAg49NLZf2ieODLqU+UKfUa1HZzYDFYyK4X+yvUxnOtN
         b1vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772049147; x=1772653947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOCqpqP4xulPNkLV+0mavDjGZp2jPKuE2l1wLsJLWlw=;
        b=nxSBaU9w72Aubwcg9TF356Tn9NiTSdgaJXQraTbivpEueCGFAlh1IhYcEarDPbNb4f
         Yhgp97colxb2IORI8YYoBc8VYK8SEkwe548trQZpDC/Qja75gI+V6U4zYcfXLFlvQNls
         QUsJaSbHtl56Be3VqBkJ4EWM6NjpvP08TQrtMfQI28N4apRIk6FDMuX8zkFhRGAilcu2
         na1dLMCQHZL+tf2z20De6WjUA+STQdXWNzcKxVQ7peeAWbBmjWNvBMZFCARzq+P1OeZn
         P3pCgsnY36AfTscpvNvjKop925jMTwesUT4Wfvn0f4A23WPaoiR8xNzYVTDOJ3siDv8w
         U65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772049147; x=1772653947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOCqpqP4xulPNkLV+0mavDjGZp2jPKuE2l1wLsJLWlw=;
        b=NTw0s2h9pJf//RTNxQwh/VN954hFf8cf0G0Hrmyx00hL6iaBvyT0mGcTPr025jNko6
         JX2nTLoDgzADliiyNt1W8ejeqmuXdPIrxnwpQR01lO7YGLYw5f4Ta81wWMrsovxa+tOL
         ChqiskQ6KfCXjnlmZ/Ftcq3SSCosAxp1aPLuwzgRqg2slsAljlWY8nBA9/uFLtdLXm1Z
         qwrwGvVlWTXkQDyNQ1csv0x0PjWRecq2U4Q4AlYfL4GyfCZ7J93fd00qiSToDSvwvlCm
         3XBpg/aUVFl2v6a4FXblwBJoszOIS9KE4tfPcVtSsRXiSQhMXCbMOokyRjmrz2ku90w2
         pdKw==
X-Forwarded-Encrypted: i=1; AJvYcCX2K6Y5iIH5XPWzLj2CUZihh5+OL5ebYzz8ww08Q94bIMZqKqCSJ5kSND24+KodyhxIU9YcziDOx9bcsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxysnEM17/c1o9X1CQKZB9fJs00hMEJd0ZK8ZsY3nm+epNI1q9r
	1GaDIyw7K5CoTHRXwpVfWjodUSiE0HDm3q82WXBHI2JeXdnUJLivVtOSY2jPHbmk1DE/K2jlTa1
	WMlbh4tvt5Bf2WtguqaVAN96Z5zASMwhRfWssWO7J/xaHkKhry+1nbEodv/k=
X-Gm-Gg: ATEYQzwSnsxTEHeUAV8+sqv0d4PpzUy4vp7VQ0C4vmq2U1KgUikKBkcfL0XdV/6/ksc
	T8gGNmF7J1SS3nOYTfrspubj2H2U0GWDQ9V9nlBCYh+uT+rX8vkIMjoAjSGa4qOyOx3B7LjoKhc
	huGwMkDpTILsBPjAbSIle6nRh2wfYODcUl76abUY09iJ02Nc/plY7nEVskXmvISt+MsZJD0rP32
	+NYdeNxTlRyy2patALEpoXtHH05obVWxIArbV/K7YbFKlx3qFokM5ApjIV6em0CFIAHvpm7tSD4
	LgMmM9XYjge4wOdPRScMpwLVDri9x/MZkAgdieSmbmyXGnIKPNuVQl6HYAx5GzPvLCjUZQ==
X-Received: by 2002:a05:600c:5702:b0:477:95a8:3805 with SMTP id
 5b1f17b1804b1-483c31cfb56mr70235e9.15.1772049146264; Wed, 25 Feb 2026
 11:52:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org> <20260225-dma-buf-heaps-as-modules-v1-4-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-4-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:52:13 -0800
X-Gm-Features: AaiRm517LrodfDPDmk8aF233zMemSo71i-_zn9eOj5ImN-lsr29tVaebY-ntsoQ
Message-ID: <CABdmKX1piZByQvx0sYbO4R=f1rdZKmYS5R0EcChBv22cAUvCUQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] mm: cma: Export dma_contiguous_default_area
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53414-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1746519CF22
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The CMA dma-buf heap uses the dev_get_cma_area() inline function that
> would either return the content of device.cma_area or the content of
> dma_contiguous_default_area.
>
> The latter holds a pointer to the default CMA region, and is stored in a
> public variable. However, that variable isn't exported which prevents to
> use dev_get_cma_area() in modules.
>
> Since we want to turn the CMA heap into a module, let's export
> dma_contiguous_default_area to allow modules to use dev_get_cma_area().
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

