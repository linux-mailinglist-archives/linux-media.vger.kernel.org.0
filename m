Return-Path: <linux-media+bounces-5455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB385B1FD
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 05:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D43D284DC5
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 04:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0605457306;
	Tue, 20 Feb 2024 04:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kJ/phHWP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAFB5677D
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 04:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708404629; cv=none; b=LKgiCBhTC2UR/EwA77zJ3lXY1i8cf5MXOnKOfhqkb920MCdAF0TCTdz5QZD/YAzn1PYKdVHWdTa1rrTLxoxmk/6HzrRTUjpfPP7IWubr8MC3Wy5xUspS5fdgylPzjYKuZrt5i9DRbZg2fVSCTZv5xhklrZOCzwdbtR8ilK62HHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708404629; c=relaxed/simple;
	bh=gnYTVEhLa2UI/BXFUj5DRblz/ShatFGmeSySyZRlwEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4CHSAsLnCjmSrg8Rl49jQiKsa1b5lIgFAFHwnNfFEGpCg1Qp8YYH6TxpvW/IGVSVbjuxt/PjuUSIeLU0t8ldYt6CDkWd0E8s56yywQB7NsgHQj10LKNtPEsL7memBuAgXc1pBWmlwxNeB4A3GQNFxOStFaY2BSsQLk5YFvcVYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kJ/phHWP; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3ee69976c9so79736166b.0
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 20:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708404590; x=1709009390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBhO9GN51pgFt/DHFo2a0IcTSs/s3/od7X4R5TK/fL0=;
        b=kJ/phHWPfMdbwH0yo3aHTKlJQBZslvsniIY4q7aOO9tjUAs74hdSNQpwbVrLq8zIVj
         aovF/FXmmcwuXI6dtISQNyWxUBmqrcgN8NhmDol+/vxszpACo7FssKQnlPeJsQAj5y4p
         6PXudZAP6O8bPThU1WjL2L33KHb6JFQMZguG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708404590; x=1709009390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBhO9GN51pgFt/DHFo2a0IcTSs/s3/od7X4R5TK/fL0=;
        b=ftomlVjOVZRlMhZ0/EQumdEa1lmtdJckGv0vyqjqXzb9SxpiUOTIn86IfLgtyPSeu0
         0/+N240FzXRKPFHXrLv1nnvVpy/Y6ZymI01Qi5Kl6cnqzF981TFrU4Yusgrw7I4CShyH
         CAVwUb4OaEAFXBQrDGl7+MmvUafWfboNfyQgXIiXJ4R7kG8G1uppLBVxavqr5oiQfP+2
         WRcFX/1P9cBxJpg3nn1PU/m53qIoB24ng6mqFFbbMijGr8yiehk+wlRjQybZuuJOsCzi
         AlAbkaD+MM/fs+wk+kj8nidFXvX0ui1qA8qGBD2rmucczpwL/RcxJYz81w8bsCU/1BYY
         qkFg==
X-Forwarded-Encrypted: i=1; AJvYcCXAbjO2TQ+kakvcJiDAhBQt1TcSsxJ+nsFcvY5uvefgrpbNqeQaTVGvvlJrRx5bzW5bbhYInp3uGsyGeNIbuOKD1XPQ2v4Pe1kwNEg=
X-Gm-Message-State: AOJu0YzMY5/SFNNReoKSKCEBka97lREeImuwkJ3g19q7m4mP/0Z1u1b1
	RbPV1z2BTBI28va3yU6USX8V8rJDOl1nPEbtiIzUFeyTmq2vvVo/A22q/+BrleTj8rwP5fZ37ij
	qEw==
