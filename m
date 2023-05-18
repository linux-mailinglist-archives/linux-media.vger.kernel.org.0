Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A6B707C49
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 10:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjERImF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 04:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbjERIl4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 04:41:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9391BFB
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 01:41:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 54116648D9
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3519C433D2;
        Thu, 18 May 2023 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684399297;
        bh=q96UZdNNJxlCvSuNSlwQ3aNQMA4bwve9fopkUvlWUbA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KQGpBi+KCiqJy26pNJurYrTiBAr7g9uovINklo/GnmI2Jv4jLlPXFQwamAsVvjMcr
         ffD/J+i5V+Xbw23jz8VLRlIbn2dSO51/CgsD8RaoIhACERCj+crgad+3/IRQpPIYhc
         kNR/P3r5vczAPCMWrtHtobJNyFNHZpHV0tGaNCG+0qQF8ZUqnyHYZc1GYjf8hSSmW5
         n+RvFIgzGUVKCie5jdFiUJcWtOxocD85aYNkvzRBHeNieznxpdU3iqUhczZXhQybYf
         MGMBpGocbUaK8VmIh9meoNjkeQc24wLq7344UBug0KbE16fhDZS9BZvBWlMcA4F4yo
         m7ys2HjDe7mIQ==
Date:   Thu, 18 May 2023 09:41:31 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-subdev: Fix missing kerneldoc for
 client_caps
Message-ID: <20230518094131.7d5057b7@sal.lan>
In-Reply-To: <20230418105924.126608-1-tomi.valkeinen@ideasonboard.com>
References: <20230418105924.126608-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 18 Apr 2023 13:59:24 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> escreveu:

> Add missing kernel doc for the new 'client_caps' field in struct
> v4l2_subdev_fh.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index cfd19e72d0fc..9d0a6a993fb0 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1119,6 +1119,7 @@ struct v4l2_subdev {
>   * @vfh: pointer to &struct v4l2_fh
>   * @state: pointer to &struct v4l2_subdev_state
>   * @owner: module pointer to the owner of this file handle
> + * @client_caps: bitmask of V4L2_SUBDEV_CLIENT_CAP_*

Did you actually check this patch? Adding an asterisk at the end
should hit a Sphinx warning, as asterisk is the italic markup.
So, it seems to me that this patch is actually replacing one warning
by another one!

Also, it is not pointing the patch this was supposed to be fixing.

Btw, I actually did a fix for it already, while I was working to fix
some issues on Jenkins. See below. If you're ok with that, please add
your A-B or R-B. Otherwise, submit another one, after testing that
Sphinx won't be printing an additional warning.

Regards,
Mauro

---

[PATCH] media: v4l2-subdev.h: document client_caps at struct v4l2_subdev_fh

Gets rid of this documentation warning:

	./include/media/v4l2-subdev.h:1130: warning: Function parameter or member 'client_caps' not described in 'v4l2_subdev_fh'

By adding a documentation about such new field.

Fixes: f57fa2959244 ("media: v4l2-subdev: Add new ioctl for client capabilities")
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index cfd19e72d0fc..62362da0d604 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1119,6 +1119,9 @@ struct v4l2_subdev {
  * @vfh: pointer to &struct v4l2_fh
  * @state: pointer to &struct v4l2_subdev_state
  * @owner: module pointer to the owner of this file handle
+ * @client_caps:
+ *	client capabilities to inform the kernel of the behavior
+ *	of the client as set by VIDIOC_SUBDEV_S_CLIENT_CAP.
  */
 struct v4l2_subdev_fh {
 	struct v4l2_fh vfh;


