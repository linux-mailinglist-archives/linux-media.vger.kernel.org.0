Return-Path: <linux-media+bounces-45866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13CC166E4
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C0B44E51D7
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D727345722;
	Tue, 28 Oct 2025 18:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCRCRK5T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BA7199FAC
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 18:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761675538; cv=none; b=BcoycFIlVSRLTKDLY+r8x+ub+nUgSXGkusks4IWFJvAboQqZqu0nwYnnLukZ9Pg0ZZHKWZ+PonuP/aM0IB27vuKPjJl6g7k1t6ImUCiEwhj9D/tBEBj1TOkURw5F4q3t4PKjC70uoPxGq70gBPuMdNk0CFB//WKB7Bghg3UrzV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761675538; c=relaxed/simple;
	bh=QvJULHi3bW+7GZ4gAx0TzqUmaSJr+9geA6O9fLk64QI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0vyyUffZMDPiMFp7vlDo693Fs8ortoVwJLkApg4o4MGPYNckVaGO7mWLzQqXdGAR4BzwNFA3AeZs8VWmwSwppKGCVbzhDyThEEUZg0dTaNahRalA/VKTBNzlEAB6cuK29cnrkIayahwVfCY5GjcjoTf1t41OazDeByPj6owj1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCRCRK5T; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761675536; x=1793211536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QvJULHi3bW+7GZ4gAx0TzqUmaSJr+9geA6O9fLk64QI=;
  b=FCRCRK5TCirorQtU0zNfoY+aSPEOjJo9IahFNSJtf/S8YbctHzKgJ1at
   1c1k+zTFnjepsFEqceiTDZnzGuDsL6rSmXYzWaCZ/MhO/JxIbvW7CjVDE
   VRyaylHlw2DcfeuHmMuzld/fzyaF/dlcjmNO6x0ISquG00zRKH5TeHN7P
   c1i4MQpg/BNaYkCYS3T/tw3TVViMNM5FMidm7v651cT36M7eBPcH2mPiI
   KAx+vvBPzoxpLw2B/DrYef3tn7J3fTk+HExTfWkOfdIG2vMda0k8keo1A
   Vy0si+XWiEQ6x2k/xMQ3uWGO2tfl5Dt4rLDAJ9sVFWNxhzRZB5ah7qVDn
   A==;
X-CSE-ConnectionGUID: cPkMGC/2R42FLdD1Q0wG6A==
X-CSE-MsgGUID: GDCTMg3tRf2TzISebEsnRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62816160"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="62816160"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 11:18:56 -0700
X-CSE-ConnectionGUID: tUe6RumaTdeJ1qSoD64qtQ==
X-CSE-MsgGUID: Mt8tnEJySn6iB3n2Q0MWjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="216082316"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 11:18:55 -0700
Date: Tue, 28 Oct 2025 19:18:47 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 14/25] media: i2c: ov01a10: Move setting of ctrl->flags
 to after checking ctrl_hdlr->error
Message-ID: <2sd4szg7pacjb64et7yxktlr7s22adryuj5lkofidbbngvjhoy@dr3ga4a532si>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-15-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-15-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:22PM +0200, Hans de Goede wrote:
> Instead of checking successful creation of the link_freq and vblank
> controls, set their flags after checking ctrl_hdlr->error where it
> is guaranteed that the controls will exist.
>

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Hans de Goede <hansg@kernel.org>

