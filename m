Return-Path: <linux-media+bounces-18556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3B3986484
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 18:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C4F7B23DFB
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 15:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF196E571;
	Wed, 25 Sep 2024 15:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiybpZce"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FA71D5AB1;
	Wed, 25 Sep 2024 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727278044; cv=none; b=N+5NwJqwGZu1pK6KF0jzhpSC72NYVDhk9/GXmfV6YLFdp0q9RKcFK+s/VJi90ymtSW9Kjy2s/ai+HiOxpdagjRwtAKZLcRARlk4Z9xwpbaFd1YyIrxeK3sSS+0gqhfSIR/ChqZb+igS+X6KlZCTc/jrHidZyXbjZjDbhNxqlkXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727278044; c=relaxed/simple;
	bh=VLJzEBA6BP1aaYoFnRl+tPYJhwrgksdsnuLTdmQ5FcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mgd20B9Swwqcb0UNPQMV6d5e8fiKGRaNdztprQRfD3zGO0uki1pF+OW7h1Zt9+UknG3jAQLwJhAJo35fNkXaeYhOTgbfT27OkvQmLiw+kvEZSHgv3wtFgkHxzlDFBdY+YM7a7dpzKyppE3/Enx0YNPuWYuEhhQ9LPoxO8PvBNro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiybpZce; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7124395ca86so2716007a34.0;
        Wed, 25 Sep 2024 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727278042; x=1727882842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLJzEBA6BP1aaYoFnRl+tPYJhwrgksdsnuLTdmQ5FcM=;
        b=OiybpZcewW42EySMnPn0rGX0gjar+9O0q06pZWf26KW63VKxH6y2vc0UOuWn1X0L+4
         QhFp3iSFgfiLZikxobugGrRRNWGcHPcnXTXibCR7e+49EFLZ1YsEODtCsu5aikcabXnK
         ZMNLvsVCIQ0qlLT1XjiXl59tkz1ka65NVHbp6MrtA0UvrFoWWtk4QO9WM0VY7cnJpM9H
         ngjlbL3JzNOfM0/UvrWu20HgJs50F6t48VveNiipEDq0M27I02W7QIYze2lejTGmmnRm
         EEb2hh/hugATdFBrOtPOYtsLAovX2m/+BpV1u8X2kp07UqN/RiQtQr8lh9vcg358QWA5
         8cTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727278042; x=1727882842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLJzEBA6BP1aaYoFnRl+tPYJhwrgksdsnuLTdmQ5FcM=;
        b=SC2Jew/D/vuaShUT9E67Fil5kjr8Sgq9aCjz1d6XyFrTfh569/hfSqs77kMkqae5Pb
         DJrt0LknRKU9yEZsttPxu7JBM7KybKhVBX9JKaQb8L1gsG6JMwMxpHWU6yivoW/tO/q8
         Jf4EqFbUTXCfpMPcPny4xilwn2dPdlQs1MlW5lCENGqQIRXxB7avTmokEWWqd30JQWWN
         8T1Nr6Lev351ZNypMfFMxsTTWjuculgotk9WwqLz+PTyX392cF3qLhhD1g0XkxPgCu7c
         pbj5ZM7bDqmQd4qpUdNUfYRT8+nZkm+Qabm3RJzB9Jnb+8lBtMbGi+A52gzJIuOFwbFk
         dgNA==
X-Forwarded-Encrypted: i=1; AJvYcCVbe1s/u/odh8i5SBvxQKJN/J8UBe165QH9yoRh+lCYduCjLzeNQ5bzDm/I3T2A0QzJ1nrIHcvV8KBTgCE=@vger.kernel.org, AJvYcCWF2KZ5ZvmZw79eKoufUhIjeDRJEz0NG5Ik+QCsCqR0cZtGSfUfimF8pNXwIAe+gxu7dSkWl+EdXba5Jmk=@vger.kernel.org, AJvYcCXcyNGZXeOepvHpZabj5yJikXa3pUm+03R930IqBm8F8efnmSfChyC3LlWvqzilb2BbCfBxO0DPZ0joVc6Wzr+qbjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2lgdCdqsXr4HaPntldAkUp12521UxF2ISc9KAtSLu4QEywfDF
	l1RfHnF0vTXA2AwJBN5J+ziwiLS+knpl1VTtVC9b3n7X7EV6liu3CIak7wC23Jk8ycfybq6Va7y
	JiU4sf39gBs7B4fqfXZao0acwftw=
X-Google-Smtp-Source: AGHT+IFcoo4m0J3fW0Fjub2lfthqwCKhP3Gnjm4sWBC69WipXB2td90mcLi9PLM6DP3Zb4BX4NfRdBNTIS4xje69jI8=
X-Received: by 2002:a05:6830:d0b:b0:713:8387:9efc with SMTP id
 46e09a7af769-713c7d94344mr3523790a34.3.1727278041765; Wed, 25 Sep 2024
 08:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240924224452.GN7165@pendragon.ideasonboard.com>
In-Reply-To: <20240924224452.GN7165@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Sep 2024 16:26:55 +0100
Message-ID: <CA+V-a8tGREVn_LWJbrKwb1HGjp4g7r=ZXu4AZWS+0RfdXhYrdg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] media: i2c: ov5645: Use v4l2_async_register_subdev_sensor()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Tue, Sep 24, 2024 at 11:45=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Sep 10, 2024 at 06:06:04PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Make use v4l2_async_register_subdev_sensor() helper to register
> > the subdev.
>
> The commit message should explain why.
>
Sure I'll update the commit message.

Cheers,
Prabhakar

