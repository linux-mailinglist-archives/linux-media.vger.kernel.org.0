Return-Path: <linux-media+bounces-25295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF6AA1BB6C
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 18:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE85E1887138
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 17:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FF71CEE86;
	Fri, 24 Jan 2025 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="hqyUnGYB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54F81CDA2D
	for <linux-media@vger.kernel.org>; Fri, 24 Jan 2025 17:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737739743; cv=none; b=NZQBHolxmTNnRMYpUOFKMis8CKWlIpcBAxLrlNHVr2N/G5r5ADrU14jDYToygpXFArU/xHT/qgCttbAz3YdD+jvXUr2VqDixXjFdX1Gvwy3NaJAWiw1BkSw44D92T7ztucKK1Y+5U9L3j5NIXuBjImTNxRcOcT74Rtvh35Vg5JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737739743; c=relaxed/simple;
	bh=w2Wx50ykoTk/Tj752BaAKy1iR/ehK29AQNLp/j0Wvqs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aJlNKluZPhwTgp9tUl5J4jK/GY+ayg9N3TqNoys1J8eQ8J0vR35uZszuUr2TJbn/NFKuff+YW4IC9vljjbJQRWPpDAS1dexBEQ2jSOioIUFozRM0pg+QxVkXTi2YCMnU2rFg6uBHyf3pBsoNuE7upUWsESfTBJ/qhgXToi4UYq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=hqyUnGYB; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467b955e288so24744451cf.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jan 2025 09:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1737739740; x=1738344540; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2Wx50ykoTk/Tj752BaAKy1iR/ehK29AQNLp/j0Wvqs=;
        b=hqyUnGYB2E/5AtEfj3WIZTqzLViFtZ7g/pR9yrP0okZ5atdMIc64BjwBJwmapc4e4D
         t2iwd+v7v7UFM/K3qxsaiXoRxWOlmzPQSZdVu2KSwqb3GTBs6k016Rjl0PQEYOTkjWaB
         8M5PbSfJxeeW1qAmFQrAJBUrWdk5xQTSeq5T0B5znbYwpndt02NPf0p48j2AMqoHBsp8
         DGDDtgfVHmYYQbGi3QHzQ5Uk6rD4lrEkbFV5Jmhn1T/lRMjinwBt2RGy92SmuOZLtSgk
         kdAZnBThtT8hhNkjvUuWTk2f7BjMlT5rJcBCtNuvF2UZfxDQJ3+dqGQyeNOia9ZgPa9y
         AKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737739740; x=1738344540;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w2Wx50ykoTk/Tj752BaAKy1iR/ehK29AQNLp/j0Wvqs=;
        b=J+GGWhh50ChMdTSmr5aVheWzQv09DlkpyhjPMA/MtPXOI0LSmdJPLO+GoM/4Emrmvg
         exF61tst8Ci4gGnD3h3jXuwLghLsPGC7aR3naBqSDkPQJIjfWWoAWr83ZlpTUNXLbykF
         1SqzuKgwmxoqjLTluLmlr2D2uWAL1KON8/wwLA1v9NdBIlyksefQaFgF6GQwQsVeLGgS
         iIaPauSctYnSgg1AcJ3Fg7saJaOEVBJfPHWYtBvWP0XeBXzI/yOY4UHjCSKPHGqpKH6K
         AeQ00EsmHbbclx/j1Y7NwLwCDqG8WN+j4HEU/na1Xf5R5VQL+n1ZuTXFO7EuIhYYO5a1
         5qCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVtqPS06KxpFEW2k1u38VsthKJxEqU6r6LTI060mZTSX6VhBcM38fXsTpr5X9cTQVpImI6uVMZJ+tmzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1BOLwwixmIkZ2XauvbvLLbkdTEKcq2lyQPF4QGqk7I+bRPKb
	SovSF4T0pulZXTgmsNJIoa+cNCBY6kPn+CZz5LlzayT5CN3Jsmr9zykQtGQyyH7cBEbxx7bSbsp
	f
X-Gm-Gg: ASbGncvaJj1tVPf/Ijs6Azf9SK7pr/Ou5aUAkJ4ueUywck+L9cXbTsqdfwtglYmtkuI
	iiU+5P9pBoBZ8NNVasnFDhMNRkSLafk41oaj/m0+RZ7WW/iX5IyABM36qml9pIRAj0b1zQTc8b1
	5c8Ix+tzqKKJrfdjVdnyXKmFKLPLQeEVzlTNJXRzuKeQ5+CCYMAXNhsHhvd/+IqWNevOWTe5LnI
	IBLBh5kNxHn6v+d7zhesA7WcIt6CVbTVJRLPMNJDWKqxGoPJ+qhp7HS1a8KEhMR0VzULZCQru+9
	n4sBpQ==
