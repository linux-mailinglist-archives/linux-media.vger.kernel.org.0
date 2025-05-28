Return-Path: <linux-media+bounces-33524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF5AAC6AF6
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 15:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E5824E505B
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 13:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991132882D4;
	Wed, 28 May 2025 13:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hCLTUpWl"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCF22882A8;
	Wed, 28 May 2025 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440165; cv=none; b=dyCqxKdxc4rRyDTMPQxEcJV3UkKrxJ2iQVE0ghuW1VyTz5+lsdqtU5QoBMhaQrEA3JyTDXy58Pj+/aUjk9cFVflrAlufh6Cpgn9W5wc8BJdiUUMY2/islT5aG1kBU3FBg7ugpN0w7L/H05PLN0DEVBcfO4TXNdbw4d70eBtaf64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440165; c=relaxed/simple;
	bh=xnT/zC5PKsZjc9EY6L5bqKkp0emOIn4winQ+EC8I16g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QL3fyl0yJ0jhij9/UHGs8HC+y0P07rU2/cd/kOHWoXmQAY049zOnMSTrU74EXa+mv44Vji9ez/4KGldy6bKoubRzSDLHzVu2MnlwjZTnKN99C+BRrsBzbeGPjTVraDyJJcQbDzS0W5pIVCPr/bTemb7MiGRTYdfOrX/XW7XnTVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hCLTUpWl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748440160;
	bh=xnT/zC5PKsZjc9EY6L5bqKkp0emOIn4winQ+EC8I16g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hCLTUpWlgZGE12nzg409+ZreJkdgk5SVxC1ZmySY3dHveR1YLSMfHIwXlh3r1JtIZ
	 hofR4c4sYzrFsKxCExNjEEJQaGOnQCWDcvJTDYI9H2pXkLGMM+R8ucU1hq9urEF1DA
	 0NlwS3soyZPxy4KiaXfk7NzYWVdnXLUrjMGssqQX8dY/pCUXxz3+WVsL4ygwFN28lY
	 6r6n15I9ELj/1iSKDYoJV0c1TFJYgxUL0OCcbN1U/ySiIuPo40+XvJHG1MxCEV6ebK
	 M3vnSvQeDz1lpKpLgQoP4JS+LectKNx1TEMM8CUDpf9sXXiNrAdUKzOc2o9egRPMEB
	 obv24a9KI0h7w==
Received: from [IPv6:2606:6d00:17:b2fc::5ac] (unknown [IPv6:2606:6d00:17:b2fc::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D59617E153E;
	Wed, 28 May 2025 15:49:19 +0200 (CEST)
Message-ID: <43d3d88e292c3aaf25eda8514451ef1949612620.camel@collabora.com>
Subject: Re: [PATCH v2 4/7] media: chips-media: wave5: Use spinlock whenever
 statue is changed
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org"	
 <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>,  "bob.beckett@collabora.com"	
 <bob.beckett@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>,  "b-brnich@ti.com"	
 <b-brnich@ti.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung	
 <nas.chung@chipsnmedia.com>
Date: Wed, 28 May 2025 09:49:18 -0400
In-Reply-To: <SE1P216MB130368B2DDB6A235D2603E04ED64A@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
		 <20250522072606.51-5-jackson.lee@chipsnmedia.com>
	 <effe40f0d4caef43bf772d350a67d68833941cbb.camel@collabora.com>
	 <SE1P216MB130368B2DDB6A235D2603E04ED64A@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mardi 27 mai 2025 à 05:02 +0000, jackson.lee a écrit :
> Hi Nicolas
> 
> > -----Original Message-----
> > From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Sent: Saturday, May 24, 2025 2:41 AM
> > To: jackson.lee <jackson.lee@chipsnmedia.com>; mchehab@kernel.org;
> > hverkuil-cisco@xs4all.nl; sebastian.fricke@collabora.com;
> > bob.beckett@collabora.com; dafna.hirschfeld@collabora.com
> > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; lafley.kim
> > <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; hverkuil@xs4all.nl; Nas
> > Chung <nas.chung@chipsnmedia.com>
> > Subject: Re: [PATCH v2 4/7] media: chips-media: wave5: Use spinlock
> > whenever statue is changed
> > 
> > Hi,
> > 
> > Le jeudi 22 mai 2025 à 16:26 +0900, Jackson.lee a écrit :
> > > From: Jackson Lee <jackson.lee@chipsnmedia.com>
> > > 
> > > The device_run and finish_decode is not any more synchronized, so lock
> > > was needed in the device_run whenever state was changed.
> > 
> > Can you try to introduce the locking ahead of the patches, otherwise this
> > break bisectability as the in-between become racy.
> 
> 
> Do you want to introduce this patch ahead of the performance patch?

I'm sure you can find the right anwser if you understand why I'm asking this. The way
patchset should be layout is so that at any step applying the set, the driver
should remain stable. If one patch above breaks something, and you fix it in the
next patch, this is not a bisectable set.

git bisect does not know about "sets" and shouldn't need to know about it either.

regards,
Nicolas

> 
> Thanks
> Jackson
> 
> > 
> > Nicolas
> > 
> > > 
> > > Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> > > Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> > > ---
> > >  drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > > b/drivers/media/platform/chips- media/wave5/wave5-vpu-dec.c index
> > > 42981c3b49bc..719c5527eb7f 100644
> > > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > > @@ -1577,6 +1577,7 @@ static void wave5_vpu_dec_device_run(void *priv)
> > >  	struct queue_status_info q_status;
> > >  	u32 fail_res = 0;
> > >  	int ret = 0;
> > > +	unsigned long flags;
> > > 
> > >  	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new
> > bitstream data", __func__);
> > >  	pm_runtime_resume_and_get(inst->dev->dev);
> > > @@ -1617,7 +1618,9 @@ static void wave5_vpu_dec_device_run(void *priv)
> > >  			}
> > >  			spin_unlock_irqrestore(&inst->state_spinlock, flags);
> > >  		} else {
> > > +			spin_lock_irqsave(&inst->state_spinlock, flags);
> > >  			switch_state(inst, VPU_INST_STATE_INIT_SEQ);
> > > +			spin_unlock_irqrestore(&inst->state_spinlock, flags);
> > >  		}
> > > 
> > >  		break;
> > > @@ -1628,8 +1631,9 @@ static void wave5_vpu_dec_device_run(void *priv)
> > >  		 * we had a chance to switch, which leads to an invalid state
> > >  		 * change.
> > >  		 */
> > > +		spin_lock_irqsave(&inst->state_spinlock, flags);
> > >  		switch_state(inst, VPU_INST_STATE_PIC_RUN);
> > > -
> > > +		spin_unlock_irqrestore(&inst->state_spinlock, flags);
> > >  		/*
> > >  		 * During DRC, the picture decoding remains pending, so just
> > leave the job
> > >  		 * active until this decode operation completes.
> > > @@ -1643,7 +1647,9 @@ static void wave5_vpu_dec_device_run(void *priv)
> > >  		ret = wave5_prepare_fb(inst);
> > >  		if (ret) {
> > >  			dev_warn(inst->dev->dev, "Framebuffer preparation,
> > fail: %d\n",
> > > ret);
> > > +			spin_lock_irqsave(&inst->state_spinlock, flags);
> > >  			switch_state(inst, VPU_INST_STATE_STOP);
> > > +			spin_unlock_irqrestore(&inst->state_spinlock, flags);
> > >  			break;
> > >  		}
> > > 

