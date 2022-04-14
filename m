Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 418C8501DD5
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 23:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242876AbiDNWB3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 18:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241976AbiDNWB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 18:01:28 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788D18CCEE;
        Thu, 14 Apr 2022 14:59:02 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 170F420045;
        Fri, 15 Apr 2022 00:59:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1649973540;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5hifFW0DYRLP6QBZQ9XcpeIgOAJncYgFqZASZgCVWkE=;
        b=BGJFpjwpfLPHdl8iCMgYTO5SnhrXTS1wwZKt3ZlR1JyWxhQ+E7Qe059DUG5zolm92IlL8o
        XKR2JI2nvPQcWntqhxXlKWcfvgd9C6rdhO6+EhN48bHSpwRwvfARz/36O0j264eBu4MAGd
        i9Nv6Gbg3QHGLcdlyaz9sPEmRecmJyA=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2D53F634C91;
        Fri, 15 Apr 2022 00:58:59 +0300 (EEST)
Date:   Fri, 15 Apr 2022 00:58:58 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robert.foss@linaro.org, hfink@snap.com,
        jgrahsl@snap.com, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v3 2/2] media: i2c: imx412: Add bulk regulator support
Message-ID: <YliZIqg201pDH1aH@valkosipuli.retiisi.eu>
References: <20220414124505.1329295-1-bryan.odonoghue@linaro.org>
 <20220414124505.1329295-3-bryan.odonoghue@linaro.org>
 <Ylga7FVsbK6znD/+@valkosipuli.retiisi.eu>
 <39cae749-67ef-13d7-2648-01c6e9603887@linaro.org>
 <Ylgn8u5Au0EqUkLj@valkosipuli.retiisi.eu>
 <831e3857-9ee7-c760-ef2e-3b235b57b907@linaro.org>
 <YlgssKI+WVeRTda6@valkosipuli.retiisi.eu>
 <784b5caf-1e1a-e57c-126e-4b28bc6ff7f8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <784b5caf-1e1a-e57c-126e-4b28bc6ff7f8@linaro.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1649973540;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5hifFW0DYRLP6QBZQ9XcpeIgOAJncYgFqZASZgCVWkE=;
        b=T06yiq8Cu3w7/Qx7hKeOdbQpdlsN4muDLvnVj0LdVDWsYIxK7GZ/w6tADKXlu2AruBvrZu
        cJ4mUUmK7AA1+BJudzMEwVx0Gud7FSrzThpaHlHaAG3pw2kV5qOg4oq0gJ0SSSqkBWOsFj
        Cs6f2emAuZlCcmGKBLTRmfLcGyXXUAU=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1649973540; a=rsa-sha256; cv=none;
        b=I0CbLKyJ0OgL1feMpV5Vc/c2jKtSstmqoldmOrpKK8qk8ARTA9I1tqvVPAgE5+nEknPl5o
        lGDihDCED8ysP4w4Rl85jAIzU5QsjSR4Apxzhlp1+uLliS1nLTpZ+lRahZVmeEnhmkS4fW
        HNV75qncFsON0aoisKzizkQE4TBbvUU=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

On Thu, Apr 14, 2022 at 03:50:50PM +0100, Bryan O'Donoghue wrote:
> On 14/04/2022 15:16, Sakari Ailus wrote:
> > On Thu, Apr 14, 2022 at 03:04:10PM +0100, Bryan O'Donoghue wrote:
> > > On 14/04/2022 14:56, Sakari Ailus wrote:
> > > > On Thu, Apr 14, 2022 at 02:44:00PM +0100, Bryan O'Donoghue wrote:
> > > > > On 14/04/2022 14:00, Sakari Ailus wrote:
> > > > > > >     	ret = clk_prepare_enable(imx412->inclk);
> > > > > > >     	if (ret) {
> > > > > > > +		regulator_bulk_disable(imx412->num_supplies,
> > > > > > > +				       imx412->supplies);
> > > > > > As the function already has an error handling section using labels, this
> > > > > > should go there as well.
> > > > > > 
> > > > > Are you asking to move regulator_bulk_disable() to error_reset ?
> > > > 
> > > > No. You'll need another label.
> > > > 
> > > 
> > > Hmm.
> > > 
> > > I think another label is not required, have a look at V4.
> > 
> > Ah, yes, indeed. There's just a single location where this will be needed.
> > 
> > On another note, gpiod_set_value_cansleep() seems to enable reset in
> > resume and disable it in suspend. I.e. the polarity is wrong.
> > 
> 
> Agreed, the polarity looks wrong - in my DTS right now I have ACTIVE_HIGH
> for the relevant GPIO.
> 
> For example if I do this
> 
> @@ -1363,7 +1363,7 @@ camera@1a {
>                 compatible = "sony,imx412";
>                 reg = <0x1a>;
> 
> -               reset-gpios = <&tlmm 78 GPIO_ACTIVE_HIGH>;
> +               reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
>                 pinctrl-names = "default", "suspend";
>                 pinctrl-0 = <&cam2_default>;
>                 pinctrl-1 = <&cam2_suspend>;
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index a9cdf4694d58..1442b416f5aa 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -1036,7 +1036,7 @@ static int imx412_power_on(struct device *dev)
>                 return ret;
>         }
> 
> -       gpiod_set_value_cansleep(imx412->reset_gpio, 1);
> +       gpiod_set_value_cansleep(imx412->reset_gpio, 0);
> 
>         ret = clk_prepare_enable(imx412->inclk);
>         if (ret) {
> @@ -1049,7 +1049,7 @@ static int imx412_power_on(struct device *dev)
>         return 0;
> 
>  error_reset:
> -       gpiod_set_value_cansleep(imx412->reset_gpio, 0);
> +       gpiod_set_value_cansleep(imx412->reset_gpio, 1);
>         regulator_bulk_disable(imx412->num_supplies, imx412->supplies);
> 
>         return ret;
> @@ -1068,7 +1068,7 @@ static int imx412_power_off(struct device *dev)
> 
>         clk_disable_unprepare(imx412->inclk);
> 
> -       gpiod_set_value_cansleep(imx412->reset_gpio, 0);
> +       gpiod_set_value_cansleep(imx412->reset_gpio, 1);
> 
> Seems like changing the logic would negatively affect the Intel people.
> Might have to churn ACPI to change that logic..
> 
> Easier probably to leave as is and define as ACTIVE_HIGH in DTS

It's still wrong and should be fixed. It seems there are no boards in the
DT source in the kernel using this sensor. These changes seem fine to me.

I'm not really worried about ACPI: it's unlikely the GPIO is even declared
for the sensor, and instead is controlled in AML. There can of course be
bugs in ACPI tables, too...

-- 
Sakari Ailus
