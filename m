Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 243C52558E3
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 12:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbgH1Kur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 06:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728362AbgH1Kur (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 06:50:47 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D36C061264;
        Fri, 28 Aug 2020 03:50:46 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 19C78634C87;
        Fri, 28 Aug 2020 13:50:41 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kBbxx-0000N6-0o; Fri, 28 Aug 2020 13:50:41 +0300
Date:   Fri, 28 Aug 2020 13:50:41 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 3/4] media: docs: add glossary.rst with common terms
 used at V4L2 spec
Message-ID: <20200828105040.GA844@valkosipuli.retiisi.org.uk>
References: <cover.1598512802.git.mchehab+huawei@kernel.org>
 <a7a4d5ecce953710119e7aa0c5d55f97052a75e8.1598512802.git.mchehab+huawei@kernel.org>
 <20200827110811.GC851@valkosipuli.retiisi.org.uk>
 <20200828111100.669767fa@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828111100.669767fa@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Fri, Aug 28, 2020 at 11:11:00AM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 27 Aug 2020 14:08:11 +0300
> Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> 
> > > +    MC-centric
> > > +	:term:`V4L2 hardware` that requires a :term:`MC API`.
> > > +
> > > +	Such hardware have ``V4L2_CAP_IO_MC`` device_caps field set
> > > +	(see :ref:`VIDIOC_QUERYCAP`).
> > > +
> > > +	See :ref:`v4l2_hardware_control` for more details.  
> > 	
> > I think this should be documented as referring to drivers, for it's a
> > property of a driver, not hardware.
> > 
> > There is hardware that better fits for MC-enabled drivers but still has
> > V4L2-centric driver written for it. The matter is further complicated by
> > e.g. raw camera systems that may consist of several different kinds of
> > devices, including external ISPs.
> > 
> > Say, a simple raw sensor + a CSI-2 receiver would fit for V4L2-centric
> > model well, but add a more complex sensor or that external ISP and that no
> > longer is the case. The CSI-2 receiver is still the same in both cases
> > though.
> > 
> > Similar comment on video-node-centric.
> 
> I guess I got what you meant. I'm folding it with the following diff:
> 
> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> index 45f0933e03c0..023bb561c406 100644
> --- a/Documentation/userspace-api/media/glossary.rst
> +++ b/Documentation/userspace-api/media/glossary.rst
> @@ -138,9 +138,9 @@ Glossary
>  	See :ref:`media_controller`.
>  
>      MC-centric
> -	:term:`V4L2 hardware` that requires a :term:`MC API`.
> +	:term:`V4L2 hardware` device driver that requires :term:`MC API`.
>  
> -	Such hardware have ``V4L2_CAP_IO_MC`` device_caps field set
> +	Such drivers have ``V4L2_CAP_IO_MC`` device_caps field set
>  	(see :ref:`VIDIOC_QUERYCAP`).
>  
>  	See :ref:`v4l2_hardware_control` for more details.
> @@ -203,9 +203,9 @@ Glossary
>  	:term:`bridge driver`. See :ref:`subdev`.
>  
>      Video-node-centric
> -	V4L2 hardware that doesn't require a media controller to be used.
> +	V4L2 device driver that doesn't require a media controller to be used.
>  
> -	Such hardware have the ``V4L2_CAP_IO_MC`` device_caps field unset
> +	Such drivers have the ``V4L2_CAP_IO_MC`` device_caps field unset
>  	(see :ref:`VIDIOC_QUERYCAP`).
>  
>      V4L2 Sub-device API

Yes, something like that. I also looked at a few more terms such as "V4L2
hardware" that are a bit of an oxymoron. This isn't in current
documentation so we should give them a little bit more thought before
adding them. I'll reply to the latest patch.

-- 
Kind regards,

Sakari Ailus
