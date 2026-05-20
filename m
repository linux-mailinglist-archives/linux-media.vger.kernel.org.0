Return-Path: <linux-media+bounces-62278-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG3nGL6qDWox1QUAu9opvQ
	(envelope-from <linux-media+bounces-62278-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:36:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B374A58DCAA
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5FF83009168
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0783E0745;
	Wed, 20 May 2026 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WguGLc18"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FCD3D34AC
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280567; cv=pass; b=Bl7QXTqUySqAXrpeoecB0wA804Jm1xEAeJGL7duMRXZqqaM1cGEsNcmavDDkfqjB7+2yTp03QDIIJqEB3/657fSpWUhH0qDPTHyox3S4bKxmvVtPDNvYNdOqnjsUcjCC2ep7vwWgeuejcx9KJLTLFo9iCobtRQSOLmzDB4TrIF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280567; c=relaxed/simple;
	bh=DsVJq4NtQasfWdaM2LENQ4V1WnLUJE8/tkp93IgGsWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCFexRhftxVcAaOIsUB0he5rdd2dVXKenV7Pe9kZr5trQRuWBl4G78n9aDin/cY9rZnXg2PAomcWJy7d2O3f+8sDYtf/1zcd5mWUOFY8bhkQRphTMyldhW8eE3zaLPTHG6iaIyqPqnTKBznH1g7571AAp4np1pf8Bvmy6DbAakk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=WguGLc18; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c0bda7f15so4765583d50.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 05:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779280563; cv=none;
        d=google.com; s=arc-20240605;
        b=NvBJCX+kQXymDa7RqkW6XMrRskUBNOaChdsjZPq4NVJxDbgZ4jjbTF3VuYtOdPyJDb
         p4A7/R3oZE9OJokYU7ktNkyCt/kMSOsMVatDPBSXdZvnLtHPh/G+2dlzTHl4ccAfY+Hl
         eZPl8sCk9hIvZoEDQKYIJ6+wKLjc7QcQ5K/h0ioFL11JJXuZYLgj2WdvyaWbX5vinWl7
         9NrguDHJjG01NLceUB25cv+qzhLlnv8iRyLkyOzUor4FAWI5KUZgDk4A3s4lILpGsF6B
         Cc1h6hL4Y7V/Vf5kEfJ44ir/tcG+X6cpvs20OL/iFMxJU8arQSv4HCOatra14Fl1ykUw
         uZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vjAZoXTKgM+101aosASKLBlXcsTtQ7fplR6pcxG9jSU=;
        fh=tyDPBg4RGjH+IFfq8/+6U/JwJAgzh8T38qM/gq+wCpY=;
        b=GMTrmJ5eoDPmiC4KGH7MssUht0mT123CTaF2id4blG88dVr2t+5QpSFcfjK6QYG/8F
         H4BehVEi/JuY6v6FDIvuk0NdprUo2ok4USiMNRPbIB/XWq/odocsmcYKliybUEJXj2IS
         GdQDNIqOUTkBTzMQ3MrLhaIOzYhfGpwpwukqwCA8Z3zrCq8yQvSxlFkoNi+pDTBjxLrU
         qadntjOtubDo3mgR+fk1xBWz/ZCZpvcfZAwyt1x/dyX174vj1DsPKlF35WBO0eNz5bp/
         oF3wHpfhhNJLI4S+fBc5NEXTCA2+FQQpDUtIdqC8GqrXtrWpBSN2JiAt4HS9cvakXdH+
         xJEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1779280563; x=1779885363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjAZoXTKgM+101aosASKLBlXcsTtQ7fplR6pcxG9jSU=;
        b=WguGLc183n3YaZSyjjvYUq8b9D0GmGCvl69SE9WNRWPl2wN+B8xbmRCRw+1/hT7G1/
         igEJV24kGNjS106wvrngRXIIQl9z9iuw8aHIy5a9zSMTYmn+UKmeYnS+NDqkwFKxjtdM
         ACt8Rhokhzo41d85e8+Go1KX4/qXDZBmijrl4LZZNXFpl5+GIaYGXBScj0VL+CsePr6q
         DrdzK8TA3dPNjws88KKLfDCas0ffYiIlNcYl18j/9YgpqcdEZ4jfLFmxf2wotiz2HeOC
         OTCUavvJ9L1AkVItGiJZse4N9JGUjIjpMBc0QkIgyHYapFKJkMW5BVUhf8i7bC79/Yfd
         7y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280563; x=1779885363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vjAZoXTKgM+101aosASKLBlXcsTtQ7fplR6pcxG9jSU=;
        b=QuFxcEoQq7XCdw4w6MC0MnvaM/Bie4l6nIgS2/xGfi+XetPVudqxLvUPEea0aq7JCC
         ICY2BCMC7nANTpmEiotEiRqn8aLX/MTkNW1rJpZ2qBXzy+k4HQ0+nejJxsQH1C+iXIK3
         afJEdlG1R2jnvxFdtPY97oxRlWPp/OfCEr57iPExBt6HYkmb4c6fcLZAK4PxPgqoltfb
         N0raGZBXca+M/fo5Vy85VPY7NyJqU8tF+myLOIaQJ5eK57khohbvHcAZx95xDnD/C6yn
         o+3ZlfMbEd1nBthNK24Yf+WHDleAuVrFzxHE+K+8sEEjz8TsQ3nhc/eyQ2P+yFCzaqvZ
         C8KQ==
X-Forwarded-Encrypted: i=1; AFNElJ+c6Npba/3mxv0jLXZ83zG8AbVuPJ49IGUpkkEYoXoSd0rPYIBAqv8U+5vQPCynNtk/XNyae+Aje7nG1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKgAJWeyMDWKhJJ4ftF8AKHNz16OGUBQ1aj4fIrR7I1fJNevQ5
	JW4m7/49IqoRZEOcJhS3yVdZGgzPr4Y0qOkURwyDRXnB0ffIz24wQCT5/pgB4r0tbf28qaoIqH9
	lDbyN8oCtoicPf2EX4tzveu1xH8ZHDE+/8/tbGSqY8w==
X-Gm-Gg: Acq92OGuoBfMxnPwN8WvFC5VfH+eBpACcHVjr31KrK6GeM5M9GfBMDXtn/Kp8G05O99
	br8GCwyDIgKisVrt3o1mz8DhhhgxX+gl+I9HELdzHRZDtexd0Ild2quEEKsw5IlqpKg57NihtVb
	2RXFeLdsJ6dWCvJ+7I0IIJem+CSsMu9Mj23xUuM67f05ugxoEeP0NprBP1MWfvT2s5Pm29EEmb3
	RoeRN0+VOFkqQO/UwSbwgVzh48hTkWVBZ2mWv2Yx/dd0/53H5guZfiG7c2VOjZQ5fUD2FcbwJL/
	ZpAd1M9SbJ6J8cNXIEPTVdCZ7gkINDB1OVxTfE/w0FIFQbkMsYOVX9BycHBZe/0WmsFewHjvHHt
	+8vBPJ6aK3F2IBXZNBaGHCI+DH8hX5fKHEJE=
X-Received: by 2002:a05:690e:13c2:b0:65e:4f53:eea2 with SMTP id
 956f58d0204a3-65e4f53f25dmr13103602d50.49.1779280562960; Wed, 20 May 2026
 05:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519104129.2001018-1-shravan.chippa@microchip.com>
 <CAPY8ntC4kSq21J=BF+kxO8dESd1u3+cUbgj1VQzKhGYF_pMstA@mail.gmail.com> <SA1PR11MB8280C7085CB7BE509107F6E481012@SA1PR11MB8280.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB8280C7085CB7BE509107F6E481012@SA1PR11MB8280.namprd11.prod.outlook.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 20 May 2026 13:35:44 +0100
X-Gm-Features: AVHnY4KT-dIY8FA0jH0rB8leBUuAAIWPGhKSgPY1jgXaxyuoDEWIBBgXgwlHxk8
Message-ID: <CAPY8ntD6_2BDiP-0zXK1X0f69btepZYCTgbMpWryZhKvZoNPpw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62278-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,raspberrypi.com:email,raspberrypi.com:dkim]
X-Rspamd-Queue-Id: B374A58DCAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shravan

