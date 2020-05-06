Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B321C68E6
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 08:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgEFG3D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 02:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725882AbgEFG3D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 02:29:03 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1E9C061A0F;
        Tue,  5 May 2020 23:29:03 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id k12so518683qtm.4;
        Tue, 05 May 2020 23:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=fS1/vDuISkGlyu8gipr/126eanAwBwyBiL2zsLto8+4=;
        b=K2rgZVAGS9HxP3ooRdX4tv6dvx+7SrUQkMNCdKE2A6LLS7jPRIHMyFYYlxX+CaZIhM
         X3ww2JE4FbyFulxWSAQpA6sdizzPV5xDqonfxPP43vjYBmEiq03UjyIwBzx7ZgV73KSG
         47VoPSTo9mdMZEjlgF6ts32pBZniYQ+ZcjcNCvpq/3x7JX6J2fb3qeyBEp7DjfgLs12p
         QCkO9yzarB4uv7sBQNvH7wN1Q+us7ZwDUKQSwuiQ24nWlY/FqbsvyGhDbmNlAWz0raMG
         WCZhEG9nVa5bn1TDcqYci4O0gnrTWo7HGfoRWtlsIeqEji8UbxlTOzXcNH5932pN8CgX
         H1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=fS1/vDuISkGlyu8gipr/126eanAwBwyBiL2zsLto8+4=;
        b=F8vqqd0mw4eYAZS9Qlun/CTX7ZfCp4zVxCZBSSiKQNebYVwdrw8qB17qc4kRRZQMqC
         8tFbV10tkdTU/Hr2Mf5UBBJIfm8QuXv9NwtbhIbr9VSq4UpOn9HiKnxK2TJQRuCLSHPZ
         wKZs3jRip3rGIp6g1yo+QsCAE413ZnBtVhD7qKy8sUwWyJhkccH7cQgVraFQx5MtcDKP
         huJpmuCokbiEze2F7r0TmmY3c/UfG5mr75cPLp67pJ20nAthY+bG1P4pEm/ArJ4tsoGj
         de8mb+EsafGhLTwaa4j3wdMTUykJdPnhn8hHOeuo9oEqc3AKrUSpm+EGaXAIrBlG+hVK
         91bw==
X-Gm-Message-State: AGi0PuY+x2VODA+35h+h9XzpYu/m+ZSwmOnYzH//G81wQcRfneqavrnk
        u19Qoj94dLJFb+Muck6Ud2A=
X-Google-Smtp-Source: APiQypLjUMcUx34Qhck+85XSfWa7THO0BOfK8MGpx/WktyzeRW2K3f9dgoRL1SKlBpPwRSZMlzmJqA==
X-Received: by 2002:ac8:514d:: with SMTP id h13mr6778900qtn.226.1588746541995;
        Tue, 05 May 2020 23:29:01 -0700 (PDT)
Received: from dwls-dell ([177.193.195.148])
        by smtp.gmail.com with ESMTPSA id j16sm950797qkl.118.2020.05.05.23.28.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2020 23:29:01 -0700 (PDT)
Date:   Wed, 6 May 2020 03:28:17 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     "=?utf-8?Q?sean=40mess.org?=" <sean@mess.org>,
        "=?utf-8?Q?kstewart=40linuxfoundation.org?=" 
        <kstewart@linuxfoundation.org>,
        "=?utf-8?Q?allison=40lohutok.net?=" <allison@lohutok.net>,
        "=?utf-8?Q?tglx=40linutronix.de?=" <tglx@linutronix.de>,
        "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>,
        "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" 
        <linux-kernel@vger.kernel.org>
Message-ID: <81B965F9-3A09-40D0-87DF-611A153E744C@getmailspring.com>
In-Reply-To: <20200503095105.6b8f0d3f@coco.lan>
References: <20200503095105.6b8f0d3f@coco.lan>
Subject: Re: [RFC, WIP, v4 08/11] media: vidtv: implement a PSI
 generator
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,



