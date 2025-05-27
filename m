Return-Path: <linux-media+bounces-33433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48BAC4832
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 08:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD351897F6A
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 06:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F290193402;
	Tue, 27 May 2025 06:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrB0SoUz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADD23FC7;
	Tue, 27 May 2025 06:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748326497; cv=none; b=aMy9kx+3nOOuLxiRnpWarABq703A6J6enPbAEYWHrZmwdMRyhKIS4v7+YvhdJxuTFUmR9aMXCUtA5X+ssjX0iIaND3h4WhK1uiY+KfdQ2WPHNeiZb69+EEynkYH+pw6EHF4ZQy4Z4UAH3+AX1DEBIlnQV8fF/L+TrkW7EsnpdEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748326497; c=relaxed/simple;
	bh=bPZlBi/TrOB7P9Rl1Y3T5ifdw7rwhtu0psVkBPl9Cy0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=Guazwvbn0wNhmEFnYrs37zonJowb2b56IcjgfEsSgoFlIc4q5W3NXizE+tIDRpFitGY2Gj0tsOFCT7o9vwwPoZT3VvmPBX1H46nNrjHP4upkjwt2wexV5IGTw7BBOp6GjW5HV7MzeXyWqjoccpptvFF+e2eFuaxBZ9YMwR8XSV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrB0SoUz; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so1601836a12.2;
        Mon, 26 May 2025 23:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748326495; x=1748931295; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBBkE8s/YVneLq+9AwE4ItbtcJd3DVQnda+tTZ0Bolk=;
        b=WrB0SoUzCwPKtDZE74SKv+fw7OEisPVYv6y8qDTv8CiBvf6zvQPPxknDnN9CM0pkju
         j4LH/lC/xCu2jYFBigp7DKD4iq27ztNEVVvJK5H5Mv7TE9p38mwxd2n7izHQ5r1O3bUM
         0GAF74wIDybJ1qdKJZAJfD7AomRM64u4dUYM49V86WuOQh3hgk9yEW8lgWfFVnWdcmka
         9UJ4U42HDWmKkxLt9D9AtwJ2tPgDqFREzhIr8hlVQLjPxyQhCPabP63KiFMaLoFJur7H
         /pbS56tYrnfGsFVUpAZAVjRFg30RdAH21DMMHsxK5KvJuncHmtLpEjyBVNcHRCuqioEg
         +Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748326495; x=1748931295;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBBkE8s/YVneLq+9AwE4ItbtcJd3DVQnda+tTZ0Bolk=;
        b=YDz7Up50ffIlOYg+LGs2JkBuzB1Ug7uePXxBw4spbThV4Gkj8Daa/5Yg4HR/kqBtpX
         p5358CgNMu/LY8oChAv3udxn+YxlS0lZ7BrQJa53gmHm1J7tSkN3tJ5kokLu3SIuE1UA
         w+Fygs7QMd+MoS+S4RzhBCO5VJbEv7p+e+v36imgvH80mwSmsEBTxRgRa13JTH/BbT1U
         59BDtujr5MnC5LIuchjpohXNEtYifnQ5C7AZS0ck5PmqUOSzjFh3BaWVEabO1ncwIph9
         vHGVBhErk0J5/UB0FJIo454Zo1UvmkZ0qdB7fZoJxJaXcWmKN3+9V97Mbs9lElXEhPdW
         RTzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeucTpthVNM2NP2Oz2b5hCeXp2H8OpR8hFbFCdqsQNqxuhK1Rau2Jmz1ihpKcBl7nw5zOhLexMr6ATJFc=@vger.kernel.org, AJvYcCWMbPhXHTaBuzNOzcpWP4zvI0sdSWgcef0ls6WzaCmkuuCxcHuCcgpWQVe9fQo8KvyNaTHINbeS2ifPVZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRSOh9E3oqVPHXIOxSLFAQZRDdrSFLhczPAVdLOYbXIJejMUl
	3AiZQxY8btTraTzuyVqmv+5M7J39Nkov4+UEkLeS6wYt9O74FCSGt+Vr
