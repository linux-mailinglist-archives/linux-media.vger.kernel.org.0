Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055E52A01EB
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 10:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgJ3J5J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 05:57:09 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:48377 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726014AbgJ3J5J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 05:57:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YR9aknaYkWvjMYR9ekGvTG; Fri, 30 Oct 2020 10:57:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604051826; bh=qR/xF66rx/kb0/CWlACoiFP6bxZ/h+wixTYAe0Vx8qI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RGMc1R3hJRfi42zMJy7AuV+DotPaHfJ6biMuRR4jqJd7H3XQBsRaJ4Fkh5/MqCqkm
         Q+3bE13AHy2eVgXay44HGlppmRcnQogTSjcc8PIT+pgThcNqTrpZ/dNYuftFnPQRz0
         fuCF5j3CjtqnhnVkvSc2bQ5ixI5oIShIhDTOkF4Soyn+y8w7WfD0WvAH1JyUXtKGNC
         m9zvC55/TmdHnM6u5NuwKAUNTuT4e6PaIho8O3DI4eX2r/pw2brWafUDy+48Wr9sPo
         goHwLxA6uvZ9rDHpM1EmzbLipPGOXYJoerQuVMT50r/7cARrhA50S4hU7sq44O397P
         GYg/z4W3Zs+jQ==
Subject: Re: [PATCH] media: platform: ti-vpe: Update the path to firmware
To:     Nikhil Devshatwar <nikhil.nd@ti.com>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sekhar Nori <nsekhar@ti.com>
References: <20201012125200.11643-1-nikhil.nd@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <14827fb7-4c2d-426d-cfde-221fd8c39c20@xs4all.nl>
Date:   Fri, 30 Oct 2020 10:57:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012125200.11643-1-nikhil.nd@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIFFxvlx7jw+81EAx/ntmNWSimfrQF98N+UV85NCNmLCEbnAKICKk//bu1o0RyPN8w4NKhWvPOZQNgUf4OSPqRjqmGTNK08/aYgcTKrswgtJD1DnQoIF
 TGo8yI5BGTuCYHy6fGv6c0REx2Nl7yDn5g0H3KNOC6lAFwrDjeWRSM5lj889nAAYAF853f5zcA4GIQPd/Fxop/f3NGuSeruPjlvHmtdbqRd7cLjeoaVBx+co
 bLSm/75sJpiHoFDsipvO4+UdVztfuQ92xnHmpJwE1dlHiNYEDvtG60AtO1dX+7wySK2BwTfhRW4UmkfZboJBeNG8HPQVYwdcxHD6u7AceGkOhNA07jJExs2s
 SgY4ixGZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nikhil,

On 12/10/2020 14:52, Nikhil Devshatwar wrote:
> vpdma firmware is now available in the linux-firmware repo.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ti-connectivity/vpdma-1b8.bin
> 
> Update the firmware path requested by the VPDMA driver so that
> it gets looked up correctly in the filesystem.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  drivers/media/platform/ti-vpe/vpdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
> index 2e5148ae7a0f..5a378449a4ff 100644
> --- a/drivers/media/platform/ti-vpe/vpdma.c
> +++ b/drivers/media/platform/ti-vpe/vpdma.c
> @@ -23,7 +23,7 @@
>  #include "vpdma.h"
>  #include "vpdma_priv.h"
>  
> -#define VPDMA_FIRMWARE	"vpdma-1b8.bin"
> +#define VPDMA_FIRMWARE	"ti-connectivity/vpdma-1b8.bin"

Based on the discussion, this will change to ti/vpdma-1b8.bin, right?
At least once linux-firmware has been updated.

I'll wait for a v2.

Regards,

	Hans

>  
>  const struct vpdma_data_format vpdma_yuv_fmts[] = {
>  	[VPDMA_DATA_FMT_Y444] = {
> 