On Wed, 20 May 2026 at 06:21, <Shravan.Chippa@microchip.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Sent: Tuesday, May 19, 2026 7:37 PM
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
> > On Tue, 19 May 2026 at 12:17, shravan kumar
> > <shravan.chippa@microchip.com> wrote:
> > >
> > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > >
> > > Add support for a new 222=E2=80=AFMHz link frequency configuration to=
 the
> > > IMX334 driver and dynamically generate the supported modes array base=
d
> > > on the link frequencies specified in the DTS. When multiple link
> > > frequencies support the same resolution, the driver selects the first
> > > matching entry; therefore, the link frequency must be explicitly
> > > defined in the DTS to avoid resolution conflicts.
> > > The link frequency is a read=E2=80=91only parameter and is automatica=
lly set
> > > based on the selected resolution and DTS configuration.
> >
> > Where is the sensor setup to configure this 222MHz link frequency?
> >
> > I have a datasheet that lists support for 1782, 1188, and 891Mbit/s, wh=
ich
> > equates to 891, 594, and 445.5MHz link frequencies. There is no mention=
 of
> > supporting 444Mbit/s or 222MHz.
> > The driver switches from the default 445.5MHz to 891MHz by changing
> > SYS_MODE from 0x02 to 0x00 (it's an 8bit register, so I don't know why =
it's
> > trying to write 0x0100).
> >
> > As far as I can tell, this patch just changes the advertised link frequ=
ency, but
> > the sensor will produce exactly the same 445.5MHz output. Can you tell =
me
> > what I've missed?
>
> Hi Dave,
>
> I am attempting to change the value of the register IMX334_REG_INCKSEL2 t=
o 0x0A in this patch, which sets the link frequency to 222 MHz and defines =
the supported resolutions; however, this behavior is not documented in the =
datasheet. Additionally, writing 0x0E to IMX334_REG_INCKSEL2 results in a 1=
11 MHz link frequency, while writing 0x06 sets the link frequency to 445 MH=
z

