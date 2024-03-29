Return-Path: <linux-media+bounces-8255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0618927DD
	for <lists+linux-media@lfdr.de>; Sat, 30 Mar 2024 00:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0EE71C20C15
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 23:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CFC13E40A;
	Fri, 29 Mar 2024 23:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e7slhIF2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741C51C0DD1
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 23:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711755389; cv=none; b=VYjNSfZ/LnlVLjT8n/D2hCc0+E/EV5wPQrhkFm0wVJ5Rbjd4y795q8K+bdhVhldjQJTlvbJsDbAq/T9TeWo6ZFFz2oo9FyECde/G/ky6VFuWSlR77aboc4I8/HMw+eivBtt1CW/4BOlUR8S7MVv1v+TXlX7XeB5GldkLsPUt8Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711755389; c=relaxed/simple;
	bh=z3ws0GiqfaPCvaP9VcCCnewH75CZLc5KkLizkP97z2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJ4MMsFeYgCTpnETd4drKfjdwpXH51MbhDofLhthU8POsP1QcQ5GOWbeNCDw8fdWJK18Qk92WZMPSwNy4b71dA9BIKtb7Qs85xQgq99ynK9bS5+4JnbqAqu/VrEKusVgK5u9FrLOW0CKPAnObEj0qbaWFYBEe5FinXr14ewPgzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e7slhIF2; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-614769887e6so698067b3.1
        for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 16:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711755387; x=1712360187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3ws0GiqfaPCvaP9VcCCnewH75CZLc5KkLizkP97z2M=;
        b=e7slhIF2Poej7FfS4d6SxKo+L8d3oJBxPdhX/JSz81GDut3kwXj8ACCLiiU1snlDk+
         mslJZOzdPbvcwkTPviA7hUHB/tPhiQ1Xlf1BP9A7EK8vlm3xa5NBOAUzcUfSr5GFGjcL
         5jV6jjvh4gWx+3TE0XLgMULCBfbEh4vJjesOqo2L2oN+zAnkKrE3uPynyFYqUBxhUTLr
         iKYDdgJ7bq39AeO36XKMM7zvRBuHjCgJXrJEkAyXffqAhqwPDi4M/da7tDaLaMjQL0vj
         kqyd+ABm5eV19N57a6hx5IgymvNtGECZ/kzCfl5iNon11htgh1MwsDVMRDFRiOrJIqJc
         +7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711755387; x=1712360187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3ws0GiqfaPCvaP9VcCCnewH75CZLc5KkLizkP97z2M=;
        b=uggjmDVw4x4n/rW/545isUBzD4KhlYbza7VmYe2ZMq9cb27l+Hu3beAvJIlYiV8FG0
         uGXwvne9gDGJ3n9+6oIL3im9wNC6b5e3EnqdEXRZ4wOiqdWaP29uT0GX4uDzw6ZFIMfq
         lS1iyyeQ2Of8pMJf24MzeS+8lZrZyw0BHt+SjyOq/7WOtv7JLmLTlVacC+9793INmwzf
         JTSA+X6asPmekLlts8n2JYQIsdIU4p7SgAMN7f8dQVN9c+v0iuqaipQoMn6gPqfCDfxn
         xTfxFLSw+yGVSaGutDg/VjQ2X3qUHIuGq6zYKj3bVE7qBwr1rLSTND2iwpjxDN1TXVbV
         JLKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS3lF04rCf7EVqHgTZHbWtpWyyWib5LC847P1OdJIDg++jnhws2dlxrw4Xi8kZ357k+U+twc3RXYV3GXvllfnu/rJ1H2YMZuNV9Y8=
X-Gm-Message-State: AOJu0Yy70hmAZHYPkQWb9NxIrdow/CYGp37lVChGArpHnsFm+GIVG6LS
	E9IXxcE1Qedp1Vehu8qZLF4+JfgAn5QT/19SjHznvmJ4h6Uzf2PDBea61SgReccuGKiIhJK2Szk
	mLTb0MYAM24gQPdezzJEJtDRv9kFDlIHJ71KAZaOqnZJOInNq80PF
X-Google-Smtp-Source: AGHT+IGJk7NU8MrL8Rai4C8fdDlc24klJyWnbefpAnU4Fv6NNUTsRsocqC1LxHZ94PST37mhkloThVc9PuLt5FEG9B4=
X-Received: by 2002:a25:f912:0:b0:dc7:494e:ff33 with SMTP id
 q18-20020a25f912000000b00dc7494eff33mr2512234ybe.7.1711755387188; Fri, 29 Mar
 2024 16:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327022903.776-1-justinjiang@vivo.com>
In-Reply-To: <20240327022903.776-1-justinjiang@vivo.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 29 Mar 2024 16:36:15 -0700
Message-ID: <CABdmKX1swVO1=6cs+CW_g2g4g7woB5-Ks1gBzCA+iLcvpLmkvQ@mail.gmail.com>
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: Zhiguo Jiang <justinjiang@vivo.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 7:29=E2=80=AFPM Zhiguo Jiang <justinjiang@vivo.com>=
 wrote:
>
> The issue is a UAF issue of dmabuf file fd. Throght debugging, we found
> that the dmabuf file fd is added to the epoll event listener list, and
> when it is released, it is not removed from the epoll list, which leads
> to the UAF(Use-After-Free) issue.
>
> The UAF issue can be solved by checking dmabuf file->f_count value and
> skipping the poll operation for the closed dmabuf file in the
> dma_buf_poll(). We have tested this solved patch multiple times and
> have not reproduced the uaf issue.
>

Hi Zhiguo,

What is the most recent kernel version you've seen the bug on?

You are closing the dmabuf fd from another thread while it is still
part of the epoll interest list?

Thanks,
T.J.

