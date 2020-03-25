Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8911192EB2
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 17:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgCYQyd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 12:54:33 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:51505 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726102AbgCYQyd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 12:54:33 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id H9IRjgCfxBr2bH9IVjIfa9; Wed, 25 Mar 2020 17:54:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585155271; bh=iS6jb4nVJ328cKw60HlU88wMMG8URM3B8kU0TKTSFwk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JyaRjhBB/u8lB+ErXH87D1DRxhYADFSvqbHzIlXTnd0ATOhEycyJGDKsojsH77EJ+
         0+vWuyJPOQSilaN2ZzmFiSInijLlaKoLCvQfl4rzI4zqkXTiielD++mshFjV4htRwq
         Ob3TQC/8pHRqRySATtrFD/0EcQzf+sMM8/9Vi28dGaF9y+U7Yzh6m+siTSS6lhxaAT
         DZHSmW3TmuLSFzac39OPgic3SEGEmOeq7P9wwBNhrKd4RH9hBh+qMiMVOl/BC4VtBo
         uHBCOCbsOrHK3Y0AFIqNnsWSUdmzFMsOJNWcbyfyDisIi97l6hoQ9y9JYqZm+z0wXH
         syHcQYTAfPowg==
Subject: Re: [PATCH] media: v4l2-fh: define v4l2_fh struct regardless of
 condition
To:     Seungchul Kim <sc377.kim@samsung.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20200323023045epcas2p12007502edd2a65efcccb00eb899d5532@epcas2p1.samsung.com>
 <000601d600bb$0e2d4320$2a87c960$@samsung.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1a0ad24c-e577-e6d2-32ca-514a645b008f@xs4all.nl>
Date:   Wed, 25 Mar 2020 17:54:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <000601d600bb$0e2d4320$2a87c960$@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGng8Vdo9jUZGcpRDgzESsB6NHS45BZGfTGDBsC9roLpcV9T8CExtqLySQSFtV4/qFoaWwGGPz5IU77Ntr93Rp9ex8h8R2420eKGxAac6x02VNCgSVoh
 VSHi59yqPhj51j7GRONzRfEWvpYnPsKCIwmPdIabiRsiz8qNKOVMXx/Hn6OGg/qTh9bcZhKqu2IatXCP2b3ubEWKiFL727JXEBswPfVQ7slEQxupfLpOdpjg
 zlNWq0pe/3AMChpElln0+O7SNNYuYQfherSEjR4yJaxTY/5iKSblCOVlV1HF2j+6
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/23/20 3:30 AM, Seungchul Kim wrote:
> v4l2_fh struct define differently by CONFIG_V4L2_MEM2MEM_DEV.
> If some vendors use CONFIG_V4L2_MEM2MEM_DEV by module, it can make the
> mismatch of v4l2_fh sturct.
> 
> By the mismatch, the following error occurs.
> ===============================
> [    7.533506] v4l2_mem2mem: disagrees about version of symbol video_devdata
> [    7.533594] v4l2_mem2mem: Unknown symbol video_devdata (err -22)
> [    7.535319] v4l2_mem2mem: disagrees about version of symbol
> v4l2_event_pending
> [    7.542532] v4l2_mem2mem: Unknown symbol v4l2_event_pending (err -22)
> ===============================
> 
> So v4l2_fh struct is modified to does not have dependency for
> CONFIG_V4L2_MEM2MEM_DEV.
> 
> Signed-off-by: Seungchul Kim <sc377.kim@samsung.com>
> ---
>  include/media/v4l2-fh.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h index
> 53b4dbb..b5b3e00 100644
> --- a/include/media/v4l2-fh.h
> +++ b/include/media/v4l2-fh.h
> @@ -53,9 +53,7 @@ struct v4l2_fh {
>  	unsigned int		navailable;
>  	u32			sequence;
>  
> -#if IS_ENABLED(CONFIG_V4L2_MEM2MEM_DEV)
>  	struct v4l2_m2m_ctx	*m2m_ctx;
> -#endif

This is a good change, but please also remove the same #if from v4l2_ioctl_get_lock()
in drivers/media/v4l2-core/v4l2-ioctl.c. That is now no longer needed there either
and without removing that those vendor drivers would be using the wrong lock.

Regards,

	Hans

>  };
>  
>  /**
> --
> 2.7.4
> 

