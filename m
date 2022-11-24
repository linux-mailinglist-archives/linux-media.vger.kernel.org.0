Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 153766374B0
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 10:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiKXJD6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 04:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiKXJDz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 04:03:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32AC10CEBE;
        Thu, 24 Nov 2022 01:03:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 549D1B82721;
        Thu, 24 Nov 2022 09:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EDAC433D6;
        Thu, 24 Nov 2022 09:03:48 +0000 (UTC)
Message-ID: <e71296ac-46a7-7d8e-f922-8a933346f1c6@xs4all.nl>
Date:   Thu, 24 Nov 2022 10:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 0/2] media: dt-bindings: media: sm8250-camss: Add
 power-domain-names property
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220518121104.951621-1-vladimir.zapolskiy@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220518121104.951621-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vladimir,

On 18/05/2022 14:11, Vladimir Zapolskiy wrote:
> QCOM SM8250 camera subsystem depends on three power domains, at the moment
> all of them are not differentiated one from another, however the power
> domains compose a hierarchical structure with vfe0 and vfe1 as subdomains
> of titan_top, also managing vfe0 and vfe1 separately allows to get more
> fine-grained power control in runtime.
> 
> The change relates to my review comment for v2 of CAMSS on SM8250 submission:
> 
>    https://lore.kernel.org/all/13ad033e-cd5d-3a8c-b036-50a3ac4245c0@linaro.org/
> 
> Apparently it becomes important to manage CAMSS power domains much better for
> newer platforms, this referes to platforms with Titan GDSC, for instance CAMSS
> on SM8450 has 6 power domains, and dealing with them in bulk is not an option.
> 
> There was a note in commit 2f6f8af67203 ("media: camss: Refactor VFE power
> domain toggling") about problems with power VFE domains on/off, but perhaps
> it's related to the fact that Titan GDSC is a special power domain and VFE
> are subdomains, the latter shall not be enabled earlier than the Titan, but
> the driver did not construct a proper hierarchy and leaves a room for races.
> 
> The change should have no implications on any SM8250 CAMSS users, since
> none of the supported in upstream boards enables the camss device tree node.
> The correspondent changes in the driver will follow this dt specific series.
> 
> Most likely a similar change is required for SDM845 platform, but it would
> need additional investigation and testing.
> 
> Vladimir Zapolskiy (2):
>   media: dt-bindings: media: sm8250-camss: Add power-domain-names property
>   arm64: dts: qcom: sm8250: camss: Add power-domain-names property
> 
>  .../devicetree/bindings/media/qcom,sm8250-camss.yaml       | 7 +++++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi                       | 1 +
>  2 files changed, 8 insertions(+)
> 

I am marking this series as 'Obsoleted' in patchwork. If you believe this
(or a variant of it) is still needed, then please repost.

Regards,

	Hans
