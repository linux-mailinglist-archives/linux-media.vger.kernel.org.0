Return-Path: <linux-media+bounces-11098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD7C8BEB8E
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 20:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD92B1C23FCB
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F022A16D9DF;
	Tue,  7 May 2024 18:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X/mgoeSO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872AB16F274;
	Tue,  7 May 2024 18:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715106991; cv=none; b=kOx+IkpdwmP9CtwpDJanLWC+0f5mJNddpZjuvytPOqvV9qoeMr4X/Y5XWsmOfQKkoUawmi+9uI7CAQHYDZpspV4po8GVnRio2/oupA05Pl3vv2WH6CcOct01qqWG0dtYGuLyTgTAMO2ucm4SH3Aog0q6KRY0XcqtoRj4QbQQius=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715106991; c=relaxed/simple;
	bh=teQKchOEq9uRazgHEW2r0xLVQ+sR4ZkcVno60PW+UY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mi7o5ztFrzo8ZhojP8RuRWkOnW5ZMfJ83/9kekBnNs2tJ9LnTZbI75BmYzpBqvICap2iEe1sJ0h0dFFG2nS1wFguk49E92sBPJYhCEr0XBYfIoysNx1N0biUDdL+mbySegx/qSyFtmOSgbqjfs638wk6tBkAgzfIHXzc61+JzUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X/mgoeSO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 728A3904;
	Tue,  7 May 2024 20:36:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715106979;
	bh=teQKchOEq9uRazgHEW2r0xLVQ+sR4ZkcVno60PW+UY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/mgoeSODr0I6iobUNwoM8X5WMzal5pkTvtETqp7JW0yE1ELUfsgZlkItx6WSn1HJ
	 kzHWjIBCuvr2wAwoOLsnlLqOzbCsETelWIbA77BDOdTVMxL86OdaD3yTc4QfaE4LPe
	 +7YclK0P+9Me7DLG/h1upYg/q3F1J9HBn0qofRIs=
Date: Tue, 7 May 2024 21:36:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Robert Mader <robert.mader@collabora.com>,
	Sebastien Bacher <sebastien.bacher@canonical.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linaro-mm-sig@lists.linaro.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Milan Zamazal <mzamazal@redhat.com>,
	Maxime Ripard <mripard@redhat.com>,
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240507183613.GB20390@pendragon.ideasonboard.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>

On Tue, May 07, 2024 at 07:36:59PM +0200, Daniel Vetter wrote:
> On Tue, May 07, 2024 at 04:15:05PM +0100, Bryan O'Donoghue wrote:
> > On 07/05/2024 16:09, Dmitry Baryshkov wrote:
> > > Ah, I see. Then why do you require the DMA-ble buffer at all? If you are
> > > providing data to VPU or DRM, then you should be able to get the buffer
> > > from the data-consuming device.
> > 
> > Because we don't necessarily know what the consuming device is, if any.
> 
> Well ... that's an entirely different issue. And it's unsolved.
> 
> Currently the approach is to allocate where the constraints are usually
> most severe (like display, if you need that, or the camera module for
> input) and then just pray the stack works out without too much copying.
> All userspace (whether the generic glue or the userspace driver depends a
> bit upon the exact api) does need to have a copy fallback for these
> sharing cases, ideally with the copying accelerated by hw.
> 
> If you try to solve this by just preemptive allocating everything as cma
> buffers, then you'll make the situation substantially worse (because now
> you're wasting tons of cma memory where you might not even need it).
> And without really solving the problem, since for some gpus that memory
> might be unusable (because you cannot scan that out on any discrete gpu,
> and sometimes not even on an integrated one).

I think we have a general agreement that the proposed solution is a
stop-gap measure for an unsolved issue.

Note that libcamera is already designed that way. The API is designed to
import buffers, using dma-buf file handles. If an application has a way
to allocate dma-buf instances through another means (from the display or
from a video encoder for instance), it should do so, and use those
buffers with libcamera.

For applications that don't have an easy way to get hold of dma-buf
instances, we have a buffer allocator helper as a side component. That
allocator uses the underlying camera capture device, and allocates
buffers from the V4L2 video device. It's only on platforms where we have
no hardware camera processing (or, rather, platforms where the hardware
vendors doesn't give us access to the camera hardware, such as recent
Intel SoCs, or Qualcomm SoCs used in ARM laptops) that we need to
allocate memory elsewhere.

In the long run, I want a centralized memory allocator accessible by
userspace applications (something similar in purpose to gralloc on
Android), and I want to get rid of buffer allocation in libcamera (and
even in V4L2, in the even longer term). That's the long run.

Shorter term, we have a problem to solve, and the best option we have
found so far is to rely on dma-buf heaps as a backend for the frame
buffer allocatro helper in libcamera for the use case described above.
This won't work in 100% of the cases, clearly. It's a stop-gap measure
until we can do better.

> > Could be VPU, could be Zoom/Hangouts via pipewire, could for argument sake
> > be GPU or DSP.
> > 
> > Also if we introduce a dependency on another device to allocate the output
> > buffers - say always taking the output buffer from the GPU, then we've added
> > another dependency which is more difficult to guarantee across different
> > arches.

-- 
Regards,

Laurent Pinchart

