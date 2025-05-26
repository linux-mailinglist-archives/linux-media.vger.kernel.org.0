Return-Path: <linux-media+bounces-33371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97783AC3ED9
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB06B166FE4
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 11:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279ED1FC0E2;
	Mon, 26 May 2025 11:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mOsf/aiJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9351F429C;
	Mon, 26 May 2025 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748260092; cv=none; b=XGwmZEjCEE3y5QCkNrYFhx1+5qdKjaCQss/pxT7Pl/rSU5BzepOdXu1a6nbX5NAdcBOq/lVa7TA0oxusYmNhDdp3gQa8TpCZMT911hINb1ftkz5v5SB0Xr0Tkd8zAv2nPH3WiVQ+eNQH1SRctaPHxaoiVzskOSDOnj0e2RBWozI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748260092; c=relaxed/simple;
	bh=XsGcsxhAbv7yMUleVyXys+nMUzETejwwA0tokuI4C0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYuOwQjoRzZhkC4EktM8ltM+Plrwn6pf1ECf53Ma/x339uA7NqAKO3pd5K4pp7cVbx+M4MFKySxoOj7RadT4HbBA/lz0CB5ZbdX7qSjGhlg4rhBb+do7uuvV3fjkNpYSxqeysSB/8JJ1Vv5qvzuEW4oKINGbwkqzgiX92XqRFf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mOsf/aiJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A49E1982;
	Mon, 26 May 2025 13:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748260063;
	bh=XsGcsxhAbv7yMUleVyXys+nMUzETejwwA0tokuI4C0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOsf/aiJ6oKCcvP88HehPE3/R0EvX/IOFlZzgPh/qS9Tj5XBJ78Ed+oyNRWYhBKnL
	 peLogcjskIF9A0HadVG5TKc3sMbycGbXdN5bN4bn09z7jnhxPliZMuxketHTTVZZib
	 RZXyGoaSt8y4vkcPb3O21ONztioi78u1hftALubk=
Date: Mon, 26 May 2025 13:48:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Akshay Gupta <akshay.gupta@amd.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 1/2] Documentation: Bump media IOCTL reserved numbers
Message-ID: <20250526114802.GD17743@pendragon.ideasonboard.com>
References: <20250526111732.487229-1-sakari.ailus@linux.intel.com>
 <20250526111732.487229-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526111732.487229-2-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, May 26, 2025 at 02:17:31PM +0300, Sakari Ailus wrote:
> The Media Controller uses IOCTL numbers up to 0x81. Given that nothing
> appears to be using them for other purposes, even in the samples
> allocation (checked with $ git grep "#define.*_IO.*'|'"), just reassign
> the numbers up to 0x8f to linux/media.h and bump the samples allocation by
> 0x10.

The commit message should explain why. The explanation is in the cover
letter, just move it to this patch. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index bc91756bde73..6b3be3fb0b15 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -312,8 +312,8 @@ Code  Seq#    Include File                                           Comments
>  'z'   40-7F                                                          CAN bus card conflict!
>                                                                       <mailto:oe@port.de>
>  'z'   10-4F  drivers/s390/crypto/zcrypt_api.h                        conflict!
> -'|'   00-7F  linux/media.h
> -'|'   80-9F  samples/                                                Any sample and example drivers
> +'|'   00-8F  linux/media.h
> +'|'   90-AF  samples/                                                Any sample and example drivers
>  0x80  00-1F  linux/fb.h
>  0x81  00-1F  linux/vduse.h
>  0x89  00-06  arch/x86/include/asm/sockios.h

-- 
Regards,

Laurent Pinchart

