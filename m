Return-Path: <linux-media+bounces-33405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B74E8AC413F
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 16:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBF797A539D
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DBD20F088;
	Mon, 26 May 2025 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PLQbcGYF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E55520F079
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269263; cv=none; b=M9Nej3mW+Sw49qXTE+GE2rX7Tn0B3ySyjxvHsu9ocDnTvpjWav8sio07JL1mVoMXRiAEE4b4zpWO5WeHheHCIQ5d7sVYdoMr1TeRADXXSTzJUqvBiUtuk65QlRAqB/q9MdgfNpLJWY2D95B08OcODXQy94OAfgeuMRRSVMw1GBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269263; c=relaxed/simple;
	bh=+GvBLwbPHR++3tn+n2fPvyA3fxxa/O2uiSFIuiOXqDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Km3XxaL9fYyw6NpXo05iz56Ve77KCudvf4XpOlkG5VYD/JWQK373RZzTXC3SbguMvdu5tpFcXefzOz95gQCIY44st+N1v4GYjDpg9ukYlOso+UuxcWCSfbyQ3yZbSBgtFd3LVU6hIejzx9IO6Os6xrSj+orvf7wqloZRc437o44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PLQbcGYF; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-552206ac67aso2707768e87.2
        for <linux-media@vger.kernel.org>; Mon, 26 May 2025 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748269259; x=1748874059; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iMWFOmADnSkPCqAEpOs4Z7SgARh/mv/ohxEMBVEoCkM=;
        b=PLQbcGYFiy1YWsw1PqQAWxIRXGXVi6HTHF4bMyYJhT8WPilzrRxnh1XMq4WJR5X+yh
         Zi9xm2h3yatJM6KY3O7ACnf5AGoyNccr6BYQrW827F07IY4Cu5SKLeyowY5D69pKscZO
         dKdOlPBN09zDIMO/mMB1pf6OKm+GD7Ld5bwv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748269259; x=1748874059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMWFOmADnSkPCqAEpOs4Z7SgARh/mv/ohxEMBVEoCkM=;
        b=H5mTZQr3sveh2K0wzKrW0gh0+KRrIjnB3CBmqnzIrR1+Wjgr0X+dTNfwgGzPiBU52N
         5yRy6EdE6vB3uCpGxb0u6EPpm/V4couQeIEzRCWRzr6JAfAwhFJwCnG3Dxbm5J/Ky1N4
         hklFt5lP0hZ47Y9nNtBLDZ1zH3Y4h8YJykQW8lSckGEvFgvUUZYfsF8V+vfqhoW6FybR
         D1xat8spz/X1/VuuSfHpGBacoAzkkyt0xgH+Wjton6V2TbChG/FjD5JrPAh1egyAD9HS
         r7iSbybQ5s7j6E4NXkTO7mfg/9Cmak2lBBgaR/eOG8RqR9WAYBBv458TmBYxssTUqTnz
         LyyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJEqqwLTBc0xu0d9gZZ+aML2OjwHXL+PmVZW61rUmcQBeUSQ1rO15RfzoFw46x6M0GbqKYBxfM3mpf/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz9/boz/uTMDH0TEWo8AfQKwaaYHinF/hYT1flTJl0cnPSshsB
	hZIOkkh2CMDBmoaASoC1WKxLMtVKa601EHCazIAv3tC+futR9CvQ/Wr/2ALrrJ4WxedICZedk3p
	/Gto=
X-Gm-Gg: ASbGncszY4E++RmZQ5JO2wdu8Ug2azVgQ+oVIu5BCln+lGyWTv2zrJsm3xpeRfqm3et
	NbXv5hvCsWI++4aXwDw3kv03Fam9NdzHWcWVvru4P5O37nIHCTWC+lirqO8mI1dftdu/hA/vtOW
	Gkln9Wva5nDzj23vr9fO+enBi8XyVc4cHihTBX4fTM/06Nyt/7oHP7Pn+TNVyvkTWzXCzCAIN/L
	EA9GUvzTHHvg3gXhPIf7WLdlKH7oRa06r9WDEQVeQcaFM0FEqgLS6/gIQo9NaLrnJoqSw8hAqsF
	BqgC5SnAdBueN/1XUbXM8j/J6U4jGZqcROvCoJYOdZB8WqkI8zcljVTFF7MoBjaa77wdjGzPrAn
	v7fiZZ5kywKIcBg==
