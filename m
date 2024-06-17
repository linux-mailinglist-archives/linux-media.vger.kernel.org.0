Return-Path: <linux-media+bounces-13457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E39F590B508
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 615851F235E6
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 15:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB45A15A48B;
	Mon, 17 Jun 2024 15:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ToOaERND"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9842C15991E
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637747; cv=none; b=iI2MrboMxtnGzaTivLBIeFOY8YpwTnr4s+6g2EPSZml96QIEFVN3tK6bw0zj3nNlMn9nFpJAO8h5j1atrz5FXXf5BFk+gyDj0tMoMLpPjKlT5NrLLXg00586MhHTb++ATDr0wtbPIgOswjDuNQ7WTgU1Hp+I1NthnT1Kl7/vxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637747; c=relaxed/simple;
	bh=1WCrd5faPn+mYTZ7JSuYSySdH178zAkO2xerg6qhj+8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FMe0AD/gaG7a2LBamOF06uAgFWBDy+T1WvOtF9f4okfrDkVB5uGMcGW+MCBT6TfMua+vn/TWcYzNvMQ2Vklge9tAykBu4hDsCjcWkQGhiOuzwkPIYVaHE/oclStfN9tr4+omFkLd8/Mtm9catrMOZ/4CNt2bZFxRdfqx1HzT3T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ToOaERND; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-797e2834c4eso374795685a.0
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718637744; x=1719242544; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3/FM3QUCn6Oly1MyDk1CjKXwx7qpQYJAZGU3cke12jM=;
        b=ToOaERNDsXqd2Sk4KlJMhm63hFk8y2QYxTHyMdnsHV9RG7IDLR3gtqtUDM0PS99S5k
         MmoliEWoP+vtbeiGKAjXPk4n2Jz0H8BFY6JpMg/WtbF5f0KEXsgEHiyd30kqa21vVx7L
         3P+ApA1OZGupXqFZxwPDFLmE2E+VwKKA710KlshmDT4PnJ36CqHfe/QgUSvpBqsfzk+a
         tGq7a+W3NFCPXJ+OoQBYEADr0ovdFS8EJvI+iRts6mzpqrRw/H6QKCy5bMOYdRUHM0tv
         qY3cF+gfA9ilUNkSeO0FX40C2J9OWznfqthSintkxbYuqK+WuZs0gVjzDyXO4OeQnWbI
         QKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718637744; x=1719242544;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/FM3QUCn6Oly1MyDk1CjKXwx7qpQYJAZGU3cke12jM=;
        b=i+weigjN28niN6/iY9l5CC8GDyLjZM7j2j05MdoBORqdZdMsjYEEkaU1pXtQG8Pfrq
         gVAAJCchwOG3nBs553Ww+lC5+YkG+o+hl2IAFZEl2KFOCcghvX7F/O0JEt6o50/e5w0X
         dd+UjPDa1NCIJ/02thczjzxqTGZJT5NLueS0Ej/ry25u2eWiQQkGZS9jcZYDFd1ahS12
         32SBCz8Q4QGchdbGKJZm/w1ILBxxUWm9w8T5im4PEg0PY/VZvxZCslcBVzvHWbJHbvZ2
         tKrizNqN/Eb6GEJ1V/9Ysyj9kF9kF+6gw814y/kG7rzSjMiyWVCb7fcNWVOC36HaIPhC
         3e5g==
X-Forwarded-Encrypted: i=1; AJvYcCVieYZLReM5au+RKsVNt4T2JZhQxmWF+wQJhgQRa+jam9uUmL+C8U981oMSdxEgTfPMzaId2ztJ97i8RDma1cpCYl5Kal++cIWAxxo=
X-Gm-Message-State: AOJu0YwM/hL/Of3MNS6hEhegDEAc9rZOdn0CvdsKKYBk+VipKNx2Z0+m
	YL7HzbjDRqxesQrc1q6R2brMGwhvuS01r4G5E/u9IswXLyNzS5BGekAYVy7r98M=
X-Google-Smtp-Source: AGHT+IGgbfn+7mAk/1/X8Q8iM0sSSXawlAQZ4Cyo4qH0flu14E16sBQYKctBfM4ogrts8SmywVEXoA==
X-Received: by 2002:a05:620a:1710:b0:795:5750:cef7 with SMTP id af79cd13be357-798d03e6830mr1608790385a.36.1718637744495;
        Mon, 17 Jun 2024 08:22:24 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:57da::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaee575fsm438671285a.40.2024.06.17.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:22:24 -0700 (PDT)
Message-ID: <e5d2f6d735bb4c997393e6d3ace53953b062ecd8.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Detlev Casanova <detlev.casanova@collabora.com>, Jianfeng Liu
	 <liujianfeng1994@gmail.com>
Cc: alchark@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org, 
	cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org, 
	didi.debian@cknow.org, dsimic@manjaro.org, gregkh@linuxfoundation.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org, robh@kernel.org, sebastian.reichel@collabora.com
