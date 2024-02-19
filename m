Return-Path: <linux-media+bounces-5428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E885A725
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 16:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAD56282251
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 15:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E4339840;
	Mon, 19 Feb 2024 15:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XHLkdsFR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6731B381CE
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708355633; cv=none; b=AtXo/6vQ9dqJDYHwdP5YNHxw4Z28dWlZjlqgXQfzm86eVvOVsL0aarUa0bMYJMSXNAkboq0mNRGjtdmlDYvpna4p0rA0BrlS13NziNdH8wNphJCsHV7uYg2g6x3/3xQuKDIbThhas1ohAk7Ux3Qu3TopL3rC+fI2+Z9R5gi2/68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708355633; c=relaxed/simple;
	bh=KMXslpEu/8HD8HCC5Kf31taCUsV+DerQdmJgOo4z//Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bKb1UPeloE1nC9t3Vi8yBezvVbXeocWXfxnp7ZJBzjG/ve185+nfS3b1xqsk+yZkLxjDUo5rz/5yUSK1HwX/8YZ06HD7TgGuyivUzCpn2/q7ZQUb6uUKguc7NK5YGQu0wlZPn0K0+HVqBN4Aw82SLBIjcZgWVd0DvglFm0Nycv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XHLkdsFR; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-68ca1db07ceso29150036d6.2
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 07:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708355630; x=1708960430; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OOBPJAb082VtuNzjGfp3LwJ+/PnS72KaIK5i7r+LyKQ=;
        b=XHLkdsFR2XUFKlxViYel5XTUkWWZFrIlMDbbru/yKPQeCkjEi2hg+r5n3/vKJol0Bg
         F8mHv8TlVlIz3nw/jDA5gAxrJvQyR4I146mkw44Ka4a2aD72sAjxsu7v1hC69SePupSA
         61q2oS5svw9LpIsZN3m2f0lMK1XX+isqgSY84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708355630; x=1708960430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOBPJAb082VtuNzjGfp3LwJ+/PnS72KaIK5i7r+LyKQ=;
        b=dxxX7H2NmIturzC0/JEGWFqjcHE17nMuLNAypFHIP1ON/p1QfOhj8Uu1ieETCC7VZT
         u2rOUq9yi1CPTIU2iM8ZNLqQVTpaYn3G4GOKiL/SPj3EMElUqgszkC5+tXeFyravhQf6
         DSHOk/KDGCUHNqchyB4ix12TL9dBvViw0EoJ5uz6XnoEA8/JkS759Bw0vFe5gTZIJ9O+
         CqPWTWJmQHGg69l+vxU9mdChDXPqIqN4IsarGqaaVXEEHi8ergyqHBJ422gnzCi4qeWB
         lDWA4PvInG36JnUocG8nOQ5rCuYkajo4LRszh8KZeelMZTcvjuCRtG+On+7rJ/AscdPD
         0l8g==
X-Forwarded-Encrypted: i=1; AJvYcCXyYckiLJeZaaKdOk+OdhjMsQOjiNsrGn73aT0sA3l1BKGJaXbBTKPcEtfOV+3WJHu9FpsyS9lGkpR0Q4a/61mThu7GsjcXbxLG2to=
X-Gm-Message-State: AOJu0Yz97HfzIIcANbzydsn0ShenMHvS0wFVo4FQghH0ZZLBgvRCxEVI
	KABe5ss4s8Bk4aj7VtDZJOGhQ+r3e9nshOuwfbsBZ2M2V/hdFsDsC3m9au+ivmg+GPo2m+mUwy4
	=
