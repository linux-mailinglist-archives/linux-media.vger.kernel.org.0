Return-Path: <linux-media+bounces-3856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D17831867
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 12:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DB03284B6D
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 11:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA019241F5;
	Thu, 18 Jan 2024 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MAnaKp8m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CE523776
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705576996; cv=none; b=gf52oEB4UrOmsRZqr3xLTG3aQoheV/nIitT1/2pX9v07V0AgZDRrzq2DD3txqTyvlStcXEuMIFHN3c8weOQmPCfHgdCJJDqwZNJ8ucmjvHlNVaC2ANTenlAJY687G4k1H4I/i6FWZMqS9/fr8P+XWKvdmQd9s0B5P8tiXMjgrIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705576996; c=relaxed/simple;
	bh=3sL2EmU8cW4SsL2Qy7d1PwP+T0ksz+D0+24yHjcLJcI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding; b=XFNnsJLQPPirZ83nyNjYfRiPwYHdBuOaGV+EAHAQv7OuL/sAEFkkPxyzWHTp5W8y9xEFVOqYk83ypxzHFuwwNA2+Z80Q45YPV1hQWRi1uqHIDh/LhJgZl1CoGMqOs758lG7C8TwkDgWaTx5313z6xq42fHJQNePznrN/pKUZCrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MAnaKp8m; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55a356f8440so368797a12.2
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 03:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705576992; x=1706181792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qiEFj99shkY4wI4G2TO6hDOfA4IjYIaR73Xu8Zkp5w=;
        b=MAnaKp8mN17a2G1NCy4qTg1/WVYlDRNecPfBWGWQe8P1q2WmEY4yE1relBpHBsniVr
         /VSwVNtov7mNdN1KPwuIY3Q6FB7YQx8dWLHotg9pyN3Aj6WeaC9HlOaKaLWebLfyl3Aa
         dnWuluGL2SQPKBYVfcLFRUTbDoJ4inzy0CZUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705576992; x=1706181792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qiEFj99shkY4wI4G2TO6hDOfA4IjYIaR73Xu8Zkp5w=;
        b=Ujog1HZp7zApv2qTjZ0fO3EgHe71RHZMVlZ5ukTrNBZFHzSL04K8L8Gx8oWCr197cT
         2ATEJGvlhXxqMCEOv3LKGMaL0hyFgWEuVwsbFHfEHRiJrcnA58pLoSCFOVa/k+o3NW/H
         PvBq4fsz9jjy6hUwBJeq+jsfLMWYlPLQRok1MvSyZ7UTGPb4shCVjxw/vEFkgkwVuQtk
         LrzBcMCh+zjmQTm8Ef5Cx/8Zaw3ciHa4DslZ78U0AgD4vtfV/gUTwqtO9dBHojdtp5IU
         +Ca8ZOJTOYZvnJR4oTGypKCR/euYlkFicZaMYlEBhJ7GBeTaB/R4T0WamSGA0HlVN7CI
         BB/w==
X-Gm-Message-State: AOJu0YyTzKbfPDZpAVoRs2VbBQ4QNMW1H7ZrE3T2akc36dO0fAiyx8Ck
	y/iNBmPOnqT4ofItOC9xab1NjIZwMBvTCpd0GBcXHoxNe5xRvtmofkW58/hCKFH/cy4wPNhXs2U
	+tg==
X-Google-Smtp-Source: AGHT+IF6DFeJ49K0hlOud0leDo0wq9UHc1MEeAhHIz766VOTIQ38cMLSbbJSe2yloD31IHHEr+Tc0Q==
X-Received: by 2002:a17:906:5ac4:b0:a2e:cf45:5a10 with SMTP id x4-20020a1709065ac400b00a2ecf455a10mr427738ejs.141.1705576992373;
        Thu, 18 Jan 2024 03:23:12 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id z22-20020a170906075600b00a2ed534f1b6sm1916143ejb.221.2024.01.18.03.23.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 03:23:11 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-337d5aa5ef6so216972f8f.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 03:23:10 -0800 (PST)
X-Received: by 2002:a5d:658f:0:b0:333:c81:8f9d with SMTP id
 q15-20020a5d658f000000b003330c818f9dmr445080wru.2.1705576990413; Thu, 18 Jan
 2024 03:23:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240115170826.214519-1-benjamin.gaignard@collabora.com>
 <20240115170826.214519-2-benjamin.gaignard@collabora.com> <c832da45-c818-420d-aaf8-05c15c1e5426@xs4all.nl>
 <521a2a44-9ec1-4898-aca7-721d07e12643@collabora.com>
In-Reply-To: <521a2a44-9ec1-4898-aca7-721d07e12643@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 18 Jan 2024 20:22:53 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DWOZwm2E8BwfONtjrcg289wPHJEe3TMZKsBvDcn3OfNw@mail.gmail.com>
Message-ID: <CAAFQd5DWOZwm2E8BwfONtjrcg289wPHJEe3TMZKsBvDcn3OfNw@mail.gmail.com>
Subject: Re: [PATCH] media: media videobuf2: Stop direct calls to queue
 num_buffers field
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, m.szyprowski@samsung.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 6:32=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 16/01/2024 =C3=A0 10:21, Hans Verkuil a =C3=A9crit :
> > On 15/01/2024 18:08, Benjamin Gaignard wrote:
> >> Use vb2_get_num_buffers() to avoid using queue num_buffers field direc=
tly.
> >> This allows us to change how the number of buffers is computed in the
> >> future.
> >>
> >> Fixes: c838530d230b ("media: media videobuf2: Be more flexible on the =
number of queue stored buffers")
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >>   drivers/media/common/videobuf2/videobuf2-core.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers=
/media/common/videobuf2/videobuf2-core.c
> >> index 41a832dd1426..b6bf8f232f48 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> >> @@ -989,7 +989,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum=
 vb2_memory memory,
> >>      bool no_previous_buffers =3D !q_num_bufs;
> >>      int ret =3D 0;
> >>
> >> -    if (q->num_buffers =3D=3D q->max_num_buffers) {
> >> +    if (q_num_bufs =3D=3D q->max_num_buffers) {
> >>              dprintk(q, 1, "maximum number of buffers already allocate=
d\n");
> >>              return -ENOBUFS;
> >>      }
> > There is another case in vb2_ioctl_create_bufs() where num_buffers is a=
ccessed directly.
> > Can you fix that one as well?
>
> It is removed by the patch I have send just after this one:
> "media: core: Refactor vb2_ioctl_create_bufs() to always set capabilities=
 flags"

I'd prefer that to be also included in this fix, so that it's all
logically grouped together. Actually Hans also ended up including that
change in his patch, without the commit message mentioning it.

Best regards,
Tomasz

