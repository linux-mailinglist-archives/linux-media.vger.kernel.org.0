Return-Path: <linux-media+bounces-14134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA969172E5
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 23:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55C301F22345
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 21:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F2F17C7D8;
	Tue, 25 Jun 2024 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="O1Z3J6j/"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2294AEF6;
	Tue, 25 Jun 2024 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719349330; cv=none; b=BgV01UtzPedx2LzyB8eXpIDf1LEW34q1hgwLvu6kk0LeKW7IHY0H5ceD/Xxh9tZwRzTUfXEQEoqRQbPG3Tz/VksJzEM10tmuUErNktElnQq85L9nRbcR4/Pb575tqzqAY7tWYZfL+Iq2a/mEqyl5VhMRySSYejuX0aL63w2aisI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719349330; c=relaxed/simple;
	bh=oPUDlkfv0gEekjFbV6jVfcu42BSrPDFRKT4kEPq3Fa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmPQQ1nNdd8Vh9+tFvKWAYpR8h8p9ot+67BkOvXGF+coeBDd26dRjesQrICDva4FOcb+xKh9kZADCwkIudLnTPCmEls4M2TlJMLvMGkJB7TUB4z/O4HNpqLVnM1vsW8S7+yl1YuXaiTgQ+lTU7/Pzsy7hqEdQG30HEvCFLZtQyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=O1Z3J6j/; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1719349319; bh=oPUDlkfv0gEekjFbV6jVfcu42BSrPDFRKT4kEPq3Fa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O1Z3J6j/hQmrRC3b9ij6pFY2iXVX+GAIltaIroXBbdL18HMK7+iXMM/SFKs7vk4H9
	 9zgeXGSkj2GSTGt6HmnkK1UasutPnSCq4c++rE8AQZeDRSvowcu3r7cvoTDD3PCTC8
	 lPLUmNPv9Hm03bktto0r1BrkjXZBeN2696ixOjL1BSQA91P2+XBYRfFQmDXgq84y+i
	 6aLbeyvUnt1xZLm2hAAFXW6Khot9dpAntUp5ejedCAY+2+ffOHPMywKo5UwDPf6JRf
	 flQzxNORJk06sWuekXhOnblAWA9vgTV2uSL/46UxcT7OPlHqQHsws2bcuzlhEY1Fda
	 5GNOsCeW2RZUQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id ABB231007EC; Tue, 25 Jun 2024 22:01:59 +0100 (BST)
Date: Tue, 25 Jun 2024 22:01:59 +0100
From: Sean Young <sean@mess.org>
To: Nils Rothaug <nils.rothaug@gmx.de>
Cc: hverkuil@xs4all.nl, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, mchehab@kernel.org
Subject: Re: [PATCH v2 0/5] media: em28xx: Add support for MyGica UTV3, its
 IR remote, and its tuner
Message-ID: <ZnswR9q-JrD4kSa9@gofer.mess.org>
References: <20240623104647.7697-1-nils.rothaug@gmx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623104647.7697-1-nils.rothaug@gmx.de>

On Sun, Jun 23, 2024 at 12:46:42PM +0200, Nils Rothaug wrote:
> Changes in v2:
> 	1. Split v1 patch 4 and rc changes from v1 patch 2 as
> 	   recommended by hverkuil@xs4all.nl
> 	2. Patch 1: Drop empty line to fix checkpatch warning per
> 	   feedback from hverkuil@xs4all.nl
> 	3. Patch 4: Fix indentation in em28xx-cards.c line 2614
> 	4. Patch 5: Fix comment per feedback from hverkuil@xs4all.nl
> 
> Nils Rothaug (5):
>   media: tuner-simple: Add support for Tena TNF931D-DFDR1
>   media: rc: add keymap for MyGica UTV3 remote
>   media: dt-bindings: rc: add rc-mygica-utv3
>   media: em28xx: Add support for MyGica UTV3
>   media: em28xx: Set GPIOs for non-audio boards when switching input

Looks good. For the whole series:

Signed-off-by: Sean Young <sean@mess.org>

> 
>  .../admin-guide/media/em28xx-cardlist.rst     |  8 +++
>  .../admin-guide/media/tuner-cardlist.rst      |  2 +
>  .../devicetree/bindings/media/rc.yaml         |  1 +
>  drivers/media/rc/keymaps/Makefile             |  1 +
>  drivers/media/rc/keymaps/rc-mygica-utv3.c     | 69 +++++++++++++++++++
>  drivers/media/tuners/tuner-types.c            | 21 ++++++
>  drivers/media/usb/em28xx/em28xx-cards.c       | 52 ++++++++++++++
>  drivers/media/usb/em28xx/em28xx-core.c        |  3 +-
>  drivers/media/usb/em28xx/em28xx.h             |  1 +
>  include/media/rc-map.h                        |  1 +
>  include/media/tuner.h                         |  1 +
>  11 files changed, 159 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/rc/keymaps/rc-mygica-utv3.c
> 
> --
> 2.34.1
> 

