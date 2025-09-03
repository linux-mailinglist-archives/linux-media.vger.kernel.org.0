Return-Path: <linux-media+bounces-41718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D66B42589
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 17:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 194071894153
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA8A23D7E2;
	Wed,  3 Sep 2025 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FEPFqm3V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF94823D7CF
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756913332; cv=none; b=V84bbzFl2Bjgzm9WGKG0ccTbT1hE3pQdqbpC4gjOWcoXIxzmSXYTUHlmRE0Za0iJ4K457rtCmDKwYWZmvmPWBTKvwbVGZCL3yO12m3f2ZCC04y0iyC9sZHq9vNDreXoa3vDK47Inv/riwZ3L03kYNMxeqadQQnhivoE/mjZrLjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756913332; c=relaxed/simple;
	bh=xFmRLGVZ8fscEpekM66n3vhqIhw6/wM/gK3vfV0o/Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjXceh4FSLl7JNWew2ysccewaikF2dz9CnlXxjUyu10alIxbyDJM3bTuHKFTQjeInBe9xnDGy5M/bD1nvIkkju7GBTLZMUK4J4tsf9OOAZvwXJc9I/+ep8T3jx9066WVytojp23tiygXWv7nWSQai8IiEelv3lG1E8UiEHuitAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FEPFqm3V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 81AB88CB;
	Wed,  3 Sep 2025 17:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756913258;
	bh=xFmRLGVZ8fscEpekM66n3vhqIhw6/wM/gK3vfV0o/Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FEPFqm3ViWXvwL0Pv/VPDo5gwRQgXmjyB59dreGmwGtrFvyhJNXZFTn1vfXrdPGlI
	 1C24jpJMEy1MWjnHj0s/MzRz2/QxrK2+Z4msEjWurKNENUm8JldFxfLSRNKFBBAXmP
	 w7EhOFYbCo6/jhd6FQqx1AKudrgrkjJG4LveOlaw=
Date: Wed, 3 Sep 2025 17:28:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 21/66] media: v4l: uapi: Add a control for color
 pattern flipping effect
Message-ID: <20250903152826.GR3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-22-sakari.ailus@linux.intel.com>
 <b2yrfklofl6qpoekmy3r745gk4fvgdlpcdppatwwr3y34kn5zv@xusoi3rasdrc>
 <aLgXmb-ANkC5JNYD@kekkonen.localdomain>
 <mrrcx44sr3x4lodb7ffxxsxmcyjcwwqasel4jbpm7bt7zkjv7m@xtwlnpf7y53l>
 <aLhBt68vrp-bQuZJ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLhBt68vrp-bQuZJ@kekkonen.localdomain>

On Wed, Sep 03, 2025 at 04:25:11PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
> 
> On Wed, Sep 03, 2025 at 02:37:56PM +0200, Jacopo Mondi wrote:
> > I'm not sure how many non-Bayer CFA cameras we do support, indeed we
> > should account for them, but am I wrong assuming the majority, if not
> > all, are Bayer, so having a quick reference might be useful.
> 
> Well, one important reason for not having non-Bayer pattern cameras is that
> we effectively only support Bayer patterns. :-) There are lots of different
> patterns, including different filters, but most devices can be configured
> to generate Bayer output. Also the size of the pattern may be larger than
> 2x2.

Quad bayer comes to mind, as well as 4x4 patterns where two of the 2x2
regions are regular Bayer and the other two are Bayer filters with green
replaced by Ir. Quad bayer may need extra thoughts, as some sensors
support "rebayering" the pixels and output regular Bayer.

> > Anyway, not feeling strong about this, up to you.
> 
> Thanks!

-- 
Regards,

Laurent Pinchart

