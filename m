Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510F7293F9C
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 17:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436476AbgJTPar (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 11:30:47 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:32930 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408719AbgJTPaq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 11:30:46 -0400
Received: by mail-oi1-f193.google.com with SMTP id s21so2588163oij.0;
        Tue, 20 Oct 2020 08:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lTM+9hz6tW4BGpuNuT8iqSrFMq9nK/6YOmBShSJ73gU=;
        b=b/R3ZQ/vtH3BZ6BqI8yLbnUhM/6kvvV+EQxq095FgoEmozcF5U6K6vgzeNKWtcBLqL
         itBx8R8XBXUBPpJp08bJ+JPVBnwsZsiIgQd0rl8EZVsAgW1jDHVTB3k/pn38CCzSXg5h
         VnH4vzfFBvs8uqgaSDrkTxEaNBXYh6QhWAhzTMKKEbG4bfYPkgebHDXrrDH4YtniyKEQ
         dLwFFX8CwTHU1JU/V+6xxO68vDrAQq6X49i8VG3C+aXLZSLPyA6qiWqbT8mfM9S+TNLo
         TmQ6jvu3mJ1V2kVbJCSLs8teENRI4pjrLfNBLZrIhtSXJtpC2yCLlwLFl8dIJ/AM9iqE
         ljnA==
X-Gm-Message-State: AOAM532GhC+DeeiKPjw2ScjTCC7EeiiC0X/O+GDMSUwxLVPVv4mhPWHi
        Nn+VAUuIptWMxIbAJzh4KznfbOLJaw==
X-Google-Smtp-Source: ABdhPJy5TTvRU4fhG6BxtFkUDybI3XOHTkA+T4Dechtcai7YZlJD3PuPvukKCzNoQb1EAU5X8Vcp3Q==
X-Received: by 2002:aca:f0c5:: with SMTP id o188mr1972885oih.95.1603207845797;
        Tue, 20 Oct 2020 08:30:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r80sm530114oor.31.2020.10.20.08.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 08:30:45 -0700 (PDT)
Received: (nullmailer pid 875674 invoked by uid 1000);
        Tue, 20 Oct 2020 15:30:44 -0000
Date:   Tue, 20 Oct 2020 10:30:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: imx7-mipi-csi2: convert bindings to
 yaml
Message-ID: <20201020153044.GA875273@bogus>
References: <20201020091921.1730003-1-rmfrfs@gmail.com>
 <20201020091921.1730003-4-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020091921.1730003-4-rmfrfs@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 20 Oct 2020 10:19:21 +0100, Rui Miguel Silva wrote:
> Convert imx7 mipi csi2 bindings documentation to yaml schema, remove
> the textual document and update MAINTAINERS entry.
> 
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> ---
>  .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 172 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 173 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

./Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml:91:21: [warning] wrong indentation: expected 22 but found 20 (indentation)
./Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml:93:21: [warning] wrong indentation: expected 22 but found 20 (indentation)


See https://patchwork.ozlabs.org/patch/1384742

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

