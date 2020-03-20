Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C21E518C479
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 02:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgCTBD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 21:03:57 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34892 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgCTBD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 21:03:57 -0400
Received: by mail-io1-f67.google.com with SMTP id h8so4395274iob.2;
        Thu, 19 Mar 2020 18:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E7UOdCgi//17WBwa+bRiBT2apc8kL8w/dAZ2MLHQRPo=;
        b=Tw8bbH0KIMpONH9qLQEpESd5Y8b+rzTuINu7n1/yW3O/7mmgreRLO+3MnIMLa0Ez3v
         c91+qPw5lgS4efXkLmufk2v+2bmQ927xL2fOqx+NFOSpV9ctoj43DsLZAaQ/FmbnYTUk
         YQR8u9J2va1eOUUcxJOlhbcatmfW4WGTorfVYkFClFt143OXUuXrQXR5Z3riH6crAnzD
         mclkR7rcG+D5+t6UWkPHeSDu+sievsSe2Pk3SX/nr+As83xGNOMWqNGX/fh6ih5inyf2
         p6sYVWfZPODw0ss7cDS3o2n85fjBKfxWkrdqQ5BN/EKY5+fIbtpYqY+f1kqpy0XwESHv
         W+VQ==
X-Gm-Message-State: ANhLgQ3NiXFGR6wONJZUOw1tGk3AUnyUEyhCLlqRBphVqm3cNEvCq6qg
        sitqBCELImv5GoRiYGPCIg==
X-Google-Smtp-Source: ADFU+vumZwagvJmUaA3ur0o9qsDUACrx7gz4DIqXjdXxxX3qvg0Sx0/QtMY13Vwe/rFQbUzLAseXPw==
X-Received: by 2002:a02:1d44:: with SMTP id 65mr6028441jaj.6.1584666236192;
        Thu, 19 Mar 2020 18:03:56 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h29sm1480814ili.19.2020.03.19.18.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 18:03:55 -0700 (PDT)
Received: (nullmailer pid 21911 invoked by uid 1000);
        Fri, 20 Mar 2020 01:03:52 -0000
Date:   Thu, 19 Mar 2020 19:03:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz, Jacopo Mondi <jacopo@jmondi.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        robh@kernel.org, devicetree@vger.kernel.org,
        Niklas Soderlund <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v7 03/11] dt-bindings: video-interface: Replace
 'rotation' description
Message-ID: <20200320010352.GA21844@bogus>
References: <20200318205034.949531-1-jacopo@jmondi.org>
 <20200318205034.949531-4-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318205034.949531-4-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 18 Mar 2020 21:50:26 +0100, Jacopo Mondi wrote:
> Replace the 'rotation' property description by providing a definition
> relative to the camera sensor pixel array coordinate system and the
> captured scene.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Co-developed-by: Niklas Soderlund <niklas.soderlund@ragnatech.se>
> 
> ---
>  .../bindings/media/video-interfaces.txt       | 359 +++++++++++++++++-
>  1 file changed, 356 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
