Return-Path: <linux-media+bounces-29520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A22A7E01E
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89B8D189649A
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E172F1C54A6;
	Mon,  7 Apr 2025 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZX9MsYUv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4043119D08F;
	Mon,  7 Apr 2025 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033737; cv=none; b=intF++s9amdQgiZZ7Mr+q51Lla8+CKmXlYMvj8CPJza0SMH8UFlFGMbb16XkbbcJgNFR5ePpb0fAWGec0pTw/O092I18tMIO9vChh61rCZ9gg1S/H3jgKoTvT+ECSwk9MqG7qiGfUuOFH3AZsMNEViVdHAcypV7Fa5kSrEDwr00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033737; c=relaxed/simple;
	bh=Ox7tiIkaCRawomU325EiXwPmeeSjZyj78ZsMxwmOulA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8UFmKuDzVjMXOaRQJ+zjRcGvT3WX+DZfuR5gwOg96USjQErNf9Rk07KDTC2AaEtVYEwDrXP9PyEoSADUIbZvj0k/zyPLvphcoVJgYMA570NxM0Hw19aKI++ZJ+vps7h6gG9+8G+R+r69kzYsvJGXNGBIjismZ3sT5iucpBSh54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZX9MsYUv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992B7C4CEE7;
	Mon,  7 Apr 2025 13:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033736;
	bh=Ox7tiIkaCRawomU325EiXwPmeeSjZyj78ZsMxwmOulA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZX9MsYUvCLd0WfNshTif2wMQJPsVnZ8FFIG7X87LnvtPDtFZ6cMZD67sMAoo+S0yB
	 9p6BRSStrmqAd8xaXL5uGgmhk/HBMBYInq+zQrp2u+k3xaZYuu3XY1btqIWTyEhl34
	 YpPDHlxvv21niX7Zgl2zXptLXx5LTJA7h3PhihzIf3bQzQcguuZUSKE0Hr7Yf10p6X
	 4yDZZQC1KFRjHxIlWN1xNRudlUazsw0aZteJXsMt9niLrLrRlBCYbQi90gYWobwOQa
	 pGdF329qlwvyTLWkt/pyDe8FycqpBCM2X9pTVj24OnizoeKVsK7/gUVFWxKSIT3GT6
	 IIiKuuY+xTlAA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u1mqU-000000005bW-2a1S;
	Mon, 07 Apr 2025 15:49:03 +0200
Date: Mon, 7 Apr 2025 15:49:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: camss NULL-deref on power on with 6.12-rc2
Message-ID: <Z_PXzvL5Zt9QkivE@hovoldconsulting.com>
References: <Zwjw6XfVWcufMlqM@hovoldconsulting.com>
 <Z_OXELLDIfQII6wV@hovoldconsulting.com>
 <778e2cd0-5371-424f-809d-20f7c3ae5343@linaro.org>
 <Z_OrQGspD79k1Mg4@hovoldconsulting.com>
 <Z_OwdYtSyFDhkYMa@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_OwdYtSyFDhkYMa@hovoldconsulting.com>

On Mon, Apr 07, 2025 at 01:01:09PM +0200, Johan Hovold wrote:
> On Mon, Apr 07, 2025 at 12:38:56PM +0200, Johan Hovold wrote:
> > On Mon, Apr 07, 2025 at 10:58:52AM +0100, Bryan O'Donoghue wrote:
> > > On 07/04/2025 10:12, Johan Hovold wrote:
> 
> > > > [    5.740833] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000030
> > 
> > > > [    5.744704] Call trace:
> > > > [    5.744706]  camss_find_sensor_pad+0x20/0x74 [qcom_camss] (P)
> > > > [    5.744711]  camss_get_pixel_clock+0x18/0x64 [qcom_camss]
> > > > [    5.744716]  vfe_get+0xb8/0x504 [qcom_camss]
> > > > [    5.744724]  vfe_set_power+0x30/0x58 [qcom_camss]
> > > > [    5.744731]  pipeline_pm_power_one+0x13c/0x150 [videodev]
> > > > [    5.744745]  pipeline_pm_power.part.0+0x58/0xf4 [videodev]
> > > > [    5.744754]  v4l2_pipeline_pm_use+0x58/0x94 [videodev]
> > > > [    5.744762]  v4l2_pipeline_pm_get+0x14/0x20 [videodev]
> > > > [    5.744771]  video_open+0x78/0xf4 [qcom_camss]
> > > > [    5.744776]  v4l2_open+0x80/0x120 [videodev]
> 
> > I've only seen it twice myself (that I've noticed, at least this time it
> > prevented the display from probing so I knew something was wrong).
> 
> Just hit this again with 6.15-rc1 after the third reboot so timing has
> likely changed slightly which now makes it easier to hit this.
> 
> > Since it's obviously a race condition I think you'll need to analyse the
> > code to try to figure out where the bug is. With an hypothesis you may
> > be able to instrument a reliable reproducer (e.g. by adding appropriate
> > delays to extend the race window).
> 
> It's apparently udev which powers up the camera when running v4l_id:
> 
> [    5.859741] CPU: 4 UID: 0 PID: 420 Comm: v4l_id Not tainted 6.15.0-rc1 #106 PREEMPT
> 
> So this looks like the classic bug of drivers registering their devices
> before they have been fully set up.

It's entity->pad which is being dereferenced while NULL in
camss_find_sensor_pad() and when this happens entity->name is also NULL.

Bailing out when entity->pad is NULL allows the machine to boot, but we
should figure out why this function is called before things have been
properly initialised.
 
Johan

