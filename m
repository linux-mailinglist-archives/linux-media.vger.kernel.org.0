Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 820654B29B1
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 17:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350420AbiBKQIK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 11:08:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350409AbiBKQIJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 11:08:09 -0500
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031B49E;
        Fri, 11 Feb 2022 08:08:08 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id u13so10035900oie.5;
        Fri, 11 Feb 2022 08:08:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V8el3mxYioDZoAtVizyHdZhl6hxj1WU4kNt7wMykHlg=;
        b=TJn6VRqtotbwBjFz3p5AhDYNWuuRPCfWkoXE5FDWpwXar9YhD8Sf201/sKcq65/a3O
         pAFdFJAfqSlH2sqo9OzCRsWcDgoabb26vWbOnpKT3fsxzJqwUrKQQ0ebkyocGOCz4j3G
         YOucsonJlDG+Az3/RmtLvtdcfpdwBrjEcOv5mKDSH+5I6nj4DKH7WAzyhhZCWW+Gbz8M
         j4TXKS1DdWte0yTEkMmT39yGj1zx1LabDPO2FNTUYvrMAXmcbgxunUc4lCFYOn1LW8Ci
         tn6O5WjOjXdFjs2Pkgl+D/5WMZfBVbukPjt3VD8YWqo6MktE4ucBiqg/MxDst4LUCbDr
         iSBw==
X-Gm-Message-State: AOAM533mN4rRmbscOZCuE9bIp9ixtICNVdaGtvKf3w0OOw9Drwkh/eGi
        91DbxBUT9TF5VMnIsFsGiA==
X-Google-Smtp-Source: ABdhPJxUXZVo55sfw93Hu9i/AwU6jlwo2iKUh/rlAshOPmUKLaqffSG4Xoufw1NrWKNBSGBlXOXXag==
X-Received: by 2002:a05:6808:1588:: with SMTP id t8mr511992oiw.28.1644595687210;
        Fri, 11 Feb 2022 08:08:07 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fee:dfce:b6df:c3e1:b1e5:d6d8])
        by smtp.gmail.com with ESMTPSA id q3sm9415961oom.9.2022.02.11.08.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 08:08:06 -0800 (PST)
Received: (nullmailer pid 441751 invoked by uid 1000);
        Fri, 11 Feb 2022 16:08:04 -0000
Date:   Fri, 11 Feb 2022 10:08:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: media: i2c: Add MT9M114
 camera sensor binding
Message-ID: <YgaJ5DJzpcQHwHxH@robh.at.kernel.org>
References: <20220207012055.15158-1-laurent.pinchart@ideasonboard.com>
 <20220207012055.15158-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207012055.15158-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 07 Feb 2022 03:20:54 +0200, Laurent Pinchart wrote:
> Add device tree binding for the onsemi MT9M114 CMOS camera sensor.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Use graph schema
> - Drop unneeded properties
> - Rename ON Semiconductor to onsemi
> ---
>  .../bindings/media/i2c/onnn,mt9m114.yaml      | 110 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
