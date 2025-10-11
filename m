Return-Path: <linux-media+bounces-44192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACA4BCF0E8
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 09:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76DF619A27A3
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 07:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E508225A34;
	Sat, 11 Oct 2025 07:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="eZDDFLjI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32F21EDA03
	for <linux-media@vger.kernel.org>; Sat, 11 Oct 2025 07:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760167140; cv=none; b=DsQZD37iwuOyCxyw3L2/FEW+w4pHZXSvMtoS8VO+iXsShawXsd5lvALtjP4m3kIJkyRmZA9HF5jwZseKo2L16zJe5X/ZXnmmPNSyNG6POCCLToKHtyZCaGqlrbqC2HqB12gieuOwQOI2DC2QGJGm+g2+3irV8OuUbZAokHVRmcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760167140; c=relaxed/simple;
	bh=tpE//6gH2ceJz4TAKFITtyl+56y4S0Zq1mUYtOEolhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Un5VGlfSDxQeWYR2zYb1d1chSGWdzA4Dsq1cVPGbL89Lky/j8rLR2zXRfjnJycReBv8DI1ioilhKBWpAMC8vYV4U/SFLWQM3wZrgM+xnFu5H61rsx4Aa8+5N/Wfsh4CUOavXAn39i4nmk4IGC4R6yf2qJ0ZXzfjbyaecUoNUTcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=eZDDFLjI; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so3915172a91.3
        for <linux-media@vger.kernel.org>; Sat, 11 Oct 2025 00:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1760167138; x=1760771938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SUmuf8N7efdy7uUe7LCCQ0JKiGdcMKfcndEXaOZcuSE=;
        b=eZDDFLjI31g/90mGqsbuxp7Di/NN4Vp9KFjDgAG6gSI0LCxmzng7TNSImNJG6Z+iVi
         riNQ3NtwFpklbjp3MLIZdBEZemNCW90OXqpEC8E8Dt1TxvHzTPHV0nh7GCBoyxlK1nDk
         K46nQvvE68tg15bNjUhvBgNpr1Of0LR3WXIFhUyAyHC9kRMtxKchP6YLuATBPdHK1HDt
         4BpR190cfaZoLtBefFurqAogIt47RuCJ3RThFpqs7l0Evnd/7W/yAf3VmRbZ7Czv0PaC
         iQyN+PhL8GJ6VMNtnzEcH+NI6pbMVwFlk0ssvTXY450uxwZdnTxwJzlR0vDIRcR3jvqF
         9jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760167138; x=1760771938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUmuf8N7efdy7uUe7LCCQ0JKiGdcMKfcndEXaOZcuSE=;
        b=CilhjSwMNM0cTi95ZTYdKVUB7VoV8HrwB/mt4oRHoTfuDfvoC5yZMtIv28ZtBhhCwy
         8nf4KBAbnHmJIB7osIjkJhKby1fXDsJhbk4OwBAQxZ6v2DNTwuQ6XxRqmj2GuxqVF1Sa
         gXgfpG7lW/WNpYa3WVBMVWZORu/tySJdNZWqu+NpuyML0Z/vnGiFrkexmkSI4B/Wp2Cz
         btsFh2W7TI6yf8lAo8BjViXeAaAyD+IlTPWmMYWsR3G94w4RuYwJQVry/wRTDkpxm8cv
         fq+Ktukc2NIceVpyJ3XpBJeGqXHgyF+VxVXpp1Cg7cxHXQrhT/miwZKtX2kIiU3Sdgdq
         +ddA==
X-Forwarded-Encrypted: i=1; AJvYcCXMBK8FTOLk4XpN/vsPJ93oggsNl+e1fXg5MquE8QG7SRMz7Fv+yyOMQJIN5Kdj+rfkj80fycGqqGTN/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtGhNSKRA12QAmNYyn86IGsKkI9DD2vJ2InlloEFyKgNJAGx3D
	IanusQpzqlACDzah605Sjw6t7X07AdLm4ui95QlbvcQFu1Ael4bOj+/AN0WWZ7DDMm1r
X-Gm-Gg: ASbGncshcI3LxAtj3q/UTn/pVlpQvx7WmBnrlfypaNY8PQHNb+k8Bcovofnia7lS1g6
	KpMapWsCzxly6apu2TmCgccdrJJbcgS+PqUZjlV5WZH6M7UrTvCOtoIVd+RO3nbrMBmf/+32HRQ
	tJrKEAs7hezoFZ6nb7goPqv26cSWa3PaGU+Ee96X912kflckl6K5WvIqUraaajU2kDuprdgmYO2
	yHr1J6nC2IMO75y2t1rwr1N4V4a7VFP7uBmQfTn0mPRBwIgxXemqPg6xaWX0MvHh7I0QDMUnrzb
	IwNHEKPbJKWAkrRl3L7SfMrKjK04T8amwjrl44M0zeI58mmeSKPecicJoKE0cY6FaM9o/wxE9uD
	31p+gnlzBJNMJ1zSoe1MnZ4WeqKVARc45v4lnRApxBgN39vhVUWsGX4E=
