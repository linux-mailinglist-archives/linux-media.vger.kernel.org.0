Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2B9563B06
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 22:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232212AbiGAUSe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 16:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbiGAUSe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 16:18:34 -0400
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B27B33E2A;
        Fri,  1 Jul 2022 13:18:32 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id 9so2080715ill.5;
        Fri, 01 Jul 2022 13:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fgJRz1NWGx56o1D31onhsKXBJtBCYQvphds1/6lixkg=;
        b=gFQO31Fa0P7W7HvoWPuZKVEvfAXRXtM00Nr2NcVqxljg1c75biCOY1MGkUBFRXbaHo
         IHQ59HECPRz1fZPK/qYBXEks3fJ7qAyBMwPJOAEXDHowbeXoTpEZ52dLq7QxT3iFBQhb
         tYZMpSj0Q3xYwvFVAQM/GioVyP+dLN5L8SBXlmyvfexnR+5dxmB7ClW/fXBhbjF7CD0P
         NAxMRWFOzLvPrZQxyPyvA/1fK+BpaJrKtQoInRLe8JBXNG0cyA6cbTu50cCuLbF4jfmS
         csTLfU2Je2CIhthFz1LNyVXhJiajh5+HGgSiPL6pWlZpSfgbNqrmrcl0BX8mbkWolcTz
         p9Lg==
X-Gm-Message-State: AJIora8z1qeG3nSCqglEWhN3lciYWnmP7X3bNEFrL3gHCluFAcHTJJQm
        UtPJYDtvsTuv7tflO2neew==
X-Google-Smtp-Source: AGRyM1uh15OM+q3H+mIrU1n/uWhQ5oAnU3YldNQptvqIo3QAEyYjZ6SOn6ye0wCkLtFgulxefcuMuw==
X-Received: by 2002:a05:6e02:507:b0:2da:580e:4d6a with SMTP id d7-20020a056e02050700b002da580e4d6amr9314977ils.88.1656706711426;
        Fri, 01 Jul 2022 13:18:31 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e39-20020a022127000000b0032e49fcc241sm10150653jaa.176.2022.07.01.13.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 13:18:31 -0700 (PDT)
Received: (nullmailer pid 1451537 invoked by uid 1000);
        Fri, 01 Jul 2022 20:18:29 -0000
Date:   Fri, 1 Jul 2022 14:18:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Helen Koike <helen.koike@collabora.com>,
        devicetree@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 47/55] dt-bindings: media: rkisp1: Add i.MX8MP ISP to
 compatible
Message-ID: <20220701201829.GA1451503-robh@kernel.org>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-48-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-48-laurent.pinchart@ideasonboard.com>
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

On Fri, 01 Jul 2022 02:07:05 +0300, Laurent Pinchart wrote:
> From: Paul Elder <paul.elder@ideasonboard.com>
> 
> The i.MX8MP ISP is compatbile with the rkisp1 driver. Add it to the list
> of compatible strings. While at it, expand on the description of the
> clocks to make it clear which clock in the i.MX8MP ISP they map to,
> based on the names from the datasheet (which are confusing).
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip-isp1.yaml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
