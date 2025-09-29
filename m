Return-Path: <linux-media+bounces-43353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39235BAA013
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 18:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B12ED7A1107
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 16:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2519230C114;
	Mon, 29 Sep 2025 16:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hqDOp8JY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025852144CF;
	Mon, 29 Sep 2025 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759162927; cv=none; b=Irl3vgQGb0hB2XONvclljKkHJJshAq4wThGNNuxTOtYVCws4re7SixI1TELVFri4SUxJAsnt/R8MlvU0vtsknb2Mufcxp942hhIIEGVCUPmo7dyJ2lRPkDAtMGQAtViT+XweYS4jgUXW8sMQBt/XZA98XkAWUhwqwfi22sZQz1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759162927; c=relaxed/simple;
	bh=KJIBh56736H2gYsPQzPecNj3YNExm94VfLmG+kW2BUQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Tn/TKkdA94wNb28+pJwN3sRWrIWxuUrHACd8V3FKznIhSvK07zbjHrbiG3tdPHvzohIYL9xKp6TDKZ5+nZ0ztUz+VoOkSZqW6l6+vEMtS3qQvlJe7CRmT7m7pb5uPK0UEwOA3JA74WQz9hG8iMm2sQ2N/iF0SPwG38IdJ1tx84g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hqDOp8JY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.87.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57030346;
	Mon, 29 Sep 2025 18:20:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759162836;
	bh=KJIBh56736H2gYsPQzPecNj3YNExm94VfLmG+kW2BUQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hqDOp8JYlSTbQOHl12lR8t8Tr+LMIQXdgqjBA8Mjth28u56o4NqP4jgXUxS7H5Cah
	 +tctrvNkksJruGrtOK3IxswMQrRI9izDB1H4Aj8a5PlxWf8rgbqdw5eqQUb8d3OCFu
	 xMzh/7gz/FNEv1LbyDlldvxy/c6MwSGfd179I8jg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f7850c68-d255-465e-a549-a5fd70cfaa72@kernel.org>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com> <20250919-vdev-state-v2-8-b2c42426965c@ideasonboard.com> <f7850c68-d255-465e-a549-a5fd70cfaa72@kernel.org>
Subject: Re: [PATCH v2 08/10] media: ti: j721e-csi2rx: Use video_device_state
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@linux.dev>, linux-kernel@vger.kernel.org
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org
Date: Mon, 29 Sep 2025 21:51:50 +0530
Message-ID: <175916291050.2234821.14335723233391402773@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Quoting Hans Verkuil (2025-09-22 13:46:00)
> On 19/09/2025 11:56, Jai Luthra wrote:
> > Use the newly introduced video_device_state to store the active V4L2
> > format for the video device.
> >=20
> > This change allows using a single function for both .s_fmt and .try_fmt
> > hooks, while leveraging the framework helper for the .g_fmt hook.
>=20
> Rather than replying to 00/10, since that is CC-ed to a million people, I=
'll
> reply here.
>=20
> For core framework changes like this I want to see it applied to the test=
-drivers
> as well. At minimum the vivid driver and, if we support this for M2M devi=
ces as
> well, either vim2m or vicodec.
>=20
> The test-drivers are used in the media CI regression tests, so it is impo=
rtant
> that this is implemented in at least some of the test drivers.

Sure, will add state support to vivid in the next revision.

I'm not very familiar with M2M though, and depends on what the series looks
like, but I will give that an attempt.

>=20
> Regards,
>=20
>         Hans
>=20

Thanks,
Jai

[snip]

