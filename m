Return-Path: <linux-media+bounces-14690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75924929C27
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 08:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F77E281D7F
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 06:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B137713AF9;
	Mon,  8 Jul 2024 06:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iQvDtGEM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0966D1862A
	for <linux-media@vger.kernel.org>; Mon,  8 Jul 2024 06:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720420069; cv=none; b=BZClBGrIl69FSr0NhIg+uv+78LfVbNhklwpWhOZF5V3zEIkpvDwMe2DOBQ6aGKJVCIC/sUjc3ZnJUhAKHdjsknU9zXI/+mGtbwv9U7XWaXHUaudqxcUDx/FebH8mymGFFlAYYK0BOVorcgUMOUralZ93f5XWNFtofubWvJEcPVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720420069; c=relaxed/simple;
	bh=M2yZFFWGMI2s0O1mAmsg/59lSWpUZvsuyIzL+Z1KSpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jTCGoQvLZ70f6/Gc8hPDmKp4kKZXYqJa+46KM40pHQ4dZG67PXgbW7aSW27gbjLFY68WAfvzFf6xCl1da8c5riPUJCG7ymNh/zfssTT3/R/J35bw4ADtz5/+Wu1rjBFIcbOlyUmabQ4bgs9325+gKrVchMRAPgpbOY+EuL/sskQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iQvDtGEM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [194.75.195.10])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CF938D0;
	Mon,  8 Jul 2024 08:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720420028;
	bh=M2yZFFWGMI2s0O1mAmsg/59lSWpUZvsuyIzL+Z1KSpg=;
	h=Date:From:To:Cc:Subject:From;
	b=iQvDtGEMeevEnkmZ4Wsa29iNAnK64+xOKo6r8r7UfowtvcP8Kxf4Eh12k5EBN35PS
	 X16PqvEsT5Qh08cCkgM96e901CgcehwLkSSEYWIzukb2P98U/bRAZDh12NiTepG7aM
	 evoRBuHWyUVLR6nc29/X75cfqf2bkSgL056nD0gQ=
Date: Mon, 8 Jul 2024 09:27:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>,
	=?utf-8?B?8J+Qpy1kcmk=?= <dri-devel@lists.freedesktop.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Subject: CFP: Complex Cameras =?utf-8?B?4oCTIFVu?= =?utf-8?Q?locking?= the
 Future of Open-Source Camera Software
Message-ID: <20240708062718.GA10946@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

Ricardo and I are co-organizing a microconference during Linux Plumbers
2024 in Vienna to discuss problems related to support of complex cameras
in Linux systems, and find how to solve them.

The camera hardware landscape has undergone a dramatic transformation,
moving from simple frame producers to highly configurable and
programmable systems. Unfortunately, open-source camera software has
struggled to keep pace, creating a bottleneck that hinders innovation
and limits the potential of modern camera technology.

The Complex Camera microconference will bring together key stakeholders
to address the urgent challenges and opportunities in open-source camera
software development.

Call for Proposals:

We invite proposals for topics in the following and related areas:

- What kind of kernel API is required for Complex Cameras?
- What level of hardware documentation do we require from vendors?
- In which kernel subsystems should Complex Cameras reside?
- How shall the camera stack interact with other subsystems like
  NPUs/GPUs?
- What does the perfect camera software stack look like?
- How can we support dual camera stacks (open and proprietary) on top of
  a single upstream kernel driver? Can we support non-open features?
- How can we allocate/share memory efficiently between the different
  subsystems?

Who Should Attend:

- Kernel developers
- ISP vendors
- OEMs
- Camera software developers
- Linux distribution maintainers

Microconference Format:

The microconference will consist of short discussion topics, introduced
and moderated by the participants. Each topic lead is expected to
prepare a short presentation that will be shared with all the attendees
in advance so we can use the Micro Conference for questions and face to
face discussions.

After the conference we will divide in smaller working groups.

Submission Deadline: 15th July 2024

We look forward to your contributions in making complex cameras a
reality in Linux!

[1] https://lpc.events/event/18/contributions/1679/

-- 
Regards,

Laurent Pinchart

