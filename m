Return-Path: <linux-media+bounces-39426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 174BBB206EE
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 13:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6B9F7B733C
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 11:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335DD2BE7B3;
	Mon, 11 Aug 2025 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1MtVBs+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9532BE65A;
	Mon, 11 Aug 2025 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754910242; cv=none; b=jjVGMCyenrMBoMK4Kz7NZDSTNmu6wCW+mczd5NIkuSejSNiFMC6L1IXgfBgNHxF+oVyxOI7BJmQyvNxCw8fZOhv6tnwXnouIpHi+2r4erTmqLFnsY2NZ243Oc1cRC1iy9yDvr5rKBjKR1hp8amvPCiaAoMZBlivpgvo1m22O1Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754910242; c=relaxed/simple;
	bh=L6KFpU21J6DAxtfHubAqXW+wZf9lo2mmAobMVkMeTb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rusd53NCqxtnuDy484hcxYQAkeRTaV4cgDTLdl6cA2ZCgq5TbSTiV1gb2H+OSYSzgBFUZj67+qLSCAsuNmUdyqpLVh4Zm/4Ozpyzp4pRzksCD27mMlLumqEIvzNt6ikkmisBVaHnu65XMMnTQNDERnq4VSxQgjvdczjTzHn3UyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1MtVBs+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754910241; x=1786446241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=L6KFpU21J6DAxtfHubAqXW+wZf9lo2mmAobMVkMeTb4=;
  b=f1MtVBs+qhi0sWKpAULXXyqriEjHjY1WT2i/1NYeLcaFpFPoUukCEDqj
   BQvC3izCx7KwfV/RL83gjmB+lE3kxTyzxuYKTglAWzsdsw3ZjjhvFaTGD
   xuv0YWaiXWULzfcvr/ypHF0MT8FI0SouEWpOn0mEydjzTIohjKPVvubOR
   r+OCTwJqATnWH8zstEd8LciA/uILq2+PJsgbM57f8ewxus9CR0XXMlGZl
   D/IXdSD7kgwT1EHGhT6FyY1sNV36P2KyiTxnjbLcy67h+gqnO4cCT1DKD
   gdYVXbBHuM0j+0lNAffk1wArsVvMGLCCE0M3OB+sR6vuQ2E0OrHXI+GyF
   A==;
X-CSE-ConnectionGUID: uUmYiKyVSsm6b8pw6qiEBw==
X-CSE-MsgGUID: m2KvQRdsS8Kep9mZFI4lVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="59771838"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="59771838"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 04:04:00 -0700
X-CSE-ConnectionGUID: VcT+nOGnShCw077vzFymsQ==
X-CSE-MsgGUID: gJr1RH9dSF+yO7bnCoaHKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196725508"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 04:03:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D361F11F87A;
	Mon, 11 Aug 2025 14:03:55 +0300 (EEST)
Date: Mon, 11 Aug 2025 11:03:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] media: i2c: imx214: Add some style improvements
Message-ID: <aJnOG0wzQ4eNYhwt@kekkonen.localdomain>
References: <20250630-imx214_fixes-v2-0-cd1a76c412c0@apitzsch.eu>
 <3a12312d37abe53cbd1a374d9cda81801f3f37e8.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a12312d37abe53cbd1a374d9cda81801f3f37e8.camel@apitzsch.eu>

Hi André,

On Sun, Aug 10, 2025 at 11:48:14PM +0200, André Apitzsch wrote:
> Am Montag, dem 30.06.2025 um 21:05 +0200 schrieb André Apitzsch via B4
> Relay:
> > The following changes have be suggested by Laurent in [1]. But the
> > related series had already be applied. That's why they are addressed
> > in this series.
> > 
> > [1]
> > https://lore.kernel.org/linux-media/20250621181751.GA9125@pendragon.ideasonboard.com/
> > 
> > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > ---
> > Changes in v2:
> > - Drop unnecessary sentence from commit message (patch 3/5)
> > - Fix typo in summary (patch 5/5)
> > - Use imperative mood for commit message (patch 5/5)
> > - Add R-b tags
> > - Link to v1:
> > https://lore.kernel.org/r/20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu
> > 
> > ---
> > André Apitzsch (5):
> >       media: i2c: imx214: Remove unneeded parentheses
> >       media: i2c: imx214: Drop dev argument from
> > imx214_parse_fwnode()
> >       media: i2c: imx214: Use __free(fwnode_handle)
> >       media: i2c: imx214: Move imx214_pll_update to imx214_ctrls_init
> >       media: i2c: imx214: Separate legacy link frequency check from
> > PLL calculation
> > 
> >  drivers/media/i2c/imx214.c | 245 ++++++++++++++++++++++-------------
> > ----------
> >  1 file changed, 121 insertions(+), 124 deletions(-)
> > ---
> > base-commit: 5e2562c1e46d3623fbdef77693f374eade075840
> > change-id: 20250623-imx214_fixes-123f285f5b62
> > 
> > Best regards,
> 
> Hi Sakari,
> 
> kind reminder, that this series is still pending.
> 
> Is there anything left to do from my side?

Thanks for the ping. The patches are now in my tree.

-- 
Regards,

Sakari Ailus

