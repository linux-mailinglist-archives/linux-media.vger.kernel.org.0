Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 118BA4E4EBB
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 09:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242843AbiCWI4R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 04:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234460AbiCWI4Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 04:56:16 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D8CE92
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 01:54:45 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 440A6202E7;
        Wed, 23 Mar 2022 10:54:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1648025683;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PP7KSfPNGTOQRl0OObgiC+/ES21x5y7sTK/ZMfyTnbY=;
        b=lseyXs4r7urWbRxfuBIIpV7fb+NOOaqyPAdPTL8lLCdrYN4Sn84euu8cdFzxQrnA5I3YS9
        50IeT+A0HJrNlevEPFLeTia7UM5r4+O9noqA9aFtmR9X0jUGOwFzfsc5huiFcPA80NbGcj
        t/NByUOGEkxFfKt4hcWSFUm+WPvUGQA=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CA1AB634C90;
        Wed, 23 Mar 2022 10:54:42 +0200 (EET)
Date:   Wed, 23 Mar 2022 10:54:42 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 00/27] media: ov5640: Rework the clock tree
 programming for MIPI
Message-ID: <YjrgUkJIP1cNaToi@valkosipuli.retiisi.eu>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <7c082420-63f4-0520-21a2-7e10a1e2c321@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c082420-63f4-0520-21a2-7e10a1e2c321@ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1648025683; a=rsa-sha256; cv=none;
        b=Q3B5wWF+VOBDB3UBYXLIM3lwovkR9WsAxmkR3Fkhw5PsNdIbjNoJ1KbSsr27Mw0gyiJmXg
        HF1/uF8fR31PHVo4LnTJRi5yG7toMum6GxIMiF2syxlTt2utJ3nkRel9qUhZ71RgTPpNbh
        m12nOcWvupOO3VWMYXIDF5zs3d7XmYc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1648025683;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PP7KSfPNGTOQRl0OObgiC+/ES21x5y7sTK/ZMfyTnbY=;
        b=xq7g6SvILVgl112kqRUeJ8X9pXYI0Y7KsM0LiDagVAtxpronoH176Ds6uDx13456f62W/a
        9O2g6VA/4nIn/5WNJRlAO996TcmfAyitp4FRMU+LtMRy5O3xwzdedMXxeQ/80ctthtdfvD
        wbQQOHg4vBy72XGY+IyN2+89j9Mcwfw=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Mar 23, 2022 at 10:51:04AM +0200, Tomi Valkeinen wrote:
> Hi Jacopo,
> 
> On 24/02/2022 11:42, Jacopo Mondi wrote:
> > v1:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
> > v2:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=7311
> > v3:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=7385
> > v4:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=7389
> > 
> > A branch for testing based on the most recent media-master is available at
> > https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v5
> 
> I tested these with DRA76 EVM & CAL, using CAL's legacy non-MC mode. It
> doesn't work. I think there are two problems:
> 
> - CAL uses mbus codes like MEDIA_BUS_FMT_UYVY8_2X8 for CSI-2, not 1X16.
> OV5640 used to support 2X8, but now it doesn't.
> 
> - OV5640 sets the default code to MEDIA_BUS_FMT_UYVY8_2X8, even for CSI-2
> where it doesn't support MEDIA_BUS_FMT_UYVY8_2X8.
> 
> I'd like to just change CAL and drop the 2X8 support and instead use 1X16,
> but then any sensor that uses 2X8 would work. So I guess I need to change
> the code to support both.

How many drivers there are using 2X8 formats on CSI-2? I remember there has
been probably few, and it should be easy to fix them.

It's another question whether the 2X8 format should be kept for
compatibility. Perhaps the driver could allow setting it, but should then
return 1X16 when queried.

-- 
Terveisin,

Sakari Ailus
