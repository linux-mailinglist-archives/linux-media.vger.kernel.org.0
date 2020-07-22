Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A2F2299AF
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 16:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730870AbgGVOEB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 10:04:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726425AbgGVOEA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 10:04:00 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 034D72071A;
        Wed, 22 Jul 2020 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595426640;
        bh=vD1NxW7kOLSfAbm298saG/wWrWb+LYxUbp9VvYPUJFQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IyArLE0g04QibcnJXV16X14S96h4RuAedeYcoITNUg8sNZjizaRMLkScMQVTVVd3W
         W76oyKy37edCFFkO7lo7CfaHpJkt1B+y/U8ovnJqtDMxoOu54wpR+PUsSohTQ5iZDs
         Wl37Q+dorI2AMVPkWHOStHy391/FfQB0wq/kVyiw=
Date:   Wed, 22 Jul 2020 16:03:56 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Rahul Gottipati <rahul.blr97@gmail.com>
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: atomisp: Fix coding style issue - remove
 beginning whitespaces
Message-ID: <20200722160356.010a05df@coco.lan>
In-Reply-To: <5b2242008c92871daa5bfb7c9c3cafbbf592228b.1595416585.git.rahul.blr97@gmail.com>
References: <cover.1595416585.git.rahul.blr97@gmail.com>
        <5b2242008c92871daa5bfb7c9c3cafbbf592228b.1595416585.git.rahul.blr97@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 22 Jul 2020 16:58:31 +0530
Rahul Gottipati <rahul.blr97@gmail.com> escreveu:

> This removes whitespaces at the beginning of a few lines to fix
> some checkpatch.pl warnings.
> 
> Signed-off-by: Rahul Gottipati <rahul.blr97@gmail.com>
> ---
> Changes in v2:
> 	Distributed changes across 2 patches instead of the previous 1
> 
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index 9404a678fa6f..9cdcbe774229 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -512,7 +512,7 @@ const struct atomisp_format_bridge atomisp_output_fmts[] = {
>  };
>  
>  const struct atomisp_format_bridge *atomisp_get_format_bridge(
> -    unsigned int pixelformat)
> +				unsigned int pixelformat)

This is still a coding style violation, as:

1) the continuation line won't be aligned after the open parenthesis;
2) the line will end with an open parenthesis.

 A fix would be:

	const struct atomisp_format_bridge *
	atomisp_get_format_bridge(unsigned int pixelformat)

The same applies to similar patterns.

Yet, patches to atomisp have a high chance of having conflicts,
and being rejected, as we're doing lots of non-aesthetic changes 
on this driver.


>  {
>  	unsigned int i;
>  
> @@ -525,7 +525,7 @@ const struct atomisp_format_bridge *atomisp_get_format_bridge(
>  }
>  
>  const struct atomisp_format_bridge *atomisp_get_format_bridge_from_mbus(
> -    u32 mbus_code)
> +				u32 mbus_code)
>  {
>  	unsigned int i;
>  
> @@ -607,7 +607,7 @@ static int atomisp_enum_input(struct file *file, void *fh,
>  }
>  
>  static unsigned int atomisp_subdev_streaming_count(
> -    struct atomisp_sub_device *asd)
> +				struct atomisp_sub_device *asd)
>  {
>  	return asd->video_out_preview.capq.streaming
>  	       + asd->video_out_capture.capq.streaming



Thanks,
Mauro
