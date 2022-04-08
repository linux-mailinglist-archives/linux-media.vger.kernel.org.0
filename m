Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A449F4F9378
	for <lists+linux-media@lfdr.de>; Fri,  8 Apr 2022 13:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbiDHLHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Apr 2022 07:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiDHLHX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Apr 2022 07:07:23 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559ABB9B
        for <linux-media@vger.kernel.org>; Fri,  8 Apr 2022 04:05:18 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 82D4B203F3;
        Fri,  8 Apr 2022 14:05:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1649415914;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NukZoGESpcHfWopR8xsOzCcQaXDEUUw0J5UJfgH/7ms=;
        b=Kh7ORpVw7tkrSUdbxVBOP7xdANYdIaOhCQ0m4vIaPx6g76VsLbgOT2KfBkcYCCebaxamc+
        0rwpAMLJr8brsYDYqca3ji7e8PmIxtnLhrJjlDsD6Y1JBwCjkLJe2nsRdvQdOxlBvJQXNc
        8d4js1S5TVNvg/MU44a+d4NCW7e4GFI=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 033A2634C91;
        Fri,  8 Apr 2022 14:05:13 +0300 (EEST)
Date:   Fri, 8 Apr 2022 14:05:13 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
Message-ID: <YlAW6apXjdHVkyEZ@valkosipuli.retiisi.eu>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <7c082420-63f4-0520-21a2-7e10a1e2c321@ideasonboard.com>
 <20220323095019.edql22tjb3ea5npx@uno.localdomain>
 <a9972878-dda3-15fb-90fc-ae6686e35818@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9972878-dda3-15fb-90fc-ae6686e35818@foss.st.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1649415914; a=rsa-sha256; cv=none;
        b=xsBA/Rg4eZ8clmFP5UAjwLZ1705lQRp5yc5Ch/skSpuGFYOcbc+V5WyDh2DIjoTzi80bG1
        XsBEMq3DhDkLDzX+u/PCF7yDX7EwZeRDXvR49nuHLf8c1VcU6BzrOF8DAg6SSUlbTIMN3D
        rT+n8yWu4xQY7pD90/JijCaawQX56s8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1649415914;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NukZoGESpcHfWopR8xsOzCcQaXDEUUw0J5UJfgH/7ms=;
        b=Vo64ru/p2+qdhmAfgmixE7ffdBC7mhG1BHDq/P1r4PjUb6xIykyBhXe0PlV+R+wAcb5KK6
        X+U5e0cnuv0tPo/XGZ8Vb3y4KxQP2+BPFIAT5sKxZloPBXdx0oiarfIs1XZjIiJY3JBm5o
        tDFyLz+FPGVORL+wUapZkoTQZGE8S4g=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Thu, Apr 07, 2022 at 06:25:11PM +0200, Hugues FRUCHET - FOSS wrote:
> Hi Jacopo,
> 
> On 3/23/22 10:50 AM, Jacopo Mondi wrote:
> > Hi Tomi thanks for testing
> > 
> > On Wed, Mar 23, 2022 at 10:51:04AM +0200, Tomi Valkeinen wrote:
> > > Hi Jacopo,
> > > 
> > > On 24/02/2022 11:42, Jacopo Mondi wrote:
> > > > v1:
> > > > https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
> > > > v2:
> > > > https://patchwork.linuxtv.org/project/linux-media/list/?series=7311
> > > > v3:
> > > > https://patchwork.linuxtv.org/project/linux-media/list/?series=7385
> > > > v4:
> > > > https://patchwork.linuxtv.org/project/linux-media/list/?series=7389
> > > > 
> > > > A branch for testing based on the most recent media-master is available at
> > > > https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v5
> > > 
> > > I tested these with DRA76 EVM & CAL, using CAL's legacy non-MC mode. It
> > > doesn't work. I think there are two problems:
> > > 
> > > - CAL uses mbus codes like MEDIA_BUS_FMT_UYVY8_2X8 for CSI-2, not 1X16.
> > > OV5640 used to support 2X8, but now it doesn't.
> > > 
> > > - OV5640 sets the default code to MEDIA_BUS_FMT_UYVY8_2X8, even for CSI-2
> > > where it doesn't support MEDIA_BUS_FMT_UYVY8_2X8.
> > 
> > This might be worth an additional patch that decides what default
> > format to use based on the bus type.
> > 
> > > 
> > > I'd like to just change CAL and drop the 2X8 support and instead use 1X16,
> > > but then any sensor that uses 2X8 would work. So I guess I need to change
> > > the code to support both.
> > > 
> > > Anyway, both of those issues might also surface on other platforms, as
> > > ov5640 behavior has changed.
> > > 
> 
> I am facing the same "2X8" compatibility problem on ST platforms:
> - st-mipid02 CSI-2 to parallel bridge [1] must be enhanced to support 1X16
> formats
> - dcmi controller [2] must also be enhanced to support 1X16 and extra code
> to support 1X16 input to 2X8 output (as we only have as input the V4L2
> format, not the mediabus one)
> => with current code, support with OV5640 is broken.
> 
> I feel that your proposal to let OV5640 accept 2X8 then silently switch to
> 1X16 can do the job without breaking dcmi/bridge support but need further
> testing to confirm.
> 
> Appart from that I don't really understand the logic behind naming "1X16"
> for CSI-2 serial formats, if "2X8" means 2 bytes to send one pixel, I would
> expect that "1X16" means 1 word to send one pixel (16bits wide bus), so how
> to differentiate 16 bits // code from CSI-2 code ?

Please see:

<URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/subdev-formats.html#v4l2-mbus-pixelcode>

I.e. st-mipid02 and dcmi drivers should be fixed.

-- 
Sakari Ailus
