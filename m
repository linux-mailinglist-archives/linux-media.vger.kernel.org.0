Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3098514DAF4
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 13:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgA3Msg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 07:48:36 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60884 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbgA3Msf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 07:48:35 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00UCm9e4018783;
        Thu, 30 Jan 2020 06:48:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580388489;
        bh=ohXezGUeOwPmmMG6w7oRgeMg5xo4E+tDRu+qQJ7nJRE=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=ZDWxU5s0wuaZRjIM9RrrhuiH9nvpL8cM5Zc1DXdTXnJc07thmXIDfb6qsOKmnMX9U
         NL2TgC2iWmiZIrJ8Hk6Y6j1CM4cl+72Vs+F7wTqXVZnQN+nGqVG0iWDPid78VaJv2c
         KQGSMpmBkCgkbLaJkxbuZ2jdAuwKco6oz8jUfr/k=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00UCm8t0105006
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 Jan 2020 06:48:09 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 30
 Jan 2020 06:48:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 30 Jan 2020 06:48:08 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 00UCm8Yq078274;
        Thu, 30 Jan 2020 06:48:08 -0600
Date:   Thu, 30 Jan 2020 06:52:15 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/1] MAINTAINERS: Fix ti-vpe binding file line
Message-ID: <20200130125215.z4ei2uuysazjtkck@ti.com>
References: <20200130083156.10959-1-sakari.ailus@linux.intel.com>
 <20200130114720.GA8280@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200130114720.GA8280@valkosipuli.retiisi.org.uk>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@iki.fi> wrote on Thu [2020-Jan-30 13:47:20 +0200]:
> On Thu, Jan 30, 2020 at 10:31:56AM +0200, Sakari Ailus wrote:
> > Add "F:" prefix to the ti,cal.yaml line to tell it's a file.
> > 
> 
> There should have been one more line here:
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Isn't this change also included in Andriy's patch?

Anyhow,

Acked-by: Benoit Parrot <bparrot@ti.com>

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index da05666e9ade..02e5aad82c94 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16584,7 +16584,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
> >  S:	Maintained
> >  F:	drivers/media/platform/ti-vpe/
> >  F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
> > -	Documentation/devicetree/bindings/media/ti,cal.yaml
> > +F:	Documentation/devicetree/bindings/media/ti,cal.yaml
> >  
> >  TI WILINK WIRELESS DRIVERS
> >  L:	linux-wireless@vger.kernel.org
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Sakari Ailus
