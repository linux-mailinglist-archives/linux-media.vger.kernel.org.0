Return-Path: <linux-media+bounces-34205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0431ACFDF5
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 10:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CB421892430
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 08:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875722853E5;
	Fri,  6 Jun 2025 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z09i3BoJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B0624EF6B
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749197357; cv=none; b=SyxbAW0m8pqh5X4oJyv0cD5lSs+hZ0ncuaIvWFebKbWZwlppIVnAzrfDrEIgb46oglv6nAbqS47g5FV1N8dZGBp5gJxN4WxC5aDlX50jdG3QAeHOlD/09XatpcqToZC/ZMEs2utgBU7Y7nHlezdf5JeiF6FXA3DAH/boO7W+Sh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749197357; c=relaxed/simple;
	bh=C2cwG6g5h1xcnrWRQbgFCNLmQ7CU/qs4tOv+KuSc1E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P78ZreHOfieGuGmp5uBwgJIc4FFywvprV5ANoR/WS/xPn4GHflc3c9vtDj1c0Yqrt8HmkVcBj2B59qDTb3qVqj1Bpvp4+E8wmgXVAGAlHAUvOKo1B3KlRpxJ2U0e+zSfmob/AbCoPAwqJ4sUpiJi16SOPI4/HuA3uynyY/0c/ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z09i3BoJ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32addf54a00so7772281fa.1
        for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 01:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749197353; x=1749802153; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u/SrrLT6hTt+dzUYnWwoaKyJ0BbYGXTFoXh77ZH8ZFA=;
        b=Z09i3BoJG0Z8Sbr3r6UN087VrUlObOr91Srst2crd/+5s5JWAedGUGWxtIxKXru59L
         o8UYsaiND71NY7j4aQpQjSsaVDM7lnQs0o2C5EA4m+rwpXjv79WqS4QfW1q6DriWJFVA
         MxNSWPCeUb1B1p1ncnDwYZeLUfaGiG7PnWaUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749197353; x=1749802153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/SrrLT6hTt+dzUYnWwoaKyJ0BbYGXTFoXh77ZH8ZFA=;
        b=KooYcb1gp0f3PTIx4ROe2NeBX0hffLablXlk0o5oXSVkW++Jj1HNoSl4UgqmutPJ5e
         LQUOBPLxXje9ldxyjLzQgFMIx0VIt352a7vKtXIVt4wSXh2e9U85/7Y6RvUnCCg5XhEN
         +7zD6do+NY4m4j4wJNb0mQ/wQwYORp6jYS9P3pvjWkSGvr8JU/PuYGsvALt5lmMqu7gO
         v8NSqV6PoqX7mhp4tELVZ8Udx/AKLvR7CUDQd2Ka+lwBH8P96sG/4bQs9SSLFBoK4DiN
         vsoZJwkdeE8N/YOylJccUHbdCYYi3Z0ES5ky2dfErwlInT8a+ZNio4JCqAhtC8BF2+q+
         uc/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPmURahagOhMQlHxGlF/WQKwVpyY/DbaRdaCb5NGGEbT18muV+GfN1mlWpjMj3at/RgAHnjdj4kUndUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuHSpqGsiN9Q9R8/FaEhKtwXNy0ZkOT4z8Yun53Qrh8AuAmL2Y
	QdXDdW+LYMtKPRGh4lv3ghhmZeMbzY8tAl9lzojBtX9K7/oOHrhRSZd3mQRpVh/eyn8twhmIw60
	GCCc=
X-Gm-Gg: ASbGncv2/lJZvGRDV+jTBLncfB+WzEV5ItGXkguukxEZ6pHMk/tp8kbMcNCQJDW0/uR
	JnaMY5ZxWxmJc4L2FA1bnf/VElWlRM4cJMfv9VJD6q0ndRAZy7qChyaMIyyeF/NVUZh3Ai4z5CT
	wfYgQR8Pztds5W52WuU2iQ6Rhc6cth7Vngc/4w8pxPhYT1QliyoBhtJhSufe49qA1klIO3UxOl5
	z1MYP3sbmxV/0v+CcEpYPzDjzzd41izqOjVdAmAETenRh9o8acLvCqk/y7pMLNJWwaiA9dlyh9C
	GxYEqF0TpLBRoUzeX4Wx+ErMFUkd8G+CV1wz7nvZNx8fDWr6dBxvg/SR8eEfakEUJ8Bt8gTeLTt
	mR5vSEgDaNs78r23U+bKS7Nij