X-Google-Smtp-Source: AGHT+IHCuq8N6p6Ug/QSCEbX7smqvNsWvVekQmlO5q990hMLifLNYX7fvJoCYBY69cIi4pEa0DZtww==
X-Received: by 2002:a17:906:3c4f:b0:a3e:9a92:34b7 with SMTP id i15-20020a1709063c4f00b00a3e9a9234b7mr2689316ejg.58.1708404590038;
        Mon, 19 Feb 2024 20:49:50 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id ha1-20020a170906a88100b00a3d310a2684sm3557909ejb.158.2024.02.19.20.49.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 20:49:48 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33aeb088324so2640086f8f.2
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 20:49:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWN7yOsMnHuGpezp3PhQGr0Q9RBhGRPd4seKip1LL9EeLzClTgCf4vd2jYJcF0LENe2vEjjrj43p4rnpf98ohdcMUXdlGP3IZF+LPg=
X-Received: by 2002:a5d:44cd:0:b0:33d:3893:838a with SMTP id
 z13-20020a5d44cd000000b0033d3893838amr5261433wrr.56.1708404587902; Mon, 19
 Feb 2024 20:49:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <000000000000cb40790611bbcffd@google.com> <98b81fbf-4905-4b45-a8c0-33e7399ef84a@collabora.com>
In-Reply-To: <98b81fbf-4905-4b45-a8c0-33e7399ef84a@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 20 Feb 2024 13:49:30 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cs-eeHsCZ6VWrzChTJqd4FSqBS4z6ncd8tPQPNMdN68Q@mail.gmail.com>
Message-ID: <CAAFQd5Cs-eeHsCZ6VWrzChTJqd4FSqBS4z6ncd8tPQPNMdN68Q@mail.gmail.com>
Subject: Re: [syzbot] [usb?] [media?] possible deadlock in vb2_video_unregister_device
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: syzbot <syzbot+3b1d4b3d5f7a358bf9a9@syzkaller.appspotmail.com>, hdanton@sina.com, 
	hverkuil-cisco@xs4all.nl, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 12:49=E2=80=AFAM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 19/02/2024 =C3=A0 14:10, syzbot a =C3=A9crit :
> > syzbot has bisected this issue to:
> >
> > commit c838530d230bc638d79b78737fc4488ffc28c1ee
> > Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Date:   Thu Nov 9 16:34:59 2023 +0000
> >
> >      media: media videobuf2: Be more flexible on the number of queue st=
ored buffers
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D166dc872=
180000
> > start commit:   b401b621758e Linux 6.8-rc5
> > git tree:       upstream
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D156dc872=
180000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D116dc872180=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Deff9f3183d0=
a20dd
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D3b1d4b3d5f7a3=
58bf9a9
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D13ffaae81=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D13ef909c180=
000
> >
> > Reported-by: syzbot+3b1d4b3d5f7a358bf9a9@syzkaller.appspotmail.com
> > Fixes: c838530d230b ("media: media videobuf2: Be more flexible on the n=
umber of queue stored buffers")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction
>
> Hans,
> I think the issue occur because of this part of the commit:
> @@ -1264,7 +1264,7 @@ void vb2_video_unregister_device(struct video_devic=
e *vdev)
>           */
>          get_device(&vdev->dev);
>          video_unregister_device(vdev);
> -       if (vdev->queue && vdev->queue->owner) {
> +       if (vdev->queue) {
>                  struct mutex *lock =3D vdev->queue->lock ?
>                          vdev->queue->lock : vdev->lock;
>
> but I wonder if the correction shouldn't be to remove usbtv->vb2q_lock mu=
tex in usbtv_video_free().
>
> Any opinion ?

That is probably what triggered the failure detected by syzbot, but I
don't think we've ever had a guarantee that owner is NULL in that
code.

Looking at the uvc driver [1], it doesn't seem to need any special
locking there (after all the vb2 code acquires them).  (It also
doesn't have the custom clean-up code that the usbtv driver has in
usbtv_stop(), but that's another story). So maybe all we need to fix
it is removing the mutex_lock/unlock() calls?

[1] https://elixir.bootlin.com/linux/v6.8-rc4/source/drivers/media/usb/uvc/=
uvc_driver.c#L1906

Best,
Tomasz