Date: Mon, 17 Jun 2024 11:22:23 -0400
In-Reply-To: <4116468.VLH7GnMWUR@arisu>
References: <20240615015734.1612108-2-detlev.casanova@collabora.com>
	 <20240617094735.27928-1-liujianfeng1994@gmail.com>
	 <f295f41ef1c9ee920ac3ac8e70ccf672ba7c9648.camel@ndufresne.ca>
	 <4116468.VLH7GnMWUR@arisu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 17 juin 2024 =C3=A0 10:20 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> On Monday, June 17, 2024 10:04:59 A.M. EDT Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le lundi 17 juin 2024 =C3=A0 17:47 +0800, Jianfeng Liu a =C3=A9crit :
> > > Hi Detlev,
> > >=20
> > > Thanks a lot for your work! I try to use rkvdec2 with chromium but it
> > > can't play h264 video. Here is the log of chromium:
> > >=20
> > > [5799:5873:0617/171224.850061:VERBOSE2:video_decoder_pipeline.cc(473)=
]
> > > Initialize(): config: codec: h264, profile: h264 high, level: not
> > > available, alpha_mode: is_opaque, coded size: [1920,1080], visible re=
ct:
> > > [0,0,1920,1080], natural size: [1920,1080], has extra data: true,
> > > encryption scheme: Unencrypted, rotation: 0=C2=B0, flipped: 0, color =
space:
> > > {primaries:BT709, transfer:BT709, matrix:BT709, range:LIMITED}
> > > [5799:5886:0617/171224.850915:VERBOSE2:v4l2_video_decoder.cc(182)]
> > > V4L2VideoDecoder():
> > > [5799:5886:0617/171224.851218:VERBOSE1:v4l2_device.cc(128)] Open(): N=
o
> > > devices supporting H264 for type: 0
> > > [5799:5886:0617/171224.851346:VERBOSE4:v4l2_queue.cc(1069)] This queu=
e
> > > does  support requests.: No such file or directory (2)
> > This one indicates that V4L2_BUF_CAP_SUPPORTS_REQUESTS might be missing=
 in
> > the REQBUFS implementation. I suspect GStreamer simply assumes this tod=
ay
> > for driver exposing stateless formats (which is fair, its not a complia=
nce
> > test, and we don't have a codec compliance yet).
>=20
> There is a src_vq->supports_requests =3D true; Do I also need to set a fl=
ag on=20
> the device caps ?

I don't know, but you can check very easily what flags you have out of REQB=
UFS
with the dev_debug output or using v4l2-tracer.

regards,
Nicolas

>=20
> > I'd suggest to check and fix this one, and retry, might only be noise, =
might
> > be the main cause, we cannot tell.
> >=20
> > > [5799:5886:0617/171224.851426:VERBOSE1:v4l2_video_decoder.cc(476)]
> > > InitializeBackend(): Using a stateless API for profile: h264 high and
> > > fourcc: S264
> > > [5799:5886:0617/171224.851687:VERBOSE1:v4l2_video_decoder.cc(598)]
> > > SetupInputFormat(): Input (OUTPUT queue) Fourcc: S264
> > > [5799:5886:0617/171224.851797:VERBOSE1:v4l2_video_decoder.cc(636)]
> > > AllocateInputBuffers(): Requesting: 17 OUTPUT buffers of type
> > > V4L2_MEMORY_MMAP
> > > [5799:5886:0617/171224.867687:VERBOSE1:v4l2_queue.cc(1511)] Streamon(=
):
> > > (OUTPUT_MPLANE) VIDIOC_STREAMON failed: Invalid argument (22)
> > > [5799:5886:0617/171224.867902:VERBOSE1:v4l2_video_decoder.cc(937)]
> > > StartStreamV4L2Queue(): Failed to streamon V4L2 queue.
> > > [5799:5886:0617/171224.868009:VERBOSE1:v4l2_video_decoder.cc(1377)]
> > > SetState(): Error occurred, stopping queues.
> > > [5799:5886:0617/171224.868105:ERROR:v4l2_video_decoder.cc(120)]
> > > StartStreamV4L2Queue failed at
> > > Decode@media/gpu/v4l2/v4l2_video_decoder.cc:915
> > > [5799:5886:0617/171224.871898:WARNING:v4l2_video_decoder_backend_stat=
eles
> > > s.cc(126)] There is/are 0 pending CAPTURE queue buffers pending deque=
uing.
> > > This might be fine or a problem depending on the destruction semantic=
s
> > > (of theclient code.
> > >=20
> > > Here is the chromium code failed when calling VIDIOC_STREAMON:
> > > https://github.com/chromium/chromium/blob/125.0.6422.60/media/gpu/v4l=
2/v4l
> > > 2_queue.cc#L1508
> > >=20
> > > I'm running chromium v125.0.6422.60 and I can decode 1080p h264 with
> > > hantro g1 decoder on rk3588.
> >=20
> > Are you using minigbm ? Because if you do, we don't have minigbm code f=
or
> > this driver (and have no plan to do so, since we don't aim for ChromeOS
> > support).
> >=20
> > Nicolas
> >=20
> > > Best regards,
> > > Jianfeng
>=20


