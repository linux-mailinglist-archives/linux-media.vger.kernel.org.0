Return-Path: <linux-media+bounces-15570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 277589412F1
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 15:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BA911C231C3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 13:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17F119F495;
	Tue, 30 Jul 2024 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xWrP4N39"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A0B2CA7;
	Tue, 30 Jul 2024 13:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722345547; cv=none; b=niLmF0bgMtyvpeGBpcHaexqRQE5bfNtvAuNG9HxGibvQUGPhZDNwpBkKRzrIQQFBWWJU5TB8rhvKYo65Psm8QeU2QuhIVxrVaxms9f1lsh2SKVwPajaEm6EpHJszzLrdlDuihYFxeBgOV8e2lZP7qBSArV/SaWqsrfNSlfQYzmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722345547; c=relaxed/simple;
	bh=4JAfC8QArj4s48ml/l1XZp63ZKfzJGAK9y/yUNrl++c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaAf0ecA2LaDPW1bNWy9Y98wsF7E8nLRROmjbKKeRLo31+zbgd1lbAwKhQZiV9yIIIn0+BZzPv6ncfUCaMDiHcIBTnMG+AOzPE0BmvA5V/Zpsyjrx3ECL0g+eSuBO86EXv6qBPqQJsf97tW5QiYsh/1AofpHYsf4c/WClZnwuuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xWrP4N39; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A7FC32782;
	Tue, 30 Jul 2024 13:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722345546;
	bh=4JAfC8QArj4s48ml/l1XZp63ZKfzJGAK9y/yUNrl++c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xWrP4N391JhKA7RAcvyLX8u8euszXtt41kYg8nM99xGNB2lOVfSFVmIuPyjoksbRa
	 jsqEFzUjREdwflONIjjoefQhq6pZGfkfIAJGNm6sIcIGmhj2hi16Uxd7ykECNRFtuq
	 UcG7KDyuFo3kN7+kzCMvheynIuDojCslgm+RtlsM=
Date: Tue, 30 Jul 2024 15:19:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kartik Kulkarni <kartik.koolks@gmail.com>
Cc: hdegoede@redhat.com, mchehab@kernel.org, akari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: Re: [PATCH] staging: rtl8723bs: remove space after pointer
Message-ID: <2024073033-recede-scrubbed-2911@gregkh>
References: <20240730123427.37339-1-kartik.koolks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730123427.37339-1-kartik.koolks@gmail.com>

On Tue, Jul 30, 2024 at 12:34:27PM +0000, Kartik Kulkarni wrote:
> Fix checkpatch error "foo * bar" should be "foo *bar"
> in osdep_service.h:105
> 
> Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>
> ---
> Newbie to contributing to kernel code

This line is not needed :)

You sent 2 copies, which one is correct?

Please resend a v2 version so we know which to review.

thanks,

greg k-h

