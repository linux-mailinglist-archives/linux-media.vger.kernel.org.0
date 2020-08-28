Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDC225572E
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 11:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbgH1JLG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 05:11:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:46184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728548AbgH1JLE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 05:11:04 -0400
Received: from coco.lan (unknown [95.90.213.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB8412071B;
        Fri, 28 Aug 2020 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598605864;
        bh=oKT/2svB4V5RCSSf/IhBWh7gWH9c49rsuRrm68MCF/c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=v2TKMF0FrQi1Mr6zXOxsLr8xXRGvLxZVKoed4jhkGhRVBTUBqDUgq5D7vv2XkuUVQ
         ZFslYFeaPfbxAlS7yuQ6LgXlIJPBC2yCdtsdOvaRcwcF1oYqSrwzGD6Zvi1D9cYcG8
         Mlxb66mdfU0NzakVvnLbFVoKyY2W0K6BBGa4OjUc=
Date:   Fri, 28 Aug 2020 11:11:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 3/4] media: docs: add glossary.rst with common terms
 used at V4L2 spec
Message-ID: <20200828111100.669767fa@coco.lan>
In-Reply-To: <20200827110811.GC851@valkosipuli.retiisi.org.uk>
References: <cover.1598512802.git.mchehab+huawei@kernel.org>
        <a7a4d5ecce953710119e7aa0c5d55f97052a75e8.1598512802.git.mchehab+huawei@kernel.org>
        <20200827110811.GC851@valkosipuli.retiisi.org.uk>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 27 Aug 2020 14:08:11 +0300
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> > +    MC-centric
> > +	:term:`V4L2 hardware` that requires a :term:`MC API`.
> > +
> > +	Such hardware have ``V4L2_CAP_IO_MC`` device_caps field set
> > +	(see :ref:`VIDIOC_QUERYCAP`).
> > +
> > +	See :ref:`v4l2_hardware_control` for more details.  
> 	
> I think this should be documented as referring to drivers, for it's a
> property of a driver, not hardware.
> 
> There is hardware that better fits for MC-enabled drivers but still has
> V4L2-centric driver written for it. The matter is further complicated by
> e.g. raw camera systems that may consist of several different kinds of
> devices, including external ISPs.
> 
> Say, a simple raw sensor + a CSI-2 receiver would fit for V4L2-centric
> model well, but add a more complex sensor or that external ISP and that no
> longer is the case. The CSI-2 receiver is still the same in both cases
> though.
> 
> Similar comment on video-node-centric.

I guess I got what you meant. I'm folding it with the following diff:

diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
index 45f0933e03c0..023bb561c406 100644
--- a/Documentation/userspace-api/media/glossary.rst
+++ b/Documentation/userspace-api/media/glossary.rst
@@ -138,9 +138,9 @@ Glossary
 	See :ref:`media_controller`.
 
     MC-centric
-	:term:`V4L2 hardware` that requires a :term:`MC API`.
+	:term:`V4L2 hardware` device driver that requires :term:`MC API`.
 
-	Such hardware have ``V4L2_CAP_IO_MC`` device_caps field set
+	Such drivers have ``V4L2_CAP_IO_MC`` device_caps field set
 	(see :ref:`VIDIOC_QUERYCAP`).
 
 	See :ref:`v4l2_hardware_control` for more details.
@@ -203,9 +203,9 @@ Glossary
 	:term:`bridge driver`. See :ref:`subdev`.
 
     Video-node-centric
-	V4L2 hardware that doesn't require a media controller to be used.
+	V4L2 device driver that doesn't require a media controller to be used.
 
-	Such hardware have the ``V4L2_CAP_IO_MC`` device_caps field unset
+	Such drivers have the ``V4L2_CAP_IO_MC`` device_caps field unset
 	(see :ref:`VIDIOC_QUERYCAP`).
 
     V4L2 Sub-device API


Thanks,
Mauro
