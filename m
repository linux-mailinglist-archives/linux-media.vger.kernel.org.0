Return-Path: <linux-media+bounces-62682-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHF1GHKnEmot2QYAu9opvQ
	(envelope-from <linux-media+bounces-62682-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 09:23:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4545C1968
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 09:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8234E3011A74
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 07:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FB2383311;
	Sun, 24 May 2026 07:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dE8ooRRH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A140A291864
	for <linux-media@vger.kernel.org>; Sun, 24 May 2026 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779607402; cv=pass; b=OWGSV47+1934HFKuktU47adCugtGhBgZnbt2hF/VCo6+fg6ZiocGhWHa2POMw1ZFyojX/ogvD5xhiFQ2peT+wuWS0hGQQ5Jt/Su+ahldgh2GNispFIOJjk+ub2hS5EimDTvoLtOVgJBeOjvc55HetbvzOidcHGp5Ovi106HmbVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779607402; c=relaxed/simple;
	bh=7SGY90ESZhDKBZjYdLm+wenBWRsBb5KaUv6sWMXvU0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=memeemtg0axgfTrojMIBueT06ABPWoEXcPleuhiFz2BpCiOqmz7h7Omw0cAIrJJTmBVk4OsIeNrwg4WLh/EoyIyQrwBotq5YwT5kMlhOyABgALw3/Z0Y6hH12JHQFJdRr6m+B3DpENZbm2AujghmdC2Tf+AONOz/K5pASnoe0UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dE8ooRRH; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6530287803cso8699167d50.1
        for <linux-media@vger.kernel.org>; Sun, 24 May 2026 00:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779607399; cv=none;
        d=google.com; s=arc-20240605;
        b=jaiYGjxkDH2Jhi96ftwK/F9WfKnqZtj+1tB4C3/9sQCf+GDQgcNzagTkfBsFSfASaj
         cnkryzQMCJsIMz9nHBGXckzFg+ClFstub32clkcCqy9ecxiT0Yj+gRuEUCFjWEECrW69
         h3xoG8jlRGQ5s/0kVj5cN9U+chJ7gcN0mcijvf2CIVw4e7Qtu2vVivpoEv+5n2UXvLvo
         0QBE2avb/ulrIdNBTAUUB1jiEyijHk8nvfOgGFxb7qH8LVYxJrTqTxeDmYv1nBsUYLj1
         9Bwc27TVKbP+Y3vUIldc5BW0RQprJdMAzD4r9FbqdLZ5Ar3gKf5Iryv9+BR/dzdwlTQ0
         dl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yPCvf19yWs94jav7KY35MhMzx06nIOaRkBVL7LNAliE=;
        fh=qzESl0+7XphqsJYeSs1Km5AepHcZh4oPI97SB63kIA0=;
        b=WwTKmxgu+kP0708/22sU9Zitr1ugzImTv/VIG54tevkR6Dz60g1erwx0xXllvprkY3
         DKHfYef9qv71wdaPiq15a8YU+2xC+cAL2T//P73FPO1STciOdifLvSYwAa1/5rV4QuBn
         8tBZpeBTVEVdISTEbFtWgAFCkxNuRmPDpSfOTqb17ht0hLMzEzJHNy+iZNWo+zw/W3GI
         3VHBbjVUyco1xaUHqkakhleJ59Rqwz+yBJK1pViN8CSfDaRfsyYnPBGT7fswpQ1R7seX
         EOOBidnmvzkKmadlK+6RY1pqaFMFBCkEQOoHuPpZtV7yMY99ZiB4LpZ760XiLG0bkxsu
         myIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779607399; x=1780212199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPCvf19yWs94jav7KY35MhMzx06nIOaRkBVL7LNAliE=;
        b=dE8ooRRHRwtKiwrhYrzZzQ/bdbQ88wksSi4o0DCJaUDMujOx3ni9b9rzl1/2AYJ3WT
         ee58V695ua0GExh62NfP/9Vp1WeHH1PbP7vyzuh+/4LSdp7s+9qY1B4F0nXfUjycMXgE
         PhpPGeA5zQTgdj28i4ow4ay0ReITd1r4cX46bu+PN0PXlZVrh0lLtQr+15rj2qnSAzm6
         OUhblYOK+edFXvqa2MpsS8E252hbsSBQMCUbkozn/AId2d44WtxFhEDi+qsEGsLj+o4o
         MBAOgb+TcJUAW0qOLRyUDfIuoolJXTM7zzvKg3NL+IGUMU62RyH1lKsc1IfyVfOEMmOR
         NfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779607399; x=1780212199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yPCvf19yWs94jav7KY35MhMzx06nIOaRkBVL7LNAliE=;
        b=jd/T5P6me5iplqcTwRyXAm8Xf6Wft2FIW2zBR3qe/fS8hG7M2ENoaUaL/KXQwQkSyv
         TRnFjgvZSxRwZ2qvSB6x/XD8zE/Gowzv9+MbR1SNGKxjs99RnsaLp5GO41u58FoT3SHk
         y0WS6KN9uNkMWAISylMj+znnKPj254nsuTrS5GzbfG06KhRp7dkJQe7WSFUAMvFNqKr4
         av5cuZdV/cCgXkVJEnwQJwX268t+B1O4PZkhTJxRwGP3d6kEZSeAUz23UAMklA05YEAx
         FtcBF/kW3MGnePDIENJdQLhP3v5zwiTcz2S7AfvXwN7LKKXaLFN+/XPHA0RJMZYkqkN1
         w1eA==
X-Forwarded-Encrypted: i=1; AFNElJ/HklcgYolCHFsNHgmpWXs7Nr/mLqVx0FdvrpmXaXMBMT8ddP84GuMpnsVLrqu2eC9TFWS7y00fpFtEkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8yuGt8Yc8rTtn8dhQ+SePYfw5kVIN6DbrGiK7VxsU6GREv+jE
	1t6DnXTfm9XxJtChakHHY5/OmY3P/w4zbTXOGzphxW4ZjzNxZj0bQu4oVxfg70vShsTpcciGlBX
	liOLZSPyPCO8tmtrTdZZ98+baswcqed8=
X-Gm-Gg: Acq92OGQwZPisJmCrd5jHNtzRhRLO1RjxWLcUsgE2KT0aNlpa5PuUjZGUQgkVlJLfrD
	7Wk0Ewobqnq7h1bEqx69B2Yf/Ba3Xc7jmEJEhiVihC+pJFAmG7BMKZnyZAqaUWDwIFMCSsLI2aE
	lGl84pgKcV1EgSPTjkdEEwOTP47UcHM5QDwR0G7JavO7g5F4tx71+FYHGy8kzuuh/O/GzCBnbxb
	wPqTi/T4mzvyrMhh15XNhCZeL0IlF3MCx4eNAqCC9Hpod9LuB6IZQVMAa7yCWtVxvGSb8f5em54
	Mjbwsr/8BE+MHjGkjc7P5g==
X-Received: by 2002:a05:690e:4193:b0:653:1921:7199 with SMTP id
 956f58d0204a3-65ec9951d6fmr8315161d50.46.1779607399443; Sun, 24 May 2026
 00:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520090624.1071139-1-lgs201920130244@gmail.com>
 <20260520093421.GA215344@killaraus.ideasonboard.com> <14ab929b-f236-48cf-a022-f424fa1e0c1e@kernel.org>
 <20260520104816.GB215344@killaraus.ideasonboard.com> <00110771-c722-4208-a0e8-48819952e992@kernel.org>
 <ag2iy5fRlZJLYijT@kekkonen.localdomain> <20260520124123.GD215344@killaraus.ideasonboard.com>
 <14d99c12-2d7d-4f09-b805-e795c8051626@kernel.org>
In-Reply-To: <14d99c12-2d7d-4f09-b805-e795c8051626@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Sun, 24 May 2026 15:23:02 +0800
X-Gm-Features: AVHnY4L2S-iIGV1Pq5L6QQ8oqb_jxCfgu0KBISOU44YyKFboOW8dHVBdeXQ2QQU
Message-ID: <CANUHTR-fPnj5zK-+z9+d4HDaoE-KKu38aFYdqfybSVYQkriQog@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-dev: do not fire driver's release on
 __video_register_device() failure
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kees Cook <kees@kernel.org>, Ma Ke <make24@iscas.ac.cn>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62682-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,codebrowser.dev:url]
X-Rspamd-Queue-Id: CE4545C1968
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

