Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75167F21D9
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 23:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732887AbfKFWhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 17:37:12 -0500
Received: from retiisi.org.uk ([95.216.213.190]:35292 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732841AbfKFWhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 17:37:01 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 36B3A634C87;
        Thu,  7 Nov 2019 00:35:42 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iSTtt-0002Zq-8S; Thu, 07 Nov 2019 00:35:41 +0200
Date:   Thu, 7 Nov 2019 00:35:41 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v2 20/20] MAINTAINERS: Add ti,cal.yaml
Message-ID: <20191106223541.GG6253@valkosipuli.retiisi.org.uk>
References: <20191104193140.31145-1-bparrot@ti.com>
 <20191104193140.31145-21-bparrot@ti.com>
 <20191106091022.GE6253@valkosipuli.retiisi.org.uk>
 <20191106210121.vznx7kzs34wp3iwz@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106210121.vznx7kzs34wp3iwz@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 06, 2019 at 03:01:21PM -0600, Benoit Parrot wrote:
> Sakari Ailus <sakari.ailus@iki.fi> wrote on Wed [2019-Nov-06 11:10:22 +0200]:
> > On Mon, Nov 04, 2019 at 01:31:40PM -0600, Benoit Parrot wrote:
> > > Add ti,cal.yaml to the MAINTAINERS file.
> > > 
> > > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > > ---
> > >  MAINTAINERS | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8077b453f2e9..d360df48f9f2 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -16315,6 +16315,7 @@ W:	http://linuxtv.org/
> > >  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
> > >  S:	Maintained
> > >  F:	drivers/media/platform/ti-vpe/
> > > +F:	Documentation/devicetree/bindings/media/ti,cal.yaml
> > 
> > This should be done no later than adding the file itself.
> 
> Ah, but in v1 comment, Hans asked for a separate patch here.
> I can do it either way.

A separate patch is fine, but please arrange it before the added file.

-- 
Sakari Ailus
