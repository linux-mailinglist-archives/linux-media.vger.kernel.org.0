Return-Path: <linux-media+bounces-41832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 605F0B45596
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 13:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34B9CA01E0C
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 11:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21468341643;
	Fri,  5 Sep 2025 11:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="sUL8AhId"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A667C30EF77;
	Fri,  5 Sep 2025 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757070177; cv=pass; b=ftuAUzcH7y2neb+rvkOt3inlDhsjeWtemfDe+KqhPlDECdX6u5lANxVCU9BF+5To9BhGt6aT3TgxuOS1zLc7BpPiXawLQR6D2TNjQqkiTwhOkO/bKOIXlGWRXdTZj03W7LKBJi3AuD31vWkpdOUvRRzxPp4Lvt75v+L+78WC0Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757070177; c=relaxed/simple;
	bh=P2iHI7vsheys9H8pRZ4vVNpOtevF6FDEoB/h/uYv2FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BP00EXeSLXwSrR2eduusxrLjUKhDjHaAMrV8DqjGxuQOUB/d8vlkh95Clm3zrIexMDzYgaXF+sT6IhgngkyY3eQpFfRqgPJljTK/g+FLfRtGIjF2BwdMYkxKdNRAbDXN1JJl6Srxatdp23IiMHOMX8pzCdmKPSd119IdziyRUBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=sUL8AhId; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cJD2z5nqQzyTd;
	Fri,  5 Sep 2025 14:02:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1757070172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P1E2z40KUhb9oRrEcOHM1zFRsgM+QgNrSQ+qiRhPHDI=;
	b=sUL8AhIdxsxTMzukF8G/jTcQDVttOThJlXe12ajJr8if9trJ29J2ZS1It5Aaw3/eKLNOtl
	Fy8uY2d9ttD8i/KkA2+diWMcjjO0Tk7XRNDUR+hAXt2uRkQ4yQtd8GPeaytJpNGiPO5RWl
	zhtIJMYrm1xVhJz37xzU2H5muL3WYTY=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1757070172; a=rsa-sha256; cv=none;
	b=XjpUH1ct9YevFLDmw6HErb6LQ8oqcJLGEF3IdbV8BGyxscbvGcA3SLmXz+Jxva869Fcp2b
	59P5zq14UZsKeSEysHWjgWhIiKcG/ditycwTIDzCoEeKCrWgs63v3W4l+ZG4cUamzO6j3y
	Y+j6kOE/d6ElUqo88ydIVi22CmHW3aQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1757070172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P1E2z40KUhb9oRrEcOHM1zFRsgM+QgNrSQ+qiRhPHDI=;
	b=bDRkPVmNuI2N178/yg6sZWx+T77CXdIiB02bolnMpjDfakID9qbJmb5tDC4oXKso0dkUrU
	YFhWSPTVCM5VuGhf+b4AGASkDx5B3ZAq2j6FDe1mKcMoiTVy4Zp9zndXMcoFwTZ59UyUs7
	hffdDSP+8cej4ti/DSPtYTaXCh+wf54=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2E1B9634C93;
	Fri,  5 Sep 2025 14:02:51 +0300 (EEST)
Date: Fri, 5 Sep 2025 14:02:51 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Akshay Gupta <akshay.gupta@amd.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 0/3] Document Media Controller IOCTL number assignments
Message-ID: <aLrDWyxiiF2hPu_8@valkosipuli.retiisi.eu>
References: <20250527055648.503884-1-sakari.ailus@linux.intel.com>
 <aLq6nRzW-KgSZ7yG@valkosipuli.retiisi.eu>
 <2025090509-stoppable-contrite-13ae@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025090509-stoppable-contrite-13ae@gregkh>

Hi Greg,

On Fri, Sep 05, 2025 at 12:32:45PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Sep 05, 2025 at 01:25:33PM +0300, Sakari Ailus wrote:
> > Hi Jonathan, Greg, Miguel, others,
> > 
> > On Tue, May 27, 2025 at 08:56:45AM +0300, Sakari Ailus wrote:
> > > Hello all,
> > > 
> > > The Media Controller uses IOCTL numbers with '|' type up to 0x81 but the
> > > range from 0x80 upwards is documented to belong to samples. The samples,
> > > however, are currently using these values. Solve the problem by bumping
> > > the top of the MC range and the samples allocation by 0x10 as the samples
> > > don't require a stable IOCTL interface.
> > 
> > Could you comment on this, please?
> 
> Why not just live with the overlap?  What problem is this causing?  It's
> the MC subsystem's "bug" in that it took over an ioctl range that was
> already documented as being used by something else :)

I do agree ideally this shouldn't have happened in the first place, but I
think it's also cleaner if we can have separate ranges. Pushing samples out
a little doesn't look like an issue to me. The set also adds a comment on
not adding media IOCTLs beyond the new allocation.

-- 
Kind regards,

Sakari Ailus

