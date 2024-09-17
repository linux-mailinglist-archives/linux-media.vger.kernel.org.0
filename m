Return-Path: <linux-media+bounces-18327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9880397AEEE
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 12:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A35E2813EC
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 10:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA65166F16;
	Tue, 17 Sep 2024 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ceeHaIYE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0462165F08
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569385; cv=none; b=mHINEYo0CsZ1P/J8RrRAeUcb3tdnXhSWWKPRwu5fR1xNm73y7BX+35IsQE2uqsFbSRyr1a3zCOt4z74WXP+e8LvX2+kgcIWFJcwhodl9BWcHBuypDKsP7ApIs+rrBzQEfvypXdSydBEutSWz8OCgcwO2ZSLwjceXxJjN/BE0SCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569385; c=relaxed/simple;
	bh=l9xNALwwkHZ/mS69ylaRUPl0iGnnCSc6gzdJ2WK+MMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l78Wk6CiwXkMByzE827iLGxOKHd/QFYZUAa+Z+Z+viS4J0oN44DGG0D5u1vDL+JRQ1krwc31qTd6awkAVdgFB6ZiN2DaomOoM9oZde0uJ6W9S46T9PbhLVWC/HhxcSYNHwMJyqqQvLic07oyswujzYMnsrQPdhY96vbj6pF9pPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ceeHaIYE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (62-46-121-59.adsl.highway.telekom.at [62.46.121.59])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 875613C7;
	Tue, 17 Sep 2024 12:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726569299;
	bh=l9xNALwwkHZ/mS69ylaRUPl0iGnnCSc6gzdJ2WK+MMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ceeHaIYEwZfVQ9hPok69Yn7vLu8Bl93842teEe/3TFWA/VkHUdX3LWbgKKUiec8oq
	 e4Igk9iY9bQbLraEp/vfH7YLVGjDb3alB/n6hJBr5PBwvdrkvvau/somd1QOtN57fz
	 clW05XFZkiWyAirixNFZvwbA4VnQI55QjK6G9DY8=
Date: Tue, 17 Sep 2024 13:35:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Steve Cho <stevecho@google.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <20240917103547.GA17350@pendragon.ideasonboard.com>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <CAN0yncErs6T9MTp+QxrmbRgSWp79_YvoS_ekVOZB5N1mQ2wdLw@mail.gmail.com>
 <ZulbQNBZidwApHX5@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZulbQNBZidwApHX5@kekkonen.localdomain>

On Tue, Sep 17, 2024 at 10:34:40AM +0000, Sakari Ailus wrote:
> Hi Steve,
> 
> On Tue, Sep 17, 2024 at 12:18:21PM +0200, Steve Cho wrote:
> > If it were to happen on Wed, I can book at a room for some times at OSS
> > venue.
> 
> Not everyone is attending OSS. It'd be the best if this would take place
> outside both OSS and LPC but I'm not sure if this is doable.

I'm personally available on Friday only, or possibly on Thursday after
the complex camera micro-conference.

-- 
Regards,

Laurent Pinchart

