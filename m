Return-Path: <linux-media+bounces-45589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E867C0B6D7
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 00:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E13193B7E9C
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 23:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864213002CE;
	Sun, 26 Oct 2025 23:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9/FvevJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A52FFF98
	for <linux-media@vger.kernel.org>; Sun, 26 Oct 2025 23:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761520290; cv=none; b=MEqdycmUkJri8OYZhQAGfHRsLyAFOWCH7bDI3dprpDPg2m2frVuKnOBfiF7/7hqQi5YwqcNCPK2tNakZ+gLGXDZfedQnHsX3g+CYoIZN6VGWLhq24jOjALMRRE7+4sqxFVEghd117OFJl8tvGimez9Dmk1aKUDU9W8iIOnln8Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761520290; c=relaxed/simple;
	bh=PQiu9cLeLdsiFpP6SIwyX5ZuYcqXvNTx0kq0NeQta1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbFGTm7bN+culylZBjf4IINEwfRV6BrNVmTaC+fh2mCKUFcCW+IqAIIMGcKh2hfBRqKG9uMWrwPjr8dfJopZkNIH6/Q5/jArkE75OZb9KrvKHk4+oHE5d5PRnXgh+mQDm29dQVq3ZVWBI21Jl0jp78EoyBOppvEwsbG6z1KjGqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o9/FvevJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF58C4CEE7;
	Sun, 26 Oct 2025 23:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761520289;
	bh=PQiu9cLeLdsiFpP6SIwyX5ZuYcqXvNTx0kq0NeQta1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9/FvevJoclOTUoTMqCbCi109iMUyUQN0FwGZjuBdmQcEi0Dc3INBM/YW2Oy0jtOD
	 jAOHE6orIDuJGdtB11YCtGiuUndrmmfx7fzeZ/bMqxqWufYCKSdusxWjnq3iEZZjRg
	 F0It6pV85WWWAOkWqQEDJbKqMHhZ14pOeewZfmwK/kbcalSRaD+sH0a35iqDDWf5t3
	 fLTStE56YF4/qc5UDITkp7nt7H2MvQ2JMvyhlE0OUA/NmsgP2yIJPmiCb/QKvPFa4f
	 n9goj45yu0ejk6UFecM7HfN/+IY13WpVp8T5jLNAyYLi563g2GryZloRdi5to/2ZOg
	 n57q2tSFStH5A==
Received: by venus (Postfix, from userid 1000)
	id 9B4141811F4; Mon, 27 Oct 2025 00:11:24 +0100 (CET)
Date: Mon, 27 Oct 2025 00:11:24 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] media: ov02c10: fix orientation on Thinkpad T14s
 Gen6 (Snapdragon)
Message-ID: <7ppmabganml4pwpwphvufwazek7b65dz3wchmln56luxe2duhn@adqkhld2klrv>
References: <20250820-ov02c10-fix-v1-0-3fcca2cfbfbf@kernel.org>
 <qn6vtfm42jqtheqbd4vlkrdekea5ntk2hvd7bl4jfxf4chjood@7wrvzmtnfiv7>
 <aP0wP3adzgPcIcXY@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP0wP3adzgPcIcXY@kekkonen.localdomain>

Hi,

On Sat, Oct 25, 2025 at 11:17:03PM +0300, Sakari Ailus wrote:
> On Sat, Oct 25, 2025 at 12:34:18AM +0200, Sebastian Reichel wrote:
> > On Wed, Aug 20, 2025 at 02:13:18AM +0200, Sebastian Reichel wrote:
> > > When testing the camera patches for Snapdragon X1E I noticed the
> > > image is upside-down on my T14s Gen6. After some investigation
> > > it looks like issues with the sensor driver have recently been
> > > reported, but not yet been fixed. It seems sensible to do this
> > > ASAP (while the driver is not yet used much) to avoid potential
> > > regressions when changing the VFLIP default.
> > 
> > Can you take a look / merge this series? It has been over two months
> > already and I hoped this would be handled quite quickly considering
> > this is a not very complicated simple fix.
> 
> Thanks for the ping. I thought this was already merged but apparently not.
> Either way, it's in my tree now.

Thanks!

Greetings,

-- Sebastian

