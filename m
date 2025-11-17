Return-Path: <linux-media+bounces-47234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 267ADC664A7
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 22:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 91635361EC6
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 21:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56BB34320D;
	Mon, 17 Nov 2025 21:37:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA78B2C2AA2;
	Mon, 17 Nov 2025 21:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763415431; cv=none; b=gqiqu2n/e9oxeKVfxqvdzyKJG2sZnG1aFViJrO0YwAVWVXQT/xchBq5y2qvEHirifY9mn+W7PkB+3NAkkoltcnuNeUkwIxRBDH1Emv8RxeJKb+fVnraVvY9jcIJK1o/S7MiorL+4Rk3VcfudZ1UShFvmTj6PX8YFL5oUZ+ikS6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763415431; c=relaxed/simple;
	bh=H4XL9azSNHg/Pveo4hrNykA+IjzSyrfO3XZ9gv0Jad0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D9cnvimesHzZnLJQ1Ou5YVhY9lt9zT3HD5kh1Z64ncMoNh7UyW2GDpwPQpBO1RPUJoGAgR7O8dM8tbod2DYe1eOe6FF7DgVawYdAfWDy8SCyDn65KoGCp8Dr3lKnar5eiPvf20Hh1nwbjX9ustCDiSNnjSsHtbAIb/j9RgDw6BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b69b63.dsl.pool.telekom.hu [::ffff:81.182.155.99])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000008311F.00000000691B9583.0032D53F; Mon, 17 Nov 2025 22:37:07 +0100
Message-ID: <92054ed1673155095fff12e6425f7fc585b823b9.camel@irl.hu>
Subject: Re: [PATCH v5] media: uvcvideo: UVC minimum relative pan/tilt/zoom
 speed fix.
From: Gergo Koteles <soyer@irl.hu>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Hans de Goede <hansg@kernel.org>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  John Bauer <johnebgood@securitylive.com>
Date: Mon, 17 Nov 2025 22:37:07 +0100
In-Reply-To: <CAPybu_1HEpqfXqQFrwxs7cwerrNb1YMf-hgg4WYmK3VC4wsbrA@mail.gmail.com>
References: <20251115013007.4842-1-soyer@irl.hu>
	 <CAPybu_1HEpqfXqQFrwxs7cwerrNb1YMf-hgg4WYmK3VC4wsbrA@mail.gmail.com>
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

On Mon, 2025-11-17 at 21:54 +0100, Ricardo Ribalda Delgado wrote:
> Hi Gergo
>=20
> Thanks for reposting the patch, Could you mention what device you have
> used to test it? If you include a lsusb -v from the device that would
> be extra awesome.
>=20

This is an OBSbot Tiny 2.

> On Sat, Nov 15, 2025 at 2:30=E2=80=AFAM Gergo Koteles <soyer@irl.hu> wrot=
e:
> >=20
> > From: John Bauer <johnebgood@securitylive.com>
> >=20
> > For relative PTZ controls, UVC_GET_MIN for b(Pan|Tilt|Zoom)Speed
> > returns the minimum speed of the movement in direction specified
> > in the sign field.
> >=20
> nit: What about this extra clarification in the commit message?
>=20

Thank you, it's much better. I'll send a v6 with the improved commit
message, comments and the lsusb output.


Gergo


