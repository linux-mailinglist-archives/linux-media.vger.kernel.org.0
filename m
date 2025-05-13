Return-Path: <linux-media+bounces-32375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CCAAB510B
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 12:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7E4A3A5DC0
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 10:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AEE2459CD;
	Tue, 13 May 2025 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="bXTcTOeM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D80C23C504
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130662; cv=none; b=Y/Rhb6I/XmwWvXiOBXScQ/k5pgSZMXI+rUvV9lmqNh8uunvixyLfoyt14HtlH/dlk5mPksG3BvifsdbMw983+NnLnCEbbnahJBUUDgVi1qa9Y1xDO+GB+bq8WIRdDmwusohBlYX3n7S+axUretjLsjbneArNqTd72CH9Sq19Ipw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130662; c=relaxed/simple;
	bh=zEfhytstlDkqj82UOmgoPZOLmKEXdL1GRGuVw5WQqjU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XNmnBb3O6RScuKqn75WE3l/GRmrjb7Ojyx3KYTC4VwxuSPhny9Lfa2B+uerrF4We5oslifSlFXXJdNwZ04NIy14ZtKuTsSroiNStQLJteGMJYdL6j9ZZN4B82P0WDht0ygk4+QVi4PzgkzHVsq4C5D9nkSYMOXsAzqVDmbwIKW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=bXTcTOeM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0b9af89f2so3229534f8f.3
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747130658; x=1747735458; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zEfhytstlDkqj82UOmgoPZOLmKEXdL1GRGuVw5WQqjU=;
        b=bXTcTOeM4Sk+kG6iE+o+W7wNRbb/RLwjjYtmGKp2AjdE7JpMb+vNG4bwFR8OnYuVnv
         u3/YAobRtij8V6nAAZc86arXf+rVW51hCdZMOBLW7PDSUdCXlQ+ZNuHhpZiN6VTzImpQ
         l3HCcIZAewpDQburTrnkNZas/RsQ7BNFScWLkLNjerBvug2MR6W6+bwqPin06sCi7aLt
         33ba8EH6af34+lN/j8VmDg3GjASU67ddzn3gn5WfmXSq49mqEgWU0oX0I+cmMANQgjWH
         cR+4bCWEVDi+CLPMOhxbnhsjoPHxRlNtqjKFw3F3TRIRxrTlZvjYWX4wuasFFTk1W6n5
         7W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130658; x=1747735458;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEfhytstlDkqj82UOmgoPZOLmKEXdL1GRGuVw5WQqjU=;
        b=MyUB/M2+XmLVbbWVHq5nwLuSoIbE6yU8S/bbaVYdARPgzZvetKgRF9DMdeYAnhLE4U
         jjJjg6FXmnchXq4eq/bs2X5WufPvMpEtEKOoAq2y5c1gDpSEhomQAX4WSPz8+SKlG3f5
         EdCh2jQc/8FtACZwW/xem8VnmQHsDD2PPeJbadQHx5SY7XiwMpjZjpqhsAstbTrwFlSM
         yYf3BZNW4ybtbzqRXTKx66EAKksS7Uln3vq+VdNC0S5CtcBHsWWJvJZqdQGCvR9+3qKg
         NraOBo5H22PDpGgGKxYcLtb6c46g4QvCBKCOqqzYUPuzFh2d9xivVz1XhZ+MYXOgPIwn
         mL1A==
X-Forwarded-Encrypted: i=1; AJvYcCWHtVYKkTNZveVT1Ih2BR08anBU5+t1uuceIyC5QQYcUwXOWNhtqJ5xtLfjKnSndPpkVNtrYy+ooJ+N8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwurGQlOt9BybwKwHK10QFCwySAiuwj4XRV4/PAs9+gqGXHu0U3
	YfcBHP9Imx09B6qlz3pxDbTw6PRog6daL93NXBng9KOkdrUeysSYd9NgCMsXrIM=
X-Gm-Gg: ASbGnctpV73XceqkMiYHOCF7tCtq4/CrlMV58xmnL2ncc32a+ExApKQhfJR7v/ZA8QL
	IPlHiV8BZiM3YMakYuB6i24SwSe+IlcLQFDybYtCvfxuv8hZMaY2rQIwOstMyqQADSXw6Wi5ld7
	8qnq3FEksodhhOZiimmTVx8qhk9jKIxgPYrMlr5sTusU9LkDmau7UkUGcqME/+F/o6YdXsSf1o7
	2e+wUxaP+ZT/zKREqQMo9CZir9kXHO88BKSGdTzT2fOPKLWdOqvyerPS5UO4ADRdSS/wPBvGkQ8
	SE++YOu546ZWfFE29tEUaz7vQPLKzzfJfFTdS4lvcTJfTdxAg/fLn0VV5NOGnCyCyg==
