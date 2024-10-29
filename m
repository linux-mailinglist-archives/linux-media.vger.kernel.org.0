Return-Path: <linux-media+bounces-20525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5F69B4991
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 13:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22978283177
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 12:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4336206058;
	Tue, 29 Oct 2024 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n8A2mdfo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C349205E17;
	Tue, 29 Oct 2024 12:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730204521; cv=none; b=Yc77FyP83OWb8FiJ04qADoQc/jPAYV8yWnN5HJVQWEEanjexoID7S9IyRuLHc1pSQykOTb+F72hqLO0xJACzWmPkgLbrAP+nV3k6h7P3wtwIQRyzUhucMzWCcPspQlhTdd8PE9aPl4ZGRbw8O0WYRXvj3pNubhGzEdt5T+J8YEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730204521; c=relaxed/simple;
	bh=FiUmju4lALTrTZOpFrL6tdqXdS4qvOKK4I43ufdvACM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHGUSv9i8LOyTearzSrfuC7Dw2vb7ezwh5gTDVnh1A8K27xdaOnXRSX0U66qU+k1Zomw+i2IC3BJok3NW1TZSxmSKOo4kiwfgWQRly/VobUXUSKucuZR5roGnMN7gsxuUaNAZnvyrL4vyorSY7MxQ8LuZW7NJEEDUclWs8H3xgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n8A2mdfo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A693F4D4;
	Tue, 29 Oct 2024 13:21:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730204513;
	bh=FiUmju4lALTrTZOpFrL6tdqXdS4qvOKK4I43ufdvACM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n8A2mdfoLDxNI99Zgm40Cqyn/kiSJ74m7WV9PqxIfCXv+iqKRHsfVwiHKX4CUSfm6
	 hh6oxQ/ZeqOWwAyOi3Un0cLHNpPEaeZYHO40SBMLSezIxYRQsf+wi3Bv/0vsZnYSOs
	 M7F7pnpdB6mAW3zrYfF61VgKGr/AE0BcEjAJ94wA=
Date: Tue, 29 Oct 2024 14:21:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com, dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com, alain.volmat@foss.st.com,
	julien.vuillaumier@nxp.com, alice.yuan@nxp.com
Subject: Re: [PATCH 1/5] dt-bindings: media: i2c: Add bindings for OX05B1S
 sensor driver
Message-ID: <20241029122150.GN22600@pendragon.ideasonboard.com>
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-2-mirela.rabulea@nxp.com>
 <216a2728-ab62-4b76-aca5-8d911687dfbe@kernel.org>
 <20241029121039.GM22600@pendragon.ideasonboard.com>
 <eeaa92c0-fed6-408b-8471-47acf0ca394d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eeaa92c0-fed6-408b-8471-47acf0ca394d@kernel.org>

On Tue, Oct 29, 2024 at 01:15:46PM +0100, Krzysztof Kozlowski wrote:
> On 29/10/2024 13:10, Laurent Pinchart wrote:
> > On Tue, Oct 29, 2024 at 07:14:28AM +0100, Krzysztof Kozlowski wrote:
> >> On 28/10/2024 20:06, Mirela Rabulea wrote:
> >>> Add bindings for OX05B1S sensor driver
> >>>
> >>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> >>
> >> <form letter>
> >> Please use scripts/get_maintainers.pl to get a list of necessary people
> >> and lists to CC. It might happen, that command when run on an older
> >> kernel, gives you outdated entries. Therefore please be sure you base
> >> your patches on recent Linux kernel.
> >>
> >> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> >> people, so fix your workflow. Tools might also fail if you work on some
> >> ancient tree (don't, instead use mainline) or work on fork of kernel
> >> (don't, instead use mainline). Just use b4 and everything should be
> >> fine, although remember about `b4 prep --auto-to-cc` if you added new
> >> patches to the patchset.
> >>
> >> You missed at least devicetree list (maybe more), so this won't be
> >> tested by automated tooling. Performing review on untested code might be
> >> a waste of time.
> >>
> >> Please kindly resend and include all necessary To/Cc entries.
> >> </form letter>
> >>
> >> Binding also looks very different than all other devices, so re-write it
> >> starting from EXISTING GOOD bindings. Not some downstream stuff.
> > 
> > Krzysztof, please point to a good example when making this kind of
> > comment.
> 
> Anything recently added. Git log tells which files were recently added.

If the review comment is a copy&paste (given that you review lots of
bindings and constantly have to repeat the same things, that would make
sense), expanding it with that information for future reviews could help
patch authors. Thanks for considering it, it would be much appreciated.

-- 
Regards,

Laurent Pinchart

