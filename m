Return-Path: <linux-media+bounces-18880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C45998AB12
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 19:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2639D1C22BDD
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 17:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF2C197A7A;
	Mon, 30 Sep 2024 17:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRFFhIqA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03F194096
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 17:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727717290; cv=none; b=OMES1BynzXg9zGFPom++Azoeve0/0GLu4lOZWiHhnwT0QZgfnkd0OvYmbsGVn4GYRuyyvjRjWymjhrcAgOjctTbGkW1GcSpZ8QMxYZwZOoIW/2Ravp/mMBPs+xVeauwaHgJX+a1eMZcoN9kWv6UcZUlz0kfJREJ0p2i3ennv3MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727717290; c=relaxed/simple;
	bh=oKPfHNdhODSMtcanILzQeBGfBMwQEWPBNC9E8LVZUG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNXBdwt0lrHemhqA/yxkXdxnsZqqN1/sfGUWyw9GleNFAS3en/oD16ynRvxYahRRZ331yy5b2H7LrBDH+CdVka24rPrK9Ox6+Qhzq4wyHAimcuWZ4eahaQ20baoIqd05hX4y7wb60uPELU3yLe+de4/RXkHYHyu8wZqRvclcokQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRFFhIqA; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-45830ff5b70so40144521cf.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 10:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727717288; x=1728322088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKPfHNdhODSMtcanILzQeBGfBMwQEWPBNC9E8LVZUG4=;
        b=IRFFhIqA766Q1AM/pxtZpMd8ixS719RBO3JPxL7uM4yStClAI0adKvcvf0XCbZVcZV
         GSmlQiLus6M8953suHxIaGRDn9qsiTme1aavV71lQBPSE5g9S8gjl8RARNePtz6VkiQf
         46zJPgZh4RL87iyWfAsNhHGTa9BYcdO8C7eZCXGeVCXbAaq05Xcieo7k04E63ARHRsW2
         lLXwsnLSGRyhalxqfGObT7DgAeMZh9Vj0kQITVvhLh5xHsDN1kPeGmOshtRH6EBV45Ry
         iVo1xCw6huNpV3lKP/9iGZCeGeYLx9jGFFYuDFddF+2+wQU4DagCUlzsyfLjubaxZ1r8
         aoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727717288; x=1728322088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKPfHNdhODSMtcanILzQeBGfBMwQEWPBNC9E8LVZUG4=;
        b=EoSYv2ZkunlaBy2xAtSqf29id7bol2cTCMtCWqLI2chdk8gq+csfMqrnxlXFUMWNFI
         uEqTPCFLR+7tAcp+mPjgOZ36941mnBHvgEE60h8JgPq7IV8ycVbS3nnmf6toH90/zC7s
         XA3cp+rfkUPbT7RIdCLcK98P9W9OhpiM+uJwHvwXylbL82Aop9UAUUBFmwovdYTxSx/K
         Jfrpsaliuxhs1Zb+O8ARtw1zrxAza+TbyWhkw/JPV77I8+JUrBfEKpg/mM5K/JeiBywe
         vSe/UQAt5QF5HX2/6zDxkTzrCGcFdGBCJl71ATM/3JeB9qCtnBWnHoBl/A8wD8mSKbke
         8rXg==
X-Forwarded-Encrypted: i=1; AJvYcCXQuoutxd/k86O1g5t6OidE9KFnreHqIdtycATAcXMh0E6AzO7j8g3IQyUxV4zrAVf3dHSJFOyhNFJg8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbEOW+Z8qDm1FN7ETVWHiAkyUIGhnAMbVYEsMoiH6JUe1UYluO
	5BtvF6i7E+uVq+4KMChXmY+frKdkkBYubXMozOrSRm9BZ4j2HkiIS+28kYwq3GCENtUPqXZx++x
	EYeT96tQD6p+f9wLw6Sa0v4pquPw=
X-Google-Smtp-Source: AGHT+IEaivfPUOTYfVdV2tGIoNvPf8knR0y9lfNA/t/FP3Fw9vIWDXQ11hZYuP9TsOcMNgyjzhZiUpku5HnBsp8PlWg=
X-Received: by 2002:a05:622a:14a:b0:458:29fe:d254 with SMTP id
 d75a77b69052e-45c9f2c7c80mr209204261cf.59.1727717288196; Mon, 30 Sep 2024
 10:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-2-dan.scally@ideasonboard.com> <OSZPR01MB701939FF3C646166076B7AD8AA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <684a8564-23aa-45d5-bed2-3026743dddd2@ideasonboard.com>
In-Reply-To: <684a8564-23aa-45d5-bed2-3026743dddd2@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Sep 2024 18:27:41 +0100
Message-ID: <CA+V-a8teuzy1tRP1u_DUgMwWkH8kB6y5wAhGcNbtWx0jDzhUDA@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: v4l2: Add Renesas Camera Receiver Unit pixel formats
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Mon, Sep 30, 2024 at 9:05=E2=80=AFAM Dan Scally <dan.scally@ideasonboard=
.com> wrote:
>
> Morning Prabhakar
>
> On 27/09/2024 12:29, Prabhakar Mahadev Lad wrote:
> > Hi Daniel,
> >
> > Thank you for the patch.
> >
> >> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> >>
> >> The Renesas Camera Receiver Unit in the RZ/G2L and RZ/V2H SoCs can out=
put
> >> RAW data captured from an image sensor without conversion to an RGB/YU=
V
> >> format. In that case the data are packed into 64-bit blocks, with a
> >> variable amount of padding in the most significant bits depending on t=
he
> >> bitdepth of the data. Add new V4L2 pixel format codes for the new form=
ats,
> >> along with documentation to describe them.
> >>
> > Which path are you referring here?
> >
> > In the full bypass mode, the data will be stored according to MIPI stan=
dard so 32bit.
> >
> > In (non)-Image Processing case the data is packed into 256-bits.
> >
> > I maybe misunderstanding here can you please clarify.
>
>
> It's not the full bypass mode, but the formats labelled RAW10/12/14 in Ta=
ble 9.1-14 of the RZ/G2L
> documentation. The table describes up to 256-bits, but the packing for th=
e RAW formats seems to be
> in 64-bit units that are repeated 4 times. As I understand it it's the sa=
me path as for the RAW8
> output enabled in your recent series.
>
Thanks for the explanation, I agree with the changes.

Cheers,
Prabhakar