Apologies, I'd totally missed that you were writing
IMX334_REG_INCKSEL2 directly from imx334_enable_streams. So it's the
magic of the PLL_IF_GC bits, and they aren't documented.
Most likely the register is only controlling a divider, in which case
the link frequency would be 222.275MHz.

It was fairly ugly with IMX334_REG_INCKSEL2 being written from
common_mode_regs and then written again from mode_3840x2160_regs, but
now it may get written from imx334_enable_streams too.
It'd be nice if that was all factored out into clean handling for link
frequency (and input clock?), but seeing as this is an orphaned driver
there's supposedly no one who really cares too much.

A further question: if the link frequency is lower then doesn't hblank
need to be extended to allow enough time to output the data? Or is
there enough slack in the current timings to give enough time, or the
pixel rate has changed too?
All modes except 3840x2160 advertise a pixel clock of 297MPix/s with
the same hblank of 2480 pixels and vblank of 1170 lines. However the
actual HMAX register isn't changed between modes (0x44c written from
common_mode_regs), so I suspect they all actually give different
refresh rates from those advertised.

> For the 891 MHz link frequency, the SYS_MODE value is 0x100, and it is wr=
itten automatically when the 3840=C3=972160 resolution is selected. This be=
havior does not apply to the 222 MHz mode. For the 222 MHz link frequency, =
the required SYS_MODE value is 0x02.

My comment was more that IMX334_REG_SYS_MODE is defined as
CCI_REG8(0x319e), so only the bottom 8 bits of any value will ever be
taken. Trying to write 0x100 will therefore be equate to writing 0x00.
So it's more odd behaviour from the original driver rather than
anything in this patch.

Sorry, I saw this patch and took a look as it's another Starvis
sensor, but I seem to be seeing various potential issues lurking.

  Dave

