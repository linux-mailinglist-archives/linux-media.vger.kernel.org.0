Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16D80551F5B
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 16:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234503AbiFTOtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 10:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344233AbiFTOse (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 10:48:34 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4803A71B
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 07:08:29 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A749B80F88;
        Mon, 20 Jun 2022 16:08:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655734102;
        bh=QQNcmKoudaeAE0KDeOwf0y2ZSp7ZdBwqrQf2urCx8Qk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Qf3TGyPd4h2eL+DvkBSC0ROyhpeI8cBM7LzNMpnIsH+eJyc2J84/KZhxu9SY0YIzN
         kSyQCImFfYQiLjDKUTymZiL4qi1MUKuiS2vZ4EGNCMxr/CGCAn3O2sv2m4NwZqwSC0
         mFE1ZxuoOy8m/qfH5dk5VVGtAwcy9g3OoClXjCt/y/0M922Lha2N5cU9Br7SoTwuSx
         hDkxcPS9JZR36tIX43k5tpdgymMu0YrDnVrlX1SZruXA4Soar27ronObvYBaYyuYGm
         NlQma/I89GhmpSX9CqNgvLt4SaOUfEMo0x4W1PKg6wP5axp6WRODhyMNaJrK+bmYx7
         GarMzN8ykpTHw==
Message-ID: <4d5b5c59-f3d5-ad5a-ae61-73277b4adefa@denx.de>
Date:   Mon, 20 Jun 2022 16:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] media: stm32: dcmi: Switch to __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
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

On 6/20/22 11:44, Tomi Valkeinen wrote:
> Hi,

Hello all,

>> On Sun, Jun 19, 2022 at 12:24:42AM +0200, Marek Vasut wrote:
>>> Any local subdev state should be allocated and free'd using
>>> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
>>> takes care of calling .init_cfg() subdev op. Without this,
>>> subdev internal state might be uninitialized by the time
>>> any other subdev op is called.
> 
> Does this fix a bug you have?

Yes

> Wasn't this broken even before the active 
> state, as init_cfg was not called?

Yes, this was always broken. I suspect nobody tested this mode of 
operation before. In my case, I have this DCMI driver connected directly 
to MT9P006 sensor.

> In any case, I think we have to do something like this, as the source 
> subdev might depend on a valid subdev state.

Right.

[...]
