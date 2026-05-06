Return-Path: <linux-media+bounces-60516-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Fu9CkTk+mmGTgMAu9opvQ
	(envelope-from <linux-media+bounces-60516-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:48:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A774D6C20
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66472304F021
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 06:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63461367F32;
	Wed,  6 May 2026 06:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M5twUSbi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA7915CD7E
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 06:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050106; cv=none; b=hGOrYhABiZcnlxPvJ533TgAYstSDo/yWpPnpEMYpsKhH4itjcCcG2Dwk3WP+SrT97y4+/z7EZlxjWYK2B9sbcy7hVbVPkpL0Lhw6zdAC2i28EVZ68Y/glatNAwt1ad6Z5FRtMsS+w6MvgXWI+NAae2iWa0g1txrsxzrI/S4gEsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050106; c=relaxed/simple;
	bh=LhSvGl9W/KKKCP9MSidk7mBx9lQueEu4eXswW8xLEIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGXhd3GLFGWYyW+T+mi6w4y41aVN3R1LOvu7S31D/pGF9mfe8ui+O9Bu6mUZ/LwtkRZ6OiXOrTesI6EMcrVMkVYmFCT/L6BOkj252R7rIncL/nrW/9WWgM3AgO6J85Pu4zOflx/oYlcbDGHs3x5HB83Q+C1Csvoy0Ol15Xw/BNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M5twUSbi; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8ef45a6d9dfso666747685a.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 23:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778050104; x=1778654904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D7YZJ2T9vrH2LCVC20seo0hp+TbmDBG7DYUsWXJNUXc=;
        b=M5twUSbitmftbzkd/rGhLlEsG/6z/nHlfX0nUM7Gv/bYAd726ZH4T/3ktnjBAG2JRP
         ZOrWPsh8YoF/+yeLQEOaG4jsylqxZhtWLVZlzYMC5Jt+X8ZfvzrUDk7I9k8E/v30Kepg
         9Q9X93Ky8f0KW+D6MYR/SXpKg0CiUF9kbzG2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778050104; x=1778654904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7YZJ2T9vrH2LCVC20seo0hp+TbmDBG7DYUsWXJNUXc=;
        b=Njn8ye4Y2h2f2PCCFIIKfFPvN1ndVIckgQjZ9Ao41d8SDwwFc8lmPg/nPfgvyb8PMl
         tIuyIH7jspCegGPfltC7Gm4vN/O1Pfu+N7BQz0NOSjo2vetc/FmosCaUsd7S2R/VUsxn
         KBfOaW0NomRdRbI08J2wRJAozXd26FrI71rzthnOmxbRhFvXZqGilqdRX7xR1v9RQsao
         b8NiE9a0/ysxjquZOpp3FTIhXgIYs48yOdK6iix0Dtb0nTCcvzsbkcbAE0Ns5PAu+6G0
         L37UyJaSFaHqsoSrmzLUil5deNn5CNLg3Kk/vAw6BedZqQ+haF2idQCkIXdcbOjwRXCV
         N8aw==
X-Forwarded-Encrypted: i=1; AFNElJ86XVMC5UNbAYSpmv/rRJd3dXMbvkyGW8/ipKWFrxqbBLKwWbjwMaUYubdOgSfKFKI+2iUNsu6Z6I5LNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8V8+f8+XNK4whGYeRLYvQNf6nH1M2XbosYCTuNZqBA3hGAbID
	v8b+DQlvWC0xB7f9CkANQimMp7z53MqzjKbdjwQHo9JQqerL1qSIbUSncFIoiFx5S9t/ou05K1i
	l/6fBlpixccU=
X-Gm-Gg: AeBDieuaXGPF3hZ/U0lOJ9xzm07HJmSzDrhfXkaUs3p07+ywjRO8Sdgj5e69b0s2luN
	bvZ7vVG4UzCEHOqY9au9Chi3nApl2T5fKieO1qHuc0Pf++irfCoPnxAS5LQuGSLsjBgRj0WWnIk
	ctUjYHYIYgwfDT2+tHe0UhapNGf5MlbsyVJe6cq0oQNjNT+eWauPaqJCgd/3zEAU/4KOQWP3dyb
	Ai2T3v88yCenLD8brq29UQPozniN68eYOQiG3hGH1RIHtDg2ckzvXIvuq4zVa00LOoQ2Gi1PL1P
	towA4G62dCijlUNT5w8jr+Txf0LVLdMgdbixWx0WEuf/SEvaxcjc3shnuCPYe+KdsWQuNovS+2b
	+4mnQ88LQdo1fsjQJGQkDzk3CEe+/vR0iov6OC5z2BGmMlRgKum0wZpb6GCnoG0V4cq6fmlVrvr
	Yy+yTmzDawza6Du5P2f/d4xvq1JNgzA6lIAsv1cILGJUO0sEtT8Yemn6G58Bf4c3wC0kjvuSRGU
	ufiH/dRv4hDkQ==
X-Received: by 2002:a05:620a:4152:b0:8f6:4b59:9662 with SMTP id af79cd13be357-904d69da35emr314041185a.45.1778050103619;
        Tue, 05 May 2026 23:48:23 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc29a8161csm1536830285a.13.2026.05.05.23.48.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 23:48:21 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-512f750d4b2so27277591cf.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 23:48:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8WfYC+d3miLV2gos+n4Y3azSz3n0X7S3rtMgUYdwdrFa+W/+lPMOEAFoxe/UwuikXMv05hQgN+V2KbFQ==@vger.kernel.org
X-Received: by 2002:a05:6214:419c:b0:8ac:bb62:fe52 with SMTP id
 6a1803df08f44-8bc41cc2af4mr29802636d6.4.1778050100873; Tue, 05 May 2026
 23:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
 <20260504-smatch-7-1-v3-1-fda125c30058@chromium.org> <20260505231211.GE1598374@killaraus.ideasonboard.com>
In-Reply-To: <20260505231211.GE1598374@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 6 May 2026 08:48:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCtwPC1ihe5u=HuDG0f261zq76=TL90oMqfP8VQ6UK771g@mail.gmail.com>
X-Gm-Features: AVHnY4J42aU3-jcCECIuBLZjfOk-seTxlqhQXgH5fZHxR8TPIMUNJLay5gvAMmM
Message-ID: <CANiDSCtwPC1ihe5u=HuDG0f261zq76=TL90oMqfP8VQ6UK771g@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] media: v4l2-dev: Add range check for vdev->minor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 96A774D6C20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60516-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:dkim,chromium.org:email,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Laurent

