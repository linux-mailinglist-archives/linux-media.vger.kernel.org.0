Return-Path: <linux-media+bounces-32844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5AEABC814
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 21:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D0DB3A9B71
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 19:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED182135BB;
	Mon, 19 May 2025 19:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ImvIuAOK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C00A1E8338
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 19:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747684558; cv=none; b=lliljvRhWWHSw9SwGZI+DkX5NBJdh4K8e35nOYII8eevPDQH527Rb9TzpUpHZP0gtklE+QMks4fBeM1nfwkXfT4zqBt5q/+3u7Zs8e9wvG82//all6LG5g/jfqqatzeORyUDPYTfVp+Dtsfr3xseoWrBbFKHw4e+xsEgqftoPGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747684558; c=relaxed/simple;
	bh=ev3YpKsdaVIIRl+15fa2o51k1b6b3WaehTLR6h/o8AU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ChxgHGDmQmTkLgT1bWKFRzfDcTGDJB55ynarZQd+P5khPeATVb8RUQeZjxNgp0tOCxfrrdMtHHY6Gm2FF91DSh5hi6Wrcqhb2HMss20bzDApymLsuA2CWC9nGzZtfIU1ew+fMOFhVmNaZ71OrOlX399zrChFWXqLZi1gNECOSks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ImvIuAOK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-140-61-nat.elisa-mobile.fi [85.76.140.61])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E46AAD21;
	Mon, 19 May 2025 21:55:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747684534;
	bh=ev3YpKsdaVIIRl+15fa2o51k1b6b3WaehTLR6h/o8AU=;
	h=Date:From:To:Cc:Subject:From;
	b=ImvIuAOK9sn7VFee2ib7rIrhkJAXdw5XfPUCdaLOasrbWrfo9Fc50v12wo7PrOgiu
	 hCvJ0RUNh8LwiYiehGnslxkpur2B3hly6U2hw9PkrEt7B2tVY6FQjpkOrAAnltnYr7
	 RHIYaRTZyQM+RhJeQYezOMOhTCFDmox7TTVCdX40=
Date: Mon, 19 May 2025 21:55:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: State of the starfive-camss staging driver
Message-ID: <20250519195539.GA4641@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Jack, Changhuang,

The starfive-camss staging driver (drivers/staging/media/starfive/camss)
has been merged in staging due to missing support for the ISP statistics
and parameters. Changhuang has posted patches to support those, but without
documentation or an open-source implementation of ISP control algorithms
in userspace. The review concluded with a statement that StarFive
doesn't plan to provide the required documentation or userspace
algorithms for the time being, and the series didn't get merged as a
result.

The media drivers staging area is meant to facilitate collaboration
between parties to improve drivers until they can be moved to
drivers/media/. If no such work can be expected in a reasonably close
future, we will have to drop the driver from the Linux kernel.

Could you please let us know what your plans are for development of the
starfive-camss driver in the mainline kernel ?

-- 
Regards,

Laurent Pinchart

