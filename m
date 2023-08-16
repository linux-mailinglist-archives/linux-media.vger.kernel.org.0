Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 688A777E7E2
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 19:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345116AbjHPRtJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 13:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345068AbjHPRsf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 13:48:35 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDD11FD0
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 10:48:34 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4RQwbZ46xfzyks;
        Wed, 16 Aug 2023 20:48:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1692208110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uAzcc6JtZWWir62VQppfsDrI6LB9msLvExd+Vrj0NkE=;
        b=ik9BvtZgVvYQKpz+DPWg8e90mIMelckLYxixu63WVpM4eLRdtV4Cm9buftZES1cwVhgIYV
        qKO4INr+50SnmUDj65q7evw/y2IQgJbG0NGCKK9w26BTnVhWb7NpM/pKOelHfS3kfGCFIF
        mGNmpL/nhGjcVSKp9Q2tK3r0gUG15B0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1692208110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uAzcc6JtZWWir62VQppfsDrI6LB9msLvExd+Vrj0NkE=;
        b=g3AZeJAV2OK6+XkzS9JK6bG6oLpe0c5hol91oNaO92Fk4W9SwXK/oYYCpDs51Ec56OG3fd
        5B1iaStP9AsJ0JVPMsNImEtV+N6LrVJbLS3WK+CsO1Di13wgwTq4xZv7VS+NGpqUsMXGvc
        YYLPxwSNr2QtIObqCONNnKx89RoAFZc=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1692208110; a=rsa-sha256; cv=none;
        b=Q/rpJGfDua7E/93eYHsVrjvY5RviHxzBdYJbmunvROjilaiyM8kqIhfNfECJgUZFVAVSIH
        u/bIMuMtlMvRcq2nOxkcoT3ma0wY8RdLditewq+/PU7eJyqT58nwC/dCeN+kA2nOAMEqdF
        QZsjfz11RFy0V6bMDhOwGhY0OyudO/0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C5AEF634C95;
        Wed, 16 Aug 2023 20:48:25 +0300 (EEST)
Date:   Wed, 16 Aug 2023 17:48:25 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-mediatek@lists.infradead.org,
        Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH] media: videobuf2-core.c: check if all buffers have the
 same number of planes
Message-ID: <ZN0L6SAWlr+KZTVK@valkosipuli.retiisi.eu>
References: <e75ff985-2499-9a16-21fe-ee2e81547e6f@xs4all.nl>
 <20230816143432.GA4436@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816143432.GA4436@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Laurent,

On Wed, Aug 16, 2023 at 05:34:32PM +0300, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Wed, Aug 16, 2023 at 02:47:33PM +0200, Hans Verkuil wrote:
> > Currently if VIDIOC_CREATE_BUFS is called to add new buffers, then the requested
> > number of planes per buffer might be different from the already allocated buffers.
> > 
> > However, this does not make a lot of sense and there are no drivers that allow
> > for variable number of planes in the allocated buffers.
> > 
> > While it is possible do this today, when such a buffer is queued it will fail
> > in the buf_prepare() callback where the plane sizes are checked if those are
> > large enough. If fewer planes were allocated, then the size for the missing
> > planes are 0 and the check will return -EINVAL.
> > 
> > But it is much better to do this check in VIDIOC_CREATE_BUFS.
> 
> I don't think this is a good idea. One important use case for
> VIDIOC_CREATE_BUFS is to allocate buffers for a different format than
> the one currently configured for the device, to prepare for a future
> capture (or output) session with a different configuration. This patch
> would prevent that.

I'd prefer to keep this capability in videobuf2, too. Although... one way
achieve that could be to add a flag (or an integer field) in struct
vb2_queue to tell vb2 core that the driver wants to do the num_planes
checks by itself.

It'd be also nicer, considering the end result, to configure this when
setting up the queue, rather than based on the first buffer created. This
would involve changing a large number of drivers though.

-- 
Regards,

Sakari Ailus
