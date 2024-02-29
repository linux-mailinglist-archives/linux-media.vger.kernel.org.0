Return-Path: <linux-media+bounces-6139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C2586C817
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 12:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC89B1C215C7
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 11:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BE17BAF1;
	Thu, 29 Feb 2024 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K55/xU47"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C4D7BB0A
	for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 11:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709206419; cv=none; b=sofTMnLhxWtmWDqQwO63CwQFB6kM9m+42JldWZ/401Xiolz8ogcMYMjIR1G+skWeYdSvuu5h9DXtuOc704Ej83ObUTCPOEGOF3iXW9CEtxmeRstzI8QheNzZU6+OjvSgfjFrJL9NKR9trm9hC+MQBWNGQsVwdvn2x74/e5lghlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709206419; c=relaxed/simple;
	bh=OdwXQtCzfRxqJt2/JOnHMtt1+ULlsFGxa5d4NtRnE9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLw55y6+b0Ckp6MJLxvFA2DcEbSplnZcF7A3qXuErr0IBCb8nRKRg0FmDt1elzZvx1DEOES0aq8R2UaDUha4dyTXt0Qy4noHMCrZhDno/ctBQfo88eKLG1D4+Rqx82UiaZT3FLtXEHrgz7VhAyGNAAzVXfZ9fBNBQExQiMBvrHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K55/xU47; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7c40863de70so39895639f.0
        for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 03:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709206416; x=1709811216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdwXQtCzfRxqJt2/JOnHMtt1+ULlsFGxa5d4NtRnE9o=;
        b=K55/xU47T4Fp6vR8BLaP79sd/JQLiFuyzD2QFh8xIZsTbEiZrlRvGYtHVlSoLOc+n4
         JdpcYXhe2UySjUYJKNaGL4MJpnVUmzSmwKqA671PMEdih7fTIsLC/4r82Ffpp2ElY2NB
         ZIHLH0UtZO9rr3sUE7LJbLTbRCf9aYjDQgUQnVtE2WlDLloAWY0Z86o/qiIOd3W7BDLt
         nDd18+O2URicNUJ0FJC8X/AVg+0GYvmdRcam8zvQxPgwaUjGUlPT3+5+DzbLLQ46b7VG
         QRw3iemzVnI5vJMDeU8CKKzK88xG9Hlm4iS6U1aZg2F3cLEUvdNe5/IN/jqx6sI5puQi
         cIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709206416; x=1709811216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdwXQtCzfRxqJt2/JOnHMtt1+ULlsFGxa5d4NtRnE9o=;
        b=YQH8x1F82hj0UWCr2bxzDMdqM8nTxcfXnFo7t2ZKW37RdfUG6UkQwGo7erQi2DD/NZ
         su6iPP/FM6LFoj4akjA3TLCX3lUrO9Gr/v9HEO/C9+Pwy0P3WUoCBq+MnFm84tcAj+up
         PZIamQkUKN+lPplJZOUE39JoT0qSGlvwdlAezW6mMa6GyyPzOaZS0w6w2Bb0q/ayOh9k
         icsgXDhrcdEaXmY9pq/BrmNY0t0fhPF0brMSQ28rAYh5gLiauC5RrSUCiy1giZN6TXDm
         hTb+8RrBugilpDxEF9vQEAQeyxeA7BPvfBa5PnNRHeyuoWw2um/soDtFoIC7CklUrEyz
         EjeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbII6Z6uZQALmxVBkdc/3vKuuqPEJnAid1SrZLpSwSTsBJdXTxKo7O0btO6KAkrvU1E0USp1pdJoxBl7IYGnWDuvFJKHil39tTtRM=
X-Gm-Message-State: AOJu0YyJUXEPi1c5NX8QYaBxAgCQ1uq/032DksfTzjY5UEhMeEIjkHq6
	eSqfKkecBmDcvCPP9Dt0VyzccRbGgLEK1AB42felKjHysnEQU/WnAtmUtOQ4Dnvw5q+NRkVDSe9
	hV32GB1zkC5pfsAhqVQ8ImHPYhs2HkIucY8sk
