Return-Path: <linux-media+bounces-40572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB90CB2F883
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91F1C60401A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E852E311C29;
	Thu, 21 Aug 2025 12:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vD47oEj6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616B311C12
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 12:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780134; cv=none; b=ffkOTBKXzoBDHmNM+s09r3YEX8xPJRpCQCxZjCwQ853PdmFnJrgKB7lC/UvgASKM3a/v8bHTBoGVtnjaP+rQqUbmVRsnLdxc+rHj3V8BfsvxxUH3sWx1Rn/oRMWlUOal1Wjp8e1CyQ+BpZOwp2iYeKsocNRwJrI0Pu/W8NpurII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780134; c=relaxed/simple;
	bh=NWGLoJYy2SHirvTpYESs2GWCBpV+Y5iYmGsOGUpauHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jm85gzz/E00IwADYMmy5eR7IAzLx4Gc1HbHLo1jSPEt7jsmwc9tTbqhgBE0wIC2/+3P4sCEytdmk8rdqQ0/1YG6nora8RYhwzLZA5ZDCmHzNEUR8WlhoqKCsDPWrIl/W7/1BwlFbzpLcMLgAx5Iu3qdAcuBBuPYta1VbH0ueqlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vD47oEj6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 498A0EFF;
	Thu, 21 Aug 2025 14:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755780072;
	bh=NWGLoJYy2SHirvTpYESs2GWCBpV+Y5iYmGsOGUpauHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vD47oEj6lyT3PciTHc26QElU3cq8tg/y79J13cLsWU8dc2+CffBCNCisypQbyX2Pl
	 SjQwijBEG4V21t/C66N/r0FriiEn6lufejBocwOcYdZxFmH7VG6j7pyCprnFGCsfnS
	 rP3Rc2cai4RoVuiOQLn2m2o4LxSbHQjuyHOUyH1s=
Date: Thu, 21 Aug 2025 15:41:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 0/3] Drop control handler argument support for
 v4l2_get_link_freq()
Message-ID: <20250821124148.GE8865@pendragon.ideasonboard.com>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821121207.552993-1-sakari.ailus@linux.intel.com>

On Thu, Aug 21, 2025 at 03:12:04PM +0300, Sakari Ailus wrote:
> Hi folks,
> 
> This set removes the workaround from v4l2_get_link_freq() that allowed
> calling it on a control handler. The Amlogic c3-mipi-csi2 driver is
> converted in the process as well.
> 
> As a result there's also no definition of v4l2_get_link_freq() without
> CONFIG_MEDIA_CONTROLLER but that should be fine now. The Amlogic patch is
> untested.

Could you please cherry-pick
https://lore.kernel.org/linux-media/20250821000944.27849-2-laurent.pinchart@ideasonboard.com/
and include it in this series ?

> since v2:
> 
> - Improve documentation for v4l2_get_link_freq(), aligning it to the
>   removal of control handler argument support.
> 
> - Add a patch to mention the primary source of the link frequency is the
>   get_mbus_config pad operation.
> 
> since v1:
> 
> - Remove redundant src_pad argument from c3_mipi_csi_start_stream().
> 
> Sakari Ailus (3):
>   media: amlogic: c3-mipi-csi2: Call v4l2_get_link_freq() on source pad
>   media: v4l2-common: Drop the workaround from v4l2_get_link_freq()
>   media: v4l2-common: Update v4l2_get_link_freq() documentation
> 
>  .../amlogic/c3/mipi-csi2/c3-mipi-csi2.c       |  7 +++---
>  drivers/media/v4l2-core/v4l2-common.c         | 17 ++++++-------
>  include/media/v4l2-common.h                   | 25 ++++++-------------
>  3 files changed, 19 insertions(+), 30 deletions(-)

-- 
Regards,

Laurent Pinchart

