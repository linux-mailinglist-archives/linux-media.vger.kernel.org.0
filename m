Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A65E86D53CC
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 23:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbjDCVoE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 17:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233433AbjDCVn5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 17:43:57 -0400
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F44D5279;
        Mon,  3 Apr 2023 14:43:31 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id k14-20020a9d700e000000b0069faa923e7eso16398698otj.10;
        Mon, 03 Apr 2023 14:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680558172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozoPGH6UUTmS9OJOxIr/uDMOzdo8tvLVnG/ILpSv2TI=;
        b=Esl8KBMU5x8StRICxLQJqygpjNUHJYGNPijtM2+aQNqFKEeb8uGRFW4krtdj0ZSMWO
         2Pe5zj2tHwY+relwvidTowvf9pmgbwcqilrs0zPPIekVHDArp2lYPh3/fwgMat1lMff6
         sc0TO1unnwIDS/nEvzIHCq8Uk/MmLG0acl2uBMVn7RfpQrSAIqLfRnlsDqBC8GmhBWiU
         +gYIAV1FS/jRmZj3FTf3LvgMlaWcr7adWOP8xL7eR4LTotlXnIFIiB1NO1YFNUqZkcAw
         BZwYBIitHTYemFGp4q90Q8fVkiXS+O4QhONzqpS2/6jq3llP2pbMn1J4itf8DAW9/xXk
         RoGA==
X-Gm-Message-State: AAQBX9djS15B/go2hKkD2zfdiJmuFBZGS7D0LDKf5TKMMDmBZQFe+Z0n
        9sfVkM7em43uGQ+2ZlQ4Jd+lLtNyPw==
X-Google-Smtp-Source: AKy350YBqo5oq1b1bY00F+CKc0rpbl2RxO4+m3EzdQxajmKEsFgXw5gc3HQ6zSNo6cm5aAdHFhxXxw==
X-Received: by 2002:a05:6830:128c:b0:69a:4b77:ff6c with SMTP id z12-20020a056830128c00b0069a4b77ff6cmr304853otp.8.1680558172666;
        Mon, 03 Apr 2023 14:42:52 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j19-20020a9d7f13000000b006a13dd5c8a2sm4754298otq.5.2023.04.03.14.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 14:42:52 -0700 (PDT)
Received: (nullmailer pid 1924737 invoked by uid 1000);
        Mon, 03 Apr 2023 21:42:51 -0000
Date:   Mon, 3 Apr 2023 16:42:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: dt-bindings: ov8856: Assign maintainership to
 myself
Message-ID: <168055817144.1924674.5183277781156311625.robh@kernel.org>
References: <20230331092957.3272621-1-sakari.ailus@linux.intel.com>
 <20230331092957.3272621-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331092957.3272621-3-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Fri, 31 Mar 2023 12:29:57 +0300, Sakari Ailus wrote:
> Dongchun's e-mail mailbox is no longer available, assign the
> maintainership to myself.
> 
> 	The following message to <dongchun.zhu@mediatek.com> was
> 	undeliverable. The reason for the problem: 5.1.0 - Unknown address
> 	error 550-'Relaying mail to dongchun.zhu@mediatek.com is not
> 	allowed'
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

