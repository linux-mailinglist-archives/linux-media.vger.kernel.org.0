Return-Path: <linux-media+bounces-33399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4DAC40F2
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 16:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BD54165C8B
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86C03C465;
	Mon, 26 May 2025 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GUPFIERq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFD91E1E12
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268262; cv=none; b=OmPyC5LOO/BWWwJ2Gki7EZk6i6JCz12I6b8M7k1XGYcyNTWZysJWCIN3DgGWS07CNqVrZ/UW5q9OqJYiK9jy49zyuUgeGWYOyr5B2mx5hn0cDbBlsiNplkdJhYfN3fEGPKy0EVsu/E1y1ltMFlGulAoHiiwbkoojybg6lAJfc9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268262; c=relaxed/simple;
	bh=ph8IzBD5aYSKzdcePSSh//PMBD+pbdghPU0Swt3H/Zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyArh1vNTBxpN0HTalQRJTGSCJezLjicNeqeDItvqp0m4r8lHjiabHAI1NXyESy60RRzz2vyJfcO9wV2p7opovxbJMRA4jG3rIct7cix8iq/YcHK6ceTmu9NSjhFAVfHXh3fZwlvC4O9j7O2yxt9o+dQXVCAMMoC0sXFOSwx7I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GUPFIERq; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-328114b26e1so14870051fa.1
        for <linux-media@vger.kernel.org>; Mon, 26 May 2025 07:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748268257; x=1748873057; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q1BjnRhRn4veSe+cpc/v/4Q+Md2q5st6ZbxmQhpMa2c=;
        b=GUPFIERqLhXLs+okbqDlb2SOXmr/53DWthFwVAzdsBqMObLY+1KXjdrv8GJJG8qgOc
         oIkHp3dtk8z7rHvIRxQk0NPhxxYzHB6AH2SdQ7ZqY69zI4rMvRVEaNNShfjC9xfBaRTZ
         aE9vt4C/9jIiqkCk5c7jCkxjfVU8SJebavCM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748268257; x=1748873057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1BjnRhRn4veSe+cpc/v/4Q+Md2q5st6ZbxmQhpMa2c=;
        b=V73D5tjRS515ST4M7lJ+GFYdncBaCEFEP76dJPck7V+VbSAbtxhyYUJ8hpbSb7GL6w
         5UzWgn0jYkjbosH59vPYzELqItlJc/cnp7JX7YEurBScnJV9IEKiqywEvQTYJTp/4Qh8
         48HtMa0F2j80q1T03x0aBcDDJV0d/oG0WqIlpJRX/YS6aZp/MRkGCCUr0Fp8Tr/wkSgs
         5AzWItDONrx5TMtrq3EJwchmLCWs8Ht4KB2Fgrxzc4ZI9TS/Y+hNBH4JxkaOU4xkRKNs
         k7R95yduVFQjGzm8aetAOWqUDAchrKWbDefL7lb6Iq/Hk0oo2Hgj6FId6hUXmXcXP+21
         21Eg==
X-Forwarded-Encrypted: i=1; AJvYcCULB/m08wpxIXpXY1Jar+igkKz5opNh0lGgChmpeSkekwcWU6vH1wS+LHGLijQ7TiUC7UVU+8HVKi55BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX0tzpZ/5HfMODVuOzf3C6MxPbMVzm0zQy9NxtTsZl0pm8Q6Zd
	wnFj3IcgOy3xP9z2wwDOkLRTlUQsGe69c7s178+ur9xNqBv5NOr0kdnuKKeGd3nHY/iYyAkqlzu
	HQQ0=
