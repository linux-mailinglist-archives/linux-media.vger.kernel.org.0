Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB8057E408
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 18:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234693AbiGVQDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 12:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbiGVQDG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 12:03:06 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6218C61711;
        Fri, 22 Jul 2022 09:03:04 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 1808120272;
        Fri, 22 Jul 2022 19:03:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1658505782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FiSm34UE9KFbZYJZ8pR9v7Fsd0k+gVOG64jsciWmcVk=;
        b=iG0F+MoWoJB6nMI/KUmAuxSlhwg0cLpe2DoBdJHOebyGInKT16MC15UXeL8YKkTZ2vIYYo
        gUQUXXHAWoulV5hp/7vFybi1Ym6jV5CXMa16yq9MtpPdVLGgYNQZaBoOtBzeg4ZP+UnkCf
        VQGXImI1HW0UepO9CdxyaGT1d1OuMEI=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 661E5634C96;
        Fri, 22 Jul 2022 19:03:01 +0300 (EEST)
Date:   Fri, 22 Jul 2022 19:03:01 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        andrey.konovalov@linaro.org
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: Rename imx412 to imx577
Message-ID: <YtrKNQaMYOhc4UUM@valkosipuli.retiisi.eu>
References: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
 <20220718014215.1240114-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718014215.1240114-2-bryan.odonoghue@linaro.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1658505782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FiSm34UE9KFbZYJZ8pR9v7Fsd0k+gVOG64jsciWmcVk=;
        b=g4VLjDK+ZGqLHPNv/3498Yx0gPbEHrQYEqI3P4FJ8Ulq3GGZoR85ltllMxoVnGWJLln2fE
        4yCl2fVBWahSZDjVzdIGnh26VJEGx8uvrlbEFbFAFgVW3RFbibp8oJ0XhMzW1RQjMotshh
        AQG2Pu7aHwBGfujDAxL2ZZg48jFG3HI=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1658505782; a=rsa-sha256; cv=none;
        b=yPkQMxTdhJE8g7Qg7YLXpHBUPxHDnWYK9vKDKDs84B7769v0qoAJcFfr1wDTYQOveuVJ3d
        N6S1kCmV0dI9XDls645JKhc8bEZuVsFAFoFXBPs/6C2KMg8JiEW/2YP3hGnjNWkcrAzEYz
        zAMi6429J43SMLF9Ht91pvOL0OVQiJI=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

On Mon, Jul 18, 2022 at 02:42:13AM +0100, Bryan O'Donoghue wrote:
> The yaml and driver we have right now misidentifies the imx577 as the
> imx412.
> 
> Looking at similar IMX chips which give their chip identifier via register
> 0x0016 we can see:
> 
> drivers/media/i2c/imx258.c:#define IMX258_REG_CHIP_ID    0x0016
> drivers/media/i2c/imx258.c:#define IMX258_CHIP_ID        0x0258
> 
> drivers/media/i2c/imx319.c:#define IMX319_REG_CHIP_ID    0x0016
> drivers/media/i2c/imx319.c:#define IMX319_CHIP_ID        0x0319
> 
> drivers/media/i2c/imx355.c:#define IMX355_REG_CHIP_ID    0x0016
> drivers/media/i2c/imx355.c:#define IMX355_CHIP_ID        0x0355
> 
> Right now imx412.c does:
> 
> drivers/media/i2c/imx412.c:#define IMX412_REG_ID         0x0016
> drivers/media/i2c/imx412.c:#define IMX412_ID             0x577

This is not a proof the device in question is no IMX412. It's entirely
possible Sony has two sensors that both happen to have the same value in
the ID register. Quite possibly the sensors, for a reason or another, share
the same chip, so also the ID register will be the same. I wouldn't
necessarily expect them to make a variant just for that.

At least I'd like to see more convincing evidence IMX577 was just confused
with IMX412 before merging this.

But I'm fine with adding another compatible string for IMX577.

-- 
Regards,

Sakari Ailus
