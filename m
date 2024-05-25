Return-Path: <linux-media+bounces-11874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E1E8CF0AB
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 19:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB1EDB20E31
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 17:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502001272DF;
	Sat, 25 May 2024 17:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="nt5sPvr7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C91486ADC;
	Sat, 25 May 2024 17:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659724; cv=none; b=T7lRxcQmpYA8AnSGX9ff8QyV3Uz/WK/Wup+7lwPnj7KuAo3tM3Oi75yHjfKOwSI7rCYjWjHi6+RYyAD36wY+KFWGKOkSiSc4lOyKg9FacGL6U0NS7NV6ROCaIBpendv9+OBmABYUT5pF84TQxacNm48OzofjpfkfBGcAU7nU1G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659724; c=relaxed/simple;
	bh=/Daddhd1J61xufDyCg5FjDOPfTMSIi5aUeTQ+lvhvCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+sess3WHfvit6AZtkLwMsSv/5cFfadgvjNFYt7kHm96kdJCislB57TCnxmB/vp2AoUUCtyuC42g6wRBB2oZhihF+2cTqpPj/jmRKZR2CJC0ZHa08fH8xThTW6sjzAaijXWHVhJ0tzRrwhP1bdp4rClfwuOVAN5lmK8vHiV85GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=nt5sPvr7; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=sWHpoYAbwc/NBxu2pzSoM+et6peAc7u8uTs6bJ/QDWA=; b=nt5sPvr7/t2Sr7+N
	z+/JCuQg3AyFyzIN2U2T4w4Pb3MdyeonPzZE0MfLIg3c04lA5icPxCfqNSNgGE/0ajRo72XcA3e8N
	hdR9PwwBdsExr9nXtJ9QSAyLk+FSpYhlyjWjzEYdkHbZAS4MyinhQJTCFeZC5WSxcDETv8sLJ3eBE
	udgcSmONr2grf/RAcjPHlPAxxbA37yNr3k4THhfywAfZX9/rLwX1uyRy5zIfm6PHSTwq5pyRd2QOd
	rHBxR6hRWxHXvjH2/OCOO2eT6P1o5mC+i/eBEGo/GIKICOLL2k3fDy41h/UIFM/1u+YzAIbGRM6PP
	BrzOz0PwHH+uQpyX3Q==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sAvc0-002Wjd-0l;
	Sat, 25 May 2024 17:55:20 +0000
Date: Sat, 25 May 2024 17:55:20 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: mchehab@kernel.org, isely@pobox.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media dead struct removal
Message-ID: <ZlImCPQJHUK3omiX@gallifrey>
References: <20240525175229.100559-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20240525175229.100559-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 17:54:41 up 17 days,  5:08,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Dead struct removal in spi and usb.
> 
> (These are the last of my struct removal in media as
> far as I know).
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 

Note there's a bounce for:
Charles-Antoine Couret <charles-antoine.couret@nexvision.fr> (maintainer:GS1662 VIDEO SERIALIZER)

  charles-antoine.couret@nexvision.fr
    host mx0.mail.ovh.net [178.33.252.245]
    SMTP error from remote mail server after RCPT TO:<charles-antoine.couret@nexvision.fr>:
    550 5.1.1 <charles-antoine.couret@nexvision.fr>:
    Recipient address rejected: User unknown

> Dave
> 
> Dr. David Alan Gilbert (3):
>   media: gs1662: remove unused struct 'gs_reg_fmt_custom'
>   media: opera1: remove unused struct 'rc_map_opera_table'
>   media: pvrusb2: remove unused struct 'debugifc_mask_item'
> 
>  drivers/media/spi/gs1662.c                   | 8 --------
>  drivers/media/usb/dvb-usb/opera1.c           | 4 ----
>  drivers/media/usb/pvrusb2/pvrusb2-debugifc.c | 5 -----
>  3 files changed, 17 deletions(-)
> 
> -- 
> 2.45.1
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

