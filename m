Return-Path: <linux-media+bounces-13003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F653904DA8
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 10:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FD591F22B27
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 08:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A9E16D4F0;
	Wed, 12 Jun 2024 08:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PDVnIzZW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81AA16C6BE;
	Wed, 12 Jun 2024 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179694; cv=none; b=c3C03XIYzfXpbIcYCpKRQf9toqyNm5lrdwAVe4amn5pTnSNPgUTeMqvAzde5WJJNr/Gu9+nx+qobvvWeGbSnBR69/Ty56camSlWIyYE27XQrGUWySGoIvuA1FKzaMQ3f2ALFCc1YnN/rSOKGgm4eLR8+KBRK69wKLPDvMiHtea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179694; c=relaxed/simple;
	bh=l9fgbZyRrIH5vvBxQjqXX2zQ6wnQJqpx1F1Nlsck1l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTbMb1E8j9h8KHEn8S848Lu12MN5R2GMKC3TuZDsVZXkYxeiYVaOgAB/mOiopw68PYOtTr7dTroa4Abrs6u2RiwZ//tbBt7ZQ3JOhNck4f0B0i/7ps1VNrlzclv0XlLjAIo2zK/Wu7koAq42J7/xfjSy0T1ovzEHmKCsj+wv22o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PDVnIzZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA82FC3277B;
	Wed, 12 Jun 2024 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718179693;
	bh=l9fgbZyRrIH5vvBxQjqXX2zQ6wnQJqpx1F1Nlsck1l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDVnIzZWge9txTsql4SWRhdPMymZqjJJ/tvlEPHWkuJ/8o14BtHZ84VQRBkDxi2ld
	 +v3Ib4buTQeUg+Msls79GZY8sIhm7bDE9TFtKMO0zJrWysGyFw6uGZK/UvxzlGIt2f
	 2lqregVz97t2LGTJjzpEejreVv5mY0+JeefAZdEY=
Date: Wed, 12 Jun 2024 10:08:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tony Luck <tony.luck@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v6 05/49 RESEND] media: atomisp: Switch to new Intel CPU
 model defines
Message-ID: <2024061202-unclothed-idealness-fee9@gregkh>
References: <20240611173406.352874-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611173406.352874-1-tony.luck@intel.com>

On Tue, Jun 11, 2024 at 10:34:06AM -0700, Tony Luck wrote:
> New CPU #defines encode vendor and family as well as model.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> ---
> 
> Mauro, Hans, Greg: Which one of you owns this one. Can you take
> a look please. Let me know if changes are needed.
> 
>  .../atomisp/include/linux/atomisp_platform.h  | 27 ++++++++-----------
>  1 file changed, 11 insertions(+), 16 deletions(-)

Not me!  :)

