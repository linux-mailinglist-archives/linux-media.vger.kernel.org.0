Return-Path: <linux-media+bounces-20465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA82B9B3CFD
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 22:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68796B21A70
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 21:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2251E3DEE;
	Mon, 28 Oct 2024 21:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="idA+41EP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D7F1CC17A
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730151784; cv=none; b=NwREHFr8S1G01aUhkGVOeI88JaiEdkyVa8DFvP1Z3u8l/3UoLa1O7liL34UNCDvKYM6dNAyIg3caVa6659Jjoq4fRdIclUoBjJyNLzXxD0eRkCb5pojgPEGeQW/Yn6Ep0AAsFf1bnWmRNX/ZHaab97fUthMWkwBI8hAcqxDQg3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730151784; c=relaxed/simple;
	bh=irjA5tzpDaOvNzm6lro35+dE/64LTJ0aweVaTZKmD3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIlZZBeeBIAglq1ul3NRi74xdX7bQ8ujHg798ZCbzdxAWeERfW2go4t5pUIa2wXMonw/Drl6S3lLVJt6+ixWeGSL7qFKKXjchXWIYdlsUC7JMYmiZiKm+xx7gZ9gV4g60zYj1Ru/fDiYmn/0sdqaWiG09CqEwBV2hAEYpFCGa9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=idA+41EP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AAB5641;
	Mon, 28 Oct 2024 22:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730151778;
	bh=irjA5tzpDaOvNzm6lro35+dE/64LTJ0aweVaTZKmD3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=idA+41EPdaN3GxHN0Tm+VP2OxJhBM8dcxvYlV2J8HBUUNUlxQrKKaYEg2kzpSxi85
	 n8j4AUtReangC5s7R69sCPCyPtd8gBfUftT+VzoLrM+geqslUyQkZzgrsLusmFxciX
	 lSpnz9XQJNj06intO2aJZLbccDdTYXbyYbYOIaeg=
Date: Mon, 28 Oct 2024 23:42:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [v2,0/3] media: mt9p031: Drop legacy platform data
Message-ID: <20241028214254.GB22600@pendragon.ideasonboard.com>
References: <20241028204443.22426-1-laurent.pinchart@ideasonboard.com>
 <671ff90a.050a0220.46cce.2b59@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <671ff90a.050a0220.46cce.2b59@mx.google.com>

On Mon, Oct 28, 2024 at 01:50:18PM -0700, Patchwork Integration wrote:
> Dear Laurent Pinchart:
> 
> Thanks for your patches! Unfortunately media-ci has not been able to
> test them.
> 
> Make sure that the whole series <20241028204443.22426-2-laurent.pinchart@ideasonboard.com> is
> available at lore. And that it can be cherry-picked on top the "next"
> branch of "https://gitlab.freedesktop.org/linux-media/media-committers.git".
> 
> Best regards, and Happy Hacking!
> Media CI robot out on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

The series is based on top of the next branch.

$ git switch -c tmp fdo/next
branch 'tmp' set up to track 'fdo/next'.
Switched to a new branch 'tmp'
$ b4 shazam 20241028204443.22426-2-laurent.pinchart@ideasonboard.com
Grabbing thread from lore.kernel.org/all/20241028204443.22426-2-laurent.pinchart@ideasonboard.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 4 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 7 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v2 1/3] media: i2c: mt9p031: Drop support for legacy platform data
  ✓ [PATCH v2 2/3] media: i2c: mt9p031: Drop I2C device ID table
  ✓ [PATCH v2 3/3] media: i2c: mt9p031: Switch from OF to fwnode API
  ---
  ✓ Signed: DKIM/ideasonboard.com
---
Total patches: 3
---
NOTE: some trailers ignored due to from/email mismatches:
    ! Trailer: Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
     Msg From: Tarang Raval <tarang.raval@siliconsignals.io>
NOTE: Rerun with -S to apply them anyway
---
 Base: using specified base-commit d020ca11a816a99f87f2d186e137a9fb2341adb3
Applying: media: i2c: mt9p031: Drop support for legacy platform data
Applying: media: i2c: mt9p031: Drop I2C device ID table
Applying: media: i2c: mt9p031: Switch from OF to fwnode API


The trailer warning is weird, I don't see any message in the thread from
Tarang, I wonder if it could be a bug in b4. The "Analyzing 7
code-review messages" message hints at that.

-- 
Regards,

Laurent Pinchart

