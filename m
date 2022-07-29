Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC44A584C65
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 09:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234663AbiG2HHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 03:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232555AbiG2HHp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 03:07:45 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14375BC31;
        Fri, 29 Jul 2022 00:07:44 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id C72721B002C9;
        Fri, 29 Jul 2022 10:07:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1659078460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GLHwRWD8w65TnHLEVtLlTx9NDMVLYEkO0F6RFMeR+IY=;
        b=G7yoncEnfQRIJmkGrI/xeC0bYXWSDyhdcq92q6ArEcrB/1jkZMw8m8TnMT6VGyGQ/kPfjt
        qe6b3Hy2MDqc66R4mv2rzPWcaz+SKDNswExH6jdfHguRAx07kAceosTrrS5BvdSDFoox6f
        JLgEvSZSLl0N9qYJRHilQ2xGELSO2Jblr9hRAt2nBn/ESs3zdREg9Ad71jBoVR8d4u24YE
        a4iGrkV4Xyv+Y8P69/8+wqlNptiE9MwkBliZ9lTwG1934/hDDa4Z2LQ3gNYR7PFLTq4sXu
        FFmylPlyWBo6crJ2lOzCy5BL6TF/9t0rkjqiJCM6DQVgCUpzyMg9o1BYroFbaQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 43A97634C97;
        Fri, 29 Jul 2022 10:07:36 +0300 (EEST)
Date:   Fri, 29 Jul 2022 10:07:36 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 3/7] media: i2c: ov9282: Add ov9281 compatible
Message-ID: <YuOHOEUk+znzump5@valkosipuli.retiisi.eu>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
 <20220728130237.3396663-4-alexander.stein@ew.tq-group.com>
 <4e89e55b-9312-5525-974b-0a1dbe0b3dd1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e89e55b-9312-5525-974b-0a1dbe0b3dd1@linaro.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1659078460; a=rsa-sha256;
        cv=none;
        b=P+1gUNu7FHb44zhrppmS/d+DVSoNMGESY8AknH3gxUVgPALpG5FmpbUkdkJlM8ipaS2e0B
        90YrWqp4eX1rQsp1Fd1qFzvPJgfBGCty/7s8lYU4JmWFZeJSP0zIHxTzegIlG/Qnbgz57Q
        jGadX+jqgjvfPQIws/IsqOUOg6ST4YtrtYc1bByfFb6e5fKFwIh7uqcSDhCk/WtRRC+uTL
        Hewq3BPtopuUAbTOAf9OWz8qfcXxAohOXJoFi8+mKUnUINvig0q2KN7T5P39iJqnpp0H/f
        rBqNwdWM+Tk/pZGL4zgdbFHnDHYy0I9AFFWNSZMcvRay+9ywp0hljO2dgK38GQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1659078460;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GLHwRWD8w65TnHLEVtLlTx9NDMVLYEkO0F6RFMeR+IY=;
        b=A7iFlK8IZS/vdjvYkAFOcJQVEhAThTpHGD2nQDzWgIrun97HXAqZI9DmR0oqLlib7NhD0L
        4TBudi+MPru008sq5PkF837n88/9Q0fYDBb91PIqpTuAZASZHfo0+0ynkEBp57lvWrTOBT
        f0Ca6U2ocPLUKggFLIMrf5Fom3whSJ7WtJzCVLZ8eyM6NsG9bhk56LsbqoEcXpEoxxgajz
        xm0f1vvNUB2wdvWakE/QLH4zjEVfqeZZpsRqmcJDMMnQGwsmLwy3IPX6mAYIAE5QGUFAXJ
        NB6C/2Q+ELvR+6Esm94uSo8MPaXyJDxKE4KaYp2cn5z9TToDzqJJpCMPAewWbA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Thu, Jul 28, 2022 at 03:13:11PM +0200, Krzysztof Kozlowski wrote:
> On 28/07/2022 15:02, Alexander Stein wrote:
> > According to product brief they are identical from software point of view.
> > Differences are a different chief ray angle (CRA) and the package.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 8a252bf3b59f..c8d83a29f9bb 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -1113,6 +1113,7 @@ static const struct dev_pm_ops ov9282_pm_ops = {
> >  };
> >  
> >  static const struct of_device_id ov9282_of_match[] = {
> > +	{ .compatible = "ovti,ov9281" },
> 
> The devices seem entirely compatible, so why you add a new compatible
> and not re-use existing?
> 
> The difference in lens does not explain this.

It is typically necessary to know what kind of related hardware can be
found in the system, beyond just the device's register interface. Apart
from USB cameras, less integrated cameras require low-level software
control in which specific device properties are important. In this case it
could be the lens shading table, among other things.

	https://www.ovt.com/sensor/ov9282/

Therefore I think adding a specific compatible string for this one is
justified.

Also cc Laurent.

-- 
Kind regards,

Sakari Ailus
