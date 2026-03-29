Return-Path: <linux-media+bounces-57484-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKYpB5CVyGm3ngUAu9opvQ
	(envelope-from <linux-media+bounces-57484-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 04:59:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D83507C9
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 04:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E4B53022612
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 02:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDCF246783;
	Sun, 29 Mar 2026 02:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjlHrrNP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C0419C542
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 02:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774753017; cv=pass; b=diI5EH7Gc4m7iha724S1ar5zIhmpc3wQY53D6TK8T+VnhbxCkXKnDtYYbqfOTyPwCJOY+cjJLhHpdmizL+xiXrn1xx1WbZECY78PND42c74C+VCQn4SxGZKf2eExFF1aeFI57lbRcIETg1ZshdA61j6TDAcu6szi91wUAE8JvNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774753017; c=relaxed/simple;
	bh=h2DicfNpPExxcHWS80zvda7VTpsNVBUd9eE8bZPt/ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zwf03e2VuDiQXFhrdSUM8QwiDcsYu7lmAxVZBISzbdLBcNBl9fVrLJD2udgZh8Rxa3uaOAEWrC+KrgFp5IhXX7KaxAc+1Gl5ElBpPVzK4VUaWQKcY1itn/wq6Wur7eb4aKeUwAJT/+xYGjFWgpgewfQ/hPZ+bDDdTLXeUcOX/q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjlHrrNP; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cfb723793so32727f8f.2
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 19:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774753015; cv=none;
        d=google.com; s=arc-20240605;
        b=VZLn+8AvO50v3EgUdeOZKI7XD1Zu2u2kOikukTK0D3Nb5WbAi1xBsP/hhRyZ6SVmyV
         ZpRoqVPpFlWNF1wz1VMbkYB4yWhpoHLMkS05YEeBqbPxv+wHZeSjOa7FEmTXUg5zb1xi
         NQDJrIXP2Blvb530nbNbFWJN3+4RfSICbok5VD28xNNypUvh3bo9b2hMgAScCfJNIyrr
         HUq1KIP/ru3dxG3ZBqOdXXJGhBYJoD4RZDbDgIrj1gvLqvxxOL2bTlzi3G6M+wnP89M9
         w5hzn3KiCoxuAaZ/JtW83kngrHqmJj3S5bHOBBOmWFWD7WBNRSXLGyW8Wf6kcTj2gTVg
         MxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wpb8nwujEKpsfmT5yQ3f8kjOQr6IpjYfWqzW1WbGY+Y=;
        fh=WVfjn7XRbdGXT9/qMZ0bVSv6vAymN5GEs3Lt+h84a+E=;
        b=BCdW2DQBPqmqS+3uxIVyjUPo0UMmHcKwJmBSCceCcpGG2hyS84rByO24W7ly2isjBL
         5LNcU60l8CShmya0ErP2nwdSZxVsRgm1RuPwxw/OF2ssZ4pI/Nonq7DgSwfr2VQqe1Iq
         x6o7uKHwjKdfxv1OtMq5yY+l418Iej1JoWBDtgnH/Vql3cgZDitcMGuEsd2cPyX4afi5
         CM6IAwRj032xWWLScMCVTGKSZabF3j0vb5b4gAMQXqi7H46/ZtEfx2plJ30504q9MmoU
         nDbe6zjVj+tnBQagGZhvQYNWD9mo1ODORJYOwNZV2DXJ/wRm+jcRBeymR4ROX6cR16sR
         8+9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774753015; x=1775357815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wpb8nwujEKpsfmT5yQ3f8kjOQr6IpjYfWqzW1WbGY+Y=;
        b=UjlHrrNPMQkEMEAdgKWIR0gAtfqE+r/ivCXBJ2MSb3a6WhlrroACXjgPcOuiotUMd4
         1yailhfgUbO/2DDi694R1LXdVC1ovhfwMgMa9GIBc8CZJ51YL5klhXy9v46PrHUmxc93
         9RMhg8oRO9VYH96t9/JXs9V+ncZohaST31gOWXdt8d27NdstYTQZipbvcUBtAzuLxak6
         jnUaOb1sscj/jhyYvC4ncZ0xz/QKyvSITpy4VKKmZhaoIExkMEgoXpW63nrQaOU3xFAJ
         sXlFeZiHmutOpV25JedRuThUBop5Gb9NbJyiqO2uoF3/sL9YDDjziAq+t0ZydaQMnMEl
         V9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774753015; x=1775357815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wpb8nwujEKpsfmT5yQ3f8kjOQr6IpjYfWqzW1WbGY+Y=;
        b=Uiy2Q32DuXIIFzFd4etiLPZrUz7uiBjGUOdnTxf0WixcEnGhOAolxvdfnWRmZqFm6j
         CIgV31D5NOyDSQPWdISygms4Q3fJQEpj/klHbyYijfHkgvxBs/bcAenc9oErI03TGZ65
         MbcLV1xsvLiIhGoV4UmLzjm/Dlyte8DrcrpsxHOzN0l2s9wjvwsE9yUM+NfE0hRy3d5f
         wSJkJZw0w/4ura6fr4bewdhwDCORZLrCeudnRS3VJzm9L7JH4SqL55cbqx7BV+/FVErL
         A7zaKF+wkthMNNpgeQSepMFFlR88gajzeIsIqARkzHvacssqHrymy9HqlO685xtgURG5
         xRYA==
X-Forwarded-Encrypted: i=1; AJvYcCUhBhi/6deWSYO2h3Zanj3QXK0y8OdKF3ts8k1tc7o4B01YYeJ8HAidyYx4Kqqfhft/kj7Zpuf8oyzxXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXrZ7r29S7EDOrhLmDE44brKLKWFcJ0JEvqt9LfSArI1Dps4tD
	TvQp8duibBI0AAxZ6nCXEDUvnMDfWs1raclQzEygtaVmUSy8/xu9SX9i/u/3+EIllym1K9j8ht5
	s506WM+kmsEWa/TAdZTo0kCo0aCrU3bE=
X-Gm-Gg: ATEYQzxM+aW0cBnOhfAaF9XTRUeEpd8tCeVv7vcMZtbD/YTn/F4tdsvKTdyGKrciDCZ
	x+0JCUbtxprBolpMp5zrQLrosAVifyLzyVJwBfub83I/k5YC7x3Y/p6QrWkHhaRNngbBVot3gXW
	lVdGDnmy3egd03x4ixTsX/Eduk4HzwWMYY7bhi+vtuCOGwm1E5c522V3KcTph/CFi+h/g+oVvHv
	5tH/bqgb3Omlz0YV+4I+JjLQY+SvXezj0YIWtBxIDZuevURvvcGALs2FbkNoFUG20iJsN7KpKTO
	8I8NAvzkhAGkg3Us1/oWaqzX9s9/yZZkQusqov137D/4XfgmKxQaKaau4rSAG71IN91HmA==
X-Received: by 2002:a05:6000:2c06:b0:43b:8766:600c with SMTP id
 ffacd0b85a97d-43b9ea762f0mr13084257f8f.46.1774753014417; Sat, 28 Mar 2026
 19:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260328132902.776757-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <acfe0wCdyX20In8I@kekkonen.localdomain>
In-Reply-To: <acfe0wCdyX20In8I@kekkonen.localdomain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 29 Mar 2026 03:56:28 +0100
X-Gm-Features: AQROBzDKCKhU_V9-7RKZCTg9yXbm7ZKHc3jtnV0RRErPnQzQkJSteI-yL8BFEeI
Message-ID: <CA+V-a8swD0OLWTWM9-_esJ5=rsv7=i4BvrHwgEOGK2NNS1azkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: i2c: ov5645: Report streams using frame descriptors
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57484-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 880D83507C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On Sat, Mar 28, 2026 at 1:59=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> On Sat, Mar 28, 2026 at 01:29:01PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Implement the .get_frame_desc() subdev operation to report information
> > about streams to the connected CSI-2 receiver. This is required to let
> > the CSI-2 receiver driver know about virtual channels and data types fo=
r
> > each stream.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> > ---
> > Changes since v3 [0],
> > - Added a macro for the source pad index.
> > - Updated ov5645_init_state() to use the new macro.
> >
> > [0] https://lore.kernel.org/all/20241018153230.235647-9-prabhakar.mahad=
ev-lad.rj@bp.renesas.com/
> >
> > Hi Laurent,
> >
> > Ive restored your RB tag with the above changes. Please let me know if
> > you have any further comments.
> > Cheers,
> > Prabhakar
> > ---
> >  drivers/media/i2c/ov5645.c | 29 ++++++++++++++++++++++++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > index b10d408034a1..df9001fce44d 100644
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> > +#include <media/mipi-csi2.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-subdev.h>
> > @@ -68,6 +69,8 @@ static const char * const ov5645_supply_name[] =3D {
> >
> >  #define OV5645_NUM_SUPPLIES ARRAY_SIZE(ov5645_supply_name)
> >
> > +#define OV5645_PAD_SOURCE    0
> > +
> >  struct reg_value {
> >       u16 reg;
> >       u8 val;
> > @@ -817,6 +820,29 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops =
=3D {
> >       .s_ctrl =3D ov5645_s_ctrl,
> >  };
> >
> > +static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int =
pad,
> > +                              struct v4l2_mbus_frame_desc *fd)
> > +{
> > +     struct v4l2_subdev_state *state;
> > +     u32 code;
> > +
> > +     state =3D v4l2_subdev_lock_and_get_active_state(sd);
> > +     code =3D v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0=
)->code;
> > +     v4l2_subdev_unlock_state(state);
> > +
> > +     fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > +     fd->num_entries =3D 1;
> > +
> > +     memset(fd->entry, 0, sizeof(fd->entry));
> > +
> > +     fd->entry[0].pixelcode =3D code;
> > +     fd->entry[0].stream =3D 0;
> > +     fd->entry[0].bus.csi2.vc =3D 0;
> > +     fd->entry[0].bus.csi2.dt =3D MIPI_CSI2_DT_YUV422_8B;
>
> Instead of doing this, could you use my patch here
> <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=3Dmetadata&i=
d=3D56eaab0eed55e5e777344e0b3973d8072786dd98>?
>
> Every caller needs to be changed, too, but there are less than ten so
> that's a non-issue.
>
Thats neat, sure I'll switch it to the new API. Has the patch not been
posted yet (I couldn't find it on lore)?

Cheers,
Prabhakar


> > +
> > +     return 0;
> > +}
> > +
> >  static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
> >                                struct v4l2_subdev_state *sd_state,
> >                                struct v4l2_subdev_mbus_code_enum *code)
>
> --
> Regards,
>
> Sakari Ailus

