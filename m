Return-Path: <linux-media+bounces-41829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDC4B454CA
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 242331CC1C21
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E4A2D5C6C;
	Fri,  5 Sep 2025 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c3WKy5Qt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822202628D;
	Fri,  5 Sep 2025 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068368; cv=none; b=WuQ71rYppjBVEbBRsx9FynaLKSQOB8I7k78rgSE9XNg/NTWOMgJhwG4kpTmrGdK6QrgbnXG6gZlVl9Kew/rGpVAtg9rJBmjqO5ZE/lWguUrKQWZqErOsfZj37IEGukWg8DmZH4pKJulhprjay2nMlYXcStnU4o2b0tfNldQ0v1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068368; c=relaxed/simple;
	bh=5DVshUgvsutna/vWBwoiF9GhetzyEI3MDGW47MW0vD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZtT/cZnWlPU5WRNuWx3c+M9jCa1DPGRKnvUhBXRtuzQYNTqhcJwxDK+xXCrkjINQXmEdFZgNkP3Cqiyc8cI9OvCyJNj0uj/vIb94ILU+iXnn9uhj1YHmwW0vxaAwKojKsBtfPxuf7BAhzTFe3ThayG5wbm5UHZeQd6k8z8Q9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c3WKy5Qt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D10C4CEF1;
	Fri,  5 Sep 2025 10:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757068368;
	bh=5DVshUgvsutna/vWBwoiF9GhetzyEI3MDGW47MW0vD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3WKy5QtOPXOFcAAr37G6VHoySJT+5S34sGiQdHssmzCLLmAurCXRUoNTQSuxNMvq
	 fAOiVizfb+kBIP9qp4BDAFA1+FC75NJrYSIleWpBvG5uCpEdPF7bmVqFKom42OcStc
	 xZq6cgrv8895jJV/hcSYy4dZH9pkDhz9IvD73O0I=
Date: Fri, 5 Sep 2025 12:32:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
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
Message-ID: <2025090509-stoppable-contrite-13ae@gregkh>
References: <20250527055648.503884-1-sakari.ailus@linux.intel.com>
 <aLq6nRzW-KgSZ7yG@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLq6nRzW-KgSZ7yG@valkosipuli.retiisi.eu>

On Fri, Sep 05, 2025 at 01:25:33PM +0300, Sakari Ailus wrote:
> Hi Jonathan, Greg, Miguel, others,
> 
> On Tue, May 27, 2025 at 08:56:45AM +0300, Sakari Ailus wrote:
> > Hello all,
> > 
> > The Media Controller uses IOCTL numbers with '|' type up to 0x81 but the
> > range from 0x80 upwards is documented to belong to samples. The samples,
> > however, are currently using these values. Solve the problem by bumping
> > the top of the MC range and the samples allocation by 0x10 as the samples
> > don't require a stable IOCTL interface.
> 
> Could you comment on this, please?

Why not just live with the overlap?  What problem is this causing?  It's
the MC subsystem's "bug" in that it took over an ioctl range that was
already documented as being used by something else :)

thanks,

greg k-h