>> +static u32
>> +vidtv=5Fpsi=5Fts=5Fpsi=5Fwrite=5Finto(struct psi=5Fwrite=5Fargs args)=

>> +=7B
>> +	/*
>> +	 * Packetize PSI sections into TS packets:
>> +	 * push a TS header (4bytes) every 184 bytes
>> +	 * manage the continuity=5Fcounter
>> +	 * add stuffing after the CRC
>> +	 */
>> +
>> +	u32  nbytes=5Fpast=5Fboundary =3D (args.dest=5Foffset % TS=5FPACKET=5F=
LEN);
>> +	bool aligned              =3D nbytes=5Fpast=5Fboundary =3D=3D 0;
>> +
>> +	/*
>> +	 * whether we need to fragment the data into multiple ts packets
>> +	 * if we are aligned we need to spare one byte for the pointer=5Ffie=
ld
>> +	 */
>> +	bool split =3D (aligned) =3F
>> +		     args.len > TS=5FPAYLOAD=5FLEN - 1 :
>> +		     nbytes=5Fpast=5Fboundary + args.len > TS=5FPACKET=5FLEN;
>> +
>> +	/* how much we can write in this packet */
>> +	u32 payload=5Fwrite=5Flen =3D (split) =3F
>> +				(aligned)     =3F TS=5FPAYLOAD=5FLEN       :
>> +				TS=5FPACKET=5FLEN - nbytes=5Fpast=5Fboundary :
>> +				args.len;
>> +
>> +	struct psi=5Fwrite=5Fargs new=5Fargs =3D =7B0=7D;
>> +	struct vidtv=5Fmpeg=5Fts ts=5Fheader =3D =7B0=7D;
>> +
>> +	u32 nbytes =3D 0;  /* number of bytes written by this function */
>> +	u32 temp   =3D 0;
>> +
>> +	/* Just a sanity check, should not really happen because we stuff
>> +	 * the packet when we finish a section, i.e. when we write the crc a=
t
>> +	 * the end. But if this happens then we have messed up the logic
>> +	 * somewhere.
>> +	 */
>> +	WARN=5FON(args.new=5Fpsi=5Fsection && =21aligned);
> =20
> Please use a ratelimited printk instead (here and on all similar cases
> at the TS generator).
> =20
> Also, I think that, on such case, the driver should be filling the
> remaining frame with pad bytes. E. g.:
> =20
> 	/* =20
> 	 * Assuming that vidtv=5Fmemset() args from patch 06/11 were changed =20
> 	 * according with this prototype: =20
> 	 */
> 	size=5Ft vidtv=5Fmemset(void *to, size=5Ft to=5Foffset, size=5Ft to=5F=
size,
> 			    u8 c, size=5Ft len);
> =20
> =20
> 	=23define TS=5F=46ILL=5FBYTE 0xff
> =20
> 	if (args.new=5Fpsi=5Fsection && =21aligned) =7B
> 		pr=5Fwarn=5Fratelimit(=22Warning: PSI not aligned. Re-aligning it=5Cn=
=22);
> =20
> 		vidtv=5Fmemset(args.dest=5Fbuf,
> 			     args.dest=5Foffset + nbytes=5Fpast=5Fboundary,
> 			     args.dest=5Fbuf=5Fsz,
> 			     TS=5F=46ILL=5FBYTE,	=09
> 			     TS=5FPACKET=5FLEN - nbytes=5Fpast=5Fboundary);
> 		args.dest=5Foffset +=3D TS=5FPACKET=5FLEN - nbytes=5Fpast=5Fboundary;=

> 		aligned =3D 1;
> 		nbytes=5Fpast=5Fboundary =3D 0;
> 	=7D
> =20

Sure, that's fine then=21 Just to be clear this should not happen at all,=

because the writes should go through one of these four functions (IIRC=21=
):

