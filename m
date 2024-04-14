Return-Path: <linux-media+bounces-9287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A868A45E0
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 00:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49FC21C20EAB
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 22:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE14813774A;
	Sun, 14 Apr 2024 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b9I5muo3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6716018B14
	for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713132214; cv=none; b=HEWWNX2ccJY5f8v6wHcyvEVo6Llb3zQKTleMY6C2T8TQOe3j2tXgzqM/AbyRj0C6eNvP2Y8YkZI2PPEwwF0Q6OfpqvVx/w/7j5HOBbwiEc8KGNV4rt8Ot1TJsUVf2yW+lcezge27Nsj/MB++vAJna/OaW3LKjFtrefgblnptDnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713132214; c=relaxed/simple;
	bh=1N5dhj7goOiG24zYbmgLNjXDvIvdQC/qfGL7A2eiGNc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=e/WkPgiu0ZLDDGCymJFUi+Oqz4uPdN0cTP/wkHh3Qb3TE7a2WsK3rSdP+gkGoMToQQYLTvvwcpS/xz0/oT6kAjuPToMQP6e7Vyzr78Q3CccPxq1nIFR5x2vuEwBJDAO4rUElc7PbsyuLEMcVx9/V9vpuQZv9yNYuoIR5qRpPwls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b9I5muo3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F3415B2;
	Mon, 15 Apr 2024 00:02:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713132165;
	bh=1N5dhj7goOiG24zYbmgLNjXDvIvdQC/qfGL7A2eiGNc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=b9I5muo3sP3P7+IfVVHSvhrfyi8JEIBc28/neoNH/egepz6JSIjQueFg/IiqqV+EK
	 KSi4OiQiPC0u6Ji3B6q/UVTe2tC2R7yO9BnzXyy4kzC2FLk9b3faXZim+7YJxdCYKt
	 ZwOkF0e1V3TuGJwLvaI3yEkDAUEwgK2Zhopvrh4w=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3fbce286-42a0-41ec-b031-4f32dc9f1678@redhat.com>
References: <20240216223237.326523-1-hdegoede@redhat.com> <20240216223237.326523-2-hdegoede@redhat.com> <170818429397.1206667.7109669506551567157@ping.linuxembedded.co.uk> <1ad989d8-08e7-43c0-9b35-98e54e4a3de2@redhat.com> <171278425800.3085322.3202909682266232934@ping.linuxembedded.co.uk> <3fbce286-42a0-41ec-b031-4f32dc9f1678@redhat.com>
Subject: Re: [PATCH 1/5] media: ov2680: Stop sending more data then requested
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sun, 14 Apr 2024 23:03:28 +0100
Message-ID: <171313220834.3165863.14580351639874549754@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Hans,

Quoting Hans de Goede (2024-04-11 13:19:15)
> Hi,
>=20
> On 4/10/24 11:24 PM, Kieran Bingham wrote:
> > Quoting Hans de Goede (2024-04-10 12:27:03)
> >> Hi,
> >>
> >> Sorry for being very slow with replying to this.
> >>
> >=20
> > No worries,
> >=20
> >=20
> >> On 2/17/24 4:38 PM, Kieran Bingham wrote:
> >>> Quoting Hans de Goede (2024-02-16 22:32:33)
> >>>> There is no reason to send OV2680_END_MARGIN extra columns on top of
> >>>> the mode width and the same for sending extra lines over the mode he=
ight.
> >>>>
> >>>> This sending of extra lines/columns was inherited from the atomisp
> >>>> ov2680 driver, it is unclear why this was done and this complicates
> >>>> adding V4L2_CID_VBLANK support, so remove it.
> >>>
> >>> Was this some niave way of adding some HBLANK to let the AtomISP keep=
 up
