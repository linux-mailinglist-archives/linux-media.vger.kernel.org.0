Return-Path: <linux-media+bounces-19446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6791E99A924
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 18:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E4CBB2440E
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC2219F13B;
	Fri, 11 Oct 2024 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AkOeyBUE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B138F19E98E;
	Fri, 11 Oct 2024 16:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728665469; cv=none; b=RIs79j/yz/AnTFvp/3AnMEt9MHguQzxsUPOMD5Hd5rreTbGULYPAgoP0UkjVKbi84Re/LHrIG64mryq5Poib+09madHf0x9Br/2sY+woq1sTXRVpJpIlh8SZeeLgrveakHcGSgqvXJXF037zrbITpphDWDtPyOU94JIXhERZl1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728665469; c=relaxed/simple;
	bh=o5Ya9M4H4ZLr03KQqKbADD8vZ2e2ynBOdh5LUMjt+S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHHFgRppbCyHQE1YM6fsReQ0LhvgWusICqrUUrOl3yC00q09xakt16QHIIlQC1TMGNxH72T8U4Z0gpUPWugKdaDyiSN0G5dEJ3xg5qvkHFkVBypuUSG2RzVUAcXrR/HM+wBpXUZFKiYZfxcicmKZnrktVCK/FcFAjEuXQi6298g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AkOeyBUE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AD5C4CED2;
	Fri, 11 Oct 2024 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728665469;
	bh=o5Ya9M4H4ZLr03KQqKbADD8vZ2e2ynBOdh5LUMjt+S0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AkOeyBUENj5cYz2LWna328bHFGAX8kVghuQ5eie+wdWWqnRBu+c1jFzvfJ/q8UsW5
	 D3FHvk7sP0VE7/2vHGqQ5W8amfGfnysI4kykWR/K/DciB0ZcLW4ezVIssGUdmZZeXp
	 n9wqwy+rE/nx3bp2Ow4MG7L/oNlTGjNxsZ1HHGls=
Date: Fri, 11 Oct 2024 18:51:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: mchehab@kernel.org, linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org, syzkaller@googlegroups.com,
	Zijie Zhao <zzjas98@gmail.com>
Subject: Re: [drivers/usb/gadget, drivers/media/v4l2-core] divide error in
 uvc_queue_setup
Message-ID: <2024101126-vitality-geologic-6953@gregkh>
References: <CALGdzup_G78FtjKrugdj_sHcXYM+yK2Mtjk2s9sh8bpj8CsvQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALGdzup_G78FtjKrugdj_sHcXYM+yK2Mtjk2s9sh8bpj8CsvQA@mail.gmail.com>

On Fri, Oct 11, 2024 at 11:39:55AM -0500, Chenyuan Yang wrote:
> Dear Linux Developers for USB Gadget and Media,
> 
> We encountered "divide error in uvc_queue_setup" when testing with
> Syzkaller and our generated specifications

Wonderful, can you please send a fix to resolve this?  We have plenty of
syzbot reports, patches are what help us out the best :)

thanks,

greg k-h

