Return-Path: <linux-media+bounces-4600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE097846D4F
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 11:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D23E1F281F8
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 10:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A311A77F15;
	Fri,  2 Feb 2024 10:04:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBDB69D22
	for <linux-media@vger.kernel.org>; Fri,  2 Feb 2024 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706868295; cv=none; b=GRlk8OE3kLP5H4pkWKdjGQQMG8VKu90jxWIMfeMiFD8h63f6KXSUQnMdZuchrfPkb4aNcMS/nAwzTF5L/teHPBqUQOSTK//pylOF8iq0dJl1GGYmLB6crvAsytgzydAYmf8gxHSaJQ8Zwy54A20T+SfrO6AaKI7WbyQmEkzMh+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706868295; c=relaxed/simple;
	bh=bsqH1zxuhrSriBytE35ViRABx/BmBp16b3bXBNQp30s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4SvgOYfvYuMFmdpJYd9YMbHRXAEZZM/vr+WKj05JLCx4sY6fsKW42AL2TVX4kIh71iezezoadU61szOpvzCOv8HxFPBlqmSwcFyLVGlJV0OrN06n8ZFPEvZ0oPH6FcyG5GRKosMvMoxlCYi5DVkETncKl/y/9PhTJVBJzJnEdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D3CC43399;
	Fri,  2 Feb 2024 10:04:54 +0000 (UTC)
Message-ID: <c9ae83a9-de76-433a-8d1a-0aae69e50629@xs4all.nl>
Date: Fri, 2 Feb 2024 11:04:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: atomisp: make dbgopt static
Content-Language: en-US, nl
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
References: <cover.1706865681.git.hverkuil-cisco@xs4all.nl>
 <186826ed0f3d3ff42171fdabb30897f03575141a.1706865681.git.hverkuil-cisco@xs4all.nl>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <186826ed0f3d3ff42171fdabb30897f03575141a.1706865681.git.hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/02/2024 10:21, Hans Verkuil wrote:
> This fixes a sparse warning:
> 
> drivers/staging/media/atomisp/pci/atomisp_drvfs.c:40:14: warning: symbol 'dbgopt' was not declared. Should it be static?
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Fixes: b03301870d9b ("media: atomisp: Replace atomisp_drvfs attr with using driver.dev_groups attr")

> ---
>  drivers/staging/media/atomisp/pci/atomisp_drvfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
> index 293171da1266..ba7dd569a55a 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
> @@ -37,7 +37,7 @@
>   *        bit 1: running binary
>   *        bit 2: memory statistic
>   */
> -unsigned int dbgopt = OPTION_BIN_LIST;
> +static unsigned int dbgopt = OPTION_BIN_LIST;
>  
>  static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
>  				    unsigned int opt)


