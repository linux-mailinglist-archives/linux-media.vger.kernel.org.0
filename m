Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3D504C1CF7
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 21:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236610AbiBWUOV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 15:14:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239928AbiBWUOU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 15:14:20 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693DE4CD58
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 12:13:52 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 03CC720072;
        Wed, 23 Feb 2022 22:13:48 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1645647229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=08ZmkPAk9ES6cQ92QJjwuvSp1mDjT4v2lfGaW4B9xjQ=;
        b=uc1L/Ny9vy8bUoLS1dcOug0HOkIe6f1EukTlSV08+VE6mzLi8QauOB5SRdSWmitrxuRREz
        RyxVCosHl5pwPMS48+LLBE9qMkU0AdFcbSw4yYkpnr1FLq48IlD6FJomGV7BZxruJzEaCJ
        NR7+MlmwxQ5Y5p1JTqNNUnloZngC0BY=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 62F70634C90;
        Wed, 23 Feb 2022 22:13:48 +0200 (EET)
Date:   Wed, 23 Feb 2022 22:13:48 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 26/27] media: ov5640: Split DVP and CSI-2 formats
Message-ID: <YhaVfHTrnsu3njc5@valkosipuli.retiisi.eu>
References: <20220223104034.91550-1-jacopo@jmondi.org>
 <20220223104034.91550-27-jacopo@jmondi.org>
 <YhYl2g59uNhlZLMO@pendragon.ideasonboard.com>
 <20220223142217.ckugvyrghkywkmzs@uno.localdomain>
 <YhZGgJgkxk2wkN8M@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhZGgJgkxk2wkN8M@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1645647229; a=rsa-sha256; cv=none;
        b=e06LTottjC1nfeuri0k5xKXvmFcKVdwnqfczWk3hxhKxxqmKPmgFCSLbK3nTVUEiw4o8QR
        AzTJznoiEiY4mz9kGmr90qtZBLFRz94qJdKc8AYmBo8ldxQUzOKfTQv/1rpZKV7Rgyznik
        IU6Cr6EnvKUqbq9jkJkg4pwHJB6+Jo4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1645647229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=08ZmkPAk9ES6cQ92QJjwuvSp1mDjT4v2lfGaW4B9xjQ=;
        b=JQ7rCNN5qGm7li/vOcGp/QV5sU/J442vSd+eVyyD6wmW4XKe5jwk2+yC5I0Igo4u5DGNpl
        yjijxbUKPFBvg/VjRB9K9TLqLpVWmkUBgqep7Vsr8EezHYiQquwqbcwuoXvoq1T7h6GEw/
        U3nY+go5AY5PEPvPq6CcCSF03ImJWwc=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Jacopo,

On Wed, Feb 23, 2022 at 04:36:48PM +0200, Laurent Pinchart wrote:
> > > > @@ -3589,13 +3630,19 @@ static int ov5640_enum_mbus_code(struct v4l2_subdev *sd,
> > > >  				 struct v4l2_subdev_state *sd_state,
> > > >  				 struct v4l2_subdev_mbus_code_enum *code)
> > > >  {
> > > > -	if (code->pad != 0)
> > > > -		return -EINVAL;
> > >
> > > You've lost this check.
> > >
> > 
> > The driver has a single pad, doesn't core verify that the pad argument
> > is valid ?
> 
> Only when called from userspace, not when called from another subdev.

This was historically true but changed in 2019, as the checks when calling
the subdev ops from the kernel and userspace were aligned. This was done by
commit a8fa55078a7784a99a2ce389b5d7456a3be9a941 .

-- 
Regards,

Sakari Ailus
