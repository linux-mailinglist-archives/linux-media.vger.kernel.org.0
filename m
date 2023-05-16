Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D4B704D7E
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 14:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbjEPMKa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 08:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbjEPMK3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 08:10:29 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D06797
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 05:10:27 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QLFRz4cdTzyV4;
        Tue, 16 May 2023 15:10:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1684239025;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ci1nr36X99DsIx7ILyMPFPbcqY2I/qdIfU1SZlnYTlo=;
        b=gQiWtn88MUMJ1BMcBrgRWuM3VZ7v7TmVw4NO+92J1adL1AZm3mCtKOGDsv+zSUxn+Qtji8
        e1iAwXOXHrQ/3FU/fx1m+ZPH8N+4LsGCJF+vsG7Rh+gm/tjW4GXdkPEI39eYd4kQGYtFIS
        qNuCfukZvMsUfcYogAfqwQxaLLLdhUI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1684239025;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ci1nr36X99DsIx7ILyMPFPbcqY2I/qdIfU1SZlnYTlo=;
        b=PNBNK8jpGvaDdaw1b0I+i+1GEi4Cv2hbab5R+5B0G93DKqCJ64Jg6od2Q7jq4Q+bzQfFKH
        Jn8yVrmgBfCdwyxudp2IvXEFNRZ4A9mQlgf1plNeirJbp9EIj2PW/hhJ2u3Hy36WPQ7nQB
        rDUrHRelBhO8ie8cij6ES3D6GhfW24Q=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1684239025; a=rsa-sha256; cv=none;
        b=Lt+DZPSnmKdFOn4U4W7ER6H2LnW3kunj0L+YuHC2FrLUOvjTrG21RfX6yccB57aAo9LfMq
        wS7CcKNfq7tr1zZPUG6uo1OYxtyIlw0ffGHZGTQ4/4f6Oyjl9cMwbgqJpdMUdVNtT8Zafg
        Bx8tdxfR0OsfFOPVdD31SiV0WOK4EtY=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id F03AE634C94;
        Tue, 16 May 2023 15:10:21 +0300 (EEST)
Date:   Tue, 16 May 2023 15:10:21 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: tc358743: fix cleanup path
Message-ID: <ZGNyrZ0ZrBBSSrY1@valkosipuli.retiisi.eu>
References: <20230502140612.2256850-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502140612.2256850-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Tue, May 02, 2023 at 04:06:11PM +0200, Alexander Stein wrote:
> When allocating a cec adapter, v4l2_async_register_subdev was called
> already. Remove subdev from async list upon cec error.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> I don't reallylike that __maybe_unused after the label, but I don't know
> of any other way to get rid of the warning of unused label if CEC
> support is disabled.

Thanks for the patch.

There seem to be other issues to fix in the driver: registering the async
sub-device here makes it possible to give user space with access to this
device already here, before an interrupt is registered or the control
handler is set up.

How about instead moving the async sub-device registration at the very end
of probe()?

> 
>  drivers/media/i2c/tc358743.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index ad6a72b2bcf5..86fc7bf12685 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -2106,7 +2106,7 @@ static int tc358743_probe(struct i2c_client *client)
>  		CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL, CEC_MAX_LOG_ADDRS);
>  	if (IS_ERR(state->cec_adap)) {
>  		err = PTR_ERR(state->cec_adap);
> -		goto err_hdl;
> +		goto err_async;
>  	}
>  	irq_mask |= MASK_CEC_RMSK | MASK_CEC_TMSK;
>  #endif
> @@ -2162,6 +2162,8 @@ static int tc358743_probe(struct i2c_client *client)
>  		flush_work(&state->work_i2c_poll);
>  	cancel_delayed_work(&state->delayed_work_enable_hotplug);
>  	mutex_destroy(&state->confctl_mutex);
> +err_async: __maybe_unused
> +	v4l2_async_unregister_subdev(sd);
>  err_hdl:
>  	media_entity_cleanup(&sd->entity);
>  	v4l2_ctrl_handler_free(&state->hdl);

-- 
Kind regards,

Sakari Ailus
