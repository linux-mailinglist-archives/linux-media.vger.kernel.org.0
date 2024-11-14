Return-Path: <linux-media+bounces-21434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 735659C92C1
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 829261F236EB
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AE51ABEA7;
	Thu, 14 Nov 2024 19:58:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A774198A0E;
	Thu, 14 Nov 2024 19:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731614311; cv=none; b=h8V95UdxWAuxxk9Hi+eaNbMQRePEDjUoFXoALLW2TAOB6PNzaxT8BFnGyakSDkYsSwIIdC/wm0DTzqkhUhkGuIl+L6HlQbrGMKTkAKarUV7cOvi50gHkcCkRejfxNGKorLNHr7dPfm9z308xZv04C7jEIVX3A2gmkOdVs4irPQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731614311; c=relaxed/simple;
	bh=lLLarpXFwPPZgCIjswq7/HL3T2gVDqMXDhOFvDFJNIw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R+AWWnb+8HO7TuCLK/FzREr4mM2bY4kISfufgjs43csl9yVozbslbiQnXhl9jokTXmOe82Iu//worIkjhiJ+c68Ov/oq9qCth35TTbgqGTy1Tk8QjHEgoM496PkC77vALcy0gd8wDUOAE4ctorUFfoZFSFG1G9XpVMphYWVz20A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b684a3.dsl.pool.telekom.hu [::ffff:81.182.132.163])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000074680.0000000067365530.0029838C; Thu, 14 Nov 2024 20:53:20 +0100
Message-ID: <ac8ea4ed606cbc7dfb15057babc29e49a152ef01.camel@irl.hu>
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
From: Gergo Koteles <soyer@irl.hu>
To: Ricardo Ribalda <ribalda@chromium.org>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Hans de Goede <hdegoede@redhat.com>,
  Ricardo Ribalda <ribalda@kernel.org>,
  Sakari Ailus <sakari.ailus@linux.intel.com>,
  Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
  linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
Date: Thu, 14 Nov 2024 20:53:19 +0100
In-Reply-To: <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
	 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ricardo,

On Thu, 2024-11-14 at 19:10 +0000, Ricardo Ribalda wrote:
>=20
> +	},
> +	{
> +		.id		=3D V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> +		.entity		=3D UVC_GUID_UVC_CAMERA,
> +		.selector	=3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> +		.size		=3D 16,
> +		.offset		=3D 64,
> +		.v4l2_type	=3D V4L2_CTRL_TYPE_BITMASK,
> +		.data_type	=3D UVC_CTRL_DATA_TYPE_BITMASK,
> +		.name		=3D "Region Of Interest Auto Controls",
> +	},
>  };
> =20

Wouldn't be better to use 8 V4L2_CTRL_TYPE_BOOLEAN controls for this?

Thanks,
Gergo