X-Google-Smtp-Source: AGHT+IEdriQ4E+qJOA7Zn6jtHYXEGP6UeOKil83wAlQ3vQyDskBhkG/wY/RDNFCv5Lv0GFRWF0q0Qw==
X-Received: by 2002:a05:6000:2212:b0:3a3:2aa5:11bc with SMTP id ffacd0b85a97d-3a32aa511d4mr2343546f8f.54.1747130658372;
        Tue, 13 May 2025 03:04:18 -0700 (PDT)
Received: from [10.68.117.232] ([146.0.27.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecb46sm15728048f8f.30.2025.05.13.03.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:04:17 -0700 (PDT)
Message-ID: <e5cd5e9d64123b319bae1a73c96cd33a3ad9e805.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Greg KH <gregkh@linuxfoundation.org>, Krzysztof Opasiak
	 <krzysztof.opasiak@neat.no>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michael Grzeschik	
 <m.grzeschik@pengutronix.de>, linux-usb@vger.kernel.org, 
	linux-media@vger.kernel.org, balbi@kernel.org, paul.elder@ideasonboard.com,
 	kernel@pengutronix.de, kieran.bingham@ideasonboard.com
Date: Tue, 13 May 2025 12:04:17 +0200
In-Reply-To: <2025051317-deflation-discuss-1201@gregkh>
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
	 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com> <Y4xaXHLoiPupWM6V@kroah.com>
	 <b2e943a1-fc0e-4dd2-b38e-a1d77ed00109@neat.no>
	 <2025051253-trimmer-displease-1dde@gregkh>
	 <f07db888-8342-491b-86b1-43309a1d2456@neat.no>
	 <696f471b-c2d9-4733-9795-0fc31a48e6f8@neat.no>
	 <2025051317-deflation-discuss-1201@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Greg, Krzysztof,

Le mardi 13 mai 2025 =C3=A0 07:04 +0200, Greg KH a =C3=A9crit=C2=A0:
> On Mon, May 12, 2025 at 11:03:41PM +0200, Krzysztof Opasiak wrote:
> > On 12.05.2025 12:43, Krzysztof Opasiak wrote:
> > > On 12.05.2025 12:38, Greg KH wrote:
> > > > On Mon, May 12, 2025 at 12:19:07PM +0200, Krzysztof Opasiak wrote:
> > > > > Hi Greg,
> > > > >=20
> > > > > On 4.12.2022 09:29, Greg KH wrote:
> > > > > > On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrot=
e:
> > > > > > > Hi Michael,
> > > > > > >=20
> > > > > > > On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik w=
rote:
> > [...]
> > > > >=20
> > > > > Given that I'd like to suggest that it seems to actually make sen=
se to
> > > > > revert this unless there are some ideas how to fix it.
> > > >=20
> > > > Sorry about this, can you submit a patch series that reverts the
> > > > offending commits?=C2=A0 As it was years ago, I don't exactly know =
what you
> > > > are referring to anymore.
> > > >=20
> > >=20
> > > Sure! Will do.
> > >=20
> >=20
> > Would you prefer to have a set of actual reverts related to this:
> >=20
> > da692963df4e Revert "usb: gadget: uvc: add v4l2 enumeration api calls"
> > bca75df69aaf Revert "usb: gadget: uvc: add v4l2 try_format api call"
> > e56c767a6d3c Revert "usb: gadget: uvc: also use try_format in set_forma=
t"
> > 20f275b86960 Revert "usb: gadget: uvc: fix try format returns on
> > uncompressed formats"
> > 059d98f60c21 Revert "usb: gadget: uvc: Fix ERR_PTR dereference in
> > uvc_v4l2.c"
> > e6fd9b67414c Revert "usb: gadget: webcam: Make g_webcam loadable again"
> >=20
> > but have a negative consequence that the series isn't really bisectable=
 from
> > functional perspective. For example commit e6fd9b67414c breaks g_uvc un=
til
> > we apply da692963df4e so the series would have to go in as a whole.
> >=20
> > Or you would prefer a single commit that technically isn't a revert but=
 it
> > just "undoes" the negative consequences of "usb: gadget: uvc: add v4l2
> > enumeration api calls" (kind of a squash of all commits above)?
>=20
> Ideally we can bisect at all places in the tree, so it's odd that
> reverting patches would cause problems as when adding them all should
> have been ok for every commit, right?
>=20
> But if there are merge issues, or other problems, then yes, maybe just
> one big one is needed, your choice.

Won't a plain revert break userspace like GStreamer that have depended on
that patch for years ? In such a delicate case, wouldn't it be less
damageable to introduce workaround, like alias ? This is one personal
script against numerous users of a generic framework implementation.

I believe due to the delay, you are facing an unusual ABI breakage, which
requires a more delicate handling.

regards,
Nicolas

>=20
> thanks,
>=20
> greg k-h

