Return-Path: <linux-media+bounces-23118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385459EBF14
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 00:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12515160741
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A65F1EE7DC;
	Tue, 10 Dec 2024 23:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LixPXPqC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAFF1AA786
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 23:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733872355; cv=none; b=MIIc2fPN2JAVV5eZ2iV/LqsIoqfLchh/CnYqDOC4rDaUGhJnwsQqPlHwCcTOG9pIlRBBHkC7wzWifF3SzM9wbY+C6wKMpgCtUvlMruUZLc8aZ3pHObODDAuQ71NuY65DwBlFXCaqvPX2kgOGIxaOf9ezUeTjFruMVPZO1J+/z3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733872355; c=relaxed/simple;
	bh=sN8h4y3sL6hRB/FVyLclbUwDfXQNaStYrJ5PxQJ48QE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRklgZgsAod12CMUdh9WuM6FUCtf8euumMfJxVAxXCwn/vwZ0VO44S/a5Vcm4T6gH01S7/KylfbUWwz4cMiNondq/2RmSWbmhlBk3pxzrPYqYE2Vz5zkT/lIoAxXHST8v56UVbb5lZNFGRA5tCixh5mkI2CNsXecTFVzK6ybGuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LixPXPqC; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3cfdc7e4fso938a12.0
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 15:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733872352; x=1734477152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ktWoM2RO50AIk62xE/mUhtdnzdqp6Qodwc9F6o3J3M=;
        b=LixPXPqCb6DRQxvH43iSPndEZ0NC8e22iIaPrSUq1F7CjZS2CJZWrLhdWLEZbvIeWM
         Hm/jWBgzjyJipTB4EA3IRXholGu+frPRJwb3FVilVrj0kxXrOQPnqAlmBkHLUEwTvt1C
         ggdlyX2RlJpgJ4YzXO2jd73Rw8Mxf5FFnI4bUox/SYvSxCkE5Hj1tu4yG+DbPb14vqmX
         tQ8fT+ynX063ghk8PTezJIIGfZu9O58krJsXg6MuV5XnohUFndOl+kgIQRl4+9vnvBM3
         FgJOhghluwTbMwyUtBmqBa4cFq557g2h9AbqP6fb+1UmYQryPXecGwqor6KCwwJUuVXt
         sSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733872352; x=1734477152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ktWoM2RO50AIk62xE/mUhtdnzdqp6Qodwc9F6o3J3M=;
        b=wXtnKoNxM4hba6LawljcbMaR9Ci/8S0hDcT6cQ+xYkNzaEgrk7nSTV6v5st8Yes4mi
         9NmE3fhIOtxPwccJvR/RIK3WEp/r4nNEvElLToyMJ2CuBX7hcYYdX+HV34X/R8KI7Fe9
         chOX2r7muYSbfKKNWXBJseoblwSLhN88pdOS/1Lt54K6eOFy2UshD0VgnpjLqtgeW7n8
         O3BcOoSdhfRSC+RMwEVz2MdsyKKLfXVY/rTH7MOoEoFag5ZxEEJAUr3qQPRbFRXcI48x
         LSRz8hu7JN4uWXXzx/X0qHBjUGrjSBBd8QxbZI68gSe8uZ27NMNVHhyZu4oMCkcrNiI7
         mbxg==
X-Forwarded-Encrypted: i=1; AJvYcCUS5QGz9Y6MyRp4GkOqu8RFI41ZPpISex6QRXkzarWWQhB7CquqNrCQSQYHr+H1VyFWbeJpy5cYQaHZSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0//vzppwrqdr4mIVPTLBHVWHiIp3C6rGtOkluCFLZ68QrPXAV
	F2/U3HD8NeUouN3L65Mit3uxR9I6L/kB0o200UIQNp7NYisiEUrz9BMG/oYM6EnMkgIhHvydns0
	lIZcPSMJ+f4W3eH+FrbvQqIw+hs/86EdZKyZ5
X-Gm-Gg: ASbGncv3F771SXIyr0jScb204jg+GBJhF6sVvkp+LdJmTxUxDe48W8gOrf7xAwN5oJR
	RjXsy11u880MftOT+kcxM6ut85Vb7KmQ9Et/1vcURKoBckzzhktqlHw1rbzgYkCMR
X-Google-Smtp-Source: AGHT+IFg93uOLvg+U0JqZTijgyGoPZEhO04pg5mVTz8T7IazCzxdGADHif0Wl3o6jYGRQnOjr9uTt6hydMk6lXR7lwc=
X-Received: by 2002:a05:6402:b8f:b0:5d1:10a4:de9 with SMTP id
 4fb4d7f45d1cf-5d43423be00mr11289a12.7.1733872351659; Tue, 10 Dec 2024
 15:12:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
 <20241204-udmabuf-fixes-v2-1-23887289de1c@google.com> <CAEXW_YRb4PsFgEvHW2QBDY5dxJ+aoMTn3qtj5v9eboxO3SxPLg@mail.gmail.com>
In-Reply-To: <CAEXW_YRb4PsFgEvHW2QBDY5dxJ+aoMTn3qtj5v9eboxO3SxPLg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 11 Dec 2024 00:11:54 +0100
Message-ID: <CAG48ez2cTrD2_4iKo3+zrPH=e29znYOKLBkC4OLA3yhsu5oMNA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] udmabuf: fix racy memfd sealing check
To: Joel Fernandes <joel@joelfernandes.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Julian Orth <ju.orth@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 11:51=E2=80=AFPM Joel Fernandes <joel@joelfernandes=
.org> wrote:
> On Wed, Dec 4, 2024 at 11:27=E2=80=AFAM Jann Horn <jannh@google.com> wrot=
e:
> > The current check_memfd_seals() is racy: Since we first do
> > check_memfd_seals() and then udmabuf_pin_folios() without holding any
> > relevant lock across both, F_SEAL_WRITE can be set in between.
> > This is problematic because we can end up holding pins to pages in a
> > write-sealed memfd.
> >
> > Fix it using the inode lock, that's probably the easiest way.
> > In the future, we might want to consider moving this logic into memfd,
> > especially if anyone else wants to use memfd_pin_folios().
>
> I am curious, why is it not possible to have a reproducer for this
> issue, is it not reproducible and is theoretical?

Sorry, I think I must have forgotten about this part when I wrote the
cover letter: The original bug reporter (Julian) linked to a
reproducer that is linked in the bugzilla bug report, at
<https://github.com/mahkoh/udmabuf-seal>. I haven't tried running it
myself though.


> thanks,
>
>  - Joel
>
> >
> > Reported-by: Julian Orth <ju.orth@gmail.com>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D219106
> > Closes: https://lore.kernel.org/r/CAG48ez0w8HrFEZtJkfmkVKFDhE5aP7nz=3Do=
brimeTgpD+StkV9w@mail.gmail.com
> > Fixes: fbb0de795078 ("Add udmabuf misc device")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jann Horn <jannh@google.com>

