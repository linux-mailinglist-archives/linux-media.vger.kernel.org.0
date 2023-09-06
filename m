Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC514793D3E
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 14:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236630AbjIFM6D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 08:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbjIFM6C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 08:58:02 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6760CE43;
        Wed,  6 Sep 2023 05:57:59 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 21513100091; Wed,  6 Sep 2023 13:57:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1694005077; bh=EzwDXWT6RpEhAc2cQpSOJAWS31npZoM+FGVnLWWuX9A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d9dpcAeZ8pOOKfDQlDukibXcSb39g0CeRKcpIy35MfnsTxdyYiTEwIg8fjelsyAQW
         lH+0vHDb6epJkF5GocbsehtwH79cfzQa0H0NrezjfO0iMMhcOBTZ+JPuephisjoWCw
         L0fye1+e73KQxlYmasyYkYKACdEVl3HzwnpyCxQDbz+hAqy0pW/H8alirSDdhCW9G7
         sOftvW9N77Irr1nTP6+k5HNkA7Rs+MLn86MIK7lFmhXE3Ju1ILauWDMIikAs43VSQG
         Ya0qmAEXiMvlncVkYDq46rnpCYRDfd/nzc9fWA3a80EZoCpwCYw6o3nbNq7/roQglX
         htXrXNSv9bTdw==
Date:   Wed, 6 Sep 2023 13:57:57 +0100
From:   Sean Young <sean@mess.org>
To:     Zelong Dong <Zelong.Dong@amlogic.com>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
Message-ID: <ZPh3VXPzosk3i3lS@gofer.mess.org>
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
 <ZO2gvMl2IS70ve3T@gofer.mess.org>
 <b6e9fc91-0c99-5635-235b-76bc6db55f75@amlogic.com>
 <ZPGahNKlq/31MXbh@gofer.mess.org>
 <448f6dab-4cfe-c840-8c70-adfa217cc7f3@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <448f6dab-4cfe-c840-8c70-adfa217cc7f3@amlogic.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 06, 2023 at 06:37:41PM +0800, Zelong Dong wrote:
> 在 2023/9/1 16:02, Sean Young 写道:
> > There are other drivers too which can do hardware decoding and software
> > decoding. Ideally we should have a mechanism to switch between them at
> > runtime, but as-is rc-core does not provide for this.
> Anything else I should update for this patchset?

I don't think so.

I was just saying that it would be great to have runtime switching in the
future.

Thanks,

Sean