X-Gm-Gg: ASbGnctZe1GY0L3bFjYh9NdxXp/RG4sM+FksMds7QQ08tOCqQD49uG1JPknMBpjK0RM
	4xvhZRxvOEyxju2Ow/MM+qeUbacjGgyJxtOE2Fpz9WwwpFXrd4CCYHQbh+jTWV2KQAD0EvnwhZv
	CzR+x+f07N1JWdNeT43/FpEaFaJomgCXrQeuFmaVq5FsSUW9e8fGuqVaQyDpOBSMGR10KBKFQ6B
	2kpifsnC1jxwndNypIias6J0DBv9KadkNHAmXDYgvosuupvOfG0LvJ99GGZDQxi0dw0waNpMUvo
	ZHzb97sbQYjlw/CGA92URCGOWF65GB4VbopuYCBb0rK5RZztoE1dydIrCuYWmE0p4H+M7JYAVM5
	LrU1mV+0f8Is90A==
X-Google-Smtp-Source: AGHT+IEwWDtrhGuoECCdDjZnDu+9Ol+7PBSXvAyONYBFhq6LvKuz4gphDqdL39noAX94cg1J5CWq8g==
X-Received: by 2002:a05:651c:31db:b0:32a:648e:7ee3 with SMTP id 38308e7fff4ca-32a648e8087mr7068761fa.25.1748268257000;
        Mon, 26 May 2025 07:04:17 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a67300879sm1533181fa.41.2025.05.26.07.04.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:04:16 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553245cad29so733365e87.1
        for <linux-media@vger.kernel.org>; Mon, 26 May 2025 07:04:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJzmHLqUIy3SuxUHh6MqbC4QsR1fj3B3kqOWxbZkEyp4Kop6ez+yQbGQJR3SFk1JkYA3EmYf94bqdp1Q==@vger.kernel.org
X-Received: by 2002:a05:6512:b87:b0:545:60b:f38c with SMTP id
 2adb3069b0e04-5521cba4319mr2738618e87.41.1748268255880; Mon, 26 May 2025
 07:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-2-f79974fc2d20@chromium.org> <20250526134946.GN17743@pendragon.ideasonboard.com>
In-Reply-To: <20250526134946.GN17743@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 May 2025 16:04:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCvPG_3qc4Emhat=NdRZXsmNDD0pwh182bXDFK2TgYN_ug@mail.gmail.com>
X-Gm-Features: AX0GCFvLus6wSHUCxD3q_9w63GGCFq7D3IfeAgh7ku37JSUzb68p0H7rgIVZxVI
Message-ID: <CANiDSCvPG_3qc4Emhat=NdRZXsmNDD0pwh182bXDFK2TgYN_ug@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] media: Documentation: Add note about UVCH length field
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 26 May 2025 at 15:49, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Fri, Apr 04, 2025 at 06:37:35AM +0000, Ricardo Ribalda wrote:
> > The documentation currently describes the UVC length field as the "length
> > of the rest of the block", which can be misleading. The driver limits the
> > data copied to a maximum of 12 bytes.
> >
> > This change adds a clarifying sentence to the documentation to make this
> > restriction explicit.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
> > --- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > @@ -44,7 +44,9 @@ Each individual block contains the following fields:
> >          them
> >      * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
> >      * - __u8 length;
> > -      - length of the rest of the block, including this field
> > +      - length of the rest of the block, including this field. Please note that
> > +        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
>
> "the this value" looks like a typo.

Thanks! Will fix in v2

>
> > +        never copy more than 2-12 bytes.
>
> Are you saying here that length can be larger than 12, but only up to 12
> bytes will be copied (when both SCR and PTS are present) ? If that's the
> case, it would be better to fix the driver to clamp the length value to
> the number of bytes actually present in the buffer.

As the documentation says, this is an exact copy of the UVC payload header.

Assuming SCR and PTS, for devices that have metadata length will be
the real length provided by the hardware. but buf[] will only contain
12 bytes.

Replacing the value of length with the actual value will be a uAPI
breakage. I do not think that is a very good idea to change it,
considering that this number is used by parsers.

>
> >      * - __u8 flags;
> >        - Flags, indicating presence of other standard UVC fields
> >      * - __u8 buf[];
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

