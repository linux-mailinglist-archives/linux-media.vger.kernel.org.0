Return-Path: <linux-media+bounces-25458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CDAA23CC6
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 12:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DC6B1889AB7
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 11:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602561BD9C1;
	Fri, 31 Jan 2025 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E+1gkPp9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D601581EE
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322262; cv=none; b=HkPfBBGYEQdffHd5Oy8mYtjMJqRRRZlUJp7plEKQU/JIa7Co3GVHTH+AiDIlMSAFl6Zlx0VqE7vuWsnw1x7R6qwgxDnHYvN9QaQabpdpG3SnIhSzOAYrpW10c+ZB2LvmoSQMBRx1BrbvNMO7+RwAxSPyy0HulDpQc4wspTwC/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322262; c=relaxed/simple;
	bh=p+r7k/z+xMMVitymwYVU6Xmxbntp3ZMh+nP8A/Txdro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbnDG3o90xfPiNexwOZ4jB226NckJNRIBKy8p7/ynvh80n5HphsbAyLUs1qIBMDgVQUjJV9L1mB58r3p53yzQ9S5VvDVnJ3zoTUCmavoxMAg9c3WAkmqozyb0UWfN5jfcI1LDtuwywLxb56kQMty/MaI2qkGU5bcz0RYxc0lp/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E+1gkPp9; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53e3c47434eso1980923e87.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738322259; x=1738927059; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=keq6BlocMBsxvhLU0XbFJHtKYJA8JSVZrOjXT8sGTvA=;
        b=E+1gkPp9pVc2zKudtdbBdh/lmYEOC3jx1fbs0PBMeucx3T34kfWm0okAjQZ1Pgddjf
         DOpmB+irYOlqKAVjJp2N0o5i77spCNjUIfNuXK/3OTvWOkGHRhFz3eanr+gtq9OpdAI/
         t6DbK69cfFkv4CNgzQUZavMinB/fSR2+3gUdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738322259; x=1738927059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=keq6BlocMBsxvhLU0XbFJHtKYJA8JSVZrOjXT8sGTvA=;
        b=dIkedLvNKqO4F5MxA2Mla6pvpgurusgfcoUrYviztWGnmXEE0Vqj2hL+/+ZDUAgzAO
         zdwV7roVi/VnSG/OYALD4jOTd6aNadBo6nzkH3WpkU9i44eCbkdlbxTqCQNLaw9QrFQX
         hO+4qEwhaIaWXl6LmYX+Z+VMWOW1QDqjRlJPnTBHJwJkqMpzMfEbsHpK3ROV6537sVQ1
         RyjE0QKoKDEfC+RI7RqnNMvLN3OSonrc2vjk59kRtz6YBYTVOsRHei5TBbW4A7DeVyPG
         VpKCR9VP4O6uR7yOFDOQ/KRlRq4E2crhY95AaU0FgzN1zQmhq5i3qINyQRWRK5VROanp
         oGRA==
X-Forwarded-Encrypted: i=1; AJvYcCV759XCPCNAtbUi4Ijfq4AtL84JfdfXl2s5sxpMa9q+TPOPenXhjReZMLcL0X6EXa9f54cVhihP9ZyY4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM3B8Z/ODnee7sEHAxgfUUbwbm921uHYGTgMB/FoV3btVvt2BH
	UEyCWFzeL8tStqfoqAYUynW+E56wm/+63eQF/AuyUvKEMT08d09rpauPgcwNHEHkHrH2G5jX1Ok
	=
X-Gm-Gg: ASbGncvsTJOR51IFAjMUWGsL/ZgXpWjyKxgdAbjSk2tazLsaywG2/2Q3mBszwBhDYND
	HnkMHsyjwyTsybBy3ssnun0pSbed61xTfUuSB1foeLXzU4xk0+5p9rqdJ2zvYGVCFqoEibReui8
	X5sGYzkTZXguzji9lon9AGp2mD5DPd9WA/7rb8JGbohUmiitQPdA/aJ4+YMShpwt2c24Y8pzuz5
	POhZy0ORMrFePAjtXmY6D2fp0Q1rJlMdl/nas0MomVwtnrwTi+kdkK4270PdW/I4oWjiIddmRCA
	LJVWzE4Vbqa3gXzi20H2lCkxNC5bkv6cNug2jd0TqLRgcMwXijaNkA==
