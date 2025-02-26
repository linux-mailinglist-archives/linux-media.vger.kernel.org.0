Return-Path: <linux-media+bounces-27037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E6A4609F
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3CCC1897DD0
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DA3218ABB;
	Wed, 26 Feb 2025 13:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZwFXve2i"
X-Original-To: linux-media@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A208D21A421
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 13:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576148; cv=none; b=bKI8vVjbT9Qc3Fw4pkiGdjSiTvqopk3212eb7WhYl3UEPfDBDkmcPCt52KUGgqvxOvO+w6RPb9vFG6hsAV5AwbiG1NNKKp6mtiCqe/4UMDETVHvdrj9WC11G2PXXPg2sNzWB/DiUMt3Tuv7Zu2bua8SSdu6HTM2s26bkuAEbkkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576148; c=relaxed/simple;
	bh=yJNGniBCCGdicYavRcAhwwp5PYKJuo7o/0JvRhXd9JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bc7vH3+Y/J4Cpd1wGk6k1Ed5WV/ck2c9+ZFhPbHRD8+dGLP2zahgJ5zuVE3aTUZDodEC8gve50VI2I8QeDqoZiRVlQsk2KVYwpUoFFLdqfIr5DvtuWtrxd0LdI9LUb07TJHpDPsArGYyA6Do+t0eqoyoaxHvL7/+Y1mj4qg7F+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZwFXve2i; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 26 Feb 2025 14:22:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740576143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H8oOWZ3UokvtZev5Jv8afPTU3EfeGf2EZe3c3IDchRM=;
	b=ZwFXve2iummt6MudXRTT5PdPMfZ946mccJEqBNj3L2kSz7t3m2ph5w8U1ap+OCLYZnlJ9+
	6iIsXRzPBjFBkBYgedT1LIBxz+cDc+Iu/wW6gN+1BgEMho1Y2Co3vFF2vggjlqbJjfRqmh
	iXUpBFU7y/0WZSd6FwSNhdS5uRVeIrg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: ov9282: fix analogue gain maximum
Message-ID: <ooxkhn2l4s2rnz3qp6z2b45bkrrdslrdoyedt6dsqrrmnspsa2@v3cwoyw6shef>
References: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
 <20250225-b4-ov9282-gain-v1-3-a24af2820dde@linux.dev>
 <CAPY8ntCLUVX91+QYbFk-bHQumuvs70CuDLe85VZRTS2wW-tYHw@mail.gmail.com>
 <ljhusn3jkbq64rn2ureul5kurenjwrtu7ppv5jjx5i542goe65@h4oltlieomfp>
 <CAPY8ntD3k48cPfOQK2iEveLHahhFMV9JMwfq3sV-SvnrsZkxng@mail.gmail.com>
 <Z78QkUcv8-CBbvBS@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z78QkUcv8-CBbvBS@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

On Wed, Feb 26, 2025 at 01:01:05PM +0000, Sakari Ailus wrote:
> Hi Dave, Richard,
> 
> On Wed, Feb 26, 2025 at 12:52:46PM +0000, Dave Stevenson wrote:
> > > So please feel free to ignore this patch. Should I send a new series
> > > with just the two minor patches of this series? Or should I include them
> > > in the next series for the ov9282 driver?
> > 
> > Up to Sakari.
> > The other two patches have my R-b responses, so taking those two and
> > ignoring this one should be fairly simple, but it just depends upon
> > workflows.
> 
> I can pick the two first patches of the set now.

Thanks. That would be great!

regards;rl

> 
> -- 
> Regards,
> 
> Sakari Ailus

