Return-Path: <linux-media+bounces-33198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E2DAC13CA
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 20:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6903216B5DB
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 18:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449931EDA04;
	Thu, 22 May 2025 18:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="FvzIxiaI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570D81EC01F
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 18:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940245; cv=none; b=A3Jjd5SdcyuPaG5Dl55z5aNwdsOKVDlkhKKY/CJ6anwckGbtdLWUKF533bKShHEq1roTWXxRJRthR99kk3IreHjksiSSn6PwW8Bb7Zdz6Kv23yZjwShgyl60ZyE9dMELad0wySu5e2b+BUlpSS0mvuZFjGL9zKmafuVoUpn4RQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940245; c=relaxed/simple;
	bh=nRdyDoXu64jIJ8Y7YBIH/yF7ZXDgNxt/Zb8gayh7VQU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cdGtKcSfTABWLrGKRmeCKPzCLvUpsNZxYx22CBVvXkQ0uKIFOUNLJoBSBxQ6iZozv2b2AlfRmrPxGbYLkSLr1rvObATd4NOo25c0p4KP9xO1KdLPsGFWVRjSfeNyHWzhGl/O+e8f2JLCZcTC9Np2UypArDquA0T5mf5ZuHY7fcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=FvzIxiaI; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7caea4bc9e9so1338958485a.1
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747940243; x=1748545043; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bKDF0rG/fer+2OkTia/V0rbvp3EJG9E9bbf9h1+yVQU=;
        b=FvzIxiaI9+B+nYi/JEz8JKN3fC5FPbsv3sHr+u29QfciFf12LcRBbiLbY9Qugo59fS
         ujAdJ0a0pb1/ZPWjkjAUTDydB7iqwZcwlVQcH2R38mgg6J5Xnxhz90u7SMHyaFRFVXH3
         eVBzg8CQtk+I5t/oG8qKniZ1KVA9p1eHlPxY246ErT1j6tSwPXgrP0Q7xykEvntVxhxC
         rURhwlml72gnT8MV5Vs+pP27E0xV6G0fGLPSo/7v+LE4vGoCNCwnOysJa34UrcGDQWf3
         75ZTHyCPJI/FSKge2B5+pfkrRp/jqJ7zcKrsbRwr5IL7w+o4ztG2f8Tdjbt5MX8PF2jU
         TjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940243; x=1748545043;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKDF0rG/fer+2OkTia/V0rbvp3EJG9E9bbf9h1+yVQU=;
        b=tVY06cRayP1sAAqfPWKn8dEkjbiJqzj4O9eq4R/8Lh/kgdEuTIYMjH96hMcJQ/OLle
         S/4V8IVqyfRqwUSaxDe6cDgvpiqZG/N8SPNi0TNefJ3caI5TMtV1ckGnW51Y2zXEakhv
         PYGSGvzWwwI1L0QRFHZg33ldjPuaeSQFV13bld0XgcDYO+Ov+1QRgBeufKTS8w7KMUnX
         J1u0PkmUu+xoiAJBYxWQfTY7herLicZVLHT2Lx3UcWHX/FdOyyrGqiTL0LRQ+G4eOkyD
         SaIYGZl0OTde5F865gPHXBNKG9wXWgcm6GGeyKmvX0Ss70kbekNYXjag1BRfxrEnGkiV
         Wa/w==
X-Forwarded-Encrypted: i=1; AJvYcCUoDL4Hd3SjSZP210x3HRVBYpXctfaPE8GlG8t2RAdUzp4vmoR63AAnABjOAAeFRSPDdVsw2y1souJ0oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ1o1rgzvKmDrLZgsCSbNdHyE+88vMiTpWlXrqN3cncr22LI22
	7SgUCmNYCDxRHpnvt0LbHbPNO6DRAED+tJajnjb88+pwkT0u+RbJhD/4q1Yu9T1NjGU=
X-Gm-Gg: ASbGncsYutmtFxrNE4USySeTHqyYa+fsjXNt/JPYjUMuIGALVcf8C+1B6UckloMrdwx
	uZvCVlQdF2AaUXJFl5Farz/ft7ob5lE3jaX0QvkiQA0zMK9ADMoW5xUgGaS8uSe1vUwmfMohbk3
	UPNPLAdZF5KVPba5q8GmTVigtDjuU/5z2Hs3FKUKS+8uhcnfyNCl4Osd7h5pUrgKNwoRynGMt3u
	nLtp8O94RO8UqA5dKvsouEOQE4tLmYN+H5fqS/jUmMu6COcPdlKIQy4+zIjwhK+rcLijo2NI3PA
	o8l/8LoFViJ4dQgbBKPlldmDGKDLfuy4iF0O1CpgZJKa6mufqBxcKasU
X-Google-Smtp-Source: AGHT+IGODjylhCbxxluSCJxWwfw2LSUZOhOlLONS1CCWl3mGWECFOnr+7cX5kbAgDceujcx1nVam2g==
X-Received: by 2002:a05:620a:400c:b0:7c7:a524:9fe9 with SMTP id af79cd13be357-7cd47f4bbafmr3554668185a.27.1747940243241;
        Thu, 22 May 2025 11:57:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467ecf98sm1060304285a.61.2025.05.22.11.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:57:22 -0700 (PDT)
Message-ID: <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
Subject: Re: [PATCH 1/1] dt-bindings: media: convert fsl-vdoa.txt to yaml
 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo	 <shawnguo@kernel.org>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org
Date: Thu, 22 May 2025 14:57:22 -0400
In-Reply-To: <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
	 <174448105342.1415739.9619142538994119426.robh@kernel.org>
	 <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Frank,

Le jeudi 22 mai 2025 =C3=A0 14:49 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Sat, Apr 12, 2025 at 01:04:14PM -0500, Rob Herring (Arm) wrote:
> >=20
> > On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> > > Convert fsl-vdoa.txt to yaml format.
> > >=20
> > > Additional changes:
> > > - Add irq.h and imx6qdl-clock.h in example.
> > >=20
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > =C2=A0.../bindings/media/fsl,imx6q-vdoa.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 42 +++++++++++++++++++
> > > =C2=A0.../devicetree/bindings/media/fsl-vdoa.txt=C2=A0=C2=A0=C2=A0 | =
21 ----------
> > > =C2=A02 files changed, 42 insertions(+), 21 deletions(-)
> > > =C2=A0create mode 100644 Documentation/devicetree/bindings/media/fsl,=
imx6q-vdoa.yaml
> > > =C2=A0delete mode 100644 Documentation/devicetree/bindings/media/fsl-=
vdoa.txt
> > >=20
> >=20
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>=20
> All:
> 	Anyone pick this patch?

Thanks for the highlight, this is stuff from before my time and I had not a=
ssociated it
with CODA initially. I've picked it now.

regards,
Nicolas

>=20
> Frank
> >=20

