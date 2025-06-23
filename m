Return-Path: <linux-media+bounces-35653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E5AAE45B0
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 15:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C2C516FAC9
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8A8248F7E;
	Mon, 23 Jun 2025 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDjV/Efc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91BD248F5A;
	Mon, 23 Jun 2025 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686912; cv=none; b=SBHA5b22bznPg8D/oso+TQRDczqS1GNB+BKGdUCDbFWgB8dJkfjKzdZppQ3Xu/nKGdKQWcGdBhfCeW7a65hriflYln6xqgMW8feIpESyw6UhCAcmjYGvgoJg0BbuMjaes3xUBBSXNfQwjV7VSmaSMmeunpe3LW8NXOJDYhT1xfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686912; c=relaxed/simple;
	bh=jLWJrmtgJQZJVJKqAox7BA1rst37kkty3zeUjLnbPQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyBfCkMfbEo1FPzxj0CV0VpU6HibIHSk70TKLGF/B99uq9bTDRE0V2K8I2Q9xww6mQLGSi/XLrFmrMtF14edOtk37QH+VHEdah7l7Gyv9/chEEUPN3TjEn4dI7Bnc9hKMdpwKMKuoOdYUEUBEPOsmv3Oi0WHESt1zsK3gQAyzbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDjV/Efc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750686911; x=1782222911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jLWJrmtgJQZJVJKqAox7BA1rst37kkty3zeUjLnbPQY=;
  b=GDjV/Efceg5tiPMTAH1kChzm/gtguCbEhcSlCsBJGqCVkd2qOiqSbn1f
   VztxJzRXRN0XqjJt+xhJyiWwV1r/t321ryguoTOKw0u3voBr2uveFBsHS
   9sDi9dYPiFTL6ll00FJkOfP3eh1kYJqK7maL0+ik2AfzgIJr3evwloo7s
   wgpKhjogsk6SE+AJ2FsRxtogrXumcGZtKXHWUVwoc5OgcgRmwcYrM00cK
   dENgvNT6zckwra6QDar8B5dcjguXWrw77A7WRrmBlmbaHUyBEptZRL7kQ
   raGLtRh3YnzbatuboVuwY5INPzCWAlOrvkSoEJTm5RrHF97f6CcN9QVgv
   g==;
X-CSE-ConnectionGUID: eaZc9i7ITpq8fVTfTUYEhQ==
X-CSE-MsgGUID: veAbORtSR96GrQSllZrpBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64326489"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="64326489"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:55:10 -0700
X-CSE-ConnectionGUID: Kum29rmQTeCauBg3e0FQ0w==
X-CSE-MsgGUID: miDSXAgITfqad7c96MLUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152287874"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 06:55:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3C08511FC36;
	Mon, 23 Jun 2025 16:55:03 +0300 (EEST)
Date: Mon, 23 Jun 2025 13:55:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH RESEND v4 3/5] media: i2c: imx214: Make use of CCS PLL
 calculator
Message-ID: <aFlctybsb-HM8Vzr@kekkonen.localdomain>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
 <20250621-imx214_ccs_pll-v4-3-12178e5eb989@apitzsch.eu>
 <20250621181751.GA9125@pendragon.ideasonboard.com>
 <ed0b8fe3a20111477cafb1de7b399afb99caaa0c.camel@apitzsch.eu>
 <20250622171320.GA826@pendragon.ideasonboard.com>
 <CAPybu_2WF=t4jnwsrTSCiSZ4T7Sck4-fCoub33=P_6KvdZ5ePg@mail.gmail.com>
 <20250623114658.GB32376@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623114658.GB32376@pendragon.ideasonboard.com>

André: the set is already in my tree but Laurent had further comments. Can
you post patch(es) on top of the set to address them?

-- 
Regards,

Sakari Ailus

