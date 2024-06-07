Return-Path: <linux-media+bounces-12751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C34E900558
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 507D71C20BB8
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A020418F2E8;
	Fri,  7 Jun 2024 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEa9mU18"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C881A1DDF8
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767912; cv=none; b=PF9SfEkV3jtLtGIwiT05u5zKvfHYoLawPM+eJnJEUcvLPCT9/lROqbfKlEPa29kb+qPh1+Bv2qzo/qzWA6kn5DJubmmlUP+Z9xxVU4q+bFPwnLYlUEmnPwBG5lg+uIYnxWIMvbwHeXjFVIuKsojqDAx7Vkdit8qo1pVLOyhJoAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767912; c=relaxed/simple;
	bh=WvKuNtJjGXFyxNFcrXSQdN6eg2cQEtFlFNl6t7lXFKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGvsiJMdcmGIbqQgWnk6OGlYAlKNqLVSa7xrXwJcmyKU1Wu72JASM7uqdclUNONlYj7ZX8C/5IKch8VFcFpBJW2iwjBqAonKm9JpkyQycUYctCXeNeqbNr3HY3YBTGju1gyCBdK+nSzS0RiC3Fynl8gBBf+gwOjwCdfbAB1BBnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEa9mU18; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717767911; x=1749303911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WvKuNtJjGXFyxNFcrXSQdN6eg2cQEtFlFNl6t7lXFKE=;
  b=TEa9mU18mfmuLyyUyZSxOKWy1XRQVjghmSZJjhOikhb76sMGkItb+3ia
   5poFG9h8avR3KoJXFzvU+rA19bOZrj7v0CEs0aVWarucrUHzGNjKmT1up
   FWJvEU1TR5LTdpBDnKO8wlTh2sKCUBXFVEa3oQRMHbUPS+Ye+zUKptM2E
   4S9Y2wdPxXFy4W1oteJmZucYMMUq12El0HeBKuBNlXspI0M3KPwTZKq1v
   wVDWr0sSLeaKnsZBmyFfxVL7vXxvaONCbSc32FHzShSS+fbJSG7ZmJRB2
   ctXTQ+hHe+F3MyCuYxzXbuq/HcrbgXu5TZFLb+LXpR9Sth2WKb+8g0hL8
   g==;
X-CSE-ConnectionGUID: beiUJZHuRrKxsXmQt+dQuA==
X-CSE-MsgGUID: 9iP9UOGHSPWdE9BT3S6JPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14229383"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14229383"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 06:45:10 -0700
X-CSE-ConnectionGUID: 0p/IVdT/StOrfXhdJA6uCA==
X-CSE-MsgGUID: t8/qIP7VTjacHSskw+FK5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="42893403"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 06:45:09 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E433711FA94;
	Fri,  7 Jun 2024 16:45:06 +0300 (EEST)
Date: Fri, 7 Jun 2024 13:45:06 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wentong Wu <wentong.wu@intel.com>
Cc: linux-media@vger.kernel.org, hao.yao@intel.com
Subject: Re: [PATCH v2 0/3] Fix privacy issue for MEI CSI
Message-ID: <ZmMO4vjde9VT_A4b@kekkonen.localdomain>
References: <20240607132547.2820515-1-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607132547.2820515-1-wentong.wu@intel.com>

On Fri, Jun 07, 2024 at 09:25:44PM +0800, Wentong Wu wrote:
> Currently if starting stream goes with privacy mode on, the whole
> pipeline will fail because MEI CSI counts privacy mode on as error.
> In fact, the ongoing MEI command is well executed by firmware as
> well even if privacy mode is turned on. The status (-1) of command
> response is just to indicate current privacy on status instead of
> failed to execute command by firmware. This patch set changes the
> behavior to notify privacy mode on via v4l2 privacy controlinstead
> of fail the ongoing MEI command.
> 
> This patch set adds one dedicated lock for v4l2 control handler to
> avoid dead locking issue as well. And the useless privacy status in
> struct mei_csi is removed to make code clean.

Thanks, Wentong!

I'm reordering the first and the second patch, to avoid a deadlock before
applying the other one, and adding to both of the two:

Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
Cc: stable@vger.kernel.org # for 6.6 and later

-- 
Sakari Ailus

