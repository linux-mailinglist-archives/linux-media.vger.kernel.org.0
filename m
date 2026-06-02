Return-Path: <linux-media+bounces-63358-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLqaMk+lHmq3IwAAu9opvQ
	(envelope-from <linux-media+bounces-63358-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 11:41:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF0F62BBD4
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 11:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86E3C3078AEF
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 09:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E553D16E7;
	Tue,  2 Jun 2026 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fVEbqZgA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jVLQdG+Q"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503603D092E
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392918; cv=pass; b=I96rrv79Ws5Sxd0wU6YJ0FGvD/g6ZsH/zyIJANxPJAWdJH3o9BUXaoSVj4fUe9cOMeJ2d5RC4RCx6DLLhVzyoXFsSI8zJmHsJS8E6JE3Aabd3vRSBy5Tf/EQNYJO0B4PK5tpImkX/k9ijiNbL6399jDcxL4XEmF+t0IhrFJZtxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392918; c=relaxed/simple;
	bh=AcR/IrGh9Axv+oPpVshpCz9aE1gh2hsKWZ30yAPp5WM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFOjzPkTddNI05eH1OrDU6vE5Dw7ILaMXQzywHdueFU0hdjXPqBjonkZuTDQVPssGLyfAY43IyejYhDURbIM0VAvo+g9PsaL5CPMER2WupHHn0IYBPlklrUDWb56cBxvvDpbsOrhHLYtXXiu5sIp9GX8fxLEbPqaO+ZL9wospXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fVEbqZgA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jVLQdG+Q; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780392916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2P0BRWu/OOeqQ3wMnrHboRblqR05TIAmra4X+LEf1i8=;
	b=fVEbqZgABTNmTrmS7x3lsMYlPHY83gy7yg1uSOtepCdPnWTpb99kpjfZRLhg3+bUIp7kbY
	VqXSHJ0zsxh2W4LNnp5mRdk5P6DqonCGShHlQX2T7LDeYulYGd1MInFTPKJw7bK9468qU2
	F1q6Q08L2VFjkJl+YNr05q9bDFRTO7w=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-iJp58EH0PNWCI46iWnISwA-1; Tue, 02 Jun 2026 05:35:15 -0400
X-MC-Unique: iJp58EH0PNWCI46iWnISwA-1
X-Mimecast-MFC-AGG-ID: iJp58EH0PNWCI46iWnISwA_1780392914
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43ccd517664so3353495fac.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 02:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780392914; cv=none;
        d=google.com; s=arc-20240605;
        b=kuAMi9AS1dJ3Q7Cx/YhsejvMOuQipzhdRmyfW7LQNuhj6/NLHR0q+oJCfa+NKYvZeB
         KjNQQGt2Vnp2tBZqzK6mYih1L8r42YokgI4uXx0WcaWyD7qujHG9VWUcWiw159kSPrm4
         1bVeUY00DVwc+hjkA/Eq9FG126xXIDX4/ABq8GWWMBNFP3dO1lvo5lST6cZTuO9lYyxU
         ibpVxsP90DmEX6mZormAcb5CKp8OLoI1pNCUopPA/ktHqpGAF+o3cR4USLOVnuvCjICO
         eTieJ0/OBRwtQsHqYyDwtyXlowMboogGOPuj8z+LsnhNf31PMCrXjVxV3gTUk5l69Xoz
         E3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2P0BRWu/OOeqQ3wMnrHboRblqR05TIAmra4X+LEf1i8=;
        fh=oSBiX3Rco7Xs9VUXhhC7ulpPKPjzB+IsERPizJZayfM=;
        b=eaOj4zlFHgk3+FTUbvnakRKIl5bv3z5anaoKUJ7yhGUVRyVwSryBTI5MJX1IcsJQD6
         sxFxv6ed9kUjKWot+sKFanl3BPar/tPhbpD8/rUuOL4lu7jr/7lfuMd4KhMpea+JSu33
         I+zYj4L8Pc5c3pEHIE56zOnFBZlO+WSRGg0DY25kXdtJkrasodMdMNdw6FrpUxGabdoe
         YBjTtS33vk3z84DLQ8c0hAELbKjyokdQBYMh/nRjG2nXvUU2vrs1MsFRtPLWUQVmIkOB
         8tqaGhf7aqL3Idiplr6dowOzz11h8dAodEvN6vZg51xn9GhyLR9uDSswptYSF/KG7K3U
         46UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780392914; x=1780997714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2P0BRWu/OOeqQ3wMnrHboRblqR05TIAmra4X+LEf1i8=;
        b=jVLQdG+Q+/DNP+X/l2iQXzfZsGfeZIWOtcnn0e50FpjSxq02QnYei7sYafSPmH7oJf
         h+mHoT18RFrE5UvFxA8ztUwXtxptnDDj7I2d78ODok30id2tYKp/1wJh3HOeNA8r+oLt
         tCeZnl4L916vtdtk43SGiYKn2evUn+TXPHUNrRIqR6Dh4L/k+1hYR0S8OgasJUS2ebbA
         6radVxiaG6+Mz6hwE6x5sEfddKGYl4ugdwYAM2lt2gAoZCrvyEDhFhQf0h3mFSGxlqp3
         pGQgJXWz8COwbTuv/tqNPEuqF8UWwSYOL/sYTRuF4aKRKxLjWmEi3DsQ/d/+Rj5jwMqO
         LhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392914; x=1780997714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2P0BRWu/OOeqQ3wMnrHboRblqR05TIAmra4X+LEf1i8=;
        b=bgHvYDJ/O1ulCL9xYgLEQ/vxRZjVW1XUSLDYFcFOyWXik+AFgm/XM84GW6N52pfFP5
         fBDZBh/RWaF/S1zphvDpDdrDoPJ59oygV+Q0pDQY+7xeMdbh2n7f/sqeAw8WfoKSVowW
         q5OrgxQfHlE0IfmY6BiZ9GaFS5jRsjBpO7UIDXTgjRkXaWjgVQlfbIZoZRUt2s6TQTrN
         MCVB4xV4zY2PFreYBQ004xX2rxhGHhWbSnp3Xj+OphWPzZmQrhMlXNgbd/0A7/97mq91
         2dbeQONOUJVtC720QL2cQj5zrJGap9Y6ZpfC0TgGVmhE8beoz/oZHVhXdG+8D/+2ltbf
         d2Pw==
X-Forwarded-Encrypted: i=1; AFNElJ+hk5XBRzR7DS8W0TmWOODEq//05IrXj/r8sXBcTZlF/TwZsGtaAtvCP02ApKY3XDsmoB/DmEowTH0LgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1lLEb2uHXcR58N9QUNQAe2UM2JHM52QTpz13Y+cvNeWtBKnE3
	fjymMA0OogheFpozlpGUad9Z2zSc3yXE/QFkRTq3sv9J9lGcD7UJC0EgLoxvMXdNs3nwY7gjmcq
	HNXK3oKQyj8xdBrHXTi7r2PkaFPpqr+2RRhWiYb+9WaJYdKuay6+yA+ilZ0jwoIQRI+s6f1LkXp
	E6Oda6hbCMSYr7LfYx5HeLlWfR3dISGJfDdepJaBgfrYTZnmnhQA==
X-Gm-Gg: Acq92OF6Q3CnQjkQYSyQP/941SNfPL4Ux76ghHmVKnHIFyt+MH6Iy+Ad/ul+oRAnH1I
	5xXqvWTkpzcEcpTWbpeJQjEpce9OPoOCzQkRyVmjXqlP/ehb4sC+Tz8TI5yfUhS52YQ9j38Clau
	emK1JYmkV07WHOdoaAJd/Ikxy9EQfz9NAUq5NMirF1jYtBE+RoknzWr67kV3bZZ9AO2wxnDfsit
	yhzqWiiyQFYpPymNztm52kj4NNu45/waepI7CxfkQumOA3WfaA=
X-Received: by 2002:a05:6870:9a07:b0:43b:6ecd:c696 with SMTP id 586e51a60fabf-43ca41bfa01mr8796937fac.17.1780392914248;
        Tue, 02 Jun 2026 02:35:14 -0700 (PDT)
X-Received: by 2002:a05:6870:9a07:b0:43b:6ecd:c696 with SMTP id
 586e51a60fabf-43ca41bfa01mr8796917fac.17.1780392913809; Tue, 02 Jun 2026
 02:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522031121.11968-1-hpa@redhat.com> <20260522031121.11968-2-hpa@redhat.com>
 <9727b97f-7838-4d5f-bd8a-e26dabf1d38f@gmail.com>
In-Reply-To: <9727b97f-7838-4d5f-bd8a-e26dabf1d38f@gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 2 Jun 2026 17:35:02 +0800
X-Gm-Features: AVHnY4LQ56WwhWRcknckb4Nk3hkknv2Xwbomvq7pPciGBN7BCTkmkbmdQr1Y6es
Message-ID: <CAEth8oGOEdN9wf15FZ_z73pDj9Hw0+zj_8fd_ZMbMwMkBHrUPA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] media: ipu-bridge: Add DMI information of Lenovo
 X9 to the image upside-down list
