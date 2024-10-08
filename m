Return-Path: <linux-media+bounces-19201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B611C993F6F
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 09:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9E571C20FB3
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 07:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB361C1728;
	Tue,  8 Oct 2024 06:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="VshPRbej"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AC319306A
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 06:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370208; cv=pass; b=Wx0mWXa2fv2H35zxTuMkYCPL2Q1+uuBL67RTyICXMPWFLYBuM3lU3m14oQfxRSz5Q3ys/64oEiYm2KNTfJF1/0oY3AsA1aQkCj5n+OHyj8KiRVBNHxCnWqG9yqxyP7mSDIWBADcMZRkEu4+H2+jUs75n5AmGU+RwCHmbg00roWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370208; c=relaxed/simple;
	bh=7dR209TQMLxk9EEMPn3/FLyRxcy720HVI4Bx3YJG4oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5Nux1WfS2O9Ym+gyt35RAV29+sJg+Q/8qAsoFktphF/HkHMcGLhcQxMPriFsdzrcZpE11lufcOsz91VHGgdaMgJ+zxFUisPoOl6m4EZ7Ai7emeGCJRDART6fmauwO3Cj6r7mexc5Pyv0HpbelkCpB2tY/RSli8q//SRKKoQsRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=VshPRbej; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1728370189; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bh4HNIbg5Fcq8eNLAOLMSl9RI+4o3/aV8idOB/6ywBAC4RSeiOgrAsmMlaP4iV0VDbczycu8R4r8njSfcpE22s/sBqCiTrZuA5oE/EY62FLUxuUaSdZUpCW8SdZHbahyO/2W3RwifjanU/amOEa2Nqlr7hBhADPP6XBH/9XIYFU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728370189; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sCEoyT5KMorDTp8QnrHsYU3ukuwRrLXO2vus/h9d2nU=; 
	b=BWR4hpkEV4dPjGSE69Ea9aMOSesXZzPO+NSHnqkreYknLLo20Y40OLk/kzPOQxhFarxLqOcaSlHnxvq23bQxTUXytrst5j+ziJzY1yJMZ9f6uIiiic575HE2fPMgWrd7+m0yXt2ecJ+apY18Lf9v46vIAlsUUBoz9AsWiCjAmUg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728370189;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=sCEoyT5KMorDTp8QnrHsYU3ukuwRrLXO2vus/h9d2nU=;
	b=VshPRbejuP69vzee1z69RyBFWoP/Hcd0V7sbWeIA5knyCQJzWV7keHfk3Zu1fp0b
	NAO4rxzBm9X2yL4xhpfC2wR2Qu4hftoRVrwDsBjAJ/0Eg8TLD/aD5EW4LJDL/L0MzWf
	F4FaKnVPt+b+VEANn6bx3CmVPUTxvbbRaEQ2Pvsg=
Received: by mx.zohomail.com with SMTPS id 1728370187989804.6563168192596;
	Mon, 7 Oct 2024 23:49:47 -0700 (PDT)
Date: Tue, 8 Oct 2024 08:49:44 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
	Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH] media: rkisp1: Reduce min_queued_buffers to 1
Message-ID: <20241008064944.ymiwk7mrowfnvltj@basti-XPS-13-9310>
References: <20241007124225.63463-1-jacopo.mondi@ideasonboard.com>
 <20241007125730.yn6xinehhm73yqob@basti-XPS-13-9310>
 <20241007134734.GA7439@pendragon.ideasonboard.com>
 <20241007140501.2rvqu6rrgy26uwl5@basti-XPS-13-9310>
 <g75gbejsguk5jk46ppbfrfmul6ynp4ixo2tqv27445bwcyuagm@vjcoagkjj6pg>
 <20241007194939.GJ14766@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241007194939.GJ14766@pendragon.ideasonboard.com>
X-ZohoMailClient: External

