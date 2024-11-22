Return-Path: <linux-media+bounces-21800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046DF9D5C1A
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B723D28171F
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C551DC06D;
	Fri, 22 Nov 2024 09:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="il48mVgP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EC31D9337
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732268707; cv=none; b=E1WZHzOw5fj9n/DF7mjQToUAwP8g3EjWXtEMTyz1w9K45RolpeUiYAYUhSCXqWXGQPDxGsnD1rvLJm6q2ZY4WPuJBeL64o+dJ4NUekAf4l2y3JIFguc3b6B9tcsyfkSnjgnCmqw8pJQu3vvV5ADTYFEYgBPy80wOWLPXxd8SLtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732268707; c=relaxed/simple;
	bh=rh5y7iuvpjJm0tGzNzHX8c4j5Nqms78d7FpKWJ66heA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1qiQhdZaBan5Wy7UmHXUtHi35oiDyylnX6FMtAGTinKxy8iFO2zTztQBhtXNkIOcldE5oh8SDpbnadgkn9uKQxFurLvUS4SA+RSerGGOLwRKJqiRJeTu4OjwK6lU9jjZ3THfzUqrUZGMjvyl6SkSebX+w648ci0XTYnoQFIqFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=il48mVgP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso329392366b.1
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 01:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732268703; x=1732873503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hd6q8zDhHex0K31D5UPVNO7yeK6NJNFYGAAxQqzFbc=;
        b=il48mVgP2n+QeKx8w4z/iKbOt+nDpj1cLMK0v+BnOPeUDQsepu56p97ams4e30dut7
         ilEVPdt+biqPvMkWKCDK2GzSMhEnMXnJw0+xop/PuFnT+Mmm4iuk37LnG0R06+AjFBm7
         F9WDcj/1l0PdM11J4Xbw3MSZxjZEQ+7ktTVW9gPahtwlw3Ld/G5R+O6sgFAbaJHwwD+p
         DLdyZytva7ncujd45j1za+V4Yko//mTLSwpjec8JLFWXzwLsXMdqTDc2G4XXCyspA1R0
         unY3LwKX990N8YiOeiqrcmfRDikskn/25jQLv7QTX/2AswdkunkA+ourjaj1UsEJev/n
         P5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268703; x=1732873503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hd6q8zDhHex0K31D5UPVNO7yeK6NJNFYGAAxQqzFbc=;
        b=emOEob7eka0mX9PnKfdaLTe5DoZP0BvQixdOil0h7UD5P1gs7PpNWO0KLEmLPDngtf
         Dlgxmyj0lCNjlHVmCNoHLaWShQ7HSq3iDcwNhygOsR4PbLgbtVcSgrPwHt7/JfrFFFwC
         DMPKaJydPamRv4HKvgGj9nsNwa7PZAcoqWNkQt+yD/Vdjtta2LZ6hnSWbw8ISSY3+8kl
         LqRNX783a9Khg5H3Yxu9+4WWjwmtsK2vH9QDmb5zh+og4uicGBxGb06fwup4zd3NSw6Z
         nB6eElPOSX6Szjowcnrw3tH8TPqSBn4h+HaAGjonqHu8PeZdtjCgZpBA+o5Js1f8oUAV
         M4BA==
X-Forwarded-Encrypted: i=1; AJvYcCWG2sZbgsAQEwA+d/eL3p9tMxWB+C6spkrC1C0D2dAOEcf+pSM1peVpnqaYBhKNt9qDyGze6dJ3CCY7EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ9HrWvLqTtnmLgobcBp7cZtIEytOInkfa/o66i5/x2O1535s6
	LTQxDWjR5BGaHO78gJGtG5yPX4e3ngIId3nnK4/e+t2pU+okiZN3HICn2yDC4o+bqHZ6M+QsGG7
	imharHDeyjVeDVPc5ryP8O3DgAEsgYNy2X6LjjQ==
X-Gm-Gg: ASbGncs/mXCX8F128iktRsyIWK58actHqSfa0VkJHN1WM/ryk7XBYUXhJSMlq8FsYIQ
	5q+sZN97QNY17DiaXLOICNjVS6dcnJg==
X-Google-Smtp-Source: AGHT+IF2siysXCL8AuQk/Zj9BKQZImmKFwTANKrD+H57DhSj6YZ4aXozWUBRbTyiMmt32yK0vwfP+uNoBA8OHC90tE4=
X-Received: by 2002:a17:906:310b:b0:aa5:2237:67af with SMTP id
 a640c23a62f3a-aa522376878mr15619866b.9.1732268703393; Fri, 22 Nov 2024
 01:45:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com> <b0af0ec1545b33fed81f34a866bc7b7222c78ad7.camel@mediatek.com>
In-Reply-To: <b0af0ec1545b33fed81f34a866bc7b7222c78ad7.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 22 Nov 2024 10:44:52 +0100
Message-ID: <CAEHHSvbFw+MC0R3w7isgrF15JAAfBWQmSkh1PoiU7y+P4O2psw@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, =?UTF-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 22 nov. 2024 =C3=A0 10:19, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.=
hu@mediatek.com> a =C3=A9crit :
>
> Hi, Julien:
>
> On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >
> >
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> >
> > This driver provides a path to bypass the SoC ISP so that image data
> > coming from the SENINF can go directly into memory without any image
> > processing. This allows the use of an external ISP.
> >
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > [Paul Elder fix irq locking]
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
>
> [snip]
>
> > +static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
> > +{
> > +       struct mtk_cam_dev *cam =3D vb2_get_drv_priv(vb->vb2_queue);
> > +       struct mtk_cam_dev_buffer *buf =3D to_mtk_cam_dev_buffer(vb);
> > +       unsigned long flags;
> > +
> > +       /* Add the buffer into the tracking list */
> > +       spin_lock_irqsave(&cam->buf_list_lock, flags);
> > +       if (list_empty(&cam->buf_list))
> > +               (*cam->hw_functions->mtk_cam_update_buffers_add)(cam, b=
uf);
> > +
> > +       list_add_tail(&buf->list, &cam->buf_list);
> > +       (*cam->hw_functions->mtk_cam_fbc_inc)(cam);
>
> I think fbc_inc should together with update_buffers_add.
> After update_buffers_add then fbc_inc.
> So squash fbc_inc into update_buffers_add and drop fbc_inc function.
>

No, this is not true.
mtk_cam_update_buffers_add is used to indicate which buffer should be
used for dma write. This is the first entry in the buf list.
mtk_cam_fbc_inc is used to increase the number of available user space buff=
ers.

If the buffer list is not empty and user space calls buf_queue again,
we need to call mtk_cam_fbc_inc to increase the number of available
user buffers, but we don't want to change the buffer for DMA write.

mtk_camsv30_update_buffers_add is called on irq to update the address
to the next buffer (if available).

Maybe the name mtk_camsv30_update_buffers_add is confusing then?
What do you think about:
- mtk_camsv30_update_buffers_add -> mtk_camsv30_update_buffers_address
- mtk_cam_fbc_inc -> mtk_camsv30_buffer_add

Cheers
Julien

 > Regards,
> CK
>
> > +       spin_unlock_irqrestore(&cam->buf_list_lock, flags);
> > +}
> > +
>
> >
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

