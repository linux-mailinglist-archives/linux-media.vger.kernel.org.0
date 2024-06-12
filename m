Return-Path: <linux-media+bounces-13113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39840905D00
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E14BE1F21810
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3820184E0A;
	Wed, 12 Jun 2024 20:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="In+1rT8x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0A384DF1
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 20:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718225053; cv=none; b=qZsw1/BfnP50ShVJgba8d1ugpcmehCNRxDjiVRwLKgcjKTpL9VPEF5muqyu7IjNvf545lPZTHB15ZZke0gzL9eOaQEUYZ381mvz184HPUMUB4HbNYYpfmAhxdT19NRR496ATDiWZ8ybPKdfkTc7ecWT74TWDj5UjAe19u3hRs3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718225053; c=relaxed/simple;
	bh=+Jt5kEktEP1KG2R8UNNW2tpDDNXeeGCljnyof8/ghJU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kG0K8dSO/TqD/3dXFi2BhhfGWxj8kO1ihEn0xxl1zfBAEkiD2wHCl0k5a3sPq/yK1rx/hIUxXCElzGWQ7xHSTeRtWMhhiM3YktyH5xwJpaZmLekmWDoJ4QqiHQW7EoOQoL9SCZmym11Cgz2OOxcimpuKnBDGZovM95fifzl2Rgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=In+1rT8x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7481CC116B1;
	Wed, 12 Jun 2024 20:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718225053;
	bh=+Jt5kEktEP1KG2R8UNNW2tpDDNXeeGCljnyof8/ghJU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=In+1rT8xXx1BEuEG2pC/9J6tyfQLk3EZhx5i62ienv+WjKryXdJ/4t2RPDH9ip67T
	 oL+N5V5ZLIinCzQvaoxdNsgL4YgLWkl2bQPEOGOphDzCZbW8rBdkcSt/9ert1j8Y7s
	 0i5xcYXvBTk+C5Qi565ILidrZ6t0YXurSejymfP7LjlVUt4ME91LhAZeYU1BkOer7g
	 lKY163gBJvZLX4rQjEhp5m8lhRhA810dD6ytPZlxadgbuL9dOzOzk83+kKQFi/AXjw
	 UvkRq8bwJkLhnCrbrLUUPMMOa4eu7lbc4d2SUJyyZs+yUK2G5uyDs9O2uEGTMm32YW
	 nnYW5TFERHWXg==
Date: Wed, 12 Jun 2024 22:44:06 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Daniel Almeida
 <daniel.almeida@collabora.com>, Hidenori Kobayashi
 <hidenorik@chromium.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Sean Young <sean@mess.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <20240612224406.41dd88fc@coco.lan>
In-Reply-To: <20240612083430.GE28989@pendragon.ideasonboard.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
	<7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
	<CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
	<2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
	<20240612095448.1e99b751@coco.lan>
	<CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
	<20240612083430.GE28989@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 12 Jun 2024 11:34:30 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Focussing on this topic, if we're brainstorming memory management for
> media devices, I'd like to throw in a controversial idea. In addition to
> being clearer on the fact that USERPTR is deprecated, I would like to
> deprecate MMAP too and only focus on DMABUF. I believe Linux needs a
> centralized buffer allocator, instead of having multiple allocation APIs
> scattered in different places. There are design ideas in gralloc that we
> could benefit from.

Deprecating USERPTR is doable, as not many apps use it, and they're
mostly focused on complex camera/ARM scenario. Now, deprecating MMAP at 
V4L2 core is a different history: lots of different userspace programs,
including browsers and proprietary apps like zoom, etc. rely on MMAP
support. We can only consider deprecating MMAP once applications switch 
to DMABUF.

Thanks,
Mauro

