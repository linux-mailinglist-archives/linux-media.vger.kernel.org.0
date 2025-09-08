Return-Path: <linux-media+bounces-41976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD71B48982
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 12:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 795DD3410E0
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 10:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BAC1E522;
	Mon,  8 Sep 2025 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbIHSfoc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC522F83C4;
	Mon,  8 Sep 2025 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325841; cv=none; b=C6ZaJZQ6xg7POiuTU1geKVX80Z/uetDIsFSV0O8YfWd1uWPOBK1J+S81IziNi54nBAfYsKoh9+LIWybxQimy68OS/jCtdGAt8wrYmWgXSGpSl9T0BB08n5Hc1AURWaMFtnWKPDRzK/uwbdREaOGn+q2pwg9dQ0buGWbNwuQtkas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325841; c=relaxed/simple;
	bh=LtfRmaJ+6o9AXeNd34iG9Kvfw1pfyEj4mTUy7gjaSEU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P8LVUZ9S+e/2H7vhr4CwqTJN+X6M5W/NA6VjF0osB9lbYXt+oQCJ5tRjouyU/YhcpZEAPHdOmSE81xXVzdsGkaymEt/lPgbmwUePZVWQ3tAQ/hSuXq08ZlIkSdS5oLGsJvpTQ/SaLClJT4c1a3/3yuQ17HWcW/6Az+XXmMe8X5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbIHSfoc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B25C4CEF1;
	Mon,  8 Sep 2025 10:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757325841;
	bh=LtfRmaJ+6o9AXeNd34iG9Kvfw1pfyEj4mTUy7gjaSEU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XbIHSfocrPyk7SpL3yWs9DimMfe90mVG3zLUhRPi9nz8U5s5Qk/VWIBV+yFBDKhP1
	 lYll0bpc7iG/XquvGClneMxm7hCkSuYv1c05Ce0ltqrCLn5u1mgAXvmRYaTpIVa89H
	 02XZ5G4aNR+4iTRCHRLlUxB7xfLcwBtxIvjYYNmFsSZpebojFMT6K1ottCDoxk1dv3
	 51753m2D8vReoJ0/La7jh6oERs5tgjfoLjpn4b98t5GHmfd36aMRyQ2nD+ZEG86dCT
	 93C69vPWMgUTVDe/cBO/qsIA5xDjN5uU+pxqaU1xTdJnXa7UAS5DCqkaYmaNsYZdEi
	 F/bfEFg3XvpxQ==
Date: Mon, 8 Sep 2025 12:03:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Alexandre Courbot" <gnurou@gmail.com>
Cc: "Albert Esteve" <aesteve@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Jason Wang" <jasowang@redhat.com>, "Xuan
 Zhuo" <xuanzhuo@linux.alibaba.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, <gurchetansingh@google.com>,
 <daniel.almeida@collabora.com>, <adelva@google.com>,
 <changyeon@google.com>, <nicolas.dufresne@collabora.com>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <virtualization@lists.linux.dev>
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20250908120354.73d83f86@foz.lan>
In-Reply-To: <DARCGOT0TKN8.OC6467QNJA9O@gmail.com>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
	<20250526141316.7e907032@foz.lan>
	<DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com>
	<20250527111311.105246f2@sal.lan>
	<CAAVeFu+=RpEfu3i_Fh9_eq_g=cmDFF0gcurT0gU9AX1UX+UNVA@mail.gmail.com>
	<20250527153547.6603eaf4@sal.lan>
	<CAAVeFuJtp=UEEULeMSVpmYDmH81Y6OQgj6NCeuPUhabSRHw4dA@mail.gmail.com>
	<20250617104938.09d21b7c@foz.lan>
	<20250617110318.7c89d999@foz.lan>
	<20250617122034.3e570b4e@foz.lan>
	<DAPQ9L3FCLIF.24FIDLQST2S1O@gmail.com>
	<20250618170500.1e60aacf@sal.lan>
	<DARCGOT0TKN8.OC6467QNJA9O@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 20 Jun 2025 21:03:34 +0900
"Alexandre Courbot" <gnurou@gmail.com> escreveu:

> Hi Mauro,
> 
> Really appreciating the time you are spending reviewing and testing
> this! m(__)m Thanks also for sharing your script, I've learned a few
> things I didn't know about crosvm. :P

I'm resuming the tests with virtio-media. I did some tests here, running
camorama and qv4l2, setting the maximum resolution allowed by uvcvideo on a
C920 camera, e.g. 2304x1296.

Such setup works with camorama, on both host and VM (acessed via ssh
with X11 forward), both at the same machine.

However, when I run qv4l2, top presents a really high load:

	1752251 mchehab   20   0   10,4g   1,6g   1,6g S  1182   2,5   9:21.86 crosvm                  

(It can reach up to 2400% on my machine, which has 24 CPU threads).

and the image freezes.

The same setup works fine when calling it directly from the host. No
idea if this could be some bug at crosvm, or if there are dead locks
somewhere.

Thanks,
Mauro

