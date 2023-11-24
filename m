Return-Path: <linux-media+bounces-984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CAB7F7639
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 15:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25F9D281B6E
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 14:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D086C2D044;
	Fri, 24 Nov 2023 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yrr1Bimi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0101990
	for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 06:18:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6327F2E7;
	Fri, 24 Nov 2023 15:17:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700835476;
	bh=cH6hQ38rzWHK5Tx77hbQ/OdrWbXxGqrkFq/hZ6xOdBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yrr1BimigSC8Vg0IdIB4qEf137I29BrgGVcFqQRoIdYpc3P8WLabu6sJP3Vzdj5zu
	 NQQmnT/GM/1nL4fA3hxMaMK2ZMtcC/eJtZbCNPeIaypObESRsCG0Do9Om3IJFNBmRm
	 LOB+5csLGQAQ8enbyfEfbihVnNlrSoZmLni8Zvko=
Date: Fri, 24 Nov 2023 16:18:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <20231124141835.GA25272@pendragon.ideasonboard.com>
References: <20231123224658.6959-1-laurent.pinchart@ideasonboard.com>
 <20231123224658.6959-2-laurent.pinchart@ideasonboard.com>
 <3886bc9f-62ff-4f70-a654-34ecf0f5fea4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3886bc9f-62ff-4f70-a654-34ecf0f5fea4@kernel.org>

Hi Krzysztof,

On Fri, Nov 24, 2023 at 09:20:58AM +0100, Krzysztof Kozlowski wrote:
> On 23/11/2023 23:46, Laurent Pinchart wrote:
> > From: Paul Elder <paul.elder@ideasonboard.com>
> > 
> > The THP7312 is an external ISP from THine. Add DT bindings for it.
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
> 
> Please kindly resend and include all necessary To/Cc entries.

The DT bindings have been fully reviewed and acked in the previous
versions, and haven't changed in v7. Do you still want to be CC'ed in
such cases ?

-- 
Regards,

Laurent Pinchart

