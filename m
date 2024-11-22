Return-Path: <linux-media+bounces-21849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 180F59D63A1
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 18:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5E27283010
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 17:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498F51DFDA1;
	Fri, 22 Nov 2024 17:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="F7U2Mfnf"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233CE1DF755;
	Fri, 22 Nov 2024 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732298109; cv=none; b=CVCQ6+fH2mDruO5Lsgm5RiUpKqV1wxvKNEuUwyoDYD+MtCxuPBOqa4kiKo7Nn14ShuVOGkY0hSHXhtc8/A2fQAdQz82hWrfBpsGPQJikvhojt+aMgrq28WHNj2vFws1RiX9emLB6SmoRMha+Kqwg1fPVXAECwwrEDHpd5dbA4KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732298109; c=relaxed/simple;
	bh=iOBhYtUF2isu8Lu3FDi/V7/0/RV+roJcuIlvBzIlqSE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lCTViuZYSd20YhFQar/UmZz1N4AByy656vf6bLqBAyODwOXiGYYGw7SEklyGub8wjnRA8ZazgtQbUInFevcwawXEF4LfUU29UhDa/2F5cG3CPWMwrBUiCZMps6K594y3IvD8Yp8BLZryCUI0ImRcFQGOkCt1uoekshNZLWJ1dj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=F7U2Mfnf; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 30B34403E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1732298107; bh=iOBhYtUF2isu8Lu3FDi/V7/0/RV+roJcuIlvBzIlqSE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F7U2Mfnfp46TEp8QSAMymIMSNoXkgPmqGJC2+HHbXJx0ydVOZufawZUcKRXbONU4h
	 /RkVz5kaz3M5mzfQGQmeSeQkiwNC7ZjuvoPKldBxP1czXpYPx23tlXW/dO36jkQw5J
	 qdDd/LgVOqytapPawynvvu+aLEbXfQYkBFIPZketm+5cVWz+Nnym16F0hjqU2wAUVL
	 02ML45pgoifCMBz/V2bdXa49uh+Jo2OpsLKV4GGRhIMiDbnmkkQuBF/8gZkn204M98
	 diq6NlFiswjeu324jjUUtgpru71dfYotooVYhcAUkyPI2jBq2Ppkxb9ZTPIvQMOCAr
	 3OzW64ziq0/FQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 30B34403E5;
	Fri, 22 Nov 2024 17:55:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: rdunlap@infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, kernel@collabora.com, bob.beckett@collabora.com,
 nicolas.dufresne@collabora.com, Sebastian Fricke
 <sebastian.fricke@collabora.com>
Subject: Re: [PATCH v3 0/2] Documentation: Debugging guide
In-Reply-To: <20241028-media_docs_improve_v3-v3-0-edf5c5b3746f@collabora.com>
References: <20241028-media_docs_improve_v3-v3-0-edf5c5b3746f@collabora.com>
Date: Fri, 22 Nov 2024 10:55:06 -0700
Message-ID: <87ed332lxh.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sebastian Fricke <sebastian.fricke@collabora.com> writes:

> The series contains:
> - a general debugging guide split into debugging for driver developers and
> debugging from userspace
> - a new summary page for all media related documentation. This is inspired by
> other subsystems, which first of all allows a user to find the subsystem
> under the subsystems page and secondly eases general navigation through the
> documentation that is sprinkled onto multiple places.
> - a guide on how to debug code in the media subsystem, which points to the
> parts of the general documentation and adds own routines.

OK, I don't see any real reason to send you around on this again; I've
just applied it, thanks.

jon

