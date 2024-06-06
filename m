Return-Path: <linux-media+bounces-12627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E98FDE59
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 07:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908D8284C94
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 05:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6685339AE7;
	Thu,  6 Jun 2024 05:51:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFE6CA6F
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 05:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717653117; cv=none; b=EoWRWtws1femWT4D5hYRQrzJGRSqu5Xv16EMB8YunTUYeSU1o+/BmX8o83OIrobxur80KsaITNoGZrwnwGjU1Ng8pyn5JQZc+fp6SJ1sP4+QYr0anZutegXYX9f9VuoKXdv2K5Vvk6kyD2VNmBIwz6d0qd+7TlA/G+wZ+gwmEfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717653117; c=relaxed/simple;
	bh=HMBJWNy8hhkFMLs5B3WGavvpXEaXxzdVmzv378uI8cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fC6FssKIv7G1n/Gfx2UbvTNvbelmTYDRHVnO8WzTcrw7S+ClDzCDiKQkRTtmar4dipDX2P6o03Vefrja40A+maHkBX6pPjhqRFcExdLFBemCBS9PaEg5Ql6nRzLkkw2qNRG5rq6ULZqaqNUnHqTT92japeCfk4S4cZ/UjMnPW+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A038C2BD10;
	Thu,  6 Jun 2024 05:51:56 +0000 (UTC)
Message-ID: <46bd56ac-e29b-4534-8bf9-90a5196170b4@xs4all.nl>
Date: Thu, 6 Jun 2024 07:51:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] edid-decode: build: compile with -Wno-variadic-macros
To: Sebastian Wick <sebastian.wick@redhat.com>, linux-media@vger.kernel.org
References: <20240605110907.621053-1-sebastian.wick@redhat.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240605110907.621053-1-sebastian.wick@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/06/2024 13:09, Sebastian Wick wrote:
> Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> ---
>  meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git ./meson.build ../meson.build
> index ca57652..80f810f 100644
> --- ./meson.build
> +++ ../meson.build
> @@ -7,6 +7,7 @@ edid_decode_args = [
>  	'-Wno-missing-field-initializers',
>  	'-Wno-unused-parameter',
>  	'-Wimplicit-fallthrough',
> +	'-Wno-variadic-macros',
>  ]
>  edid_decode_link_args = []
>  

Can you provide a proper commit log? E.g. why is this needed?

Regards,

	Hans

