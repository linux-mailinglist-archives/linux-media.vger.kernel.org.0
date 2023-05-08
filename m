Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 264926FA397
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 11:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbjEHJrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 05:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbjEHJrh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 05:47:37 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D00018FF6
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 02:47:35 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QFGfr2YPDzyVR;
        Mon,  8 May 2023 12:47:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1683539252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iE3EN3ez5HgkaPjsBb7ScjflaQ1+vswWTXuAZ4pzRcc=;
        b=xk1uQJQpW1WYvAbFNq7MYrSvoxpbbv2EMJPF6PUyn02rLWV8dbfA/pBcSMHXtCdc0OSvPt
        1cl/RtJYlGcfpZTzAU92KatDCu3yGoJcG6g9+UoW5CVEPp+JXqZlGQn1gHxzpaScCKqorf
        q4MEn5rQIMN3JSmxuVfBCdhfQdfO/7w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1683539252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iE3EN3ez5HgkaPjsBb7ScjflaQ1+vswWTXuAZ4pzRcc=;
        b=ddktYLk3OKPhEvn/Z12mkkbZzUpOGc2uIyiYE04fJ7jqbJDSxwTic3aIlZcVOBPxCPbqze
        /VEti/JzmZvta5ztYQYq4Es2sU3Qb8VH3WiLiuUIdq8oDdHBiKyRoE1s59C0vLlNj4RNBl
        TCwaeKS47iLXu3xtasIs6jklip7fc3M=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1683539252; a=rsa-sha256; cv=none;
        b=g/ZT0m0JkWO7XuSNbWUIp0CDq2RGTtKozKZvb0XNK55yA76cuoZlmuYbMTjOmnReHZpFWV
        1aCSExx2rOAg6mr7i5jvdCs8XXWB3kvgLmEKMFrkLIkw2tuqKF9mPCtc97jT64tUL1YZ+6
        Jqid/umA9XGn7TDeDPaVjQ0BiUc7oRU=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 219EC634C91;
        Mon,  8 May 2023 12:47:31 +0300 (EEST)
Date:   Mon, 8 May 2023 12:47:30 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        slongerbeam@gmail.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2] media: ov5640: fix incorrect frame frate issue for
 defulat VGA
Message-ID: <ZFjFMubAzS7Xd7OR@valkosipuli.retiisi.eu>
References: <20230505020114.764715-1-guoniu.zhou@oss.nxp.com>
 <qrwnkofoyf5utyh7kepihb7vp5wqb657dbak4m7ecjej357i6v@swbdvakgtaby>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qrwnkofoyf5utyh7kepihb7vp5wqb657dbak4m7ecjej357i6v@swbdvakgtaby>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 05, 2023 at 08:45:55AM +0200, Jacopo Mondi wrote:
> +	 * YUV422 UYVY VGA (30FPS in parallel mode, 60 in MIPI CSI-2  mode)
> 
> What do you think ?

Please also fix subject (spelling).

-- 
Sakari Ailus
