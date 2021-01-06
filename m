Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF04C2EC4C8
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 21:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbhAFUUp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 15:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbhAFUUn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 15:20:43 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4299FC061575
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 12:20:03 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id a6so3415289wmc.2
        for <linux-media@vger.kernel.org>; Wed, 06 Jan 2021 12:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=w3vu7Q77s3pJWhDM2ZQklqoYrnX9v2imWoObUc3E/RA=;
        b=ctIAJZXn1n8n6ErtdFx+i0m//hYktYCyTIp+fkL2LcY4Jfm0wKjplw4EPnBOWExPAF
         tm1apLDsKQTMmoQJulDnTwruR9Hsv/yMpbPSwvB33Dn0xO8hHEGo06j0Mq+sinPqwyZs
         kWZVEpQfTT0gtFMj0arQ6YCHOg8raZObUVbJLy3IpkYwflXc322j700Bc561ZRWT68Qr
         WImc4bVeS/KdcVxYAC3M6Lh5048xfOZ+mJi3bkLkEPN0k184n8amf7w7eb1X+DXPr41W
         BYDH63AMZUvCTtDjclrX3JOjBQH+bUaDAXZVik31j8KCdfx49K2tkomwviBCLVObiuL0
         DAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=w3vu7Q77s3pJWhDM2ZQklqoYrnX9v2imWoObUc3E/RA=;
        b=EGN0L5/1CE/gsMx8REtT0/UXQ6uP2zhuIvg2Lxz9JS7IlpJ5kmpmHqy+0KCJKcQSwp
         VO2+8MCp5FyOkgjDRfhl5P2uQ/LuVjIiqoag8FOVQz6HQIYC/UE4a+d0XKPegAJJe8i7
         Q8VzinKnFYzaSPLh71inFJ37j04OnMteXXzSQ138uX19x5La2BhTPRHbgHaB7s7wIJ5q
         bcDeEuuvS6qo2peSWiKKW2qR53Bik+zYxwD8ppy/lxV1fP7b0Se3njnpcbLLOqEBqVqb
         D7n+2/4uPkpRDykeaIeAcLnDuKhf0eSFPIKCoOhSK74SilItc6O1dkp3l0sVES7clp/f
         XpSQ==
X-Gm-Message-State: AOAM532npHkeNxfgq+lmgbRM6cZkWPv3ZVyEhDHkCsDGDcSPkJRFDS8E
        J/AfcpDtHCl9UTrGZnr8QxqzFw==
X-Google-Smtp-Source: ABdhPJyBV1GURnIjVGPvwWRfM4Ufh3xwem8TBRk7I5b9Hoc2Gd8ZantU2ae2Sew+89YLsf+t89oB0A==
X-Received: by 2002:a7b:c1d7:: with SMTP id a23mr5101496wmj.62.1609964401954;
        Wed, 06 Jan 2021 12:20:01 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id n16sm4435939wrj.26.2021.01.06.12.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 12:20:01 -0800 (PST)
Date:   Wed, 6 Jan 2021 21:19:58 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Zheng Yongjun <zhengyongjun3@huawei.com>, mchehab@kernel.org,
        mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH -next] media: zoran: use resource_size
Message-ID: <X/Ybbj6gN2xrhIwP@Red>
References: <20210106131702.32507-1-zhengyongjun3@huawei.com>
 <20210106145100.GJ2809@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210106145100.GJ2809@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Wed, Jan 06, 2021 at 05:51:00PM +0300, Dan Carpenter a écrit :
> On Wed, Jan 06, 2021 at 09:17:02PM +0800, Zheng Yongjun wrote:
> > Use resource_size rather than a verbose computation on
> > the end and start fields.
> > 
> > Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> > ---
> >  drivers/staging/media/zoran/zoran_driver.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
> > index 808196ea5b81..d60b4c73ea80 100644
> > --- a/drivers/staging/media/zoran/zoran_driver.c
> > +++ b/drivers/staging/media/zoran/zoran_driver.c
> > @@ -1020,7 +1020,7 @@ int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq)
> >  	vq->buf_struct_size = sizeof(struct zr_buffer);
> >  	vq->ops = &zr_video_qops;
> >  	vq->mem_ops = &vb2_dma_contig_memops;
> > -	vq->gfp_flags = GFP_DMA32,
> > +	vq->gfp_flags = GFP_DMA32;
> 
> The commit doesn't match the patch.  Also this driver is in
> staging because it's going to be deleted soon so there probably isn't
> much point doing cleanups.
> 

No, the driver just came back in staging since I fixed the videobuf2 conversion.
One of the reason it is kept in staging is that media maintainer want to test it with its own zoran card but covid19 delayed the physical recovery of it.

So the patch need to be resent, please.

Regards
