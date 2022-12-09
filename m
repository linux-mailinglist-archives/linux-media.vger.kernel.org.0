Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9DA2647B28
	for <lists+linux-media@lfdr.de>; Fri,  9 Dec 2022 02:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiLIBJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 20:09:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiLIBJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 20:09:23 -0500
Received: from out28-74.mail.aliyun.com (out28-74.mail.aliyun.com [115.124.28.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF50CA5060;
        Thu,  8 Dec 2022 17:09:17 -0800 (PST)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1048075|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0184579-0.00309086-0.978451;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047190;MF=lee.jackson@arducam.com;NM=0;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.QRbyIhC_1670548153;
Received: from localhost(mailfrom:lee.jackson@arducam.com fp:SMTPD_---.QRbyIhC_1670548153)
          by smtp.aliyun-inc.com;
          Fri, 09 Dec 2022 09:09:14 +0800
Date:   Fri, 9 Dec 2022 09:09:12 +0800
From:   Lee Jackson <lee.jackson@arducam.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "lee.jackson" <lee.jackson@arducam.com>,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Message-ID: <20221209090912.00000ee7@arducam.com>
In-Reply-To: <1cd9c47e-daa4-91a2-e300-a8c23a4dd1d0@linaro.org>
References: <20221205103800.00007a60@arducam.com>
        <167024503479.3691396.13573962465837376066@Monstersaurus>
        <1cd9c47e-daa4-91a2-e300-a8c23a4dd1d0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,FROM_WSP_TRAIL,
        HEADER_FROM_DIFFERENT_DOMAINS,INVALID_MSGID,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 5 Dec 2022 14:20:07 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 05/12/2022 13:57, Kieran Bingham wrote:
> > Hi Lee,
> > 
> > To try to avoid these circles, I've gone through and detailed
> > precisely how the name and e-mail address should be formed to meet
> > expectations.
> > 
> > Please also handle the other comments from Krzysztof for a v5.
> > 
> > Quoting lee.jackson (2022-12-05 02:38:00)  
> >> Add YAML device tree binding for IMX519 CMOS image sensor, and
> >> the relevant MAINTAINERS entries.
> >>
> >> Signed-off-by: lee.jackson <lee.jackson@arducam.com >  
> > 
> > Please ensure you configure your git client as follows:
> > 
> >   git config --global user.name "Lee Jackson"
> >   git config --global user.email "lee.jackson@arducam.com"  
> 
> ... and then: git commit --amend --reset-author --signoff
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,
Thank you very much for your patience. I have resubmitted V5 following your revision guide suggestion.
Sorry again for wasting your time and thank you again for your detail sugguestion.
Best regards,
Lee Jackson
