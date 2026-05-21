Return-Path: <linux-media+bounces-62457-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AOSCAnzDmqmDQYAu9opvQ
	(envelope-from <linux-media+bounces-62457-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:56:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 938D45A452F
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47BA33043C0B
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CB13C73FB;
	Thu, 21 May 2026 11:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="FqZuYwat"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752503BED5A
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 11:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364396; cv=pass; b=gGne7L7o3TK/yz+I3MGRVwYvjE3bTYkdop/P74u0zViPP7BIqeCdrkm5klSgjpE0w6TUlCvXJvUxOJaMwtF9SOkMgd6VmiWyrJwXAH3YLA8ZygrES+4xHw7czzu87WiOihI4/kPhtQD2j9rUt6wz24O1VCaN3IEZH/XzTR8dT4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364396; c=relaxed/simple;
	bh=/+lublT9PfdOW5nWD8XN2kdfMbB6V0Rg22KT+ry4thc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCIZcFQH64paQL+Bkjv4KZY1pNq+kS991jTh3RM8f8uqb1WBoq/qRGvpgltbipCs4L7ROzNhFZytutmVjFTonyBRB4NUB5GeOByGaWS8pHnmlq/Rx8Bq/TMFyECTdkADCiHMuIcllWrmgv9vDgMwDk8qo1nK9p0FuxH5CIOmBi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=FqZuYwat; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-654672a6d68so5979770d50.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 04:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779364393; cv=none;
        d=google.com; s=arc-20240605;
        b=jB1Wk1SY1P+gd0KResIKyLbpEZwTuByYFJjRu9Dn+ap3bQp+XFRDUkUGUYMg3O04hS
         oez7GGhgumaA/k0vD28vI92/VUfD25xG5PcSFCxgeCPjL6+V8TTpfIiUx+ZvesA6o7Xw
         sTqmSd8l8p498VgwDy5+Cn9jQG9/liD2OIDpcVS7t7sypaUuwI5wfYULkXpnE88DO7XU
         gQV5NQ0rr6h2c+XcZMMyHMkBbaFtCFI188lPnPz0yqHBkmnQhxrTXbSj1kU34m2ZZJ4x
         eo02HvPCW8ir6wWi0Ka/R0AGwkgaJmQTExma0D1K8NArBbCcAg58PGvjNZMevNi6avgt
         d/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0ATXJvpVl+yDdbf1L9wASD+cd9VRiDei3GKJ8PoyERQ=;
        fh=B7ifxTXUpfhvGJsPkXPZzRGOUDWcc9l2BJXuwbV02q0=;
        b=hvkWq0BGd9fZJu8ohuTLz3aXE7XUHfwQ6GwfpFOFPhkOvUeAV5w2TGpjWN+hfZtgHf
         45pK2KBiI9JFvxPdokx9NjNdsk23OdpZnaG10THHhOOlJauRmrs1MY5lKCxmVeI4Bg0H
         7+XlKYg2uENmjqMfu/rOXI4OCzh2sDeqQm/4kWNbyYyqRbxDCdAgL6tCtIAg+SxolofQ
         TsbsQ1fxw5DwvM+e3tCTV0+UqV6ygqj3RLKQUBX9JYxtRlLYMS2vk4MMw91hiUZjAZoG
         1qwCLbi61pIEvXoW2aYnyqoV2G88SsW1Z3QnRzhN3qvlWghnovHxoVXqHsZ0ckAOCQtg
         vl/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1779364393; x=1779969193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ATXJvpVl+yDdbf1L9wASD+cd9VRiDei3GKJ8PoyERQ=;
        b=FqZuYwatxuvoB+qZXho06PZq57YYqOYBAzqJj08YDBZusGeqeQ128Jl94tR62KYURa
         C/pdkEtutHzE00m4UzvkNQaOWTXjM5rc3mvL7Gl1b7QF/OpDBnZCnivClljmcqpIiuAx
         jNHFgUGjT+J2KsLBoeUBijYpJrpUfZkUfyHa8sfJJJXJbFKGpD1rWFTEwyS2El2xUJaC
         5oyOMEaIlyrNdzAR2kJF27ueNRv4l1QfltncJa2yrd/z1TigqQU57jjpj/nOtlud4TBI
         FZO6cNlkXJ225i71nslB8ybdSSoU2eFkG/OxU0wc2167HMhc0wioftMj2oPEkKz84mlE
         dcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364393; x=1779969193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ATXJvpVl+yDdbf1L9wASD+cd9VRiDei3GKJ8PoyERQ=;
        b=qy4XOgP9dCanI7HOChlLRIsPSmbueyJUEGuddnI07PIxiE+owbW9ytijUjwi8/s/Si
         n5/LVI3r/lif+pRwB00j+BE0MroKsLHn5QVHRfuv4wjs+V0ja1ymXw+9ewGHsJlZ7MbU
         nyUQeP6ZnLaximVmsvEHuOLEUeM6Rq6x9Rx2G8p5tvKVI3CghalSKx/BJpDKsLYncDwz
         GI7kOW3tsk7I+ql3y9n+swLEFYn9VxAIsg8w6oO/AvVj8u08/XnSwGjTGSBA3EjNljIy
         l2rl9PWmkIe2hI6DmK3Q48p0B9xmvwH3Q/h6LJBEi/v69e+Z5qElF8IUK+0njRAp3n46
         JZYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zolN+YsQ8xQcINOL91qMTnpH6dfHuGYl0cPR6/mEb9pUFCe4f5nDWz1wOMkjltddbIEb2rVAY085Wbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWXj0CKzgfYi9WqR63eYPr1L3N3RWl18QglAYa5MCcCUwvlkgP
	WzzHziJEHxHYJctBOJA/dOKnVu3iFeT5hJj9MUPftpXTVdDguUiqTtSbXqpEPOowvtgvNLOhsSW
	JnTZax9fMbWgvC8CRtCjq3zLzock16Y17Yp0b50DirznQjr/FrWcPBt8=
X-Gm-Gg: Acq92OGjQ06jq0PHanjRPUH+DCt6j/hm3daqnivgv6LAFrQCTEURgwvnq6WWLz0j6+6
	dvWuV01zBDOSgnc9ZYE9hEMCFzxegcuK0NX3hE4gi55Lp6l7CF8OwjyVqjqasIYqrKVgpvwQ3AO
	y/AADC1abAOZTXcrGicHOAUtRUZcrs3YxE6POCKwzAD4nUKh7cygp6kHevJJaN3u7sDA6S952WW
	mNx7BHmRBf39pc9RHkOGj/Ui1DQaCrxdmW/XDiHa5EehJ0QPNGH0pBrfsI6iiLLYcVPOf/MNJ8e
	mTUfP5SZcNJWjodpSxtxCxvruaSnPWnvZzAbOF5RZaZOnPJymKp+0DXMwtNevzd3bG79Mo0JBuJ
	vntlMwtD64knmfrgA6mVCePY9
X-Received: by 2002:a05:690e:120d:b0:65e:b97:771c with SMTP id
 956f58d0204a3-65eae0ca72cmr2031771d50.42.1779364393353; Thu, 21 May 2026
 04:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519104129.2001018-1-shravan.chippa@microchip.com>
 <CAPY8ntC4kSq21J=BF+kxO8dESd1u3+cUbgj1VQzKhGYF_pMstA@mail.gmail.com>
 <SA1PR11MB8280C7085CB7BE509107F6E481012@SA1PR11MB8280.namprd11.prod.outlook.com>
 <CAPY8ntD6_2BDiP-0zXK1X0f69btepZYCTgbMpWryZhKvZoNPpw@mail.gmail.com> <SA1PR11MB82806D01B032E83C37B97F96810E2@SA1PR11MB8280.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB82806D01B032E83C37B97F96810E2@SA1PR11MB8280.namprd11.prod.outlook.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 21 May 2026 12:52:57 +0100
X-Gm-Features: AVHnY4I2v8OsMQTZ8N2ty53sTiAnAF2sIB5zXilkKqY8xj0nqSPM135XEkzd12Q
Message-ID: <CAPY8ntAqtVuz+sxHj8gOOnM74iwn682+GEd6DHcta_UwQ42+-g@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx334: add new link frequency configuration
To: Shravan.Chippa@microchip.com
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor.Dooley@microchip.com, Valentina.FernandezAlanis@microchip.com, 
	Praveen.Kumar@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62457-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,intel.com:email,raspberrypi.com:email,raspberrypi.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 938D45A452F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 at 05:48, <Shravan.Chippa@microchip.com> wrote:
>
> Hi Dave,
>
> > -----Original Message-----
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Sent: Wednesday, May 20, 2026 6:06 PM
> > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > Cc: sakari.ailus@linux.intel.com; mchehab@kernel.org; linux-
> > media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley - M52=
691
> > <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis - M63239
> > <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar - I30718
> > <Praveen.Kumar@microchip.com>
> > Subject: Re: [PATCH] media: i2c: imx334: add new link frequency configu=
ration
> >
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the
> > content is safe
> >
> > Hi Shravan
> >
> > On Wed, 20 May 2026 at 06:21, <Shravan.Chippa@microchip.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > Sent: Tuesday, May 19, 2026 7:37 PM
> > > > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > > > Cc: sakari.ailus@linux.intel.com; mchehab@kernel.org; linux-
> > > > media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> > > > M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > > > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > > > I30718 <Praveen.Kumar@microchip.com>
> > > > Subject: Re: [PATCH] media: i2c: imx334: add new link frequency
> > > > configuration
> > > >
> > > > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > > > know the content is safe
> > > >
> > > > Hi Shravan
> > > >
> > > > On Tue, 19 May 2026 at 12:17, shravan kumar
> > > > <shravan.chippa@microchip.com> wrote:
> > > > >
> > > > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > > > >
> > > > > Add support for a new 222=E2=80=AFMHz link frequency configuratio=
n to the
> > > > > IMX334 driver and dynamically generate the supported modes array
> > > > > based on the link frequencies specified in the DTS. When multiple
> > > > > link frequencies support the same resolution, the driver selects
> > > > > the first matching entry; therefore, the link frequency must be
> > > > > explicitly defined in the DTS to avoid resolution conflicts.
> > > > > The link frequency is a read=E2=80=91only parameter and is automa=
tically
> > > > > set based on the selected resolution and DTS configuration.
> > > >
> > > > Where is the sensor setup to configure this 222MHz link frequency?
> > > >
> > > > I have a datasheet that lists support for 1782, 1188, and 891Mbit/s=
,
> > > > which equates to 891, 594, and 445.5MHz link frequencies. There is
> > > > no mention of supporting 444Mbit/s or 222MHz.
> > > > The driver switches from the default 445.5MHz to 891MHz by changing
> > > > SYS_MODE from 0x02 to 0x00 (it's an 8bit register, so I don't know
> > > > why it's trying to write 0x0100).
> > > >
> > > > As far as I can tell, this patch just changes the advertised link
> > > > frequency, but the sensor will produce exactly the same 445.5MHz
> > > > output. Can you tell me what I've missed?
> > >
> > > Hi Dave,
> > >
> > > I am attempting to change the value of the register
> > > IMX334_REG_INCKSEL2 to 0x0A in this patch, which sets the link
> > > frequency to 222 MHz and defines the supported resolutions; however,
> > > this behavior is not documented in the datasheet. Additionally,
> > > writing 0x0E to IMX334_REG_INCKSEL2 results in a 111 MHz link
> > > frequency, while writing 0x06 sets the link frequency to 445 MHz
> >
> > Apologies, I'd totally missed that you were writing
> > IMX334_REG_INCKSEL2 directly from imx334_enable_streams. So it's the
> > magic of the PLL_IF_GC bits, and they aren't documented.
> > Most likely the register is only controlling a divider, in which case t=
he link
> > frequency would be 222.275MHz.
>
>
> No need to apologize=E2=80=94I appreciate you taking the time to review i=
t. Your comments are helpful,
> and thank you for taking another look.
> Yes, the PLL_IF_GC bits are responsible for changing the link frequency.
>
> >
> > It was fairly ugly with IMX334_REG_INCKSEL2 being written from
> > common_mode_regs and then written again from mode_3840x2160_regs,
> > but now it may get written from imx334_enable_streams too.
> > It'd be nice if that was all factored out into clean handling for link =
frequency
> > (and input clock?), but seeing as this is an orphaned driver there's su=
pposedly
> > no one who really cares too much.
> >
> > A further question: if the link frequency is lower then doesn't hblank =
need to
> > be extended to allow enough time to output the data? Or is there enough
> > slack in the current timings to give enough time, or the pixel rate has=
 changed
> > too?
> > All modes except 3840x2160 advertise a pixel clock of 297MPix/s with th=
e
> > same hblank of 2480 pixels and vblank of 1170 lines. However the actual
> > HMAX register isn't changed between modes (0x44c written from
> > common_mode_regs), so I suspect they all actually give different refres=
h rates
> > from those advertised.
> >
>
> There are two additional registers related to the resolution: IMX334_REG_=
Y_OUT_SIZE and IMX334_REG_HNUM.
> I believe the hblank value is sufficient, and with a 222=E2=80=AFMHz link=
 frequency, achieving 30=E2=80=AFfps should be possible.
> Increasing the link frequency may allow the frame rate to exceed 30=E2=80=
=AFfps.

Is 30fps that max that is achievable with the current 445.5MHz link frequen=
cy?
Sony have done their usual in the datasheet of giving individual
examples rather than specifications. It lists the 2x2 binned mode as
needing 891/1188 Mbit/s for 30 or 25fps, and 1188/1782 Mbit/s for 60
or 50fps. If 30fps can actually be achieved on 222MHz/445.5Mbit/s,
then why can't 60fps be achieved on 445.5MHz/891Mbit/s?

It's a tangent, so if the modes all work at the correct frame rates
without corruption, then fine.

> > > For the 891 MHz link frequency, the SYS_MODE value is 0x100, and it i=
s
> > written automatically when the 3840=C3=972160 resolution is selected. T=
his
> > behavior does not apply to the 222 MHz mode. For the 222 MHz link
> > frequency, the required SYS_MODE value is 0x02.
> >
> > My comment was more that IMX334_REG_SYS_MODE is defined as
> > CCI_REG8(0x319e), so only the bottom 8 bits of any value will ever be t=
aken.
> > Trying to write 0x100 will therefore be equate to writing 0x00.
> > So it's more odd behaviour from the original driver rather than anythin=
g in this
> > patch.
>
> Correct. This behavior is not introduced by this patch. The register is o=
nly 8 bits wide, so writing 0x100 will result in 0x00 being written instead=
.
>
> >
> > Sorry, I saw this patch and took a look as it's another Starvis sensor,=
 but I seem
> > to be seeing various potential issues lurking.
>
> This patch only modifies the link frequency by updating the IMX334_REG_IN=
CKSEL2 register value and configures the sensor to operate at 30 fps.

Yes, sorry. It's the problem of starting to look at a new module and
starting to see the issues and ambiguities. I'll just review the
patch.
I might see if I can find a vendor of a suitable module to play with.
At least with it being a Starvis sensor they tend to stay in
production longer.

> Thanks,
> Shravan
>
> >
> >   Dave
> >
> > > Thanks,
> > > Shravan
> > >
> > > > Thanks
> > > >   Dave
> > > >
> > > > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > > > ---
> > > > >  drivers/media/i2c/imx334.c | 112
> > > > > +++++++++++++++++++++++++++++++++++--
> > > > >  1 file changed, 106 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/imx334.c
> > > > > b/drivers/media/i2c/imx334.c index 9654f9268056..336de9cd8ff2
> > > > > 100644
> > > > > --- a/drivers/media/i2c/imx334.c
> > > > > +++ b/drivers/media/i2c/imx334.c
> > > > > @@ -109,6 +109,7 @@
> > > > >  /* CSI2 HW configuration */
> > > > >  #define IMX334_LINK_FREQ_891M          891000000
> > > > >  #define IMX334_LINK_FREQ_445M          445500000
> > > > > +#define IMX334_LINK_FREQ_222M          222500000

Half of 445500000 would be 222750000.

> > > > >  #define IMX334_NUM_DATA_LANES          4
> > > > >
> > > > >  #define IMX334_REG_MIN                 0x00
> > > > > @@ -209,6 +210,8 @@ struct imx334 {
> > > > >         };
> > > > >         u32 vblank;
> > > > >         const struct imx334_mode *cur_mode;
> > > > > +       const struct imx334_mode *new_supported_modes;
> > > > > +       int new_modes_size;
> > > > >         unsigned long link_freq_bitmap;
> > > > >         u32 cur_code;
> > > > >  };
> > > > > @@ -216,6 +219,7 @@ struct imx334 {  static const s64 link_freq[]
> > > > > =3D {
> > > > >         IMX334_LINK_FREQ_891M,
> > > > >         IMX334_LINK_FREQ_445M,
> > > > > +       IMX334_LINK_FREQ_222M,
> > > > >  };
> > > > >
> > > > >  /* Sensor common mode registers values */ @@ -486,6 +490,45 @@
> > > > > static const struct imx334_mode supported_modes[] =3D {
> > > > >                         .num_of_regs =3D ARRAY_SIZE(mode_640x480_=
regs),
> > > > >                         .regs =3D mode_640x480_regs,
> > > > >                 },
> > > > > +       }, {
> > > > > +               .width =3D 1920,
> > > > > +               .height =3D 1080,
> > > > > +               .hblank =3D 2480,
> > > > > +               .vblank =3D 1170,
> > > > > +               .vblank_min =3D 45,
> > > > > +               .vblank_max =3D 132840,
> > > > > +               .pclk =3D 297000000,
> > > > > +               .link_freq_idx =3D 2,
> > > > > +               .reg_list =3D {
> > > > > +                       .num_of_regs =3D ARRAY_SIZE(mode_1920x108=
0_regs),
> > > > > +                       .regs =3D mode_1920x1080_regs,
> > > > > +               },
> > > > > +       }, {
> > > > > +               .width =3D 1280,
> > > > > +               .height =3D 720,
> > > > > +               .hblank =3D 2480,
> > > > > +               .vblank =3D 1170,
> > > > > +               .vblank_min =3D 45,
> > > > > +               .vblank_max =3D 132840,
> > > > > +               .pclk =3D 297000000,
> > > > > +               .link_freq_idx =3D 2,
> > > > > +               .reg_list =3D {
> > > > > +                       .num_of_regs =3D ARRAY_SIZE(mode_1280x720=
_regs),
> > > > > +                       .regs =3D mode_1280x720_regs,
> > > > > +               },
> > > > > +       }, {
> > > > > +               .width =3D 640,
> > > > > +               .height =3D 480,
> > > > > +               .hblank =3D 2480,
> > > > > +               .vblank =3D 1170,
> > > > > +               .vblank_min =3D 45,
> > > > > +               .vblank_max =3D 132840,
> > > > > +               .pclk =3D 297000000,
> > > > > +               .link_freq_idx =3D 2,
> > > > > +               .reg_list =3D {
> > > > > +                       .num_of_regs =3D ARRAY_SIZE(mode_640x480_=
regs),
> > > > > +                       .regs =3D mode_640x480_regs,
> > > > > +               },
> > > > >         },
> > > > >  };
> > > > >
> > > > > @@ -713,7 +756,7 @@ static int imx334_enum_frame_size(struct
> > > > v4l2_subdev *sd,
> > > > >         struct imx334 *imx334 =3D to_imx334(sd);
> > > > >         u32 code;
> > > > >
> > > > > -       if (fsize->index >=3D ARRAY_SIZE(supported_modes))
> > > > > +       if (fsize->index >=3D imx334->new_modes_size)
> > > > >                 return -EINVAL;
> > > > >
> > > > >         code =3D imx334_get_format_code(imx334, fsize->code); @@
> > > > > -721,9
> > > > > +764,9 @@ static int imx334_enum_frame_size(struct v4l2_subdev
> > > > > +*sd,
> > > > >         if (fsize->code !=3D code)
> > > > >                 return -EINVAL;
> > > > >
> > > > > -       fsize->min_width =3D supported_modes[fsize->index].width;
> > > > > +       fsize->min_width =3D
> > > > > + imx334->new_supported_modes[fsize->index].width;
> > > > >         fsize->max_width =3D fsize->min_width;
> > > > > -       fsize->min_height =3D supported_modes[fsize->index].heigh=
t;
> > > > > +       fsize->min_height =3D
> > > > > + imx334->new_supported_modes[fsize->index].height;
> > > > >         fsize->max_height =3D fsize->min_height;
> > > > >
> > > > >         return 0;
> > > > > @@ -792,8 +835,8 @@ static int imx334_set_pad_format(struct
> > > > v4l2_subdev *sd,
> > > > >         const struct imx334_mode *mode;
> > > > >         int ret =3D 0;
> > > > >
> > > > > -       mode =3D v4l2_find_nearest_size(supported_modes,
> > > > > -                                     ARRAY_SIZE(supported_modes)=
,
> > > > > +       mode =3D v4l2_find_nearest_size(imx334->new_supported_mod=
es,
> > > > > +                                     imx334->new_modes_size,
> > > > >                                       width, height,
> > > > >                                       fmt->format.width,
> > > > > fmt->format.height);
> > > > >
> > > > > @@ -914,6 +957,9 @@ static int imx334_enable_streams(struct
> > > > v4l2_subdev *sd,
> > > > >                 goto err_rpm_put;
> > > > >         }
> > > > >
> > > > > +       if (link_freq[imx334->cur_mode->link_freq_idx] =3D=3D
> > > > IMX334_LINK_FREQ_222M)
> > > > > +               cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0x0a,
> > > > > + NULL);
> > > > > +

The return value from cci_write is not checked, nor ret passed in.

I'm not maintainer of this driver, but a simple refactor to remove
INCKSEL2 from the register tables and have one switch here
switch(link_freq[imx334->cur_mode->link_freq_idx]) {
  case IMX334_LINK_FREQ_891M:
    cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0x02, &ret);
    break;
  case IMX334_LINK_FREQ_445M:
    cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0x06, &ret);
    break;
  case IMX334_LINK_FREQ_222M:
    /* Undocumented, but controlled by IF_PLL_GC */
    cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0xa, &ret);
    break;
}
would make the driver far easier to read. It'd also be trivial to add
the 111MHz link frequency at a later date if desired.