X-Google-Smtp-Source: AGHT+IF2ZDzSnIMbNDOytum8vJTP/iISffWI5phUeQ0Wnl00jFu9DZfbWZrTT/kYTjs6gl3VmujHCA==
X-Received: by 2002:ad4:5cab:0:b0:68f:3ae9:284 with SMTP id q11-20020ad45cab000000b0068f3ae90284mr11174664qvh.14.1708355629797;
        Mon, 19 Feb 2024 07:13:49 -0800 (PST)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id oh8-20020a056214438800b0068f5a422773sm2181104qvb.14.2024.02.19.07.13.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 07:13:49 -0800 (PST)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7872bc61fcdso201719885a.2
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 07:13:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlxxndtAHuWrPhQ5uu1ijECWaMdWaSw+YqNjbM2oux6YP+3JfJ42XR+Y8Zq7z9IAT/P4JE5vRLgE3h/HXhzbUERXfIHNiDLx4F35s=
X-Received: by 2002:a0c:e0d2:0:b0:68f:2ac1:99fe with SMTP id
 x18-20020a0ce0d2000000b0068f2ac199femr11694403qvk.45.1708355628695; Mon, 19
 Feb 2024 07:13:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108-rallybar-v4-1-a7450641e41b@chromium.org>
 <20240204105227.GB25334@pendragon.ideasonboard.com> <ca89eb86-a566-422c-9448-d8d5254d54b8@suse.com>
 <6aade777-d97c-4c65-b542-14ce5b39abb6@rowland.harvard.edu> <20240213104725.GC5012@pendragon.ideasonboard.com>
In-Reply-To: <20240213104725.GC5012@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 19 Feb 2024 16:13:31 +0100
X-Gmail-Original-Message-ID: <CANiDSCvqEkzD_-pUExT2Aci9t_tfFPWusnjST5iF-5N9yiob4g@mail.gmail.com>
Message-ID: <CANiDSCvqEkzD_-pUExT2Aci9t_tfFPWusnjST5iF-5N9yiob4g@mail.gmail.com>
Subject: Re: [PATCH v4] media: ucvideo: Add quirk for Logitech Rally Bar
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Oliver

Would you prefer a version like this?

https://lore.kernel.org/all/20231222-rallybar-v2-1-5849d62a9514@chromium.org/

If so I can re-submit a version with the 3 vid/pids.  Alan, would you
be happy with that?

Regards!

On Tue, 13 Feb 2024 at 11:47, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Feb 12, 2024 at 02:04:31PM -0500, Alan Stern wrote:
> > On Mon, Feb 12, 2024 at 01:22:42PM +0100, Oliver Neukum wrote:
> > > On 04.02.24 11:52, Laurent Pinchart wrote:
> > > > Hi Ricardo,
> > > >
> > > > Thank you for the patch.
> > >
> > > Hi,
> > >
> > > sorry for commenting on this late, but this patch has
> > > a fundamental issue. In fact this issue is the reason the
> > > handling for quirks is in usbcore at all.
> > >
> > > If you leave the setting/clearing of this flag to a driver you
> > > are introducing a race condition. The driver may or may not be
> > > present at the time a device is enumerated. And you have
> > > no idea how long the autosuspend delay is on a system
> > > and what its default policy is regarding suspending
> > > devices.
> > > That means that a device can have been suspended and
> > > resumed before it is probed. On a device that needs
> > > RESET_RESUME, we are in trouble.
> >
> > Not necessarily.  If the driver knows that one of these devices may
> > already have been suspend and resumed, it can issue its own preemptive
> > reset at probe time.
> >
> > > The inverse issue will arise if a device does not react
> > > well to RESET_RESUME. You cannot rule out that a device
> > > that must not be reset will be reset.
> >
> > That's a separate issue, with its own list of potential problems.
> >
> > > I am sorry, but it seems to me that the exceptions need
> > > to go into usbcore.
> >
> > If we do then we may want to come up with a better scheme for seeing
> > which devices need to have a quirk flag set.  A static listing probably
> > won't be good enough; the decision may have to be made dynamically.
>
> I don't mind either way personally. Oliver, could you try to find a good
> solution with Ricardo ? I'll merge the outcome.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

