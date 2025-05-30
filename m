Return-Path: <linux-media+bounces-33622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D650AC88F0
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 09:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AB257A3327
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 07:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADF820E003;
	Fri, 30 May 2025 07:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sd9pR05T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB502AE6F
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 07:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748590118; cv=none; b=qPW3jowd7Ii8FUm2UZoXVgbHDTGdFhKYo6MLHx4EqnqKNbiwyGorJibbDgftom0qFZOy2NoN5aGMwCRbgA6OX28WqkLjXOQ3lCLwlc2JvruTrU9rBsZb+agj4C1ySxtsarWrzbuxt/PIemD7WzEmeD52vLVcQmsHeT/EsitkPbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748590118; c=relaxed/simple;
	bh=4oNTxs+9yt8Pa+CCoVhuIqREqXmF749ModbfId7xWKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJNQeHlZmJBqkU372M9vcW++BB4tYZV1jPRpPqXWNSK5vDc7Bc2QEKLRtkZOtoK54LWxvz0qu+CGH4QNfDDB2qA9rPtwJZmFtm0EHZV4lXCdTiMw340W0I2dG2Nyi0E2eM4EHDNhpyCO8RNE/WPOJKf0or0zj06jBlGb1rTB3W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sd9pR05T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-143-247.net.vodafone.it [5.90.143.247])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 254B782E;
	Fri, 30 May 2025 09:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748590087;
	bh=4oNTxs+9yt8Pa+CCoVhuIqREqXmF749ModbfId7xWKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sd9pR05TCykeneTl5y3Rod0xcNjcPOSEvx9ChDAyOkAgfWYrzo/v4SMbBRZJcesfm
	 dzYyCpH2UNriKUzm3YAjvaUZXJj7NZsOMf+sksdOWG0RCp0SDFfxtxnZE+MjiQjQOC
	 LgwtkslEnQvrKcMIYLd7kOPnc5Jd6FwCoD3SZZ3I=
Date: Fri, 30 May 2025 09:28:31 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [v10] media: vsp1: Add VSPX support
Message-ID: <2stwhukog5exuoam7c3acicsuex6l2ajt2bvkl2pmiwythiaiv@edsqjyhcvrus>
References: <20250529-b4-vspx-v10-1-02a9cb000853@ideasonboard.com>
 <68389c67.920a0220.225f76.17b6@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68389c67.920a0220.225f76.17b6@mx.google.com>

Hello,

On Thu, May 29, 2025 at 10:41:59AM -0700, Patchwork Integration wrote:
> Dear Jacopo Mondi:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> # Test static-upstream:test-smatch
> drivers/media/platform/renesas/vsp1/vsp1_vspx.c:338:9: error: typename in expression
> drivers/media/platform/renesas/vsp1/vsp1_vspx.c:338:9: error: Expected ; at end of statement
> drivers/media/platform/renesas/vsp1/vsp1_vspx.c:338:9: error: got __UNIQUE_ID_guard1292
> drivers/media/platform/renesas/vsp1/vsp1_vspx.c:338 vsp1_isp_start_streaming() warn: statement has no effect 'class_spinlock_irqsave_t'
>
> # Test static-upstream:test-sparse
> drivers/media/platform/renesas/vsp1/vsp1_vspx.c:338:9: error: typename in expression
> drivers/media/platform/renesas/vsp1/vsp1_vspx.c:338:9: error: Expected ; at end of statement
> drivers/media/platform/renesas/vsp1/vsp1_vspx.c:338:9: error: got __UNIQUE_ID_guard1292
> drivers/media/platform/renesas/vsp1/vsp1_vspx.c:338:9: error: undefined identifier 'class_spinlock_irqsave_t'
>
> # Test checkpatch:./0001-media-vsp1-Add-VSPX-support.patch checkpatch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #105:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 0 checks, 736 lines checked
>

I believe this a a false positive, maybe not something to report to
media-ci but to smatch itself ?

>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/77347658/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>

