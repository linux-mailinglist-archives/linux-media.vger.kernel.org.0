Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26ECC1E4BA4
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 19:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731272AbgE0RPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 13:15:05 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:35477 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731265AbgE0RPD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 13:15:03 -0400
Received: by mail-il1-f196.google.com with SMTP id a14so24832550ilk.2;
        Wed, 27 May 2020 10:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cUzyV2ffMQiKR0ssWs7eyow7JR4Jl831ooktar0LQs8=;
        b=QgHA5BNG/I6hCqDTGqGvKRNS2bLKCnKlr/oDAoDmwrvbgK84LOjPgnMMkBc/nsgydf
         o4XvDPtiLmywIp7OsSKYkvRSqoFuF3LRBMEFZMpwd7RgXTNMvWGC5gom+UvEuhX/D0K7
         0DFCsS56fCkdII97OuekQGA4nYP5IE6RWGMNg9qh467w+lz9GzagGC0IdKJOn/XZik8c
         fJhoQgUv2CSeM20FH+XwNGc+hqpOokoCaa4JnoFXY/I90ahpEsDxJCMOmbfooH7JH22/
         ax6CfC4utXSr4B7+k+VBYnOTwvEa1G2eKRfIkKCWym2eoxgb1pg+KXwt3CnCcJgTk0rw
         JzlA==
X-Gm-Message-State: AOAM530IHlLlugXepexxuNZB1hjxdh5sLp4YFh+xVVQTUviEUi0nnrTa
        iOBxQ0ECIdI7iuX9uIGRpw==
X-Google-Smtp-Source: ABdhPJyMbZlW7pnwHQ6C5waz/unexLEaHdTcjFI8Zo6M8xBHeFoOJCORR1G1b9IprQ6sjolb1S7dSA==
X-Received: by 2002:a92:8c4c:: with SMTP id o73mr6482499ild.172.1590599701983;
        Wed, 27 May 2020 10:15:01 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c7sm1419991ioa.38.2020.05.27.10.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 10:15:00 -0700 (PDT)
Received: (nullmailer pid 2363073 invoked by uid 1000);
        Wed, 27 May 2020 17:14:59 -0000
Date:   Wed, 27 May 2020 11:14:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     laurent.pinchart@ideasonboard.com,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Michal Simek <michals@xilinx.com>,
        linux-kernel@vger.kernel.org, Dinesh Kumar <dineshk@xilinx.com>,
        mchehab@kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, hans.verkuil@cisco.com,
        Sandip Kothari <sandipk@xilinx.com>,
        linux-media@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>
Subject: Re: [PATCH v14 1/2] media: dt-bindings: media: xilinx: Add Xilinx
 MIPI CSI-2 Rx Subsystem
Message-ID: <20200527171459.GA2360474@bogus>
References: <1590587839-129558-1-git-send-email-vishal.sagar@xilinx.com>
 <1590587839-129558-2-git-send-email-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590587839-129558-2-git-send-email-vishal.sagar@xilinx.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 27 May 2020 19:27:18 +0530, Vishal Sagar wrote:
> Add bindings documentation for Xilinx MIPI CSI-2 Rx Subsystem.
> 
> The Xilinx MIPI CSI-2 Rx Subsystem consists of a CSI-2 Rx controller, a
> D-PHY in Rx mode and a Video Format Bridge.
> 
> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v14
> - Removed xlnx,csi-pxl-format from required properties
> - Added dependency of xlnx,csi-pxl-format on xlnx,vfb
> - End the yaml file with ...
> - Added Reviewed by Laurent
> 
> v13
> - Based on Laurent's suggestions
> - Fixed the datatypes values as minimum and maximum
> - condition added for en-vcx property
> 
> v12
> - Moved to yaml format
> - Update CSI-2 and D-PHY
> - Mention that bindings for D-PHY not here
> - reset -> video-reset
> 
> v11
> - Modify compatible string from 4.0 to 5.0
> 
> v10
> - No changes
> 
> v9
> - Fix xlnx,vfb description.
> - s/Optional/Required endpoint property.
> - Move data-lanes description from Ports to endpoint property section.
> 
> v8
> - Added reset-gpios optional property to assert video_aresetn
> 
> v7
> - Removed the control name from dt bindings
> - Updated the example dt node name to csi2rx
> 
> v6
> - Added "control" after V4L2_CID_XILINX_MIPICSISS_ACT_LANES as suggested by Luca
> - Added reviewed by Rob Herring
> 
> v5
> - Incorporated comments by Luca Cersoli
> - Removed DPHY clock from description and example
> - Removed bayer pattern from device tree MIPI CSI IP
>   doesn't deal with bayer pattern.
> 
> v4
> - Added reviewed by Hyun Kwon
> 
> v3
> - removed interrupt parent as suggested by Rob
> - removed dphy clock
> - moved vfb to optional properties
> - Added required and optional port properties section
> - Added endpoint property section
> 
> v2
> - updated the compatible string to latest version supported
> - removed DPHY related parameters
> - added CSI v2.0 related property (including VCX for supporting upto 16
>   virtual channels).
> - modified csi-pxl-format from string to unsigned int type where the value
>   is as per the CSI specification
> - Defined port 0 and port 1 as sink and source ports.
> - Removed max-lanes property as suggested by Rob and Sakari
> 
>  .../bindings/media/xilinx/xlnx,csi2rxss.yaml       | 237 +++++++++++++++++++++
>  1 file changed, 237 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml: allOf:0:if: None is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml: allOf:1:if: None is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml: allOf:0: 'required' is not one of ['$ref', 'if', 'then', 'else']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml: allOf:1: 'not' is not one of ['$ref', 'if', 'then', 'else']
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml: ignoring, error in schema: allOf: 0: if
warning: no schema found in file: ./Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml: ignoring, error in schema: allOf: 0: if
warning: no schema found in file: ./Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1298945

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

