Return-Path: <linux-media+bounces-29489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B18A7DB50
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 12:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C401168C2C
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 10:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B149D237176;
	Mon,  7 Apr 2025 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMlLSBMc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114AA22B8AF;
	Mon,  7 Apr 2025 10:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744022331; cv=none; b=cQ3BANb0UqsGs1hnbaCux6TCkK/+KtfjfbEke+fAdSccoIwLrkaq83xv9avWLs5/YSW5OO/h4zmvQvXa0Iev23Mlgs29S0Y44YqLYZSZKyKx8qtfnYDBSHT8dAK57baeeLlJ+6BzjUraEZ8u/udz7i2DtTQw/LSmO4JlbBoLCDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744022331; c=relaxed/simple;
	bh=VGPKlN7jjXAd1P0g+IZo6ahKwAW6sQhZ7VCKx3Ow1TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfoPrcTniSwSBI/UDUIrrCcGm0tZJC+Ol+BF/e7OUUy/M7rt8XVnOiyy1N0j2caLTxSKdu+JPQhCrx3XMsj3jpKTe1KCCsPPN8PJt0zRXxPAJD0cKjZPcYzCjf1A7YX3lC/JoUZwD8GGX6LmLI1tnNreFIgPiZpE0+4NoSZRIw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMlLSBMc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B43C4CEDD;
	Mon,  7 Apr 2025 10:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744022330;
	bh=VGPKlN7jjXAd1P0g+IZo6ahKwAW6sQhZ7VCKx3Ow1TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMlLSBMc1g/DAtXDqCeLs1JHZkr/U7SQALXhOugt1b3/H01m3NAZ80lAOffJxQUPw
	 MWHufebCoaL37GdT7iR+9vT4lJgCp3WJwuZvwYTDvq12fJLIJbe6bIeEsi7KUktBSr
	 8/vehuOgyjdVB8WYpVOVL1rqz2AyERk/kDkpHNFd9QqdbGcjEHcqKEz1MM7ouI64V6
	 YnpqDIgSsPe3J5IxL0ybgW+qPecXOzH2+p0rzc0pa8LscwbqUJU2Ta3iR0eouE442w
	 x/AluF1r9U9FCpJUHSgpEQknx2nQ2YVcZgtF+GK3JOPH8kner+hPHAA0RCLJ1F6nC1
	 +HZglcHfgVCIg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u1jsW-0000000086D-2dYR;
	Mon, 07 Apr 2025 12:38:56 +0200
Date: Mon, 7 Apr 2025 12:38:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: camss NULL-deref on power on with 6.12-rc2
Message-ID: <Z_OrQGspD79k1Mg4@hovoldconsulting.com>
References: <Zwjw6XfVWcufMlqM@hovoldconsulting.com>
 <Z_OXELLDIfQII6wV@hovoldconsulting.com>
 <778e2cd0-5371-424f-809d-20f7c3ae5343@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <778e2cd0-5371-424f-809d-20f7c3ae5343@linaro.org>

On Mon, Apr 07, 2025 at 10:58:52AM +0100, Bryan O'Donoghue wrote:
> On 07/04/2025 10:12, Johan Hovold wrote:
> > On Fri, Oct 11, 2024 at 11:33:30AM +0200, Johan Hovold wrote:
> > 
> >> This morning I hit the below NULL-deref in camss when booting a 6.12-rc2
> >> kernel on the Lenovo ThinkPad X13s.
> >>
> >> I booted the same kernel another 50 times without hitting it again it so
> >> it may not be a regression, but simply an older, hard to hit bug.
> >>
> >> Hopefully you can figure out what went wrong from just staring at the
> >> oops and code.
> > 
> > Hit the NULL-pointer dereference during boot that I reported back in
> > October again today with 6.15-rc1.
> > 
> > The camss_find_sensor_pad() function was renamed in 6.15-rc1, but
> > otherwise it looks identical.

> > [    5.740833] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000030

> > [    5.744704] Call trace:
> > [    5.744706]  camss_find_sensor_pad+0x20/0x74 [qcom_camss] (P)
> > [    5.744711]  camss_get_pixel_clock+0x18/0x64 [qcom_camss]
> > [    5.744716]  vfe_get+0xb8/0x504 [qcom_camss]
> > [    5.744724]  vfe_set_power+0x30/0x58 [qcom_camss]
> > [    5.744731]  pipeline_pm_power_one+0x13c/0x150 [videodev]
> > [    5.744745]  pipeline_pm_power.part.0+0x58/0xf4 [videodev]
> > [    5.744754]  v4l2_pipeline_pm_use+0x58/0x94 [videodev]
> > [    5.744762]  v4l2_pipeline_pm_get+0x14/0x20 [videodev]
> > [    5.744771]  video_open+0x78/0xf4 [qcom_camss]
> > [    5.744776]  v4l2_open+0x80/0x120 [videodev]

> I've never seen this myself.
> 
> I wonder, are you building camcc, camss and the sensor driver into your 
> initrd ?

No, there's nothing camera related in my initramfs.

I've only seen it twice myself (that I've noticed, at least this time it
prevented the display from probing so I knew something was wrong).

Since it's obviously a race condition I think you'll need to analyse the
code to try to figure out where the bug is. With an hypothesis you may
be able to instrument a reliable reproducer (e.g. by adding appropriate
delays to extend the race window).

The fact that the sensor driver is probe deferring may also be relevant
here.

Johan

