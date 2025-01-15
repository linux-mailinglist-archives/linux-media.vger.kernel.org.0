Return-Path: <linux-media+bounces-24812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C04E7A12BE9
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 20:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B6A53A7258
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 19:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDDE1D79A0;
	Wed, 15 Jan 2025 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z2hzI/H0"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD131D5AC3
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 19:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736970217; cv=none; b=IzpB4M0xZUbOiFVnJsW+VDlo3+N1P1lWOD6KCi21XM8yKHTkKg2LgkwJ5nk34mOH79/KwQFHFtxErRxISAKn2LRASXHOqPCy0TJDYmN/o1rGG7SduznDL3A1/JUFV4MmuesLmzuA6s65p6yfADZV33FWAobYKBG9vF0LdxnFsRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736970217; c=relaxed/simple;
	bh=cYFpbBlXuxVwB2nf68TTMId6mR88iIP1fXRCsAWU444=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jZJtb26nk/Fg5sA0mjQrZ28B0VmUVYgbhJKL4JrEZ+OunZ9BAfhe6d+jkjCP4oizi930V40JMx9jf5eUVTzJvGdmgRkPBxjPr7xrT2uGLEOYR6z9+904RoeaR+fLXStL2rjrsTvSW8xHwq+0rGG7j8RY+XGTiOMyVIr6HA8Ir4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z2hzI/H0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736970213;
	bh=cYFpbBlXuxVwB2nf68TTMId6mR88iIP1fXRCsAWU444=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Z2hzI/H0s1+A4sRaOO7CRXGAqC/55X9KBEyxW/lFKkTHYNgnboa1NmlyLPIRQMHS/
	 AJELJyviHR52a4RRM9FjUO5+W8dhqw5cwe8EZIP0IPqy4O06OcWzmjBKiQfZddmoyZ
	 8W6fmgg4CpmHGuTdwquzLF6de6l7ugdbZumnwlx3nNDl0xv2hw7SojkQdbTI1R+uWL
	 LQi35W9aTBJbefQiZ/Fqn/qy7Y9fFds9Lde7JjGVLLp2RF0ycAuyDC5zSG8az/7uF1
	 DJ0ldggfaHMa1AlWpfoC8dntzA0+v//TAMLogb4H2tt51jzIZ6PeaAjDdKpiXME+f1
	 gpKmBt16FEmZA==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E5D2D17E0DE6;
	Wed, 15 Jan 2025 20:43:31 +0100 (CET)
Message-ID: <9def2b5d38b338c31be09503805b85206223b36c.camel@collabora.com>
Subject: Re: Hantro H1 Encoding Upstreaming
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Daniel Almeida <dwlsalmeida@gmail.com>, Adam Ford <aford173@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, andrzejtp2010@gmail.com, Frank Li
 <frank.li@nxp.com>, ming.qian@oss.nxp.com,  linux-media
 <linux-media@vger.kernel.org>, linux-imx@nxmp.com, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Gustavo Padovan <gus@collabora.com>
Date: Wed, 15 Jan 2025 14:43:30 -0500
In-Reply-To: <Z4fOScVgLqYEU4Hw@collins>
References: 
	<CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
	 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
	 <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
	 <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
	 <A3476357-8D8D-4B82-8CAB-58370BECF575@gmail.com>
	 <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
	 <Z4fOScVgLqYEU4Hw@collins>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Forking the thread,

Le mercredi 15 janvier 2025 à 16:03 +0100, Paul Kocialkowski a écrit :
> Last words about private driver buffers (such as motion vectors and
> reconstruction buffers), I think they should remain private and unseen from
> userspace. We could add something extra to the uAPI later if there is really a
> need to access those.

I don't know if you noticed, but Jacopo started a proposal around multi-context
media controller. For this type of extension, my long term idea was that we
could adopt this, and introduced new nodes to expose specialized memory. These
nodes would be unlike by default, meaning the default behaviour with a single
m2m video node would remain.

An existing use case for that would be in the decoder space, VC8000D and up have
4 post processed output, which mean up to 5 outputs if you count the reference
frames. So we could set it up:


bitstream -> m2m -> reference frames
              |
              -- capture 1 -> post processed
              |
              -- capture 2 -> post processed
              |
              -- capture 3 -> post processed
              |
              -- capture 4 -> post processed


Simpler said then done, but I think this can work. I suspect it is quite
feasible to keep the stream state separated, allowing to reconfigure the chosen
output resolution without having to reset the decoder state (which is only bound
to reference frames). It also solve few issues we have in regard to over-memory
allocation when we hide the reference frames.

For encoders, reconstruction frames would also be capture nodes. I'm not
completely versed into what they can be used for, also their pixel format would
have to be known to be useful of course.

Nicolas

