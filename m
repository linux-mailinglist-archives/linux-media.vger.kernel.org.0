Return-Path: <linux-media+bounces-16593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDFA95AFB9
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 09:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BF7F1F22051
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 07:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2AC16A955;
	Thu, 22 Aug 2024 07:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iSidvW1R"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B8F14C5A9;
	Thu, 22 Aug 2024 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724313453; cv=none; b=jPnyHvKkBqBZwupsj34A/bHdy/y5uZHsxouYWP5I4NHpJn+AaOx9+PR5HIBj4r890VeKpMmGPxJel3WQTPeN3nFqOnMjQ+hRJx0t8c2xQhTQDvsKc8fCix+GQj5Kbxj/QwxFpmVfSqtFxLBrh7EZcVdnEADTuuijS7Nsm3RyM1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724313453; c=relaxed/simple;
	bh=m1vFRTuC+cNBv1XHeT8sUiWunzQa4kwaLH+5mQG8VCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qltgBD9RhECwnH1jl1qSZgqe/o1T1puqlrQeFQRtGFXfwlYC9CMrH0zt5MlQfAgef6tO2FB/ChHnm+Szq29BaboOUsVBZkXM7gmskaqtgeeglBlSfhdYv26Uzxxv/NAmEsv57/qRrwYsyG7zOoNdbkpMEzlO9w8DzmOnfUpoHZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iSidvW1R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B14C4AF09;
	Thu, 22 Aug 2024 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724313453;
	bh=m1vFRTuC+cNBv1XHeT8sUiWunzQa4kwaLH+5mQG8VCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSidvW1RtRLE5ce6i+DhRukhxvCP3wt7VhtQ4TORMZi5AACQVwrf+bmJKGdwGkI0u
	 s5CumzstPH/ecXKG/BplUqKPtOsyfAfKUKwEwQ8zFqaVhy3bBhMivzpQhc37Xc1I6r
	 R24k0ysnHjLxuXsfntjVjvlyyx/3ax6G3YML43+o=
Date: Thu, 22 Aug 2024 15:57:30 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Michael Grzeschik <mgr@pengutronix.de>,
	Avichal Rakesh <arakesh@google.com>, linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Mark UVC gadget driver as orphan
Message-ID: <2024082206-unmatched-sandlot-082d@gregkh>
References: <20240813104447.25821-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813104447.25821-1-laurent.pinchart@ideasonboard.com>

On Tue, Aug 13, 2024 at 01:44:47PM +0300, Laurent Pinchart wrote:
> I haven't had time to maintain the UVC gadget driver for a long while.
> Dan Scally confirmed he is also in a similar -ENOTIME situation with no
> short term hope of fixing that. Being listed as maintainers doesn't help
> progress, so mark the driver as orphan to reflect the current state.

Sorry to see this, but thank you for all the work you have put in here
over the years, it's much appreciated!

greg k-h

