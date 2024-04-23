Return-Path: <linux-media+bounces-9946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E858AF36C
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 18:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE578B24E34
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 16:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C99013CA89;
	Tue, 23 Apr 2024 16:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ID19HIpd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720141350F2
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713888320; cv=none; b=fNs4jT0ci2WBbf8lyNY9HGo8SfMYpCpGD6m4b14jLl2uN0Y0ojd/nxfA5SqAUPsaa1lhgUrj5hDP9wy7o/WzD4qsQWtwBIF36wGle0WxpRA7X1mX9aJgVaRLdiA9+WSSs4Y1sQrDUFDn9MhNmObS1unJNLUrHIRTo2dXQ7mZYzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713888320; c=relaxed/simple;
	bh=2FOksHG13fauKAWc6NyryrK6NpHRS9+5DJmF2o8q5QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRWEHzFBxGkFJb9QaXr0Yyw+y2yTlkYkjTkKjEUPT9hCEtt7TupzT8pFGKZZ7XSGXNJoX2TFpKykg46kSk53e2TX24bxatz/dyQ3yfPfkQfXt0mFaX9xsSkupskLmCnFNyVjFOwFbCVxc6x+mVEDXpzM+J5XrQUdLGFzGWBsChk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ID19HIpd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713888320; x=1745424320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2FOksHG13fauKAWc6NyryrK6NpHRS9+5DJmF2o8q5QA=;
  b=ID19HIpdUKUK8H/ppzCl7SHhxGAoJM+hK66Go5L99gw1KosyBhs5qDvq
   jhcHzvPJ6p8pOkvt+Xyzc43as9PfGd5t1Cq1J30YQJA/uf0R+G4ajV2Fy
   V9nHTJjHQj4nCRj/2IIUUjEwpMIaPbT38+z4NJyQcE1tDkFYbGYY+GDjs
   0wn97NZJNpYa8RACumWlE7KkBujN9su+4NWa3zGY3QQmQApCzy4T/7j8r
   QPc8bj6aDikRkkfVfTtDo4HUiDVqIaLI06o/XgLi/X+TOjJMM4fICXksM
   GjgO/PR2FAyj9oejkqb3M7VIAdv0YhexScApmg/Wd4VqtHWjrI2z7ak9Z
   Q==;
X-CSE-ConnectionGUID: AiZVmSrzRkeQyKTTZoLnag==
X-CSE-MsgGUID: ZqjH+13nTLeM70RzX9w9Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9312831"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9312831"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:05:19 -0700
X-CSE-ConnectionGUID: vKEuyTyfTCiLQRk93uFFbA==
X-CSE-MsgGUID: KYQPRrrSRLqjFeU/DInhmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="29058356"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:05:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 731601203E8;
	Tue, 23 Apr 2024 19:05:13 +0300 (EEST)
Date: Tue, 23 Apr 2024 16:05:13 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 15/46] media: v4l: subdev: Add len_routes field to
 struct v4l2_subdev_routing
Message-ID: <ZifcOUSOIoqmsUuZ@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-16-sakari.ailus@linux.intel.com>
 <20240419224519.GJ6414@pendragon.ideasonboard.com>
 <ZieRYpg6zVjXOo2G@kekkonen.localdomain>
 <20240423125450.GD20623@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423125450.GD20623@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Apr 23, 2024 at 03:54:50PM +0300, Laurent Pinchart wrote:
> How about dropping just "subdevice", and keeping "in the routing table"
> ? That should cover both cases.

Sounds good!

-- 
Sakari Ailus

