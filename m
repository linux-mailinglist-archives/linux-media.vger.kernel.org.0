Return-Path: <linux-media+bounces-34924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75CADB20C
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E6F23A39CD
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBBE27605A;
	Mon, 16 Jun 2025 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NwOGIKPE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540352BF002
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080710; cv=none; b=Nf+WlewnMbKtLaf5s3JGLByuJbccc2kqRNWTwSGnAuSU0k0K0vR+ccKG+TUa6fjjVY1RcY/VTrXCW3cTlBOifQ5jtRAMP5liGTO51ulzbVgJXAvg0W/e15R8Vfm7SQZyC8av1velKtweIboVo7afTafDSvsEhwByQ7jYgPZ+9Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080710; c=relaxed/simple;
	bh=m0xDa9ZTBRWR3WEPuMDj1p5g5v0dW/WC0ZmNJsPiMFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHaruBaAdNlq7PqA7oc164r2YClEbD7k8ki/DwgSjjV0/heoIy41/hOKB4chz2+TXIu0lyQOH2AG6vnDORZVizG3DKr7yMyCPoCkQcyy9YbPB6toZtikPUqM4RMG9e44Pfp3AVb+qLGhe80UKmwiRot3bkAhG93HLPgFAnJbSDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NwOGIKPE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553bcf41440so1546516e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080706; x=1750685506; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cFZjyKywdT02PV/9aLASI1hk4Et6724oI1TOwqTcszM=;
        b=NwOGIKPEYuzWIp/NDuJtBPUmgDoUXgRbbsjsSyUIPFLCtT5Zw+PTXX/0zcaKgRX6eo
         EmAzUd/nQ1L+2Mo7VYhVRzhSVqyUqgtxlCnqPq/f3m0FIIc1PQAaJJQBl70lP6dAgby4
         xQHXcftfjrZtKav2+Z3SLyei+uZDy9QEWgA4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080706; x=1750685506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFZjyKywdT02PV/9aLASI1hk4Et6724oI1TOwqTcszM=;
        b=JLBlP4UV2/PM3pmNH8FvDL6Oco+slArZil85+Bm2QVc1Qb7qLMQ5pMzVz43+Swekyd
         hybeXGyNmtK3S1G4CHEDdjrp4cyB+D0Ibt7oaqqFdZdn2qasHWyQrJ/d782VQvULb+XZ
         ESVMu7rJCKlwfvufzeic9HgUGv9V8FWkZG+mLZUwuOhEidpd13UYYPOEnobPn97/uyGv
         LCfMETfXbiZ4nWPpiDH66e3gIiGE86gzEILcY+lgtZ7l66K50aQyyWTPEmZAjxDCsUng
         ZdvI63R+7dnHkd913tgfbxHyGJR/JnDyBDHJx+mT4HP50C/x4VI9eeQUsqEBt2USlQd5
         2T3g==
X-Forwarded-Encrypted: i=1; AJvYcCUb50F6x1nFrPuA4QDCpUix9H9aUD4v7Dk6AR8W2vxHfQ/RTQS2vEUnLB4iceKOH/SZIdY9hbzPdllhAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbeh62hQ1k+LnO+pLY4g2GJtV27I4hxm2VerC+rtXKofz/jiyo
	Os1xut9Ho+p+NmqEv6IYBKiwKeaG+Szs22xMMzOyg8VoNJbbdzoZB4WRX0kBvBmY6aQZ92cpQTT
	LQfc=
X-Gm-Gg: ASbGncsk1oDBOTJsxlufVzs2yJy+O+IDo5F0INIpVO4AWcbL60TLAoQPCqUh6PcGnE1
	QPOhXK1akrtVN5aifzvWeog47tGSBqpfQP35HtcItDEO8tB6Q01n2nDT13AZbvsqXCSEHF9KdQz
	FZ3T1rsBf3UnjZpsMTCANKNWwpSNPu2wheBYoy+yFFU+jCbBwSeedvEr3s5BXGGhg5uNcgUvcmQ
	30qe2Xuwl66B1dIhqSPBr+U/ts+72fM60rtgjPw+LPrAxPL0vZQ29uiKY9f6w52kAKo8tnUQRZs
	UGpPfjHrzg7ljvkIvZzJLKz9h9VLihbD/1E5MFprVk6r/EPYe/HpIrt31CZSrwrYbHHeTejYmve
	cEQbTB0+wJK+5LG8JZcZN4qHgDoXeby/40HY=
