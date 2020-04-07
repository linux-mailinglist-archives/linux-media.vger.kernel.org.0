Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1FFB1A0D2F
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 14:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgDGMBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 08:01:20 -0400
Received: from retiisi.org.uk ([95.216.213.190]:49758 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726562AbgDGMBU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Apr 2020 08:01:20 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 92C83634C89;
        Tue,  7 Apr 2020 15:00:11 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jLmtm-0002LB-Mo; Tue, 07 Apr 2020 15:00:10 +0300
Date:   Tue, 7 Apr 2020 15:00:10 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
Subject: Re: imx6: Cannot register mem2mem
Message-ID: <20200407120010.GI6127@valkosipuli.retiisi.org.uk>
References: <CAOMZO5BQEHA-+pMmKzQj8kteNgMACYP==ezFdz_oYhJYFWKXSw@mail.gmail.com>
 <CAOMZO5CUf5aqaqzTJDjQa1scK1vKQR5YJb40a+TET7dzVRJDLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5CUf5aqaqzTJDjQa1scK1vKQR5YJb40a+TET7dzVRJDLQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 06, 2020 at 11:41:33AM -0300, Fabio Estevam wrote:
> On Mon, Apr 6, 2020 at 10:37 AM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi,
> >
> > I am running kernel 5.6.2 on an imx6qp sabresd, but I cannot get the
> > mem2mem element from imx-media-csc-scaler.c to probe.
> >
> > I don't see imx6_media_probe_complete() getting called, hence
> > imx_media_csc_scaler_device_init() is never called and no mem2mem
> > element is registered.
> >
> > Any ideas as to how to get mem2mem registered on i.MX6?
> 
> It seems that v4l2_async_notifier_can_complete() is always false, so
> v4l2_async_notifier_call_complete() is never called.
> 
> If I change it like this:
> 
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -213,10 +213,6 @@ v4l2_async_notifier_try_complete(struct
> v4l2_async_notifier *notifier)
>         if (!notifier->v4l2_dev)
>                 return 0;
> 
> -       /* Is everything ready? */
> -       if (!v4l2_async_notifier_can_complete(notifier))
> -               return 0;
> -
>         return v4l2_async_notifier_call_complete(notifier);
>  }
> 
> Then the mem2mem driver can be successfully probed:
> 
> [    4.601350] imx-media: Registered ipu_ic_pp csc/scaler as /dev/video11
> 
> Any suggestions?

There are basically async sub-devices that haven't been yet bound in the
notifier. Once they are, then the device registration will continue.

-- 
Sakari Ailus