> >>> with processing each line?
> >>
> >> The total amount of pixels per line and of lines per frame are fixed:
> >>
> >> #define OV2680_PIXELS_PER_LINE                 1704
> >> #define OV2680_LINES_PER_FRAME                 1294
> >>
> >> This patch only changes the h_end and v_end registers which
> >> before AFAIK configure when to stop sending actual pixel
> >> data (and move over to sending blanking data). So this was
> >> actually requesting for more pixels to be send then there are.
> >>
> >>> Or is it an optical black region? or padding? (I hit issues around th=
at
> >>> on the IMX283 lately).
> >>
> >> AFAICT (from the datasheet) there is no optical black region, so
> >> this really just seemed some weirdness in the original Android
> >> kernel driver where this is derived from.
> >>
> >> The datasheet says:
> >>
> >> "2.4 pixel array addresses
> >> The addressable pixel array of the OV2680 sensor is 1616 x 1216. The a=
ddressed region of the pixel array is controlled
> >> by the horizontal_start, vertical_start, horizontal_end and vertical_e=
nd registers. The start and end addresses are limited
> >> to even and odd numbers, respectively, to ensure that there is always =
an even number of pixels read out in x and y."
> >>
> >>> Is this a sensor you have and can visually check?
> >>
> >> Yes this is a sensor which I have, not sure what you mean with
> >> visually check. The atomisp driver does not allow getting the full
> >=20
> > Me neither at this point. I was probably worried about the impact of
> > changing these values causing visible issues in the stride/line widths
> > or such. But if you're testing and capturing images successfully I'm not
> > worried now.
> >=20
> >=20
> >> resolution as the ISP needs some padding. So the max I can get
> >> is 1600x1200. I think the original Android code just added
> >> the 16 extra pixels needed by the ISP to h_end and v_end
> >> twice. Starting with the extra 16 pixels which are actually
> >> there on the sensor and then adding an extra 16 which are
> >> fully made up by the driver author and somehow this still
> >> works (I guess the sensor just sends all 0 data for these).
> >=20
> > Or maybe that was the part to check visually ;-) But I guess it's not
> > easy to capture the full raw images for these ?
>=20
> Besides a bunch of devices with the atomisp I also have 1 IPU3
> based device with an ov2680 sensor. So I could capture full
> raw resolution there. But unless I modify the driver full
> raw resolution is 1616x1216 where as before this patch the driver
> sets v_end to 1631 so more pixels then the full size, which is
> the weirdness this patch corrects.

That sounds reasonable to me, thank you for all the explanations.

I don't object to this patch, but I don't have a way to test, nor
further verify this one myself specifically.

But, the commit does reflect what the commit message states ... so I
guess that's a ...

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> Regards,
>=20
> Hans
>=20
>=20
>=20
>=20
> >=20
> >>>
> >>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>> ---
> >>>>  drivers/media/i2c/ov2680.c | 9 ++-------
> >>>>  1 file changed, 2 insertions(+), 7 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> >>>> index 39d321e2b7f9..5b04c6c0554a 100644
> >>>> --- a/drivers/media/i2c/ov2680.c
> >>>> +++ b/drivers/media/i2c/ov2680.c
> >>>> @@ -86,9 +86,6 @@
> >>>>  #define OV2680_PIXELS_PER_LINE                 1704
> >>>>  #define OV2680_LINES_PER_FRAME                 1294
> >>>> =20
> >>>> -/* If possible send 16 extra rows / lines to the ISP as padding */
> >>>> -#define OV2680_END_MARGIN                      16
> >>>> -
> >>>>  /* Max exposure time is VTS - 8 */
> >>>>  #define OV2680_INTEGRATION_TIME_MARGIN         8
> >>>> =20
> >>>> @@ -359,11 +356,9 @@ static void ov2680_calc_mode(struct ov2680_dev =
*sensor)
> >>>>         sensor->mode.v_start =3D (sensor->mode.crop.top +
> >>>>                                 (sensor->mode.crop.height - height) =
/ 2) & ~1;
> >>>>         sensor->mode.h_end =3D
> >>>> -               min(sensor->mode.h_start + width + OV2680_END_MARGIN=
 - 1,
> >>>> -                   OV2680_NATIVE_WIDTH - 1);
> >>>> +               min(sensor->mode.h_start + width - 1, OV2680_NATIVE_=
WIDTH - 1);
> >>>>         sensor->mode.v_end =3D
> >>>> -               min(sensor->mode.v_start + height + OV2680_END_MARGI=
N - 1,
> >>>> -                   OV2680_NATIVE_HEIGHT - 1);
> >>>> +               min(sensor->mode.v_start + height - 1, OV2680_NATIVE=
_HEIGHT - 1);
> >>>>         sensor->mode.h_output_size =3D orig_width;
> >>>>         sensor->mode.v_output_size =3D orig_height;
> >>>>         sensor->mode.hts =3D OV2680_PIXELS_PER_LINE;
> >>>
> >>> Especially as seeing hts =3D OV2680_PIXELS_PER_LINE it does sound lik=
e the
> >>> margin is superfluous.
> >>
> >> Right.
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >=20
>

