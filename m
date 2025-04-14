Return-Path: <linux-media+bounces-30162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBCBA880AE
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF4BF17754E
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 12:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043C02BF3D7;
	Mon, 14 Apr 2025 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gq18NaZa"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4076A2BE7CD;
	Mon, 14 Apr 2025 12:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634559; cv=none; b=AEuTAYwtYVlj9siHrXYnAqNqomb45pEl43078TR3CImXSvOowYMUdSnWlqG2CT2w76H3vQgGB4ZU3EAXdKB91LkgDWm2Nmyocp9Y/WbC0EjC+ewHYKnfbhKNlIiiodBjdMKspiiyOMaoefBmeWH0tP/1IgOnk/g+DlwUev/lwFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634559; c=relaxed/simple;
	bh=GtYw0qEJu+ndi2eFJB6leAOMfQg3UNOm9YY7B4VxYUo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eak2XoqI6sdW2x1SHDbvg/LAwaaIx/hxZlPCmXwB2rEEbLGkWI/TIywXWX4GZ39/wz+Q/Uck9ANgzTTMts4HAFDRNbqG8US3+O3Vpab15OBAjeUU4+rbNtRBh3YT06DO8JKW+SDfsgssJBytqjl8Q2ZGGl2AW3BBziyU3uGGHo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gq18NaZa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744634555;
	bh=GtYw0qEJu+ndi2eFJB6leAOMfQg3UNOm9YY7B4VxYUo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gq18NaZaqYVr7ZXF4mu03IoDJhgyee/P8Zvh5CXL1mQpE2q4T6OfrYKnDt/bHXctJ
	 3EMXe/j/WuI9SFF+ujYlvHw/1BVpUMgPfHFbW201FMJSxME0UJhd8xRltehAuiN+Yo
	 d4QW82829AxtQ5BqMjg669OCAtMY4yXrpJIO4Yc0BzlB2rSpVPP99LbgyJXSUKqBeu
	 2xHSbdB3xM6lr9MJByteCHQiX4F035Gs3DFDCOp1GwPAPotdY3xBxerOomCnOdV8rH
	 6SLWq2Rz1XNrpwu8qdlmBI7JGu6nKVqfb1rePzwCqj6ZvMxowmLTe2oxa/6XmQj5as
	 pCY9obsXgt1og==
Received: from [IPv6:2606:6d00:11:e976::c41] (unknown [IPv6:2606:6d00:11:e976::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 63B1817E1034;
	Mon, 14 Apr 2025 14:42:33 +0200 (CEST)
Message-ID: <cffb6a6448a0cb32cc7b13e3048c097b3efc6f93.camel@collabora.com>
Subject: Re: [PATCH 2/3] mailmap: add entry for Michael Riesch
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: michael.riesch@collabora.com, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Sakari Ailus <sakari.ailus@linux.intel.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <u.kleine-koenig@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Date: Mon, 14 Apr 2025 08:42:31 -0400
In-Reply-To: <9f1c7c30082de242b4906e5ecbeb382400fcd4a2.camel@collabora.com>
References: <20250410-maintainer-mriesch-v1-0-cdc5c6c68238@collabora.com>
		 <20250410-maintainer-mriesch-v1-2-cdc5c6c68238@collabora.com>
	 <9f1c7c30082de242b4906e5ecbeb382400fcd4a2.camel@collabora.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le vendredi 11 avril 2025 à 17:25 -0400, Nicolas Dufresne a écrit :
> Le jeudi 10 avril 2025 à 21:41 +0200, Michael Riesch via B4 Relay a
> écrit :
> > From: Michael Riesch <michael.riesch@collabora.com>
> > 
> > After five interesting years, I left WolfVision and started to work
> > for
> > Collabora. Add a corresponding mailmap entry.
> > 
> > Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> 
> Reviewed-by: Nicolas Dufresne <nicolas.collabora@collabora.com>

Friday's typo special:
                                 nicolas.dufresne@collabora.com

:-(
Nicolas

> 
> > ---
> >  .mailmap | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/.mailmap b/.mailmap
> > index 4f7cd8e23177..59f99aa83185 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -503,6 +503,7 @@ Mayuresh Janorkar <mayur@ti.com>
> >  Md Sadre Alam <quic_mdalam@quicinc.com> <mdalam@codeaurora.org>
> >  Miaoqing Pan <quic_miaoqing@quicinc.com> <miaoqing@codeaurora.org>
> >  Michael Buesch <m@bues.ch>
> > +Michael Riesch <michael.riesch@collabora.com>
> > <michael.riesch@wolfvision.net>
> >  Michal Simek <michal.simek@amd.com> <michal.simek@xilinx.com>
> >  Michel Dänzer <michel@tungstengraphics.com>
> >  Michel Lespinasse <michel@lespinasse.org>

