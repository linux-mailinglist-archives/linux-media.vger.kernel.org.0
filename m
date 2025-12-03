Return-Path: <linux-media+bounces-48145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A2DC9EF59
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 13:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 137243A4254
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 12:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B73D298CD7;
	Wed,  3 Dec 2025 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0eeT/le"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55B329D29A
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764764350; cv=none; b=AWOCAi1itenLgrRL8IJpL9J0d0MADEUnxgW+7V4St+71sPIFKex3smgZZBJ8w/Fy8c46+CW/ixcJOevWjACq01cpMj/ypTAezztW2jEjbt6grWIrDAl97TwNT2yhIFMDkHmRjsUJGytCh+RMEYvW7CHAOJKnEoJ1MvgbjQJe4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764764350; c=relaxed/simple;
	bh=c9qCQV2MwwHxy/d1vZt7uuMhVnvFVbsT7lephxyOpRo=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=kJQlVsL3YCD76xr2tdMd7DuhJkOkbdyYJ5aPaEyTP+62scTeOTDxFNRIa65wRhfjDTshvE0RtZrjWBstrvt9JqGbRmJT8lS09OdJyVB14HONCex8Pr19REf+bqzi52UYogD0hXVr/T9g6uoi3b5C04sp0iiz/O6uDEfs+SQ/TfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b0eeT/le; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so76101475e9.2
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 04:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764764346; x=1765369146; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1cAxsmEpFJXSScw6H8R77cdefHfZunUBKjjqkWhIJ4=;
        b=b0eeT/le7tEPrDsbrHfYWOs0xABzacNVFb5uii3cg5Ih0Jny+92yktQIzCq/X8RO47
         sZGy4QeDHrKbrbiiEky4rQql9LNcPKosWWJZjRLUrQPu6R+EHHseDZ9Yzul7b2T0SPUY
         L1nOOSTkcyV/DqO9X7ql06gSXbFZj1s+Q1NRat4UG5zyfcuoRoEBa2Qz9jptWcAxPqmc
         Mj3mg0SeztXSl4kxT4z2Ltloj4Cy3c9flsCc9oVIhFKDDJEhUdPy6DThOaHeit814nms
         e3UfaA6TB1w8hiy2fEbhU9iijx03Vee4cDKD0e+HhIozW2hi4I8qGPX8XBdtN8aCkIno
         tQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764764346; x=1765369146;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U1cAxsmEpFJXSScw6H8R77cdefHfZunUBKjjqkWhIJ4=;
        b=syi5PIRb7BzZO3wpvPQDBuXxRUfHzQShQH2j25ElcjEv/UuGrUpUw57mUZlciyjP6X
         A492cLU+3pLs379WrZnanVemvjLB5BARosWdvtJGRSM/i/+PTrcVEovuQjTVMN/ksUqJ
         DgIGNmU04MwLWyhvPMeyeuX3Hpk6jqw9hYnEV7dTz27DE6rkxMdnGkMyp3ilA7WX6hiL
         D7SQWQS+kZ0B//By2+mvJ6TQYa0tbxD5YQtLXZwQoH8KhNQxluVrohQKuM7r1WW4hHej
         IgVMFMcYbuIYzeTlOjEjy7kXPOTrqaLkILbWeWhmWtoP/SA3LU6UxgPKCkkuCg8Ulbat
         odAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBqrRWZurgbHY+9QexZ8O0zL2TREwyaIvjQTOfR/fagfc2gw8vOSfVEMTUVmBU2fvRezPYWz4779B3Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCCR71yMat2rh1R0TBpkeDS89IGhHVu0tIFQRMmjzxEtb93u7z
	++LxwZKyFyDTn97De+9zcW/B2xI03xIpAH0yvJ0PyKr9yhIoH5zfodRzOIpstEufrHM=
X-Gm-Gg: ASbGncu9wNiLZwBgrXs0QWr8L/pHS/zKUDkG19Z/mOyyet5kvQ+jNn3DOdPIvUqNstA
	qfF3SSi39Um0kakZUPXivutPNluZAmjqm+RJ1UWuB7VzUWaUBNc743QFFKQ2+iY+6PH06THnc2y
	vxMwkuoVoqD7GThXXgkkcoCpRBqwVwQFX/J+jX4rdhEm/gOStYBd/D1Pfyf7yIIuRVFLDyftjRA
	LCsupnNZ9gBnaY8rhikGol08XJM3yetuUQ3kxOGw5Qo5Ej+zfDnPzno+bWQHnvhQ+7eYcZ4nnqu
	ku8WMcjkticxofI+dvcKh2nEUXlI7S5NmXQfVPeOnX+3qVMofH9z9Zga0betnNHqD7VViHrOkmH
	NLzLiXODY6M00ljggrxIvt9NCUZ7kifaJ5giHbDDmk8L0IAJQQ+LmF/f2afJqbsLL78SOSs7OFm
	Gv0PvJMKekYLr7LH8oxZVAoGHkT7ldVRag9jWjnXXqkk8l9NOs0rnl
