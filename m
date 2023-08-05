Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5982577126C
	for <lists+linux-media@lfdr.de>; Sat,  5 Aug 2023 23:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjHEVk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Aug 2023 17:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHEVkZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Aug 2023 17:40:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8810D1735;
        Sat,  5 Aug 2023 14:40:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1CB8260D38;
        Sat,  5 Aug 2023 21:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4C2C433C8;
        Sat,  5 Aug 2023 21:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691271623;
        bh=k64VRgGuJDKrIA65xa+FHVrwoVlo+w3ZLCxnjg6dZfQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZDXoqey1jOtrvd4DCRrmYiAIbh0sf46tBBQW2W2XV9D9vez79lWwVsHeTtomkX9je
         dn+LspPo0W9nvUXfV4a6t15pn0XKKDT019pW4OqPMKe+3QXXg2dlFiVsTsm9PRRP+o
         1gmfsM2vNp23+Y/dT2uEPrAb90Sk8PerUntuGUpkSFxgQHnqf9AP+L4KCnYi8bjVXq
         AxfVlBzjlEJ/w7D2QJsMJtlgF/dazkgm/GqNLvPrAo8blTNyzFHUZcE9D3fHZHhnkX
         I9g+cDnBzOQUNwPfqtzFU7SsnZ5XffiTN2CtOZZ1QJfS5X94UuIbx8OxzFYyg4a6xz
         ikuNWhCG8BfwA==
Date:   Sat, 5 Aug 2023 23:40:19 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     sylvester.nawrocki@gmail.com, mchehab@kernel.org,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH -next 1/2] media: camif-core: Do not check for 0 return
 after calling platform_get_irq()
Message-ID: <20230805214019.vidikqlccitiddxa@intel.intel>
References: <20230803024645.2716057-1-ruanjinjie@huawei.com>
 <20230803024645.2716057-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803024645.2716057-2-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ruan,

On Thu, Aug 03, 2023 at 10:46:44AM +0800, Ruan Jinjie wrote:
> It is not possible for platform_get_irq() to return 0. Use the
> return value from platform_get_irq().
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