X-Google-Smtp-Source: AGHT+IHND2JlyULQi6uhN9HLJfZ/MQ6V5t87ppVeVrpsGM0PYT3XxceuIB/PwQ7w9PPSzRsXQzZhYw==
X-Received: by 2002:a05:6512:2315:b0:54f:bce6:63bd with SMTP id 2adb3069b0e04-5521cbafdd6mr2379019e87.54.1748269259426;
        Mon, 26 May 2025 07:20:59 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532353553fsm407372e87.25.2025.05.26.07.20.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:20:58 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-551fe540b74so2615781e87.0
        for <linux-media@vger.kernel.org>; Mon, 26 May 2025 07:20:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjgz910XnzjcsjNwh3rzZU5RlpYO4oK1NgNfuaUbT6PlLGVI4oGOj0EgNlN1yejMIqInkLrTAiPJsdhQ==@vger.kernel.org
X-Received: by 2002:a05:6512:3b99:b0:550:e31f:1d2b with SMTP id
 2adb3069b0e04-5521c7b2c03mr2553491e87.7.1748269257163; Mon, 26 May 2025
 07:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-2-f79974fc2d20@chromium.org> <20250526134946.GN17743@pendragon.ideasonboard.com>
 <CANiDSCvPG_3qc4Emhat=NdRZXsmNDD0pwh182bXDFK2TgYN_ug@mail.gmail.com> <20250526141323.GQ17743@pendragon.ideasonboard.com>
In-Reply-To: <20250526141323.GQ17743@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 May 2025 16:20:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCvyBW2Zq6o2hbwQBOEPukryAgkqnfQhk7=zrdi7K5fF2g@mail.gmail.com>
X-Gm-Features: AX0GCFvNO8tsQGO1aHgP4sO3xXb2JpJ4EjmeQmbHw4vX4sNtOKkjz6mtFR1XHGw
Message-ID: <CANiDSCvyBW2Zq6o2hbwQBOEPukryAgkqnfQhk7=zrdi7K5fF2g@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] media: Documentation: Add note about UVCH length field
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 May 2025 at 16:13, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, May 26, 2025 at 04:04:03PM +0200, Ricardo Ribalda wrote:
> > On Mon, 26 May 2025 at 15:49, Laurent Pinchart wrote:
> > > On Fri, Apr 04, 2025 at 06:37:35AM +0000, Ricardo Ribalda wrote:
> > > > The documentation currently describes the UVC length field as the "length
> > > > of the rest of the block", which can be misleading. The driver limits the
> > > > data copied to a maximum of 12 bytes.
> > > >
> > > > This change adds a clarifying sentence to the documentation to make this
> > > > restriction explicit.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > > > index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
> > > > --- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > > > @@ -44,7 +44,9 @@ Each individual block contains the following fields:
> > > >          them
> > > >      * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
> > > >      * - __u8 length;
> > > > -      - length of the rest of the block, including this field
> > > > +      - length of the rest of the block, including this field. Please note that
> > > > +        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
> > >
> > > "the this value" looks like a typo.
> >
> > Thanks! Will fix in v2
> >
> > >
> > > > +        never copy more than 2-12 bytes.
> > >
> > > Are you saying here that length can be larger than 12, but only up to 12
> > > bytes will be copied (when both SCR and PTS are present) ? If that's the
> > > case, it would be better to fix the driver to clamp the length value to
> > > the number of bytes actually present in the buffer.
> >
> > As the documentation says, this is an exact copy of the UVC payload header.
> >
> > Assuming SCR and PTS, for devices that have metadata length will be
> > the real length provided by the hardware. but buf[] will only contain
> > 12 bytes.
> >
> > Replacing the value of length with the actual value will be a uAPI
> > breakage. I do not think that is a very good idea to change it,
> > considering that this number is used by parsers.
>
> Do you think there could be userspace code that relies on the value
> being larger than 12, even though the metadata after the standard UVC
> block isn't present in the buffer ? Are you aware of any particular
> implementation of such userspace code ?

Userspace code can use a value bigger than 12 to know if the actual
metadata has been enabled or not.
I have been using that to test my code.  I would not be surprised if
there are more userspace implementations like mine.

There is no reason to break uAPI, especially when it is documented to
behave like that.

This patch is just a clarification of the documentation. I would have
loved to have that clarification when I started working on metadata.

>
> > > >      * - __u8 flags;
> > > >        - Flags, indicating presence of other standard UVC fields
> > > >      * - __u8 buf[];
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