X-Google-Smtp-Source: AGHT+IHHTbJIcnGQCc0utWINMQd+ZLj+OqfQUAbKCEsDG7jK0rWei2cfpyaMVepvuB3KAsYLzf4COg==
X-Received: by 2002:a05:600c:45ca:b0:46e:4a30:2b0f with SMTP id 5b1f17b1804b1-4792af486d7mr23114625e9.29.1764764345668;
        Wed, 03 Dec 2025 04:19:05 -0800 (PST)
Received: from localhost (a109-48-201-233.cpe.netcabo.pt. [109.48.201.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a8ccdfbsm47268455e9.14.2025.12.03.04.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:19:05 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 12:19:04 +0000
Message-Id: <DEOKQZMPDTLY.3H4NBUEC3LNHE@linaro.com>
Cc: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Hans Verkuil" <hverkuil+cisco@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Martin Kepplinger" <martink@posteo.de>, "Purism
 Kernel Team" <kernel@puri.sm>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Alice Yuan"
 <alice.yuan@nxp.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Robert Chiras" <robert.chiras@nxp.com>,
 "Zhipeng Wang" <zhipeng.wang_1@nxp.com>, "Hans Verkuil"
 <hans@jjverkuil.nl>, "Sakari Ailus" <sakari.ailus@iki.fi>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 0/5] media: imx8qxp: add parallel camera support
To: "Frank Li" <Frank.li@nxp.com>, "Rui Miguel Silva" <rmfrfs@gmail.com>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
 <20250805010822.GC24627@pendragon.ideasonboard.com>
 <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>
 <20250902123920.GM13448@pendragon.ideasonboard.com>
 <aLhJDXnz9HPGrWcp@lizhi-Precision-Tower-5810>
 <aQuDSROHLGHIhtlh@lizhi-Precision-Tower-5810>
 <20251105171928.GB6046@pendragon.ideasonboard.com>
 <aQul/VGG8e3MJxhx@lizhi-Precision-Tower-5810>
 <DE1JMG95RZME.2YSV10RI9AME4@gmail.com>
 <aQzFiEOQvtZjHIsr@lizhi-Precision-Tower-5810>
 <aS9NvkAWTa42j7KW@lizhi-Precision-Tower-5810>
In-Reply-To: <aS9NvkAWTa42j7KW@lizhi-Precision-Tower-5810>

Hey Frank,
On Tue Dec 2, 2025 at 8:36 PM WET, Frank Li wrote:

> On Thu, Nov 06, 2025 at 10:58:00AM -0500, Frank Li wrote:
>> On Thu, Nov 06, 2025 at 10:34:48AM +0000, Rui Miguel Silva wrote:
>> > On Wed Nov 5, 2025 at 7:31 PM WET, Frank Li wrote:
>> >
>> > > On Wed, Nov 05, 2025 at 07:19:28PM +0200, Laurent Pinchart wrote:
>> > >> Hi Frank,
>> > >>
>> > >> On Wed, Nov 05, 2025 at 12:03:05PM -0500, Frank Li wrote:
>> > >> > On Wed, Sep 03, 2025 at 09:56:29AM -0400, Frank Li wrote:
>> > >> > > On Tue, Sep 02, 2025 at 02:39:20PM +0200, Laurent Pinchart wrot=
e:
>> > >> > > > On Tue, Sep 02, 2025 at 08:01:40AM -0400, Frank Li wrote:
>> > >> > > > > On Tue, Aug 05, 2025 at 04:08:22AM +0300, Laurent Pinchart =
wrote:
>> > >> > > > > > Hi Frank,
>> > >> > > > > >
>> > >> > > > > > Thank you for the patches.
>> > >> > > > > >
>> > >> > > > > > I've quite busy these days, and I don't believe I will ha=
ve time to
>> > >> > > > > > review this series before coming back from OSS Europe at =
the beginning
>> > >> > > > > > of September. Let's see if anyone on CC could volunteer.
>> > >> > > > >
>> > >> > > > > Laurent Pincha
>> > >> > > > > 	I hope you have good time at OSS.
>> > >> > > > >
>> > >> > > > > 	Do you have chance to review this patch?
>> > >> > > >
>> > >> > > > I'm going through my mail backlog, which is really big at the=
 moment.
>> > >> > >
>> > >> > > Understand.
>> > >> > >
>> > >> > > > I'd like someone else to volunteer to review this series. It =
won't scale
>> > >> > > > if I have to review all NXP media patches in my spare time :-=
/
>> > >> > >
>> > >> > > Yes, but none volunteer review this in passed months. Expeciall=
y key
>> > >> > > reviewer. I am reviewing i3c patches. but Not familiar v4l syst=
em yet. It
>> > >> > > need scalable solution. I can help filter some common and simpl=
e problem
>> > >> > > from beginning.
>> > >> >
>> > >> > Laurent Pinchart:
>> > >> >
>> > >> > 	Do you have chance to check this serise? this one should be rela=
ted simple.
>> > >> > 	This one sent at 7/29. Still not any volunteer to review it.
>> > >>
>> > >> I'm afraid I won't have time to review this for the time being. My =
spare
>> > >> time is already exhausted by all the other drivers I maintain upstr=
eam.
>> > >>
>> > >> > 	How do we move forward?
>> > >>
>> > >> I think this is a question for the subsystem maintainers. Hans, Mau=
ro ?
>> > >
>> > > Mauro Carvalho Chehab and Hans Verkuil:
>> > >
>> > > 	Laurent provided great help about review and land i.MX related
>> > > patches in past, who are quite famillar with i.MX chips. But he is q=
uite
>> > > busy. So the whole reviews cycles takes quite long time and offten c=
ross
>> > > some merge windows.
>> > >
>> > > 	In pull requests for 6.19:
>> > > https://lore.kernel.org/all/4989c563-47f4-478c-80c4-41f7e98597e4@ker=
nel.org/
>> > > only 10 patches, and 4 patches is trivial clean up.
>> > >
>> > > 	In reviewing patch queue, there are
>> > > 	1: media: nxp: imx8-isi: Add ISI support for i.MX95
>> > > 	   https://lore.kernel.org/imx/20251105-isi_imx95-v3-0-3987533cca1c=
@nxp.com/T/#t
>> > > 	   This one already review, but I am not sure if it capture 6.19 cy=
cle because
>> > > PULL-request already sent.
>> > >
>> > > 	2: Add MIPI CSI-2 support for i.MX8ULP
>> > > 	   https://lore.kernel.org/imx/20251023-csi2_imx8ulp-v7-0-5ecb081ce=
79b@nxp.com/
>> > >
>> > > 	3: media: add imx93 mipi/controller csi support
>> > > 	   https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nx=
p.com/
>> > > 	   This one is quite big, but first 10 patches is simple trivial cl=
eanup patches.
>> > > 	   I post at 8/27, but get first feedback around 10/27, I am not
>> > > 	   sure if missing somethings.
>> > >
>> > > 	4: This series, laurent already said no time review it.
>> > >
>> > > 	5: ap1302 sensor patches
>> > >            https://lore.kernel.org/imx/20250811-ap1302-v4-0-80cc41b9=
1662@nxp.com/
>> > >            binding already ACK, most maintainer want to pick binding=
 with
>> > > 	   driver together, but not an feedback since 8/11.
>> > >
>> > > 	I jump into and help do some review.
>> > >
>> > > 	The questions is how to move forward pending patches, like [3], [4]=
,
>> > > [5]. How to keep good community channel to avoid long time pending?
>> >
>> > Sorry, but like Laurent I am really without spare cycles to go over th=
e
>> > patch series that have arrived in media (also I do not have any hw any=
more).
>> > So, Frank or maybe Laurent knows someone that would like to be add als=
o as
>> > maintainer of this drivers for me would be great, that would also help=
 to
>> > avoid such bottlenecks.
>>
>> If there are not other candidate, I can help maintain it although I am m=
ore
>> familar with dt binding, i3c and dmaengine. I can start from simple patc=
hes
>> and we have test team to help cover testing on the real hardware.
>
> Rui:
> 	Any update? How to move forward? It was already passed more than 3
> month!

Sorry, I did not realise something was blocked because of me, specially imx=
8
related. I thought you have sent the update to MAINTAINERS.

For me it is fine, it makes perfect sense since you have access to hardware
and documentation, for you to be the maintainer and steer the features and=
=20
improvements in the imx media. you can move me to Reviewer, since there are
already other 2 persons (and Laurent already handle the pulls, thanks for t=
hat)
much more active in the IMX media subsystem.

Thanks again and Cheers,
    Rui

