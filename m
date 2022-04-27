Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2F9F51155F
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 13:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbiD0K6p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 06:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbiD0K6i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 06:58:38 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F983BC47C
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 03:35:26 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 975D81B001CF;
        Wed, 27 Apr 2022 12:59:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1651053564;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=05nayfjvRmrnjC1Ib0jFuNTfGUagZSPJ5nsZdJaxzXI=;
        b=b/v2M6hLkur4yD2aNgCMkygohT/UxpWA2xFj5/sw6EJoXMgmSbWCFvXXw7N6iJbnLnkF9H
        UOmFGTVVY7jpjiHnoE6Wgk43BHJgWmWLyoEGqCWMjaksIGHhWyZQS/JQkbd8k2RgRUu/bx
        qlLJNhll+HjNSMOxrBuuWNwtW8bHATkiTn1IF280VSqnWeWDUDJyoPA3GSPty+Oz9Y3T4H
        r6nS5Ebjyli5LzS41juGOisKNfvRykJwgqUlMnHwZXcyhasHsy8CzNR+QwOcJJbKNonI/I
        vRRe+I7JcB+TnLT/msdXUhfF6l6ojC6pOW1i6csZPozehNu2qCvL9oIrN27NTA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3AE4F634C91;
        Wed, 27 Apr 2022 12:59:24 +0300 (EEST)
Date:   Wed, 27 Apr 2022 12:59:24 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 6/8] media: i2c: ov5670: Add runtime_pm operations
Message-ID: <YmkT/I4yJ0ddawsx@valkosipuli.retiisi.eu>
References: <20220329090133.338073-1-jacopo@jmondi.org>
 <20220329090133.338073-7-jacopo@jmondi.org>
 <YmkTfLMdtMQDBQFO@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmkTfLMdtMQDBQFO@valkosipuli.retiisi.eu>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1651053564; a=rsa-sha256;
        cv=none;
        b=G2BwVF4JK7IWW3OVzyNjxmMgFc3nscfndVHPmQO3h1yL750N2LCoB4CiT8PLxyMjOQq/vM
        YVAYv6Mx/RhkutOGd62W+uH0u7MukD/Yia+Z+TIorhQxoYsIgrp10rgiBRfMM6Wguw9KN0
        d/ylcCUCAl0rbXYPMPfx0x20NQLSlinAY7WoO+rj90zXC0V54Yc+M11DMSC6Z4f8ETx3F7
        K/cAfSpxET4ZNylbKcfhTmpqn0A2hOwLIOq06pWwj69Yywnd3P77S+pR0l8Pamd48Poq4k
        yFNwqTQ+M//zqN7R/Yg1UCMLQRXnuPaEPKnHSIf0x9rRoJUmFFngLR2oSyIi5g==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1651053564;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=05nayfjvRmrnjC1Ib0jFuNTfGUagZSPJ5nsZdJaxzXI=;
        b=ojbLSqMsoHEi1ku05VHytKy/4d5W82aHK3aCmxlNT1irQqRoFreXpQfsq1FlnWZOWExxIS
        7XBbcWlisFsZfLp/o3l3iTvUEKl5iGplLeeU4u9B+NYFdOkwEAF4GPvhmNgXrl3D52/vGx
        4XJHooVdItX1MJO82XLWjTeUUP3hExTqUAGSrPdgDfAm8/uH2N3I48jW+6moLy3I5nOKMD
        CEWJT2A5jfIGMpzFUzlofqQ/lDONyv0RzOGAxxOCTbV1m4GCXtcHjNZicsvdlyCwjFZoec
        AftLvDJ6PpymBwdUIkCFDp844voFx6LxoMN5HhvvHExArOlVqejOI0yVGauOfw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 27, 2022 at 12:57:16PM +0300, Sakari Ailus wrote:
> > +		ret = pm_runtime_resume_and_get(&client->dev);
> 
> Please see how e.g. the CCS driver does this (no need for autosuspend
> though). E.g. don't use runtime PM to power the sensor on in probe, or off
> in remove.

What's actually needed in this driver would be explicit use of the resume
and suspend callbacks for !CONFIG_PM as well as setting the callbacks in
ov5670_pm_ops. No other changes should be needed.

-- 
Sakari Ailus
