Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D317A5EAE26
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 19:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiIZRYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 13:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiIZRYT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 13:24:19 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B807515E465;
        Mon, 26 Sep 2022 09:40:43 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 830B91B00120;
        Mon, 26 Sep 2022 19:40:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1664210440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GH6RswHbQW/E8lb5D+Jh9GH8l6u1e7S2ya96uKHx5Ss=;
        b=trsGThX98AJHQyI9qXucnMo+G6rDCyPJd8thoQpH6P6+g2kCN+DfMlojSMoq8tVGlhk2N3
        7/WphCWsfU+JBMsiCBn0pfUq6tmqhdD6N5sapdf85tIC8XDkYx5IjJp0Kg7l5ij9jX/8jl
        l1yyi9MzbdiGeNiWFFzTzPg1sklJqsodHEoipt3u7G8v4hm6cwRX14naEzf6X1j2Xe9ySq
        /sCkPGYurcVhhHJldkfCqyenxxgNbG6nMJnp9Ri+TFtc6B6i0wiyCN3tlAgYLqRqWUPROp
        sQK21R55WSYW50UHXJY+BPIAFYBY5l429uXMwIpC0wVC1ZF7bdq+35HG2NB9xA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 50E49634CCC;
        Mon, 26 Sep 2022 19:40:39 +0300 (EEST)
Date:   Mon, 26 Sep 2022 19:40:39 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-ctrls: Fix off-by-one error in integer menu
 control check
Message-ID: <YzHWB0OLLet+hgo1@valkosipuli.retiisi.eu>
References: <20220926163151.21445-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926163151.21445-1-laurent.pinchart@ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1664210440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GH6RswHbQW/E8lb5D+Jh9GH8l6u1e7S2ya96uKHx5Ss=;
        b=D17+MBvMDoUULRfu798YMJxA9I4LdBg6AaVgZt4HaGQVt5bzIgEeV+yxs/6Nx8JVO00AJq
        o0LvbZxB25YTmoRYbyg15zJaXqCNIQkR0sxSy9NqP+7X9efqr6eVEaOseyexlUZ6OXdx2y
        qMlB0E4YbuHepq0TZNvsw9N2fYjbbXPOjaZXEKPOOoKZAEVE7xdheQgnosyFbnHzvlxlfY
        0zP3t6DLt/PL1ACs0EOC6au/FmWYXT6EMBvSSFFXmc/54QllI1DVQEo7uDGH5MmGMsiAxY
        fxOwKrR49pAEelaU3SrfqhtjHamWLvYT092qg+3rdkG4c7sgv9bRF8ZYzcDIGg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1664210440; a=rsa-sha256;
        cv=none;
        b=B2cA8dbWbbcCvibLBH8b3wegraLv0yNUpTE7Uo2eWbbRE7DCpqbcLfh0uSu/4fN1+xaIU3
        iRl9WkXsiF8GSdALa9kudZ9/fFX06xjcd59a5lRPWei/djeWfArdoZJCdIjTn8qfKmJZ2g
        CRHTsp5sJK5355f9Iaf+ukCNRd3PoJdQkUDM4jakq9hf+bPJCgz714j2DEstPGgsraFU2v
        jjxZkP0RSzWZcMksU46Yv2UkaEib1KEIrvXO6d74z9qf7F6OMTfIN9m+DeuycUF7H4UxSd
        kQ+zlxe2GU1+ALnFBlOx6uMbPD4qVgEU+6KLAvcn5Aw0Sm9Q95Ubo8MCTI370Q==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Sep 26, 2022 at 07:31:51PM +0300, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> The V4L2 API defines the maximum value for an integer menu control as
> the number of elements minus one. The v4l2_ctrl_new_std_menu() validates
> this constraint with an off-by-one error. Fix it.
> 
> Fixes: d1e9b7c12b74 ("[media] V4L: Add support for integer menu controls with standard menu items")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 1f85828d6694..322f9f715b65 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1762,7 +1762,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
>  	else if (type == V4L2_CTRL_TYPE_INTEGER_MENU)
>  		qmenu_int = v4l2_ctrl_get_int_menu(id, &qmenu_int_len);
>  
> -	if ((!qmenu && !qmenu_int) || (qmenu_int && max > qmenu_int_len)) {
> +	if ((!qmenu && !qmenu_int) || (qmenu_int && max >= qmenu_int_len)) {
>  		handler_set_err(hdl, -EINVAL);
>  		return NULL;
>  	}

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
