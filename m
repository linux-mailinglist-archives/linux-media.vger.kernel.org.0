Return-Path: <linux-media+bounces-32539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F01AB7801
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 23:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8829417C54A
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 21:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47111E9B1D;
	Wed, 14 May 2025 21:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iPSzoaFJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25AB4C6D
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747258423; cv=none; b=Tkz9YAdQFdsMEj8wDpOW4XUElil6VMeoe51ThyKdmxzD2BRaexqgbcw3mg8BtLP07ccIy1V7Z6r0DEflU1V9IqSLwUEPGe6W+8qfpLxkvZGlsfNJG9HGi+lMPgGBzy6kdaCEiSxR1gAvaU47n+rGKnwEjiOFViLo6itsAzX/uOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747258423; c=relaxed/simple;
	bh=9rCDrvJ7ihEiAIyDB1Pc33wYbxYNR5P+VqqgJlxg70g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhfXtlWu0i1Ipy4qy51QPy2L+y078pVbpio0WX7A0VmNttsbzQiW5p3yTHRwLN2Nswbi9efUFVudanhSl9CprIZ287CF0tVsrtfCqMukodzrj3Npv0soyTbqu1f9S1Oj8vp/TzLT9wO+HC22h3Glx/IddqCxbzfHtgR31tsBZgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iPSzoaFJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cust-east-par-46-193-72-226.cust.wifirst.net [46.193.72.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 264946A6;
	Wed, 14 May 2025 23:33:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747258402;
	bh=9rCDrvJ7ihEiAIyDB1Pc33wYbxYNR5P+VqqgJlxg70g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iPSzoaFJt3Knq8Gm20Ycdx7S7pmlb//q+JiniLMH1IvgdjaS/THv6nmZpgni9r7/D
	 /3j0Mo90zdXZpErwAFqKQGslKEE9POaFycanoD4W007pbHAQUmhrHn/23Jro9rn29s
	 QOOLQgcfFdGnTBKR1DhdNUHfisTcShg4Gd1/Fsag=
Date: Wed, 14 May 2025 23:33:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mario Bergeron <grouby177@gmail.com>
Cc: kieran.bingham@ideasonboard.com, libcamera-devel@lists.libcamera.org,
	linux-media@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250514213331.GJ23592@pendragon.ideasonboard.com>
References: <7B9D4FF4-4174-4DA2-AA77-ABFCEFED23E8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7B9D4FF4-4174-4DA2-AA77-ABFCEFED23E8@gmail.com>

Hi Mario,

On Wed, May 14, 2025 at 10:20:20PM +0300, Mario Bergeron wrote:
> Laurent,
> 
> Just wanted to know if will be possible to attend remotely ?
> If yes, is there a link ?
> If no, will the session be recorded ?

Please see
https://lists.libcamera.org/pipermail/libcamera-devel/2025-May/050272.html
for information about remote attendance. It will be a best effort setup,
as we can't guarantee the quality of the internet connection in the
conference room. The workshop will not be recorded, but we will take
notes and publish them.

-- 
Regards,

Laurent Pinchart

