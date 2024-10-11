Return-Path: <linux-media+bounces-19387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54293999C0D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 07:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D48CFB22512
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 05:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08B11F941A;
	Fri, 11 Oct 2024 05:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pzmLH8iw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9A61F1315;
	Fri, 11 Oct 2024 05:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728624101; cv=none; b=TOaxCsjITjeumOD5UEuk0ynSrbr17ircIICPeTu/ykMkby994NuieB8jzS2o4frQ2swRFaNOEydU3KwugCDkkLJkqAE9utTt3K7OS/JPcjhFbzT+NJS7cFwaUYM/B/aBWlBEyjecAG0Cq/AR/Op0aiZvXz40mZBQLd5kJSEcBMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728624101; c=relaxed/simple;
	bh=j0OqTLJLhIRHrtRZqM8pVSikHbwzSEvQW3/U7ImUhqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlzugmIqVTk++4Niek9sDySenyWSpALadXP1bWdQug4rNhfmQ5eS0AxqaojGc0mB1UwIAM9haAsnBmVnLNf0qRsrjuxe/8skRspMlhVzBY50wKKAz+cCroA08dfqLZplKAwBw7x8TpkEu0F9ScYXORDzqitCxKhzR3rR6Gq5Fq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pzmLH8iw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BBDC4CEC3;
	Fri, 11 Oct 2024 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728624101;
	bh=j0OqTLJLhIRHrtRZqM8pVSikHbwzSEvQW3/U7ImUhqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzmLH8iwy4uNeDqPbikhHuYI/2d8dLR9ukjxDJqv/2XfN5+CuRrcEMnAHxZPcMHHI
	 irfCY0ahqa8Re2wib1jlxCd5xyqn5X0uOjpk1PQDQu1MebHpgAn67quKwQpGGCZ0NN
	 9qxNRiZyOlfIar5HlFOJYSPzcl6GoLKTBfgu0pBg=
Date: Fri, 11 Oct 2024 07:21:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	linux-usb@vger.kernel.org, Zijie Zhao <zzjas98@gmail.com>,
	syzkaller@googlegroups.com, linux-media@vger.kernel.org
Subject: Re: [drivers/usb/usbip] BUG: corrupted list in vep_queue
Message-ID: <2024101107-pry-reflex-8bc2@gregkh>
References: <CALGdzuq9qr5wBpJFg1eNbv0NoMSDM=umusZF6r5T5_i=Foxdiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALGdzuq9qr5wBpJFg1eNbv0NoMSDM=umusZF6r5T5_i=Foxdiw@mail.gmail.com>

On Fri, Oct 11, 2024 at 12:13:53AM -0500, Chenyuan Yang wrote:
> Dear Linux Developers for USB OVER IP DRIVER,
> 
> We encountered "BUG: corrupted list in vep_queue" when testing the
> DVB driver with Syzkaller and our generated specifications.
> 
> Linux version: Linux 6.12-rc2 (8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b)
> Configuration is attached.
> Syz and C reproducers are as below:


Great, can you please send us a patch to resolve this issue as you can
test it easily?

thanks,

greg k-h

