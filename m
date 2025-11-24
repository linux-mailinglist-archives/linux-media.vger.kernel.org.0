Return-Path: <linux-media+bounces-47659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C764FC80CC3
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 14:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7ACF3A9648
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 13:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15EA307494;
	Mon, 24 Nov 2025 13:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvtjFiB9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C8306B05
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991396; cv=none; b=PsctKl0NepXsoawAjEuo+4PZBZaxaIsAvPA3MrM28RroilND1e3Q0LM/2qlnubFIiYrC3uFp+TzE33MqxtHBRyYTMONLMetE4YKsILXV8BYFPSu+Jnqc+0pcsRE0fTp0fzsd5CnuIhtGNn5cY3v19TxetkPmu7+6PhqRXMHyQ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991396; c=relaxed/simple;
	bh=E4Kvahk4sfkEzDMtaEQ+7t96X+5OMROz94rsckBU8Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ns1Igl5ghSCYhKJtDbXCHX5xX44uLP88h/PlF2+pV4kBfMvwCfJjJMLBrNwdxz1FPqyRvfpqLvdu6eeo+HvLTEXRstYXuXnQJN5xIeMJEWzXxphvxacAZJyTjcqN2Qjcf8Kw+HPT8D2iC5cWGoB40BGYcc3OpWxkbC+ySSy6So4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvtjFiB9; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so7517235a12.1
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 05:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763991393; x=1764596193; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E4Kvahk4sfkEzDMtaEQ+7t96X+5OMROz94rsckBU8Tk=;
        b=lvtjFiB9vOuY0MFV4pLK/ixeb6Z4c9ZY7gn2qKUx9+1RexOHaSUyWSglRZJuCzAmyI
         aMdNdO1fccxwExP+LF55qGmEKNwwDn81g/3It6mABrgmGHndD7WIU8fjonneji8kccIf
         uEqyxX0yxqoaaqlnAL07pAgW/Dcwszy2JZ1BRXNyv5ln/u310UTLKYrrXHgJT6CS1wCw
         kyv9p5ICGJGZdg0od7BLrm7dquR+75qR5oqBYnKahhpHnq9hXwy66tbakh2V8TP4eYPN
         9NiIYkr/pyBp/VGoeHeh8t06oxlVB1mQ8Y0u0DkAepnKgvxiKd+z8pmTh+kfjWKR/fvg
         YY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763991393; x=1764596193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4Kvahk4sfkEzDMtaEQ+7t96X+5OMROz94rsckBU8Tk=;
        b=VH/Re4ECwws1ZmseFvsDZYSZfSgjNVBZpFcbKLceHiLKAXEsHovnBgP/7jWxKTIsE1
         DBywMAG2QcaSGPANTpJnptb5fywR2NTc/tLBWchJ0mjmTY0VqTvCX56/oBU63SnZA8V+
         za+A9vXawyHoXJqDj31axVU1vOjFyPW/k/r7WzR5Ke8oTJHmyozAbP7c4xqCGYFGmKGr
         Sict0ci7vuqWaBp+8kSeaxlpGs5mRsuGMSMUCspMlsyvwTB49k+pgW5wBLaj2ojM2jLh
         rikyF93KEQt46mv4HH1Xy2yJH+BAvSwKycOjLnxw3L3XOOLnHmEwLE+M2S3df0mTK7kt
         OlUg==
X-Forwarded-Encrypted: i=1; AJvYcCXfYAGxNtYJLHkdRTv0tZe5Npc0qZJ+zwVNmm2j0cdAnWRDwhXkfTl/2Cpwas7pKQ2J5hqudwsqkS3GsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJncwdXCWqeTo+LXAT4PCky8GVb9KYoXzAQQODmk9diavKRFuh
	Bcc1KBiOCovnNlL7/eiXDMMuxzxV895XsrYEf64lLD5jR1n3B8EHw0y0woWXsEQf3oT5qzqNiJd
	LvKAGjxU8SEsA8IhXi2REd1cK9lFGuQ==
X-Gm-Gg: ASbGncsErUYBj6/qK1b3TnKHfUbD6oio/nHokcaA6+QW4nkTcunz0tz3uLe1797Ohdr
	RLX11fUTqDBiRxBWa/tbo0+gn/MMUu/klS+1n2ut/ue5zKarCSlDLGh/9W8HYlWh7TFo6bnoJqj
	oV4tZK82QdFR8ctyim7wc814m+JkYtdIAgWOv+Bx8smcTwJRyvxyVQAdgNp0Cuo+rKtmxD7aEsY
	l2xZh430WTXvLhYGJiuGNvvaFMyhxRS75uDXdWf0O26dYlaYspwZ2wQ63YbkaswpMpljD6VYxxJ
	XgPTiZ0ABZiH4OvYOU07wxNNjhh/R7rc/QAxo7tOPc4wQmiB75IVPdub+SFSLA/JGI8=
X-Google-Smtp-Source: AGHT+IEnG4Z6JyAnZPsc9zRPIurpTL3mzwNg7U8txyPxgdZYEAlachoenhHzENGex2kidp1+A4wUbZCJxBRlVZeptSQ=
X-Received: by 2002:a05:6402:34c7:b0:640:edb3:90b5 with SMTP id
 4fb4d7f45d1cf-645543493b7mr10042269a12.7.1763991392543; Mon, 24 Nov 2025
 05:36:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763725387.git.asml.silence@gmail.com>
In-Reply-To: <cover.1763725387.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Mon, 24 Nov 2025 19:05:54 +0530
X-Gm-Features: AWmQ_bkynwx2lMdwns4GsIfVtYmI6CqY40r8-Afst6-_o29b3r6t6sfqC-dnOGU
Message-ID: <CACzX3Au7PW2zFFLmtNgW10wq+Kp-bp66GXUVCUCfS4VvK3tDYw@mail.gmail.com>
Subject: Re: [RFC v2 00/11] Add dmabuf read/write via io_uring
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
	Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

This series significantly reduces the IOMMU/DMA overhead for I/O,
particularly when the IOMMU is configured in STRICT or LAZY mode. I
modified t/io_uring in fio to exercise this path and tested with an
Intel Optane device. On my setup, I see the following improvement:

- STRICT: before = 570 KIOPS, after = 5.01 MIOPS
- LAZY: before = 1.93 MIOPS, after = 5.01 MIOPS
- PASSTHROUGH: before = 5.01 MIOPS, after = 5.01 MIOPS

The STRICT/LAZY numbers clearly show the benefit of avoiding per-I/O
dma_map/dma_unmap and reusing the pre-mapped DMA addresses.
--
Anuj Gupta