To: Damjan Georgievski <gdamjan@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Pearson <mpearson@lenovo.com>, 
	"Chen, Chi-Wei" <cchen50@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5EF0F62BBD4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63358-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Damjan,

Thank you for your review.

On Sat, May 30, 2026 at 6:33=E2=80=AFAM Damjan Georgievski <gdamjan@gmail.c=
om> wrote:
>
> On 5/22/26 05:11, Kate Hsuan wrote:
> > The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the imag=
e
> > was displayed upside-down. Add the DMI information of Lenovo X9 to
> > resolve the issue.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >   drivers/media/pci/intel/ipu-bridge.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/i=
ntel/ipu-bridge.c
> > index 32cc95a766b7..1c3364451fa3 100644
> > --- a/drivers/media/pci/intel/ipu-bridge.c
> > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > @@ -118,6 +118,20 @@ static const struct dmi_system_id upside_down_sens=
or_dmi_ids[] =3D {
> >               },
> >               .driver_data =3D "OVTI02C1",
> >       },
> > +     {
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X9-14"),
>
> Isn't this going to be an issue in the future if/when a "Gen 2" appears?

You can look into the v1 [1]. The DMI_BOARD_NAME is used to
distinguish the types of X1.
v3 covers wider ranges of X9-14 and 15. If we agree with v1, I can
revert this patch to v1.

[1] https://lore.kernel.org/linux-media/20260417083214.222189-2-hpa@redhat.=
com/

>
> Just extrapolation from my older laptop, it shows "ThinkPad X1 Carbon
> 5th" for "/sys/class/dmi/id/product_version"
>
> > +             },
> > +             .driver_data =3D "SONY471A",
> > +     },
> > +     {
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X9-15"),
> > +             },
> > +             .driver_data =3D "SONY471A",
> > +     },
> >       {} /* Terminating entry */
> >   };
> >
>



--=20
BR,
Kate


