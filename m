Return-Path: <linux-media+bounces-41813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72142B451FC
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D989188B593
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBFD27C872;
	Fri,  5 Sep 2025 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="of2mdF7k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1E12C9D
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 08:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757062009; cv=none; b=Vj7jWRGUwCCwFBs0LGuurJeqh4Q5ESlP/wBVFscDbL8iEcuShi+dC6nylqu/ev7ftiR+DqssvaBRu8LN/TOdXJYSM2PSp7IHfUU3M15fxr+wUPlHeQbRxyedX4EYPWJD8wf4fUg9eUMdbS/Zb4lADDTkqdBj2J2hzWGRIhU3PRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757062009; c=relaxed/simple;
	bh=2PkSYU9R6cSMgvz9XDJ/cQyaDu5Jb0hhqb2p2vXgvhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7Vm5FaWekxRZX3oyloH99vric5Vrh/dzcMuPUKfTAvlHzKcjYUI2aGxg/T45b2rsnj1gJL05haKPrQL4A55Qh+aXxWxrUavbD+NA3JLWpnCvEE4kzma5NVzg/monYoVa9pIavQD/euwlxCG82aZ5e9GlUSNtkji2V0O4tQlk/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=of2mdF7k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7FA1A82A;
	Fri,  5 Sep 2025 10:45:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757061933;
	bh=2PkSYU9R6cSMgvz9XDJ/cQyaDu5Jb0hhqb2p2vXgvhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=of2mdF7k8TcxQ9+InfkPVs5ZALZQbDln+rCuKMeLFBOziOYOXxgpOvfzH3cl4k973
	 T6aZKBK8M2tHRrNZGaxKVGj5UAI55K8NkBjEdVl/hGAVUWgFq/anLRpilDAlPd43Rt
	 mbd65qvD1QV68H5OCa8smhFhS+movZGf3lv1fkrI=
Date: Fri, 5 Sep 2025 10:46:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v2 10/72] media: i2c: hi556: Replace client->dev usage
Message-ID: <20250905084622.GA6549@pendragon.ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
 <20250812214620.30425-11-laurent.pinchart@ideasonboard.com>
 <aLqifDc9FqUh_oiC@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLqifDc9FqUh_oiC@kekkonen.localdomain>

On Fri, Sep 05, 2025 at 11:42:36AM +0300, Sakari Ailus wrote:
> On Wed, Aug 13, 2025 at 12:45:18AM +0300, Laurent Pinchart wrote:
> > The driver needs to access the struct device in many places, and
> > retrieves it from the i2c_client itself retrieved with
> > v4l2_get_subdevdata(). Store it as a pointer in struct hi556 and access
> > it from there instead, to simplify the driver.
> > 
> > While at it, fix a mistake in the sort order of include statements.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Avoiding v4l2_get_subdevdata is a big plus. But instead of adding the dev
> field to every driver's context struct, could you use the dev field that
> exists in struct v4l2_subdev already?

I'd rather not. I think it's much clearer to have a dev pointer in the
driver structure, initialized right after allocation. The structure is
available everywhere, this makes lines shorter, and functions called
from probe won't need to wonder if the subdev has been initialized
already or not, and get the dev pointer from somewhere else in the
latter case.

> Should we repeat the pattern in this patch, the context structs of sensor
> (and other drivers) would be rather large.

-- 
Regards,

Laurent Pinchart

