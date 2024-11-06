Return-Path: <linux-media+bounces-20992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC829BE2FE
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 10:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 240281F24FD3
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 09:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2561DB52D;
	Wed,  6 Nov 2024 09:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhP5clCP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF71D54EE;
	Wed,  6 Nov 2024 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886384; cv=none; b=LAok+gNJtk1K6e84uPGCfrs5n9ePKeLz+9HWDOo/E7ubvdgrnfzMVzPzQ419tZ/MwlGBUjiSpLAFfyy6+PmOtDaQ3Spo+V+iluuW+iXaXG4KAjUNlQktNHbkfZekdlLZKgxnZjVjGhUm2ZoW1ctQbZT31FDZfS2eYZZwaT46Xtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886384; c=relaxed/simple;
	bh=FCzq19ZQriPVyzh0sTZo3Dh2ni0fniF4xDpwOt2piiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIgbaM1X+3xWGLMGKZ44aL9aQ1uFhl+Pw8+gXzIm+pSETsv7YTNAt0fzIiampwqFy5iEh/qFbfQLE3kSLmPr78+gdAsSifZ8mz9DiKTXwGeZu6I1af+ae1cWpj1rGVH+3nyd9KYaxblNGZGujj9scdB9Qo9F/J4GNNMBq7oqI10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhP5clCP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730886383; x=1762422383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FCzq19ZQriPVyzh0sTZo3Dh2ni0fniF4xDpwOt2piiA=;
  b=hhP5clCPYFqwEub2gwO2inkLyG49b1ocQXqt2V2DKLK7UlmKVo/xAfZP
   jJSRQy3DfyQjwGce+OcZR+7SJMcggsD43vbPlGT5yMQZK2QSOHH3WvgGf
   CTWnc+02mFK7jNXjh1xR+0QHvqHWlzmymzSffUjNb5KiyQl0sUVwhLSdF
   spmnjqNH9FsngJlTEwnsjMtfsPBHCN3z3LYjXB0a0MFOP/kRs8BxUR+0h
   B3j9s62tJhikmndZkoou4Cx+fLM088Pm6fLpoVGpFssYxhY5ELIQMc5Y1
   Y9+IgyUQql2ujhiBYq59UacoWdg7HJNrtOa2Hv0SpnV7MxaYLcI3dwJG6
   g==;
X-CSE-ConnectionGUID: IsVyg6vXSzq0IIn/JbLsaA==
X-CSE-MsgGUID: tnlm40tQSgClbGagK225kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30788783"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="30788783"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 01:46:21 -0800
X-CSE-ConnectionGUID: k2/7LShbSDaGOr4szaPsBw==
X-CSE-MsgGUID: pcvQjkT9RbWo30mUfZPUFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84847233"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 01:46:07 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2169A11F9C3;
	Wed,  6 Nov 2024 11:46:05 +0200 (EET)
Date: Wed, 6 Nov 2024 09:46:05 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
	geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com,
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
Message-ID: <Zys63S2xy-wdwQ8P@kekkonen.localdomain>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
 <20241105-secret-seriema-of-anger-7acfdf@houat>
 <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
 <20241105-succinct-pygmy-dingo-4db79c@houat>
 <7C2A2BDC-07E8-4ED7-B65B-BD7E4E5DC53F@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7C2A2BDC-07E8-4ED7-B65B-BD7E4E5DC53F@linaro.org>

Hi Dmitry, others,

On Wed, Nov 06, 2024 at 09:20:12AM +0000, Dmitry Baryshkov wrote:
> On 5 November 2024 17:39:40 GMT, Maxime Ripard <mripard@kernel.org> wrote:
> >On Tue, Nov 05, 2024 at 05:33:21PM +0000, Dmitry Baryshkov wrote:
> >> On 5 November 2024 16:13:26 GMT, Maxime Ripard <mripard@kernel.org> wrote:
> >> >On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
> >> >> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
> >> >> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> >> >> > i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >> >> > the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> >> >> > function.  IT6263 product link can be found at [1].
> >> >> > 
> >> >> > Patch 1 is a preparation patch to allow display mode of an existing
> >> >> > panel to pass the added mode validation logic in patch 3.
> >> >> > 
> >> >> > [...]
> >> >> 
> >> >> Applied to drm-misc-next, thanks!
> >> >> 
> >> >> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
> >> >>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc
> >> >
> >> >Where's the immutable branch Laurent asked for?
> >> 
> >> The patch set has been picked up after getting an Ack from Sakari,
> >> before Laurent's email. I am sorry if I rushed it in.
> >
> >I mean, this was less than a day after you've asked that question
> >yourself. Waiting less than a day for a mail to be answered seems a bit
> >short, especially when there's no rush to merge these patches in the
> >first place.
> 
> Point noted. I should have been more patient. As a lame excuse I could point out that the patch has been up for review / comments for quite a while, etc, etc, but this is really lame. 

The patch had been around for a few weeks already, I don't see this having
been rushed in. It's a bit a matter of taste whether an immutable branch is
necessary here, I thought it wouldn't be. I can also ask for one in the
future in cases where there's even slightly more than an improbable
possibility of a merge conflict going forward: it won't hurt in any case to
have one.

-- 
Kind regards,

Sakari Ailus

