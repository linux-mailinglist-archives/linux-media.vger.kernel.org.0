Return-Path: <linux-media+bounces-35178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BAFADEF05
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 16:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E40141BC2E19
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 14:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8504F2EB5A8;
	Wed, 18 Jun 2025 14:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtIj8DyN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9792EACFA;
	Wed, 18 Jun 2025 14:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256217; cv=none; b=I6Xm6y+TPZxHfM0sG+9IwhrS0V8T+Z1aQsYU3A7v+aO4+qcknkI08+5hGq60qVbDJui6CNwsGGxdl5pfrG1sohLPoZooLg/93GGyofmpydvQnFUIwgdmkfQUNoHh8zXpb2cIp49IJ7mhmIhGVVnYKA+fbo6y9q3tmX3sxlzM0sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256217; c=relaxed/simple;
	bh=QA7GC8UaqMR+DmjCanUIIF2mklJ/OXH3NqlsEaz9NGU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CBz7Y+tlXQ4+eAMniXbj3XSLtdjgiMALW8FXmb6f2/jYXRKHgc/cBa00+VSMrp+KBsvpzjxsMrsG2Js7NZ+6dfkvFnhirzl2p56XVKoGKbWCSddBXHPOsaS500huwkJdlRFV/TlgFzp18EV1Zb6hV+aWDGLvZu7tbWCX66pvNCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtIj8DyN; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235f9ea8d08so68290315ad.1;
        Wed, 18 Jun 2025 07:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750256214; x=1750861014; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKX0AOzd2NDOwL71Cx1dKnfTtO0KV9uKaanDux8gwfE=;
        b=DtIj8DyNlMmUqFlxjO1dqT/Sb+l3RDoeUn8v4fsSjcW57bdWqDEzzuMGbPgI5/zfYI
         N97H8lCg8cSgnWR66hpyoNg/Sbh3KHQK/Z7N69W2IOo4SybttZ/YU1ULoKfb64dFTAWT
         FBFZ/787+Drdc1s1VpI8YB7In+ZVRgB8MQqnU8bRpIVI+M6lJZOS40lS3YqLDbkSy8ki
         87aB4khD4sU5cnMCFHav+URG7CJlY+eY/sYUkQMYw//+iXaIR8RjM4EHFiFXmWiGQOFr
         rCjHhk9Bh/Xostz4c68FJd6d9AU20EaB8SWJi4bGJS7jNUcz3KSfaj+ATACUsM6tuZ45
         jjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750256214; x=1750861014;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HKX0AOzd2NDOwL71Cx1dKnfTtO0KV9uKaanDux8gwfE=;
        b=ezooVqjpj/lPjzv7FM6Ei+7u0OqITu4DTz+aBpxTojngVytJxI9zQlA+fXcQyCxECn
         4HTQXh0BU/I6+O0M0kXELPK/OoYuM6e03ttgZIWnWCiKTcmxkf0KZVFMsnZMCfJCONQL
         QL4pzpXGqrRfy0E7Xzc/tE+53tD/ZmnYl+Ww1H58GGMAO43hZ369usDUkiymE2yFCcvG
         Z+HDO3lkQhgmzVcroYp6bizaWsw6rnEK55T7pPyfNgZRoSlG9ktDxx2lyxZc47TsgxY9
         9Q7MtmLbrASus8Zm1O7CykPG2fnQ7mJgTl1o9dKYYVAtATz4uDsByXRrMuTl1B3aKwsN
         VhBw==
X-Forwarded-Encrypted: i=1; AJvYcCU6tF3ZLrLvVMPH8rgBEKQjhWPhJNr58hMJBuEObJPaUgyrlnOqNGuoQNVxdhJpjilTwuLSilgEXMwnLtc=@vger.kernel.org, AJvYcCVG2ShyeG4cWshKDgq2sKt1cTp7eKn8gUXKuvheS4rB3YK9QlJSzW8ldLttrb8+M63wabT6mdkj3fVxM/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/mWjd3dpsOsX100CvEhoAYTH167JWW8HOGvqxmT9WqTxanVh6
	jx9B9vIokx+oMEMJGAFPJ9gj5GO5Hny0P6zGiXgGO0oAE72GMnE4z8qE7iMBplDt
