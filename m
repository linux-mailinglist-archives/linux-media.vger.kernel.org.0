Return-Path: <linux-media+bounces-16433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6477E956162
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 05:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A341282690
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 03:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0763613C836;
	Mon, 19 Aug 2024 03:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LjwBold+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBB722064;
	Mon, 19 Aug 2024 03:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724037111; cv=none; b=nBII4fDpRwLowg3p9EQw8s8sC7sxp+nynk4ccyB3d1lzfNVZpgycQohUqqHr0dhxHbQi43pepZnbNKLRMmeoL54A7skRjhcJgdqkZ/yj0yGztFBRewk/11Qc4qccQkb5uz7CRiN59HtRpy5RlW1GaIieUFj4E/ub1LEqGcd6A34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724037111; c=relaxed/simple;
	bh=lxLAosRLu2sFp0u/rzQxQerTo/Mwti4KOK1FFgNr6Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fo3xgARBK/RZgkUAZyDFmVUF4WWHODIaZYxOieTlirs7rVx3Ph/9G2g/jkzeySyfk6goMJKaWYDFxZnjSixLbOIGhuRtpg9yS7KAjc/JtvHMi19B6Nc5A6PcOuTlee/OA+nCUdyPGgteL9aCtaWO92quH1xPOWCYDU0dWcqQ2Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LjwBold+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48680C32786;
	Mon, 19 Aug 2024 03:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724037110;
	bh=lxLAosRLu2sFp0u/rzQxQerTo/Mwti4KOK1FFgNr6Kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LjwBold+Y+9IAW8egmEOZMDHaTbi9q6X79Au+RMK1CK36/cccUMp4weD0UWQF7GoT
	 Qf7yLhwozI1uS4AzFiKc+F+xcJxmHnlexSoYhSokBE85Cq3RD+jyMcEjz4lxvneDop
	 1CczJPisLClABUDP0E+EoI4epKVmbeKnoNAdI9I8=
Date: Mon, 19 Aug 2024 05:11:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media/usb/siano: Fix endpoint type checking in smsusb
Message-ID: <2024081909-afar-trolling-2a67@gregkh>
References: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
 <0000000000009f6f85061e684e92@google.com>
 <51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>
 <1959a4fb-8bf2-456b-83b8-ea28d517debf@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1959a4fb-8bf2-456b-83b8-ea28d517debf@rowland.harvard.edu>

On Sun, Aug 18, 2024 at 02:20:44PM -0400, Alan Stern wrote:
> Greg and Mauro:
> 
> Was this patch ever applied?  It doesn't appear in the current -rc 
> kernel.  Was there some confusion about which tree it should be merged 
> through?
> 
> Here's a link to the original submission:
> 
> https://lore.kernel.org/all/51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu/

I never took it as it was touching a file that I'm not the maintainer
of.  But I will be glad to do so if Mauro doesn't want to take it
through his tree, just let me know.

thanks,

greg k-h