X-Google-Smtp-Source: AGHT+IGMYXWXCd+1wPgjsQNNKWuu6Dv+nwNJt6+c8VMut2st3k3TnOSNImhTl4rolqqRGLCN9/oZpg==
X-Received: by 2002:a05:6512:1083:b0:540:2022:e3c6 with SMTP id 2adb3069b0e04-543e4c3256dmr2978665e87.35.1738322258932;
        Fri, 31 Jan 2025 03:17:38 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0aefsm444643e87.129.2025.01.31.03.17.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 03:17:38 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e3c47434eso1980903e87.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 03:17:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPIT0BW7hr2+LUolfyMHv8zN9AseDzULLVSMxEfrg6DDZbR/YklfpEY8Lmdls7BZeY/zYb9FlL7Re0TA==@vger.kernel.org
X-Received: by 2002:a05:6512:23a4:b0:540:269d:3017 with SMTP id
 2adb3069b0e04-543e4be9bf5mr4111267e87.18.1738322257805; Fri, 31 Jan 2025
 03:17:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z4aeK4Ct7L/9kR2H@quatroqueijos.cascardo.eti.br>
 <20250114200045.1401644-1-cascardo@igalia.com> <CANiDSCvx4QrAuhXgF51W+-B4XJU-6bxTd=5vCuw9SPmKXDXjdQ@mail.gmail.com>
 <CANiDSCu6ociHkyatMHpH5a2TDsMmHNr=f7-wvpwGDSTw=DKNhQ@mail.gmail.com> <6d67c5c2-be60-454b-b03c-ed89c74262b8@redhat.com>
In-Reply-To: <6d67c5c2-be60-454b-b03c-ed89c74262b8@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 31 Jan 2025 12:17:25 +0100
X-Gmail-Original-Message-ID: <CANiDSCvr2PVmzir-0NO3P_WaPMcbLj5xe9KWtxCB=+dQFuj8ng@mail.gmail.com>
X-Gm-Features: AWEUYZn8D-HtCm0F3QR8m1-_GSJSbCDAgsDiF25GxrwkwNhFw-sH-dzZ3Klx3TA
Message-ID: <CANiDSCvr2PVmzir-0NO3P_WaPMcbLj5xe9KWtxCB=+dQFuj8ng@mail.gmail.com>
Subject: Re: [PATCH] Revert "media: uvcvideo: Require entities to have a
 non-zero unique ID"
To: Hans de Goede <hdegoede@redhat.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, hverkuil-cisco@xs4all.nl, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mchehab@kernel.org, 
	linux-media@vger.kernel.org, Tomasz Sikora <sikora.tomus@gmail.com>, kernel-dev@igalia.com, 
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com, 
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jan 2025 at 12:12, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ricardo,
>
> On 31-Jan-25 11:04 AM, Ricardo Ribalda wrote:
> > Hi Hans
>
> Which Hans, me or Hans Verkuil?  Since this needs to go out
> through a fixed pull-request I think it would be best if
> Hans Verkuil picks up the revert directly in the fixes
> branch ?

Whoever started in v4l2 later needs to change their name :P.

I was thinking about you this time :)

>
> > We are seeing a spike of reports with the signature:
> >
> > "Found multiple Units with ID XX"
> >
> > Could you take a look at this patch? I agree with Thadeu that the best
> > strategy is to land the revert asap and when the storm disappears work
> > on a different solution.
>
> Ack, Fedora is getting some bug reports about this too. Since both
> you (Ricardo) and Laurant seemed to be on top of this I didn't take
> a closer look yet. But this definitely is hitting users and we
> need to fix this.
>
> Since we still don't have a fix yet we really should revert the commit
> causing this problem ASAP.

Hans (Verkuil) if Hans (de Goede) adds a Reviewed-by or a Acked-by,
could you take this patch to the media-committers/fixes branch ?

Thanks


>
> Regards,
>
> Hans
>


-- 
Ricardo Ribalda

