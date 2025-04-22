Return-Path: <linux-media+bounces-30716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8739CA96F25
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 16:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC98D1B64304
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 14:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C47228CF68;
	Tue, 22 Apr 2025 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tadc1sQS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90258281537
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 14:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332959; cv=none; b=XujDmQFQWUYZOtsQJIxBtKaxKGdd24ZUgSXtH35apRS/RdlakMf21WJzxQUkVtV8AylaMiRSIkDmup2B+OMQD9JsUDb/qetSxwn2uGFkwDB4cMB395aDpSiYyg1JZaozJOfvNoja4BGNs+VdtYhLKW59LquhC3b8WQUt3IegzqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332959; c=relaxed/simple;
	bh=eWDHdcYpbgqUVULTa+IK5A/wjpuPiMEMUyDxl7ItWOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLq+MQpy3doJnrkz++WDDXl/dwa62jyO1i/+RKe+TX1QzS6mSN5PMpI5+gn21xG00ruvh8KRaahzOM+1oBXqM7Yyd834OWuwTkHj+BAXm3LiMJ34NWqhJx2OIWWl8MgCgxmd3I2J5jnQl1Y+Wh7V8ikEysEavk0wlfnZdA1Vu3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tadc1sQS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1784C10D;
	Tue, 22 Apr 2025 16:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745332955;
	bh=eWDHdcYpbgqUVULTa+IK5A/wjpuPiMEMUyDxl7ItWOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tadc1sQSeM7nMwV9yPuUdx88ShuxHXCxqWCvlUGsHW9ZnFbjV8EGPU0wNZiFt7rdv
	 PeMNVhZvF4ItVfPUzpk4p/OnHd8FBVtddEvrNOmtiFZhvFJg1X4tc96EYI9iOlTD/c
	 23avRyUNJ/zfPMQd1BZm9PTahrPNwQpSkjai/7XE=
Date: Tue, 22 Apr 2025 17:42:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Josuah Demangeon <me@josuah.net>
Cc: linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250422144233.GG17813@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <37CAUM9WVKFYD.32F5XTP8CVIBY@ams1.josuah.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <37CAUM9WVKFYD.32F5XTP8CVIBY@ams1.josuah.net>

Hi Joshua,

On Tue, Apr 22, 2025 at 04:10:45PM +0200, Josuah Demangeon wrote:
> Hello all,
> 
> First email from me on this mailing list. :)

Welcome :-)

> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > If you would like to attend, please register your interest by replying
> > to this e-mail, and indicate if you have any discussion topics you would
> > like to include in the schedule. We will draft and circulate an agenda
> > in the next few weeks after receiving topic proposals. If registrations
> > exceed our capacity, priority will be given based on topic submissions.
> 
> I am new to libcamera, I might not have a full-fleged topic to propose.
> 
> However I would be glad to occupy an empty seat as a way to introduce myself
> to libcamera to understand how it can help the Zephyr RTOS, which imported
> some V4L2-style APIs lately.

That's an interesting topic, I've added it to the agenda.

> https://github.com/zephyrproject-rtos/zephyr/issues/82158
> https://github.com/zephyrproject-rtos/zephyr/issues/86669
> https://github.com/zephyrproject-rtos/zephyr/issues/87935
> 
> I might also be able to attend the Embedded Recipes and Gstreamer events.
> 
> Looking forward for it,

Likewise. You're now on the attendees list.

-- 
Regards,

Laurent Pinchart

