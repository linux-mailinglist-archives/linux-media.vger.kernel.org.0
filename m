Return-Path: <linux-media+bounces-13277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F444909032
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 18:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04C6C289793
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 16:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174EC19AA7F;
	Fri, 14 Jun 2024 16:26:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29BC171E71;
	Fri, 14 Jun 2024 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718382387; cv=none; b=TX3UsjBWKFPPIL7jqoF0EBk0HKRye6VndTaE7rfK9axKcWo/JDmAyUtDrqO2LMCqFKn8Zx0oxkwT48ILVFZciDFbtu1YdnpmHI6jp8MlX1P2dyMcAsRIJHo4A+uMrtjd4REkFItLw3dFANKo7fSpPkDOxPhDGtVAqMC042FqVjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718382387; c=relaxed/simple;
	bh=BYBfSUu5Tvg6iHzjCbzvcPIDyIa6A01WCSSw+P+6RqQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TpLeNcI3VkW6QyfDcAO1253gsmJ+jOfooZb0Hpymrdm1tlgBCRMPM7CaZCmlwAcKhz4vu4lzM98XAss2CZjOzjFNgclJFPctNPJtjPRDePgoCkB0OCBlrxUzBpeioQX1BtsrNEvcM+74O1jzDSUJCSXDBmlR9ADy/ZAZ8dhUx4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (c3e47615.dsl.pool.telekom.hu [::ffff:195.228.118.21])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000070CEE.00000000666C6F29.001D2CC2; Fri, 14 Jun 2024 18:26:17 +0200
Message-ID: <225d762d359a109afe568c567885a7b7e282e137.camel@irl.hu>
Subject: Re: [PATCH 2/2] media: v4l2: map UVC_CT_ROLL_ABSOLUTE_CONTROL
From: Gergo Koteles <soyer@irl.hu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
  linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 14 Jun 2024 18:26:16 +0200
In-Reply-To: <20240612203124.GU28989@pendragon.ideasonboard.com>
References: <cover.1718216718.git.soyer@irl.hu>
	 <163b1aee53fa78fe1a8d0b8bb7b0f7be1f1975c9.1718216718.git.soyer@irl.hu>
	 <20240612203124.GU28989@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Laurent,

On Wed, 2024-06-12 at 23:31 +0300, Laurent Pinchart wrote:
> On Wed, Jun 12, 2024 at 08:31:14PM +0200, Gergo Koteles wrote:
> > Some new UVC cameras can report whether they are mounted in 'portrait
> > mode'.
> >=20
> > Current roll degrees (-90, 0, 90, 180) are reported with
> > UVC_CT_ROLL_ABSOLUTE_CONTROL.
>=20
> UVC_CT_ROLL_ABSOLUTE_CONTROL is about controlling the motion of the
> camera along the roll axis, while this patch series sounds like you want
> to support reporting the mounting orientation of the device, not cause
> the device to rotate. Is that right ?

The SET_CUR of UVC_CT_ROLL_ABSOLUTE_CONTROL is optional, so I think
it's for reporting also.

The cameras I've tested before can't roll the sensor, they only report
the angle/orientation.

Yes, I was thinking to support the mounting orientation report, however
I tried a friend's DJI Osmo Pocket 3, which can roll the sensor in +-
30=CB=9A with ROLL_ABSOLUTE UVC control. It can also be
Panned/Tilted/Zoomed, very cool.

I think mapping UVC_CT_ROLL_ABSOLUTE_CONTROL to V4L2_CID_ROLL_ABSOLUTE
would be useful. I can reword the commit message a bit if you'd like.

>=20
> If that's the case, the right V4L2 control to use would be
> V4L2_CID_CAMERA_SENSOR_ROTATION. Mapping it to
> UVC_CT_ROLL_ABSOLUTE_CONTROL is problematic though, as
> UVC_CT_ROLL_ABSOLUTE_CONTROL is not meant for this in the UVC spec. We
> would likely need a quirk to control how it gets used.
>=20

I can also create a quirk for the other two cameras to map
UVC_CT_ROLL_ABSOLUTE_CONTROL to V4L2_CID_CAMERA_SENSOR_ROTATION.

Maybe it can be detected if CT_ROLL_ABSOLUTE_CONTROL doesn't have
SET_CUR, default 0, step 90.

>=20
Best regards,
Gergo


