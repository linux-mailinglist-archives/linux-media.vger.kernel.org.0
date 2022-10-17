Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E935601315
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 17:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbiJQP6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 11:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiJQP6B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 11:58:01 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC7C6DAD9
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 08:57:58 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkv1q4tdsdyy1rk42mgbt-3.rev.dnainternet.fi [IPv6:2001:14ba:446a:dc40:6f18:157:2316:5143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 2C31120092;
        Mon, 17 Oct 2022 18:57:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1666022271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vPWO+tOsi0uoHuaIa5AofijPQElzJGcASOrBFZ7oxU0=;
        b=W3GUx3Zs7BMCBFEZZ0yOnnHKPiSIx7yPyne11P0jmMWqoJPjD3E8gyemT2sRB8zVfM8F4Y
        0daF9U+XpGM42ftXanHNll0ma4pto8ve602Uld4y++y1D7YcVye9oSfbbeeJ9t3uiBC8+r
        zZFK4/MRZdIlQ5rDIshW18ZjrosRshs=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3C42E634C93;
        Mon, 17 Oct 2022 18:57:49 +0300 (EEST)
Date:   Mon, 17 Oct 2022 18:57:48 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
Message-ID: <Y017fLwL8zqzukl9@valkosipuli.retiisi.eu>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-3-jacopo@jmondi.org>
 <m31qrk6wgc.fsf@t19.piap.pl>
 <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
 <Yz/jqA6ZACHOXxl/@pendragon.ideasonboard.com>
 <20221017151003.5vqxgfewyjrmrdei@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017151003.5vqxgfewyjrmrdei@uno.localdomain>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1666022271; a=rsa-sha256; cv=none;
        b=iIKmH+8zxKAcP4NL2KFrnPMbqQvgZnUA0Bd+FB8xC11WQW4Epzy2ecHwwDP3strKesyveS
        UjhxLJG5Z0QMi9iqFu5ifpHcbWB6ToIiUsAutHtA8W52P2Y2AFMoKSy+loYsEEvxVqoji1
        8pfcfb0tN3ZOivtFM/y4QkereX6E+TE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1666022271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vPWO+tOsi0uoHuaIa5AofijPQElzJGcASOrBFZ7oxU0=;
        b=kXr8qFEehvz7YGYgcYQ4ScUSlbm53qEKPbvRQWR2K9GaBDjKDSZw5fH+6MxO3VoYjueU0r
        m5xzHuJZgSPX5L6tVjj/lxQ98YRQoNeeDd7g0mEGz3o2PvDx988isEOXbPVyYd85DLR87h
        m0GiMxyoRSG2cDV0rFYcI6rN1WpgAeA=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Oct 17, 2022 at 05:10:03PM +0200, Jacopo Mondi wrote:
> > which is also named analog_gain_code_global, but is documented
> > differently.
> >
> > Could you btw read registers 0x0000 to 0x00ff and provide the data ?
> 
> There is nothing interesting there if not default values. I was hoping
> that analogue_gain_m0 analogue_gain_c0 and analogue_gain_m1
> analogue_gain_c1 would provide a way to inject gains using the
> standard CCS gain model, but those registers are said to be read-only

The m[01] and c[01] factors in the CCS analogue gain formula are constants
that determine how the sensor's analogue gain setting translates to actual
analogue gain. They are not intended to be modifiable at runtime.

-- 
Kind regards,

Sakari Ailus
