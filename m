Return-Path: <linux-media+bounces-59859-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPjoKny/8GnSYAEAu9opvQ
	(envelope-from <linux-media+bounces-59859-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:09:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A75486921
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 166B531EB71B
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627CA3ACF1A;
	Tue, 28 Apr 2026 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hoQVzo7l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DB42BE7DB
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383475; cv=none; b=F6KkP6R7fex8Mu5HW3Syns14HnffgLN9l0ydqv+pJKMiaMGZ9qZu1QkYmiQxQ/SROtTtZ801lwfH0IY0v/ZauNxBGUTY+4fuYorDj1c97rZ8H4g6U/1U9Yl8dSZoHsmMJGRME6F3e8RN2Tzc88F2f5xoaXdcZJ36Dvxi+znZDpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383475; c=relaxed/simple;
	bh=SQHXDGhlN0CKDU05O67gYV+qSo6uKu9tcDe+F+cIKco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUSLFWY9tuASTfeTJhU15w8G0jM8U85w3QTSn/FmWEZ1U5TlAa6HiInRMkjj+I6fOlADChkAg2PxZQPltJ9oa/nmM201pXUAv30lh8UZ0oCdQLJyO5i0b/Z1Bdwew6q/Ddt4R+fa8go8UGfzEYvbLuwZX3C8iNdm827Clu1qc84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hoQVzo7l; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-677f7c29af6so10660581a12.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777383469; x=1777988269; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RHq5MBFE9EcTuWJZwxZrVzl/yev30bjkGe3MAVogf3g=;
        b=hoQVzo7lN6U0u41L8Li3BiELMWss3vH8h9bE04P64QxiajcbUn3U5MuqGuYWVP4L5x
         3EbGdNWavTbcSdP/x4QYWNpy2zItugayC8GCZYqkwF7ZDA4x25XyN/pNrz032Gu0E5yX
         PUbuxaNuMXMZ8gtseV1/Ayp3nf35YMtNhRJ0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383469; x=1777988269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHq5MBFE9EcTuWJZwxZrVzl/yev30bjkGe3MAVogf3g=;
        b=IaI5ZhYtApQHSv1lShJDeeczn8geHm5SZYM6KURhZeCTNM7hEZ2yuuygq+sbQh1hdp
         8uQTu5aILC8zwD3bNBgCbJsZ1R1aKtVDsKYwGRsHGT287Ofh+7W6LdJpJMRQmCImLYnl
         Dmwa/n5DUSGZ0olWHKF52YzGz1oPhmftopogpAbxMdVpMudtSPtWv60zBMKnK55ON1+K
         rrcygdPN639kx//0xYdpHGr3BKq8nxlRiCm5jUK4KhX3Twcu5uDPd0v/rUuOSoFAeTMm
         RF0BBB9RbYbroAkbGmuQ3P3dp3ciBi1v7aP4688MCmVsLdCdQxrlsMQ2j1yR8e4hg4Dy
         tM7Q==
X-Forwarded-Encrypted: i=1; AFNElJ95vdQq+BBtZqe/QTZcJzxYjry++V6wacE9BiJzRJdbLuJyEaLyJWfmIlmotxBZ2HxG4y1EoC8xBmcKGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPr+lrHlhtrAWs3lbv91SiXtDQF+GRdulehHYxo3VkbS+S0AO9
	tIrzSugubu6iV6rwkn70KiGG5I773AV4Y3Ocmy7Kw/zdoo3j6+Z3hszTPOZDiSm5f83+Chj6y6E
	x6+R9zt0A
X-Gm-Gg: AeBDietgsfDeNXswZ9xLN9SeROPJDfXU8KlNrsrv0q85w9ZMtW83IsmIXCR//BNA9or
	NCVvrqex2gSoUHnWN+R62Jbv7jIw7kwxzjm94XKxUHjeuQvP81oxBv21m/7d7V+COnkMIKLE+eP
	57QkFJcWtUF0iW7iT/4VmYSu+doxH578hHMATni2EKr5FXgkkyOoSiLqWmAhujJMx0EId/ge/lK
	mTdkllwq9IpJ3uos2t0DuIMWjN6pff4uZe9aLicqII/YdPFsRFOkkbrL47jKzOLSlYOKItcOhKr
	qx/g0IeXvEueGdI8I/l4bEtDYaaNVeLCljQwi+WjLnGG6zCi0sCF3yFlAfOqjeqFQ/VMa3mTBIw
	n4+11fOZKnKgCl+SJIcbBkHFlxuet1YR1XFusj0Dst3htsimR1uhjlzrq61H7lmQxFqCkbEMAIl
	inanDPXfqDrH2r9i9dH0Gm+QXgwK9gOlPDrZoH081PXfSHs9494T1uq3FCf1k8hJ8S5AEQn8o=
X-Received: by 2002:a05:6402:1e89:b0:674:37b7:227c with SMTP id 4fb4d7f45d1cf-679bb04a7f7mr1470465a12.2.1777383468775;
        Tue, 28 Apr 2026 06:37:48 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b67d5ffesm847181a12.9.2026.04.28.06.37.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:37:48 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso1687223566b.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 06:37:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8TsGNrlIv3CIrg69QEZXsDHXIaHil3b5maVLhd5EzBsoUAyHaITj0iFCOkV9ortM56EMKmMpZJRmGnqw==@vger.kernel.org
X-Received: by 2002:a17:907:928d:b0:ba9:2611:31e6 with SMTP id
 a640c23a62f3a-bb80100e760mr207203766b.6.1777383466155; Tue, 28 Apr 2026
 06:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-2-46890dffb611@chromium.org> <20260428132524.GC120836@killaraus.ideasonboard.com>
In-Reply-To: <20260428132524.GC120836@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 15:37:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com>
X-Gm-Features: AVHnY4I9JlmrxhVAZa-s9WvlzX0ziQwglaziYU7IOODauoNSlCyTGKWM9aV5MO0
Message-ID: <CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com>
Subject: Re: [PATCH 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 50A75486921
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59859-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,chromium.org:dkim,chromium.org:email,ribalda:email]

Hi Laurent

On Tue, 28 Apr 2026 at 15:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 28, 2026 at 12:41:08PM +0000, Ricardo Ribalda wrote:
> > The current code makes smatch a bit uncomfortable:
> > drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> >
> > Probably because smatch is not clever enough (yet). Do a simple rewrite
> > to make sure that smatch understands what we are doing here.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/mt9p031.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> > index ea5d43d925ff..5c9dff030b4d 100644
> > --- a/drivers/media/i2c/mt9p031.c
> > +++ b/drivers/media/i2c/mt9p031.c
> > @@ -795,7 +795,7 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
> >                       ctrl->val &= ~1;
> >                       data = (1 << 6) | (ctrl->val >> 1);
> >               } else {
> > -                     ctrl->val &= ~7;
> > +                     ctrl->val -= ctrl->val % 8;
>
> This is less readable than it was :-/ Is there a way to avoid the
> warning while keeping the ~7 ? Maybe by assigning

I guess it is a matter of taste. I find my version more readable.
Also yours do not seem to convince smatch :P


drivers/media/i2c/mt9p031.c:800 mt9p031_s_ctrl() warn: '(data << 8) |
(1 << 6) | 32' 16775264 can't fit into 65535 'data'

ribalda@ribalda:~/work/linux$ git diff
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 5c9dff030b4d..f9f51d5060f6 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -795,8 +795,9 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
                        ctrl->val &= ~1;
                        data = (1 << 6) | (ctrl->val >> 1);
                } else {
-                       ctrl->val -= ctrl->val % 8;
-                       data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
+                       ctrl->val &= ~7;
+                       data = (ctrl->val - 64) >> 3;
+                       data = (data << 8) | (1 << 6) | 32;

>
>                         data = (ctrl->val - 64) >> 3;
>                         data = (data << 8) | (1 << 6) | 32;
>
> >                       data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
> >               }
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

