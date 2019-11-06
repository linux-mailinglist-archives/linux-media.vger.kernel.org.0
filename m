Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79BB6F203B
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 21:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732001AbfKFU6q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 15:58:46 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33746 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfKFU6q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 15:58:46 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6KwKmE060697;
        Wed, 6 Nov 2019 14:58:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573073900;
        bh=mBC/+FLqkSpR985gckUOWIid1xyhiufPVnE2aHrC3aU=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=nd2xOzHS15TaG3rE+XZcirJwdBZtcCi7yVlMIOxcxZeSts3P66J6v/1E/eDaKNvTs
         FhIpNLM6kQCrtMtMKCqA3sg4VbuKXCFRiS1xIYvYuIy7aSQROHswRoru+yumoBS/LI
         R6bNusPubsYE0Ttk0R00PfC3u7P0g6oOByaa65tw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA6KwKQ6070907
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Nov 2019 14:58:20 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 14:58:05 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 14:58:05 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id xA6KwK8r007215;
        Wed, 6 Nov 2019 14:58:20 -0600
Date:   Wed, 6 Nov 2019 15:01:21 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v2 20/20] MAINTAINERS: Add ti,cal.yaml
Message-ID: <20191106210121.vznx7kzs34wp3iwz@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
 <20191104193140.31145-21-bparrot@ti.com>
 <20191106091022.GE6253@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191106091022.GE6253@valkosipuli.retiisi.org.uk>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@iki.fi> wrote on Wed [2019-Nov-06 11:10:22 +0200]:
> On Mon, Nov 04, 2019 at 01:31:40PM -0600, Benoit Parrot wrote:
> > Add ti,cal.yaml to the MAINTAINERS file.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8077b453f2e9..d360df48f9f2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16315,6 +16315,7 @@ W:	http://linuxtv.org/
> >  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
> >  S:	Maintained
> >  F:	drivers/media/platform/ti-vpe/
> > +F:	Documentation/devicetree/bindings/media/ti,cal.yaml
> 
> This should be done no later than adding the file itself.

Ah, but in v1 comment, Hans asked for a separate patch here.
I can do it either way.

> 
> -- 
> Sakari Ailus