X-Google-Smtp-Source: AGHT+IGMAhwZUtxLSCfxb1nn1Xv9WZqD3H9xsVVqoNrOrRTbrsC/gPSVhqWUKhsa4XihRV2z61wt3w==
X-Received: by 2002:a17:90b:2249:b0:32e:7bbc:bf13 with SMTP id 98e67ed59e1d1-33b5139a2cfmr19504988a91.34.1760167138183;
        Sat, 11 Oct 2025 00:18:58 -0700 (PDT)
Received: from sultan-box ([142.147.89.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626d15b3sm5171252a91.20.2025.10.11.00.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 00:18:57 -0700 (PDT)
Date: Sat, 11 Oct 2025 00:18:54 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v4 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
Message-ID: <aOoE3oPVeUuaElRl@sultan-box>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-5-Bin.Du@amd.com>
 <aNJK_tZe99_jWNdR@sultan-box>
 <c63a56cb-23d0-4c5a-8e1a-0dfe17ff1786@amd.com>
 <aNzXJaH_yGu1UrV2@sultan-box>
 <dbc92a53-a332-4e57-a37a-7a146b067fcd@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbc92a53-a332-4e57-a37a-7a146b067fcd@amd.com>

On Fri, Oct 10, 2025 at 06:25:48PM +0800, Du, Bin wrote:
> Thanks, Sultan. sorry for the delayed response due to the long public
> holiday here.

No worries, hope you had a good holiday. :)

> On 10/1/2025 3:24 PM, Sultan Alsawaf wrote:
> > On Tue, Sep 30, 2025 at 03:30:49PM +0800, Du, Bin wrote:
> > > On 9/23/2025 3:23 PM, Sultan Alsawaf wrote:
> > > > On Thu, Sep 11, 2025 at 06:08:44PM +0800, Bin Du wrote:
> > > > > +	u32 r1;
> > > > > +
> > > > > +	if (!isp_dev)
> > > > > +		goto error_drv_data;
> > > > > +
> > > > > +	isp = &isp_dev->isp_sdev;
> > > > > +	/* check ISP_SYS interrupts status */
> > > > > +	r1 = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_SYS_INT0_STATUS);
> > > > > +
> > > > > +	isp_sys_irq_status = r1 & ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
> > > > 
> > > > There are four IRQs (one for each stream) but any one of the IRQs can result in
> > > > a notification for _all_ streams. Each IRQ should only do the work of its own
> > > > stream.
> > > > 
> > > > You can do this by passing devm_request_irq() a private pointer to indicate the
> > > > mapping between a stream and its IRQ, so that isp4_irq_handler() can know which
> > > > stream it should look at.
> > > > 
> > > 
> > > Will do optimization to remove unused IRQs and keep only necessary ones
> > > (reduce from 4 to 2), actually an IRQ won't result in notification to all
> > > streams, please check the implementation of isp4_resp_interrupt_notify, it
> > > will only wake up IRQ corresponding stream processing thread.
> > 
> > What I mean is that the IRQ for one stream can wake a different stream if it is
> > also ready at the same time according to the interrupt status register.
> > 
> 
> Yes, you are correct, besides its own stream, the IRQ may wake a different
> stream if it is ready too in the IRQ status register. But i believe the
> shared irq handler can improve the performance without negative effects. The
> peseudo code of isp4_irq_handler works like this (take your below example)
> irqreturn_t isp4_irq_handler(...)
> {
> 	status = read_irq_status();
> 	if(status & WPT9)
> 		isp4_wake_up_resp_thread(isp, 1);
> 	if(status & WPT10)
> 		isp4_wake_up_resp_thread(isp, 2)
>         ack_irq_status(status);
> 	return IRQ_HANDLED;
> }
> Which means the first isp4_irq_handler can process all IRQs at that time.
> For the second isp4_irq_handler, because the irq status is cleared by the
> first isp4_irq_handler, it just does nothing and quit. So even if
> isp4_irq_handler doen't know exactly which IRQ triggers it, there's no harm
> as far as I can tell, not sure if I missed something.

My thinking was that it's possible for duplicate wakeups to occur when the
stream IRQs are affined to different CPUs and they fire around the same time in
parallel.

But now that I see how the ISP interrupts are actually GPU interrupts, it means
that the stream IRQs will always be affined to the same CPU as each other.

So my concern does not apply here, and you should disregard it. :)

Sultan

