Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 503A85016B2
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 17:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243479AbiDNPKW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 11:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350857AbiDNO26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 10:28:58 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E2F2D3727;
        Thu, 14 Apr 2022 07:16:19 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 24DD41B00120;
        Thu, 14 Apr 2022 17:16:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1649945777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pvulFv7jAgH4apEjrCvylHe5kRcBA3as2o6GU9uqPn4=;
        b=a2f9PdJHszxEb3VuwK3r4xY1QNcLx4NsfqPLfTofNbX2OLqO/PEYfegU1AmzS66gSfr/uw
        BTxhbDq/NnlO12WikoYy2aCY46eeAPtMAtT+YGoysucdkDzKMiNQLzL7o4auL3ZQnwz3kv
        ZGgFKgUxY2QDs7sUphwDE+k8zA1H/1WnL6xYkMZkEjiDrp8qdsd1Y+hXrYmSC4xAmM+5nU
        z4i0kVFr6SmJfNMHMh8vYiW05aM9IMhwo3SDN/LcXWFisUX4KKcJ4QmsNIdrdCi0lL7RAo
        Boa35DkenTX9hAg7T14UPQ6Yp7H2BeGlTC14riGabM3DkMYXXANLCDcnC9cRNQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A5599634C91;
        Thu, 14 Apr 2022 17:16:16 +0300 (EEST)
Date:   Thu, 14 Apr 2022 17:16:16 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robert.foss@linaro.org, hfink@snap.com,
        jgrahsl@snap.com, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v3 2/2] media: i2c: imx412: Add bulk regulator support
Message-ID: <YlgssKI+WVeRTda6@valkosipuli.retiisi.eu>
References: <20220414124505.1329295-1-bryan.odonoghue@linaro.org>
 <20220414124505.1329295-3-bryan.odonoghue@linaro.org>
 <Ylga7FVsbK6znD/+@valkosipuli.retiisi.eu>
 <39cae749-67ef-13d7-2648-01c6e9603887@linaro.org>
 <Ylgn8u5Au0EqUkLj@valkosipuli.retiisi.eu>
 <831e3857-9ee7-c760-ef2e-3b235b57b907@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <831e3857-9ee7-c760-ef2e-3b235b57b907@linaro.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1649945777; a=rsa-sha256;
        cv=none;
        b=QCKPxYhwMDFvENaQq1z+w/MSTvf461HGlsdiPQEorRW9EVC6RN3n8pXCFFq86aXMVl69+P
        CMlvVfUjnC1TCW2u2hq4anJpzc3bDG9KvoEi4wrad8gW/V+AZYbJUPIrBlCYWxJGrAqfdy
        2xZ3sqV47tousYJotMq0fvl66FdxOc4NQooTeu9BiH42VTUykgtR/jgF6S0cHFc0VX1rA3
        EUFFuKVw5vpiP5xwcFO6AXbhM3pNJz9P9MaOPtVdmmDdlfx6KYm5d1S5KrOKXEwFoG0KNI
        KAL2UEHMvu8kN6x6A7JZR8YUk+R9oBzMCFB0XUFoXc6LW1Ma3eGAxaPiE/L7hg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1649945777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pvulFv7jAgH4apEjrCvylHe5kRcBA3as2o6GU9uqPn4=;
        b=aLc/vPeElKL6lL5HeCEPGzKKI6PEi4/FFxqGtB1tTlUjWfpvxzZ4E2BKxBu9x5jRtm6N9b
        qDxTQ/tDfNzX+b/bXPhPcBfh+z8bfvYbj5G6QXuUlFhtx2O6uoGplKDzM3yt0kQRng10iP
        2S/32mWZTMI30SG4gHOEwEpdBdK34YWusjzU5GIQTpHUsDWoE+HCOwuO4CYhUjNatf1jca
        8zkWUu1Xx+I2jSSj3KSo9UVC+SwbARCgipTHwAKJo2+ax2BBn8N6v/SnPAL1UL1e3AGFta
        El6iRsA5i4ysI1oBfCaD4DtgxJb38yHSYMBVfZEPFiWhZmyHoWcWvrLZfmbiBA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 14, 2022 at 03:04:10PM +0100, Bryan O'Donoghue wrote:
> On 14/04/2022 14:56, Sakari Ailus wrote:
> > On Thu, Apr 14, 2022 at 02:44:00PM +0100, Bryan O'Donoghue wrote:
> > > On 14/04/2022 14:00, Sakari Ailus wrote:
> > > > >    	ret = clk_prepare_enable(imx412->inclk);
> > > > >    	if (ret) {
> > > > > +		regulator_bulk_disable(imx412->num_supplies,
> > > > > +				       imx412->supplies);
> > > > As the function already has an error handling section using labels, this
> > > > should go there as well.
> > > > 
> > > Are you asking to move regulator_bulk_disable() to error_reset ?
> > 
> > No. You'll need another label.
> > 
> 
> Hmm.
> 
> I think another label is not required, have a look at V4.

Ah, yes, indeed. There's just a single location where this will be needed.

On another note, gpiod_set_value_cansleep() seems to enable reset in
resume and disable it in suspend. I.e. the polarity is wrong.

-- 
Sakari Ailus
