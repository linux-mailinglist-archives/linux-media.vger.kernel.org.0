Return-Path: <linux-media+bounces-18170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37756975918
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 19:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F065A288CF8
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 17:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF101B29BF;
	Wed, 11 Sep 2024 17:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QZEcnn40";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="b2ySp0oM"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-47.smtp-out.eu-west-1.amazonses.com (a7-47.smtp-out.eu-west-1.amazonses.com [54.240.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F51642A94;
	Wed, 11 Sep 2024 17:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726074782; cv=none; b=XIiyOtpN6aeOPdQbyOhTC9Pu15Qdi57DPjh0pH1Vtpy7DFm8KZhYPftHxD8XnsHb5B4l0VaVCxXbD43fsIu727HDPYztmtn3PmEY1RTHqS6U3EvyyRG9VJwYwokrtkQrnzDb83lKgdEKOC7tiPtJY0QTZ4bGizPVYlwcBBn0qAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726074782; c=relaxed/simple;
	bh=pY0QRPVSLQyOqdQm02m89lv3jyiXKxLhfdk4Z8VM6Bw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eEr+v615GiY6KLVlOxoT4+XDo0aGJpmCA4O7IznV/RiSwyrFIZKPt2WDaFsdzw97ddANdnerI1uzkv9fJ9q+bqunYUIm3tmzh2gZy8+tn3ViM6paxpjW4rxTr5qjHzt+BunntT7Sg8DDMUm2v4k5SOfX59hi8q1iOE6xbcYUlOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QZEcnn40; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=b2ySp0oM; arc=none smtp.client-ip=54.240.7.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726074778;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=pY0QRPVSLQyOqdQm02m89lv3jyiXKxLhfdk4Z8VM6Bw=;
	b=QZEcnn40Vic/RkCuKPK1LG0d6+2GuxUxCMAWug1hgjltjiYHADj0ghfZksJMnMDL
	IJvLsFkz9sL8HoP9cODS7qS14KAqFJac562uZTfUlM0/ZZpGF6neLiZ0tmob0OJWY3F
	br78oKlouu2tqs/+sG4Efwv5tBXFsyR514Or8x8WF7lu+9tp0+Sf295BZkuEZzLugQE
	hHRtuarJn5X8YJnAQUhnewL89juib8revxHIMQl5gC9IbPzsgFQl5XFKlChDNvBuuv7
	SANobzIsm2KmlwrNQgedxZw2NnkkAqH2lkHmkqP0Ltoa83zcIB0YxHY1A+NDpEdGuAN
	MPxOjL+vWQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726074778;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=pY0QRPVSLQyOqdQm02m89lv3jyiXKxLhfdk4Z8VM6Bw=;
	b=b2ySp0oMmFJFKJq7Jl6wf2M2Ckz6imfBUfVim+b/0UtAfSFAE1gIJarN2FetMmak
	mrfInnzCURLnBrkMbbwofS+JLMNP2Vcwn10l+LS3K6qaJqzpNjGR0Q9csvYNQF3eZK8
	Nwchwv0b6nSixvqBReKBO5PtEqgZEhg7LrXyXRRs=
Message-ID: <01020191e212f333-703af7d0-fc68-4f47-b55c-6c0c3de6708a-000000@eu-west-1.amazonses.com>
Subject: Re: [PATCH 1/2] media: uapi: add WebP VP8 frame flag
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Fritz Koenig <frkoenig@chromium.org>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 11 Sep 2024 17:12:58 +0000
In-Reply-To: <20240911135011.161217-2-hugues.fruchet@foss.st.com>
References: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
	 <20240911135011.161217-2-hugues.fruchet@foss.st.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.47

Hi Hugues,

Le mercredi 11 septembre 2024 à 15:50 +0200, Hugues Fruchet a écrit :
> Add a flag indicating that VP8 bitstream is a WebP picture.

Sounds like there should be some code changes in GStreamer that you haven't
disclosed. Mind sharing how this new uAPI is used ? I would also expect this
commit message to give more insight on what is special about WebP that makes
this flag required.

I would also need some more API or documentation that explain how we can
differentiate a upstream decoder that is capable of WebP decoding from one that
does not. I wonder if it would not have been better to define a new format ?
That being said, I haven't looked at all in the specification and only rely on
your cover letter and patch series.

Nicolas

> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst      | 3 +++
>  include/uapi/linux/v4l2-controls.h                             | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> index 0da635691fdc..bb08aacddc9c 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -1062,6 +1062,9 @@ FWHT Flags
>      * - ``V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT``
>        - 0x20
>        - Sign of motion vectors when the alt frame is referenced.
> +    * - ``V4L2_VP8_FRAME_FLAG_WEBP``
> +      - 0x40
> +      - Indicates that this frame is a WebP picture.
>  
>  .. c:type:: v4l2_vp8_entropy_coder_state
>  
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 974fd254e573..e41b62f2cb2b 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1897,6 +1897,7 @@ struct v4l2_vp8_entropy_coder_state {
>  #define V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF	0x08
>  #define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN	0x10
>  #define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT	0x20
> +#define V4L2_VP8_FRAME_FLAG_WEBP		0x40
>  
>  #define V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) \
>  	(!!((hdr)->flags & V4L2_VP8_FRAME_FLAG_KEY_FRAME))


