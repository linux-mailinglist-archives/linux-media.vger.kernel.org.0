Return-Path: <linux-media+bounces-2426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 331DE8136AD
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 17:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD01B1F22167
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 16:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746FB60BB3;
	Thu, 14 Dec 2023 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IM9/nSfD"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6D2129;
	Thu, 14 Dec 2023 08:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=KFQntNityiHH+/UdbCUVWZRw9YvJLMgmVI5Az93hmjQ=; b=IM9/nSfD9of+z7g3I48W0bxn06
	2iFUJmsUNAYOJKrCeRWhcRjuTIkhF8HjZIicADH8iVFnf615BMznsGdXc6dyy0PdXV6kOMhmzByVD
	lLOlI849SQNZD5xFS5dd7EnLmh3ilNNe/a3zRf7P2eqQnXIJvfg7jraXiAVnwBVNMkyhAyZVqhCu3
	SmsIFcJuTDpRkZBdi5dzlnz13dLu7u9eqQbHhxVjqHCSMNH6RCbov8qUJ7NHWYW/PvEkkmgTFGd5R
	fad9PUD9rCwAbHDtfTmrEg7oCbWTpVB224z6jGLu2ECwXJejnSjvx/KCcojOjE15T5RCdrjk2JcPT
	g/JzVjfA==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rDoqv-000qQy-3D;
	Thu, 14 Dec 2023 16:46:26 +0000
Message-ID: <f3a196d0-d15b-4929-857d-18ef77f693a3@infradead.org>
Date: Thu, 14 Dec 2023 08:46:21 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: xilinx: Fix Kconfig indentation
To: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <72c40d216769a97973cac9a347e826b943f71d7f.1702543638.git.michal.simek@amd.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <72c40d216769a97973cac9a347e826b943f71d7f.1702543638.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/14/23 00:47, Michal Simek wrote:
> Use proper indentation for Kconfig fragments - help part.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
>  drivers/media/platform/xilinx/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/platform/xilinx/Kconfig
> index 93ef78bf62e6..601edd9acd5b 100644
> --- a/drivers/media/platform/xilinx/Kconfig
> +++ b/drivers/media/platform/xilinx/Kconfig
> @@ -26,10 +26,10 @@ config VIDEO_XILINX_TPG
>  	depends on VIDEO_XILINX
>  	select VIDEO_XILINX_VTC
>  	help
> -	   Driver for the Xilinx Video Test Pattern Generator
> +	  Driver for the Xilinx Video Test Pattern Generator
>  
>  config VIDEO_XILINX_VTC
>  	tristate "Xilinx Video Timing Controller"
>  	depends on VIDEO_XILINX
>  	help
> -	   Driver for the Xilinx Video Timing Controller
> +	  Driver for the Xilinx Video Timing Controller

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

