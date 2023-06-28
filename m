Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB6D2741565
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 17:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbjF1PhO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 11:37:14 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:58539 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbjF1Pfy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 11:35:54 -0400
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-78374596182so2040239f.0;
        Wed, 28 Jun 2023 08:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687966554; x=1690558554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aj/dP/iA9N/9zRf2lgc80xa2tXQWhh8hR1OIYJdG3Z0=;
        b=NwMCkxvEex95HMbJ3J4qL+1sZj/YB6lMi4BNrrCc1EneDCROFSZk2HP3jYfrPQWR5Z
         QCt7RFPLEJVVs8AjeYZNAyj012w65itoEd4eoFwHEfSCLFTj061jGpcAV0S2w3Khn2Qw
         sREZaBw7IXOwi6kbhjQzSvdtUB00UzPUeQV6nmQ4fcPaawHHtS6vpXVoVtRKkoE4QaVA
         wJb5B6WFc7b6XDpm4xWNXak56Jb1pyReoraDrOO2LlkvgufHHS2LvA3pz1YNGDOJ40rO
         ouz1VNXUpM+h//njlodQ2KYNl6mstc1h/q/IiKW11WGDDurm2hol4eedy9wQoUY7Naj2
         B5eQ==
X-Gm-Message-State: AC+VfDzOiRsCGctmLv52u6HwzJkSxKXXcdO40mmJhAxCLGCRYTkkNvFO
        Fa+dGmprAG97MLYtL+xcQQ==
X-Google-Smtp-Source: ACHHUZ6wYXTPSGkovpHQBFBVWhFsjuK3E7LHjssU5+iRcLB7AXagZ7Pg4kjIUPcQm2jbpXnUjlLRgA==
X-Received: by 2002:a6b:db16:0:b0:783:6906:a32c with SMTP id t22-20020a6bdb16000000b007836906a32cmr7447639ioc.16.1687966553869;
        Wed, 28 Jun 2023 08:35:53 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h21-20020a056638063500b0042311795f77sm3358436jar.83.2023.06.28.08.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 08:35:53 -0700 (PDT)
Received: (nullmailer pid 520633 invoked by uid 1000);
        Wed, 28 Jun 2023 15:35:51 -0000
Date:   Wed, 28 Jun 2023 09:35:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc:     "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v4 1/3] media: dt-bindings: nxp,imx8-isi: add i.MX93 ISI
 compatible string
Message-ID: <20230628153551.GA520164-robh@kernel.org>
References: <20230628064251.1774296-1-guoniu.zhou@oss.nxp.com>
 <20230628064251.1774296-2-guoniu.zhou@oss.nxp.com>
 <168794389087.4146462.8940502156407485967.robh@kernel.org>
 <AS8PR04MB908005F0F3F29B22238079A1FA24A@AS8PR04MB9080.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB908005F0F3F29B22238079A1FA24A@AS8PR04MB9080.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 28, 2023 at 11:56:13AM +0000, G.N. Zhou (OSS) wrote:
> Hi Rob,
> 
> Thanks for your report.
> 
> As you said, I have ran " make dt_binding_check DT_SCHEMA_FIELS=../../nxp,imx8-isi.yaml" before sending the patch and don't see errors. 
> I try to reproduce the issue you said and update dtschema, yamllint, but can't only check nxp,imx8-isi.yaml. But I can reproduce the issue
> no matter whether include my patches or not when enable all test examples. So seems these errors are not introduced by my patches. I'm
> not sure if I miss something?

You can ignore this.
