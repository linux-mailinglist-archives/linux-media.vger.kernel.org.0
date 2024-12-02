Return-Path: <linux-media+bounces-22410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A659DFD08
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 10:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEB2A1622E3
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 09:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F5D1FA16A;
	Mon,  2 Dec 2024 09:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pfk/Ao8b"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F211D6DB5
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131531; cv=none; b=U7M1/k2oKZEK/PFC60XN4hUIdD/XOvCw3lAqbI33ZrkHL80vKUyvAYYi75lDFN2GI335/CVav+T8iHKivm/xss9vSpNbzzLzJcoEBxGNlZciSFZg1lqNaGU0eu5UmtbszA9+A4vB1E2ht0ZQLKiGwpB/UUqroJG4MamnL7IFE+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131531; c=relaxed/simple;
	bh=QwcWqhGeQbsnLHmuztEvCFFMbdkAwhdE36KUCzfr3MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yo9X38bQzO76iRXs2LKWdKP5LIFqBX9KeoIj1+aOCLYoemn1ux3ZMZTde0cfrspXCk41QJkTcLv55DlQVNN0w8g8yfJ4K2TbQrxt4RiUPhheG2c7cQkMgy2OYdOsbUGftGmEG+LKAqE0IvOKpDQk/1Y1YUxFBpC0LfDB28lQ8cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pfk/Ao8b; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733131530; x=1764667530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QwcWqhGeQbsnLHmuztEvCFFMbdkAwhdE36KUCzfr3MI=;
  b=Pfk/Ao8bzsBd0frc288uMjG9cDN+46gNIcVeKiU8AbotM86Fmjp+xsUO
   76rQNiaWVgum1MqCMwXMMUB323L2pBRUBSfAkhVJDHag6Byxkjk7aqtel
   1ceXMvqzhnEGTK4VJbsp1b+zK/EnCV/fo/X+UaVcq11gchojGxZ943eqH
   PHvHQw5FbTMj7KfP7UxMEgrafK/3Bvg8fCB33mBhSgHqwA5DMLR9SSevh
   9rbn+aa4Mv+4E7d0IhhLiNz1VUsBfq0MyXOZuucmh6xW2jW78Sm5jhROE
   ZRZq+pnOfvh0jbJxq1Z48l87N5lVsOroCBNKT5rXZ8FDIBlSK4gNNAlvS
   Q==;
X-CSE-ConnectionGUID: yJoSompbRq2J81LsqDORxw==
X-CSE-MsgGUID: r8ZT0QOBRuGcNoRT5451cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="55782010"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="55782010"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 01:25:30 -0800
X-CSE-ConnectionGUID: wVkTMUu3SbiYJY2+PjWSrQ==
X-CSE-MsgGUID: 94+jercGTimjsZCkTw8QPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="97823355"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 01:25:28 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 70F4211F89A;
	Mon,  2 Dec 2024 11:25:25 +0200 (EET)
Date: Mon, 2 Dec 2024 09:25:25 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH] media: intel/ipu6: move some boot messages to debug level
Message-ID: <Z019BbArwOns3Th1@kekkonen.localdomain>
References: <20241129120020.318903-1-stanislaw.gruszka@linux.intel.com>
 <01c8e1c3-a5ef-4c4f-a38f-d602c36e7ce0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01c8e1c3-a5ef-4c4f-a38f-d602c36e7ce0@redhat.com>

Hi Hans,

On Mon, Dec 02, 2024 at 10:09:23AM +0100, Hans de Goede wrote:
> Hi,
> 
> Thank you for your patch.
> 
> On 29-Nov-24 1:00 PM, Stanislaw Gruszka wrote:
> > When ivsc chip fail to initialise properly we can get plenty of ipu6
> > messages like this:
> 
> s/initialise/initialize/  (if you decide to do a v2)

Both British and American spellings are accepted.

-- 
Sakari Ailus

