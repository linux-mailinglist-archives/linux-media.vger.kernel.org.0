Return-Path: <linux-media+bounces-55898-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIsSFvHyt2mfXQEAu9opvQ
	(envelope-from <linux-media+bounces-55898-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:09:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6E329930B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 283903077E63
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D67392806;
	Mon, 16 Mar 2026 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MG6J1pyG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86AF24DD17;
	Mon, 16 Mar 2026 12:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662734; cv=none; b=d3fq6xy9Ik1qY5dSupbrDaNw/sV9vZ186Z0ZtJlooo47eW6wneHMoLSzmJI4mTC99mRzbx9epF4+cXUPc4bS/XkZ8BlIuI8w7gK0ZGJcmGE2E0whtaR9PA0X/MdnNFbCyH+VPIb4sGrQDWdH1Uy+EqxCTXXAXsMUuwL8OQenOeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662734; c=relaxed/simple;
	bh=r9SR7xsL4/Fg3mVurfhVnPn2aomWDtFUVPrG6H7Dqoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBOAVxbOiIwummifPgGSK75QshVz7IedLnEb/t6n6s9iBBqvZ/+JmSh4ZNBm0M7pu7ydgSy/3o7itNm3SbkWM1F73Kqgm6yyC4Yf/vFfwxx7GFo3doG+jeGyO3HNA+BRekC2JIMmiTl7JDdTafIL4xPIOCxEGk5K3FXMbwq4cTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MG6J1pyG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01421C19421;
	Mon, 16 Mar 2026 12:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773662734;
	bh=r9SR7xsL4/Fg3mVurfhVnPn2aomWDtFUVPrG6H7Dqoo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MG6J1pyGm3as1ZTS+v6Aaq44FT3wnEBXhi8qUfvBtm9kBzU1InMRvQHbHO7oug1uq
	 Id3nOqKwJ9fFPBgWm1UqTCRMxuzGzdw7ATi7UuFxj5y95eVUdmOzTihx+fKTlnt1xa
	 BhghYYEW5RcvLWDmasKT8gSmsH3oY5aU3r4Hvx+zpXGePfvp5gbMGM0DldY4dHaI22
	 yPa7qsRMpH7Z/9osm1c7rnI952VGNeH3BFdBJLTRWWVozLZth0At4T8DcQf3q8d5Xx
	 gyEkiR9DnXq3Te5m4H3+5Oxn0fQEOUwryVeCnk6UXxMQKlE2Z80+rjqNMUsBovhX4W
	 NEgv2Fag8jN0g==
Message-ID: <6783b48c-9e4c-45ad-a691-9f172c978428@kernel.org>
Date: Mon, 16 Mar 2026 13:05:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: uvcvideo: Improvements for UVC metadata
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>, stable@vger.kernel.org
References: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55898-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE6E329930B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 9-Mar-26 4:01 PM, Ricardo Ribalda wrote:
> This series introduces some improvements for UVC metadata:
> 
> - Allow bigger sizes of metadata.
> - Refactor the code to avoid invalid pointer arithmetic.
> - Add support for DMABUF
> 
> Cheers!
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you.

This entire series seems simple/safe enough and looks good to me
from a review pov, so I've pushed this to uvc/for-next now.

While it also rebasing uvc/for-next on top of the latest
media-committers/next .

Regards,

Hans


> ---
> Ricardo Ribalda (3):
>       media: uvcvideo: Enable VB2_DMABUF for metadata stream
>       media: uvcvideo: uvc_queue_to_stream(): Support meta queues
>       media: uvcvideo: Allow userspace to increase the meta buffersize
> 
>  drivers/media/usb/uvc/uvc_isight.c   |  3 ++-
>  drivers/media/usb/uvc/uvc_metadata.c |  9 +++++++--
>  drivers/media/usb/uvc/uvc_queue.c    | 18 ++++++++----------
>  drivers/media/usb/uvc/uvcvideo.h     |  7 +++++--
>  4 files changed, 22 insertions(+), 15 deletions(-)
> ---
> base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
> change-id: 20260309-uvc-metadata-dmabuf-b98359eec8dd
> 
> Best regards,