X-Google-Smtp-Source: AGHT+IGkR8WMukbpcBN/KaX4vgnq/5rY4lUA4sxidFfRJqWOkvLaGSYDPBYlQb9fAj8JpV6pD80lgQ==
X-Received: by 2002:a2e:bea5:0:b0:32a:7270:5c29 with SMTP id 38308e7fff4ca-32adfb130b6mr6230171fa.2.1749197352820;
        Fri, 06 Jun 2025 01:09:12 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1d00291sm1157191fa.99.2025.06.06.01.09.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 01:09:12 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so2149981e87.1
        for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 01:09:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCPes+n83qyJeAVrgj+d71ycymuEHkxvXbpaJ/XbrCUGiSw8ti0klddH7LEiM1QBsXCr9OFN6fmzrEsQ==@vger.kernel.org
X-Received: by 2002:a05:6512:12d3:b0:550:e648:182a with SMTP id
 2adb3069b0e04-55366c453c9mr522701e87.55.1749197351597; Fri, 06 Jun 2025
 01:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-prefix-v1-1-450aff98308a@chromium.org>
 <20250605124635.GC29935@pendragon.ideasonboard.com> <CANiDSCs4B8ovA2jipUiDr3tC3SSCpJOownohx-X+UvD+2W2w9g@mail.gmail.com>
 <20250605131700.GA25847@pendragon.ideasonboard.com> <20250606095230.3a987c30@foz.lan>
In-Reply-To: <20250606095230.3a987c30@foz.lan>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 6 Jun 2025 10:08:58 +0200
X-Gmail-Original-Message-ID: <CANiDSCtEiEe4J76tJzEv5dTNxVepTN22XCt7a6B-ncgxnVo3rA@mail.gmail.com>
X-Gm-Features: AX0GCFsfMq0202z0Xl0BtMRC-C7oMT_RVzNG7D7Mth2Ib7mxXNvm19BPdSB1vic
Message-ID: <CANiDSCtEiEe4J76tJzEv5dTNxVepTN22XCt7a6B-ncgxnVo3rA@mail.gmail.com>
Subject: Re: [PATCH v4l-utils] CONTRIBUTE: Add simple contribution instructions
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, 6 Jun 2025 at 09:52, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Thu, 5 Jun 2025 16:17:00 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
>
> > On Thu, Jun 05, 2025 at 02:54:33PM +0200, Ricardo Ribalda wrote:
> > > On Thu, 5 Jun 2025 at 14:46, Laurent Pinchart wrote:
> > > > On Thu, Jun 05, 2025 at 12:09:57PM +0000, Ricardo Ribalda wrote:
> > > > > In the media summit we discussed the need of a special prefix for
> > > > > v4l-utils. This helps patchwork and media-ci.
> > > > >
> > > > > Create a new file with a brief introductions on how to contribute and
> > > > > make the `v4l-utils` official.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > >
> > > > I think this is a good idea. I don't know how we'll get users to
> > > > actually use the prefix, but documenting it is a necessary first step.
>
> It is a good idea, but I'd say that, if there is "v4l-utils" anywhere
> at the patch series subject, media CI shall not change the patch
> status. Same applies to the other userspace tools we maintain.

media-CI only changes the status if the followings conditions are met:
- There is no v4l-utils in the subject
- The patch can be applied on top of media-committers
- It does not modify any media file

Only if those 3 conditions are met, we mark the patch as
not-applicable and send an email to media-maintainers about that to
avoid false positives.

>
> Please notice, however, that the title is not enough to classify
> it as userspace. See, for instance the contributions we receive for
> DTV tables like this one:
>
>         - https://lore.kernel.org/linux-media/846e7968-292d-5e96-b2a4-1e2e6b131fe3@tutr.cz/
>
> This is not the first and probably won't be the last time we see
> things like that. So, in doubt, media-ci should not tag a patch
> if it can't verify that the patch is for the Kernel.
>
> > >
> > > I can add a comment in the media-ci email. Something like:
> > >
> > > I could not apply your series. Maybe it is for v4l-utils, if so,
> > > please check  http://XXXX/CONTRIBUTE.md
>
> Makes sense, but see: currently we maintain v4l-utils, dtv-scan-tables,
> tvtime, xawtv3 and xawtv4 userspace tools.
>
> The number of patches for the last three are really low, but when
> we have patches there they are important, as they're usually
> bug fixes made by distro maintainers. We should not miss those.

Nothing changes for those, they will still be in patchwork with "new" tag.


>
> Regards,
> Mauro



-- 
Ricardo Ribalda

