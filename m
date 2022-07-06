Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E246567DDB
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 07:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbiGFFem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 01:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiGFFel (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 01:34:41 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DB820F55
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 22:34:40 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id s21so9674791pjq.4
        for <linux-media@vger.kernel.org>; Tue, 05 Jul 2022 22:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oKugON8W2AXb8/foS49g/nmwaLHb/Gu5gZSfrbOn1gs=;
        b=BhcDUrgos44tc5w9+4nYzaQpIu+yVMRhCn7z6foDxGJ7jris2BjKXCDcYIKZA4S4Hs
         iPh9xAnhqek9qKQkZdcc3c2ztREMC1ci8YawvVJsLU8mZVHMuHG4y9MBeTxeJ6tC+UrA
         0JS+nHQkEUUUhCubKINsJ9OG9kduWatz2yJdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oKugON8W2AXb8/foS49g/nmwaLHb/Gu5gZSfrbOn1gs=;
        b=O7Y9r1U7yD/KpjlpFPx2Aacqxu1mbCEJ+FQyyYxUPTgogcg2Pq0PIEJWuM3Mde3+jU
         GmG6P6y3GhYsFWIBrgAtEjKVyAPrVXOqNfEV96mcOvCpE07zNInt6rWUIuYFt/xCgQ+1
         JtA0hwMWtbYCy8v1HNJD8Y7cmGV4JRVYUTjSWLAlNEbv7hogYaLtuWgSESzfshAA2a6D
         sTGJNiS0wTWocxGjyiiiwRB7zen6WmdQXeWKGxyYaaVK+NUWmkOU+EMmf0pytdbpV852
         jCuXx7IGg3tSOWg+g3DIo+v1NQeJ1vfmMPmIGQFd08Hij//7RRgX3wj6291PQvOE9Cf8
         KyGw==
X-Gm-Message-State: AJIora/CXCRhXmVcaKHIs6lDADfw9GtIfxDCIfGOF/8lhLDnQcUWXky+
        TfpFc93ge6foDveI3Mmpjj6eWQ==
X-Google-Smtp-Source: AGRyM1vm/XCRleXBhsGxZBZicviHxMlEw6R9qk+Imp4+WCV2azoZhkwEz6cNM9794WrkoaxRl0L08w==
X-Received: by 2002:a17:90b:1e02:b0:1ec:d979:4a8e with SMTP id pg2-20020a17090b1e0200b001ecd9794a8emr45449771pjb.181.1657085680475;
        Tue, 05 Jul 2022 22:34:40 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:ebe3:37b4:669a:d932])
        by smtp.gmail.com with ESMTPSA id m7-20020a1709026bc700b0016b8b5ef703sm17430212plt.55.2022.07.05.22.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 22:34:39 -0700 (PDT)
Date:   Wed, 6 Jul 2022 14:34:36 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 3/3] media: vsp1: Use vb2_queue_is_busy()
Message-ID: <YsUe7J0XDS979KBM@chromium.org>
References: <20220318211446.11543-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220318211446.11543-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318211446.11543-4-laurent.pinchart+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Mar 18, 2022 at 11:14:46PM +0200, Laurent Pinchart wrote:
> Use the new vb2_queue_is_busy() helper to replace the open-coded
> version.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> index 8f53abc71db2..4da70b2b0869 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -1032,7 +1032,7 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
>  	struct vsp1_pipeline *pipe;
>  	int ret;
>  
> -	if (video->queue.owner && video->queue.owner != file->private_data)
> +	if (vb2_queue_is_busy(&video->queue, file))
>  		return -EBUSY;
>  
>  	/*

Thanks for the patch and really sorry for the long delay. Finally
catching up with my backlog.

An alternative would be to have all the stream start code placed under
the vb2 start_streaming callback, symmetrically to
what the driver already does with streamoff/stop_streaming. That would
eliminate the need to export the symbol from the vb2 framework.

Have you considered that option?

Best regards,
Tomasz
