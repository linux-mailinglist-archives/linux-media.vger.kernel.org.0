Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A553640683
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 13:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbiLBMOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 07:14:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbiLBMOu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 07:14:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB530B7DFA;
        Fri,  2 Dec 2022 04:14:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FFCC2D8;
        Fri,  2 Dec 2022 13:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669983287;
        bh=A+0FuOmM7GtCKipScJv5FuHgyfcXtF5e6ELHsHVfAl8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lHDMN9ABvHehzyJxtpzKjZ614aP3+GY8eXwA4oezs2TZ3CgTjfYujIl12h32OS6ld
         Ud3D61MDQVO4Q4+L0gJa3l4h39wDQEg8gdfIRC0tiG6mjhG0YZaJSkZ98Cg9eW4iYO
         6dz1ZRkiHbT4Av2bqM0NpCXpRnhnM/6Nzdbc6IaI=
Date:   Fri, 2 Dec 2022 14:14:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Message-ID: <Y4nsNp4RSVZwI98H@pendragon.ideasonboard.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
 <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
 <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
 <fef2a014-1ef9-049a-2516-539ea14abdac@redhat.com>
 <Y4nZUpGvtKMpxrDR@pendragon.ideasonboard.com>
 <29b30a50-0fc1-e185-c79b-10856a80bceb@redhat.com>
 <Y4nmZND8Mm89X0Y/@pendragon.ideasonboard.com>
 <CAHp75VeN_2TNQfSAji+QN_EpgtVrm2Lxw50mAQkdnLeQPmsp5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHp75VeN_2TNQfSAji+QN_EpgtVrm2Lxw50mAQkdnLeQPmsp5A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 02, 2022 at 01:53:55PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 2, 2022 at 1:50 PM Laurent Pinchart wrote:
> > On Fri, Dec 02, 2022 at 12:21:12PM +0100, Hans de Goede wrote:
> > > On 12/2/22 11:54, Laurent Pinchart wrote:
> 
> ...
> 
> > > Note the need for an index -> name map is standard for all GPIOs
> > > on ACPI platforms.
> >
> > It's funny how ARM platforms were criticized for their need of board
> > files, with x86/ACPI being revered as a saint. Now we have DT on ARM and
> > x86 needs board files :-)
> 
> I believe it's a misunderstanding here due to missing words at Hans'
> statement, i..e.
> "..., which do not provide the descriptions in _DSD() method."
> 
> So, no, x86 does not need board files generally speaking. The problem
> here is some departments of some big companies that didn't get ACPI
> properly or at all.

When it comes to camera support, that seems to cover an overwhelming
majority of systems, if not all of them.

-- 
Regards,

Laurent Pinchart
