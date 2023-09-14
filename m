Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 750D67A01AC
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 12:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236937AbjINK3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 06:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbjINK3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 06:29:05 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEF41BE9;
        Thu, 14 Sep 2023 03:29:01 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RmYT70x8Jz49Q2P;
        Thu, 14 Sep 2023 13:28:59 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1694687339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WtaGqx5GLqOEJpsE/wQo6ET6eiXrk4gLftnj+VCpbJo=;
        b=XFio6yfYKTZkvEBSHiw15j5+pY2W7TW682lrxe+uPFBTVTkiQfnsu6kzWq4G/izweztnns
        KN++liK8ZfNoByMXGXEYmRZ9w8uCxxxEbbcUpWELGeUbFGKyP7GPd4ijkZ+PanhB9hSHG3
        cNn46xAKpPiXHKmn7OT2vcktXsyOFHt3LxdhlIZHXlncQar+nw3HVxyyRnHSjr1WFrjP9I
        KMQ+NB03nGc6wzPYZ9ZkheSWsiZmwSnNl7FV2S2rMBmcgz6IpKMxtbEtW1R6TYz2dUXbr7
        HCq41YEAvQGHUvEvDpca/7PvFNoQC5yNSsa+IYLIYTCVkJvcx4u8UjoIS85mfw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1694687339; a=rsa-sha256;
        cv=none;
        b=tq++DlDlXFEm+byNMExaafhAq0wVtDj16f6fdB3zZyxdgTdbQEvqasmUk/Qne+TEbygZYY
        1den4cQCfYSctZb2ILayW0ilEWC2TZWE6yT7NQeccKIrzyR2L7Q2ZUGL3OQ8CmOLkYVurg
        /Uh5Gjg4ACb0lbMisiKiOkGAg3D7AOeAskycmmGxqo/1+9fLl1VTfSsIAcU9u01zhf1O+3
        MkOKYMqQ2Q1pkRImCJrdxzqOIjys0UKIfP4GxgeZnnnYXWZ/9DE7ViCTet2T0mP4ec86NO
        ikhPF+lPVjDImFpiQryYm2Dl198sjFVQ0mnCd+6OhuynzrvmltYtaghYB0PMMQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1694687339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WtaGqx5GLqOEJpsE/wQo6ET6eiXrk4gLftnj+VCpbJo=;
        b=Nv4DXPQHXFM0ENdf6M25YuSB9QgibSPLzvcau+zrZCDvZdDhiX1RjzEbGibcvz+7kTo6WI
        Yy9mk4s0BRpJ19InYZrGbNURcwqhZbevXJwjh6LQZnZfvMDVHmV39lgWPM3HOLCyxIbfk9
        Ahpil8pQyJk0979yyhce550Cm8qeyDx/riB3vs7QiCSZoDOUEiPa+oXw4u1JKc/W3oPtkf
        nvIq1L37wNHhQOJWYZZQmua9CWq9FfSVAiTMldCwZtP+rIiIvXvO1pAUQ2vqaV7a4VU5Mn
        Us8VQ6+eDuldsOOMBeBfD/Nq/d5+lmsn+WKDO4kg18Gz3u32a6+CXAUelYRdEg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A74B7634C93;
        Thu, 14 Sep 2023 13:28:58 +0300 (EEST)
Date:   Thu, 14 Sep 2023 10:28:58 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH] media: dt-bindings: ovti,ov772x: Make powerdown-gpios
 active-high
Message-ID: <ZQLgauEc3VtRQUMm@valkosipuli.retiisi.eu>
References: <20230913193932.1947918-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913193932.1947918-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Wed, Sep 13, 2023 at 04:39:32PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The powerdown-gpios description mentions:
> 
> "Reference to the GPIO connected to the PWDN pin which is active high."
> 
> Improve the example by making powerdown-gpios active-high for consistency.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> index 5d24edba8f99..5aec65b053af 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> @@ -114,7 +114,7 @@ examples:
>              compatible = "ovti,ov7725";
>              reg = <0x21>;
>              reset-gpios = <&axi_gpio_0 0 GPIO_ACTIVE_LOW>;
> -            powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_LOW>;
> +            powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_HIGH>;
>              clocks = <&xclk>;
>  
>              port {

Looking at the driver code, it seems the powerdown GPIO is set to state 1
when the device is powered on and to 0 when it's powered down. This looks
like a driver bug.

But what happens if you fix something like this after five years in
existence? Maybe just leave it as-is, and document it??? Then again,
there's a single Renesas board that appears to have such a device, added
two and half years ago.

Also cc Jacopo.

-- 
Regards,

Sakari Ailus
