Return-Path: <linux-media+bounces-39133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5234B1EC6A
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 17:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A98B6566D74
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 15:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F91285CAF;
	Fri,  8 Aug 2025 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H3u2AbBA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BC123ABB3;
	Fri,  8 Aug 2025 15:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754668313; cv=none; b=TahQr5Rvrhp67kpNRzqsyN+fEmpzK7WmTPhPj/F9VoNSRWKmKXdCPfRMWptnSjvXVIj79j2S5sCIIWzoQpQWYgaY8bGn+k+9CoC34ybVURWc6dVj2VQTCSAENTxHZJ0SPGb4CHM0CdsiOvcJvEZWuZ9deGVnFVUGJ8ZCjc6IaXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754668313; c=relaxed/simple;
	bh=O60+CfQRqxsPkK5orfussWxIUT5ae8zTCtYvV75yCVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAypm+z0U3yR5KVxlCgfod1dnGZdr4Hvbf2dfN+Ox5a8tK/LqiTC8pewp2AklnQ+qUkZJWFQL70xB0glGnXwVapH/Kwyq0pcviV7oB8oynYETqRo9BL+HM/+DNFz8+BHz5BkEblTxzoweUBdxNKalu0BU9CuP6t+X5O5C+KQ2KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H3u2AbBA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4A5BA1920;
	Fri,  8 Aug 2025 17:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754668259;
	bh=O60+CfQRqxsPkK5orfussWxIUT5ae8zTCtYvV75yCVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3u2AbBATMXYoDUmdaZwhAluBeolSpisTYeWlq7jOyRGqLPowhIx5qDH0wijbbjdI
	 PbCM+7+rWgjf5YEJJDZX6nRdg1qPEAPGTIq6ulv5SYoeWZ6/S5fTdHJbHL/KmhyB2V
	 8IJOTTys3ZsHnJyBdXO4Qx7Z+RLyKz5UkgC5dT+w=
Date: Fri, 8 Aug 2025 18:51:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lee Jones <lee@kernel.org>
Cc: arnd@arndb.de, mchehab@kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	linux@treblig.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Remove the wl1273 FM Radio
Message-ID: <20250808155133.GC23187@pendragon.ideasonboard.com>
References: <20250625133258.78133-1-linux@treblig.org>
 <175137646300.2319882.12045106011003909576.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175137646300.2319882.12045106011003909576.b4-ty@kernel.org>

Hi Lee,

On Tue, Jul 01, 2025 at 02:27:43PM +0100, Lee Jones wrote:
> On Wed, 25 Jun 2025 14:32:54 +0100, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > I noticed that the wl1273 radio had an unused symbol, but then noticed
> > it is on Arnd's unused driver list:
> >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > 
> > So, delete it.
> > The components seem pretty separable, except for Kconfig dependencies.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [3/4] mfd: wl1273-core: Remove
>       commit: efddd98938400a570bde5bc69b5ecc7e76cacbe1
> [4/4] mfd: wl1273-core: Remove the header
>       commit: d356033e7b1e94e0187bb0651f4a066a4646fbb9

Ah, that may answer the question I just posted in another reply to the
cover letter.

I think patch 4/4 will break build in -next until patches 1/4 and 2/4
get merged too. Should we get 1/4 and 2/4 merged in the media and sound
trees ASAP, or would you prefer a different option ?

-- 
Regards,

Laurent Pinchart

