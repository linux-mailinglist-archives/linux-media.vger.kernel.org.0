Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC775625BD
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 23:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235225AbiF3V5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 17:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237214AbiF3V5G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 17:57:06 -0400
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 624CB564FB;
        Thu, 30 Jun 2022 14:57:05 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id o4so256678ilm.9;
        Thu, 30 Jun 2022 14:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kJarQdqng1vcpxAznj9a5rS/e1NlQpFJ9eY7hbF2Qik=;
        b=cWvxB83RY8LPrk3rBAMv+elJKDSz5nzC1U/wjUYspA7okJOOYq/x+XqfTaMaWyXc3d
         tKqN/mXIDsWCqfL+6enmXR7fYfc6/ZfSeRzH+JrqZvToUU2ENajkFzd9k3YzYb/5feSS
         nz+dRkOUsU/O4DDffhU/wsVib7zj27Sd5TjWyrzQuxcsXBs1sUac2g19GhV9MVbrTn8n
         9ow10gofn1OvpLt8OE51c4+zEOnI+/J7OjCdGbqTTAIa6fFhlGt77XmQd+l5zFITUSSU
         Bc8PIFKT5OQ9OAIqD21Xw1hZwZ6WYjTEu7pyc3dYA1Vf8iDlo3OqRSS6iSbU+87pjuFY
         aHYw==
X-Gm-Message-State: AJIora//RiaRkGBrPmS3LZE1pM/Ukc6IVC3hfC+cP2W2TrtOXaarW4pQ
        0o1miL0Nc+AXOR3v46W9a36SUAkv4Q==
X-Google-Smtp-Source: AGRyM1vn+QRrLkZzx5AuDq2rWvuw0w8YaAM4uHo+C3idQcPDC0h7DivLPWyR3Ms0YsHmeAS8b/Dzvg==
X-Received: by 2002:a92:d10a:0:b0:2d9:1332:d339 with SMTP id a10-20020a92d10a000000b002d91332d339mr6710946ilb.110.1656626224585;
        Thu, 30 Jun 2022 14:57:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z8-20020a056638214800b00339ca811ed3sm9082661jaj.8.2022.06.30.14.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 14:57:04 -0700 (PDT)
Received: (nullmailer pid 3387350 invoked by uid 1000);
        Thu, 30 Jun 2022 21:57:02 -0000
Date:   Thu, 30 Jun 2022 15:57:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     hverkuil-cisco@xs4all.nl, stanimir.varbanov@linaro.org,
        alexander.stein@ew.tq-group.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v6 12/14] media: dt-bindings: media: Add i.MX8MP DW100
 binding
Message-ID: <20220630215702.GA3387290-robh@kernel.org>
References: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
 <20220623143115.3185297-13-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623143115.3185297-13-xavier.roumegue@oss.nxp.com>
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

On Thu, 23 Jun 2022 16:31:13 +0200, Xavier Roumegue wrote:
> Add DT binding documentation for the Vivante DW100 dewarper engine found
> on NXP i.MX8MP SoC
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/nxp,dw100.yaml  | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