u32 vidtv=5Fts=5Fnull=5Fwrite=5Finto(struct null=5Fpacket=5Fwrite=5Fargs =
args)
u32 vidtv=5Fts=5Fpcr=5Fwrite=5Finto(struct pcr=5Fwrite=5Fargs args)

...which will write a single packet at a time, thus leaving the buffer
aligned if it was already aligned to begin with,

and

u32 vidtv=5Fpes=5Fwrite=5Finto(struct pes=5Fwrite=5Fargs args)
static u32
vidtv=5Fpsi=5Fts=5Fpsi=5Fwrite=5Finto(struct psi=5Fwrite=5Fargs args)

...which will pad when they finish writing a PES packet or a table
section, respectively.

I left these warnings behind as a way to warn me if the padding logic
itself is broken.



> Please use a ratelimited printk instead (here and on all similar cases
> at the TS generator).

OK.



>> +static void vidtv=5Fpsi=5Fdesc=5Fto=5Fbe(struct vidtv=5Fpsi=5Fdesc *d=
esc)
>> +=7B
>> +	/*
>> +	 * Convert descriptor endianness to big-endian on a field-by-field
>> basis
>> +	 * where applicable
>> +	 */
>> +
>> +	switch (desc->type) =7B
>> +	/* nothing do do */
>> +	case SERVICE=5FDESCRIPTOR:
>> +		break;
>> +	case REGISTRATION=5FDESCRIPTOR:
>> +		cpu=5Fto=5Fbe32s(&((struct vidtv=5Fpsi=5Fdesc=5Fregistration *)
>> +			     desc)->format=5Fidentifier);
>> +		pr=5Falert(=22%s: descriptor type %d found=5Cn=22,
>> +			 =5F=5Ffunc=5F=5F,
>> +			 desc->type);
>> +		pr=5Falert(=22%s: change 'additional=5Finfo' endianness before
>> calling=5Cn=22,
>> +			 =5F=5Ffunc=5F=5F);
> =20
> The above pr=5Falert() calls sound weird. Why are you unconditionally
> calling it (and still doing the BE conversion) for all
> REGISTRATION=5FDESCRIPTOR types=3F

To be honest, I did not know what to do. Here's what 13818-1 has to say
about registration descriptors:

>2.6.9
> Semantic definition of fields in registration descriptor
>format=5Fidentifier =E2=80=93 The format=5Fidentifier is a 32-bit value =
obtained
>from a Registration Authority as designated by
>ISO/IEC JTC 1/SC 29.
>additional=5Fidentification=5Finfo =E2=80=93 The meaning of
>additional=5Fidentification=5Finfo bytes, if any, are defined by the
>assignee of that format=5Fidentifier, and once defined they shall not ch=
ange.

So I took the cue from libdvbv5 and defined the following struct for it,
with a flexible array member at the end:

struct vidtv=5Fpsi=5Fdesc=5Fregistration =7B
	u8 type;
	u8 length;
	struct vidtv=5Fpsi=5Fdesc *next;

	/*
	 * The format=5Fidentifier is a 32-bit value obtained from a Registratio=
n
	 * Authority as designated by ISO/IEC JTC 1/SC 29.
	 */
	u32 format=5Fidentifier;
	/*
	 * The meaning of additional=5Fidentification=5Finfo bytes, if any, are
	 * defined by the assignee of that format=5Fidentifier, and once defined=

	 * they shall not change.
	 */
	u8 additional=5Fidentification=5Finfo=5B=5D;
=7D =5F=5Fpacked


As you know, I was changing the endianness from host to BE before
serializing and then changing back from BE to host. Given the struct
definition above, there was no way to do this to the
'additional=5Fidentification=5Finfo' member, since we do not know its lay=
out.

If we go with your approach instead (i.e. using =5F=5Fbe16, =5F=5Fbe32...=
etc)
then I think we can remove these two functions (and more)


thanks,
- Daniel
