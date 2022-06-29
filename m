Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526ED560044
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 14:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbiF2Mjv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 08:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbiF2Mjv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 08:39:51 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3402521E3F
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 05:39:50 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8A84183C96;
        Wed, 29 Jun 2022 14:39:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656506387;
        bh=LIPOVh1YMmNB627FkwWK8FBNfvCEoeGmN/umIjoCr3c=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=N9JQ4n48xRFj2gejuje2F8kSHSZcLtA4BjBVXC9Mhiyyk0wuSp2krZhlX7ZTifdak
         ZUxS2LoCiDTZsSsFBOmfdyIm8Rbeh50ZrqiKzJpgzu4iOwFFsR9+eB3G0Y8zNNDXCp
         nwOyWlNgkRmjbEi2dV+CWc2HTXPFPN5n0tD4Tpzkm3SGVDTNcowQt2MwkrZZIMGpfk
         2SIoucCMRu4KRJ8v1bzoUJTvEUt/1ZCykWrPhExlRARExLmv/GT2TJyBq07rT/zyn9
         LdV/8CKMBLRaF39i0AuLf+gZEJ83z9YTPZaZFnEHWRK29urImFWHbZzSbHzaLfipm9
         21/2y7d3yr7uw==
Message-ID: <a2e45188-54d2-1ef2-1d21-cf60d47aeb43@denx.de>
Date:   Wed, 29 Jun 2022 14:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] media: stm32: dcmi: Switch to
 __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220627174156.66919-1-marex@denx.de>
 <3ef88906-188d-52a6-c3bf-647bc4e36732@xs4all.nl>
 <32f04271-4a9a-3291-cf36-ead0383db9ca@ideasonboard.com>
 <YrxDq5I3ZsEf8ruO@pendragon.ideasonboard.com>
 <df7060aa-b201-3d39-72e9-fcb575e7b43e@ideasonboard.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <df7060aa-b201-3d39-72e9-fcb575e7b43e@ideasonboard.com>
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

On 6/29/22 14:26, Tomi Valkeinen wrote:

[...]

>>> Perhaps the best way to solve this is just to remove the underscores
>>> from __v4l2_subdev_state_alloc, and change all the drivers which create
>>> temporary v4l2_subdev_states to use that (and the free) functions. And
>>> also create the helper macro which can be used in those cases where the
>>> call is simple (the state is not modified or accessed by the caller).
>>
>> As long as we prevent any new driver from using that API, that's fine
>> with me.
> 
> An alternative would be to keep the v4l2_subdev_state as a local 
> variable (allocated in the stack), and add a new function, 
> v4l2_subdev_state_local_init() or such. The function would initialize 
> the given state, expecting the allocatable fields to be already 
> allocated (state->pads, which in the above cases points to another local 
> variable, i.e. stack).
> 
> This would prevent the need of a free call, which, while not complex as 
> such, might cause a bigger amount of changes in some cases to handle the 
> error paths correctly.
> 
> Of course, if the above-mentioned macro works, then that's the easiest 
> solution. But that won't work for all drivers.

Don't you think a driver fix shouldn't involve "rework the subsystem" 
requirement to be applicable ?
