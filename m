Return-Path: <linux-media+bounces-24258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52109A01FE2
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 08:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC7CA3A2F04
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 07:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B111AAA22;
	Mon,  6 Jan 2025 07:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jxNHF4Kt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECB715884A
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736148482; cv=none; b=ZCHd1Plr20kUmiqnqOv9CbQB+ZmGqUfx2nlMOTXK2iP2jKGIx5NTY8yx3goCO1ouPhT0EBVeLXer+zXKO9rw42AZp3bpaGJi+/0xSUIFTXBLtK1ofkJTeOwPSekrdOmnkobFImLsWJ2fnKBsJAfz1l6jDeud4EjE+en7fyxIx/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736148482; c=relaxed/simple;
	bh=PbX8fN7IL2KDrQKurGOsP3vJajZEDjsmf3gvOoJkekU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I09IUSOtI2uFj09+iGLfOeDPq9JRXT4/307n5zUknWGkyWEr+d64ewoQzlth/NdMdIilDVLl3R65IR+jZccWvimPdG89JWu6lsTXFOD3GAxVarq6M6LW3pG7r/QH/nff+gs7L+J3ORjiDkpHJrWfVucc4+JyWKheJlUn77mVHkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jxNHF4Kt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BE34594;
	Mon,  6 Jan 2025 08:27:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736148426;
	bh=PbX8fN7IL2KDrQKurGOsP3vJajZEDjsmf3gvOoJkekU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxNHF4Kt004SsVmjofZuZ7ezVhaIkjI7XmQMBmQhP4C0GMqC0k3489oovtWO+fPq6
	 Py3Fd7PrSMajg3dWvjX3LpDeOqBTUbNC+hYmplJHFLomyvk5cVF7FimtoxOIXfAeof
	 s2V+uykXvUXN3ZvX6AubBWxLaSuWOiR/Mn7y7Ozg=
Date: Mon, 6 Jan 2025 09:27:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomasz Sikora <sikora.tomus@gmail.com>
Cc: cascardo@igalia.com, hverkuil-cisco@xs4all.nl, kernel-dev@igalia.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	ribalda@chromium.org,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 1/1] media: uvcvideo: require entities to have a
 non-zero unique ID
Message-ID: <20250106072755.GC5568@pendragon.ideasonboard.com>
References: <CADBf=5nJVddk-yPVw3T5GH9JEPOxnO8McPJHaxtnPBvLCnp42Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADBf=5nJVddk-yPVw3T5GH9JEPOxnO8McPJHaxtnPBvLCnp42Q@mail.gmail.com>

Hi Tomasz,

Please use plain text when sending e-mail to public mailing lists, HTML
e-mails are automatically dropped.

On Sun, Jan 05, 2025 at 07:31:09PM +0100, Tomasz Sikora wrote:
> Issue video camera
> ls -l /dev/video*
> zsh: no matches found: /dev/video*
> 
> 
> 01 15:43:24 Linux kernel: usb 3-2: Found multiple Units with ID 5

What's the issue ?

-- 
Regards,

Laurent Pinchart

