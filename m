Return-Path: <linux-media+bounces-13845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2797910B73
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 18:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9201F2148F
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 16:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4BF1B14E4;
	Thu, 20 Jun 2024 16:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mT27RLPe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63741B14E0
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899831; cv=none; b=VczBaBVQZfThpyqf/DhyKqcG1BcMZgo8yuj9opqjC3kx/uGyDRif4Ki4qglQfFonyx6OYFAU7125fiUiYkym3gkeImc7nyj6p/ajGjrbNarnhznquUiPr9AxRhrItpFLu9iH7+9JDCU1v1UCrjY4mZvAvCmzlW1Kh5PZLTz/Xdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899831; c=relaxed/simple;
	bh=GdDLUmJ09vW+8Q6GtsFWoUI/wTN33NdxONR+m9HQMRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRRNOFXlqDRnWgPyomDvSgC+3TlEFEbEJWZ5LiIN1HzzzDXNJaVqdNlGTxA2M1S9JJ8kp/rn7RDY5YmqRgDGZI0RgbrAA92YC7GvRx29jg1EYaydcWU3yhTvjFwGM4iRyhlWcaD6cYTM4rtaTa0SstgK7o3niNrJWlZuNz+Disg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mT27RLPe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34AB2A4C;
	Thu, 20 Jun 2024 18:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718899803;
	bh=GdDLUmJ09vW+8Q6GtsFWoUI/wTN33NdxONR+m9HQMRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mT27RLPe3i1rOAOAT2l/em94/rIsliPc2Fo1xp6EFrx3YUfou7Vn2egP/ruFXWDC4
	 5NbUMSTRT+SfZbHISfus97qCNfO5lyef4kVdMhrVMtYWjUbmbK7RtRzdBV1SW5Su2p
	 1czdWfQoVuXz9YCDf1eiJOJPWTPg7nJqUTdINBBk=
Date: Thu, 20 Jun 2024 19:09:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/9] media: vimc improvements
Message-ID: <20240620160959.GG30640@pendragon.ideasonboard.com>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <bb5eb601-a7b6-4c77-afd8-bfabcd8c15d4@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bb5eb601-a7b6-4c77-afd8-bfabcd8c15d4@linuxfoundation.org>

On Thu, Jun 20, 2024 at 09:59:31AM -0600, Shuah Khan wrote:
> On 4/24/24 17:57, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series cleans up and improves the vimc driver, with the end
> > goal of converting it to the V4L2 subdev active state API. The goal of
> > this exercise is to make the API used by a virtual test driver, to
> > increase test coverage.
> > 
> > The series starts with 4 random cleanups, to avoid unnecessary
> > iterations (1/9), constify structures (2/9 and 3/9) and rename a
> > weirdly-named enum (4/9). Patch 5/9 then centralizes the subdev
> > internal_ops initialization to prepare for the switch to the active
> > state API. The remaining patches (6/9 to 9/9) convert the vimc entities
> > to the new API one by one.
> > 
> > The result has been tested using the libcamera unit tests, which make
> > extensive use of the vimc driver, as well as with v4l2-compliance. The
> > latter reports 4 errors, but they occur already with the latest stage
> > master branch.
> > 
> > Laurent Pinchart (9):
> >    media: vimc: Don't iterate over single pad
> >    media: vimc: Constify vimc_ent_type structures
> >    media: vimc: Constify the ent_config array
> >    media: vimc: scaler: Rename vic_sca_pad enum to vimc_scaler_pad
> >    media: vimc: Centralize subdev internal_ops initialization
> >    media: vimc: Initialize subdev active state
> >    media: vimc: sensor: Use subdev active state
> >    media: vimc: debayer: Use subdev active state
> >    media: vimc: scaler: Use subdev active state
> > 
> 
> Thank you. Applied the series to
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=vimc
> 
> I will send pull request to Mauro in a week.

Thank you Shuah. Much appreciated.

-- 
Regards,

Laurent Pinchart

