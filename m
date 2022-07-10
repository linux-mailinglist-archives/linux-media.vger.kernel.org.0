Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6D1C56CC37
	for <lists+linux-media@lfdr.de>; Sun, 10 Jul 2022 03:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiGJBuk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jul 2022 21:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiGJBuj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jul 2022 21:50:39 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED28AE088
        for <linux-media@vger.kernel.org>; Sat,  9 Jul 2022 18:50:36 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A2502839CA;
        Sun, 10 Jul 2022 03:50:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1657417834;
        bh=H2BnMWyeuoJ901MU3ESY1dDqEDP/BFtHXZ+UxwBGqJA=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=BrOxVu2xAsUzee0BxABDQkCxfCHzjTnD5BmpdeZiNKvJBMf2FwVJnVBv+GV0wr9n+
         0pt2P2VxKuzQHTMMqK8488x7VcxW8GBxFvdRU0bpncBOzGrpEjQ+50lvq5WWHupk7u
         lIJ4iQ31c9MI2gYwEBvGfhZ5qc9TjLw5sxvPFpROd68stIPuxwHje/R+AvLuTRF3EF
         q+Qd3cFMcpyJlV6a2aN+/aHD9bWrEJ4ZPnKWGf8/3a5INWJ555skHF6GBDoHKRzcwF
         xV8cxDjRmmIG4mJTfbS1JlQhAmC8ii0WlRBRW7xwi441W5//WswMAElmhSzp9TucBk
         YUMd7ew/hXeow==
Message-ID: <b64bd14a-5a49-a8ea-0bdc-4fbba4f0c29d@denx.de>
Date:   Sun, 10 Jul 2022 03:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] media: subdev: Add v4l2_subdev_call_state_try() macro
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20220701131559.66715-1-tomi.valkeinen@ideasonboard.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220701131559.66715-1-tomi.valkeinen@ideasonboard.com>
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
> Add a helper macro for the situations where a non-MC driver needs to
> call a state-operation (operation which takes a subdev state as a
> parameter) in try-context in another subdev.
> 
> The macro allocates a new subdev state for the called subdev and frees
> the state afterwards.
> 
> An example use case is a media platform driver testing if a
> v4l2_subdev_format would be accepted by a source subdev.
> 
> This should not be used in MC drivers.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Tested-by: Marek Vasut <marex@denx.de>
