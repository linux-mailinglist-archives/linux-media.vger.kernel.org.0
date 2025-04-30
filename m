Return-Path: <linux-media+bounces-31393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F532AA4601
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0C2C9A6ED5
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BA5219A9E;
	Wed, 30 Apr 2025 08:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a0k67r5B"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AE92DC768;
	Wed, 30 Apr 2025 08:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003297; cv=none; b=PDom6og6TqM4UHqJ/OAgfd3zBeZp2qDE/xN9NkeuT3Z1J/NxQkIevaBumC/D/D5JUUb1YBtFSMg4GW7Iqh/tTY2C2Cxsn8rfMHHtK4Mi9efndL0y/9kwJvaB5mxAXDcyO4HxJtb3BvELkD2ZoX7sGjRMh+kyl3Cs2kaF+hC83vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003297; c=relaxed/simple;
	bh=hqpNbv1ndK+wJJDzwcVGDnRE6dB7V/xVAI4gET8aaag=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=A+SClWeza34R4xT1id/IWXWHizGr/12N5z7Mj6RkxsiA9rA2uwUEC81AgFo9/2NaaaqLYBCM9nxdc5Ga0KH1i9yhYvu3EowzRCpittbTjr6+uH9lW6HHrEe6Sai5F9hwWK2T/utNJdTCnyjuc9skAl/VMJOmiEMDawvunTx1LY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a0k67r5B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10C86AF;
	Wed, 30 Apr 2025 10:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746003287;
	bh=hqpNbv1ndK+wJJDzwcVGDnRE6dB7V/xVAI4gET8aaag=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=a0k67r5Bh0KbuWECHjmywEtTTNPyKeZxSQq10Y0At6widSjxNiKDkBnRfov8JBlE6
	 lNlrdGAprnTPB2DyUzkJzwgPtIYLGza9jaYidG+CpYcpio4W/MxNFhfKyogXeiDCJm
	 stiP87bsYTDeEhI8YUL3bEooa+U7Bze/HKGKus3k=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aBHjFcbjR_oPiINu@valkosipuli.retiisi.eu>
References: <20250430073649.1986018-1-kieran.bingham@ideasonboard.com> <aBHjFcbjR_oPiINu@valkosipuli.retiisi.eu>
Subject: Re: [PATCH] drivers: media: i2c: imx335: Fix frame size enumeration
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Date: Wed, 30 Apr 2025 09:54:50 +0100
Message-ID: <174600329094.1586992.9902010088598676539@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Sakari Ailus (2025-04-30 09:45:09)
> Hi Kieran,
>=20
> On Wed, Apr 30, 2025 at 08:36:49AM +0100, Kieran Bingham wrote:
> > In commit cfa49ff0558a ("media: i2c: imx335: Support 2592x1940 10-bit
> > mode") the IMX335 driver was extended to support multiple output
> > bitdepth modes.
> >=20
> > This incorrectly extended the frame size enumeration to check against
> > the supported mbus_codes array instead of the supported mode/frame
> > array. This has the unwanted side effect of reporting the currently
> > supported frame size 2592x1944 three times.
> >=20
> > Fix the check accordingly to report a frame size for each supported
> > size, which is presently only a single entry.
> >=20
> > Fixes: cfa49ff0558a ("media: i2c: imx335: Support 2592x1940 10-bit mode=
")
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>=20
> Thanks for the patch.
>=20
> Cc: stable is required these days with Fixes: tag, I've added it this tim=
e.


I didn't know that. I thought stable tree picked up from the fixes tags.
(Or I remember there was some AI system that was picking them out too?)

I'll see if I can automate/add that to my fixes helper.

Does it need to be in this format?

Cc: stable@vger.kernel.org      # 6.8

--
Kieran


>=20
> --=20
> Sakari Ailus