X-Google-Smtp-Source: AGHT+IG4XtewEuqABuIw0pvW06tN9bhGdK4tzydCq41YScQ/KEj14JJIwHXH9R7KcGIUNhaF8qJvXw==
X-Received: by 2002:a05:622a:190b:b0:467:4b8d:2eea with SMTP id d75a77b69052e-46e12b90d4emr461518771cf.34.1737739740579;
        Fri, 24 Jan 2025 09:29:00 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e20525ac6fsm10475796d6.50.2025.01.24.09.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 09:29:00 -0800 (PST)
Message-ID: <f1545f98769c686dfa8c97dce9aa55286604ec49.camel@ndufresne.ca>
Subject: Re: v4l2-compliance: input and output versus Media UAPI V4L doc
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Stephen Wade <stephematician@gmail.com>, linux-media@vger.kernel.org
Date: Fri, 24 Jan 2025 12:28:59 -0500
In-Reply-To: <CAHG+78wbrf9nK+drzt35Ev-QHsz=Jzqh1y_y7ETKBEiG5FPyLQ@mail.gmail.com>
References: 
	<CAHG+78wbrf9nK+drzt35Ev-QHsz=Jzqh1y_y7ETKBEiG5FPyLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 24 janvier 2025 =C3=A0 12:50 +1100, Stephen Wade a =C3=A9crit=
=C2=A0:
> This is my first question - any feedback or direction is welcome.
>=20
> I am trying to 'square' the documentation available for Media UAPI V4L
> with the expected behaviour.
>=20
> In particular I'm trying to match the following line from Media UAPI
> Video for Linux =C2=A71.1.3:
>=20
> > Today each V4L2 device node supports just one function.

The definition of function is extremely vague in that document and there is=
 room
for improvement.

Despite that class of device existed already, the text does not mention Mem=
mory-
to-Memory devices. These are single device, onto which you must allocate 2 =
set
of buffers, once for OUTPUT (which technically is the driver input stream) =
and
one for CAPTURE. That must be set on the same instance, since each time you=
 call
open() you get fresh instance. It has no global state like other devices.

>=20
> with the statement in =C2=A7 3.2 Streaming I/O:
>=20
> > A driver can support many sets of buffers. Each set is identified by a =
unique buffer type value. The sets are independent and each set can hold a =
different type of data. To access different sets at the same time different=
 file descriptors must be used. [footnote]One could use one file descriptor=
 and set the buffer type field accordingly when calling ioctl VIDIOC_QBUF, =
VIDIOC_DQBUF etc., but it makes the select() function ambiguous. We also li=
ke the clean approach of one file descriptor per logical stream...[/footnot=
e]
>=20
> This latter quote reads as though it should be possible to open() a
> node twice (i.e. two file handles) to access the different buffer
> types, e.g. V4L2_BUF_TYPE_VIDEO_CAPTURE and then
> V4L2_BUF_TYPE_VIDEO_OUTPUT, but this is not compliant - see e.g. the
> tests in v4l2-compliance.cpp within v4l-utils:
>=20
> if (dcaps & input_caps)
> fail_on_test(dcaps & output_caps);
>=20
> 1. Is =C2=A7 3.2 actually meant to say "To access different sets at the
> same time different _device nodes_ must be used."? Or could it state
> something like "To access different sets available to a node,
> different file descriptors must be used". Mind you, I can't think of a
> situation where concurrent access to different buffer-types makes
> sense (but I am a newbie).

That is true notably for UVC with video capture and metadata capture. Thoug=
h,
capabilities are not 1:1 to the available queue types (see V4L2_CAP_VIDEO_M=
2M
which makes the memory-to-memory device actually possible withing breaking =
that
conformance test).

I think what is impossible with the API, is to have multiple queues and
arbitrarily pick one and not use the other. With multiple devices, the stre=
aming
state (strreamon/off) becomes per queue, removing this limitation. It also =
allow
you to have different process drive different queues as a bonus.

To make an audio analogy, its a bit like have N channels in one connector, =
vs
having N connectors.

>=20
> 2. Could (or should) =C2=A7 1.1.3 be more explicit that "function" is a
> combination of input vs output, and medium (e.g. video, radio, audio)?

I agree there is room for improvement. From my reading, 1 function match on=
e
capability. Nothing prevents us to introduce function that requires 2 or mo=
re
queues, as long as they need to be all operated at the same time using the =
same
streaming state.

Nicolas

>=20
> Kind regards,
> -Stephen
>=20


