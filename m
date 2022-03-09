Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 916414D2B6D
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 10:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbiCIJI5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 04:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbiCIJI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 04:08:57 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA64A149971
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 01:07:57 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id CFFA020039;
        Wed,  9 Mar 2022 11:07:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1646816874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=koTOr1pxKyYnK0tmD8eMvyG+mACJNxbibTLYa6DnYwg=;
        b=NNkkCf1tAAhdSon0mW1nPsdtF+tKFoc/qyIytbGI8uVzhZyIyHvnqhvkHah9nkSCmYcgIB
        9rpSl0gpnxzql14G02zYW8yb40a0sizp6TT146mKAL/Wpf1E81dYmJ+e1319a7FeCcL/VU
        e7jJSvqIPGUC5/1+2G5zbfBfcTPbx/g=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B4FDF634C90;
        Wed,  9 Mar 2022 11:07:52 +0200 (EET)
Date:   Wed, 9 Mar 2022 11:07:52 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 2/4] mc: Provide a helper for setting bus_info field
Message-ID: <YihuaE461VNSvfjV@valkosipuli.retiisi.eu>
References: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
 <20220128083309.213122-3-sakari.ailus@linux.intel.com>
 <YfQC9JfuhBxR3cXr@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfQC9JfuhBxR3cXr@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1646816874; a=rsa-sha256; cv=none;
        b=nHHHaeu5JzpCO6VcfJkToHKadX6da9eWKlcOSkfskZx/sPxvQDT/LD1wxrbrOe5VamCNoz
        LztF67RZ2HDu7wk2UhxhtQlKzOLmYbnv+2VV4fiRsOGfr+eGmwu4g9dA4UxfLSRXVGYsRR
        DiyYvSfjz4XYqgJxbZWh2GuFXiY6eo4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1646816874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=koTOr1pxKyYnK0tmD8eMvyG+mACJNxbibTLYa6DnYwg=;
        b=AB3GHfz9Jo9jA1eLYy0Q+6cU9PYCfTxUQwv5e3uzme/k6T4mrTS/4e4CZhAHtyp9ngPjqV
        3TYUr6edQB5xpF/+GVAJuEcr6kWNXF1uacGCF2NoisITJVW6jp1CR0b45+MrtzGiIEjoZ2
        pJcjcOAhg2P8QAuS3kpHMz53V2Agzys=
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

On Fri, Jan 28, 2022 at 04:51:32PM +0200, Laurent Pinchart wrote:
> > + * @bus_info:		Variable where to write the bus info (char array)
> > + * @bus_info_size:	Length of the bus_info
> > + * @dev:		Related struct device
> > + *
> > + * Sets bus information based on &dev. This is currently done for PCI and
> > + * platform devices. dev is required to be non-NULL for this to happen.
> 
> Are there drivers that set a NULL dev ?

There shouldn't be but when the function is called from the framework, it's
better to assume this could be the case.

-- 
Sakari Ailus
