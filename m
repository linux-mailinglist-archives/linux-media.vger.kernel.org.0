Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA784E25C8
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 12:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242001AbiCUL6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 07:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347051AbiCUL6F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 07:58:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090942AFB
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 04:56:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74111291;
        Mon, 21 Mar 2022 12:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647863798;
        bh=HKAVCukOS/e4HrvR7ZtbJqC2sMl1V0Pv5aJjVMW1zSs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mQ8JuwFvluvx3fAGWRsZT8hQF47/n9pNVYVx8YIheSEtbqHHuVhasQufAq9mVZz58
         2AtvH4SgvBkxOCkTDNkTQECj5h+bdeTjM1Mv4b37BmjxxjcS5xDAgJr/xX0RJBGPLx
         s3FWxqMvxB0JYOLo3Ad/3UrRbTyGeiJ06O+P/reA=
Date:   Mon, 21 Mar 2022 13:56:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH for 5.18] v4l2-compat-ioctl32.c: zero buffer passed to
 v4l2_compat_get_array_args()
Message-ID: <Yjhn5aOXbbok798U@pendragon.ideasonboard.com>
References: <b80719f3-cff2-89f2-3ad1-d8e708808dbd@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b80719f3-cff2-89f2-3ad1-d8e708808dbd@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, Mar 21, 2022 at 09:33:56AM +0100, Hans Verkuil wrote:
> The v4l2_compat_get_array_args() function can leave uninitialized memory in the
> buffer it is passed. So zero it before copying array elements from userspace
> into the buffer.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: syzbot+ff18193ff05f3f87f226@syzkaller.appspotmail.com

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index 0f3d6b5667b0..55c26e7d370e 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -1040,6 +1040,8 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
>  {
>  	int err = 0;
> 
> +	memset(mbuf, 0, array_size);
> +
>  	switch (cmd) {
>  	case VIDIOC_G_FMT32:
>  	case VIDIOC_S_FMT32:

-- 
Regards,

Laurent Pinchart
