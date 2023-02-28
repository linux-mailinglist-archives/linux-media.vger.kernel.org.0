Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1016A564C
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 11:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjB1KGB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 05:06:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbjB1KFv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 05:05:51 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FAB2BF3E
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 02:05:49 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkzbhx1tyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4502:69d6::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 1AE25200A1;
        Tue, 28 Feb 2023 12:05:45 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1677578745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=94ODvRB/ONy0JbeZDJ946d3qlOb3DAApVOi0yGCCezk=;
        b=PQ5XIvoqDZU18x61oFjCKaMP8iBHXx8M/ZAqKwODuKWkz2T5lGxaXxi8RJZt9toZrGejyr
        ufU5JEvJHoh2N7R5wztHx5CgHzrNgMYFyNHeHEZ8FpWLz+XOcr5tuBEA3m/2vnOHlAex7q
        G3LMuJR8bsiOOPw/4X76gzm6pi3kVds=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1677578745; a=rsa-sha256; cv=none;
        b=j0ce5gTNp7JhVxm7tak1g1qXPIO2NXKDmbfBIfGSk15/0OdwuAJM9Cqi1/Dlg4iaNj3Ldk
        OgfyUX5e2IwFsomfBs2dC0R6/PJ8RQPl1orAgzU64oZrO8Rjc3+ggkKxaJYA8o5ETxoRRJ
        6PArf1UnHeEx6QLyGoLKPQ8RojGmCx0=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1677578745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=94ODvRB/ONy0JbeZDJ946d3qlOb3DAApVOi0yGCCezk=;
        b=jq7bYhtgXMtf0tWxa0/oTV4ee+63cxk7WdAyyTFGXDk2cjVDM1N+vQj7tFD44D3ItMvTbs
        RjDj2NeSchSXvFiXVQgpFFGsOpuw3SrGfbA4agkFTIzPkeHY2Oc1V1Cw2Qqsq3FAgCi26Q
        I4XzsFfQj3LbXqpjkIpux3ZaIJfED88=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EF3DE634C91;
        Tue, 28 Feb 2023 12:05:02 +0200 (EET)
Date:   Tue, 28 Feb 2023 12:05:03 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH 1/3] media: Zero-initialize all structures passed to
 subdev pad operations
Message-ID: <Y/3Rz5DRX9DnLe8E@valkosipuli.retiisi.eu>
References: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
 <20230215165021.6628-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215165021.6628-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the set.

On Wed, Feb 15, 2023 at 06:50:19PM +0200, Laurent Pinchart wrote:
> Several drivers call subdev pad operations, passing structures that are
> not fully zeroed. While the drivers initialize the fields they care
> about explicitly, this results in reserved fields having uninitialized
> values. Future kernel API changes that make use of those fields thus
> risk breaking proper driver operation in ways that could be hard to
> detect.
> 
> To avoid this, make the code more robust by zero-initializing all the
> structures passed to subdev pad operation. Maintain a consistent coding
> style by preferring designated initializers (which zero-initialize all
> the fields that are not specified) over memset() where possible, and
> make variable declarations local to inner scopes where applicable. One
> notable exception to this rule is in the ipu3 driver, where a memset()
> is needed as the structure is not a local variable but a function
> parameter provided by the caller.
> 
> Not all fields of those structures can be initialized when declaring the
> variables, as the values for those fields are computed later in the
> code. Initialize the 'which' field in all cases, and other fields when
> the variable declaration is so close to the v4l2_subdev_call() call that
> it keeps all the context easily visible when reading the code, to avoid
> hindering readability.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

...

> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 3b76a9d0383a..3c84cb121632 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1305,6 +1305,7 @@ static int cio2_subdev_link_validate_get_format(struct media_pad *pad,
>  		struct v4l2_subdev *sd =
>  			media_entity_to_v4l2_subdev(pad->entity);
>  
> +		memset(fmt, 0, sizeof(*fmt));
>  		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  		fmt->pad = pad->index;
>  		return v4l2_subdev_call(sd, pad, get_fmt, NULL, fmt);

Instead I'd merge this with its only caller.

I can submit a patch on top of this one as it's just a small cleanup.

For the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

The second latter of the subject of the 3 patch should be lower case.

-- 
Kind regards,

Sakari Ailus