> > > > >         /* Start streaming */
> > > > >         ret =3D cci_write(imx334->cci, IMX334_REG_MODE_SELECT,
> > > > >                         IMX334_MODE_STREAMING, NULL); @@ -979,6
> > > > > +1025,55 @@ static int imx334_detect(struct imx334 *imx334)
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > +/**
> > > > > + * imx334_update_supported_mode_array() - Search for the support=
ed
> > > > > + *                                        modes add them in the =
new list
> > > > > + * @imx334: pointer to imx334 device
> > > > > + *
> > > > > + * Return: 0 if successful, error code otherwise.
> > > > > + */
> > > > > +static int imx334_update_supported_mode_array(struct imx334
> > > > > +*imx334) {
> > > > > +       int i, j, size =3D 0;
> > > > > +       struct imx334_mode *temp_ptr;
> > > > > +
> > > > > +       for (i =3D 0; i < ARRAY_SIZE(link_freq); i++) {
> > > > > +               if (imx334->link_freq_bitmap & (1 << i)) {
> > > > > +                       for (j =3D 0; j < ARRAY_SIZE(supported_mo=
des); j++) {
> > > > > +                               if (supported_modes[j].link_freq_=
idx =3D=3D i)
> > > > > +                                       size++;
> > > > > +                       }
> > > > > +               }
> > > > > +       }
> > > > > +
> > > > > +       if (!size)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       imx334->new_modes_size =3D size;
> > > > > +
> > > > > +       size =3D 0;
> > > > > +
> > > > > +       temp_ptr =3D devm_kmalloc(imx334->dev,
> > > > > + imx334->new_modes_size *
> > > > sizeof(struct imx334_mode),
> > > > > +                               GFP_KERNEL);

Memory says that using devm_kmalloc_array is now preferred to protect
against overflows (however unlikely in this case).

There is kmalloc_objs as well to remove the requirement for sizeof,
but there doesn't appear to be a devm_ variant of those.

> > > > > +       if (!temp_ptr)
> > > > > +               return -ENOMEM;
> > > > > +
> > > > > +       for (i =3D 0; i < ARRAY_SIZE(link_freq); i++) {
> > > > > +               if (imx334->link_freq_bitmap & (1 << i)) {
> > > > > +                       for (j =3D 0; j < ARRAY_SIZE(supported_mo=
des); j++) {
> > > > > +                               if (supported_modes[j].link_freq_=
idx =3D=3D i) {
> > > > > +                                       temp_ptr[size] =3D suppor=
ted_modes[j];
> > > > > +                                       size++;
> > > > > +                               }
> > > > > +                       }
> > > > > +               }
> > > > > +       }
> > > > > +
> > > > > +       imx334->new_supported_modes =3D temp_ptr;
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > >  /**
> > > > >   * imx334_parse_hw_config() - Parse HW configuration and check i=
f
> > > > supported
> > > > >   * @imx334: pointer to imx334 device @@ -1038,6 +1133,11 @@
> > > > > static int imx334_parse_hw_config(struct
> > > > imx334 *imx334)
> > > > >                                        link_freq, ARRAY_SIZE(link=
_freq),
> > > > >                                        &imx334->link_freq_bitmap)=
;
> > > > >
> > > > > +       if (ret)
> > > > > +               goto done_endpoint_free;
> > > > > +
> > > > > +       ret =3D imx334_update_supported_mode_array(imx334);
> > > > > +
> > > > >  done_endpoint_free:
> > > > >         v4l2_fwnode_endpoint_free(&bus_cfg);
> > > > >
> > > > > @@ -1251,7 +1351,7 @@ static int imx334_probe(struct i2c_client
> > *client)
> > > > >         }
> > > > >
> > > > >         /* Set default mode to max resolution */
> > > > > -       imx334->cur_mode =3D &supported_modes[__ffs(imx334-
> > > > >link_freq_bitmap)];
> > > > > +       imx334->cur_mode =3D
> > > > > + &imx334->new_supported_modes[__ffs(imx334->link_freq_bitmap)];

Does this work now?
It was relying on mode[0] using link_idx 0, and mode[1] using link_idx
1. If link frequency 0 wasn't enabled, then it switched to a supported
mode.
You're now generating your own version of the table with only the
modes where the corresponding link frequency is enabled, so shouldn't
the default just be imx334->new_supported_modes[0]?

  Dave

> > > > >         imx334->cur_code =3D imx334_mbus_codes[0];
> > > > >         imx334->vblank =3D imx334->cur_mode->vblank;
> > > > >
> > > > > --
> > > > > 2.34.1
> > > > >
> > > > >

