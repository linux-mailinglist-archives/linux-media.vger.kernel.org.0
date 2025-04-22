Return-Path: <linux-media+bounces-30710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88212A968B3
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 14:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1A81892161
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 12:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901B927C842;
	Tue, 22 Apr 2025 12:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ooVdr9cQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072774A3C;
	Tue, 22 Apr 2025 12:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324188; cv=none; b=r0O1bz4x2n3cmgpobSXJnfh3OPfs988g2uxYX1u/qrk1OQ/LeARWtLYim6+CP9rXKrb6th744BviEu8OfCGgZ0JxLqGgjlsg62rDlwasRv0kmyMtmvD8e5Sg30MiIvPjgQrIL+IRRykYvrU4MsslhrEvyysxucdi1za6Lkrl/jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324188; c=relaxed/simple;
	bh=yU/rworGYWLUH02sbs7bbFRHcYRTKJEvHwwBIU0rynA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oznPxkBTVq4xdHCYaDYbh1nYBz12HyMeFfWz9uKlgd7EW6Auc9a0Day2ZiRArrCn6qms4IoIW8kxrdi4Hl9G0X7+oGR7pl5p6VaU8XuHVvI2zKUcvf4cGEn8Iu1C6q5LB8lD/zqCpqmo724TSOhRzxVYjv9O9LS0rSQnwnjpn2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ooVdr9cQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB84D250;
	Tue, 22 Apr 2025 14:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745324056;
	bh=yU/rworGYWLUH02sbs7bbFRHcYRTKJEvHwwBIU0rynA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ooVdr9cQP0vk2KzZ0fRo5K+mVPfQm9T/E1ChFpwEoK1GHUKh7+HKtq34wAmESjW0z
	 0a1FTKqbp28A53Afh2uir/xPCOTgq7/X3WTqjTim27Nvk45KNgPYk9RopoZKulHuYa
	 ny62nEc3XtstlmB8IK2+MyEMcN454ViBAMODZMIk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8411984d-2475-4d65-a66f-dc7076fa0ca0@ideasonboard.com>
References: <20240830062639.72947-1-umang.jain@ideasonboard.com> <8411984d-2475-4d65-a66f-dc7076fa0ca0@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] media: imx335: Support vertical flip
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, open list <linux-kernel@vger.kernel.org>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
Date: Tue, 22 Apr 2025 13:16:20 +0100
Message-ID: <174532418087.2882969.18298736657743021659@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Sakari,

Quoting Umang Jain (2024-10-02 04:53:40)
> Hello all,
>=20
> Can this be collected ?

v2 was already just a resend.

Would you like this to be resent again? Is there anything blocking
collecting these patches?

--
Kieran


>=20
> Thank you!
>=20
> On 30/08/24 11:56 am, Umang Jain wrote:
> > Hi all,
> >
> > This work intends to supprt vertical flipping for IMX335 driver.
> > 1/2 contains a small drive by fix, to rename the mode struct name
> > 2/2 introduces the support for vertical flip for the mode.
> >
> > changes in v2:
> > - None, just a resend over latest media-stage
> >
> > Umang Jain (2):
> >    media: imx335: Rectify name of mode struct
> >    media: imx335: Support vertical flip
> >
> >   drivers/media/i2c/imx335.c | 77 +++++++++++++++++++++++++++++++++++---
> >   1 file changed, 72 insertions(+), 5 deletions(-)
> >
>

