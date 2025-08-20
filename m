Return-Path: <linux-media+bounces-40420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC2DB2DD51
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87BD3586B03
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 13:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4779931A068;
	Wed, 20 Aug 2025 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vBLx+yKZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9580E29BDBB;
	Wed, 20 Aug 2025 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695143; cv=none; b=kV1Pbm7E0SLpuibB45y0c5V0GS1qShiFPXIzMuox6Q4tHqGLmki0c3L4sVeG4b8EUy/3ksBLBiw0bwLbafAWcnEdNs84Dvv/t5V8jXqKkPPZnDPrgMH/hR2mQeWCr9RAMVg3tblceFVvx9Lm6XnSf9am9CT1HRpiR+5pA6m1WEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695143; c=relaxed/simple;
	bh=+AqIPw9Y2etgWZe0N4FwV/BwFuaDUEfDSkYmfB7gxRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkDSyB5DDTNNOSN/baaktL2EZ969bGOk1SmLdNQzFs681rSX3MVA6ngO+7MXZiddFJMMKjFCjkaHeIvyCZYcNcGRf/1gb6YzQr/Unxn9Jqf84uJMBbbHhzcyDn3LurVe+k4QLx+fspLuF3HYeBauNyERKhAEQBG3Owk16w5rL0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vBLx+yKZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96ACC4CEEB;
	Wed, 20 Aug 2025 13:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755695141;
	bh=+AqIPw9Y2etgWZe0N4FwV/BwFuaDUEfDSkYmfB7gxRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vBLx+yKZTrKXgZg9itXzJUVoin1rvWq7yOAdeXrdCP+qe1Pby2FFQ+k7G7+7QQQ5g
	 nYmTW0zENrOzCU2hAHi0OXit17bP9CjV6UAO7thPSYqSeaSmjIYfRjpGYFY23AeJf5
	 XJQDXIOBTvTzQ9nVYQ/M0eTAI2tnaV7cj5NYM1jE=
Date: Wed, 20 Aug 2025 15:05:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-spdx@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: mxl5005s: Replace GPLv2 boilerplate text with SPDX
Message-ID: <2025082031-swab-rewire-83b2@gregkh>
References: <20250820125516.494408-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820125516.494408-1-thuth@redhat.com>

On Wed, Aug 20, 2025 at 02:55:16PM +0200, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The FSF does not reside in "675 Mass Ave" anymore, so we should
> not ask the people to write to that address in case they need a
> copy of the GPL.
> 
> Anyway, all other mxl* files in this directory (including the
> corresponding header mxl5005s.h) already had their boilerplate
> text replaced by a proper SPDX tag in the earlier commits, so
> let's do the same in the remaining mxl5005s.c file now, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

