Return-Path: <linux-media+bounces-47254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 81352C68459
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 09:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2D1D33571D7
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 08:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C183009C7;
	Tue, 18 Nov 2025 08:48:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729CE2FFDD5;
	Tue, 18 Nov 2025 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455688; cv=none; b=GdvmEJAgPLx9H6lBm3L26Ikyh3FdStYmv9mWq7cNH3DNaWPxPRMG6UJoVm9nW96ygibpuCHdCD6fLOQXZTV7scWaHWoCbu/fThObtDkUzzZgNhdBcQ9CPRyVK5ODc4D4xzu3SPfVXdLI0FmJkH7epyap9wIkXLoj2Wn+06D7kq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455688; c=relaxed/simple;
	bh=L3ixcp+D43qpZs93NrpJ1hf5ipoqiqwk2NvN2gWCtf4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gTvpxnfhKhBxg1uy4zhMrwKMNU5LIgi7dOKQx7SHNmmrTrob576BN3OWvMtU3sO5FIB5Ap3+rwdr+ZS3LLtAPJvXvvR6lHyZXlOvPGJXL4/SbUMmgATpfEoAxJAn8V5eyJBwm7RNyL8tXK5jsBajxkpsmccCSxLGR0e5FQ1EBGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b69b63.dsl.pool.telekom.hu [::ffff:81.182.155.99])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000008310E.00000000691C32C2.0032E1FA; Tue, 18 Nov 2025 09:48:02 +0100
Message-ID: <fd65b83abc22587e592a565dd2b326e8eb63f34c.camel@irl.hu>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
From: Gergo Koteles <soyer@irl.hu>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Hans de Goede <hansg@kernel.org>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org
Date: Tue, 18 Nov 2025 09:48:02 +0100
In-Reply-To: <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
	 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
	 <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
	 <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ricardo,

On Tue, 2025-11-18 at 07:21 +0100, Ricardo Ribalda wrote:
>=20
> Most users expect that the led is always on when the camera is active.
> I think the usecases where the led should not be turned on are spooky
> or very limited.
>=20

Or do most users expect that if a piece of hardware has a setting, they
can set it without module parameters?

> Even if you use open-source software, when it parses user generated
> data, there is a risk for bugs. If there is a bug the only thing
> protecting the security of the camera is the membership of the video
> group which is a very low barrier. And once you manage to change the
> LED behaviour will persist in other unrelated apps.
>=20

So this is about what if an attacker accessed my passwords, private
keys, OTP tokens, emails, pictures and then couldn't take a fresh
picture of me in the dark without an LED? I'm smart as hell and I use a
privacy tape anyway ;)

I think freedom is worth more than this kind of fear.


Gergo

