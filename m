Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9CD5BC9D2
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 12:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbiISKsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 06:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbiISKsN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 06:48:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997DF23163
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 03:37:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFE1B9BA;
        Mon, 19 Sep 2022 12:37:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663583837;
        bh=fTmThyphIUqRY1NsdbLgj4UpsLijWinKa66QX2ZjlRA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ulmhwtfbXLLVKMu+gvOaYkDBWofyxuhYjwv7nuRlpaR9QdIHiITTnR6in506HOhOq
         ojlstyCWOXW0+0npkx6nm48SNuwDn9cgHWqU4NQ0vmo/F1bHdc3UxZmEwF19qY6hO/
         WrDAo6KwCeOueKA9zwsBK8yiY4gksjBobyfhEEus=
Date:   Mon, 19 Sep 2022 13:37:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: v4l: subdev: Document s_power() callback is
 deprecated
Message-ID: <YyhGT476cNV32ZJN@pendragon.ideasonboard.com>
References: <20220919101004.3799904-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220919101004.3799904-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Sep 19, 2022 at 01:10:04PM +0300, Sakari Ailus wrote:
> Runtime PM has been around for a decade or more, there's hardly a need to
> use the V4L2 specific s_power() callback in drivers anymore. Document this
> in s_power() callback documentation as well.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-subdev.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 2f80c9c818ed0..ed14ce5864cac 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -176,7 +176,8 @@ struct v4l2_subdev_io_pin_config {
>   * @s_register: callback for VIDIOC_DBG_S_REGISTER() ioctl handler code.
>   *
>   * @s_power: puts subdevice in power saving mode (on == 0) or normal operation
> - *	mode (on == 1).
> + *	mode (on == 1). DEPRECATED. See
> + *	Documentation/driver-api/media/camera-sensor.rst .

Could you mention that pre_streamon/post_streamoff cover the use case of
bus initialization ? s_stream is commonly used for that purpose. With
that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>   *
>   * @interrupt_service_routine: Called by the bridge chip's interrupt service
>   *	handler, when an interrupt status has be raised due to this subdev,

-- 
Regards,

Laurent Pinchart
