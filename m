Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A999614784
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 11:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbiKAKM2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 06:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiKAKM1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 06:12:27 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E73211C3D
        for <linux-media@vger.kernel.org>; Tue,  1 Nov 2022 03:12:22 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkxjnptf9d2bpn7gcmbty-3.rev.dnainternet.fi [IPv6:2001:14ba:44ce:b640:9d1d:82c5:eca2:5060])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 49F4F1B0009C;
        Tue,  1 Nov 2022 12:12:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1667297539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3K0dj2dRtbT6jA7vFM+XmUaK88bJmB+xMDx7YSHWUOY=;
        b=FWFOnYiSd/MXQx/2XUEp+BHcTRl+dGKhlyKlL23/xPEvOL0EGwj60macPR3cDSviyA8rbY
        kAUgb6n2CoQfnizwLo5mjsrm4STXCOZDrM6HBrX1Y0AcYD2V4uO0XO9OvyppTAlR//dxac
        zp1W9RfP4xdT1wCu355QpsbO+B2PkufKzA9c624H1fwaQuBK6brDGxpHLpWKOff4vJWOyp
        FxWZ/RSIp122bIbupJ/xsftOH6ILo+Cxcb2S5CpSUkOUq9IcHHPJ9Bs+5VifbaoM4MkKkH
        VaqYhdnjlxHUxC2Pbulrt98/v/KMu88HTO0aPYvvOVf5zGFncgExcnYSOpa54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1667297539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3K0dj2dRtbT6jA7vFM+XmUaK88bJmB+xMDx7YSHWUOY=;
        b=mDWh+TkbajMMbs3aI8v3SktmmObJ5sbVylSC4Fl0hPMhIW8oKcPisvsF4m4tKJIJYDnpJt
        ydUOTCVRvNO2r6PVcLlOeGBWhrVZnyhr6DLJALXt9lXTmssGZ3Eydlr3ul0fP5FYy2QBSC
        ZuFPMvoVnegzwYqE6Qbj+UmGqxQbJSVe/Xvt0FBoFMU59oQKeUgNltwPBTmqeED/B3C734
        AlJLtsUQv52LHT3i8aX6YgcAimgPFjcNEOAxWUaIWAoayLtnIuQ/y5XHvX0A36J5DGH9p9
        3n5XxdDkISHlS3nMPO0HGq+rC9rMMGdWqSsJWsNuUjpY85pUgsR3frDWgMW1EA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1667297539; a=rsa-sha256;
        cv=none;
        b=JAFQR+HiluLADh48P2W9pSXC3VUPgnme8OAYEvhxEtV3rk3edFmPxVWgeXCQ+EpNrbyj3h
        WxBv8ik1Sy4zqH1qYPa/tqEQoHdFEatcxre3WCk42fqpHTemkNnkWgnBMwabzgDU9VFOxm
        k7f1ap9t4xRCjxKkUu5UcEp2kVrDqJWY8Quyc1RXLOrGjkPpvFAqrq/flbwaxpkJ7u+BpU
        VQWFzYf+IoS41TIjmM2BgfJ98IUS796tPmtkSi/SGerc04OqODP3U/+YZKFbZuCa1ipYwF
        Xh8dbuvfchnLisutRyJkss9P8rF646LXHekE6hZEb9EsJ+kqxwDCOqDhozc9+A==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E7DC7634C92;
        Tue,  1 Nov 2022 12:12:18 +0200 (EET)
Date:   Tue, 1 Nov 2022 12:12:18 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: [PATCH v2 05/16] media: i2c: ov9281: Support more than 1 mode.
Message-ID: <Y2DxAsgEFeBUmzmc@valkosipuli.retiisi.eu>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
 <20221028160902.2696973-6-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028160902.2696973-6-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 28, 2022 at 05:08:51PM +0100, Dave Stevenson wrote:
> The driver currently has multiple assumptions that there is
> only one supported mode.
> 
> Convert supported_mode to an array, and fix up all references
> to correctly look at that array.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

This probably should have been ov9282 and not ov9281? I'll fix that when
applying it.

-- 
Sakari Ailus
