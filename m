Return-Path: <linux-media+bounces-15130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4835A9373E5
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 08:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79BD71C2384E
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 06:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B406459168;
	Fri, 19 Jul 2024 06:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uLnUz3+c"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDAC481D5;
	Fri, 19 Jul 2024 06:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721369139; cv=none; b=nG1MNMPIfG6q4+Gogxn3RZ3ypBCEo8si36GYjE/Y4qYZmVZHOd9irk/2EVUu1cOEE/3rFTT7Fi6TUOIAZMFLk2KcGFE5VRFUKg9jeZUR7Niq1CyOBlM3mdCIgG9F6vbe+Qhc/NHWATXD6ic/bDh+LsPQmaxl0CeJhHfeVdAHd7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721369139; c=relaxed/simple;
	bh=yr62qP012G17l338zFPCJQtHh3KR+qKnHgkq5gNUZL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRn6LVUhSN2vZeM09oP8xnFto6+n1ZNWsb8IJfijcdxNstzJHBXOF2J0xeyqvapc2/3QFdujaTEBdKjLmEH8j+GV+8l9yfOh56hG0OdK+bIXQnQEcK+CkmG0zQg00q+kDc5ESblNO56iRlPYCaIfxPCinwUP6is+yuw51ezxPio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uLnUz3+c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF350C4AF0D;
	Fri, 19 Jul 2024 06:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721369138;
	bh=yr62qP012G17l338zFPCJQtHh3KR+qKnHgkq5gNUZL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLnUz3+c4GsBoNAgQ+yt5T1CGGtX8b/hlxorutvGy0TXpSxI/z8y7HXKFkOOO7jg+
	 slojyY357TbBcw5B5/7agI4UueS9ECIboMBpWFyFzQK4aKXI0BT5zSUnjsRqHtzCgX
	 Z5Kb5Ecr1h5XODKP02IJrP2ULCLa92WynTc5TELY=
Date: Fri, 19 Jul 2024 08:05:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: Linux logs error `Failed to query (GET_CUR) UVC control X on
 unit Y: -75 (exp. 1).` (75 == EOVERFLOW?)
Message-ID: <2024071939-wrought-repackage-f3c5@gregkh>
References: <af462e20-d158-4c5c-8dae-ce48f4192087@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af462e20-d158-4c5c-8dae-ce48f4192087@molgen.mpg.de>

On Fri, Jul 19, 2024 at 07:22:54AM +0200, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> Today, starting the Intel Kaby Lake laptop Dell XPS 13 9360/0596KF, BIOS
> 2.21.0 06/02/2022 with
> 
>     Bus 001 Device 004: ID 0c45:670c Microdia Integrated Webcam HD
> 
> Linux “6.11-rc0” (v6.10-8070-gcb273eb7c839) logged UVC errors:

Does 6.10-final have the same issue?  If not, can you use 'git bisect'
to track down the offending commit?

There have not been any USB changes in Linus's tree yet, but there have
been a bunch of media changes, so perhaps something in the uvc driver is
causing this?

thanks,

greg k-h

