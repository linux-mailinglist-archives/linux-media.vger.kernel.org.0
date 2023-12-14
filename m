Return-Path: <linux-media+bounces-2397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A34812A7F
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 09:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A781028267D
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 08:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B024225DB;
	Thu, 14 Dec 2023 08:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdSCIkUJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5B9CF
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 00:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702543014; x=1734079014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dKfoID4eQiYwd2upyieLgI772Na6yWlwM+Vu7m0B/Aw=;
  b=SdSCIkUJfSCSP5NN1zvvnfX+Sb0i59J147DrI4u1SQF+DpWoEg/yJ4Yt
   pkdr4L1TjlCiAotaIqgEmJFi4ke19lgA1XpuyDdFwkPBVZ3O7YgDaR43l
   qhf8OZ4e+6CkyTaJtYmKSPweNndaaLc6Rb/OasRB7UckLxwpK1tnCptQD
   wYq54ujzb57luOkEf8uCddESsbh/31QKgoREUhZdiIzUgE0zfn7kOtcKR
   tSB28lAlZDUeHCy1drMeiuZKcYMTGHPJM3mOnPTJ9C0BOPiKD8h5m2hXY
   SgbD0D64gEVYQnepimwNXFDzNdB9uExwI/xB40Mt0ymwp4v2naVhs+Qjh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8449519"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="8449519"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 00:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="803199127"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="803199127"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 00:36:51 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7319B11F9AC;
	Thu, 14 Dec 2023 10:36:48 +0200 (EET)
Date: Thu, 14 Dec 2023 08:36:48 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v6 4/8] media: v4l2-subdev: Store frame interval in
 subdev state
Message-ID: <ZXq-oJovi7O7S6gF@kekkonen.localdomain>
References: <20231213150010.25593-1-laurent.pinchart@ideasonboard.com>
 <20231213150010.25593-5-laurent.pinchart@ideasonboard.com>
 <ZXq8Gc+1gqVFbTAR@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXq8Gc+1gqVFbTAR@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

Hi Tommaso,

On Thu, Dec 14, 2023 at 09:26:01AM +0100, Tommaso Merciai wrote:
> Hi Laurent,
> 
> Applying this patch I received the following error from checkpatch.pl
> maybe is a false positive or maybe I miss somenthing. Btw hope this help. :)
> 
> Applying: media: v4l2-subdev: Store frame interval in subdev state
> No codespell typos will be found - file '/usr/share/codespell/dictionary.txt': No such file or directory
> ERROR: Macros with complex values should be enclosed in parentheses
> #135: FILE: include/media/v4l2-subdev.h:1411:
> +#define v4l2_subdev_state_get_interval(state, pad, ...)			\
> +	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
> +		(state, pad, ##__VA_ARGS__)
> 
> ERROR: space prohibited before that ',' (ctx:WxW)
> #136: FILE: include/media/v4l2-subdev.h:1412:
> +	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\

Checkpatch can't handle well macros that do something as unusual as this
one and it's not really worth fixing it for a few rare cases. This macro
generates a name of the function (or macro) and the two consecutive commas
(separated by a space as they should, think of it as an empty argument) are
there intentionally.

-- 
Regards,

Sakari Ailus

