Return-Path: <linux-media+bounces-20641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9AE9B7AA8
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 13:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36075B24857
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 12:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14B019CC26;
	Thu, 31 Oct 2024 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EmXQ1pQh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409B19C562
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730378169; cv=none; b=HGCRIUJ7cjXOUGntapN0SKSZijmJ/J1r2JsIhT1PFna483IIld9WdY6IWqdZr7qGxvqKRVrTIv6mZmbNB7BpMc8RzhwIrQXNRbuAuofju9GQ66QoqTYstw4LQxIGEXgkX1qZE95bx0+gaU6KLOFeMPe45ajdnQblSEVBDioqL4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730378169; c=relaxed/simple;
	bh=4uwkVsQZvvqLQLxsIsC4lLN11JwhnBdlvKpaa8vPrLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gpjwlp4hrCPaW0CXy7OHOySKTVYCcGETLT7FY/Zz2LvmFOKwg5dJZSByyTdLO6TtYrWez/Hj5x3KQnUEKEz1pWZ0eps20LVQnL9o8k4s33+J/VCGIRVsGss0ed8JkLfaax8tB1IUCsT7xZD4NKvB+ievb+P43yQkDZiell1AgdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EmXQ1pQh; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so1011283e87.1
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730378165; x=1730982965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uwkVsQZvvqLQLxsIsC4lLN11JwhnBdlvKpaa8vPrLo=;
        b=EmXQ1pQhDbTJMi4oh6mk2p9N40oMLpGG0jbd4/qTaact2POtLC94Z9ajkn0fZNWVis
         x/uhIma3ojqaqA8JtzNLE8HE6/IPNpesny9Se63VuXxt0juI0s9uem1do+dvSwhsi/c5
         mEqeIhBIWgjSj9DQ1QHCHU/TK9w/NxCCBGwLYGdk+rpLQY0MsimszJYIPToIusz8eFrO
         nvmnfUtxN3LYfupdkmCX7y68LnwS7HgZ3X19LO6UJ+br6jKEQgutaq9EHJz2vdwYd0ps
         FfvR162Gq5tF+vkUu0rutz+0lWc8AyWAjW4tpn+5xiuGqWUJFCpsvxH8KZNengivOgNo
         Y8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378166; x=1730982966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4uwkVsQZvvqLQLxsIsC4lLN11JwhnBdlvKpaa8vPrLo=;
        b=nXWR29JnJWua3j+oruVOQCl2rNA03tTb9/wXebpagKYY9RpDWPklno2YuePYtKJDuy
         G1reYv9KbDvboQUtth4T/X09w2zExAixkJOvhvAChF4xiML4dXhze6ZtdcD9l6Y10Uov
         NL116d7SCsE/4f+9PTmETutFSrON3YJ1lfP9mWIdWber+X0hKWtTMmgzq2d35cmKXfpn
         iDZ3w70RBRWRuO4hkupsKicYwAmfEMADU0qJvurI3RCuC1qWtc3980Euu5Sdhj2T8W+n
         mV3ulQ0MkR13YxpmGPaWiuZZvAECTAHOuPq3+rwaC15MgnMqFjf+UZgLGgEltRoFXKV4
         vfVg==
X-Gm-Message-State: AOJu0YwNOtixi0W8oJlLy4hxt7CwwxL8jbyMnX+1DmB3jZy5+HzC6KTt
	zRDnTrbH6sbn3qos0iGQ+bBpVVPR4UW5TFkhldKowpbk+yGw1VegBdbtzUquTwbu8uvi3ey1alk
	4Hu08in8+lYw29/XTFU9Jj0TfPi68YbpC/ym2QAs0Zpv7bmsW
X-Google-Smtp-Source: AGHT+IHNGrsHIdVJ7b6kXn3eII7y5YvEBUfd6Ol5F2YiZyvgHAMgu5KWjMQpJ+oEkjLbS7Z07yQmFjWPUy3H2QOB0UA=
X-Received: by 2002:a05:6512:3e26:b0:539:fbfe:418f with SMTP id
 2adb3069b0e04-53b348deb5fmr10872826e87.32.1730378165562; Thu, 31 Oct 2024
 05:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018131351.70563-1-brgl@bgdev.pl> <671279a4.020a0220.206dc9.0907@mx.google.com>
 <CAMRc=McnFLVeBOV8rcfL+A2PsF_dY0C7OP8DOhqwwgU9OpoZBg@mail.gmail.com>
 <CANiDSCs4tzZywh9je5DfN4x4p4V5HAFkJ6zP62oOOpno-keVWg@mail.gmail.com> <CAMRc=Me5u7rc9JmWKcKUU1uYyC-Bwy99b++K3djeSnNyDmX6nw@mail.gmail.com>
In-Reply-To: <CAMRc=Me5u7rc9JmWKcKUU1uYyC-Bwy99b++K3djeSnNyDmX6nw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 31 Oct 2024 13:35:54 +0100
Message-ID: <CAMRc=Mc=L_xnXgoSyeALV80qo-h2BhCya39McdZ4SOeBrUXhZw@mail.gmail.com>
Subject: Re: media: v4l2-core: constify the class struct
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, patchwork@media-ci.org, patchwork@linuxtv.org, 
	Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 10:05=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Fri, Oct 18, 2024 at 7:26=E2=80=AFPM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > Hi Bartosz
> >
> > It is indeed. Sorry about that. We have already landed the fix.
> >
> > Sorry for the noise
> >
>
> Can this be picked up then?
>
> Bart

Ping

