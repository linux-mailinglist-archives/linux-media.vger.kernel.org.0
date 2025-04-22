Return-Path: <linux-media+bounces-30702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB25A9670F
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 13:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C68F3BB5AE
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AA8278176;
	Tue, 22 Apr 2025 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X8gr4o93"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9B5277817
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 11:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745320371; cv=none; b=oGmizuEr3pyocKtrmXOVxPZC77Bre3dMCuZhejVLDPxrluSzQqmqV4WGVfBYUdyCet3z589CZ5lRvfhaIcofT8V4c9zwNJJBvWNX3jCklkIU0iO0EWjzZVLm+DebHsbuVnI2zQ5sH5lIDQGLGY+Dp1Y278EfoYK/sexGv6Wkq8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745320371; c=relaxed/simple;
	bh=/AqD3DBQfAbYBg8MH4Bq4F81BC3JQ+anRBxTuW1/VZk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=T89f1/QvjDMKqkD+wYXMyrkAWRIFxnZX7GNkklh0EV037J//f3FN7XZ7liH0Pv6MiYxLgRsnORAl0iRB/32YMukr0Dw7hf/lbyImFHPym+dJ/k1eWnLe54gxP1GDkiyYyReJEXLSBCZeLk7bJScz/2ADHTk042lzT7lI+pGg2u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X8gr4o93; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD431666;
	Tue, 22 Apr 2025 13:10:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745320234;
	bh=/AqD3DBQfAbYBg8MH4Bq4F81BC3JQ+anRBxTuW1/VZk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=X8gr4o93vLr+bCGst7wi++zvwl60VHRMGGDjx92OXANEyE25xM4/A6im6sU62N7la
	 wtUyZmYSkTIuc0kpkO3lLR6gkQtA+X5974P5rVfh4uGbvOgLmgKujxjRmQHTtGudwz
	 1AR3J7/t5TH4C+uQ4D8Yw3RRAa8xFrj5bx2nsFX4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250325102750.GE20035@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, libcamera-devel@lists.libcamera.org
Date: Tue, 22 Apr 2025 12:12:39 +0100
Message-ID: <174532035914.2882969.16916308358645644160@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Laurent,

Quoting Laurent Pinchart (2025-03-25 10:27:50)
> Hello everybody,
>=20
> Another year, another libcamera workshop. After the previous editions in
> Paris, Brussels and Vienna, we will organize the next workshop in Nice
> on Friday the 16th of May. The event will be hosted by Embedded Recipes
> ([1]) as part of their workshops day ([2]).
>=20
> This year, our workshop will be colocated with the Pipewire workshop on
> the same day and at the same venue (but a different room), to facilitate
> discussions about topics that span libcamera and Pipewire. The Linux
> Media Summit will also be organized in a nearby location on Tuesday the
> 13th ([3]).
>=20
> If you would like to attend, please register your interest by replying
> to this e-mail, and indicate if you have any discussion topics you would

I'd like to attend please ;-)

> like to include in the schedule. We will draft and circulate an agenda
> in the next few weeks after receiving topic proposals. If registrations
> exceed our capacity, priority will be given based on topic submissions.

I'd like to add a topic for :

MAINTAINERS:

We now have many separate people working on different areas of
libcamera:

 - How to clarify who is responsible for given areas of libcamera
 - Should we bring in an equivalent MAINTAINERS and
   scripts/get_maintainer.{pl,py,sh,..} file

Hopefully this can help make it clearer who's responsible for supporting
given patches and hopefully that could make it easier for contributors
to know what's required to get patches merged.

(perhaps that topic then extends to ... does everyone know what it takes
to get code merged ....)
--
Regards

Kieran


>=20
> The event will be free of charge for attendees.
>=20
> [1] https://embedded-recipes.org/2025/
> [2] https://embedded-recipes.org/2025/workshops/
> [3] https://lore.kernel.org/r/044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all=
.nl
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

