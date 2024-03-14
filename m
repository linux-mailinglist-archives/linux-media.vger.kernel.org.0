Return-Path: <linux-media+bounces-7071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB7687BD96
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 14:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47A6E1F230A5
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 13:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852AA5B68F;
	Thu, 14 Mar 2024 13:24:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA44D5A11A
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710422652; cv=none; b=OAsjiaQIjrFXDWTwCiEXa0my4LJpPBgsALrU/bTIiSRYYjgIHDMD2GhiMMT1i4mnzTlxas2uqz9/sC9QIDKx/E4ZuOp5w8nT883vPNc0uAIIzvXXCp40MwFugv9AmyuBUWdB5wZTyCocZJkIhmln0uaZ0Jlxz0TqEYc8Oj5uo1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710422652; c=relaxed/simple;
	bh=TEc2xCWB82QtSjX4P2X2SiFgs4m5W3pGb2MW59GDzUw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cyxOmZA1PRzNIsaBO5yr4rJuETE+i7Hh5iiwO3ed/swhJ0PrTXvDwTbZJ4cqR8IzoXLjXFBEY8GWeuR2mmHefc5N+b2j0UQtH9NemdeF28Afo6ESbdHGQ3qgqvejgXfceT3r/m6mw6ak8gpIJhQzddIydlcx3IEVHoSYeZ60bh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b6960e.dsl.pool.telekom.hu [::ffff:81.182.150.14])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000075C9E.0000000065F2FA71.0021B3DC; Thu, 14 Mar 2024 14:24:01 +0100
Message-ID: <22d0829ac9f1b1e1b75f2fc3b14e6720c858efe8.camel@irl.hu>
Subject: Re: [PATCH v14 09/11] media: uvcvideo: implement UVC v1.5 ROI
From: Gergo Koteles <soyer@irl.hu>
To: Yunke Cao <yunkec@google.com>,
  Hans Verkuil <hverkuil-cisco@xs4all.nl>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Daniel Scally <dan.scally@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
  Sergey Senozhatsky <senozhatsky@chromium.org>,
  Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Date: Thu, 14 Mar 2024 14:24:00 +0100
In-Reply-To: <20231201071907.3080126-10-yunkec@google.com>
References: <20231201071907.3080126-1-yunkec@google.com>
	 <20231201071907.3080126-10-yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Yunke,

On Fri, 2023-12-01 at 16:19 +0900, Yunke Cao wrote:
> +	{
> +		.id		=3D V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> +		.entity		=3D UVC_GUID_UVC_CAMERA,
> +		.selector	=3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> +		.data_size	=3D 16,
> +		.offset		=3D 64,
> +		.v4l2_type	=3D V4L2_CTRL_TYPE_BITMASK,
> +		.data_type	=3D UVC_CTRL_DATA_TYPE_BITMASK,
> +		.name		=3D "Region Of Interest Auto Controls",
> +	},
>  };
> =20

I am just wondering would it makes sense to use individual boolean V4L2
controls for these?

It would work with the existing V4L2 applications without knowing what
this bitmask is.

> =20
> +/* V4L2 driver-specific controls */
> +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT	(V4L2_CID_CAMERA_UVC_BASE +=
 1)
> +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO	(V4L2_CID_CAMERA_UVC_BASE +=
 2)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE		(1 << 0)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK	(1 << 5)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION	(1 << 6)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY		(1 << 7)
> +

Regards,
Gergo