On Wed, 20 May 2026 at 20:45, Hans Verkuil <hverkuil+cisco@kernel.org> wrot=
e:
>
> On 20/05/2026 14:41, Laurent Pinchart wrote:
> > On Wed, May 20, 2026 at 03:02:19PM +0300, Sakari Ailus wrote:
> >> On Wed, May 20, 2026 at 01:26:30PM +0200, Hans Verkuil wrote:
> >>> On 20/05/2026 12:48, Laurent Pinchart wrote:
> >>>> On Wed, May 20, 2026 at 12:01:46PM +0200, Hans Verkuil wrote:
> >>>>> On 20/05/2026 11:34, Laurent Pinchart wrote:
> >>>>>> On Wed, May 20, 2026 at 05:06:24PM +0800, Guangshuo Li wrote:
> >>>>>>> video_register_device() / __video_register_device() registers vde=
v->dev
> >>>>>>> with device_register(). Before the call the video core sets
> >>>>>>>
> >>>>>>>         vdev->dev.release =3D v4l2_device_release;
> >>>>>>>
> >>>>>>> v4l2_device_release() invokes vdev->release(vdev) as its last ste=
p, and
> >>>>>>> the driver's vdev->release hook is commonly video_device_release(=
), which
> >>>>>>> kfree()s the vdev that the driver allocated with video_device_all=
oc().
> >>>>>>>
> >>>>>>> When device_register() fails inside __video_register_device() the=
 core
