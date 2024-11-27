Return-Path: <linux-media+bounces-22170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 002FF9DA73D
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A234E165C9D
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 11:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77571F9EB5;
	Wed, 27 Nov 2024 11:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGCnhKAb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32D51F9AB9;
	Wed, 27 Nov 2024 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732708461; cv=none; b=VASv/rhiXbU92U0XZGRxFO8k8M/0kDp7BvzB465PIcmcJZL+stvazBsteDl2vDb/JjxPIndUGN6rXUMuRvD0bjQs9i6J3VwH50Dp5L7Tl0/n8bjXNr0HTHRACL2e07vCAStp+8Mz/amlY4POuvR+LRpTPcgzgmP/JJDVuJhypDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732708461; c=relaxed/simple;
	bh=ingiu8Is0gIqc7ye0l8v05VsgLPVlyvjFoKYuB7VVfo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gD6LwS5h6Shn4iEd0uX8R4KsPGJdAH4HGkZPKSgY8eqwEQgD65JRzynLl8r5VfUHRsLPa0SyTXdtI5Od8PNnSoEXuT96uAWQrJJtyDdqn6PPeC1Vmu6EGqi3qN33VzhdgeT8OOWKTvK5Khno3+OUhH/VCk0bZ594O2HMyKTZUbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGCnhKAb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA875C4CECC;
	Wed, 27 Nov 2024 11:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732708460;
	bh=ingiu8Is0gIqc7ye0l8v05VsgLPVlyvjFoKYuB7VVfo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dGCnhKAbHbqJ7sDumaQsHH6FS0bKbCou1rtVCQPfGoQuJOXWlL9viE1KumuJr0VuF
	 ZHLVxorsNhisc4O3C83gfvGgJ9IezEP1ZruG0/cG6PignglPSDfczcPURm/5dnTUrz
	 2TDS0EzyLxVRImdoodhCse3TRoH9KaDeIPVfRtZYqaOVnPnjm1ODIMADZ1Qdq7N2kr
	 lgutNJq5N5njb0x6DSYj80sGvsn3649atx+RepNAWxzDCNjaDQ8tYUiQAD4X8H7Fer
	 cJY5MVRhH+/XCzgwZDAqBNwW3D3Qp4badom/TmyoQVTm3vOpHPZoYxr5d0DcWL56PA
	 8hXj+JejvPbkQ==
Date: Wed, 27 Nov 2024 12:54:15 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241127124629.704809f1@foz.lan>
In-Reply-To: <20241127103948.501b5a05@foz.lan>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
	<20241126151930.GA5493@pendragon.ideasonboard.com>
	<20241127103948.501b5a05@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 27 Nov 2024 10:39:48 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> > This workflow doesn't apply to patch submitters who are not allowed to
> > send pull requests and who don't have direct commit access. I thought
> > these submitters are the main audience of this document. In that case, I
> > think moving the next section that explains the e-mail workflow before
> > the "Media development workflow" section (which should likely be renamed
> > to make it clear that it is about merging patches, not developing them)
> > would be best. The "Review Cadence" section could also be folded in
> > there, to give a full view of what a submitter can expect.
> > 
> > This would also have the advantage of introducing the linuvtv.org
> > patchwork instance, which you reference above. Documents are more
> > readable when they introduce concepts first before using them.  
> 
> Will try to do such change at v2.

Actually, both workflows (a) and (b) apply to the ones that can't
send pull requests or push at media-committers.git:

---

a. Normal workflow: patches are handled by subsystem maintainers::

     +------+   +---------+   +-------+   +-----------------------+   +---------+
     |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge      |-->|media.git|
     +------+   +---------+   |request|   |in media-committers.git|   +---------+
                              +-------+   +-----------------------+

   For this workflow, pull requests can be generated by a committer,
   a previous committer, subsystem maintainers or by a couple of trusted
   long-time contributors. If you are not in such group, please don't submit
   pull requests, as they will likely be ignored.

b. Committers' workflow: patches are handled by media committers::

     +------+   +---------+   +--------------------+   +-----------+   +---------+
     |e-mail|-->|patchwork|-->|committers merge at |-->|maintainers|-->|media.git|
     +------+   +---------+   |media-committers.git|   |approval   |   +---------+
                              +--------------------+   +-----------+

---

No matter who sent an e-mail, this will be picked by patchwork and either
be part of a PR or a MR, depending on who picked it.

Thanks,
Mauro

