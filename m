Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307CF5878F1
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 10:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234340AbiHBIXU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 04:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbiHBIXS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 04:23:18 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C73335;
        Tue,  2 Aug 2022 01:23:15 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id F213620286;
        Tue,  2 Aug 2022 11:23:12 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1659428593;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0HB89LoIxvPz0vczhjTrP5g62Y6y4FGBGyLvc1r06GM=;
        b=C2+WbFB71NHBVDRJ0931sladLT6gEhF/eWDRheJTSXRwEKRxdzdjsxWZI97tNU6boS0LAD
        fF34kMYORFhHTzDj+1bmiQbln/2Lr8w+B+iacG11UXoXcvgJJg/7Y5tSzwF4OBN6WvDNMl
        YONAosseX6XiiWtmv2kqOzmhRXfoUkM=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C50BB634C97;
        Tue,  2 Aug 2022 11:23:08 +0300 (EEST)
Date:   Tue, 2 Aug 2022 11:23:07 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH v4 3/7] media: i2c: ov9282: Add ov9281 compatible
Message-ID: <Yuje6wip8KEZG6Af@valkosipuli.retiisi.eu>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
 <20220728130237.3396663-4-alexander.stein@ew.tq-group.com>
 <4e89e55b-9312-5525-974b-0a1dbe0b3dd1@linaro.org>
 <YuOHOEUk+znzump5@valkosipuli.retiisi.eu>
 <YuOXyZ6XTW2DjLvd@pendragon.ideasonboard.com>
 <e3847096-ae60-9ab3-f1e7-c461508be952@linaro.org>
 <8015285b-940b-503a-159e-66f10a34a999@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8015285b-940b-503a-159e-66f10a34a999@linaro.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1659428593;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0HB89LoIxvPz0vczhjTrP5g62Y6y4FGBGyLvc1r06GM=;
        b=dgb4mH0STuoCto+TMtlIN5E0rlPnLofHqlZU5RrajcEEGVBVc0ULBZMw4G81eamjmbsaAq
        yJrjSb02XYMdUhe0pCS4aVTADybUMNqSwPm5zVZbqKtL2mC/J5seEIsMCKWvi87IRqukeb
        tTFM5EiMUZMLJuNkxfdqLTV5+GXjnAk=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1659428593; a=rsa-sha256; cv=none;
        b=pEEE307DNhd8IDwdAmbUlui6DoYSKzJNa7AhpgAcZWIFsEVpH9TDfza4jdZbG+8yQAQGPx
        lUXP7p1ai5QU18M3WFx1NyH1Zqd8fg7KwC71EylPG5kW7HspduQvxWWZEUUADhAH1571ST
        mp8+SqQUvkHgM/1j5zsNL8kKNzZi+Rw=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 01, 2022 at 08:08:58PM +0200, Krzysztof Kozlowski wrote:
> On 01/08/2022 20:07, Krzysztof Kozlowski wrote:
> > On 29/07/2022 10:18, Laurent Pinchart wrote:
> >> Hi Sakari,
> >>
> >> (Adding Dave and Naush to the CC list)
> >>
> >> On Fri, Jul 29, 2022 at 10:07:36AM +0300, Sakari Ailus wrote:
> >>> On Thu, Jul 28, 2022 at 03:13:11PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 28/07/2022 15:02, Alexander Stein wrote:
> >>>>> According to product brief they are identical from software point of view.
> >>>>> Differences are a different chief ray angle (CRA) and the package.
> >>>>>
> >>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>>>> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> >>>>> ---
> >>>>>  drivers/media/i2c/ov9282.c | 1 +
> >>>>>  1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> >>>>> index 8a252bf3b59f..c8d83a29f9bb 100644
> >>>>> --- a/drivers/media/i2c/ov9282.c
> >>>>> +++ b/drivers/media/i2c/ov9282.c
> >>>>> @@ -1113,6 +1113,7 @@ static const struct dev_pm_ops ov9282_pm_ops = {
> >>>>>  };
> >>>>>  
> >>>>>  static const struct of_device_id ov9282_of_match[] = {
> >>>>> +	{ .compatible = "ovti,ov9281" },
> >>>>
> >>>> The devices seem entirely compatible, so why you add a new compatible
> >>>> and not re-use existing?
> >>>>
> >>>> The difference in lens does not explain this.
> >>>
> >>> It is typically necessary to know what kind of related hardware can be
> >>> found in the system, beyond just the device's register interface. Apart
> >>> from USB cameras, less integrated cameras require low-level software
> >>> control in which specific device properties are important. In this case it
> >>> could be the lens shading table, among other things.
> >>>
> >>> 	https://www.ovt.com/sensor/ov9282/
> >>>
> >>> Therefore I think adding a specific compatible string for this one is
> >>> justified.
> > 
> > Specific compatible in binding is a requirement. No one discussed this.
> > However not in the driver. None of the arguments above justify adding
> > such binding, unless user-space depends on matching compatible, but not
> > real compatible?
> 
> Eh, now I used vague words. This should be instead:
> 
> "However not in the driver. None of the arguments above justify adding
> such compatible to driver, unless user-space depends on matching
> compatible, but not real compatible?"

If I understand you right, you'd put the more specific model name as well
as the more generic one to the compatible property and let the driver match
against the more generic one?

But in this case neither of these models is more generic than the other.

-- 
Sakari Ailus
