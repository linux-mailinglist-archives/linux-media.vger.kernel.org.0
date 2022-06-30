Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18945616BB
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 11:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbiF3JqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 05:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbiF3JqT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 05:46:19 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2157D42EE6
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 02:46:19 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 9857820191;
        Thu, 30 Jun 2022 12:46:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1656582377;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=q9eh2gTFTawLyewz8w7e4ywYKxY43m/hZkVoYUPU0F8=;
        b=cS8f79TtV70ttQ3QVWsNrJ0OglaBmTXQ0tckf/3otezqkoBln0iN6Tl4IZOdXvo7/q1dHD
        rZGnbtyf6Iuw0Etq0F4UNZZxG7HyqCi6920TgZlfJSN66ck1SlPnnOGQzM8PBJ4fdDx7Ee
        APQ4qXaxZ27/mIxf/jR64RikIqruxS4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1B05D634C91;
        Thu, 30 Jun 2022 12:46:17 +0300 (EEST)
Date:   Thu, 30 Jun 2022 12:46:16 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: Re: [PATCH 4/7] media: v4l2: Make colorspace validity checks more
 future-proof
Message-ID: <Yr1w6Pt7mGpz+XWv@valkosipuli.retiisi.eu>
References: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com>
 <20220616183656.19089-5-laurent.pinchart@ideasonboard.com>
 <1d76d6bf-7809-edca-0d1a-9ab84e0c15ea@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d76d6bf-7809-edca-0d1a-9ab84e0c15ea@xs4all.nl>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1656582377;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=q9eh2gTFTawLyewz8w7e4ywYKxY43m/hZkVoYUPU0F8=;
        b=zHZjRsRU3VpPjUC2bZARsrbzLFJgjd/U7UvEoobbHDWbRlFm4sIf9ILor0auxhN/as+W1u
        Pu4Fzpi3lecxQdcD2cN5T1i/ro4b88Bz8kDY3GUA/Y+08KK59Hy4yjBTggrnRHI15njLyS
        GdCUD3im9aaiPwZC6PFnRHCctfQBFxA=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1656582377; a=rsa-sha256; cv=none;
        b=NZYsWyf5CbnQlvulQMIwR69Fe/fZfyFKxaEsPhgRCkwb7hQlsgfyWi6GJlai4R2ZO4z/2D
        WGXpOgJYBTLuKte7Zn0vz+pD3v1qtRN5213zoqP9xrQbkA+SDp3FBcEIChQcI+hInhKYDC
        myGXkq/yZ08gyO529YDVVQvU4mDwRCs=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 29, 2022 at 03:50:47PM +0200, Hans Verkuil wrote:
> > @@ -585,8 +585,8 @@ static inline bool v4l2_is_hsv_enc_valid(__u8 hsv_enc)
> >  
> >  static inline bool v4l2_is_quant_valid(__u8 quantization)
> >  {
> > -	return quantization == V4L2_QUANTIZATION_FULL_RANGE ||
> > -	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
> > +	return quantization > V4L2_QUANTIZATION_DEFAULT &&
> > +	       quantization < V4L2_QUANTIZATION_LAST;
> 
> There are only two quantization ranges: full and limited. And I very sincerely
> hope there will never be a third!

For consistency of the checks and definitions I prefer it how it's in the
patch. There's no functional difference though.

-- 
Sakari Ailus
