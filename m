Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8093CA03C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 16:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730457AbfJCOX1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 10:23:27 -0400
Received: from retiisi.org.uk ([95.216.213.190]:42330 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728660AbfJCOX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 10:23:27 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id D5EA4634C87;
        Thu,  3 Oct 2019 17:22:53 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iG20K-0002Jr-5h; Thu, 03 Oct 2019 17:22:52 +0300
Date:   Thu, 3 Oct 2019 17:22:52 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH v3 2/3] media: i2c: Add IMX290 CMOS image sensor driver
Message-ID: <20191003142252.GI896@valkosipuli.retiisi.org.uk>
References: <20190830091943.22646-1-manivannan.sadhasivam@linaro.org>
 <20190830091943.22646-3-manivannan.sadhasivam@linaro.org>
 <20190923092209.GL5525@valkosipuli.retiisi.org.uk>
 <20191001184200.GA7739@Mani-XPS-13-9360>
 <20191002103715.GR896@valkosipuli.retiisi.org.uk>
 <20191003053338.GA7868@Mani-XPS-13-9360>
 <20191003071646.GZ896@valkosipuli.retiisi.org.uk>
 <3FAB5E91-9FD2-4052-881B-E4B18D44D33B@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3FAB5E91-9FD2-4052-881B-E4B18D44D33B@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan,

On Thu, Oct 03, 2019 at 12:56:48PM +0530, Manivannan Sadhasivam wrote:
> >> mentioned in the datasheet. I agree that we are missing the userspace
> >> granularity here but sticking to the device limitation shouldn't be a
> >problem.
> >> As I said, I'll add a comment here to clarify.
> >
> >The comment isn't visible in the uAPI.
> >
> 
> Yes. It would be good to have the units passed onto the userspace somehow
> like it is done in IIO. Then we don't need to fiddle in the driver for
> mismatch. Something consider in future...

Yes, I agree. But that is not trivial to do in any sort of even remotely
generic way.

-- 
Sakari Ailus
