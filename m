Return-Path: <linux-media+bounces-9830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 294138ABF9C
	for <lists+linux-media@lfdr.de>; Sun, 21 Apr 2024 16:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 957B41F2144C
	for <lists+linux-media@lfdr.de>; Sun, 21 Apr 2024 14:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1ED417C66;
	Sun, 21 Apr 2024 14:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ntDuyRbr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GUZV0HxH"
X-Original-To: linux-media@vger.kernel.org
Received: from flow7-smtp.messagingengine.com (flow7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2413610A3C;
	Sun, 21 Apr 2024 14:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713709843; cv=none; b=OrthzLDsO2KVzg1NAq+O6RGd5pidQVRlkkAPP6IMuO7xlt2hF94JCBaOAEk1oBGqN37+wkuxrhtYanTeznl0Puoedm0bxoZEq2t9xpVt9aAMz2hCUZ401ktU4vaLwBZSsFGuQtJWWtB7g8SgZROun8mClmTy/AXx+OjMvuYPSFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713709843; c=relaxed/simple;
	bh=6pgmqVhvaDwTjNjoQVRC6d7sA995GUDWPi+koXA5cG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRWCen59vd1KGmVtz9VibtuSSlGp0sRsQs96eyMq3bmkJZCkRtYibf4n/c2yZZyW+g3ndI96pQnthsgcyBlEevbVVeyRmzeqfoC/ZOUdkZ/VnLQjV5BF91ot0bfEH0aqhoTZxYdHRIaiww6qn7f6WjTVCf546Esm4xs7Bvu/O3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ntDuyRbr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GUZV0HxH; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailflow.nyi.internal (Postfix) with ESMTP id F105A20039D;
	Sun, 21 Apr 2024 10:30:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 21 Apr 2024 10:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1713709837;
	 x=1713713437; bh=M8dfM/MUHqAfWqBOSFi1b3udgfbI61/t7DVgkqGM8h8=; b=
	ntDuyRbrK7nfSJ9DfAGjFrN2S503gY5/wKou+LRaqgKKU41C7iVKxYLE/4k3JUrG
	8bGm9pFArEeqEyMgmqnjlBCBGdof7PgNCNRz+hAKXPX4ytOne8FvxvK+qRBpX/uy
	L+4JUNnsVtzPX+7gsF+WRkMwXI2kJArTqOJtCp0F714Vbqb+y0FL/lylA/E30fz0
	X9TW89Iny+Kr2RoC0/Rv6voHIWFmeFmTChTHptAV7v7WzjNvyz2btTkxX2wO/On6
	qAxbv+jFak4GEU9EmkiH59XIrWQXbY4qdykRX8NT6DORlnGOOK0+yKLqxlqJn3t5
	WCgqy/OLFV3kdwu5J8MS1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713709837; x=
	1713713437; bh=M8dfM/MUHqAfWqBOSFi1b3udgfbI61/t7DVgkqGM8h8=; b=G
	UZV0HxHIijpZBcf6pfceJwPmyIK1m4rfZBTB9T2DawAU1qEC0nQqEjjUqLptph/J
	g5j6MuvrTRhfj5onP19ge64USd+icPiWQEh8IekH1MpkvLvV8upluJwQiLfM6tPo
	f2zhiSOuwOzpsEkCnUdJfq6JCr+i2KGYm/ysZtgHk9aRiiUwQkvjncFveyEfFJwM
	VQ/TfiRPqVDYdnM91hHBD2Jcc89y3FEKAaAgFkII07et/dnzibi8h9KmW5V++6Is
	GT0ZU2oN9kY02xjjVNvY81WdT1eGAHbTMsTqvzvIvYG5WlwEINCfeCI9YNWKUQ1P
	EaX+ugFKFb2szfJuRqcZA==
X-ME-Sender: <xms:DCMlZs-2DcsEDNKc1kkLpxnOXzsiGNTTv3BrEUMFXNzv13Swh4twFQ>
    <xme:DCMlZkvs3hfnpivqD9nNQVRn5VIUY-Yz8Mc0Hou0f0i4IVywaGGlJ_9csKA8L3PrY
    A-rVQGGvaFArnLYxPg>
X-ME-Received: <xmr:DCMlZiBWukiO3POMx6__nzq8XGlLWxlnRp-W_Tvqh9keUXi7fMJDtmMTRoninvxp8UdIhmHq3EvP9TdytmUaWAifZufakl0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekjedgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrgh
    hnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeef
    heetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgr
    ghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:DCMlZsfXGstyhglVuSfJEOqErwyQUCBHYq5080VoI2_uI7QTTWYSsA>
    <xmx:DCMlZhNuAlJrkqp4Ne9Sq_0Ze9Q61GO4VPftxfQBsAUwZBcfBit6OA>
    <xmx:DCMlZmmMWI6nK2BfZhC_N9zFEIXWYtqRCBY9ne_t48WT0yJ5XQvXFg>
    <xmx:DCMlZjuwQxt9yFVKFuN64nQr3pYqgL0sUjMT2Va19CsIZ_sCWLSLzw>
    <xmx:DSMlZkcf2PEXGSIvxrnaLVzsx6y7oFyFMOZma8CeoZlxvOStFzzeRrEU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 21 Apr 2024 10:30:36 -0400 (EDT)
Date: Sun, 21 Apr 2024 16:30:33 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to rzg2l_cru_video_register()
Message-ID: <20240421143033.GA1105869@ragnatech.se>
References: <20240219180544.526537-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWO7n4oBr=U-DK2aa+S68kLX=VuzpuYDeA8KymzdnggNg@mail.gmail.com>
 <20240421134630.GA29222@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240421134630.GA29222@pendragon.ideasonboard.com>

Hello,

On 2024-04-21 16:46:30 +0300, Laurent Pinchart wrote:
> On Thu, Apr 18, 2024 at 11:06:27AM +0200, Geert Uytterhoeven wrote:
> > Hi Biju,
> > 
> > On Mon, Feb 19, 2024 at 7:05 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Move request_irq() to rzg2l_cru_video_register(), in order to avoid
> > > requesting IRQ during device start which happens frequently.
> > >
> > > Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > 
> > Thanks for your patch!
> > 
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > 
> > > @@ -1011,6 +1000,7 @@ void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru)
> > >  {
> > >         media_device_unregister(&cru->mdev);
> > >         video_unregister_device(&cru->vdev);
> > > +       free_irq(cru->image_conv_irq, cru);
> > >  }
> > >
> > >  int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru)
> > > @@ -1018,6 +1008,13 @@ int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru)
> > >         struct video_device *vdev = &cru->vdev;
> > >         int ret;
> > >
> > > +       ret = request_irq(cru->image_conv_irq, rzg2l_cru_irq,
> > > +                         IRQF_SHARED, KBUILD_MODNAME, cru);
> > > +       if (ret) {
> > > +               dev_err(cru->dev, "failed to request irq\n");
> > > +               return ret;
> > > +       }
> > > +
> > >         if (video_is_registered(&cru->vdev)) {
> > 
> > How can this happen? Perhaps rzg2l_cru_video_register() can be called
> > multiple times through the rzg2l_cru_group_notify_complete() notifier?
> 
> The notifier completion handler shouldn't be called multiple times, no.
> There's however a possibility (I think) that a subdev could disappear of
> the device is unbound from its driver. If the device is later rebound,
> the notifier completion handler could be called again.
> 
> The issue is that rzg2l_cru_video_unregister() is called from .remove().
> I think a better fix would be to request the IRQ at probe time (or did
> we discuss that previously and concluded it could cause issues ?). I
> would also argue that the video devices should be registered at probe
> time, not in the notifier completion handler.

FWIW, I intend to have another go at moving video device registration to 
probe time for VIN once the current cleanup-patches on the list are 
processed. Last time I tired a few years ago it was rejected with the 
reason video devices should be register when all subdevices are 
available.

Now days other drivers upstream register video devices at probe time so 
I hope this is now (finally) OK.

> 
> > If that is true, the request_irq() should be moved after this block,
> > just before the call to video_register_device() below.
> > 
> > >                 struct media_entity *entity;
> > >
> > > @@ -1032,14 +1029,18 @@ int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru)
> > >         ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> > >         if (ret) {
> > >                 dev_err(cru->dev, "Failed to register video device\n");
> > > -               return ret;
> > > +               goto err_request_irq;
> > >         }
> > >
> > >         ret = media_device_register(&cru->mdev);
> > > -       if (ret) {
> > > -               video_unregister_device(&cru->vdev);
> > > -               return ret;
> > > -       }
> > > +       if (ret)
> > > +               goto err_video_unregister;
> > >
> > >         return 0;
> > > +
> > > +err_video_unregister:
> > > +       video_unregister_device(&cru->vdev);
> > > +err_request_irq:
> > > +       free_irq(cru->image_conv_irq, cru);
> > > +       return ret;
> > >  }
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Kind Regards,
Niklas Söderlund

