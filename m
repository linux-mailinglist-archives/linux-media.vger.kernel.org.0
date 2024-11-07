Return-Path: <linux-media+bounces-21070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D6D9C095E
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 15:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96E421C236C0
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 14:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC85212F05;
	Thu,  7 Nov 2024 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0cdaMD/d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B62212EE3
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730991218; cv=none; b=IJknW7fe0EFroJ/8oDbd9n1upZbb6x+Db/C+L1T872Q4XSz57ZWg/8y5NMBBZ9jhmR+j2d5g2JRI9KN8vrrttzRwx5YNhflbkrxCQwl983ldqQyXLeJcZvf4O0aYAnWkRF5OByghcBnHM9GbmYKmU06D+7rXYIINg8vE5l2c0zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730991218; c=relaxed/simple;
	bh=CzPNxPovei5cRURWdCV2D86lquacmssp7WHUgdcfy6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HK5UB/pyq1LAw8cn9KBwi8qkCpnZnNAROlsK3LuaghCHAvh1LWSPAyYR0IkfDvCLEK+wie8/w76AJg24OpL9WNqiT/XpxElOG9J4Ax7SatYm6oHzeocPqrflfXuPwco3tcIvaWagvQNs7IHoxDJXsAkfKjynifxLAtL5cn8lJTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0cdaMD/d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC26C4CECC;
	Thu,  7 Nov 2024 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730991217;
	bh=CzPNxPovei5cRURWdCV2D86lquacmssp7WHUgdcfy6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0cdaMD/d0vqRut3l5/fbi9Wi5chLGDISrnSpP0GlKV4ZnnkD/lO9ovUStN+MaPTVs
	 pQGfW1xNbr7fsdNCjArhVxWmDzUjN2hAVPdGhPagQrN66cDT8TKBG26SttO3t+TF3q
	 wTGHhxmstzrY5XjzQNB5ZgPnFi+gvujIn32qLksk=
Date: Thu, 7 Nov 2024 15:53:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Benoit Sevens <bsevens@google.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v1 1/2] media: uvcvideo: Skip parsing frames of type
 UVC_VS_UNDEFINED in uvc_parse_format
Message-ID: <2024110700-removing-diocese-fbb4@gregkh>
References: <20241107142204.1182969-1-bsevens@google.com>
 <20241107142204.1182969-2-bsevens@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107142204.1182969-2-bsevens@google.com>

On Thu, Nov 07, 2024 at 02:22:02PM +0000, Benoit Sevens wrote:
> This can lead to out of bounds writes since frames of this type were not
> taken into account when calculating the size of the frames buffer in
> uvc_parse_streaming.
> 
> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> Signed-off-by: Benoit Sevens <bsevens@google.com>

Cc: stable <stable@kernel.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


