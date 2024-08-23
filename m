Return-Path: <linux-media+bounces-16661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7F395CE66
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 15:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20333282729
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 13:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A912188595;
	Fri, 23 Aug 2024 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lx2FrnCr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1036F1DFE8;
	Fri, 23 Aug 2024 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724421092; cv=none; b=fcUJmOyNrPTF/JqioUz8OycP6bKVM19L4DlDCG8cuCLXF2Gx9FyMBszcEzNmZJ79K2UJassXNL7tEMH6a9wT7Vow8iM8FOtpnljievu8KpKj4QvW0ax9G6b+zqvD6zOiXMiL08NiSLCnIdhv2QETlkrGS9BVrXaSrT39h1fz+Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724421092; c=relaxed/simple;
	bh=tXtGVbqWOgFkvTUEfar7GhxOPm5t8f7YbEn/hjBhH+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKtp+8xJeS3VHvNx82SdFm/w1FSULaIwcniSYWwSxMLIftZL/8Y0ak4GV7xUlU2jLNxzEUX1OXp+2Qxul0g+rPldz/JpzateCLjdn95a2y6Zs0dQ0mjIR88jvlXgHs/qA5Qmbktejjsuy9HeCL1vW8Ln5P8V58r1IOtQaEYYya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lx2FrnCr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50CC02D5;
	Fri, 23 Aug 2024 15:50:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724421025;
	bh=tXtGVbqWOgFkvTUEfar7GhxOPm5t8f7YbEn/hjBhH+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lx2FrnCrJmhPXZYiuRtRgvPGRbwAOeevo9Qmcj9xu8xCREyM8wVbrdrgI88cHOxs2
	 pV7K7lIE75tV7B6rehTJcekv9vticzwz5g3jxvylWIv9NYw80NcEsMVl0+ZxGq/Z4K
	 rqAvLCefWUAA8rX0sevwHl0grhGbLdUYATNssrjk=
Date: Fri, 23 Aug 2024 16:51:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, helpdesk <helpdesk@kernel.org>
Subject: Re: [PATCH v5 0/6] rcar-vin: Add support for R-Car V4M
Message-ID: <20240823135126.GK26098@pendragon.ideasonboard.com>
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUjSquBji5+UVACLaWdMhbq5EEkiUANc9LeR5d_1BvkFw@mail.gmail.com>
 <20240821115132.GA901567@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240821115132.GA901567@ragnatech.se>

On Wed, Aug 21, 2024 at 01:51:32PM +0200, Niklas Söderlund wrote:
> On 2024-08-20 09:34:55 +0200, Geert Uytterhoeven wrote:
> > On Thu, Jul 4, 2024 at 6:16 PM Niklas Söderlund wrote:
> > > This series adds bindings and support to rcar-vin for R-Car V4M by the
> > > means of adding a Gen4 family fallback compatible.
> > >
> > > Previous versions of this series added V4M support like done for VIN
> > > since the first Gen3 device, by the use of only a single SoC specific
> > > compatible value. This was done as in Gen3 almost every new device
> > > differed from the others and a family fallback was not very useful.
> > >
> > > For the Gen4 devices with a video capture pipeline currently documented
> > > the VIN instances are very similar and a family fallback can be used.
> > > This however requires updating existing DTS files to add this new family
> > > fallback. This is done in a backward compatible way and the driver
> > > retains the compatible values.
> > >
> > > See individual patches for changes since previous versions.
> > >
> > > Niklas Söderlund (6):
> > >   dt-bindings: media: renesas,vin: Add Gen4 family fallback
> > >   arm64: dts: renesas: r8a779g0: Add family fallback for VIN IP
> > >   arm64: dts: renesas: r8a779a0: Add family fallback for VIN IP
> > >   media: rcar-vin: Add family compatible for R-Car Gen4 family
> > >   dt-bindings: media: renesas,vin: Add binding for V4M
> > >   arm64: dts: renesas: r8a779h0: Add family fallback for VIN IP
> > 
> > Any chance the media parts can be accepted, so I can take the DTS
> > patches through the Renesas tree?
> 
> I would be happy to have some feedback on the media parts as well as I 
> will need to send a very similar series for the rcar-isp driver to add a 
> family fallback for Gen4. But I have hold of on posting them until I 
> knew this is the correct path forward.

I've reviewed the DT and media patches (1/6, 4/6 and 5/6), and will
include them in a pull request later today with the minor typos reproted
in the reviews fixed.

> > BTW, running b4 seems to add two bogus Acked-by tags from Conor:
> > 
> > $ b4 am 20240704161620.1425409-3-niklas.soderlund+renesas@ragnatech.se
> > Analyzing 7 messages in the thread
> > Analyzing 14 code-review messages
> > Checking attestation on all messages, may take a moment...
> > ---
> >   ✗ [PATCH v5 1/6] dt-bindings: media: renesas,vin: Add Gen4 family fallback
> >   ✗ [PATCH v5 2/6] arm64: dts: renesas: r8a779g0: Add family fallback for VIN IP
> >     + Acked-by: Conor Dooley <conor.dooley@microchip.com> (✓ DKIM/kernel.org)
> >   ✗ [PATCH v5 3/6] arm64: dts: renesas: r8a779a0: Add family fallback for VIN IP
> >   ✗ [PATCH v5 4/6] media: rcar-vin: Add family compatible for R-Car Gen4 family
> >   ✗ [PATCH v5 5/6] dt-bindings: media: renesas,vin: Add binding for V4M
> >   ✗ [PATCH v5 6/6] arm64: dts: renesas: r8a779h0: Add family fallback for VIN IP
> >     + Acked-by: Conor Dooley <conor.dooley@microchip.com> (✓ DKIM/kernel.org)
> > 
> > I cannot find these Acks in my inbox or on lore.
> > What's happening?
> 
> No idea, I can't find any Acks from Conner in my inbox neither. Both 
> patches in question where new in v4 of the series.

-- 
Regards,

Laurent Pinchart

