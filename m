Return-Path: <linux-media+bounces-4529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E48447A8
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 20:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06E31C2368D
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 19:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A679D36AF9;
	Wed, 31 Jan 2024 18:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2T2tZJE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F8A339AE;
	Wed, 31 Jan 2024 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706727592; cv=none; b=Tb7oth4AUdE6kIn+MymcKHmCJRuNCU53/FG8gup7eGs8VULp7FsXQnt/4qMtAW3Fm2140E+tpjmdzNRTaqmkZMdoO28nhhYx5DsVkQ5+faUwgfYWpEdOjkRsdP27AGi+XrVQmBfjCqLm2iKgLeOtod0RUQEupoejPr27gfW35jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706727592; c=relaxed/simple;
	bh=zhKuq+LkCXaKbrjTf0rz7m44R1nLItf93tzKRFen818=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDZ20ObtDsLSjLtxshjv4n8k7F0xJ1mqExJW67ADRvcn7XZ0MXYnv7Ku/WWWBRzLSeUPgO2wbi8xno2GgjyI/zVTHEopcnjJsSLfYYAHfTon5sugBuNBAGN4IxBQjk+gL5zo/OweGMwJFgL0AIKIqQRLcxuD/YlOnzfuyq9D9lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2T2tZJE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B6DC433C7;
	Wed, 31 Jan 2024 18:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706727591;
	bh=zhKuq+LkCXaKbrjTf0rz7m44R1nLItf93tzKRFen818=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2T2tZJEsLoBpHrkqTKdor3Ee8fR4osEdkaiIsbw0pFM+JUAISnyhSeqEXLzx1zHW
	 tDWEjLTaTOZ+IySnxgNoy/AkBn3s/9CRKSqPMOk4D/+TyVZxprDrOPnqFIdegcTrAE
	 QcDTN8RN3UhFnEYNy4/+hRJfLDx5XO2xp6flSfxddWXTHT9mNL38pghll2fTkxV4FE
	 8VeVNXUgKLEGn+QwFZYUjkYhrhAVqcOcTTWduvG93lYLSzqXtkF+L3mo6vE1ZEThiL
	 /JcbcL/4cAsG3IRKMKK9njFUPPKYCz2amdTdITfWYfX0ri0I97rF51GHMZzgZl8JUb
	 04l6+s8vY7qJQ==
Date: Wed, 31 Jan 2024 12:59:49 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?iso-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 01/13] of: property: add port base loop
Message-ID: <20240131185949.GC1906672-robh@kernel.org>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <87ede1klgr.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ede1klgr.wl-kuninori.morimoto.gx@renesas.com>

On Mon, Jan 29, 2024 at 12:54:44AM +0000, Kuninori Morimoto wrote:
> We have endpoint base functions
> 	- of_graph_get_next_endpoint()
> 	- of_graph_get_endpoint_count()
> 	- for_each_endpoint_of_node()

I also noticed that your mail setup has an issue. You have some utf-8 
encoded email names, but the headers say it is ascii. git-send-email 
should do the right thing here, but maybe Exchange is messing things up.

Rob

