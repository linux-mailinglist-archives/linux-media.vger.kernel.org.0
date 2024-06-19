Return-Path: <linux-media+bounces-13759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C5090F99D
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 01:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC9AF28256B
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 23:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010E215B143;
	Wed, 19 Jun 2024 23:05:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0E961FCF;
	Wed, 19 Jun 2024 23:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718838299; cv=none; b=B08xs1Echx7gHYwEnR0FgpA31qD3hifAdMXjRPQ0S/0DrQPZj3v+2+assvfEmnEZFc3yU4GwKaqCDkebM++Wu9j3srDJ6UF+k5J3BIIAV3uW63Hgmci7wfUwAAysfejEhKYdmregANk+FgCFxpev9yp0oR866Sqegx0RJNyRSKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718838299; c=relaxed/simple;
	bh=9XuT53Lp90wtkqv14CncYQI9cUDhf6Dn4IqRZ9dKl5o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AJ8cK/u8dtubfYjkvMGmeyY6lzuLiAwa5Qhoeart9xmvK/P+q+Gdh+Ep3E2A22TlqTzFMQ0WQvrgYwV+5efH9HDrw2/Gy9LBgxe/+g3ScsvbO4FHodBPVKcwJKA/+6NOcbmiqHYbVXNNEtxNqy66QgAQvmdu1xwlYQQbZhKXsIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b69c7d.dsl.pool.telekom.hu [::ffff:81.182.156.125])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006FE7E.0000000066736412.002E429E; Thu, 20 Jun 2024 01:04:50 +0200
Message-ID: <0b4f531d5eb1258709f8a584a4ef1ac14636a8db.camel@irl.hu>
Subject: Re: [PATCH v3 1/1] media: uvcvideo: UVC minimum relative
 pan/tilt/zoom speed fix.
From: Gergo Koteles <soyer@irl.hu>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  John Bauer <johnebgood@securitylive.com>, linh.tp.vu@gmail.com,
  linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 20 Jun 2024 01:04:49 +0200
In-Reply-To: <CANiDSCs2MLqdNuZtcQEHhE6c8XXc=4AKNcuHNNgqJKnc9da3Hg@mail.gmail.com>
References: <cover.1718726777.git.soyer@irl.hu>
	 <b062c3ec615a69cbc1b154b1838df3cdc3e1282a.1718726777.git.soyer@irl.hu>
	 <CANiDSCs2MLqdNuZtcQEHhE6c8XXc=4AKNcuHNNgqJKnc9da3Hg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ricardo,

Thanks for the review.

On Wed, 2024-06-19 at 08:15 +0200, Ricardo Ribalda wrote:
>=20
> nit: The following would probably be more correct but less clear:
>=20
> if  (is_relative_ptz_ctrl(xctrl->id))
>     min =3D -max;
> else
>     min =3D mapping->get(mapping, UVC_GET_MIN,...)
>=20
> So up to you what do you/Laurent what is better ;)
>=20

>=20
I like this better. I'll send a v4.

Best regards,
Gergo Koteles


