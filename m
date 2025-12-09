Return-Path: <linux-media+bounces-48451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0790DCAF0B8
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 07:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABCC1308AE10
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 06:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1F0320CD5;
	Tue,  9 Dec 2025 06:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NDiUBOPY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E75623D7F7
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 06:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261736; cv=none; b=ZbhHfWjQ+8y9OyB6jHk92CRm9APZCDrtjmj29XftLghp2GXNYNNBT9voZBj+snOjkUnAFK5z5ksJFyi4K45l+DfUJlFtPQvfoaC3/wtRXZZ1iTQxEN/RUlQ1j33KbVL21KefOjVpPrJ0eJML7flWC25u1eN7sKfXvoe4RkyAZ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261736; c=relaxed/simple;
	bh=o21OeCcpMSXqiy6l109fGpazt89ZHIZfzDr+2OI3mVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujbzhd0+x0LYQaNW4zJRbq4JU1P/M/swUcfNSBVAsvnrbjIq05k4ZvhrG9yQ7tIECcbKVCYUHXjGHjucm5V0mPzu2varQux0frKAQ/GM8/UpcWCz7Z+QiBca5JCHdupnaoHsSvRlj2/a8OjGCeMo9hzlrAOPG5X4/XeVMdxolZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NDiUBOPY; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37b495ce059so39291821fa.0
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 22:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765261731; x=1765866531; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rB9vH6GfGCQ5Uh4O3PvOJ7oJiIhZj5tXb1A5BcU3Lkw=;
        b=NDiUBOPYOfe01tMcidZw33IFG20NBK/jD5Bv+fyKaem3QyimPzCyBPwrBnpu+uOAE2
         zfoI71DRdkUDswP9yeRyPRqPXcwno2W1kwfPWYlG8ZwkED8FyVYMy8c/d2VNdo5GaFSW
         rcPQ5oxDBzxomTsVx1ghyT5htF78EOrt5iqPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765261731; x=1765866531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rB9vH6GfGCQ5Uh4O3PvOJ7oJiIhZj5tXb1A5BcU3Lkw=;
        b=Xb7lEJ6u9TxjiMYZJ+0R6p2SWMiuZKVy3Vrn7nZMETAnsNQFdWSHPGqLGmyCX4V2tf
         rlUiz5Nk9MFhf8MjAJ/oGo7B+QW9SPlXFTgaWKMc23jcKAE6tw3cTJlUbt6vEiB5vRfJ
         dRWY+6F53wmjIZ1PcAfSVkuldCi5dQ9Ke/B5owvZip9LHb7vkICnagX7sEruHk7SQNnG
         DIqwdJYFOPY2secaSDIz5rirbOJzSbq2DH+xTLsVZan/PmtCrYQEouM8h5gQCZPqgHol
         O4ZacXQ7vZTqUMjS7cX8ntRIVrU87PtZ1h/QE3KKFsrez3C0Q9dxG2dizadvTSTLxj/h
         37ow==
X-Forwarded-Encrypted: i=1; AJvYcCVk8eAmBHvhq0oBxOyVNTbDQtPYtGC2tO9/FY+ChaJUa5SLrORHwAzBdt2ZcqFYKucKmSNV5vXAd74J7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YybYlnCxBSG9tDJpI1/Gq/xfNJQ8sMPkVNycu9otlB5HXQEfOQB
	UhN3pn+KcF+wVMH8mTeeCviBraHC9pQVThTh0vzp9Z7Bxqq0G/q7wZWZhHOd4oxG3+uTBFX7iKD
	ggCwTVw==
X-Gm-Gg: ASbGncu4u0MGWYvS91ZDF2VNVqswAHDdf5TGWGHImODr2Uu18zsrbPR+cpkE6kNctD2
	7XM4kjgNKV6N+RXeyaRlmEHM0tdPND664DvougxYS36ksNQ1KkGBL/Yl/YFb8KDGjPaESsFRL9y
	dXBsLpqNKlCyssku5kjHU9lVQK/pwL0jBi/8MTIxO9OtOumfhg5cK/S3Qgv5aZcX++jR5GmOEx/
	cucDcTTsH5gkF4iGrEF9YlfvOUUE+ZXwB1UJr2OLfVHkaC4jUV7vUuGyAvtsfVxUkWplhXuyLxW
	lRH7ulbd7HXafi68Vb4HIEWFy5vZSsp7NqxspG3E+qj+Vkoz8DnRfWizyJw9csjUkU2gBriRdXU
	Dwaon3K00RZ+cfA1gdqxpeTmCSS+1+Mo5Vio1ePQnMoZI6kuSa7Sd7sezIR9OxeU8DHdbNKIrh9
	tuu2b+iLiBiWO/06PGaLXcLT60EdnPArKDFg6HviFli+RyU74ZnfgQg+Rnn3DXZKo=
X-Google-Smtp-Source: AGHT+IH5cA04q1zeKiec5OR+XbcylRwioFbUwzBd8jRRTH7G/btfXYoCP4dWlGTCp/ahc3Hla2Qb/Q==
X-Received: by 2002:a05:651c:2122:b0:37a:2e32:3200 with SMTP id 38308e7fff4ca-37ed206e537mr29790761fa.33.1765261731366;
        Mon, 08 Dec 2025 22:28:51 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6fe6be0dsm43561041fa.10.2025.12.08.22.28.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 22:28:50 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37b495ce059so39291721fa.0
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 22:28:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2oG0ff8O7TcTTMZk5v0fVvqgZv6w/6cMl/x5OWB++sK+h6kCmSVDzh+EAMxsYsAkokdKOaSv4cp3t+Q==@vger.kernel.org
X-Received: by 2002:a05:651c:254e:20b0:37b:a664:acde with SMTP id
 38308e7fff4ca-37ed206e751mr23810241fa.32.1765261729502; Mon, 08 Dec 2025
 22:28:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-2-0359ffb98c9e@chromium.org> <779a1a39-64f9-4985-b733-92f8673f3d3e@kernel.org>
 <1ea79ef0-ceba-43b3-9190-7a92c823e3d2@kernel.org>
