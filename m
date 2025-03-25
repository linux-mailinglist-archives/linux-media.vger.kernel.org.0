Return-Path: <linux-media+bounces-28663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1519A6EDB3
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 11:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61B6B7A603E
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 10:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285D22566E6;
	Tue, 25 Mar 2025 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BskLLQPd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C756A2566DB
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 10:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742898503; cv=none; b=WAFwZZuwXUHuMimSG81zHMu5rmwR5EpmtesmaBSEB+n7vwj2ZRWGluruao66rIvIM/ps0ENMhOQ7MZxvYBSfN0yNtirC3Up8WTuK4LFzJ15LIjMi84yk/fkR+TOmDt/sCkncCErip817j710uuT2HvGT1c/rzPZmsXEK3o/e6I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742898503; c=relaxed/simple;
	bh=2WllegJn3dI3mVcqnnJf3tAa0z6QRjw4+Vgi6CoQ0W4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EAMr7bgF56YdpplgEKXQUliF/w5rt00geEtScS+D+7lyLqyEZckzjTnSM4jmVmO2IrZZidKRnBQsYf9bYTtmP8+6KHUOvkf86pB9qRa/NEPAB8sI3Y5ofucS0ekmmeKU0j7LvLUqGsZekmQXMlmMW3flLNqMeqgXpkVtbFMn8bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BskLLQPd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE9A4594;
	Tue, 25 Mar 2025 11:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742898386;
	bh=2WllegJn3dI3mVcqnnJf3tAa0z6QRjw4+Vgi6CoQ0W4=;
	h=Date:From:To:Cc:Subject:From;
	b=BskLLQPdWg8RAEs+MKQeCezQ401EJvhyWo6S1j1C8f5vQKszyAtHC+kO+0QLlzWt1
	 sbqwJKiPbfMimg3OSNh+l7teccBGF00UXvy1RmXHS8SWcnGhC3yS2yGfAWXgWVwjYu
	 17XSsUN69KjkdEddwDCRbndQNuiG/W0I0ACkFhWk=
Date: Tue, 25 Mar 2025 12:27:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250325102750.GE20035@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello everybody,

Another year, another libcamera workshop. After the previous editions in
Paris, Brussels and Vienna, we will organize the next workshop in Nice
on Friday the 16th of May. The event will be hosted by Embedded Recipes
([1]) as part of their workshops day ([2]).

This year, our workshop will be colocated with the Pipewire workshop on
the same day and at the same venue (but a different room), to facilitate
discussions about topics that span libcamera and Pipewire. The Linux
Media Summit will also be organized in a nearby location on Tuesday the
13th ([3]).

If you would like to attend, please register your interest by replying
to this e-mail, and indicate if you have any discussion topics you would
like to include in the schedule. We will draft and circulate an agenda
in the next few weeks after receiving topic proposals. If registrations
exceed our capacity, priority will be given based on topic submissions.

The event will be free of charge for attendees.

[1] https://embedded-recipes.org/2025/
[2] https://embedded-recipes.org/2025/workshops/
[3] https://lore.kernel.org/r/044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl

-- 
Regards,

Laurent Pinchart

