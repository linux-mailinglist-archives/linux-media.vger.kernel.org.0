Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D08EF4F00C3
	for <lists+linux-media@lfdr.de>; Sat,  2 Apr 2022 12:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354459AbiDBKta (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Apr 2022 06:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235134AbiDBKt3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Apr 2022 06:49:29 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94438123BE3
        for <linux-media@vger.kernel.org>; Sat,  2 Apr 2022 03:47:35 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-deb9295679so5341909fac.6
        for <linux-media@vger.kernel.org>; Sat, 02 Apr 2022 03:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1OivuGzWm0VESEPEgfxYY6nVc0C7XuNwx+ZMYkOHfp4=;
        b=Ks+F9QvgBiTaMsa7oYbUpV+XS5AE5/s0mjYmEGJuukdNcJTIECnJ/Ja2RBrh/fSfBi
         6iTLRj5nFKxs11cqWPSyDPxDrovxO0/fY+3tcQGxzQeclqcXb8SoMlu3Tm9ERo5JhsvZ
         5X6Y8imZwiftFEF7BVOhiXoQMRsi5xG17oYBJ774rnr1vbHgnsntcRkMc0o5fFEZ0OMl
         s2W+iPDb6HVxEiyh3Q4/157nLW0NniVVEOPJ7zfOmKYUUEc9fZL0naSPPWj1EYpBcIrL
         Impt1IQ4YYhHApn3xazb3XoW2gJgBZrNaWA1sp9pKBusExzd/Cq+ZdsBA8GBBaw8aVzF
         vf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1OivuGzWm0VESEPEgfxYY6nVc0C7XuNwx+ZMYkOHfp4=;
        b=Gev1V8FrHHsRThy1rTIfVGJeFQoFDnewvxf4lw3fht5SwTWV44uZ2idRqXoOwmHdx+
         IVCIdqqV6KLkzc5nVW6wqjAA2DJC3JM/CJDx4Cdzou05viUY28MMWER4OOTyuYvWrChd
         2E+IUH/6vbEOhPNEYXcD4wGuKSoCgiVX96C9CbbFxYHs9bUZtVJCN2R47PFh3DguqOMc
         HICgGEYWqIAMURyp4t/fV1QuIkDBNbqKj1HbB4y18+jG0abI+bFYzpWTXKc6hzhu0nDB
         6kg9GS3X6ks+0wyLfxr0g9F6vaVIsA8NUPhvXn2SkjZXHgzSe1ALA3V73Z4s7fSex+Sx
         Ripg==
X-Gm-Message-State: AOAM531JhvgbO7Wld+hq5ykY0TTBaGAB3zLi7AYsWDtfoHM/2ulVmSV/
        jxkWGDiJLK8OVtHg5pm+FIgWxSAFN1tU/A==
X-Google-Smtp-Source: ABdhPJwLQ2SUunXzeJJIacHtmRCxg69qWVmJdv2qhkzrMF4sbi/h5nVWFS+qSBOBSw4xwJxaV8lZJQ==
X-Received: by 2002:a05:6870:c189:b0:da:b3f:2b5d with SMTP id h9-20020a056870c18900b000da0b3f2b5dmr6909870oad.252.1648896454971;
        Sat, 02 Apr 2022 03:47:34 -0700 (PDT)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id 67-20020aca0546000000b002d46e151b9bsm2023410oif.18.2022.04.02.03.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 03:47:34 -0700 (PDT)
Date:   Sat, 2 Apr 2022 07:47:29 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@collabora.com,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/23] media: v4l2-mem2mem: Trace on implicit un-hold
Message-ID: <YkgpwSJFkOH9+tuA@eze-laptop>
References: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
 <20220331193726.289559-3-nicolas.dufresne@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331193726.289559-3-nicolas.dufresne@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 31, 2022 at 03:37:04PM -0400, Nicolas Dufresne wrote:
> If the timestamp of the src buffer differs from the timestamp of a held
> dst buffer, the held buffer is implicitly removed and marked as done.
> Add a trace to help debugging if someone hits that case.
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index 675e22895ebe..fbcd79763e8f 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -336,6 +336,7 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
>  	if (src && dst && dst->is_held &&
>  	    dst->vb2_buf.copied_timestamp &&
>  	    dst->vb2_buf.timestamp != src->vb2_buf.timestamp) {
> +		dprintk("src and dst timestamp mismatch, removing held capture buffer.\n");

Nitpick: I would try to make this log consistent with the other logs,
avoid refering to "src" and "dst" and start with a capital letter.

How about "Timestamp mismatch, returning held capture buffer".

Either way, thanks for improving this.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

>  		dst->is_held = false;
>  		v4l2_m2m_dst_buf_remove(m2m_ctx);
>  		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
> -- 
> 2.34.1
> 
