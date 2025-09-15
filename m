Return-Path: <linux-media+bounces-42527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA2B57352
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 10:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66C081746F3
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 08:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D532EE5FE;
	Mon, 15 Sep 2025 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DYg00JBk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3422D5436
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757925897; cv=none; b=fGdTQAgcqgZcNNof/JyL1z8v+EWt+l/B2q5kEi2OL5Q024RxbcS9LrWTUUDusxWUC68x0JtQyfH4BMSsPKpP3H8NJJzyZAlZefsWxZd7hBu7cfyiw5EUlfEz9pNfMRup2o9Klrwd1Mei1eEoPFooZoW5wDTbk12lr6VS0WA2aVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757925897; c=relaxed/simple;
	bh=8rqrdoyxAXLYr8A9yNAgRI66woYRXLijwOj9utm7jhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rw6aSFDfrzLZiZ/6UODKIkov4quBj3psIb0jMIbVg3ShM+K2BoZIBYRHdwaUIdmqq4+uWoXttaO05ibMUfjPrzadwjqVL/TzvQVQUYmJvx8Pq0eIN0NpBBX6F5cVKDyVVKeAIr/grB24igJhs9Toq77yE+fBojbulz9RTccV0Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DYg00JBk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 21E7F1744;
	Mon, 15 Sep 2025 10:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757925816;
	bh=8rqrdoyxAXLYr8A9yNAgRI66woYRXLijwOj9utm7jhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYg00JBkRm8Hm1yO8AobdAWP9ZdlQCDzgS/obKyoGq+QZ6Svexb1iPkYVNpcotmRI
	 wm6gr16M+d8d1Ht7TQY/idbHm56QH91U8dYg+wBUhZN6neIMJrcVMJTXabcz5LaPMT
	 koD4i+TeuHfVPknsZ8nbJaIk8LThe6PhkbPPFk0I=
Date: Mon, 15 Sep 2025 11:44:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jai Luthra <jai.luthra@linux.dev>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [GIT PULL FOR v6.18] TI and Cadence CSI2RX drivers changes
Message-ID: <20250915084427.GD22385@pendragon.ideasonboard.com>
References: <4wklgso7mjxss5nzrwtcwae6fm22snmw7zdx4lmdxs75tmklip@3w55xhfzkasw>
 <9bc39cae-ea86-4ef7-a97c-66469b082375@kernel.org>
 <v2xtw7soyiailistxcr24xj5uxzhlhljtf2hqdgarnzhnmms5d@rxojdydr7jqo>
 <6aa144e0-5ea0-4669-8398-dc6a35674b63@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6aa144e0-5ea0-4669-8398-dc6a35674b63@kernel.org>

On Mon, Sep 15, 2025 at 10:24:34AM +0200, Hans Verkuil wrote:
> On 12/09/2025 13:21, Jai Luthra wrote:
> > On Fri, Sep 12, 2025 at 12:17:17PM +0200, Hans Verkuil wrote:
> >> On 12/09/2025 11:55, Jai Luthra wrote:
> >>> Hi Hans, Mauro,
> >>>
> >>> The following changes since commit ecba852dc9f4993f4f894ea1f352564560e19a3e:
> >>>
> >>>   media: redrat3: use int type to store negative error codes (2025-09-11 08:46:10 +0200)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   https://gitlab.freedesktop.org/linux-media/users/jluthra.git tags/for-6.18-ti-j721e-csi2rx-signed
> >>>
> >>> for you to fetch changes up to c694e74c651e79838e817a8c6644dc72cf80540d:
> >>>
> >>>   media: ti: j721e-csi2rx: Support system suspend using pm_notifier (2025-09-12 14:37:56 +0530)
> >>>
> >>> ----------------------------------------------------------------
> >>> TI and Cadence CSI2RX driver changes:
> >>>
> >>> - Multistream support for Cadence and TI CSI2RX
> >>> - Runtime PM support for Cadence and TI CSI2RX
> >>> - System suspend and resume support for TI CSI2RX
> >>> - Misc cleanups
> >>
> >> This should go through Sakari most likely, possibly Laurent, seeing that this is CSI
> >> related. Several patches do not even have a Reviewed-by from Sakari or Laurent.
> >>
> >> I can't take this, I'm afraid.
> >>
> >> I'm not sure why we get a PR from you, was there some misunderstanding?
> > 
> > Apologies. I had a look at other "GIT PULL" messages on linux-media and 
> > inferred that any driver maintainer can send a pull request for media tree.
> 
> Ah, no. It's media maintainers that do that. For small subsystems you would post
> patches and the subsystem maintainer will (when ready) merge them and send a PR
> to Linus.
> 
> For large subsystems like media you have multiple media maintainers, each responsible
> for a part of the subsystem. They will review and prep a PR for the media maintainers
> (me and Mauro) to pick up. The media subsystem is far too big for a single maintainer.
> 
> Hopefully once we get the multi-committer up and running (pending doc changes) we can
> do away with most of the PRs.

