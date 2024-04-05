Return-Path: <linux-media+bounces-8689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A889956E
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 08:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E6B7B228F8
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 06:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9C11C696;
	Fri,  5 Apr 2024 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mqq+N14q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D142917BB7
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712298907; cv=none; b=Qlxq0XGBqZhh4VRPv850FSsP2Zsbh/m75FsM6deYtW0BvH3UDqzxG2mqq7bO/ExBWNicf+uCf+aL8w256vgjco1lXupRf1wbjfEwgRbnnGkbUAUPd5lrDXGE/4LxpIP6nQDjI13T4AOWdLPC8on8iD0BeCx7V65vauC6jPCdBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712298907; c=relaxed/simple;
	bh=+tmzR6Z//P0iCAwOOymnHZIJ/LjmQRzW7mWItuVqys4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZ+PDjTxN656DjEjlgIua2EUS1vNKatAzi1IQy90t3H/jh0cgr5P+nfNmboCVP+ezhVfuJ8PCweN9+fQmvxLp6eCf1KhYjmZI2EMjpmVk/68OKgX75DDnSM60N2goulc5HHPFZWoXsEXLRDc0F6IFx/xThtf1AEGWFVsjP4dGjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mqq+N14q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712298906; x=1743834906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+tmzR6Z//P0iCAwOOymnHZIJ/LjmQRzW7mWItuVqys4=;
  b=Mqq+N14qROTrEdOxJcCA26aeTBV29j2GnTxC85OP9QiPh8ddLaDKNBwN
   N6uHy+/SbqTDk4yGEfCoWKEjlAcnTWMBTKfrB7660LW07s46MHToXZxpx
   IgEngDrzLJkjBckmgy0BBxKX+X72cJ+OJOSW5Rh58Ca8+W+jbDt+JKl+h
   XvqDDRpsaqSnhn/aQUXjz0KxZmLxd+Eo0+sekY9vf2lTN4eqKDUP5x4LD
   PkBE3Ui719Ai1uLKrlUkuNa/s0ycGXJafxP0o0O+29JSdDCqEpSrQBJn7
   bZcfh1FPdbePjC8e0Dpohkq1wg+yyKTpBnvTBJX26GlQXPOK0DcGz/2p+
   w==;
X-CSE-ConnectionGUID: OVFl8naJT8exqOBzj3D53w==
X-CSE-MsgGUID: YAohvhlCTNmMu1xAev4uZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11393463"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="11393463"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 23:35:05 -0700
X-CSE-ConnectionGUID: YSa8XRHgSQuFkVOpX3xxiw==
X-CSE-MsgGUID: R77VsQ7bRzu+h2IOHgH/5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="23708787"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 23:35:03 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3451911F8DF;
	Fri,  5 Apr 2024 09:35:01 +0300 (EEST)
Date: Fri, 5 Apr 2024 06:35:01 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: Re: [PATCH v2] utils: media-ctl: Print the MUST_CONNECT pad flag
Message-ID: <Zg-blfYlEEV957qa@kekkonen.localdomain>
References: <20240404220312.8019-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404220312.8019-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Fri, Apr 05, 2024 at 01:03:11AM +0300, Laurent Pinchart wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> With the introduction of the MUST_CONNECT pad flag, pads can have
> multiple flags. Print them all using the print_flags() helper function.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'm not sure how much of the patch was still written by me. I didn't recall
print_flags().

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