In-Reply-To: <1ea79ef0-ceba-43b3-9190-7a92c823e3d2@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 9 Dec 2025 07:28:35 +0100
X-Gmail-Original-Message-ID: <CANiDSCsrAvwygBrQLsF9RVOUGpdOEaOhzE90=c2CrW8GGe6-=g@mail.gmail.com>
X-Gm-Features: AQt7F2oTMXSxrVxWaTdwxjdV3eXQ1UCAZ0KTGK0XH1r0FfGiriIuKbyKFP5Wx-Y
Message-ID: <CANiDSCsrAvwygBrQLsF9RVOUGpdOEaOhzE90=c2CrW8GGe6-=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: uvcvideo: Import standard controls from uvcdynctrl
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Manav Gautama <bandwidthcrunch@gmail.com>, 
	Martin Rubli <martin_rubli@logitech.com>
Content-Type: text/plain; charset="UTF-8"

Hi Hans


On Mon, 8 Dec 2025 at 20:12, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 8-Dec-25 12:02 PM, Hans de Goede wrote:
> > Hi Ricardo,
> >
> > Thank you very much for doing this, this has been on my own TODO list for
> > a long time, so it is great to finally see this happen.
> >
> > On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
> >> The uvcdynctrl tool from libwebcam:
> >> https://sourceforge.net/projects/libwebcam/
> >> maps proprietary controls into v4l2 controls using the UVCIOC_CTRL_MAP
> >> ioctl.
> >>
> >> The tool has not been updated for 10+ years now, and there is no reason
> >> for the UVC driver to not do the mapping by itself.
> >>
> >> This patch adds the mappings from the uvcdynctrl into the driver. Hopefully
> >> this effort can help in deprecating the UVCIOC_CTRL_MAP ioctl.
> >
> > ...
> >
> > Question what happens if uvcdynctrl is run after applying this patch ?
>
> Answering my own question here, we will hit:
>
> drivers/media/usb/uvc/uvc_ctrl.c: 3166:
>
>         list_for_each_entry(map, &ctrl->info.mappings, list) {
>                 if (mapping->id == map->id) {
>                         uvc_dbg(dev, CONTROL,
>                                 "Can't add mapping '%s', control id 0x%08x already exists\n",
>                                 uvc_map_get_name(mapping), mapping->id);
>                         ret = -EEXIST;
>                         goto done;
>                 }
>         }
>
> So uvcdynctrl will see an EEXIST error. I think we need to add an -EEXIST check
> to uvc_ctrl_add_mapping() )or uvc_ioctl_xu_ctrl_map() which is the only caller of
> uvc_ctrl_add_mapping()) and if -EEXIST is returned do a uvc_warn_once() that duplicate
> mappings are being ignored and return 0 instead of -EEXIST to avoid breaking existing

uvcdynctrl seems to handle this kind of error ok:

https://sourceforge.net/p/libwebcam/code/ci/master/tree/libwebcam/dynctrl.c#l1215

while(node_mapping) {
  CResult ret = process_mapping(node_mapping, ctx);
  if(ctx->info) {
    if(ret)
      ctx->info->stats.mappings.successful++;
    else
      ctx->info->stats.mappings.failed++;
  }
  node_mapping = xml_get_next_sibling_by_name(node_mapping, "mapping");
}

https://sourceforge.net/p/libwebcam/code/ci/master/tree/libwebcam/dynctrl.c#l1199
if(v4l2_ret != 0
#ifdef DYNCTRL_IGNORE_EEXIST_AFTER_PASS1
&& (ctx->pass == 1 || errno != EEXIST)
#endif
)

https://sourceforge.net/p/libwebcam/code/ci/master/tree/libwebcam/libwebcam.h#l69
/// Ignore EEXIST errors for the UVCIOC_CTRL_ADD and UVCIOC_CTRL_MAP ioctls for
/// all but the first device. This is required if the driver uses
global controls
/// instead of per-device controls.
#define DYNCTRL_IGNORE_EEXIST_AFTER_PASS1


(BTW, I think the last comment ^^^ is wrong, it should be. Ignore
EEXIST errors, or errors for second passes.
But I might need a coffee :P)


Looking at the debian codesearch:
https://codesearch.debian.net/search?q=UVCIOC_CTRL_MAP+-path%3Aioctl.rs+-path%3Auvc_v4l2.c+-file%3Auvcvideo.rst+-file%3Auvc_ctrl.c+-file%3Auvcvideo.h&literal=1

the only occurrence that I am no sure if it will properly handle -EEXIST is:
https://sources.debian.org/src/chromium/143.0.7499.40-1/chrome/browser/ash/chromebox_for_meetings/xu_camera/xu_camera_service.cc?hl=400#L400
But that is ash-> ChromeOS browser. I can ask the code owner to fix it
if needed.


I'd rather not add the quirk that you are proposing if possible. I
would expect that any/all the userspace handles -EEXIST because the
uvc control state outlives the userspace.


Let me know what you think.


> userspace.
>
> Regards,
>
> Hans
>
>



--
Ricardo Ribalda