X-Gm-Gg: ASbGncukGsW5765eQNSVKv+JPQ6Id++baZtOz8vOX6x0b+RhhM70e4uouMZlLMzsT9B
	CJ1qSbvFYbgmsN1W1cPPWZkaVxSkLUxNHfb/JWgRL2JrQ+Q/ncq9A3RIwXHEuakdLh+PFNTQT1w
	D8VBQ/TpSD5m2pleQJd6GLvgz7cSvwCzBOJ142rxDx/iX0eXEuJGMJGyr3NBYS+xWmjD+G2v1jT
	ldySYpAJWR6Awl9NzKK+WPJqwhlw7/cgXwHySR2n/ufPesTqIxnNgn83/VBRXjbQORecZUgEdrD
	gvTi4yJ/nXhs6heLkqM0dOK70wV4r75JuDTu/0J0644=
X-Google-Smtp-Source: AGHT+IH4ynIKhX0Q/W63W+KiOzYy2HiXf351MI+w2/z045fkfOry3JXmUePfhPVwSC7VlMVwFg7M1A==
X-Received: by 2002:a17:90a:c2c3:b0:30e:8f60:b4c with SMTP id 98e67ed59e1d1-3110f30d933mr19804287a91.16.1748326494695;
        Mon, 26 May 2025 23:14:54 -0700 (PDT)
Received: from localhost ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e5bd3sm13413809a91.37.2025.05.26.23.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 23:14:53 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 15:14:50 +0900
Message-Id: <DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil"
 <hverkuil@xs4all.nl>, "Albert Esteve" <aesteve@redhat.com>, "Jason Wang"
 <jasowang@redhat.com>, "Xuan Zhuo" <xuanzhuo@linux.alibaba.com>,
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 <gurchetansingh@google.com>, <daniel.almeida@collabora.com>,
 <adelva@google.com>, <changyeon@google.com>,
 <nicolas.dufresne@collabora.com>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <virtualization@lists.linux.dev>, "Alexandre
 Courbot" <acourbot@google.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
From: "Alexandre Courbot" <gnurou@gmail.com>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, "Michael S.
 Tsirkin" <mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
 <20250526141316.7e907032@foz.lan>
In-Reply-To: <20250526141316.7e907032@foz.lan>

Hi Mauro,

On Mon May 26, 2025 at 9:13 PM JST, Mauro Carvalho Chehab wrote:
> Hi Michael,
>
> Em Sat, 12 Apr 2025 13:08:01 +0900
> Alexandre Courbot <gnurou@gmail.com> escreveu:
>
>> Add the first version of the virtio-media driver.
>>
>> This driver acts roughly as a V4L2 relay between user-space and the
>> virtio virtual device on the host, so it is relatively simple, yet
>> unconventional. It doesn't use VB2 or other frameworks typically used in
>> a V4L2 driver, and most of its complexity resides in correctly and
>> efficiently building the virtio descriptor chain to pass to the host,
>> avoiding copies whenever possible. This is done by
>> scatterlist_builder.[ch].
>>
>> virtio_media_ioctls.c proxies each supported ioctl to the host, using
>> code generated through macros for ioctls that can be forwarded directly,
>> which is most of them.
>>
>> virtio_media_driver.c provides the expected driver hooks, and support
>> for mmapping and polling.
>>
>>  This version supports MMAP buffers, while USERPTR buffers can also be
>>  enabled through a driver option. DMABUF support is still pending.
>
> It sounds that you applied this one at the virtio tree, but it hasn't
> being reviewed or acked by media maintainers.
>
> Please drop it.
>
> Alexandre,
>
> Please send media patches to media maintainers, c/c other subsystem
> maintainers, as otherwise they might end being merged without a
> proper review.

Sorry about that, I put everyone in "To:" without giving it a second
thought.

>
> In this particular case, we need to double-check if this won't cause
> any issues, in special with regards to media locks and mutexes.

Agreed, I am not 100% confident about that part myself.

>
> I'll try to look on it after this merge window, as it is too late
> for it to be applied during this one.

Appreciate that - given the high traffic on the list I was worried that
this patch would eventually be overlooked. Not making it for this merge
window should not be a problem, so please take the time you need.

Cheers,
Alex.

