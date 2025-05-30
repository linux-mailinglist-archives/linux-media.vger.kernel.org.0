Return-Path: <linux-media+bounces-33658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DD9AC8DB7
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 14:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C0DD1BC608F
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 12:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A51322B8A1;
	Fri, 30 May 2025 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JagxPOhc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10583B67F;
	Fri, 30 May 2025 12:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748608272; cv=none; b=tAW/qL6/fp1czF5MPMdeXnUEZ7sisrdsweO1PWvLTNdhuosz3TheZs0QfJZmkp4j7mhzplbK0z0eq/iYiWhuGghW/DUnSfk7gUZ2NzKO/svqrVBqT+uwQMeC6CEuxpNF6Yxc6CpQcdk4pzKFFKl9LMpg3bORcN3m2uMPZeRb8uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748608272; c=relaxed/simple;
	bh=otoqR1keMXX+0tP92oytsPUKyZDib0KsAROP+KYbjIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SIT0fc4X8Scp7FlqF2/TnG5v3EBPT33FjLrKAkyTvqf70Xs3wlmsFX2/1FL7CiLRpZDwQVsLc1WwDW5pnjqVzfB7/NHgxnzD/JJXA0lhMDVpCQZ9mRptnI0n6p2WziU2xm03WUTH6n1S7rdrtDcBNc/43mlA77CtdHbpYGcBPfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JagxPOhc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21A8182E;
	Fri, 30 May 2025 14:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748608241;
	bh=otoqR1keMXX+0tP92oytsPUKyZDib0KsAROP+KYbjIY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=JagxPOhc6bcTwMp4hbx1uO2puAJbFPygd//71G/On/CIN8Cpf+RFf4dtBrZmAT+PI
	 itc0Jgs6j197LzWCDFtdFMsUZhNAhiWlrA0qSkH+S4M//NvAKd3OFEY63yjx+c9RLx
	 HrW/B52tAAIR/oMSVNyDxAnTFK434CxHgFmEstEs=
Message-ID: <313e359f-460f-4c3e-b4bd-f3281673135d@ideasonboard.com>
Date: Fri, 30 May 2025 15:31:05 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] media: rcar-csi2: Add D-PHY support for V4H
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/05/2025 20:47, Niklas Söderlund wrote:
> Hello,
> 
> This series adds support for CSI-2 D-PHY reception on R-Car Gen4 V4H
> devices. Previously only C-PHY reception due to poor documentation and
> no hardware to test D-PHY on.
> 
> Later revisions of the datasheet (Rev.1.21) describes the start-up
> procedure in some detail, and we now have hardware to test on! The
> documentation however only sparsely documents the registers involved and
> instead mostly document magic values and an order to write them to
> register offsets without much documentation.
> 
> This series tries to in the extend possible to at least used named
> register and use formulas and lookup tables to make some sens of the
> magic values. Still most of them comes of a table of magic values in the
> datasheet.
> 
> Patch 1/4 clears up a unfortunate mix of the name mbps (mega bits per
> second) used in the D-PHY context and msps (mega symbols per second)
> used in the C-PHY context.
> 
> Patch 2/4 and 3/4 prepares for adding D-PHY support by cleaning up
> register names and an updated common startup procedure for V4H which
> have been revised in later versions of the datasheet since the initial
> C-PHY V4H support was added.
> 
> Finally patch 4/4 adds D-PHY support.
> 
> The work is to great extent at many different link speed and number of
> lanes. In 2-lane mode using an IMX219 and in 4-lane mode using IMX462
> sensors.
> 
> See individual patches for change log.
> 
> Niklas Söderlund (4):
>   media: rcar-csi2: Clarify usage of mbps and msps
>   media: rcar-csi2: Rework macros to access AFE lanes
>   media: rcar-csi2: Update start procedure for V4H
>   media: rcar-csi2: Add D-PHY support for V4H
> 
>  drivers/media/platform/renesas/rcar-csi2.c | 447 ++++++++++++++++++---
>  1 file changed, 402 insertions(+), 45 deletions(-)
> 

On my V4H + GMSL multistream branch (i.e. C-PHY):

Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

 Tomi


