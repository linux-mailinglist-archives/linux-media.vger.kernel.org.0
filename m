Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3CDC3924E2
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 04:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233296AbhE0CbT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 22:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhE0CbS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 22:31:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711F1C061574;
        Wed, 26 May 2021 19:29:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D44C4549;
        Thu, 27 May 2021 04:29:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622082582;
        bh=UIARpnsIvR65Zm+3SZ8OpsB0W6P5+PMfjwBwTb2xSQM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L4i70Jw8pueiHx2gN76l5gQz6VVwZwtxI5y2Sed5Ljvz9x+5lPwpaKbXWX6ZpKtmy
         i0hKpO5gQjk5PpGTT2p5rVAXdgAZrYGevtaZjvHWqHtol8IVE82FaACo2MHS/e39pb
         6zP+PRRpTuBUIK3YLX+AeQnmNaBUkR4TmS9iAmec=
Date:   Thu, 27 May 2021 05:29:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     lijian_8010a29@163.com
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, arnd@arndb.de,
        sakari.ailus@linux.intel.com, sergey.senozhatsky@gmail.com,
        gustavoars@kernel.org, yepeilin.cs@gmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: Re: [PATCH] media: v4l2-ioctl: deleted the repeated word 'the' in
 the comments
Message-ID: <YK8EEJSDOm/SW/k9@pendragon.ideasonboard.com>
References: <20210527015243.117654-1-lijian_8010a29@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210527015243.117654-1-lijian_8010a29@163.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 27, 2021 at 09:52:43AM +0800, lijian_8010a29@163.com wrote:
> From: lijian <lijian@yulong.com>
> 
> deleted the repeated word 'the' in the comments of function
>  v4l_sanitize_format()
> 
> Signed-off-by: lijian <lijian@yulong.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 2673f51aafa4..5a232fd32cf3 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -999,7 +999,7 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
>  	/*
>  	 * The v4l2_pix_format structure has been extended with fields that were
>  	 * not previously required to be set to zero by applications. The priv
> -	 * field, when set to a magic value, indicates the the extended fields
> +	 * field, when set to a magic value, indicates the extended fields

The original intent may have been to write "... indicates that the ...".

>  	 * are valid. Otherwise they will contain undefined values. To simplify
>  	 * the API towards drivers zero the extended fields and set the priv
>  	 * field to the magic value when the extended pixel format structure

-- 
Regards,

Laurent Pinchart
