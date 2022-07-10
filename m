Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A9956CC38
	for <lists+linux-media@lfdr.de>; Sun, 10 Jul 2022 03:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiGJBuk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jul 2022 21:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiGJBuj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jul 2022 21:50:39 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99801E0BA
        for <linux-media@vger.kernel.org>; Sat,  9 Jul 2022 18:50:37 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 12C0984335;
        Sun, 10 Jul 2022 03:50:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1657417836;
        bh=mrFwzWxD+jRVkiNB7W4C79RCugWbf2HkGYDF20VUl4U=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=oKFUpuZh9DNOclfoCJk6fJ/Rf7Qmve9t/m/3EhEZqEBGfmpH2tetUgkJh0201R1Mu
         7wP5bj5YRJXNBCyAWKTe7oqum8WIvs1ulIF29VgstgIqAB79KqyEkk7HmI6a+IY4Sr
         wrNEFn2yO8pQUx7/qxtcypB0zCa6rYpPbs/Z7fGLDY2GwFsr3yXkJCrMGQUX6r9Dvj
         yZlP30DXmCsf97bHf5Sxuw2gIwL3O/W6w1XVw2JdRdc1a+DF+02Lab9LvplZyQxI07
         zvi/tOGTtd/7+UbYugU1qY0rU4dtLuXqe0CCw7G1UnlsbbSuIdn1FNixrDqDM+L52o
         WqCN0c6Uiw8fQ==
Message-ID: <e0c017ba-6f02-2bd8-b3a1-ebf30bc395ce@denx.de>
Date:   Sun, 10 Jul 2022 03:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] media: stm32: dcmi: Fix subdev op call with
 uninitialized state
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20220701131559.66715-1-tomi.valkeinen@ideasonboard.com>
 <20220701131559.66715-2-tomi.valkeinen@ideasonboard.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220701131559.66715-2-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/1/22 15:15, Tomi Valkeinen wrote:
> stm32-dcmi calls its source subdev with v4l2_subdev_call() using a
> v4l2_subdev_state constructed on stack. This means that init_cfg is
> never called for that state, and a source subdev that depends on the
> init_cfg call may break.
> 
> A new macro has been added for this particular purpose, which properly
> initializes the state, so let's use v4l2_subdev_call_state_try() here.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Tested-by: Marek Vasut <marex@denx.de>
