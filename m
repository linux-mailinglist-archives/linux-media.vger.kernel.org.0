Return-Path: <linux-media+bounces-41828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15888B454AE
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3310B7BDDB9
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73A92D877E;
	Fri,  5 Sep 2025 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="qGgcElPy"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF4D2D7DC1;
	Fri,  5 Sep 2025 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067942; cv=pass; b=bF4Rko8fxoN6tmrVq0SchP/n2siPaNGSwGX9BGVNPmFa2puUFgqjl+NNnBeohSB+UdIS0obcGHq+e9fioeDIk/PHF9bLGEyy/R0eHiX8NuravA/QpADwVLE1tK6eMoUjhfaDORLTAb9F8ooXItDeXThzRGA66omuqmJHRhHGem8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067942; c=relaxed/simple;
	bh=WrTWB4A5xZPuVPI62PKOA31qyVTE6ts5lmBTr3kGmv0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/rGBMknJzNZ04J66dDcCal2q4N9zRM9aKRSlEnRYVtNkJFqTmngJVxllXoZKhwLx/WsE4CQHBt6EuevPdWXFvo0KTM3KDOdPJj0wWF/DieIdMNViOV2P/cG8h0KJkTjTKurLBZYeSvULaBPjxMRlSFtvN86J20wc4mMa0rqdQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=qGgcElPy; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cJCCy0x6qzyb3;
	Fri,  5 Sep 2025 13:25:34 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1757067938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8RCSSqz9g96eHdDOj4mfzJmhmUxy+8626LdoZ13YEIk=;
	b=qGgcElPyQOH+hXd6lD1Hxf6To42OJTKlrYSpJR9MzKgtu6gQ/HJOfDuoQMys1Gj+MU0+za
	vDGd/32/2OFE2JM5j6fASIRjXSgpd9chCiFQDwbMfQdDNSmj8xtLxuJSrlddWdVV4dDjz4
	KKkkW3S5lpgHd+8wTcpYIRJ9Ch2aZAM=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1757067938; a=rsa-sha256; cv=none;
	b=b+YqDPY/Z4m7FOdc6NZngknJb3ZpIhknB9rBqX0BG7ghmyGxE+hJAA8RcQr0taIA8/z9DW
	VSPTKkofs0JuNl2I5jj2NL43O1SmfJmPXf0wLle+GQ5EhPBVrZtaEqQNSlYgdr2VDo9e2O
	kiPjO+FkMLMZzrJ5EHEekJcHWmpucdY=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1757067938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8RCSSqz9g96eHdDOj4mfzJmhmUxy+8626LdoZ13YEIk=;
	b=WY2d53xYZbxZOEMUiqRtqCqidBaaT8SQcgCUG/J29LLQY0L8BMIxycYFYmr5LRpNMnlWDI
	pgD6IuMDVDA+30S1zeVp6h0ubqdlotl9/l9SYxDH4jAGteva9NVf09ZWeezcHGTRcpilCy
	dPwHLSgonRqyxwnGeJZC2WTPuCWZWq8=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 97815634C94;
	Fri,  5 Sep 2025 13:25:33 +0300 (EEST)
Date: Fri, 5 Sep 2025 13:25:33 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <aLq6nRzW-KgSZ7yG@valkosipuli.retiisi.eu>
References: <20250527055648.503884-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527055648.503884-1-sakari.ailus@linux.intel.com>

Hi Jonathan, Greg, Miguel, others,

On Tue, May 27, 2025 at 08:56:45AM +0300, Sakari Ailus wrote:
> Hello all,
> 
> The Media Controller uses IOCTL numbers with '|' type up to 0x81 but the
> range from 0x80 upwards is documented to belong to samples. The samples,
> however, are currently using these values. Solve the problem by bumping
> the top of the MC range and the samples allocation by 0x10 as the samples
> don't require a stable IOCTL interface.

Could you comment on this, please?

I'd prefer to merge this via the media tree if that's ok.

> 
> since v1:
> 
> - Improved the commit message in the first patch.
> 
> - Added a patch to change the IOCTLs also in the Rust sample.
> 
> Sakari Ailus (3):
>   Documentation: Bump media IOCTL reserved numbers
>   media: uapi: Document IOCTL number assignment
>   samples: rust_misc_device: Bump IOCTL numbers
> 
>  Documentation/userspace-api/ioctl/ioctl-number.rst |  4 ++--
>  include/uapi/linux/media.h                         |  4 ++++
>  samples/rust/rust_misc_device.rs                   | 14 +++++++-------
>  3 files changed, 13 insertions(+), 9 deletions(-)
> 

-- 
Kind regards,

Sakari Ailus

