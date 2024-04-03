Return-Path: <linux-media+bounces-8525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE84896EF7
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 14:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CBB9284883
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 12:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BABE5645B;
	Wed,  3 Apr 2024 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pnct/9nk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11E54F602
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712147941; cv=none; b=KKOf06L7G/blVAiC6HG76OFOtyEhmIVtYadmT9z0flHtCJvwa4F6xrtZW+jCOeONBfCOCNbqBYxD4awszkN+CBefsB02qfnp8tZ+0L9Ut0d10uhu2tqtUPvw9GYybW7igaNzt3F2ERf9OmQ5jnKQSgrpL2r5BhlWVrf5OBTvP/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712147941; c=relaxed/simple;
	bh=p9+6WTOpRy4XKbonj36XvUQVC5ww+AxFs3YfT0bhdHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLsfNXWIH0+MXwvmFvvy9SpPlDXJD3kFPDDY7Y14QB0AcotxJAFv78Csc+X8GAhLDsJu2lUTiWpNNhRzfmJN2/dNq3+CyRHsTiG/y1XNOwS/lcWQdgtXFs+wVi/ko0lJ9FsJQcQoHU0dVjJybGcWa8Q5ykDRvwNlee8jrf99uSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pnct/9nk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712147940; x=1743683940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p9+6WTOpRy4XKbonj36XvUQVC5ww+AxFs3YfT0bhdHs=;
  b=Pnct/9nkbBTP0E4GntThjGwuB4bikh0ypoTcKI1oRwYsWMNWs9FsXaJW
   +aNMLg5CT9vTJPJK2M21fNMlj89R1b9mPj7fq9QOCstVojbUeBGpBf9Q2
   srropI/maiNd4Q4kx2zYYqNZygzTIrKmPq/WupMdq6TRV/bFFH4sTnwuu
   4p8u7ldBmhfiCJfNxvY8y4sHsuGwo1VV2gKaLldqqumBJFo+Et/RbA96Z
   nQ02xh4qyawy5iwrulDCmKToiU4wdJeMIVWOzKjrt68lNbznAAGKX1ZQr
   e30RDixgKpsdn2JOFRuVYOvYT6oDBovq5dO8IXlgbSv626XPyIksxzEKN
   A==;
X-CSE-ConnectionGUID: msyn/CWBS9aBj6FdDczjyQ==
X-CSE-MsgGUID: 2MUike+MShOrvDOk69K1hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7562981"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7562981"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 05:38:59 -0700
X-CSE-ConnectionGUID: zh5VKzMLRJiJ+oghFhGcMQ==
X-CSE-MsgGUID: kBi9RoJ3Tlqk9KykFLQzVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18861805"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 05:38:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9287411F811;
	Wed,  3 Apr 2024 15:38:54 +0300 (EEST)
Date: Wed, 3 Apr 2024 12:38:54 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Julien Massot <julien.massot@collabora.com>, mchehab@kernel.org,
	sylvain.petinot@foss.st.com, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 3/4] media: i2c: st-vgxy61: Switch to
 {enable,disable}_streams
Message-ID: <Zg1N3mURA-hI3gzR@kekkonen.localdomain>
References: <20240315085158.1213159-1-julien.massot@collabora.com>
 <20240315085158.1213159-4-julien.massot@collabora.com>
 <b659efe5-6dbc-4145-b9e8-2da902ab51b3@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b659efe5-6dbc-4145-b9e8-2da902ab51b3@foss.st.com>

On Wed, Apr 03, 2024 at 02:26:32PM +0200, Benjamin Mugnier wrote:
> > @@ -1188,20 +1188,35 @@ static int vgxy61_stream_disable(struct vgxy61_dev *sensor)
> >  	return ret;
> >  }
> >  
> > -static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
> > +static int vgxy61_enable_streams(struct v4l2_subdev *sd,
> > +				 struct v4l2_subdev_state *state, u32 pad,
> > +				 u64 streams_mask)
> >  {
> 
> Should we also check that 'pad == 0' ? Or is it always so ?

If the number of pads in the sub-device is 1, then the pad is always 0
here: this is checked in the framework.

-- 
Sakari Ailus

