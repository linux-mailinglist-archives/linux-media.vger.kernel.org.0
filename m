Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25D415514A5
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 11:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240848AbiFTJoL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 05:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239870AbiFTJoJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 05:44:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9D912AEE
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 02:44:08 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0092B883;
        Mon, 20 Jun 2022 11:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655718246;
        bh=bwhdDDIn0wE1jCXQa2c1jI5Ynk/nP/b2jXFdZNQ4YcM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=a/7AT3DzSlrIME+rcykB4O5vb++KQcLnWQxb3+04dWw7PUKXwH/G9A+0PqAecM4uc
         /wpUIUf2UbCw9INfSWRaiFXE8d6miOAj8rk/ek0OOv5QfOE72FE4GQomp4p1PbAdgR
         PPy4AQpCEHcNSlTGNDquvmnCBnxXj7m6Rk4+sy1k=
Message-ID: <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
Date:   Mon, 20 Jun 2022 12:44:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: stm32: dcmi: Switch to __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
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
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 19/06/2022 02:16, Laurent Pinchart wrote:
> Hi Marek,
> 
> CC'ing Tomi to get his opinion.
> 
> On Sun, Jun 19, 2022 at 12:24:42AM +0200, Marek Vasut wrote:
>> Any local subdev state should be allocated and free'd using
>> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
>> takes care of calling .init_cfg() subdev op. Without this,
>> subdev internal state might be uninitialized by the time
>> any other subdev op is called.

Does this fix a bug you have? Wasn't this broken even before the active 
state, as init_cfg was not called?

In any case, I think we have to do something like this, as the source 
subdev might depend on a valid subdev state.

It's not very nice to have the drivers using __v4l2_subdev_state_alloc, 
though. But if non-MC drivers are not going away, and if they are going 
to be calling ops in other subdevs with V4L2_SUBDEV_FORMAT_TRY, they 
need to pass a valid subdev state...

I don't see a better way right away, so I think this is fine.

Do we need a v4l2_subdev_call_state_try(), similar to 
v4l2_subdev_call_state_active()? It would handle allocating the state, 
calling the op and freeing the state.

  Tomi
