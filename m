Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A06942FDDF
	for <lists+linux-media@lfdr.de>; Sat, 16 Oct 2021 00:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243265AbhJOWJ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 18:09:58 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:42938 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243251AbhJOWJ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 18:09:58 -0400
Received: by mail-ot1-f44.google.com with SMTP id l24-20020a9d1c98000000b00552a5c6b23cso14671264ota.9;
        Fri, 15 Oct 2021 15:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rzK6A3z8OFIcs/1n/hb2OLqf6EldIVkV7PlZ7MDPje8=;
        b=WTdzfHxSc/JXyzGT19x6+/2dDdF+1dGUnx3xBW3607BsascT/hXEb+WhRe/56jxCII
         wId0WQCyHFhJGSFAHWO083nzK/qRkpd/TiX5/6hZBHsBJP5jzfXZRkeso/dCI/lxVRRm
         zLFHnhyfdZJxH8U/fz9R7NZLeR+GP/JlZ1Cco8UCnMvr21/asfihKF3pmz9OQbVi1ans
         +02cLUEY0CAn28ym9aHDa967biXhRUyhyvvZX29Be9yayBRb0HLySoAX+Zg19TWLhCO/
         5jYZO15Or5Upjn5UiwdiytqGWd/dkbPy0hxgwLbGkXOpFs3xGk1mYTlyi/UwKoJ4fUtv
         xUng==
X-Gm-Message-State: AOAM531+5/ndHT/OrNV5bg/ydfBhhTo74b+gFT0ShvEi1/5LE7OYJACH
        Q0k3JVqdDwLwCMl69dPF/Q==
X-Google-Smtp-Source: ABdhPJylKNewbI/pvdMVolRcE/RXozn2cQhzYOSJrrR6IvZLyuAuiGnf/Cqefli8Z9Ebj5H8Aoa9iQ==
X-Received: by 2002:a9d:5a85:: with SMTP id w5mr10293943oth.73.1634335670677;
        Fri, 15 Oct 2021 15:07:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r4sm1517697oiw.36.2021.10.15.15.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:07:50 -0700 (PDT)
Received: (nullmailer pid 2289357 invoked by uid 1000);
        Fri, 15 Oct 2021 22:07:49 -0000
Date:   Fri, 15 Oct 2021 17:07:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: media: Convert OV5640 binding to a schema
Message-ID: <YWn7tW6v6aooogJO@robh.at.kernel.org>
References: <20211015072830.8580-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015072830.8580-1-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 15 Oct 2021 09:28:30 +0200, Maxime Ripard wrote:
> The Omnivision OV5640 is supported by Linux thanks to its device tree
> binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: linux-media@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Steve Longerbeam <slongerbeam@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v2:
>   - Fix whitespace error
>   - Changed schema referenced for the port validation
> ---
>  .../devicetree/bindings/media/i2c/ov5640.txt  |  92 -----------
>  .../bindings/media/i2c/ovti,ov5640.yaml       | 154 ++++++++++++++++++
>  2 files changed, 154 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> 

Applied, thanks!