Is there an objection against pull requests from driver maintainers ?
Assuming all the other rules and requirements are met (passing CI,
having the expected R-b tags, ...), is there a reason why I would need
to collect a series posted by Jai and then send a pull request, instead
of having Jai send the pull request directly ?

> > I looked at 
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html but 
> > that was not very informative.
> > 
> > But yes, happy to wait for more reviews from Sakari and Laurent (or Tomi given 
> > this is about streams support).
> > 
> > Could the process and who-owns-what sub-subsystem be better documented in 
> > docs.kernel.org or linuxtv.org? I am aware of the proposed multi-committer 
> > model, but until that is finalized even the current process is hard to 
> > understand for a newbie :-)
> 
> It's here (link below), but I see that it is out-of-date: it's missing Nicolas Dufresne for
> codecs and Bryan O'Donoghue for Qualcomm drivers.
> 
> https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/maintainer-entry-profile.html#media-maintainers
> 
> In any case, your PR came in too late. After rc6 is released we only merge fixes as a
> general rule. It's good to keep that in mind for the next kernel cycle.
> 
> If your PR contains fixes that you believe are important for v6.18, then discuss that
> with Sakari and he can post a PR with those fixes.
> 
> >>> ----------------------------------------------------------------
> >>> Changhuang Liang (1):
> >>>       media: cadence: csi2rx: Support runtime PM
> >>>
> >>> Jai Luthra (9):
> >>>       dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
> >>>       media: ti: j721e-csi2rx: separate out device and context
> >>>       media: ti: j721e-csi2rx: add a subdev for the core device
> >>>       media: ti: j721e-csi2rx: add support for processing virtual channels
> >>>       media: cadence: csi2rx: add multistream support
> >>>       media: ti: j721e-csi2rx: add multistream support
> >>>       media: ti: j721e-csi2rx: Submit all available buffers
> >>>       media: ti: j721e-csi2rx: Support runtime suspend
> >>>       media: ti: j721e-csi2rx: Support system suspend using pm_notifier
> >>>
> >>> Pratyush Yadav (4):
> >>>       media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
> >>>       media: ti: j721e-csi2rx: allocate DMA channel based on context index
> >>>       media: ti: j721e-csi2rx: get number of contexts from device tree
> >>>       media: cadence: csi2rx: add get_frame_desc wrapper
> >>>
> >>> Rishikesh Donadkar (2):
> >>>       media: ti: j721e-csi2rx: Remove word size alignment on frame width
> >>>       media: ti: j721e-csi2rx: Change the drain architecture for multistream
> >>>
> >>>  Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml |   39 ++++++-
> >>>  drivers/media/platform/cadence/Kconfig                            |    1 +
> >>>  drivers/media/platform/cadence/cdns-csi2rx.c                      |  491 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------
> >>>  drivers/media/platform/ti/Kconfig                                 |    1 +
> >>>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c             | 1167 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------
> >>>  5 files changed, 1300 insertions(+), 399 deletions(-)

-- 
Regards,

Laurent Pinchart

