Return-Path: <linux-media+bounces-48134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBFBC9E66B
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 10:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E86A24E4284
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 09:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7E92D73B1;
	Wed,  3 Dec 2025 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kFR2IpL/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78E2257431;
	Wed,  3 Dec 2025 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752721; cv=none; b=oAZkAeVtDFq5E/0+T4H589OlAgp2Z03sGJV8K7x4p/OFNL3xu4plmsMwYtYc0hovvkLIIRp8h5OcG495g8yRG2kqRlLjldJfbeJgR/gDy/G6jvjpFaefgnr+xQrEYg75An3v3SskTOPtbNC0DlG851rMKMXDXIV8krhLb3QNcdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752721; c=relaxed/simple;
	bh=5whL912EuO0+YI5CitaSDe1FSEn+r9R7ihvMFReeTUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLb9WiftY9eKH5n8+LEm7SvnZSyxtIMrC7J5qwTT0IPuoH8joEo7fitT+VuWYcscrcsslUikr/O9woXFrXPU6HRAEaH5Zj8F/lnfX1TSSZuc201edLhguLDiQ4pE/Cmypdgj9O7W3loptdVGoKV6q0hOAcJEI3al3mMYf0HIkWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kFR2IpL/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCF1C113D0;
	Wed,  3 Dec 2025 09:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764752720;
	bh=5whL912EuO0+YI5CitaSDe1FSEn+r9R7ihvMFReeTUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kFR2IpL//H77GNUs8W4gUy6znpCNXeqg15xijarCZojM+1RtUfxMPfRMB4W/hEgRq
	 nFcIG7r7ywd8okA3w68Zuo7cSRywd5+BUYEhkeVqcNZSGUSQrKrYMk6NEmHzylgvk9
	 ucP1dEMdf5AnADlqqhaDToRKIhrbMccEEY44q9e0=
Date: Wed, 3 Dec 2025 10:05:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	dan.carpenter@linaro.org, laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5] staging: most: video: prevent probes during component
 exit
Message-ID: <2025120308-unlucky-chevron-0071@gregkh>
References: <20251203083411.7072-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203083411.7072-1-pavankumaryalagada@gmail.com>

On Wed, Dec 03, 2025 at 03:34:11AM -0500, Pavan Kumar Yalagada wrote:
> When comp_exit() runs, comp_probe_channel() could still add new devices
> to video_devices, creating a race and potentially leaving the list in
> an inconsistent state.

Wait, please step back.  How can this happen?  I would argue that if it
could happen, then this must be solved at the higher level.  The most
core should not be allowing this, as you do not want to be forced to
solve this for each individual driver (hint, the driver core does not
allow this to happen for normal driver operations for this very reason.)

You are only solving this for one most driver, not all of them (well,
there are only two with this codepath...)  Please move back up the stack
a bit and prevent this from even being an issue at all.  Especially as I
do not think this really solves the problem, see below:

> This patch prevents new devices from being added while exiting by:
> 
> - comp_probe_channel() checks comp_exiting before modifying video_devices.
> 
> 	if (comp_exiting) {
> 		spin_unlock_irq(&list_lock);
> 		ret = -BUSY;
> 		goto err_unreg;
> 	}

That's great, but what prevents comp_exiting from changing right after
you check it?

thanks,

greg k-h

