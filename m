Return-Path: <linux-media+bounces-9056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D47E8A01E8
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 23:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB1EF285CB1
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 21:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A811836EB;
	Wed, 10 Apr 2024 21:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DybAnkuF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1047328FD
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 21:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712784270; cv=none; b=AAyF1yOzoGw9aGEmub2Hta9E0hi3Pe+7nA036kZZ7jGCplnL9y5RMAru6f1uFI8j52cdXLi0rzWNQf5W44RklU1/yi4006TYRoRrPtVItyRphhoQvNM4RTRT4vdRLIX/7bUVYPv5rKz4pU0rU3NbJV6seXb4Z+fnxBoPvwF4xi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712784270; c=relaxed/simple;
	bh=tCIrH27uLr7mUdXb4uNE2YNoR9ieL4NEJiBWXnTdcF4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=jMnKYEwy5hoKraMQZ5JSjYttEYcpACssijJeOVMtw/yV1vn9Yqg5a+7AttpNvv7d37RIBGbvfLDJ64yCON8c+fF1tdtbBDIWdg+eT20U6CGCgbHuVL+jL9bDAKdsrVFqTDfWnKLYywQnp4pl1yM7ITWRvrt0SjMUhF5kgqxBHTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DybAnkuF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AADAE3A4;
	Wed, 10 Apr 2024 23:23:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712784218;
	bh=tCIrH27uLr7mUdXb4uNE2YNoR9ieL4NEJiBWXnTdcF4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DybAnkuFPY+61P81+QvGSW5Dfy40BUzeOnpY064UL0j9V7PrmHigMHLpES/EsI5sc
	 LgmsDbBvB+5qGNtRSYw5Oah20DAbu4l4u+GZlqgtEQr6fyMyZ2/O20jFsW5HIdHtkV
	 ycN37nFEDsIDgISWVHQi2sWpjKD6RMjZz0aqyN1k=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1ad989d8-08e7-43c0-9b35-98e54e4a3de2@redhat.com>
References: <20240216223237.326523-1-hdegoede@redhat.com> <20240216223237.326523-2-hdegoede@redhat.com> <170818429397.1206667.7109669506551567157@ping.linuxembedded.co.uk> <1ad989d8-08e7-43c0-9b35-98e54e4a3de2@redhat.com>
Subject: Re: [PATCH 1/5] media: ov2680: Stop sending more data then requested
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 10 Apr 2024 22:24:18 +0100
Message-ID: <171278425800.3085322.3202909682266232934@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-04-10 12:27:03)
> Hi,
>=20
> Sorry for being very slow with replying to this.
>=20

No worries,


> On 2/17/24 4:38 PM, Kieran Bingham wrote:
> > Quoting Hans de Goede (2024-02-16 22:32:33)
> >> There is no reason to send OV2680_END_MARGIN extra columns on top of
> >> the mode width and the same for sending extra lines over the mode heig=
ht.
> >>
> >> This sending of extra lines/columns was inherited from the atomisp
> >> ov2680 driver, it is unclear why this was done and this complicates
> >> adding V4L2_CID_VBLANK support, so remove it.
> >=20
> > Was this some niave way of adding some HBLANK to let the AtomISP keep up
> > with processing each line?
>=20
> The total amount of pixels per line and of lines per frame are fixed:
>=20
> #define OV2680_PIXELS_PER_LINE                 1704
> #define OV2680_LINES_PER_FRAME                 1294
>=20
> This patch only changes the h_end and v_end registers which
> before AFAIK configure when to stop sending actual pixel
> data (and move over to sending blanking data). So this was
> actually requesting for more pixels to be send then there are.
>=20
> > Or is it an optical black region? or padding? (I hit issues around that
> > on the IMX283 lately).
>=20
> AFAICT (from the datasheet) there is no optical black region, so
> this really just seemed some weirdness in the original Android
> kernel driver where this is derived from.
>=20
> The datasheet says:
>=20
> "2.4 pixel array addresses
> The addressable pixel array of the OV2680 sensor is 1616 x 1216. The addr=
essed region of the pixel array is controlled
> by the horizontal_start, vertical_start, horizontal_end and vertical_end =
registers. The start and end addresses are limited
> to even and odd numbers, respectively, to ensure that there is always an =
even number of pixels read out in x and y."
>=20
> > Is this a sensor you have and can visually check?
>=20
> Yes this is a sensor which I have, not sure what you mean with
> visually check. The atomisp driver does not allow getting the full

Me neither at this point. I was probably worried about the impact of
changing these values causing visible issues in the stride/line widths
or such. But if you're testing and capturing images successfully I'm not
worried now.


> resolution as the ISP needs some padding. So the max I can get
> is 1600x1200. I think the original Android code just added
> the 16 extra pixels needed by the ISP to h_end and v_end
> twice. Starting with the extra 16 pixels which are actually
> there on the sensor and then adding an extra 16 which are
> fully made up by the driver author and somehow this still
> works (I guess the sensor just sends all 0 data for these).

Or maybe that was the part to check visually ;-) But I guess it's not
easy to capture the full raw images for these ?

> >=20
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/media/i2c/ov2680.c | 9 ++-------
> >>  1 file changed, 2 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> >> index 39d321e2b7f9..5b04c6c0554a 100644
> >> --- a/drivers/media/i2c/ov2680.c
> >> +++ b/drivers/media/i2c/ov2680.c
> >> @@ -86,9 +86,6 @@
> >>  #define OV2680_PIXELS_PER_LINE                 1704
> >>  #define OV2680_LINES_PER_FRAME                 1294
> >> =20
> >> -/* If possible send 16 extra rows / lines to the ISP as padding */
> >> -#define OV2680_END_MARGIN                      16
> >> -
> >>  /* Max exposure time is VTS - 8 */
> >>  #define OV2680_INTEGRATION_TIME_MARGIN         8
> >> =20
> >> @@ -359,11 +356,9 @@ static void ov2680_calc_mode(struct ov2680_dev *s=
ensor)
> >>         sensor->mode.v_start =3D (sensor->mode.crop.top +
> >>                                 (sensor->mode.crop.height - height) / =
2) & ~1;
> >>         sensor->mode.h_end =3D
> >> -               min(sensor->mode.h_start + width + OV2680_END_MARGIN -=
 1,
> >> -                   OV2680_NATIVE_WIDTH - 1);
> >> +               min(sensor->mode.h_start + width - 1, OV2680_NATIVE_WI=
DTH - 1);
> >>         sensor->mode.v_end =3D
> >> -               min(sensor->mode.v_start + height + OV2680_END_MARGIN =
- 1,
> >> -                   OV2680_NATIVE_HEIGHT - 1);
> >> +               min(sensor->mode.v_start + height - 1, OV2680_NATIVE_H=
EIGHT - 1);
> >>         sensor->mode.h_output_size =3D orig_width;
> >>         sensor->mode.v_output_size =3D orig_height;
> >>         sensor->mode.hts =3D OV2680_PIXELS_PER_LINE;
> >=20
> > Especially as seeing hts =3D OV2680_PIXELS_PER_LINE it does sound like =
the
> > margin is superfluous.
>=20
> Right.
>=20
> Regards,
>=20
> Hans
>=20
>

