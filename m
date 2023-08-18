Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE383781029
	for <lists+linux-media@lfdr.de>; Fri, 18 Aug 2023 18:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355710AbjHRQTQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Aug 2023 12:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378584AbjHRQSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Aug 2023 12:18:51 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8993590
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 09:18:48 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4RS6W91Cq5zyXv;
        Fri, 18 Aug 2023 19:18:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1692375526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sNEOVVsw4WKl9Ce/JmijISeNyPkVIuCw1+QIPTzwZ08=;
        b=Hl+bd6hvWgQ2P84Hh1+eDYohD6GiuQBpdbv/LdXRsXYePXWly4ZYSiazVcaR4eBIM7fZr7
        94BGAAzXjTft8GsPfQ6uPUh0Qr0VW+8gWLx1RudvsuZZqDwQRowEOpvS/Fk4VoPTX+glVO
        wkGgASTRXVlF9OCon8bqCnw0SPDRgFg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1692375526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sNEOVVsw4WKl9Ce/JmijISeNyPkVIuCw1+QIPTzwZ08=;
        b=LZuyjOHkdSC9BFOqcDEIV+zHZLpq2H3VyxuBrKanP7SiYsPCzPiDkYceyX986ADl4u6w1W
        fp5Fghq5Zq+AYvvx0jPJ9LxpICcVir2COw/N91n2hHMY1dTvM9lxF236PCNzDifpJIXlWD
        JFzRVMM0E1/vSo3gJ2pW07YJUo0dEPE=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1692375526; a=rsa-sha256; cv=none;
        b=RFwDupa+na+AZrDZZmJQgFBgquYr31uvWzY000jIUYfpllwnw0ypb8uLHM05KOHUI+vNT7
        PcVpYeqHxpuR7wtmHCsujkKq3JynkVZJstW5XfpgkUHIKO4puq0GTnlNFmdv52PIvGluAJ
        FIGEinROm4yAN+zBxL2JkYWd1GUrmoI=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B270F634C93;
        Fri, 18 Aug 2023 19:18:41 +0300 (EEST)
Date:   Fri, 18 Aug 2023 16:18:41 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: v4l2-subdev: Document that routing support
 depends on streams
Message-ID: <ZN+Z4aYPNp+ymIw6@valkosipuli.retiisi.eu>
References: <20230818155518.440-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818155518.440-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Aug 18, 2023 at 06:55:18PM +0300, Laurent Pinchart wrote:
> Routing support, through the subdev .set_routing() operation, requires
> the subdev to support streams. This is however not clearly documented
> anywhere. Fix it by expanding the operation's documentation to indicate
> that subdevs must set the V4L2_SUBDEV_FL_STREAMS flag.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index b325df0d54d6..0b04ed1994b6 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -822,8 +822,9 @@ struct v4l2_subdev_state {
>   *		     operation shall fail if the pad index it has been called on
>   *		     is not valid or in case of unrecoverable failures.
>   *
> - * @set_routing: enable or disable data connection routes described in the
> - *		 subdevice routing table.
> + * @set_routing: Enable or disable data connection routes described in the
> + *		 subdevice routing table. Subdevs that implement this operation
> + *		 must set the V4L2_SUBDEV_FL_STREAMS flag.

Could we set the flag in the core when this op exists for a sub-device?

We could do similarly for events when the sub-device has a control handler.

The device node should probably exist in almost all cases, but I'm not sure
right now whether there is a reasonable test for it.

-- 
Regards,

Sakari Ailus