> >>>>>>> does
> >>>>>>>
> >>>>>>>         put_device(&vdev->dev);
> >>>>>>>         return ret;
> >>>>>>>
> >>>>>>> which drops the only reference and fires the v4l2_device_release(=
)
> >>>>>>> chain:
> >>>>>>>
> >>>>>>>   __video_register_device()
> >>>>>>>     device_register() -> -E*
> >>>>>>>     put_device(&vdev->dev)
> >>>>>>>       -> v4l2_device_release()
> >>>>>>>          -> vdev->release(vdev)
> >>>>>>>             -> video_device_release(vdev)   /* kfree(vdev), free =
#1 */
> >>>>>>>
> >>>>>>> video_register_device() returns the error to the driver. Drivers =
that
> >>>>>>> follow the documented ownership contract release vdev on their ow=
n error
> >>>>>>> path, e.g.
> >>>>>>>
> >>>>>>>   driver_probe()
> >>>>>>>     if (video_register_device(vdev, ...))
> >>>>>>>       goto err_release_vdev;
> >>>>>>>     ...
> >>>>>>>   err_release_vdev:
> >>>>>>>     video_device_release(vdev);   /* free #2 -- DOUBLE FREE */
> >>>>>>>
> >>>>>>> This is the contract documented in
> >>>>>>> Documentation/driver-api/media/v4l2-dev.rst: the driver owns vdev=
 and
> >>>>>>> is responsible for releasing it if video_register_device() fails.=
 As
> >>>>>>> Hans Verkuil pointed out, the right place to fix this is the v4l2=
 core
> >>>>>>> rather than every individual driver, because drivers are expected=
 to
> >>>>>>> follow the documented ownership contract.
> >>>>>>>
> >>>>>>> Neutralise vdev->release around put_device() in the device_regist=
er()
> >>>>>>> failure path so the device core cleanup does not run the driver's
> >>>>>>> release hook. The driver-supplied release is restored before retu=
rning
> >>>>>>> so the caller can release vdev according to the documented contra=
ct.
> >>>>>>> Successful registration is unchanged, so the normal teardown sequ=
ence
> >>>>>>> continues to call the driver's release hook and free vdev exactly=
 once on