On 07.10.2024 22:49, Laurent Pinchart wrote:
>On Mon, Oct 07, 2024 at 09:35:49PM +0200, Jacopo Mondi wrote:
>> Hi Sebastian,
>>
>> On Mon, Oct 07, 2024 at 04:05:01PM GMT, Sebastian Fricke wrote:
>> > On 07.10.2024 16:47, Laurent Pinchart wrote:
>> > > On Mon, Oct 07, 2024 at 02:57:30PM +0200, Sebastian Fricke wrote:
>> > > > Hey Jacopo,
>> > > >
>> > > > On 07.10.2024 14:42, Jacopo Mondi wrote:
>> > > > > There apparently is no reason to require 3 queued buffers to call
>> > > > > streamon() for the RkISP1 as the driver operates with a scratch buffer
>> > > > > where frames can be directed to if there's no available buffer provided
>> > > > > by userspace.
>> > > > >
>> > > > > Reduce the number of required buffers to 1 to allow applications to
>> > > > > operate with a single queued buffer.
>> > > > >
>> > > > > Tested with libcamera, by operating with a single capture a request. The
>> > > > > same request (and associated capture buffer) gets recycled once
>> > > > > completed. This of course causes a frame rate drop but doesn't hinder
>> > > > > operations.
>> > > > >
>> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> > > > > ---
>> > > > >
>> > > > > Adam,
>> > > > >    a few months ago you were exercizing your pinhole app with a single capture
>> > > > > request for StillCapture operations and you got the video device to hang because
>> > > > > no enough buffers where provided.
>> > > > >
>> > > > > This small change should be enough to unblock you. Could you maybe give it a
>> > > > > spin if you're still working on this ?
>> > > > >
>> > > > > Thanks
>> > > > >    j
>> > > > > ---
>> > > > >
>> > > > >  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +---
>> > > > >  1 file changed, 1 insertion(+), 3 deletions(-)
>> > > > >
>> > > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> > > > > index 2bddb4fa8a5c..34adaecdee54 100644
>> > > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> > > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> > > > > @@ -35,8 +35,6 @@
>> > > > >  #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
>> > > > >  #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
>> > > > >
>> > > > > -#define RKISP1_MIN_BUFFERS_NEEDED 3
>> > > > > -
>> > > > >  enum rkisp1_plane {
>> > > > >  	RKISP1_PLANE_Y	= 0,
>> > > > >  	RKISP1_PLANE_CB	= 1,
>> > > > > @@ -1563,7 +1561,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>> > > > >  	q->ops = &rkisp1_vb2_ops;
>> > > > >  	q->mem_ops = &vb2_dma_contig_memops;
>> > > > >  	q->buf_struct_size = sizeof(struct rkisp1_buffer);
>> > > > > -	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
>> > > >
>> > > > It looks like RKISP1_MIN_BUFFERS_NEEDED is used only here, so can you
>> > > > remove the define as well?
>> > >
>> > > Isn't that exactly what this patch is doing ?
>> >
>> > Oh *facepalm* ... I missed that please disregard ...
>> >
>> > but my question below remains whether to not just change the value.
>>
>> Do you mean
>>
>> -#define RKISP1_MIN_BUFFERS_NEEDED 3
>> +#define RKISP1_MIN_BUFFERS_NEEDED 1
>>
>> ?
>>
>> I would rather avoid defining a value used in a single place. If it
>> was some magic number a macro name would maybe help giving come
>> context, but considering this is assigned to min_queued_buffers it's
>> imho clear enough ?
>
>I find it clear enough, I prefer dropping the macro as you do in this
>patch.

Sounds good.

>
>> > > > rg 'RKISP1_MIN_BUFFERS_NEEDED'
>> > > > drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>> > > > 38:#define RKISP1_MIN_BUFFERS_NEEDED 3
>> > > > 1566:	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
>> > > >
>> > > > Or maybe just change the value, but I am not sure whether this can be
>> > > > considered a magic value.
>> > > >
>> > > > > +	q->min_queued_buffers = 1;
>> > > > >  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>> > > > >  	q->lock = &node->vlock;
>> > > > >  	q->dev = cap->rkisp1->dev;
>
>-- 
>Regards,
>
>Laurent Pinchart
>
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