X-Gm-Gg: ASbGncsCFELWSCmJBrPu/nqmeAi1zKo5nqueRd2kKFGGNyDy/eBbSs4sZevoUhpoYOO
	gwEQsQUMtg5c+HHIIbfJyWFyUkD+sYebALA0rGo+oLeM/paT6ib7XBZjxJV7Xv2zJV4H8iyWL6j
	OZ5UtPxMp4F5GAXPhqlC8NQ5hNHbn3K4SiSxfeMhhDMqcdWNrMqzUiOTtpkJS7pS512VeEVYk9S
	YMh6dpUkHpKFcEOxiymqoOEvSHQ/VRz7Z/XpAeTa0SuI84Z2TwUd61W8xmd2bFOwj+t8uQtOVks
	mY2OLoTPt+xSxvpQaqi+VRRGeGsutLb0Cf9f4bd0C4ISqciRFsg20Q==
X-Google-Smtp-Source: AGHT+IF65hISwSEsLg+/JJakfukqAPLuMOAOm3U0RdzrzA6kt6koNJHlRbGNsw6NteDLVbOEk1jMCg==
X-Received: by 2002:a17:903:1b64:b0:226:38ff:1d6a with SMTP id d9443c01a7336-2366afbd7ffmr222679705ad.7.1750256213517;
        Wed, 18 Jun 2025 07:16:53 -0700 (PDT)
Received: from localhost ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c200sm100652135ad.51.2025.06.18.07.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 07:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 23:16:47 +0900
Message-Id: <DAPQ1LPH05P4.HLIMQEJCRHLX@gmail.com>
Cc: "Albert Esteve" <aesteve@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Jason Wang" <jasowang@redhat.com>, "Xuan
 Zhuo" <xuanzhuo@linux.alibaba.com>, =?utf-8?q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, <gurchetansingh@google.com>,
 <daniel.almeida@collabora.com>, <adelva@google.com>,
 <changyeon@google.com>, <nicolas.dufresne@collabora.com>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <virtualization@lists.linux.dev>
Subject: Re: [PATCH v3] media: add virtio-media driver
From: "Alexandre Courbot" <gnurou@gmail.com>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
 <20250526141316.7e907032@foz.lan> <DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com>
 <20250527111311.105246f2@sal.lan>
 <CAAVeFu+=RpEfu3i_Fh9_eq_g=cmDFF0gcurT0gU9AX1UX+UNVA@mail.gmail.com>
 <20250527153547.6603eaf4@sal.lan>
 <CAAVeFuJtp=UEEULeMSVpmYDmH81Y6OQgj6NCeuPUhabSRHw4dA@mail.gmail.com>
 <20250617104938.09d21b7c@foz.lan>
In-Reply-To: <20250617104938.09d21b7c@foz.lan>

Hi Mauro,

On Tue Jun 17, 2025 at 5:49 PM JST, Mauro Carvalho Chehab wrote:
> Hi Alex,
>
> Em Tue, 27 May 2025 23:03:39 +0900
> Alexandre Courbot <gnurou@gmail.com> escreveu:
>
>> > > > Btw, I was looking at:
>> > > >
>> > > >         https://github.com/chromeos/virtio-media
>> > > >
>> > > > (I'm assuming that this is the QEMU counterpart, right?) =20
>> > >
>> > > crosvm actually, but QEMU support is also being worked on. =20
>> >
>> > Do you have already QEMU patches? The best is to have the Kernel drive=
r
>> > submitted altogether with QEMU, as Kernel developers need it to do the
>> > tests. In my case, I never use crosvm, and I don't have any Chromebook
>> > anymore. =20
>>=20
>> IIRC Albert Esteve was working on this, maybe he can share the current s=
tatus.
>
> Any news regards to it?

Albert shared the latest status. There is one in-flight patch series
required in qemu [1], and then this branch of vhost-device should
contain the necessary support [2]. Albert is waiting for the virtio spec
to get merged before sending a pull request IIUC.

[1] https://patchew.org/QEMU/20250217164012.246727-1-aesteve@redhat.com/
[2] https://github.com/aesteve-rh/vhost-device/tree/virtio-media

>
>> Note that crosvm does not require a Chromebook, you can build and run
>> it pretty easily on a regular PC. I have put together a document to
>> help with that:
>>=20
>> https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
>
> I started looking on it today. Already installed crossvm (I had to
> install libcap-devel to build it). Still, I'm not familiar with
> crossvm, which is a little be painful. In particular, how can I
> enable network on it and speedup it?

There is a "./tools/examples/setup_network" in the crosvm repository that
will setup a TAP device. Once this is done, you can pass the "--net
tap-name=3Dcrosvm_tap" argument to crosvm, and the network device should
be visible and usable.

Let me reply to the rest of your questions in your latest mail, with the
most recent logs.

Cheers,
Alex.

