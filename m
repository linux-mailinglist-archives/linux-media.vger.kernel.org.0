Return-Path: <linux-media+bounces-40231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 348AEB2BA98
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DDF1582000
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA2B2857DE;
	Tue, 19 Aug 2025 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W3r7EgcO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FDF2773C0;
	Tue, 19 Aug 2025 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755588041; cv=none; b=NOqUuB1+3WDdGCemiB17yusK2lbt0GKVLmGmKL89cjw6tx07oSa1rSg0t7Yk2TMhsrvU4qnSaBKpmsrLSzsMtXnQudfr0bXhd/xpR2Hc5NzAy25B5kDGcS56VqzoCcN5yy0rGxmEOAbfCDQpAPQuomHFYwz21k9OcHibwscWICc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755588041; c=relaxed/simple;
	bh=lTuLnyT84FBRu2aq3prLt4zUqq40rQdhPtmTnDZdvi4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=IBikTIyzwGWSOkHWFh8RQYrzXWfnrM9t2rnOqffPFkfliES9a5EtKnubtTcKi7dkJGJvtUEkuQQD2IOsKdOyGDwwX+6ehjEktqI5ifuPHbuyWsCkqrQm0K4j3k3LiL9uDkofgnMstLH25Dktu0qA/H5PBYjffSyG0C6z+5mnvBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W3r7EgcO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.80.157])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CE05596;
	Tue, 19 Aug 2025 09:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755587981;
	bh=lTuLnyT84FBRu2aq3prLt4zUqq40rQdhPtmTnDZdvi4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=W3r7EgcOBlNacEFpX73Qvrfc/wMU8QqWTqLz3k3vT9SwTus8wud/iiWSzeXJrrLup
	 nY1cwEze9RERyyVFT0ZV7zISjeNscMvCcNquiQXZoVnbLE3T4zK8tZ+MFxsUpseVve
	 gR0+YLkhAZf5qz8IVgcskdVMFO1gofejUbD0K2Rw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aKMnO4UhaVW0X_v5@kekkonen.localdomain>
References: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com> <20250813-imx335_binning-v1-5-a42b687d8541@ideasonboard.com> <aKMnO4UhaVW0X_v5@kekkonen.localdomain>
Subject: Re: [PATCH 5/6] media: imx355: Use subdev active state
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Tue, 19 Aug 2025 12:50:24 +0530
Message-ID: <175558802461.1633224.1538075902903518574@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Sakari,

Quoting Sakari Ailus (2025-08-18 18:44:35)
> Hi Jai,
>=20
> Thanks for the set.
>=20
> On Wed, Aug 13, 2025 at 12:50:36PM +0530, Jai Luthra wrote:
> > Port the driver to use the subdev active state. This simplifies locking,
> > and makes it easier to support different crop sizes for binned modes, by
> > storing the crop rectangle inside the subdev state.
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>=20
> It'd be nice to switch to {enable,disable}_streams, too. Just an idea. :-)
>=20

Indeed, will give it an attempt before v2 :)

> --=20
> Sakari Ailus

