Return-Path: <linux-media+bounces-47533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0521BC76DCF
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 02:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 0269729E84
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 01:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41F72741C6;
	Fri, 21 Nov 2025 01:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIuTgtEd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10011A23A4
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 01:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763688272; cv=none; b=oJcgIsmqYHYbQtqq8SD01VtbJcnXyuZ3dpB4vPo4W0dHP5sU711Ma007dquwCoM6UatlG3UV9fG1PMOKIxBBf0GuJGZb046fnLK/anahICNl/Gvt6GI/icyNzfjWSi/9re0OXwjJxXcB3HP2E/iSzM9N4YohEiag4TrI/kIUkkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763688272; c=relaxed/simple;
	bh=S501oRNPXFaui6LNQdJlEz7mEWZdKyDXXyx7cM9Nvjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+49cgDOHAYDZsj/2lGlgYZlYwpJiBf+VS+ldTyZj25hl+/xvp7S3w1kVxab/LfM+vy9jfFh88OvIpvbgQdFzv6MMgwzjkfta3/h+TVloxMy2/efV87fu7z9nH3552y/RoLd39K1GM/CrkrUmfDOcwIkczSS5IDIIQDVHuwtZjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIuTgtEd; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2dec4d115so143518685a.0
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 17:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763688270; x=1764293070; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S501oRNPXFaui6LNQdJlEz7mEWZdKyDXXyx7cM9Nvjo=;
        b=VIuTgtEdKDeJcVa8EQmWyGhMuxc/0TrK9qSsx5++H2fpgxy/I8Qpc1LX8UQttX2xt3
         knvLh80qmMMXtoZ813VJFvtD/pENBIOAtKO973QEMGS/JeY1AXXfbMDZ1OVTt6+kuAEJ
         +jMXnL2ABqTZT/nY6MuxIicP/nyBX1AGNWl5RRTL5rgZQTyu3Ntve/7QyIsmA0JSgYBa
         +KiT5rIuFJICwV6qMUbsEYM+MyIS0YTa3eKa4cPvlpIOnsg+dw/YbX1qJnCtwtzh29wX
         dfCDqOx0YWdmB60LY4eXEoIdsnRvLt0fwJ8W+mbn+40ggyc2kEMJkxhcI+fwe6glJe0l
         WDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763688270; x=1764293070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S501oRNPXFaui6LNQdJlEz7mEWZdKyDXXyx7cM9Nvjo=;
        b=A14IRAmjA2sM7lRbgvGgULbTrU/hedfgTRUyL3qIv6uHSiiGlvBDApedjoSzBppyBF
         OATgtv/mabiulnaTLxOeGzLYYeC7ozAJK+bMQpJ9hIuhu31MZjBeRAM0CpyeJ6O7MJmC
         9mbr0COUQP6V5gkWJO9DDC92rKgowH5ILoOvOVj1gEUqIy0EIcLzSH0alUD+amGzfYD0
         cxeUiu2xaTqc03urfGvrByjhccoEmFl+Nk4CXGSjn9WBSbVUsSxzYtfvFa1k77iLzp9P
         nPlWZmvRQid+JUvJ1tpW3JV7xeUgbhk912JFM1/pTrIEJUF5bLvfjTXY86Hegxbhr9ls
         aeTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1z1W+VORjiOSlb2wQHewOp93tk9kDjLpCT5ejDw1/BxKSiywVWz6TQWZhmpLcbzp6s3EHXCSa2xBFag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6aJ4eqvc5mSWqKnVcNuWgBUIC9o2+uk7fElF8XSprpx+pTtnP
	LnPk6g+B5QhyxprG9DQ+8ucGwOjWRmsT2HTMrjsgeQUqQVM54xexXoHjMtK+PjwkxRN7qYSUcGy
	IxYcWLPNZwB5Mb7YhJpLlLnqr2rd1ITU=
X-Gm-Gg: ASbGncsK+2SQUfzjSefbIuP7rpa82b1HHkL0OyTHh4f/GPSF7HJfIjpZF6XEGvoipzv
	RJbpvQdxeRCTsPblLRHGuYWDluHJJi7yc+IY2r2IA3U5madiy4dqL6evbBZdc6nb10zT1w9Qrey
	n7c7G/ak3ZVR4fmXcqT4/Fv2hm6ozJ3Ph5jCz80pDg6QHRJsdk+eq6Ydukut5aCcH4fZ72Fy4AP
	khNR34iB5muY1aaz+bHwWS44YUJolTFSEMhh5c/XCnaEzoMuA2NQjiUcaSMJVrLYzZK/Q==
X-Google-Smtp-Source: AGHT+IELR0Y8MMC2IUY4VhJkvLWnV/PwywUiJ5X5L6wH3I6vLbKEaD3LENPCPlOKpe35gSnMK7AKTvy6xnB8ca8uJ8A=
X-Received: by 2002:a05:620a:28cc:b0:8b2:e924:4db7 with SMTP id
 af79cd13be357-8b33d468f92mr51138585a.40.1763688269620; Thu, 20 Nov 2025
 17:24:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021042022.47919-1-21cnbao@gmail.com>
In-Reply-To: <20251021042022.47919-1-21cnbao@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 21 Nov 2025 09:24:18 +0800
X-Gm-Features: AWmQ_bm-P1ruFcb-9PJ4wRhOHg5o1AnRHk24v2ra0lTOp-J1klyFcrWEtn5PclI
Message-ID: <CAGsJ_4zPrgkb37VCfY+C8Dn6dS4LmSMrHnfU7Oy4bR19yhxbAA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: system_heap: use larger contiguous mappings
 instead of per-page mmap
To: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org
Cc: Brian.Starkey@arm.com, benjamin.gaignard@collabora.com, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, jstultz@google.com, 
	tjmercier@google.com, v-songbaohua@oppo.com, zhengtangquan@oppo.com, 
	marcin.slusarz@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi Sumit,

>
> Using the micro-benchmark below, we see that mmap becomes
> 3.5X faster:


Marcin pointed out to me off-tree that it is actually 35x faster,
not 3.5x faster. Sorry for my poor math. I assume you can fix this
when merging it?

>
> W/ patch:
>
> ~ # ./a.out
> mmap 512MB took 200266.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 198151.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 197069.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 196781.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 198102.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 195552.000 us, verify OK
>
> W/o patch:
>
> ~ # ./a.out
> mmap 512MB took 6987470.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 6970739.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 6984383.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 6971311.000 us, verify OK
> ~ # ./a.out
> mmap 512MB took 6991680.000 us, verify OK


Thanks
Barry