X-Google-Smtp-Source: AGHT+IEyR1QF0mvxlymN3UNZ9/6PJpld7SFPaZT8wcg31g8q4y/VVJDwXOdOLXwJcDBtzynOXQAaauZ5TcxpJAykKUM=
X-Received: by 2002:a6b:c98d:0:b0:7c4:9cb9:da3 with SMTP id
 z135-20020a6bc98d000000b007c49cb90da3mr1901383iof.1.1709206415733; Thu, 29
 Feb 2024 03:33:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com> <20240221160215.484151-2-panikiel@google.com>
 <ce262cda-84ba-4d8f-a916-76488c94066d@xs4all.nl> <CAM5zL5qrMNfyiXMOJHUzLySm_U2U8kbD=D_Cyn0WjkvpikiYpQ@mail.gmail.com>
 <03f65fbc-9cf8-4347-8277-e53cb01b00a5@xs4all.nl>
In-Reply-To: <03f65fbc-9cf8-4347-8277-e53cb01b00a5@xs4all.nl>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Thu, 29 Feb 2024 12:33:24 +0100
Message-ID: <CAM5zL5r5JtA2HojaYZkSfUvoMTSNWALQM8HVuuXq-Znu7+TvGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] media: v4l2-subdev: Add a pad variant of .query_dv_timings()
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mripard@kernel.org, 
	robh+dt@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	ribalda@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 9:02=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 28/02/2024 16:34, Pawe=C5=82 Anikiel wrote:
> > On Wed, Feb 28, 2024 at 12:25=E2=80=AFPM Hans Verkuil <hverkuil-cisco@x=
s4all.nl> wrote:
> >>
> >> Hi Pawe=C5=82,
> >>
> >> On 21/02/2024 17:02, Pawe=C5=82 Anikiel wrote:
> >>> Currently, .query_dv_timings() is defined as a video callback without
> >>> a pad argument. This is a problem if the subdevice can have different
> >>> dv timings for each pad (e.g. a DisplayPort receiver with multiple
> >>> virtual channels).
> >>>
> >>> To solve this, add a pad variant of this callback which includes
> >>> the pad number as an argument.
> >>
> >> So now we have two query_dv_timings ops: one for video ops, and one
> >> for pad ops. That's not very maintainable. I would suggest switching
> >> all current users of the video op over to the pad op.
> >
> > I agree it would be better if there was only one. However, I have some =
concerns:
> > 1. Isn't there a problem with backwards compatibility? For example, an
> > out-of-tree driver is likely to use this callback, which would break.
> > I'm asking because I'm not familiar with how such API changes are
> > handled.
>
> It's out of tree, so they will just have to adapt. That's how life is if
> you are not part of the mainline kernel.
>
> > 2. If I do switch all current users to the pad op, I can't test those
> > changes. Isn't that a problem?
>
> I can test one or two drivers, but in general I don't expect this to be
> a problem.
>
> > 3. Would I need to get ACK from all the driver maintainers?
>
> CC the patches to the maintainers. Generally you will get back Acks from
> some but not all maintainers, but that's OK. For changes affecting multip=
le
> drivers you never reach 100% on that. I can review the remainder. The DV
> Timings API is my expert area, so that shouldn't be a problem.
>
> A quick grep gives me these subdev drivers that implement it:
>
> adv748x, adv7604, adv7842, tc358743, tda1997x, tvp7002, gs1662.
>
> And these bridge drivers that call the subdevs:
>
> cobalt, rcar-vin, vpif_capture.
>
> The bridge drivers can use the following pad when calling query_dv_timing=
s:
>
> cobalt: ADV76XX_PAD_HDMI_PORT_A
> rcar_vin: vin->parallel.sink_pad
> vpif_capture: 0
>
> The converted subdev drivers should check if the pad is an input pad.
> Ideally it should check if the pad is equal to the current input pad
> since most devices can only query the timings for the currently selected
> input pad. But some older drivers predate the pad concept and they
> ignore the pad value.

Thank you for the helpful info. I will switch all these drivers to the
pad op, then. Would you like me to prepare a separate patchset, or
should I include the changes in this one?