> Thanks,
> Shravan
>
> > Thanks
> >   Dave
> >
> > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > ---
> > >  drivers/media/i2c/imx334.c | 112
> > > +++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 106 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > > index 9654f9268056..336de9cd8ff2 100644
> > > --- a/drivers/media/i2c/imx334.c
> > > +++ b/drivers/media/i2c/imx334.c
> > > @@ -109,6 +109,7 @@
> > >  /* CSI2 HW configuration */
> > >  #define IMX334_LINK_FREQ_891M          891000000
> > >  #define IMX334_LINK_FREQ_445M          445500000
> > > +#define IMX334_LINK_FREQ_222M          222500000
> > >  #define IMX334_NUM_DATA_LANES          4
> > >
> > >  #define IMX334_REG_MIN                 0x00
> > > @@ -209,6 +210,8 @@ struct imx334 {
> > >         };
> > >         u32 vblank;
> > >         const struct imx334_mode *cur_mode;
> > > +       const struct imx334_mode *new_supported_modes;
> > > +       int new_modes_size;
> > >         unsigned long link_freq_bitmap;
> > >         u32 cur_code;
> > >  };
> > > @@ -216,6 +219,7 @@ struct imx334 {
> > >  static const s64 link_freq[] =3D {
> > >         IMX334_LINK_FREQ_891M,
> > >         IMX334_LINK_FREQ_445M,
> > > +       IMX334_LINK_FREQ_222M,
> > >  };
> > >
> > >  /* Sensor common mode registers values */ @@ -486,6 +490,45 @@ stati=
c
> > > const struct imx334_mode supported_modes[] =3D {
> > >                         .num_of_regs =3D ARRAY_SIZE(mode_640x480_regs=
),
> > >                         .regs =3D mode_640x480_regs,
> > >                 },
> > > +       }, {
> > > +               .width =3D 1920,
> > > +               .height =3D 1080,
> > > +               .hblank =3D 2480,
> > > +               .vblank =3D 1170,
> > > +               .vblank_min =3D 45,
> > > +               .vblank_max =3D 132840,
> > > +               .pclk =3D 297000000,
> > > +               .link_freq_idx =3D 2,
> > > +               .reg_list =3D {
> > > +                       .num_of_regs =3D ARRAY_SIZE(mode_1920x1080_re=
gs),
> > > +                       .regs =3D mode_1920x1080_regs,
> > > +               },
> > > +       }, {
> > > +               .width =3D 1280,
> > > +               .height =3D 720,
> > > +               .hblank =3D 2480,
> > > +               .vblank =3D 1170,
> > > +               .vblank_min =3D 45,
> > > +               .vblank_max =3D 132840,
> > > +               .pclk =3D 297000000,
> > > +               .link_freq_idx =3D 2,
> > > +               .reg_list =3D {
> > > +                       .num_of_regs =3D ARRAY_SIZE(mode_1280x720_reg=
s),
> > > +                       .regs =3D mode_1280x720_regs,
> > > +               },
> > > +       }, {
> > > +               .width =3D 640,
> > > +               .height =3D 480,
> > > +               .hblank =3D 2480,
> > > +               .vblank =3D 1170,
> > > +               .vblank_min =3D 45,
> > > +               .vblank_max =3D 132840,
> > > +               .pclk =3D 297000000,
> > > +               .link_freq_idx =3D 2,
> > > +               .reg_list =3D {
> > > +                       .num_of_regs =3D ARRAY_SIZE(mode_640x480_regs=
),
> > > +                       .regs =3D mode_640x480_regs,
> > > +               },
> > >         },
> > >  };
> > >
> > > @@ -713,7 +756,7 @@ static int imx334_enum_frame_size(struct
> > v4l2_subdev *sd,
> > >         struct imx334 *imx334 =3D to_imx334(sd);
> > >         u32 code;
> > >
> > > -       if (fsize->index >=3D ARRAY_SIZE(supported_modes))
> > > +       if (fsize->index >=3D imx334->new_modes_size)
> > >                 return -EINVAL;
> > >
> > >         code =3D imx334_get_format_code(imx334, fsize->code); @@ -721=
,9
> > > +764,9 @@ static int imx334_enum_frame_size(struct v4l2_subdev *sd,
> > >         if (fsize->code !=3D code)
> > >                 return -EINVAL;
> > >
> > > -       fsize->min_width =3D supported_modes[fsize->index].width;
> > > +       fsize->min_width =3D
> > > + imx334->new_supported_modes[fsize->index].width;
> > >         fsize->max_width =3D fsize->min_width;
> > > -       fsize->min_height =3D supported_modes[fsize->index].height;
> > > +       fsize->min_height =3D
> > > + imx334->new_supported_modes[fsize->index].height;
> > >         fsize->max_height =3D fsize->min_height;
> > >
> > >         return 0;
> > > @@ -792,8 +835,8 @@ static int imx334_set_pad_format(struct
> > v4l2_subdev *sd,
> > >         const struct imx334_mode *mode;
> > >         int ret =3D 0;
> > >
> > > -       mode =3D v4l2_find_nearest_size(supported_modes,
> > > -                                     ARRAY_SIZE(supported_modes),
> > > +       mode =3D v4l2_find_nearest_size(imx334->new_supported_modes,
> > > +                                     imx334->new_modes_size,
> > >                                       width, height,
> > >                                       fmt->format.width,
> > > fmt->format.height);
> > >
> > > @@ -914,6 +957,9 @@ static int imx334_enable_streams(struct
> > v4l2_subdev *sd,
> > >                 goto err_rpm_put;
> > >         }
> > >
> > > +       if (link_freq[imx334->cur_mode->link_freq_idx] =3D=3D
> > IMX334_LINK_FREQ_222M)
> > > +               cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0x0a,
> > > + NULL);
> > > +
> > >         /* Start streaming */
> > >         ret =3D cci_write(imx334->cci, IMX334_REG_MODE_SELECT,
> > >                         IMX334_MODE_STREAMING, NULL); @@ -979,6
> > > +1025,55 @@ static int imx334_detect(struct imx334 *imx334)
> > >         return 0;
> > >  }
> > >
> > > +/**
> > > + * imx334_update_supported_mode_array() - Search for the supported
> > > + *                                        modes add them in the new =
list
> > > + * @imx334: pointer to imx334 device
> > > + *
> > > + * Return: 0 if successful, error code otherwise.
> > > + */
> > > +static int imx334_update_supported_mode_array(struct imx334 *imx334)
> > > +{
> > > +       int i, j, size =3D 0;
> > > +       struct imx334_mode *temp_ptr;
> > > +
> > > +       for (i =3D 0; i < ARRAY_SIZE(link_freq); i++) {
> > > +               if (imx334->link_freq_bitmap & (1 << i)) {
> > > +                       for (j =3D 0; j < ARRAY_SIZE(supported_modes)=
; j++) {
> > > +                               if (supported_modes[j].link_freq_idx =
=3D=3D i)
> > > +                                       size++;
> > > +                       }
> > > +               }
> > > +       }
> > > +
> > > +       if (!size)
> > > +               return -EINVAL;
> > > +
> > > +       imx334->new_modes_size =3D size;
> > > +
> > > +       size =3D 0;
> > > +
> > > +       temp_ptr =3D devm_kmalloc(imx334->dev, imx334->new_modes_size=
 *
> > sizeof(struct imx334_mode),
> > > +                               GFP_KERNEL);
> > > +       if (!temp_ptr)
> > > +               return -ENOMEM;
> > > +
> > > +       for (i =3D 0; i < ARRAY_SIZE(link_freq); i++) {
> > > +               if (imx334->link_freq_bitmap & (1 << i)) {
> > > +                       for (j =3D 0; j < ARRAY_SIZE(supported_modes)=
; j++) {
> > > +                               if (supported_modes[j].link_freq_idx =
=3D=3D i) {
> > > +                                       temp_ptr[size] =3D supported_=
modes[j];
> > > +                                       size++;
> > > +                               }
> > > +                       }
> > > +               }
> > > +       }
> > > +
> > > +       imx334->new_supported_modes =3D temp_ptr;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  /**
> > >   * imx334_parse_hw_config() - Parse HW configuration and check if
> > supported
> > >   * @imx334: pointer to imx334 device
> > > @@ -1038,6 +1133,11 @@ static int imx334_parse_hw_config(struct
> > imx334 *imx334)
> > >                                        link_freq, ARRAY_SIZE(link_fre=
q),
> > >                                        &imx334->link_freq_bitmap);
> > >
> > > +       if (ret)
> > > +               goto done_endpoint_free;
> > > +
> > > +       ret =3D imx334_update_supported_mode_array(imx334);
> > > +
> > >  done_endpoint_free:
> > >         v4l2_fwnode_endpoint_free(&bus_cfg);
> > >
> > > @@ -1251,7 +1351,7 @@ static int imx334_probe(struct i2c_client *clie=
nt)
> > >         }
> > >
> > >         /* Set default mode to max resolution */
> > > -       imx334->cur_mode =3D &supported_modes[__ffs(imx334-
> > >link_freq_bitmap)];
> > > +       imx334->cur_mode =3D
> > > + &imx334->new_supported_modes[__ffs(imx334->link_freq_bitmap)];
> > >         imx334->cur_code =3D imx334_mbus_codes[0];
> > >         imx334->vblank =3D imx334->cur_mode->vblank;
> > >
> > > --
> > > 2.34.1
> > >
> > >

