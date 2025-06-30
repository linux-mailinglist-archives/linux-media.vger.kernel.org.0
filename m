Return-Path: <linux-media+bounces-36297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79F3AEDF4A
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 222B63A712F
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C72428B519;
	Mon, 30 Jun 2025 13:37:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041D125B30D;
	Mon, 30 Jun 2025 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290662; cv=none; b=Xq197WEJfft7DjcOraUvNDba4qSV0kvO0sZipMmwHuZpPFnJjUV7FYooQrlQWSOJyDp07+lrdPZM9orbdcZLYHMi5gxbNrv/Qx1vLKW9qbRoh4Rd4NesAdzqSZP68N8IUe7i3LxuVX6tmazlHjEvYBiXtB/OR5cUIolt7bX8hVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290662; c=relaxed/simple;
	bh=O4qRLRexRAuK+5ApxruyQ2/Nu+qVASNZCX7hgb3Bh1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owIYBkKIyE7SQmq+TY56kclRKWdlC4BjsJF8FwWKKowAX+RISDkiytJMmQyyteh+XCvqQje7f5/xSg8fZOziZ1aP2myazz96sYy9CGdZb/FVlrX+FlSPsbdkbxOftEkZhZlJ0ZDlBTo2CbZlk4lYTzITrslcS3WWibtZmLgWxdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DB46968AA6; Mon, 30 Jun 2025 15:37:34 +0200 (CEST)
Date: Mon, 30 Jun 2025 15:37:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Christoph Hellwig <hch@lst.de>,
	Alan Stern <stern@rowland.harvard.edu>, Xu Yang <xu.yang_2@nxp.com>,
	ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	hdegoede@redhat.com, gregkh@linuxfoundation.org, mingo@kernel.org,
	tglx@linutronix.de, andriy.shevchenko@linux.intel.com,
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <20250630133734.GA26768@lst.de>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com> <20250627101939.3649295-2-xu.yang_2@nxp.com> <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu> <20250629233924.GC20732@pendragon.ideasonboard.com> <CANiDSCswzMouJrRn2A3EAbGzHTf88q_qQ=DC_KX7dbf_LJzqBg@mail.gmail.com> <20250630082313.GB23516@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630082313.GB23516@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jun 30, 2025 at 11:23:13AM +0300, Laurent Pinchart wrote:
> Christoph, you mentioned
> 
>   Right now we don't have a proper state machine for the
>   *_kernel_vmap_range, but we should probably add one once usage of this
>   grows.
> 
> Has there been any progress on that front ?

None that I'm aware off anyway.


