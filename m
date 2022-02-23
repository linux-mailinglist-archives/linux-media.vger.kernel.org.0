Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5294C12CA
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 13:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236383AbiBWMep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 07:34:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbiBWMeo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 07:34:44 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5AD8AE46
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 04:34:16 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id E91BD2005D;
        Wed, 23 Feb 2022 14:34:13 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1645619654;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=conzbgK/Jhn3y+1dPQpC3DaIL0/2+DY+t1rUF8j85Hw=;
        b=bfUCM7QR/CPT7kH+MjLOsMX+W7xEJj0jRN1nLQdwkFL6tbdw8SjAd5+Pq3Y0GDIV61Uw64
        oDNvZPh7OVx/6SZ18Lw23OQFOdoAUs00JAxJHYsd2Gev6i2SoVPEnr76NuAC0eAImKYVCv
        fU3g3Xbfq/BDiCyrFF4kq7f/q/cGmog=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 78526634C90;
        Wed, 23 Feb 2022 14:34:13 +0200 (EET)
Date:   Wed, 23 Feb 2022 14:34:13 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] v4l: fwnode: Remove now-redundant loop from
 v4l2_fwnode_parse_reference()
Message-ID: <YhYpxf5Ptc70PqnJ@valkosipuli.retiisi.eu>
References: <20220223115434.21316-1-sakari.ailus@linux.intel.com>
 <20220223115434.21316-3-sakari.ailus@linux.intel.com>
 <YhYnAVdGkbyRZp5A@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhYnAVdGkbyRZp5A@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1645619654; a=rsa-sha256; cv=none;
        b=mLg9AbLBXWtD8dyprwQBE13hIVnQedpMLFHkNPyiGAt3aBFOWdsEY1DZObrahy5hZGgZtJ
        BucM/PqUMDiKaI4spRP0n/kdXvNnSeRfp75WEK39jh/JAO3Tpe6iM6mabSURpooZjduBoQ
        R++lXNoON+Zy+RGRs+V32t30QW+QzNM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1645619654;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=conzbgK/Jhn3y+1dPQpC3DaIL0/2+DY+t1rUF8j85Hw=;
        b=OoA7YjiAv7kcsF0p5tD1+PNW30wQ5RC2KqKY7cGohsY+ZF3I5K5YujVfIYAIz5nvfJcKnK
        oxDfNDaROBqNgk/BT4+LDhP4UeXZqZxzAjo/szyjRVqcvn0QxTROQOAbdS5H6NStEeNhuE
        fPNz8H6m6hoJrhP+tny6ZQKpFxOjkok=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 23, 2022 at 02:22:25PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Feb 23, 2022 at 01:54:34PM +0200, Sakari Ailus wrote:
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
> This paragraph should be dropped.
> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for the review.

I'll drop it when applying.

-- 
Sakari Ailus
