Return-Path: <linux-media+bounces-47241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E09C5C67AEF
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 07:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7E43935CBBC
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 06:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7228D2E6CBC;
	Tue, 18 Nov 2025 06:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AbVftUoQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E954283C8E
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 06:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763446878; cv=none; b=ZYqL2xgu5ABs/MIlGq5vD9cJiV2neFwA/HszAmRvc7kg4Pzctec88O50NpQpC4T2T5w378eEmQtotgg1IyLy+Z1IQu/MwBd/MFyIR+sXsHJeEoaAQsMCjSXArzicdWUdXekHij07zHuLmxPe83zQVuAjXWuECQDZjpmUWZTgIWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763446878; c=relaxed/simple;
	bh=tI9jrttFMazrhVobC3V5rHm7G40u2hp8XylQEMfCIVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhDoIXOI3Vp3h5z0dgvI4MiFEQ0YKaVE9ds5SQu/jfZO8YOGn/8/13mLWJC4EloqhtQbaSzplvzb83c2NfKcR5kVYJVBlWE2IMjEJ5MJmg2pyOnNJ9yqIJHzblfeWDV23QhsS/Yprt76BJYdsnVyUwf6RFYveH6HPoFFy2ZULjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AbVftUoQ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a2dced861so55657181fa.1
        for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 22:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763446875; x=1764051675; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ysdjL08gT04Qik9gf3HpBRhQ7k22nSIylee/eFBrkkk=;
        b=AbVftUoQTzH0hssGlMzpS10qw+GXfgvmVbpbmtCNnxHPSgRE+BcWVMoHJPYxf2meEd
         Q0y3CeHkiCzJ+jCQhLIXbErEMdAjTUh4wb8EIqXHFlou3asn2beX4Tod92vi35ek8Lch
         iSGe0Kx1k5kOyaw3yqmjZwkhGACyEi5Ah4nlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763446875; x=1764051675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysdjL08gT04Qik9gf3HpBRhQ7k22nSIylee/eFBrkkk=;
        b=rQoyS170Ny6mfv136v5HWoMJpFAKu13utVB7yi58+gomkxHOc8FoedQjBh8CxQ2goi
         PwL/c3ah9RVdJkCegYZ0464FnZDnLkqRdyYHyrIzrktxKXwnh7UwXzrkZ3DGTdzL0+vx
         MvCy4cO3XceDn6zBrpKmvEUbIgsF5J3rLQ2Y0oJ1CUVAONXP8YtGwqOa2fh287mBJ40B
         F10uj1ClQ2XVlMkKjSNZyYyy+ZE9y8skh3Fl+FzhRsulqf1A9uxUZSNC97NQpyLhzFs7
         5lJL7RsB36ovT+viEwUn3zb0Ja7q0Q9lnwCJQ6ApCCLtahKpddFFUdeqg+jp1XlkRirA
         mfuA==
X-Forwarded-Encrypted: i=1; AJvYcCUUcbIN4RkWVvuQ5suyaImsYTkxuvuXUuSdv0b1hCMwe1ig/0GObNl7JAAdMZ6mT+NWT1fXJeVVDnQtuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMisEF9L7787jQNOIn/fgrgIf+B+Qw0XE4VLAiL0gDs3ii0KPt
	h+r9cvn1DCXdyMsvX7EKKigLK4R1qmSGu5PRJcewXcZBM4d6BihEc4KBK5Vechw3wwVmJ1r1+JN
	Q9yHyzg==
X-Gm-Gg: ASbGncsde/dzgVMjdzXqnK082JGHrqHcOsRp9QPCHxgFQkwzLl0j6FfYPLHwgFOgT9g
	epViit76fmJEtqokD5S6JkDV/so4fbiWktuDXMMsSjovn4ZCkQlGKaiKKseVsgVOL0G5oGvn4R7
	LshEJ3AweZoGKVxwhYwwGEreuZqxk/cgNGLX/WPXawaBqWkqsT6UdJLQEiY4Rw6PaEFxTQAhWZF
	HB2Mjl4Q+ERN7I0Uqe9C2tcNgPcoDQDMLuuehUqCYAvKZ4uACqL6qgZkfqvEw3jsMcVWx39086r
	ICrrl9NpyR6ODkzLwz04fjaKllzlFIdBe4L4aU+cJy6SltBiDPJYTwtO+SsTf2tXJwuqCuOHye/
	J/SYJCC72g21EzMn0c84OlbHVIxHhzptQbBxdtCtyA3+i6cPSvb9b0ohTOCO612605CitO9JC42
	E32RRlF9YK54bAm4RJq3qyszh7d4emfLIEe0TdO3bPHD02A7ZH
X-Google-Smtp-Source: AGHT+IGLfM1K54PHLJWm/TSjoHW0l8MbzhSOSMXuhVyI9WXoAPKk+9OUTFF2oyxjM1weTiZyNghuTg==
X-Received: by 2002:a05:6512:e9e:b0:594:773e:7631 with SMTP id 2adb3069b0e04-5959874a472mr694368e87.7.1763446875116;
        Mon, 17 Nov 2025 22:21:15 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b7a67sm3643319e87.43.2025.11.17.22.21.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 22:21:13 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so5417640e87.0
        for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 22:21:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHefKm7h6n1vc9r5jp5byST6dBZ2rlPdVXQC3MoyuVnSG9NimowRS8mKWAo8Ja+wwa64efMzVJ8lJvzw==@vger.kernel.org
X-Received: by 2002:a05:6512:800b:10b0:595:997e:19ad with SMTP id
 2adb3069b0e04-595997e1a79mr317744e87.21.1763446873332; Mon, 17 Nov 2025
 22:21:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org> <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
In-Reply-To: <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Nov 2025 07:21:01 +0100
X-Gmail-Original-Message-ID: <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
X-Gm-Features: AWmQ_blnmSAN7Cb6DNpvxZ2bsrbBZvCeN_Yn5xmI56Ol3gaqxpLu_duN8wDLPAw
Message-ID: <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
To: Gergo Koteles <soyer@irl.hu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Nov 2025 at 22:10, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Ricardo,

Hi Gergo

>
> On Mon, 2025-11-17 at 20:14 +0000, Ricardo Ribalda wrote:
> > +     if (uvc_is_privacy_mapping(xmap) && !uvc_allow_privacy_override_param) {
> > +             pr_warn_once("uvcvideo: Privacy related controls can only be mapped if param allow_privacy_override is true\n");
> > +             return -EINVAL;
> > +     }
> > +
>
> To really prevent the LED from being turned off, it should also be
> added to uvc_xu_ctrl_query.

Will add in in v2. Thanks.

I wanted to get the ball rolling first :)

>
> But why has it become so important after 10+ years that it cannot be
> turned off on Linux? What has changed?
> The majority of users use open-source software, they can view the
> source at any time.

Most users expect that the led is always on when the camera is active.
I think the usecases where the led should not be turned on are spooky
or very limited.

Even if you use open-source software, when it parses user generated
data, there is a risk for bugs. If there is a bug the only thing
protecting the security of the camera is the membership of the video
group which is a very low barrier. And once you manage to change the
LED behaviour will persist in other unrelated apps.

With the current proposal you need to actively enable the
privacy_override_param, which typically requires root access.

Regards!


>
>
> Gergo



-- 
Ricardo Ribalda

