Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054CC5BAC09
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 13:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbiIPLJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 07:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbiIPLJ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 07:09:26 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D425219F
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 04:03:14 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id DA09720351;
        Fri, 16 Sep 2022 14:03:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1663326191;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IbF20xIoZc6/dfNLUJGudlugA6F7FbEGuLXVl2wIYTI=;
        b=YKbj4rDdMlWyzx1dV577oJ4/7QK+9EUAfiqnMXEANywyLr1RD3RQJo6kO3lWxzghMNjG8X
        YC8MJMtOtM7E1dbCyK0qBLxyHdezIrxXxtI4C47p4B3I7Bc7+3EbFxXcxKPHMEi8lbnLt6
        2Z0rJbKFMSG9UEfO7EC12NDruGUBxag=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6BC63634C91;
        Fri, 16 Sep 2022 14:03:11 +0300 (EEST)
Date:   Fri, 16 Sep 2022 14:03:11 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>, jacopo@jmondi.org,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 4/5] media: i2c: imx412: Add imx477 compatible string
Message-ID: <YyRX78PH/3zSCdCU@valkosipuli.retiisi.eu>
References: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
 <20220915003522.1227073-5-bryan.odonoghue@linaro.org>
 <CAPY8ntCmRy_BSQW6QajrRMLpQBzMimcQPvZw1ocazxhr2dOd0A@mail.gmail.com>
 <e29e5573-13b6-0a29-20c7-ba780d825a37@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e29e5573-13b6-0a29-20c7-ba780d825a37@linaro.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1663326191; a=rsa-sha256; cv=none;
        b=jpgBJZKOZWcEIJXBv08L4MgmWu4xJefGQ3ohzstx4fC9MnUN51DBEzHHTeVBA4GwO08hUO
        zPh0XjWeytc6W+KGRDPVS6b0de/6bfdAct5DdA7UM8TuxyXcT5GMu05/jSAPZ8JzslkNgS
        o+suDvwVq6xcMWrjsideDbhxZ0Ppcrs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1663326191;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IbF20xIoZc6/dfNLUJGudlugA6F7FbEGuLXVl2wIYTI=;
        b=MaJahyOsen3im3aP2xzSFQiZXaOMJTwwKOEbz/vxr8T4ivyc3ceYumlwYqPrTFFrHYGRoK
        oQxCmCMeXS3jZcRbKOzf4re6hLECmpcC/138IZoB5LDwweYdYSyboAbe7sMcMr5jU/UjR+
        s2vo/30ABntSNRZCq1bmshn80LAGHUQ=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

On Fri, Sep 16, 2022 at 01:32:06AM +0100, Bryan O'Donoghue wrote:
> On 15/09/2022 23:03, Dave Stevenson wrote:
> > Hi Bryan
> > 
> > On Thu, 15 Sept 2022 at 01:36, Bryan O'Donoghue
> > <bryan.odonoghue@linaro.org> wrote:
> > > 
> > > The Sony imx477 uses the same silicon enabling reference code from Sony in
> > > the available examples provided.
> > 
> > Have you had any conversations with Sony on whether the same register
> > settings are genuinely valid for all of these sensors?
> 
> There's alot to unpack here but... this shows me the main thing
> 
> https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/media/i2c/imx477.c#L37
> 
> The vendor driver reference code I have expects 0x0577. I've discussed with
> Daniele previously - that imx412 and imx577 both return 0x0577 in the chip
> id field and this imx412.c driver won't work with any chip reporting
> anything else.
> 
> Your chip though is returning 0x0477 so it will need to have its own
> upstream driver anyway.

That doesn't matter. What does however matter is what that sensor does and
how it's controlled. It is entirely possible that earlier versions of such
a sensor simply report a wrong ID.

> 
> So the conclusion I drew from the Nvidia/Leopard stack is wrong they call
> the driver imx477 but pointedly and suspiciously comment out the check for
> chip id.
> 
> And its pretty clear why, its so the "imx477" driver they have with work
> with chips identifying as 0x0577 and 0x0477.

I wouldn't be so worried about the model ID *if* the registers (and their
values) programmed to the sensor are otherwise the same.

And even if you have small differences in the registers you'll need to
write there, you can still differentiate between the sensors based on the
compatible string.

I don't have strong opinion on the grey areas though. Still if the register
set is exactly the same, then the driver should also be the same.

-- 
Kind regards,

Sakari Ailus
