Return-Path: <linux-media+bounces-34598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE375AD6C64
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B7EE17D5C9
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC7C22B8BD;
	Thu, 12 Jun 2025 09:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GB5DFE2r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3961F583D;
	Thu, 12 Jun 2025 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721094; cv=none; b=RxpucFfoUZXg93cAl1tWw+WQj/M+GKS6kIAB/U1HczbY0uHa5s1TFX92zGy/i3k8VZk0yqeJIkJIYcj3w8MEmx8Rxv8CbydCcyb+wY60h2WCgpjYrdtSvFvyC6xyuWXwAH1EyyWala5hg0ZLmY+OsPkFVEmdpEBTsiSBJug0PxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721094; c=relaxed/simple;
	bh=7Sew4ToZ48tcoIH5TUH3MSmnlLAiIfzoRnfYAjbjk4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQ7i3/V9R3ozypOEzODBNa3+qC9fsS+SQOnmg/QnHqrqCY/fodzzrbP/cXVmQXiZYJDiWNB3Uba7dAMwGMRsrqZSK4PFz2PR483z30P+PpM87vz6JyOwYcwqUPOMNAXK9Y2GLgtkwTcSj8n+rQwKAM6UY3ivHU/jWF/X1dEdLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GB5DFE2r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2EF27E4;
	Thu, 12 Jun 2025 11:38:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749721082;
	bh=7Sew4ToZ48tcoIH5TUH3MSmnlLAiIfzoRnfYAjbjk4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GB5DFE2rrwc1NR0KSyjetQbYNpDQoHhKlVfzVN8TA7JXnt3QYIVu+by2gEYyviYOd
	 ZWD5qLZP35SoMrBvp0R4pjy62H3JJgs/b5zerR9J5vn0Qz49WiYvRT2/bTYrtmoFWP
	 ie6bTZeQ945UIf9PugrWP/Q9w2enfOHfs6GmYhyk=
Date: Thu, 12 Jun 2025 12:37:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [PATCH 2/3] media: vsp1: Reset FCP for VSPD
Message-ID: <20250612093757.GA4533@pendragon.ideasonboard.com>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
 <20250609-vspx-reset-v1-2-9f17277ff1e2@ideasonboard.com>
 <20250611232956.GQ24465@pendragon.ideasonboard.com>
 <CAMuHMdVU0JJDff539YBMhM8xNQVf5Ufiw1D9TXitzsGWXPBMAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVU0JJDff539YBMhM8xNQVf5Ufiw1D9TXitzsGWXPBMAg@mail.gmail.com>

On Thu, Jun 12, 2025 at 11:33:39AM +0200, Geert Uytterhoeven wrote:
> On Thu, 12 Jun 2025 at 09:19, Laurent Pinchart wrote:
> > On Mon, Jun 09, 2025 at 09:01:43PM +0200, Jacopo Mondi wrote:
> > > From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > >
> > > According to H/W manual v1.00, VSPD must be excecuted
> > > FCP_RST.SOFTRST after VI6_SRESET.SRST. So this patch adds it.
> > > VSPDL is not applicable.
> >
> > According to the R-Car Gen3 H/W manual v1.00, the FCP must be reset
> > after resetting the VSPD, except for the VSPDL. Do so.
> 
> "Rev.1.00"
> 
> Stil, that is a very old version. "Rev.2.40" is 6 years younger...

The good thing is that both document the reset procedure the same way
:-)

-- 
Regards,

Laurent Pinchart

