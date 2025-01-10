Return-Path: <linux-media+bounces-24573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12507A0898D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3731D3A88F5
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 08:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84187207A25;
	Fri, 10 Jan 2025 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRTHvx70"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09F733987;
	Fri, 10 Jan 2025 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496536; cv=none; b=klllqH2WjT8GGeSntdWM1Kf8Y50b3pPPz8mE+EE33HbAz/RG7ZJHMfhisUYKVXC+S8aGte3WzeypHiy8tfHOBE/IvITDH9ukxslHclF1Z5hiS7jL7QyWFq5ACVzwSlbQuR1grhgJlrjYZYx9dhhfHPw1qELMVV9gtG0JNznt5uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496536; c=relaxed/simple;
	bh=0vZxoqsAEaUyi0cIZM9avr4/Zblqn0Qq4dg6nBL6UVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sit0PQP964A/HGSNBRgap4xTTQhCzZd8tFpM08BPsCN74QC+8wKSZLO/4oBYvOfhCszqDpo9VFXE9I6GFbxso+7oGEr6VBUYbrZ+qazK+2DQvCdXF5M9MFmiU73jhOESaA5tV2I63aljuyu9oQhq9KLUq1C9UijcSYVxqd80Blg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRTHvx70; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736496534; x=1768032534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0vZxoqsAEaUyi0cIZM9avr4/Zblqn0Qq4dg6nBL6UVs=;
  b=mRTHvx70JpPuTWz/ixRCtvsPnreV6sIDW9ed6liH8/YlAeOzFSfhdYhL
   nPk60gqpwc7YuJgHu4/BoEmD4TKiU5e50n86PFSG4IMiqOoQhUsi1i2jE
   V1ya83HmivU3iq2nELwYL8Hc9404rbL7MimX8JRS7NIGcv4hnEu72lamE
   zfL6v6n4/NYri86MGTV3trxkzM7a4gUHZ8kM0jx0boALL9uHnVEB+uPHO
   ptvJm67T1BsIM5lGZRV8hNksx90xnb5R5PFJlvmmpZLOghUgx6dreLY0W
   lM6oXKbD5n1ieywIfZbB5OZANVrEmDEvokitPPEzlkP4+onXousQu8Ni2
   g==;
X-CSE-ConnectionGUID: xxo4r8YzTpS1ShR3uZQMYQ==
X-CSE-MsgGUID: CrX95A4JTmuMJts7iplGBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="62154027"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="62154027"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 00:08:53 -0800
X-CSE-ConnectionGUID: guE/BhWbT7q99Q6DlK+Jqg==
X-CSE-MsgGUID: AG7Q+tLwTymHN1MgC8HhnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104185433"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 00:08:50 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2AF3A11F89A;
	Fri, 10 Jan 2025 10:08:47 +0200 (EET)
Date: Fri, 10 Jan 2025 08:08:47 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/8] media: stm32: csi / dcmipp corrections
Message-ID: <Z4DVj9ubGkAmkZKN@kekkonen.localdomain>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>

Hi Alain,

On Wed, Jan 08, 2025 at 02:16:03PM +0100, Alain Volmat wrote:
> Various fixes within the stm32 csi bindings/drivers and
> stm32 dcmipp driver.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Thanks for the update. I tried to apply this but it doesn't, and the
culprit appears to be this line in dcmipp_graph_notify_bound():

	unsigned int ret;

That appears to be a bug as such. The interesting thing is that the patch
changing things around it presumes

	int ret;

so it won't apply. Do you already have a patch that fixes it? It should be
cc'd to stable, too, with a Fixes: tag.

-- 
Regards,

Sakari Ailus

