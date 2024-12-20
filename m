Return-Path: <linux-media+bounces-23863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDEF9F9154
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDE227A3CF1
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1E21DAC8C;
	Fri, 20 Dec 2024 11:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qc8AsRV7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFA81D9A7F
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 11:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694089; cv=none; b=DvBC5cHXke6ibynxydG4bEPTfXb0GUPgyR7evLsqBkvv/xuopm4/PYgHld+TebfwWPWKomHaYq8mub8ZnEbgefGwA4e0qALkFXBUKz4p6+V64dVzlSELNdyRtLgG7un7chtRThutGQMCIgSNROeymlELvY5SIQT6Vg++J1iLlz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694089; c=relaxed/simple;
	bh=PCPFqkEe9dQ3KqpX54rniAQPvLp+hd/pcqFEG4t0JzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F1sksLsqvXWTKTs3ES9fKzWIl/QN6kOaRy7jv55zTdl2siYyKGv6oQz2wDoGRSwXfUcd9UQN1Q2CLHZnq5XSsF7PRDOk6guklst2x5qDYenZHlB1eQPRTTeqDLxJwa8ha5PJqLJsigKkcj+db8wOg6VoNw11m/8zfp8T5l7kq7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qc8AsRV7; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-725d9f57d90so1354561b3a.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 03:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734694087; x=1735298887; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LzWKrrnZZJT/p1f6zLGiYcU27FTtZ3P1yfBPKV09imY=;
        b=Qc8AsRV7EiZeljx50WFxfxx16OjZu3lnSpXbYL3JkLtScrEpdgF2ZkL5icNCijBD8H
         GZshXWPkAgfdRAXXQkaCwzoz4RzeaiWFF2DKttFv0BuhvePG+EePIQO0SpxfsyPQC/ce
         eldqtHZJdbo0+u1gD5W2AHf//7zoiyg0GY38Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734694087; x=1735298887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzWKrrnZZJT/p1f6zLGiYcU27FTtZ3P1yfBPKV09imY=;
        b=n+ZazKgYjpo1csDpbnyCkSeZhzcSLq+M0Ma0eRf5vUdZjqT6OQHu0T7EczcJorOVhi
         2m3k6Idw/Q4iVLigNyT8BZ+5lDzAfEEc7e+uFyoXqJ8XxnwEB993DN5MP2gRPHgz8Sgq
         evlZ1zZ4X99NU4swecAA5yQ/EoCeRwSiNn6KcZoBVaD7mDBva+aOfwGxbwEcO63vhZVI
         7tcPHiryIGqU+GFJGH6s2vbhuWnZ++K98Wd9Mwg2OIZIR4HWtCDsdfmJz9OdzhbGDck2
         5cVlZce2isbXWBkbt/wHP8PAyIlXCjktvBGvoGAemOfuOPs3O27HLUiIK0riSHQRYgVa
         ggyg==
X-Gm-Message-State: AOJu0YwF1KXuzHf5aIYazpn8r5OTE3O5R4hUL8/SEjYLUy3EBzMFTXZ7
	CkiWny33p+Saa66kpiYCMoySqbGAemnZptoh/aja1XiDOakHcvJAJ89GVY2HhdQvFa9z9FDhzdM
	=
X-Gm-Gg: ASbGncukY7+MQJYVU81C095ZxN5cWasn3uUvy8q7Ubmvutec5RdfrSoFkfvHq6apIRF
	BlbuTJvjIklNlWMBHI1oTAQoRk1YxTfdfDL4A8B9gB3s4wKOO+p0UB571yy0+E5hT4OubywcOH0
	ZI2H9vBj2eBoT09FNdV5ILK12WoN5aRuDZZplVsWf6rO0oEdCna1bIJE9QzSgXnS2WNYo8NgzAo
	DyQz1hkTFs8KzSqbCwWfO2gMO/YN0mlmJZYBXlQ6JWAwm5J02ATBsWREgg1S9bmxxUaRIRfNFWy
	h8L/qC9TeXkYUcbs6Q8=
X-Google-Smtp-Source: AGHT+IFMp7/Av7L+AZ8sA5SEX6ZCu0A4ab3AeTtyK3ZlQ+sdLxzd2ixgHuUrEr8C3amlbkjg4VCubQ==
X-Received: by 2002:a05:6a20:12d2:b0:1e0:c0fa:e088 with SMTP id adf61e73a8af0-1e5e059b19cmr4801808637.18.1734694087343;
        Fri, 20 Dec 2024 03:28:07 -0800 (PST)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8df418sm2975246b3a.102.2024.12.20.03.28.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 03:28:06 -0800 (PST)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso1177350a91.2
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 03:28:06 -0800 (PST)
X-Received: by 2002:a17:90b:5245:b0:2ee:5691:774e with SMTP id
 98e67ed59e1d1-2f452dfb29cmr3841858a91.2.1734694085667; Fri, 20 Dec 2024
 03:28:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219-v4h-fcp-soft-reset-v1-0-026e72dca514@ideasonboard.com>
 <67648382.050a0220.3cc719.1515@mx.google.com> <cn47osp7jzafevobztjb476vfy2sdyifrhs6i4hek2ulz2hyrt@7v7leulw3p77>
In-Reply-To: <cn47osp7jzafevobztjb476vfy2sdyifrhs6i4hek2ulz2hyrt@7v7leulw3p77>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 20 Dec 2024 12:27:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCtVeVOFNYhSR7_HJSe50WtRvdXMXuenux5JdNi-xmS+fA@mail.gmail.com>
X-Gm-Features: AbW1kvapRZbopr7b4z_SKEeu_F64GpaB5hNO4bVrcwurhsOS0r6xHVQ587mlZes
Message-ID: <CANiDSCtVeVOFNYhSR7_HJSe50WtRvdXMXuenux5JdNi-xmS+fA@mail.gmail.com>
Subject: Re: [0/2] Add support for soft reset
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo


On Fri, 20 Dec 2024 at 09:13, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi
>
> On Thu, Dec 19, 2024 at 12:35:14PM -0800, Patchwork Integration wrote:
> > Dear Jacopo Mondi:
> >
> > Thanks for your patches! Unfortunately media-ci detected some issues:
> >
> > # Test virtme32:test-virtme
> > Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0
> > Errors Found!
>
> The reported error doesn't seem related to this patch
>
> Cannot open device /dev/char/81:20, exiting.
> FAIL: the vivid module failed to load

It is definitely a fluke. virtme64 worked fine. Jut to confirm I rerun
the job and it passed.

Thanks for reporting, i will keep an eye on virtme to try to make it
more reliable

Thanks!

>
> https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/68463424
>
> Am I mistaken ? I would re-run the job to make sure it's not a fluke,
> but I don't seem to have permissions to do so.
>
> Do you prefer I open an issue to track this ?
>
> Thanks
>   j
>
> >
> >
> >
> > Please fix your series, and upload a new version. If you have a patchwork
> > account, do not forget to mark the current series as Superseded.
> >
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/68463425/artifacts/report.htm .
> >
> >
> >
> > Best regards, and Happy Hacking!
> > Media CI robot on behalf of the linux-media community.
> >
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> >
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > to this message.
> >



-- 
Ricardo Ribalda

