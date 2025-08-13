Return-Path: <linux-media+bounces-39798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7169EB2478E
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30EA97BD6FB
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 10:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0972F657F;
	Wed, 13 Aug 2025 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W73EH2mf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C812F0C47;
	Wed, 13 Aug 2025 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081551; cv=none; b=a4phtlB1M8NQwoyNRLfmI6zw9Twk1RrxDZrAvlVYKNTfpOJJkk2Nk6gmeeyc2RLsAfkapYDAsI7lWdfuzthOiQ9fYvAaIwN8HoEhRK5ZWl29TNgY0BxJbWrWj0zrIDY7/xQ9sH+ZTkK9VuQ8yQ50zIKESG2A/wwlyoVIvlOSb4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081551; c=relaxed/simple;
	bh=vU58AEtLJER2N7ec3MAyo8uq9Cj5lDoJ2STD9420TSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDpq2OYNspWQXoWU745tohNuzpTXQ6KgjKrlu6oGyPME8PFxiv/LYdAYWf+K4iBJwZ9Wk00lbe0+pCsred7F3TZ8VVKARyNgPmreGTUgooGd8CwTSJRLwU6YF559zzy3Il01/9nLdWgjRP+QRnyt/2oV/9F2Br9OaCNDVYgKOGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W73EH2mf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A757E2EC;
	Wed, 13 Aug 2025 12:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755081494;
	bh=vU58AEtLJER2N7ec3MAyo8uq9Cj5lDoJ2STD9420TSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W73EH2mfLixrI4zkDbTPT/GxQm87PFg9RFPqcG0UwK8NKtlbdyAwEUxc3ZLEuMWmR
	 kCXKyZo0f3XdfcSbgPE9UGFi6ENyh4vQDSsGWHhmzW38MwwtPXQCOR/Kl1jt1x+4fU
	 QVwiYIwCVarvK2b/u7cE5MTbVz/7vArpq49FiEFU=
Date: Wed, 13 Aug 2025 13:38:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: imx296: Remove redundant semicolons
Message-ID: <20250813103849.GC6440@pendragon.ideasonboard.com>
References: <20250813094746.557013-1-liaoyuanhong@vivo.com>
 <175508029630.560048.7835285687538106544@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175508029630.560048.7835285687538106544@ping.linuxembedded.co.uk>

On Wed, Aug 13, 2025 at 11:18:16AM +0100, Kieran Bingham wrote:
> Quoting Liao Yuanhong (2025-08-13 10:47:46)
> > Remove unnecessary semicolons.
> 
> Well ... there's only one so it's not plural ;-) but indeed this is very
> redundant!
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > 
> > Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> > ---
> >  drivers/media/i2c/imx296.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> > index f3bec16b527c..cbbe0e7a37a9 100644
> > --- a/drivers/media/i2c/imx296.c
> > +++ b/drivers/media/i2c/imx296.c
> > @@ -922,7 +922,7 @@ static int imx296_read_temperature(struct imx296 *sensor, int *temp)
> >  
> >         tmdout &= IMX296_TMDOUT_MASK;
> >  
> > -       /* T(��C) = 246.312 - 0.304 * TMDOUT */;
> > +       /* T(��C) = 246.312 - 0.304 * TMDOUT */
> >         *temp = 246312 - 304 * tmdout;
> >  
> >         return imx296_write(sensor, IMX296_TMDCTRL, 0, NULL);

-- 
Regards,

Laurent Pinchart

