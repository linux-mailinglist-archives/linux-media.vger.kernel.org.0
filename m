Return-Path: <linux-media+bounces-47662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB5C80D2F
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 14:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CCE72345866
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 13:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55F6307AC6;
	Mon, 24 Nov 2025 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G84ohSJ9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D4A306D58
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991699; cv=none; b=Y4NRayJ1lJ+M750cImdOjvHp0eIXzI0GQ5qHS4U6g0i7MZK9JACnJBVvm7khJzynsSa/zBPtTZnco3viORt+fQOe8GFPqwAfoHdeyetrmYVxUERauhZzFvGhP5xTTPI0tQjiHQB+o3oIEI55IitBh5HDe0LEmnx2JF+8MfgKvEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991699; c=relaxed/simple;
	bh=9WiU+fUOoaOr/u86tVujVIv6iGVYl9gAhlsoumb2r9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6yjtvnuu6I6i/5esuMT5nugNoVZ6iNaObEhmIHCCML6l5d6jaZZ8tpcZtL5ZgOEZKaRRHKq069BX4atu/VlLbhFqW1F2wnCgD1qAJxmeMyS/PQmmQF27JITJZJvw8ng6nAnkiKf5lCqWv88Z3lzK5gCpva6nSI82/wica7qErI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G84ohSJ9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso203506a12.0
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 05:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763991696; x=1764596496; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9WiU+fUOoaOr/u86tVujVIv6iGVYl9gAhlsoumb2r9I=;
        b=G84ohSJ9uqlCBpS7MBbqr/YL36fjhY1ZyjWDCD6dh2h/UEv0o/yfBYjoNDx+C2uxqy
         +bzkC6NOiQ7LVTn91GiNSTWjt9yYvDOEvYYXjVHaznESOx+LkzPN/VToc4QRGBUfgHVL
         +pnwJCxSU4MctdYhAKY+yQM/VHx80d/6JXFZKOs5clJTjBZPrF7fUzpyY6wvImtb8T4n
         BhLPHeAV9DVmzZn8KswxgJFLOu706/wJ8Qb1sKx6QV9WXlMt7Nd/JErThmj+/c1KNzYx
         bsr8IvFJ9pon9vZh+NJuiyCulL3XXQ9TbPR46uzATV/yUDCrQPnXqr+amjvOjU5UFw1g
         tqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763991696; x=1764596496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WiU+fUOoaOr/u86tVujVIv6iGVYl9gAhlsoumb2r9I=;
        b=hrJ9KlqcULa5xw8GfB4CeCimAsL05CYSTa9q/2P+EUkY0skdbjMaY52ekmgo7hWcy4
         iL5eZgzZQT3B2qauvPO/ozWfTr03w+4qFyW97/EsPnYcFIk+N7AlKdtet4LhzxwRMoiY
         W5NM7lk3VJ4VZxR1JKC6G6oB0d4Vnx43KMMQEET3YRefcMKniDq4tXjVRLMvH6S8RU6z
         gq6sqDJGu5GcEusOcW1gLyuNPLoa6Q8m1aSqLetNuGr+OstA6UmKocGucVotH95V0Sxh
         68D5K58D0i6WeTIQQD86KO077Sn/miIef3496Zt1IuD3kfHFBGQLMAC/OyZSiwDWlJvv
         3XRg==
X-Forwarded-Encrypted: i=1; AJvYcCUzWU5dWsv+91vnC4ufKdkAM9cDwvC7G7WfohOgUQT6YqsZTLWl4BD3B0oCmGEy7FEdfmMR82uz+hmwOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMfq9RaT2WTPheFMcBBX4uHUlLdexf1DpJ2QSwQRC+UF+D5X4D
	/fBIhNSp2hBPxYOOKE2gLy28tufXX/dZXahQvoQiGmSEWqOoZvOxrHkz2AShWzO5t/2ckS9nuq2
	8/D9O7yw2v1kCz9N0wel65dQNk/tdaQ==
X-Gm-Gg: ASbGncuMBCR/wQe5XJGaHesNpym+LdCnCaMeEfSgiCKM1EZfsCPw94N3hy6wLXYUwyQ
	ZNYKbwCe8s3Veu7JUX/0RI8M3brgIm2d86hujGyyE2ig9gouAqxAi63VrbtdSgEwvJn/9aumVn7
	CJY4UAxbJdpHmrF1sdayRcGI6x4f5jJ1w+z97mzJsfjrH3EYX42Wq/aw1lIwxQ8pMl2UBUYWzSk
	ZMaSKDOJe8jEGBhoTDSIyJzYTXV9O4vi6B+DAl+is2GtY9S0kJyQIoJlNuxWrWRhrZm02Bagm+s
	TXekgjrJ1NS7IZQqYtmdCe3beNodrLKHzsvpy4DBE6pYDmTki+WXyTkN
X-Google-Smtp-Source: AGHT+IGfVsoGjX5Sxy1dySCnIJESUxRCyabV8O63iUc1Le7y4o1Ai34RI3broPwT+Hj5nWquSwgUdOuJhlEdpZCZaGc=
X-Received: by 2002:a05:6402:40c1:b0:640:ef03:82de with SMTP id
 4fb4d7f45d1cf-645550809a7mr11399195a12.4.1763991695708; Mon, 24 Nov 2025
 05:41:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763725387.git.asml.silence@gmail.com> <9bc25f46d2116436d73140cd8e8554576de2caca.1763725388.git.asml.silence@gmail.com>
In-Reply-To: <9bc25f46d2116436d73140cd8e8554576de2caca.1763725388.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Mon, 24 Nov 2025 19:10:59 +0530
X-Gm-Features: AWmQ_blM0KWu7aUv8ArY5r4a9fsKMGwJG-SFJqiYxWiv8fYwoMfNFeWPT1HOzl8
Message-ID: <CACzX3AsXD_C50CY0KYNjt5yMY4hm-ZDLQU5dQSJAmP3Duerauw@mail.gmail.com>
Subject: Re: [RFC v2 06/11] nvme-pci: add support for dmabuf reggistration
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

nit:
s/reggistration/registration/ in subject

Also a MODULE_IMPORT_NS("DMA_BUF") needs to be added, since it now uses
symbols from the DMA_BUF namespace, otherwise we got a build error