X-Google-Smtp-Source: AGHT+IE2HpDJihAYREQkTk0JwUWGH0GHOhP7rjODu/LsxETIB9p7SD3rGkqGXjWO6gQGZlo0rgXNYA==
X-Received: by 2002:a05:6512:10ce:b0:553:35f5:7a90 with SMTP id 2adb3069b0e04-553b6f0ad03mr2155083e87.28.1750080706313;
        Mon, 16 Jun 2025 06:31:46 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f8177sm1546804e87.240.2025.06.16.06.31.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:31:45 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553bcf41440so1546458e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 06:31:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkFtO1JbTDAHjkFzfCjDfk2DodlQqn/71KpJ50zGMrfT/U9Azgs8oiyLmDrNQzqAC0cuqQC//KvaN+Kw==@vger.kernel.org
X-Received: by 2002:a05:6512:33d0:b0:553:ac33:ff24 with SMTP id
 2adb3069b0e04-553b6f4e754mr1978325e87.55.1750080705035; Mon, 16 Jun 2025
 06:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
 <f9275079-842a-406e-8bb7-b22a22b7c7e6@kernel.org> <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
 <b78cde8b-23b2-48c5-b8c6-b935a403963f@kernel.org>
In-Reply-To: <b78cde8b-23b2-48c5-b8c6-b935a403963f@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:31:31 +0200
X-Gmail-Original-Message-ID: <CANiDSCuPP+EOCps0gjH_bpJWsbyJDBcD+NoOeTB-sSUjUr0=Sg@mail.gmail.com>
X-Gm-Features: AX0GCFsixqfKOBEpaXaDDSaZt4bOT6_Z3RDRodQ_BZOXv0uKrUSHZfq9BTHf7jM
Message-ID: <CANiDSCuPP+EOCps0gjH_bpJWsbyJDBcD+NoOeTB-sSUjUr0=Sg@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: uvcvideo: Enable keep-sorted
To: Hans de Goede <hansg@kernel.org>
Cc: Hans Verkuil <hans@jjverkuil.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Jun 2025 at 15:26, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 16-Jun-25 15:22, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > On Mon, 16 Jun 2025 at 15:05, Hans de Goede <hansg@kernel.org> wrote:
> >>
> >> Hi Ricardo,
> >>
> >> On 29-Apr-25 15:47, Ricardo Ribalda wrote:
> >>> When committers contribute quirks to the uvc driver, they usually add
> >>> them out of order.
> >>>
> >>> We can automatically validate that their follow our guidelines with the
> >>> use of keep-sorted.
> >>>
> >>> This patchset adds support for keep-sorted in the uvc driver. The two
> >>> patches can be squashed if needed.
> >>>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>
> >> I've no objections against these 2 patches, but these need to be
> >> rebased on top of the latest uvc/for-next. Can you send out a new
> >> version please ?
> >
> > I was waiting for HansV to say that keep-sorted was useful and then
> > add it to the CI.
>
> Ok, so should we drop this series from patchwork then ?

If the series does not bother you too much in patchwork let it stay
there until HansV replies to the makefile series.

>
> >
> > Right now it is probably just useful for the Makefiles and uvc.
> >
> >>
> >> Also for patch 2/2 can we not just add the 2 keep-sorted headers
> >> and then actually run keep-sorted to auto-fix things ?
> >
> > Do you mean removing the annotation after running keep-sorted?
> >
> > We can do that, but we will be unsorted again in the future after N
> > patches unless we add it to CI.
> >
> > If we do not handle this automatically I do not think that there is
> > much point on this series.
>
> What I meant is only add the annotations and then run something
> like:
>
> keepsorted --auto-fix drivers/media/usb/uvc/uvc_driver.c
>
> and submit the result as a separate commit. Assuming that there is such
> a thing as --auto-fix. The reason for this is that if the sorting is done
> by a tool there is last chance for it to accidentally break things.

keep-sorted can work in two modes: fix and lint.

If HansV finds it useful I will refactor this patch with the extra step.

Thanks :)

>
> Regards,
>
> Hans
>
>


-- 
Ricardo Ribalda

