Return-Path: <linux-media+bounces-19444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB4E99A8CD
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 18:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 182451C22696
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DA31991A9;
	Fri, 11 Oct 2024 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFUORUP/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A3E197A9F;
	Fri, 11 Oct 2024 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728663677; cv=none; b=k/iC2PQiIPntvN5KoQ7jQnN7g3sH30r8yJZQRp6TZFRGDxr3pcZy8lGPYmWB1Qhy7xj/RIMMw8Lcegp9zCvi945EnDhGEB1LSLjr/htozNUrQhU1keLzflVw+fVOtGubEgZZPVBNISmCL+7e+hx8rL2u7AGPdl4OfAv1InCR0rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728663677; c=relaxed/simple;
	bh=e0IgrgfAy2k6xh3Yqren2YbQRGCgO+FuF0ouSDtFGz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaW2Hz68r/iBClTVggbIPl63PyUYa2sEE8zbObQyn3n0DEujDL9bGXKoR6cKqJt/x1LYF1dTEfaCqiUHK2TKFZ6DZ69DAH532uMw35JaR8blKM5l57oasJmWPtRNEus2c5JZu/hpHwWxPx6cPROaA8yyvJqlusWSnYjL1VWqL38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFUORUP/; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7e6b38088f6so341928a12.1;
        Fri, 11 Oct 2024 09:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728663675; x=1729268475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJiFiR3O9fG38qEyqOGvM97ohhy8ftQAOcumkcvgPs4=;
        b=IFUORUP/Zj7d4J2TxsyT1SRSWq7lcOnapgK2RY15GslD5BvEjprmLI56cykMbx1y7b
         pwPSa1L1NNpj7JLp7QvH6yEjKyRN1oQ9Nj80l0rxxlbV3VvxLk1UgVOqeL1Yg1Hn+mlM
         AxxA18Fe0uCgDDExM1cB55EfJZz0dVbbizS3qSeUYyIfCGA8V8Rd8W4uWYLhn3jQ8qDz
         wFgr4TTCOPTcAyHnR8kiGltwNjwrPeH8S9vjtOUldutrqkd8JYxYgrYw2bG2rG6okjRL
         eBMwD6DRoVykeZyjN9zsq6CG+bFu9bLqjcVzxsIbIqI3HcuRBDzNsywkn/5O3dWXMpZo
         CoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728663675; x=1729268475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJiFiR3O9fG38qEyqOGvM97ohhy8ftQAOcumkcvgPs4=;
        b=N+G1ESkMFa+7nJtTavqDZ97+SKHUjQOQXGzung/Y/B9v8qAFUskPHhXnpvlQ5QwyMK
         YBdKRSMXv+R1tMIzdFPapeuZcNGcDOONw0iCDH1syGLUUHpfujLU3yNsad1K9TJ0kJIw
         M1GEgvFv/KizIZKT7hcbMPQSKzcH6nyt6YDEck4cL0yodM4ifpoWiOeVUtelkKPo2tj3
         tIGU3pYzr9i/mj25ZnzuLH/49LB3Fjcn3mo+m/8syNSZQvXppd3f3xAMrjY3Na7j60P8
         IJS0FEo/Qt4HlMZSTzlLra9TTxFjVztYtDhwmqlE4k+p31Gtdq1AynfBAKkV0476h1HH
         VjeA==
X-Forwarded-Encrypted: i=1; AJvYcCXTJG6XKrms867Ku2zbTXahhPfCwZRiIpoHEyC3EI/5fRyTrPo4gOWtNDIDPpasSMWrG8c6kMenzenD4w==@vger.kernel.org, AJvYcCXkbgRMJ6b34smTQPk1eDAG3qcq+zDRv1nO3VzMxSD4+NHusiUrZ6IxhlqauouEh/nL3f6V5M8/5vUE@vger.kernel.org
X-Gm-Message-State: AOJu0YzjZBeTSj3kl6SrMQ1Qd/q3o/E2BGcrR5PPS7B4zzXUo5VAW1q3
	FU95kknEgYyzNjKuFhANpzyNhBSlfdpTR+0l0HOeRY0uBUCsKsz2eC3CbuqgFl7L4JekxYsqT6B
	4tEr9sqsqkLRWciKcqtKSaLGUVg==
X-Google-Smtp-Source: AGHT+IH6sWnHuQxvD7h9xPoiOBgHmqmtVWvAaoBVxMpVOSDQuSjnpVB+OpccvwNhPiZmJ2gPJMJb8kwUCUygKN5lxSo=
X-Received: by 2002:a17:902:d48b:b0:20c:8cc4:cf24 with SMTP id
 d9443c01a7336-20ca172c966mr15878385ad.15.1728663675232; Fri, 11 Oct 2024
 09:21:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALGdzuq9qr5wBpJFg1eNbv0NoMSDM=umusZF6r5T5_i=Foxdiw@mail.gmail.com>
 <2024101107-pry-reflex-8bc2@gregkh>
In-Reply-To: <2024101107-pry-reflex-8bc2@gregkh>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Fri, 11 Oct 2024 11:21:04 -0500
Message-ID: <CALGdzuooWHVS54xOFj7n=MPohy6xMEALet3Q_9EGZ6fRk6Z+_A@mail.gmail.com>
Subject: Re: [drivers/usb/usbip] BUG: corrupted list in vep_queue
To: Greg KH <gregkh@linuxfoundation.org>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me, 
	linux-usb@vger.kernel.org, Zijie Zhao <zzjas98@gmail.com>, syzkaller@googlegroups.com, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

I'm curious about the best approach to fix this issue. I'm unsure if
adding a spinlock or mutex around the code would be good to ensure
that only one thread can modify the list at a time (then fix this
issue).

Alternatively, we could check if the entry is already in the list
within the vep_queue function:
```
if (!list_empty(&new_entry->list)) {
    // Entry is already in the list, handle it (e.g., log an error or ignor=
e)
    return -EEXIST; // Or another appropriate error code
}

// Safe to add the entry to the list
list_add_tail(&new_entry->list, &queue->list);
```

This approach would avoid unnecessary locking overhead if the entry is
not already in the list.

Please let me know your thoughts on these options or if you have any
other suggestions.

Best,
Chenyuan

On Fri, Oct 11, 2024 at 12:21=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Fri, Oct 11, 2024 at 12:13:53AM -0500, Chenyuan Yang wrote:
> > Dear Linux Developers for USB OVER IP DRIVER,
> >
> > We encountered "BUG: corrupted list in vep_queue" when testing the
> > DVB driver with Syzkaller and our generated specifications.
> >
> > Linux version: Linux 6.12-rc2 (8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b=
)
> > Configuration is attached.
> > Syz and C reproducers are as below:
>
>
> Great, can you please send us a patch to resolve this issue as you can
> test it easily?
>
> thanks,
>
> greg k-h

