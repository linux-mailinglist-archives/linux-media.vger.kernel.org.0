Return-Path: <linux-media+bounces-47792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F92C8C84B
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 02:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D6704E7647
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 01:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C5827F754;
	Thu, 27 Nov 2025 01:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tasnA9H3"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B61027602F;
	Thu, 27 Nov 2025 01:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764206125; cv=none; b=cTbpOo8Ii98VR8m29BWwGsRTPT2RKR5ZsreJu0GuUY5gJWVh/5UynorZbjCn41te3iCh6dIjTzEEsh0zlYI+93wM991OV4WfC9m83B0wcyXTGbROTDSIM+DKbPNWaPVGQXcTgeRorOr5DVlOCfW1RoDIQ59AwNmF75EAGIW9a0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764206125; c=relaxed/simple;
	bh=VpoQv3JutJWG1lgWa251Hnxg7lQNloSi5Uc9/YDSCm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUXO0DSmygAw/3qEkfuhnFDiIuSI9MarlpO2C8r9/EaZfpPYZFJJ/6yVekbo9zTEjlgsMDnUkqhcEQeGViWbOf+zKOCZps9UPdkqIeakXiFAbmkeeatd2A0HXaQCuxDeMuPk0S7E/18UHEavyu+AN0k9zbyoQwlA7E0A7vzIk+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tasnA9H3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=uSAfBYVs9O7mrCMotsdguKDhfHaZDH8a5pNMaHePSh0=; b=tasnA9H3YLV0NT4JfFREuNpIdo
	OxPxG8SdbGqID2uAgsCJEgLJ3LD+K00E54qKIABuPfG8Q/5ehGXeQdqDu7tI6PfLnv4VZVNZyBtEp
	P1GlOsbAsYJotOuRDcy4UlYf56OoP/tPzvQsQueYrUo/0IEPzYthc1tr02fpi223L934Mc15rpGc1
	mvWJqYUsCDtFORdGAe1ZctnAUC2H4u5ft3WeUrwQf8eZKmCkSb5MLwe0FLwTh2Tg8KhjX6SrRSuyo
	VaBxw7gVvWIBxfDodrKCwmaI/996Xq4IwQC/i3NsHXGUTxjzMjXJSCp2pJeWag8ooOE2KeGZZpLOH
	6NyHhgtQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQbS-0000000Fppp-3ABu;
	Thu, 27 Nov 2025 01:15:22 +0000
Message-ID: <8db7155d-f941-4ad3-b0a5-376c2cfc1ed5@infradead.org>
Date: Wed, 26 Nov 2025 17:15:22 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] docs: media: v4l2-ioctl.h: document two global
 variables
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <cover.1763978209.git.mchehab+huawei@kernel.org>
 <8a834e98624795aa02070752d3d49a9ba40a86e7.1763978209.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <8a834e98624795aa02070752d3d49a9ba40a86e7.1763978209.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/25 1:57 AM, Mauro Carvalho Chehab wrote:
> The media kAPI has two global variables at v4l2-ioctl.h. Document
> them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  include/media/v4l2-ioctl.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index 6f7a58350441..54c83b18d555 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -663,7 +663,22 @@ void v4l_printk_ioctl(const char *prefix, unsigned int cmd);
>  struct video_device;
>  
>  /* names for fancy debug output */
> +
> +/**
> + * var v4l2_field_names - Helper array mapping ``V4L2_FIELD_*`` to strings.
> + *
> + * Specially when printing debug messages, it is interesting to output
> + * the field order at the V4L2 buffers. This array associates all possible
> + * values of field pix format from V4L2 API into a string.
> + */
>  extern const char *v4l2_field_names[];
> +
> +/**
> + * var v4l2_type_names - Helper array mapping ``V4L2_BUF_TYPE_*`` to strings.
> + *
> + * When printing debug messages, it is interesting to output the V4L2 buffer
> + * type number with a name that represents its content.
> + */
>  extern const char *v4l2_type_names[];
>  
>  #ifdef CONFIG_COMPAT

-- 
~Randy

