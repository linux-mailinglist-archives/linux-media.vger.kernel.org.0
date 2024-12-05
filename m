Return-Path: <linux-media+bounces-22753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D71349E6179
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 00:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B193D1659E1
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 23:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4C11CD1FB;
	Thu,  5 Dec 2024 23:41:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from pilot.trilug.org (unknown [208.79.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2B71B4136
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.79.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733442087; cv=none; b=APuzA3cnUZYn46J1jyXYE0nU6iswdJE5owyuLqj8ZZceGi3SKoiXpt5CUNI4PHwQU2NkBJxKbHs6waytsyCpmopsOSpKh3+hnv23M5StnY8ChBwE2/FD2sdw+C1byhehiRKNpSRf2wmUP+VdoPZ6wOqY1phswq0XPJrgiBAETOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733442087; c=relaxed/simple;
	bh=JceMeVhh1XUX5x8fmZwmdEVnIaO+Qipoo8VZ9aZi8Iw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PbWeZHWIm6SHjXdxtCL69u7lYhdcItFtXfbRpbLEjyXCgU6bZt9ttIQS3C1dVH7vmbMLdhtEUMS8SUfUXgDMiCvGC3elO5o8JUEhnWkxQCnQgobpMUnE+5Xjn9mVNWe+/k5sLriCASqbgFT2t19O1VRRvSRlr2qZDKBuCXQk/Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=undecidedgames.com; spf=pass smtp.mailfrom=undecidedgames.com; arc=none smtp.client-ip=208.79.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=undecidedgames.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=undecidedgames.com
Received: by pilot.trilug.org (Postfix, from userid 8)
	id C0EFA58397; Thu,  5 Dec 2024 18:32:17 -0500 (EST)
X-Spam-Level: 
Received: from undecidedgames.net (syn-174-109-074-033.res.spectrum.com [174.109.74.33])
	by pilot.trilug.org (Postfix) with ESMTPA id ACFCA5834F
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 18:32:16 -0500 (EST)
Received: from [10.55.46.125] (unknown [10.55.46.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by undecidedgames.net (Postfix) with ESMTPSA id 6FFF168BDA7
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 18:32:15 -0500 (EST)
Message-ID: <4094d6b1-e33c-4d57-9baa-891eca189fb7@undecidedgames.com>
Date: Thu, 5 Dec 2024 18:32:14 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
From: Brian <bh@undecidedgames.com>
Subject: v4l2 4.14.98 buffer size disagrees with frame size
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

Preamble:  Please accept apologies if this isn't an appropriate forum 
for my topic.  I'm not entirely sure where to ask.

I've got a program that streams MJPEG video out an HTTP connection from 
a USB-connected camera.

On linux kernel 4.1.15, it works beautifully.  On linux kernel 4.14.98, 
it does...not.

Side note: Yes, I know these are old kernels.  This is an embedded 
application and I don't have the freedom of choice in this matter.  
Moving on..

In developing this program, I made some utilities to exercise various 
v4l2 interfaces; using those utilities, I found the most obvious 
difference appears to be the info one gets from the VIDIO_QUERYBUF ioctl.

One of my little utilities spits out lots of data about the camera, then 
grabs one frame.  Here're the salient bits of that output:

On 4.1.15:
   Current buffer format:
   MJPG at 1920x1080 Progressive
     Bytes per line: 0      Image size: 4147200    Colorspace: SRGB   
Transfer function: DEFAULT
     Quantization: DEFAULT   YCbCr Encoding: DEFAULT
   Notice: Asked for 1 buffers and got 1.
   Notice: Buffer size 4147200 at offset 0x0
   Releasing resources...
   Asked for a frame and got 4151296 bytes (99%)

On 4.14.98:
   Current buffer format:
   MJPG at 1920x1080 Progressive
     Bytes per line: 0      Image size: 4147200    Colorspace: SRGB   
Transfer function: DEFAULT
     Quantization: DEFAULT   YCbCr Encoding: DEFAULT
   Notice: Asked for 1 buffers and got 1.
   Notice: Buffer size 4149360 not expected size of 4147200 bytes
   Releasing resources...
   Asked for a frame and got 4151296 bytes (99%)

The key difference is the size of the buffer size that gets reported on 
4.14.98 is larger than the frame size.

My streaming code just shoves frame data out the HTTP connection, 
inserting MJPEG boundaries between frames.  It doesn't seem to matter 
whether I send out the "bytesused" or "length" number of bytes; the 
result is a stream that is full of garbage, sticky frames (where old 
video frame reappear in the stream amidst new frames), and and 
all-around bad time.  Data gets into the buffer by way of the 
VIDIOC_STREAMON ioctl.

So I'm inclined to suspect v4l2 in kernel 4.14.98 is doing something 
that I don't understand (that it isn't doing in 4.1.15) when it streams 
frames into buffers.

At this point, I'm not even sure what the correct questions are to ask.  
I'd appreciate any sort of advice on this.

Many thanks,
-Brian


