Return-Path: <linux-media+bounces-18326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A65E97AEE1
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 12:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C56F61F214AE
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 10:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C65165F16;
	Tue, 17 Sep 2024 10:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PX01c70g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9511DFE4
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 10:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569291; cv=none; b=Sz6dI8mZNue+50qaI1L+g8+Z/7FaxRgGyJcy1F/tg+7+mn1SHx1+JHo/GoIKtHzYfrX7GEOoD8NHSQyy4h+wbRluOxVah3mjvRuHvx7Hc4hpt3djvliFfttHJHTN3VUTC+slVek+Qwnd6sPfjp9x8pINCQfeRTVZwGvHKCFPyXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569291; c=relaxed/simple;
	bh=ZPpQz2cSWPuRAcyVvWJppjPK5PhQoX0f1wUIGoMe90I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJaLHyGBMQTbIdEX02BPezoPthVfPpASVAgw4LGw4pxyIysGdbRDA7Mif7ujPVWLQoDWPBmmPbsY+zuFUorW7Da7DqK6vAJmsk+FaXyDXZglCTojZ6J87f8eDPV2E36ia59R8J5QvCv7ln/d5ufX+hkNVY4TeTml1L72apQF6Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PX01c70g; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726569289; x=1758105289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZPpQz2cSWPuRAcyVvWJppjPK5PhQoX0f1wUIGoMe90I=;
  b=PX01c70g3awAw5uaL0f15c401/zTGay7sS9VNEt/X7ovEM/DXm0F2/Zp
   ekRaO65ftyXhu7XHfAnzasUQpVA7QPDMpY8g7plP/0TgXNtx6unCWRDNa
   kuQ6Ue8kfnMEKMBAObdFH3wOMbDjQE7DLGSwFeAIxzYuzapulyoyv8S0X
   y47OS+WMnVeja5vFyA3TyPlRU2r41faciSk/jJbqpTn8GbNj5TU7DluYH
   63ti+BCvOK5uunvbYVGXivTG2aP2dt533kG8WJu0acKGZwttOZdo8a2Y5
   C6L/z50h0kBYCRb1VjfrLWnx1fVsQoFHuBAZzQZq/maZPdfJNXTUiOEq5
   w==;
X-CSE-ConnectionGUID: 7USxqoJ3RWmjLyAvnna+IA==
X-CSE-MsgGUID: 85//uniFRPuQb3eWe7wZcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="42932402"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="42932402"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 03:34:48 -0700
X-CSE-ConnectionGUID: 3rgM2K2zQ+aX22DQh2BB5g==
X-CSE-MsgGUID: bMubhCphQJOMd5shReH2pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69933598"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 03:34:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5D6DC11F996;
	Tue, 17 Sep 2024 13:34:40 +0300 (EEST)
Date: Tue, 17 Sep 2024 10:34:40 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Steve Cho <stevecho@google.com>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <ZulbQNBZidwApHX5@kekkonen.localdomain>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <CAN0yncErs6T9MTp+QxrmbRgSWp79_YvoS_ekVOZB5N1mQ2wdLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN0yncErs6T9MTp+QxrmbRgSWp79_YvoS_ekVOZB5N1mQ2wdLw@mail.gmail.com>

Hi Steve,

On Tue, Sep 17, 2024 at 12:18:21PM +0200, Steve Cho wrote:
> If it were to happen on Wed, I can book at a room for some times at OSS
> venue.

Not everyone is attending OSS. It'd be the best if this would take place
outside both OSS and LPC but I'm not sure if this is doable.

-- 
Sakari Ailus

