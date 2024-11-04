Return-Path: <linux-media+bounces-20766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E51E9BADDA
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 09:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 441B4282F6E
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 08:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB6F1AB517;
	Mon,  4 Nov 2024 08:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WF2Ey32N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECAE1AB507
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730708262; cv=none; b=OZ4CbF6Lf5DX3EKqjtUUH6RMhsFF725JZn49KA5zB24NYo3/JICgFhlS4V4L8nKn+XxBrydRT3wHJAotCHLJ3lRdnyjSl+N137x3NhseVcVo5wPyYTdUPBGBnQzPSE6oix81Mfg4Mf5gbYwArtMWUqKK0FhJ8PTZnwx8Z/7TN00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730708262; c=relaxed/simple;
	bh=hcueYQkb6Fajtk+IA25y9JBci3CiBteC26Cw5rj37ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLaWupc21pTaBJf8LqtGRjufvYuC69WpPty7capsJI4Bic17NWwkwV9mL6sI7tcBWyTO0rZrV4pf1Kr2oOjBKqHhvW/LEmEgqkdNsr+HBR6m9cP+OZoPzKR7AdVldUtfU/bruL9TvBSovr1g2cPTwAC0tV0w4OIBr/+Ca27iDMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WF2Ey32N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-48-188.net.vodafone.it [5.90.48.188])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F88B236;
	Mon,  4 Nov 2024 09:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730708253;
	bh=hcueYQkb6Fajtk+IA25y9JBci3CiBteC26Cw5rj37ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WF2Ey32NzvyYQ7hRIuG/rGZqJrpEvYj8SDXVqrQJapYaL59ccQYEF4mGbUFkRU0pt
	 gkZIGt2ug8Nu2cWyOrtBifE//osYyYFMctbWsr/0xVPiz67Ebwkc7GVce1/qWlJQJ1
	 Uhmspcado7oXOIkwCxWg+ymp6qFSvEW3khJcQRns=
Date: Mon, 4 Nov 2024 09:17:35 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: =?utf-8?B?UmVuw6k=?= Doss <doss@gmx.de>
Cc: linux-media@vger.kernel.org
Subject: Re: video rotate or flip
Message-ID: <d3o4q3ymal57mc2kurgqqfaf67j65zwyzsazdamscmkggzgfw7@zzax37e3hg6h>
References: <7259fb77-0fa0-4f57-a0cb-cf99da6218ec@gmx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7259fb77-0fa0-4f57-a0cb-cf99da6218ec@gmx.de>

Hi Rene'

On Wed, Oct 30, 2024 at 10:20:09PM +0100, René Doss wrote:
> Hallo,
>
> I have to rotate the camera. I have a optical spectrometer and the spectrum
> is mirrored.
>
> I can not turn the sensor. It is all fixed with glue.
>
> How can I set the option flip or rotate the picture in the driver?
>
>
>
> I collect all my datas of my videodevice.
>
>
> lsusb
>
>
> Bus 003 Device 007: ID 0c68:6464 Sonix Technology Co., Ltd. USB 2.0 Camera
>
>
> lsmod |grep  video
> uvcvideo                     106496  0
> videobuf2_vmalloc      20480  1 uvcvideo
> videobuf2_memops       20480  1 videobuf2_vmalloc
> videobuf2_v4l2             32768  1 uvcvideo
> videobuf2_common       77824  4
> videobuf2_vmalloc,videobuf2_v4l2,uvcvideo,videobuf2_memops
> videodev                       253952  3
> videobuf2_v4l2,uvcvideo,videobuf2_common
> mc                                 61440  4
> videodev,videobuf2_v4l2,uvcvideo,videobuf2_common
> video                              61440  0
>
> v4l2-ctl --list-devices
> USB 2.0 Camera: USB-ZH (usb-0000:00:14.0-5):
>     /dev/video0
>     /dev/video1

You should check if your devices support the hflip control.

v4l2-ctl --list-ctrls -d /dev/video0 | grep flip
v4l2-ctl --list-ctrls -d /dev/video1 | grep flip

If it does you can set the control before starting the streaming and
the video stream should be horizontally flipped natively.

I've been told the UVC specs do not officially support flips, but some
devices implement them through an extension of the specs.

If your camera device does not natively support flips, you could
probably use gstreamer and pass the video through the 'videoflip'
element.
https://gstreamer.freedesktop.org/documentation/videofilter/videoflip.html?gi-language=c

Hope it helps

>
> I hope you have some hints.
>
> Best regards
>
>
> René Doss
>

