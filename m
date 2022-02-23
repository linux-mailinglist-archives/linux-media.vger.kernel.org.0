Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1154C1042
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 11:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239563AbiBWK0P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 05:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbiBWK0P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 05:26:15 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5618C7E7
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 02:25:47 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id AD97C20072;
        Wed, 23 Feb 2022 12:25:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1645611943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dR9W6iFPELwr71PEcQdtWKFBtLQNTPTOu+jWWAusF6I=;
        b=QV2m3J5TuLVnCRi7GsO170ZtERk46ldk3sF6+gYWavjdw3xUWkZWToTpIoZoxXEaSoqUQ8
        ++o2HYIZQvvClK+nAW4yhMfcMUMMB3Lw0LlhJDmSp4Vv+b+5U8rMfOpfpOJF/hGDUGTXoR
        8UUq0WUIPq5qGvtDT1cQqLViSXqGaKU=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 32A3F634C90;
        Wed, 23 Feb 2022 12:25:43 +0200 (EET)
Date:   Wed, 23 Feb 2022 12:25:43 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] v4l: fwnode: Remove now-redundant loop from
 v4l2_fwnode_parse_reference()
Message-ID: <YhYLp+a8Ul8pFYU1@valkosipuli.retiisi.eu>
References: <20220223094720.19196-1-sakari.ailus@linux.intel.com>
 <YhYJP+Skx1u2n2k/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhYJP+Skx1u2n2k/@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1645611943; a=rsa-sha256; cv=none;
        b=j4e00XaydseRsacn8Ueh9gaDtwzktMYDnRyVh7dioMlJ9LfF0z9yl5nrCh3LYXzeUSQrBF
        pVsKzNRO3jJfCBzsIAOgmxyxCMboWzVRVsBESWThMfnG/fSbKKnVhYqmIpT3LF5Z/gxUIS
        s8E44QACwkqaLoFIIiMXvU9RbZAGjeE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1645611943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dR9W6iFPELwr71PEcQdtWKFBtLQNTPTOu+jWWAusF6I=;
        b=SyAvosnkAidY7tI1Elz8y9RLtnn2QPu44blM9aDYusGwuP1RXvIwAFZXfv7iiJ3Mw6z9fz
        g4Q3vrbwdaBVRhzVbmFvYdv6YEg90zwTtnx/Ccx3+R8mR0NcBGeXQ8+ZCYHp3WgAjUSN+w
        w0XSJ4MIDcdp81Sw0Ifd3ZM/m3VwxIk=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the review.

On Wed, Feb 23, 2022 at 12:15:27PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Feb 23, 2022 at 11:47:20AM +0200, Sakari Ailus wrote:
> > v4l2_fwnode_parse_reference() relied on counting the number of references
> > for async array memory allocation. The array is long gone so remove
> > counting the references now.
> > 
> > This also changes how the function arrives in different unsuccessful
> > return values but the functionality remains unchanged.
> > 
> > Also the check for -ENODATA is removed, it was made redundant by commit
> > c343bc2ce2c6 ("ACPI: properties: Align return codes of
> > __acpi_node_get_property_reference()").
> 
> I would have done this first in a separate patch.

I'll split this.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 28 ++++++++-------------------
> >  1 file changed, 8 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index 71dcc9a96535..fe2dfc8f9d56 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -894,25 +894,8 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
> >  	int ret;
> >  
> >  	for (index = 0;
> > -	     !(ret = fwnode_property_get_reference_args(dev_fwnode(dev),
> > -							prop, NULL, 0,
> > -							index, &args));
> > -	     index++)
> > -		fwnode_handle_put(args.fwnode);
> > -
> > -	if (!index)
> > -		return -ENOENT;
> > -
> > -	/*
> > -	 * Note that right now both -ENODATA and -ENOENT may signal
> > -	 * out-of-bounds access. Return the error in cases other than that.
> > -	 */
> > -	if (ret != -ENOENT && ret != -ENODATA)
> > -		return ret;
> > -
> > -	for (index = 0;
> > -	     !fwnode_property_get_reference_args(dev_fwnode(dev), prop, NULL,
> > -						 0, index, &args);
> > +	     !(ret = fwnode_property_get_reference_args(dev_fwnode(dev), prop,
> > +							NULL, 0, index, &args));
> >  	     index++) {
> >  		struct v4l2_async_subdev *asd;
> >  
> > @@ -928,7 +911,12 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
> >  		}
> >  	}
> >  
> > -	return 0;
> > +	/* -ENOENT here means successful parsing */
> > +	if (ret != -ENOENT)
> > +		return ret;
> > +
> > +	/* Return -ENOENT if no references were found */
> > +	return index ?: -ENOENT;
> 
> The function now returns index on success, while it used to return 0. Is
> it intentional ?

No, I'll fix that for v2.

-- 
Regards,

Sakari Ailus
