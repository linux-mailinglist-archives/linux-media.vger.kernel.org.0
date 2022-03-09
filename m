Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE02A4D3654
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 18:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236695AbiCIRKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 12:10:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237046AbiCIRKg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 12:10:36 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7616C18FADA
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 09:01:56 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 489DC20071;
        Wed,  9 Mar 2022 19:01:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1646845314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vPXcqobrp4q97DzaNBGyomZKrfQ1zWz2Uuz9SZUojho=;
        b=y0ZAoj8CJrza1GSdt2M9vDd7+lpZugpl9/P1+VhhGrJvDxsvBykzHFExW38O8yiS6q2roN
        ORZ2ms7NqfgEmyVYIo5zEq/eTBQuuRLgNaxIva1VJK4aPNP0Uw7qrcsrDIedKcHsEbgCmr
        ITaLgjFLsu4AhrEiC4d1F2zMoRwoJYA=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C34D3634C90;
        Wed,  9 Mar 2022 19:01:53 +0200 (EET)
Date:   Wed, 9 Mar 2022 19:01:53 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ov5640: Use runtime PM
Message-ID: <YijdgX+t12JZrusb@valkosipuli.retiisi.eu>
References: <20220309113232.1182362-1-paul.elder@ideasonboard.com>
 <20220309134757.43uoopt5qbgonuup@uno.localdomain>
 <Yii4jxm8MLxlC0Lb@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yii4jxm8MLxlC0Lb@aptenodytes>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1646845314; a=rsa-sha256; cv=none;
        b=x5RjM3Zre1sU27xbc2DZ5MVB4MRjsDBtTopI8Cwq9N/4obt8EnBNpRrIOR5JyExK8VltKH
        HKyMOOTo2bWKgprXFrlxfWDva+Dp5riqtHsXSi6Ok9npi/CFHrW0fBhQiPMb0Ieoi4X+Sb
        +XLWqsLXVqlBHn7vz2wYEZm9TzgT2vc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1646845314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vPXcqobrp4q97DzaNBGyomZKrfQ1zWz2Uuz9SZUojho=;
        b=K5KETnb2GB8LI7UedB+lb5otqp2G5SRaqPbDiYtWBcA7o3+pGRCqOnwVoXs69E2fShHXwg
        AqqMYunZrve3A6bNy9y0QA210IPfV/WR2gwNRvlOFflNLCr7cL94TIgzv0MfoSFRPbBQB+
        NNACrfy3ggGVV3wqh8FYOUF+gHXLcQc=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pauls, Jacopo,

On Wed, Mar 09, 2022 at 03:24:15PM +0100, Paul Kocialkowski wrote:
> Hi Jacopo,
> 
> On Wed 09 Mar 22, 14:47, Jacopo Mondi wrote:
> > Hi Paul,
> > 
> > On Wed, Mar 09, 2022 at 08:32:32PM +0900, Paul Elder wrote:
> > > Switch to using runtime PM for power management.
> > 
> > What happens if CONFIG_PM is not selected ? Two of the existing
> > sensor drivers in mainline depends on PM but not the ov5640, and I'm
> > not sure we should depend on PM to be able to compile the module.
> 
> I think the direction for the media subsystem is to use runtime pm
> everywhere possible, which is not opional (like traditional PM) so
> I really thinks it makes sense to have the sensor driver depend on it.

Without runtime PM, the sensor is always powered on. There's no reason why
the driver shouldn't work without it. Few will want to use such
configuration though.

I don't see a problem with depending on CONFIG_PM though.

> 
> The alternative would probably be to keep the s_power implementation
> when !CONFIG_PM which is certinaly not something we want.
> 
> > Also I see very few #ifdef CONFIG_PM in drivers/media/i2c so either
> > the CONFIG_PM dependency is not an issue or most sensor drivers don't
> > care.
> 
> This seems like an overlook, I think drivers that rely on runtime pm
> do need to depend on PM in Kconfig.

Runtime PM has nop functions that are used instead if it's disabled in
kernel configuration. #ifdef's shouldn't be used.

-- 
Regards,

Sakari Ailus
