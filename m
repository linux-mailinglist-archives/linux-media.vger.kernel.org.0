Return-Path: <linux-media+bounces-12207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C006E8D424E
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 02:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CF71283A41
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 00:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A611B8828;
	Thu, 30 May 2024 00:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="VrM+HlWy"
X-Original-To: linux-media@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8E536B
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 00:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717028557; cv=none; b=Z/5CuEW0Hk3E7k/y8UVzviibsYhTlQJ+ebPhAxsUkNIhDJB5fQ4BWM0GeRWWjBpkNtkhffk1pifELmPSwY4s/csziCpAmRH5LnHuK9hQ3x08QCJHo/R9RJ8TL3K7zxiLNp459smUnSA8As+knxNSKTIuSmjHFId0lvlu8Mm8/EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717028557; c=relaxed/simple;
	bh=3YvoyIyeHlPcQ+qP7FZ8wCiJvObylauJHrD8vHHeh8w=;
	h=Date:From:Subject:To:Cc:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L2MSsEEKdtafMZqth2El8Rp3ioKdzldfZAf5EufZAgQh9881VGPYjwmKfBvBVQWNYOVKRYBqXFjzhy2JWZ9DrTtHcuMRiUzdj6pmq2PhgvijGs/hMxeD4elk7bXOd2GcF0S+64raxEkQgzR059nf20t1EpEfM9n1I87uHC6qBxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=VrM+HlWy; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Envelope-To: mehdi.djait.k@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1717028553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWdQIaU8VD8eDUpjBsSBJEcY19/AoaLeCk5Wvm3mzf0=;
	b=VrM+HlWyax8yE8du0ddSo7hL+gPaJ8485nub0XbhB1+7vFVx4hVHwMe1j9m49RIHfW3cFC
	kOEgzpgTMwI9hjkZXf84Nf96rgNQdVpl9JEuyiShO8RzjjP2emOHh/aaqOiPAUy8HsDCB0
	kzcUkuendu4YJhlifvv/nte9ZUCmvgk9gTSypXQU2eB0QkwsKpCXc5y7M326dsLT/mhkEi
	01p5j+N0h1ugqFEYBrqJw6QWtniSz7l+lQmzEIiJaLjriJYgbEJhfNCTdHN5xGUrBAJUnw
	PnwagxmnvWaRtys58OOjQjgznNQh18K6wEBI5216PvVYbfaw8O3zTeAYVKzpiA==
X-Envelope-To: mchehab@kernel.org
X-Envelope-To: heiko@sntech.de
X-Envelope-To: hverkuil-cisco@xs4all.nl
X-Envelope-To: krzysztof.kozlowski+dt@linaro.org
X-Envelope-To: robh+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linux-media@vger.kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: thomas.petazzoni@bootlin.com
X-Envelope-To: alexandre.belloni@bootlin.com
X-Envelope-To: maxime.chevallier@bootlin.com
X-Envelope-To: paul.kocialkowski@bootlin.com
X-Envelope-To: michael.riesch@wolfvision.net
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: mehdi.djait@bootlin.com
Date: Wed, 29 May 2024 21:22:07 -0300
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
Subject: Re: [RESEND Patch v13 2/3] media: rockchip: Add a driver for
 Rockchip's camera interface
To: Mehdi Djait <mehdi.djait.k@gmail.com>
Cc: mchehab@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com, maxime.chevallier@bootlin.com,
	paul.kocialkowski@bootlin.com, michael.riesch@wolfvision.net,
	laurent.pinchart@ideasonboard.com, Mehdi Djait <mehdi.djait@bootlin.com>
Message-Id: <VOV9ES.1808A7M5SYMM3@packett.cool>
In-Reply-To: <715d89214d1ed6a8bb16cbb6268718a737485560.1707677804.git.mehdi.djait.k@gmail.com>
References: <cover.1707677804.git.mehdi.djait.k@gmail.com>
	<715d89214d1ed6a8bb16cbb6268718a737485560.1707677804.git.mehdi.djait.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

Hi,

On Sun, Feb 11 2024 at 20:03:31 +01:00:00, Mehdi Djait=20
<mehdi.djait.k@gmail.com> wrote:
> This introduces a V4L2 driver for the Rockchip CIF video capture=20
> controller.
>=20
> This controller can be found on RK3066, PX30, RK1808, RK3128 and=20
> RK3288,
> but for now it's only been tested on the PX30.

I've been testing it on an RK3066 tablet I'm bringing up mainline on,=20
recently figured out the clock situation that made the cameras appear=20
on I2C and got a camera driver to attach, but still not getting a frame=20
and will need to debug more.. Since you're familiar with the hardware,=20
could you quickly tell me what exactly causes the CIF interrupt to=20
fire? Is it a signal from the camera?

Anyway, two things I noticed with the code:

> +static int cif_enum_input(struct file *file, void *priv,
> +			  struct v4l2_input *input)
> +{
> +	struct cif_stream *stream =3D video_drvdata(file);
> +	struct v4l2_subdev *sd =3D stream->cifdev->remote.sd;
> +	int ret;
> +
> +	if (input->index > 0)
> +		return -EINVAL;
> +
> +	ret =3D v4l2_subdev_call(sd, video, g_input_status, &input->status);
> +	if (ret && ret !=3D -EOPNOTSUPP)
> +		return ret;

v4l2_subdev_call actually returns -ENOIOCTLCMD when the camera driver=20
does not handle the requested call.

> +static int cif_plat_probe(struct platform_device *pdev)
> +{
[=85]
> +	ret =3D devm_clk_bulk_get(dev, cif_dev->match_data->clks_num,
> +				cif_dev->match_data->clks);

This looks like it's just modifying the `static` clocks array shared=20
between all instances of the driver and not copying the clock=20
references into the instance's private struct.

Thanks,
~val



