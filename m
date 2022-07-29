Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C084584D8D
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 10:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234622AbiG2ImI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 04:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiG2ImH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 04:42:07 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9962F3;
        Fri, 29 Jul 2022 01:42:06 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D5EF5100075; Fri, 29 Jul 2022 09:42:03 +0100 (BST)
Date:   Fri, 29 Jul 2022 09:42:03 +0100
From:   Sean Young <sean@mess.org>
To:     Christian Hewitt <christianshewitt@gmail.com>,
        Zhang Ning <zhangn1985@qq.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        narmstrong@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
Message-ID: <YuOdWyF2yJVhh415@gofer.mess.org>
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
 <b094bf45-ad7e-9e42-89a6-bae0b8e4aae1@linaro.org>
 <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 28, 2022 at 07:48:57AM +0800, Zhang Ning wrote:
> Christian Hewitt told me to split to 2 patches, 1st for manufactor, 2nd
> for device, how to handle your Acked-by?
> 
> btw, he also said I'm wrong in handle Sean's Signed-of-by, still don't
> know how to do in next version. Should I just not send this patch?

Christian can you explain *on list* what is wrong with handling my
Signed-off-by? As far as I can see Ning has done the right thing.

Please keep the conversation on list so we're all in the loop.


Sean
