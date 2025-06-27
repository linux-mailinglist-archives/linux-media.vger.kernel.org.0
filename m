Return-Path: <linux-media+bounces-36065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E2AEAF17
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 08:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E23757A6390
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 06:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A659B214818;
	Fri, 27 Jun 2025 06:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bU3b4fOU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9382F3E;
	Fri, 27 Jun 2025 06:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751006353; cv=none; b=kuVuitdFvNb1O839Xo8+0+G3qd0WYnd/KyYGXOQP95dlLRjiop1IoQSU19RskyOv9MdoGZDzfQ7SVB8SJKumWRUgTQuVi6xLVw8SfpeczQqntdm6FsOjYWxQo7SV5MpduAPw5QgyuQcbiGDYCvsOLpbqKX2f1c8ZvsdbiV+w2Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751006353; c=relaxed/simple;
	bh=H9s6SjNj+RDHJHJdAu/dk43mt6UKRQE8bixPQovPJ7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=spOgFJC0Ry+beNnnjIQKPJ39zHipFbZsA2M1+sHkqTCQ952BMZROs6ChK7/A/0juQedxAryzT151RRBBH5ZvVVaPlP52H7OFrO0SXLEhAx4XKpNLZWNm6AAx81049snaFb49IiVISPmxviICWEKDLdQMJ5J8fqHWc1efLU44xQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bU3b4fOU; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71101efedabso2418587b3.2;
        Thu, 26 Jun 2025 23:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751006350; x=1751611150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onir1NlpWyCI0dVQmmMsqkrXg02cy81P8SAAeEAoBLo=;
        b=bU3b4fOUHtPo++aO9NupuQKu3nPnpVta1eEurJBVK9e8CQ57FeXBIRBoNM+B2yGyKi
         5NyEznGbEMpzRMCksKhF8r7mS33PuRFTw8sUhZRyY+Djqd+FwUrclyODJTy81J/Q018C
         V8xsaeXbuq39BzOVhWFlBdpR046R/RUJwO0h8nZsbY9NDhpvLDz5+GCPHs1ySCluFBKv
         GV6Ocu/7fK9rz11zsNZunW/SOwC3jVINBo2jHowBxzwpYqtd2CyB/SFRrNE8f+MA7ZGE
         myTYfBWpaNCOdDVMxE1T380KF4MLBQ3SO2pe2YOobgxF2o2lDDscc36BhtTA28rslUfO
         3LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751006350; x=1751611150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onir1NlpWyCI0dVQmmMsqkrXg02cy81P8SAAeEAoBLo=;
        b=mgrdGe4ZXG/7wxslsjEb5ovv6Mr/eU6/73w0wMBBXyZh/KiI1uKXTwgB8tUplyOV7w
         uEZ9/vcZ/ArdEltk5o8evRufuabVV3NFQAyqCn1dJEfvc5BKCrv/99uhe1gliKPJPFBn
         kOWS0fy8xil71JstCHu3YZhrthmNHuETJiLxovxYfawoJBd7llt+WcgSpmKDJTZ5Z1DO
         JBQGa38Rl15sbaU7rKB6OIvtvAh3sRntu4KCttGvMT/UbuUH57xSmN8qzujq/dwZzq1H
         MH2UErEAp3sj0T8a4RPWXVoUmtEZ1RvJnnXWLUFxipejombEnW93//+E5qMeIj8BcnKn
         CYlg==
X-Forwarded-Encrypted: i=1; AJvYcCVSozBl+KaWm9/nrxYF3W7LhL1AQZQRllRuxDPez9zUVrPF9G0VlauBqE0u9Rmg2usM9Kw/Il2r6VrFaeY=@vger.kernel.org, AJvYcCX2YqzqmcG12hRrfNiVebOZEh682y1ZtZTjYNUSUOX02gWe3NQS0F1xarSoQ/QsWRDPFuGX6OPeawyY0zc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZcyiShv56bKjcDEByTWcEWQdr99yI1ed9VxJ2id5vkyJgofmZ
	eFVcRUi05qmIJvc8WjQ06KUvt7oSkvuq8gXqfPl/38hlifSmaAupEaW8uPz0RP77N/GIwc6dczp
	l39sMRx7jj6g5U8Shb2HLfZzQ8kZiWGE=
X-Gm-Gg: ASbGncuXPxBAWCvwawAJbCO3EgH9ZXQ9wUaQBvGphM/I7OSuvjlXTX9xsqcLfN9K7Xe
	VdayFPj3mBCAvhmjvNQjW84kYMTwVlfFVq2cWUfdWGAAXwp70NlbowPK+Sdv5GxXuj0gk7R6UXT
	mxgHUzlpaBdr37U576DJVIBtjnYMt37CjkNFy5LW7LtsY=
X-Google-Smtp-Source: AGHT+IFLXLETAN2g0YLI/m+TdlWxRgsW7CKClEWk8SveKK4B+rK6hli1LycaO27zbXV6hVpgVFRcMcgj4wyLs3zsHjE=
X-Received: by 2002:a05:690c:6f0b:b0:70e:6261:f7f1 with SMTP id
 00721157ae682-715171c2777mr14644577b3.7.1751006350533; Thu, 26 Jun 2025
 23:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com> <fdaedc62-2beb-4f18-9e4f-f60ef35e1b38@suswa.mountain>
In-Reply-To: <fdaedc62-2beb-4f18-9e4f-f60ef35e1b38@suswa.mountain>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Fri, 27 Jun 2025 09:38:59 +0300
X-Gm-Features: Ac12FXz9KhDNUrKyV-tQ6S9YDv9iqORA_TjYOWzlsoG6CfX-2Q5mIrypUCkMpx4
Message-ID: <CAGn2d8ND8Gm8E=CwyNbejmOeuqwk32zNCV-EW-k_N6GTOn7aZw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dan,

Thank you so much for your good words

On Fri, Jun 27, 2025 at 12:32=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Resend this patch with the changes Andy asked for and I'll Ack it.
On it , thanks.
>
> The other things we discussed can be done separately.  It's also fine
> to never do them.  I'm not your boss.  ;)
>
I think I will continue working on it. I'm very excited to contribute
to something as big as this .

> regards,
> dan carpenter
>
regards,
Abdelrahman Fekry

