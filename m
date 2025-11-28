Return-Path: <linux-media+bounces-47845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B19FC90B4E
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 04:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 27B004E10C2
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 03:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8062BE020;
	Fri, 28 Nov 2025 03:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqbCr5OV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4352857CD
	for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 03:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299483; cv=none; b=VblQKWi+8UtXoZeZmpEleQlwxxY5z94S7M24W+PARg8I66lrs3/Tw0jkTd4pmE/yZzFKkU1C0ih8yKuYc5N5krwJgy223ieXkFLl/J9G3lf4tMB1GURTWFGk2x4Ioh2aLAkn5bYj2aJzIj7xzASiQsEWH1u5X5UiEfUu5EA9IM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299483; c=relaxed/simple;
	bh=o4gVMKTIApD8QcxiGv448SehpwWcJ3XDicTCcV09+Ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTRA7jF5KIFiLpuJWMk18Xzm1D+w2q2qfY18OMNkhvLj1WZB9o3H1wigMrnbXgP1CZKFugbZYdYsTSG55NTGDGNjSzEI217WT/deIyr/OX/SILGPYxNtXpdp3Cxlwr6gQDC2toMgrgaFxNTVolaD38Z5zudcVRutqP7KocuBpsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqbCr5OV; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-343684a06b2so1237034a91.1
        for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 19:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764299482; x=1764904282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ND1OEBWPOs+GXtXBLLFvj+rGhVzsBAygFddom5lhQU=;
        b=BqbCr5OVey/6cS/FEfhKqzVucVm1m/tfzmHNliDSaLCA/0XjvxCTEIivQPNNcd/E3k
         /wwRG3guU1IlA+CsK7AQRguT0sTcxSCaUwHdC2E9V8SjUIQE5OsUES2pVZfc41Pef/e5
         nylL1TbGdmETSn2FNHFjeKb7HzpdXlfscQGjWFOXzKXAhbxOGKL1G8uiKK3XEwDskGGp
         CrEH/C9D8yUwN6z7YDJwDGogMHAeSdP5LjyZp+zIfLvNurN9VCMi946d0r0uPVsccnME
         dLXpYbFWR6HNVxeSphKQLc2QesVRMl4ABNSozT1iCXzOID9B65Kezk1xPRUNT5sw1wKh
         4sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764299482; x=1764904282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ND1OEBWPOs+GXtXBLLFvj+rGhVzsBAygFddom5lhQU=;
        b=KDt+aQqyCSKzjlxT/M313ypTDCS8rs/ZjPisZEVo4BspeC/3XUhK6Oj9kaZdbKRwVC
         o8eJ6FujjP1nwYXexlvDsUwvmOB1ezuwCcWldS3xYn0w/SNMAjEsfo6qfFfKVcMCmNCi
         Wl+3XTwWipFIr5l1RHme0ARrArcSago+oQ2wMUXseCqoJgVNa6+vBTkUu3r8cNFelsCh
         xN6uCPs1HLgie//jNd53sCmgHFQRhuEzMNnV2XiKRkPY4HfVAaH1KvZXzXVvoKOyXbiD
         /ez6nAFi65+ut4vCBwA2a/S6Td8MWnh8T9fYYwE9WEIQ91abBUpcHAbFG3xLTaseUCLB
         Nucg==
X-Forwarded-Encrypted: i=1; AJvYcCVOyXk6BcqjWMLcZB7u4iU4mCQivxoS8B2tdhWelCXbAX417US1cTTGaYOOd7M27b7qK6EQCCmMkFe2Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGWLMsq1JqBRhb8e5XdPsIcpZj4EpffEtrjxX9ke9VpHGf0SWv
	xc4d4Ugp/fOAAnkr2BUo9omN6w9kKyDTYzMHH54rZDo44LXJBC0eZHBQSVOePVnzh6GBJT/fvMd
	GtZRTwiPDAT0xbgS+Utdi8jlL0VLeeqE=
X-Gm-Gg: ASbGncuou9w5epBVyoUFtNyIUb6vfXeQLKWoyo6eblBoMtNnhC+6T9JRdDnlhLRpNFG
	07oQwJC56/ctH5OK9XHNivkuisczFxsTKX4Jf9QI0j5vSNaX2du64XQLcBz1bwroemyvKxekvoD
	DzE0xkZiIwXZ54oVSp9gi74bzuQWgNWpvp91597WQ8XK35yJXSI1EA8fncKE1pphIqe7q7j+WhU
	aJZgzoQ7hgA4rQu5xZfko+4+9DKd119YCYQjgel2gzl7sDv7OdLi7oTnk6S223L4oACDv6N3tYo
	X9CknIZdXrNGRfj6n9a5KkbrhzMtXQ==
X-Google-Smtp-Source: AGHT+IFSKrPZArROagqyZ7h6ah0qWjAxaNMuYctvX1vyDiVowlqz4HNUBz0hfujnH13uZXzzFBjRo/AomuS7k5QsICY=
X-Received: by 2002:a17:90b:1fc5:b0:32b:9750:10e4 with SMTP id
 98e67ed59e1d1-34733f3eb71mr26490887a91.27.1764299481803; Thu, 27 Nov 2025
 19:11:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120084926.18620-1-opensource206@gmail.com> <832f4621-53af-465a-a5e9-f7d65a082481@linuxfoundation.org>
In-Reply-To: <832f4621-53af-465a-a5e9-f7d65a082481@linuxfoundation.org>
From: opensource india <opensource206@gmail.com>
Date: Fri, 28 Nov 2025 08:41:10 +0530
X-Gm-Features: AWmQ_bk7mUcwbqutXyFnjfWqH2fUxBupvi6tuHck4BsNwnofGpHNJbUfIhH5Ofg
Message-ID: <CAKPKb8-qyqMmp6c9OnO+AapRRJyE8ygtQUyuUqK8+C0LvMTYTg@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: vimc: add RGB/YUV input entity and improve
 pipeline support
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 10:08=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.=
org> wrote:
>
> On 11/20/25 01:49, Pavan Bobba wrote:
> > This series extends the vimc test driver with a new RGB/YUV input entit=
y,
> > pipeline enhancements, and documentation updates.
> > Pavan Bobba (5):
> >    media: vimc: add RGB/YUV input entity implementation
> >    media: vimc: add support for V4L2_FIELD_ALTERNATE in vimc-sensor
> >    media: vimc: debayer: add support for multiple RGB formats
> >    media: vimc: capture: support custom bytesperline values
> >    docs: media: vimc: document RGB/YUV input entity
> >
> >   Documentation/admin-guide/media/vimc.rst      |  39 +++-
> >   drivers/media/test-drivers/vimc/Makefile      |   3 +-
> >   .../media/test-drivers/vimc/vimc-capture.c    |  15 +-
> >   drivers/media/test-drivers/vimc/vimc-common.h |   1 +
> >   drivers/media/test-drivers/vimc/vimc-core.c   |   3 +-
> >   .../media/test-drivers/vimc/vimc-debayer.c    | 113 ++++++++--
> >   drivers/media/test-drivers/vimc/vimc-input.c  | 210 +++++++++++++++++=
+
> >   drivers/media/test-drivers/vimc/vimc-sensor.c |   9 +-
> >   8 files changed, 352 insertions(+), 41 deletions(-)
> >   create mode 100644 drivers/media/test-drivers/vimc/vimc-input.c
> >
>
> Kieran and Hans, Do you have any feedback on this patch series?
>
> thanks,
> -- Shuah
>

Hi Kieran and Hans,
can you please review?