On Wed, 6 May 2026 at 01:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, May 04, 2026 at 06:54:04AM +0000, Ricardo Ribalda wrote:
> > If the fixed minor ranges are not properly set we could end up in a
> > situation where the calculated minor is invalid. Add a check for this in
> > the code to make it more robust.
>
> If it was just for that, we could define the ranges in a way that could
> not lead to future programmatic errors.
>
> > This check also fixes the following false positive smatch warning:
> >
> > drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > index 6ce623a1245a..5516b2bbb08f 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -1032,6 +1032,11 @@ int __video_register_device(struct video_device *vdev,
> >       vdev->minor = i + minor_offset;
> >       vdev->num = nr;
> >
> > +     if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
> > +             mutex_unlock(&videodev_lock);
>
> I may get tempted to convert code to using scoped guards at some point.
>
> > +             return -EINVAL;
> > +     }
> > +
>
> I'm annoyed by the proliferation of workarounds for smatch false
> positives that generate useless code :-/ This is in particular is not a
> big deal though, so
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> but I don't want to continue in this direction with every new kernel
> release. We need a way to tell smatch that this is safe with incurring
> an runtime cost.

To provide some context, in this release alone we have found two "Fixes:".

Do you have any data regarding the runtime cost of these new checks?
Most of the time, the compiler simply optimizes them out, so the
impact is either zero or minimal.

The added checks make the code more robust for future refactoring and
serve as useful documentation. Furthermore, when false positives occur
in new code, they force the author to write more idiomatic code, which
improves maintainability. We have a deficit of maintainers, not
authors.

So, I DO want to continue in this direction. I am very grateful for
these static analysis tools; they truly make our code more
maintainable.

Regards!


>
> >       /* Should not happen since we thought this minor was free */
> >       if (WARN_ON(video_devices[vdev->minor])) {
> >               mutex_unlock(&videodev_lock);
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

