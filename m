Return-Path: <linux-media+bounces-45855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B654C16197
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02ABA4EB08B
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CEB34AAF3;
	Tue, 28 Oct 2025 17:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drFJJ41D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F957262E
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 17:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761671914; cv=none; b=oSko810LwTuV1IIzLnAUqqsAgQl6DmGpQmQwVyFXiZ1e0DJcN2NHuftnXQJQEet8Rih33cFbCDgxjBvAx3IqfGAF2ZJDPytvec1X/hMRXXKjR0AYbd0nciVKuGDxC9AfKxv/WFjs1ewXx5dcetinK0Ibdpga0KBDMRXyMGVOdu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761671914; c=relaxed/simple;
	bh=l6u/30tDpw5NodL6OwI1HFVhSKPXjgFHmOEZygVbPQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tcp6t6E3Z5vFKgsTjXZFMCTi2dNRFjwLLTaxXF2U0a4d21OkdJ63kJsGnR4UyqY8MpsKhHkVeOVj7aAonxBDZaGTZzCL77rHra3+4Ii9Ygd9X2mQ750/fiF369BMRUuWuE1wM+Le6mJl7l8nu0typCDdcIBCxSoktQj+iZ0XgdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drFJJ41D; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761671912; x=1793207912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l6u/30tDpw5NodL6OwI1HFVhSKPXjgFHmOEZygVbPQI=;
  b=drFJJ41D0Xo6lLoquDrGYz43PI0vHKn91DAlJuu+Tqyn/EFf12YDVMeu
   QjzRyBwvnmvCFo38ewlPxroltUo2vly0hJCW3bkFFCMMInQlBWgizD056
   3VhYjI7iGZTCuE77YjuklGXRRHU8gYmkEVnDQ7TzFmZAogV0HoB8rQ4Hu
   rY9SJ6JQgRYPwWUz5YN4cS2ZraE8l3SKLaPXSrlWrMFgdksZWPYTOcSAc
   +YiTWC6qbwvEIC2gNYmbzcTLKUfQENACB15JPZ21/lNBABjgfcoCZdgM6
   xmpnsWPB6junSbajbthZzfuHa9sXDnF97pYzffwjjeWG/6cT6k04YmClM
   Q==;
X-CSE-ConnectionGUID: SHNAT5jvQ0Wo1IDcTGBTQg==
X-CSE-MsgGUID: u+SNkvD3SH60b9Iyrb7HRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63818559"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63818559"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:18:27 -0700
X-CSE-ConnectionGUID: xJvPjzI2TDaVQruKOI4YOA==
X-CSE-MsgGUID: PjjuXmjKRdqJk/+orulKKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189461669"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:18:25 -0700
Date: Tue, 28 Oct 2025 18:18:17 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 10/25] media: i2c: ov01a10: Store dev pointer in struct
 ov01a10
Message-ID: <72jwmvheq2t2lce4uzplv6s6ep4yntwvlzjsbb3bl4bgfjoj4r@6246j2by64y7>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-11-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-11-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:18PM +0200, Hans de Goede wrote:
> Now that the cci_* register access helpers are used we no longer need
> the i2c_client in various functions.
> 
> Some code is still getting the client just to be able to get to the device
> pointer. Directly store a struct device *dev pointing to &client->dev
> inside struct ov01a10 to make the code simpler.
> 
> This also fixes a mismatch of using dev vs &client->dev in the
> runtime_pm_*() calls in probe().
> 

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Hans de Goede <hansg@kernel.org>

