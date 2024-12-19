Return-Path: <linux-media+bounces-23781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C50EC9F7B3A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27E4316ACB1
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 12:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB94B224AF8;
	Thu, 19 Dec 2024 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X10gqgRn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D34224881;
	Thu, 19 Dec 2024 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611096; cv=none; b=DI6+1e2VwVUeNhty76ArxJ+IoVHZpUzdWyjNCLWzJO+fGwTBWHWmhXg/LpluWASOYh16kIyM5RQe5+CPLK5l0bjOXu5ajBZF0jZQkx0o4RCZtRFTUKgkc4MLNjAFuak9ay5hrl7fk+qjwmx4G8VNQpMfT9bPlo0S78h86EgJF3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611096; c=relaxed/simple;
	bh=W66uQ06JXfuTI+hSUqmp/PVh8y1BiHPk75mdJ/3WEYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHzRiBGcf+1+dOOaZ2xCAacBH3z0X+lPiBV1W/i6OaGGopAwfOFp80xZlhnU8DwzFD6KtbTlg45eknOpEcz6B/0Dn6mEshQDL5nP4KrCFPoL700ETVcPY6VahPeWmDrHLMBVnWZPopqJLG6hmCMkE9iVjKWe2i4Q6y7jdDTuLB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X10gqgRn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7662EC4CECE;
	Thu, 19 Dec 2024 12:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734611095;
	bh=W66uQ06JXfuTI+hSUqmp/PVh8y1BiHPk75mdJ/3WEYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X10gqgRn4AcJ8Qt1JPs9GHvKGmCDzi/ngPNRjQiaUgQ1DDvPOGp8Apg2gxcL+Ly9j
	 RjbXBVmI2UIGeQGnvebrdY4z9YSTsB9vp57mq2kAxmNYUp1ENaHxVhazPErgo5mjPi
	 iUXbqxeNcqUAqwva4gUPAUYBBWz9paMOvQF3McpPjCwvEj6u4V1M4AYlxP/qqJryE7
	 B1Bm+6Ma2EjrcxSJnPRJYEUQECYbK5LnbS948P/cem2q42YrY+6uVxPmDlqijxAsPI
	 ODGNV0Zrc+uPG+i8z84zcoqkwh17+DF4IWkRQP6oWJlU4NTk8Vr68KMT99bc91UgI8
	 8MWlqsOUChXjw==
Date: Thu, 19 Dec 2024 06:24:53 -0600
From: Rob Herring <robh@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
Message-ID: <20241219122453.GA4008177-robh@kernel.org>
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
 <20241217145612.GA1652259-robh@kernel.org>
 <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>

On Tue, Dec 17, 2024 at 04:24:27PM +0100, Ricardo Ribalda wrote:
> Hi Rob
> 
> On Tue, 17 Dec 2024 at 16:02, Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wrote:
> > > For some devices like cameras the system needs to know where they are
> > > mounted.
> >
> > Why do you need this and why only this property and not the dozens
> > others ACPI has?
> 
> Userspace needs that information to correctly show it in the UI. Eg;
> 
> - User facing camera needs to be mirrored during preview.
> - The user facing camera is selected by default during videoconferences
> - The world facing camera is selected by default when taking a photo
> - User facing camera have different parameter defaults than world facing.

We already have "orientation" defined for this purpose.

> 
> Right now, the only camera driver that expose the ACPI location
> information is the IPU from intel
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/pci/intel/ipu-bridge.c#n258
> 
> And they are only using the panel.
> 
> If we need more information we can consider adding more parameters in
> the future.