> >>>>>>> unregister.
> >>>>>>>
> >>>>>>> Fixes: 2a934fdb01db ("media: v4l2-dev: fix error handling in __vi=
deo_register_device()")
> >>>>>>> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> >>>>>>> ---
> >>>>>>>  drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
> >>>>>>>  1 file changed, 5 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v=
4l2-core/v4l2-dev.c
> >>>>>>> index 6ce623a1245a..73648549eb2a 100644
> >>>>>>> --- a/drivers/media/v4l2-core/v4l2-dev.c
> >>>>>>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> >>>>>>> @@ -1075,9 +1075,14 @@ int __video_register_device(struct video_d=
evice *vdev,
> >>>>>>>         mutex_lock(&videodev_lock);
> >>>>>>>         ret =3D device_register(&vdev->dev);
> >>>>>>>         if (ret < 0) {
> >>>>>>> +               void (*release)(struct video_device *) =3D vdev->=
release;
> >>>>>>> +
> >>>>>>>                 mutex_unlock(&videodev_lock);
> >>>>>>>                 pr_err("%s: device_register failed\n", __func__);
> >>>>>>> +
> >>>>>>> +               vdev->release =3D video_device_release_empty;
> >>>>>>>                 put_device(&vdev->dev);
> >>>>>>> +               vdev->release =3D release;
> >>>>>>
> >>>>>> That looks like a big hack. There must be something wrong somewher=
e else
> >>>>>> in the design.
> >>>>>
> >>>>> There is, unfortunately the design was wrong since the beginning of=
 V4L2.
> >>>>>
> >>>>> Documentation/driver-api/media/v4l2-dev.rst explicitly says that yo=
u should use:
> >>>>>
> >>>>>         err =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> >>>>>         if (err) {
> >>>>>                 video_device_release(vdev); /* or kfree(my_vdev); *=
/
> >>>>>                 return err;
> >>>>>         }
> >>>>>
> >>>>> So everyone does that. Luckily device_register never fails in pract=
ice (you probably have
> >>>>> bigger problems if it fails then just a double-free).
> >>>>>
> >>>>> The reality is that we don't handle this failure well at all, and t=
his change wouldn't
> >>>>> help in all cases either. E.g. drivers/media/platform/renesas/renes=
as-ceu.c actually relies
> >>>>> on the release() callback in that it doesn't call video_device_rele=
ase().
> >>>>>
> >>>>> But then it would fail on the v4l2_err(vdev->v4l2_dev, ...) call si=
nce vdev would be freed
> >>>>> already.
> >>>>>
> >>>>> There are probably more drivers like that. (drivers/media/i2c/video=
-i2c.c)
> >>>>>
> >>>>> I'm not sure what is wisdom here.
> >>>>>
> >>>>> See also commit 2a934fdb01db ("media: v4l2-dev: fix error handling =
in __video_register_device()"),
> >>>>> which is where the put_device was introduced in the first place.
> >>>>>
> >>>>> Perhaps that should be reverted instead?
> >>>>
> >>>> If we want a short term fix I think that would be better.
> >>>>
> >>>> Have you seen
> >>>> https://lore.kernel.org/all/aeCOdWLaVpH-5w8s@hovoldconsulting.com/ ?
> >>>
> >>> I hadn't seen it. Interesting.
> >>>
> >>>>
> >>>> Having an API contract different from device_register() will likely
> >>>> cause issues one way or another.
> >>>
> >>> Looking closely how the driver core works and what commit 2a934fdb01d=
b changed,
> >>> I think this might fix it:
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-=
core/v4l2-dev.c
> >>> index 5516b2bbb08f..6ffd385e880f 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-dev.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> >>> @@ -1071,25 +1071,27 @@ int __video_register_device(struct video_devi=
ce *vdev,
> >>>     vdev->dev.class =3D &video_class;
> >>>     vdev->dev.devt =3D MKDEV(VIDEO_MAJOR, vdev->minor);
> >>>     vdev->dev.parent =3D vdev->dev_parent;
> >>> -   vdev->dev.release =3D v4l2_device_release;
> >>>     dev_set_name(&vdev->dev, "%s%d", name_base, vdev->num);
> >>>
> >>> -   /* Increase v4l2_device refcount */
> >>> -   v4l2_device_get(vdev->v4l2_dev);
> >>> -
> >>>     mutex_lock(&videodev_lock);
> >>>     ret =3D device_register(&vdev->dev);
> >>>     if (ret < 0) {
> >>>             mutex_unlock(&videodev_lock);
> >>>             pr_err("%s: device_register failed\n", __func__);
> >>>             put_device(&vdev->dev);
> >>> -           return ret;
> >>> +           goto cleanup;
> >>>     }
> >>> +   /* Register the release callback that will be called when the las=
t
> >>> +      reference to the device goes away. */
> >>> +   vdev->dev.release =3D v4l2_device_release;
> >>>
> >>>     if (nr !=3D -1 && nr !=3D vdev->num && warn_if_nr_in_use)
> >>>             pr_warn("%s: requested %s%d, got %s\n", __func__,
> >>>                     name_base, nr, video_device_node_name(vdev));
> >>>
> >>> +   /* Increase v4l2_device refcount */
> >>> +   v4l2_device_get(vdev->v4l2_dev);
> >>> +
> >>>     /* Part 5: Register the entity. */
> >>>     ret =3D video_register_media_controller(vdev);
> >>>
> >>> This mostly reverts 2a934fdb01db, except that we keep the put_device.
> >>> But when this is called, vdev->dev.release isn't set yet, so it only
> >>> frees the device-related data (device_release in drivers/base/core.c)=
.
> >>>
> >>> Am I missing something?
> >>
> >> I guess this could be workable. This way the caller knows the release
> >> callback won't be called.
> >
I may be missing something, but I think the proposed change could
still cause a driver-core warning.

With `vdev->dev.release =3D v4l2_device_release` moved after
`device_register()`, the error path would call:

put_device(&vdev->dev);

while `vdev->dev.release` is still NULL. Unless either
`vdev->dev.type->release` or `vdev->dev.class->dev_release` is set,
`device_release()` will fall through to the WARN path:

WARN(1, KERN_ERR "Device '%s' does not have a release() function, it
is broken and must be fixed. ...",
     dev_name(dev));

See:
https://codebrowser.dev/linux/linux/drivers/base/core.c.html

So I think the object still needs a valid release path before
`put_device()` can drop the last reference. Delaying
`vdev->dev.release` would avoid calling `v4l2_device_release()` and
thus avoid the double-free, but it may trade that for the driver-core
=E2=80=9Cno release() function=E2=80=9D warning.

Maybe the short-term fix still needs a release callback that keeps the
driver core happy without invoking the driver-provided
`vdev->release()` on the `device_register()` failure path.

> > I think it's a short term hack at best though :-( If the device core
> > requires reference-counting for struct device, with a requirement to
> > call put_device() instead of just freeing the structure, then anything
> > that embeds a struct device should do the same. That means exposing
> > video_put() (which should probably be renamed to video_device_put()) an=
d
> > calling that in the error path, in the caller.
> >
> > We may also want to split video_register_device() into
> > video_device_init() and video_device_add(), but that's a separate
> > question.
>
> I believe that would be the right approach long-term. I actually started
> on that once, but very quickly ran out of time.
>
> Regards,
>
>         Hans
>
> >
> >> Regarding error handling, the return value from
> >> video_register_media_controller() is ignored. It'd probably be good to=
 fix
> >> that in a separate patch though. I could submit one as well.
> >
>
Long-term, I agree with Laurent that a `video_device_put()`-style API,
possibly together with an init/add split, would make the lifetime
rules much clearer.

Regards,
Guangshuo

