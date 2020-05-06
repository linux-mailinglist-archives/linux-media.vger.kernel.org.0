Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361701C6BE3
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 10:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbgEFIgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 04:36:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:45870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728502AbgEFIgt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 04:36:49 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A1AA20714;
        Wed,  6 May 2020 08:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588754208;
        bh=50g+AtsmT/CiMEfaIWU4IUHfgtyLkycfmMYQagXxz4Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DjKgnWYPfjN9UjR2ssaDFyi62flWtTeDJmNhwAi9o72KEL4/ZKnECOcvokU0GrnN7
         3UrPrJJzRWa9/jri80nkXB+EcU1cOgp/FLJIlbQB2ag5rd4YpHcRBRKoO8an5rabOM
         5jnmU91IHeqrKcUi08Iy0qCjrQG+2J6Pa5/xBkFE=
Date:   Wed, 6 May 2020 10:36:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     "sean@mess.org" <sean@mess.org>,
        "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
        "allison@lohutok.net" <allison@lohutok.net>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "linux-kernel-mentees@lists.linuxfoundation.org" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC, WIP, v4 08/11] media: vidtv: implement a PSI generator
Message-ID: <20200506103643.699fe077@coco.lan>
In-Reply-To: <81B965F9-3A09-40D0-87DF-611A153E744C@getmailspring.com>
References: <20200503095105.6b8f0d3f@coco.lan>
        <81B965F9-3A09-40D0-87DF-611A153E744C@getmailspring.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 6 May 2020 03:28:17 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> >> +	/* Just a sanity check, should not really happen because we stuff
> >> +	 * the packet when we finish a section, i.e. when we write the crc at
> >> +	 * the end. But if this happens then we have messed up the logic
> >> +	 * somewhere.
> >> +	 */
> >> +	WARN_ON(args.new_psi_section && !aligned); =20
> > =20
> > Please use a ratelimited printk instead (here and on all similar cases
> > at the TS generator).
> > =20
> > Also, I think that, on such case, the driver should be filling the
> > remaining frame with pad bytes. E. g.:
> > =20
> > 	/* =20
> > 	 * Assuming that vidtv_memset() args from patch 06/11 were changed =20
> > 	 * according with this prototype: =20
> > 	 */
> > 	size_t vidtv_memset(void *to, size_t to_offset, size_t to_size,
> > 			    u8 c, size_t len);
> > =20
> > =20
> > 	#define TS_FILL_BYTE 0xff
> > =20
> > 	if (args.new_psi_section && !aligned) {
> > 		pr_warn_ratelimit("Warning: PSI not aligned. Re-aligning it\n");
> > =20
> > 		vidtv_memset(args.dest_buf,
> > 			     args.dest_offset + nbytes_past_boundary,
> > 			     args.dest_buf_sz,
> > 			     TS_FILL_BYTE,	=09
> > 			     TS_PACKET_LEN - nbytes_past_boundary);
> > 		args.dest_offset +=3D TS_PACKET_LEN - nbytes_past_boundary;
> > 		aligned =3D 1;
> > 		nbytes_past_boundary =3D 0;
> > 	}
> >   =20
>=20
> Sure, that's fine then! Just to be clear this should not happen at all,
> because the writes should go through one of these four functions (IIRC!):
>=20
> u32 vidtv_ts_null_write_into(struct null_packet_write_args args)
> u32 vidtv_ts_pcr_write_into(struct pcr_write_args args)
>=20
> ...which will write a single packet at a time, thus leaving the buffer
> aligned if it was already aligned to begin with,
>=20
> and
>=20
> u32 vidtv_pes_write_into(struct pes_write_args args)
> static u32
> vidtv_psi_ts_psi_write_into(struct psi_write_args args)
>=20
> ...which will pad when they finish writing a PES packet or a table
> section, respectively.
>=20
> I left these warnings behind as a way to warn me if the padding logic
> itself is broken.

OK!

> > Please use a ratelimited printk instead (here and on all similar cases
> > at the TS generator). =20
>=20
> OK.
>=20
>=20
>=20
> >> +static void vidtv_psi_desc_to_be(struct vidtv_psi_desc *desc)
> >> +{
> >> +	/*
> >> +	 * Convert descriptor endianness to big-endian on a field-by-field
> >> basis
> >> +	 * where applicable
> >> +	 */
> >> +
> >> +	switch (desc->type) {
> >> +	/* nothing do do */
> >> +	case SERVICE_DESCRIPTOR:
> >> +		break;
> >> +	case REGISTRATION_DESCRIPTOR:
> >> +		cpu_to_be32s(&((struct vidtv_psi_desc_registration *)
> >> +			     desc)->format_identifier);
> >> +		pr_alert("%s: descriptor type %d found\n",
> >> +			 __func__,
> >> +			 desc->type);
> >> +		pr_alert("%s: change 'additional_info' endianness before
> >> calling\n",
> >> +			 __func__); =20
> > =20
> > The above pr_alert() calls sound weird. Why are you unconditionally
> > calling it (and still doing the BE conversion) for all
> > REGISTRATION_DESCRIPTOR types? =20
>=20
> To be honest, I did not know what to do. Here's what 13818-1 has to say
> about registration descriptors:
>=20
> >2.6.9
> > Semantic definition of fields in registration descriptor
> >format_identifier =E2=80=93 The format_identifier is a 32-bit value obta=
ined
> >from a Registration Authority as designated by
> >ISO/IEC JTC 1/SC 29.
> >additional_identification_info =E2=80=93 The meaning of
> >additional_identification_info bytes, if any, are defined by the
> >assignee of that format_identifier, and once defined they shall not chan=
ge. =20
>=20
> So I took the cue from libdvbv5 and defined the following struct for it,
> with a flexible array member at the end:

Andr=C3=A9 (who re-wrote the libdvbv5 parsers to be more generic)
preferred the approach of keeping the structs in CPU-endian, as it
makes easier from application PoV, as the conversion happens only once
at the library.

That's not the case here. We can fill the structs in big endian,
converting to CPU-endian only on the few places we may need to read
back from it.

>=20
> struct vidtv_psi_desc_registration {
> 	u8 type;
> 	u8 length;
> 	struct vidtv_psi_desc *next;
>=20
> 	/*
> 	 * The format_identifier is a 32-bit value obtained from a Registration
> 	 * Authority as designated by ISO/IEC JTC 1/SC 29.
> 	 */
> 	u32 format_identifier;
> 	/*
> 	 * The meaning of additional_identification_info bytes, if any, are
> 	 * defined by the assignee of that format_identifier, and once defined
> 	 * they shall not change.
> 	 */
> 	u8 additional_identification_info[];
> } __packed
>=20
>=20
> As you know, I was changing the endianness from host to BE before
> serializing and then changing back from BE to host. Given the struct
> definition above, there was no way to do this to the
> 'additional_identification_info' member, since we do not know its layout.
>=20
> If we go with your approach instead (i.e. using __be16, __be32...etc)
> then I think we can remove these two functions (and more)

Yep.=20

Thanks,
Mauro
