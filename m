Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73B0955E345
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbiF0Na0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 09:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235554AbiF0NaY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 09:30:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5976453
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 06:30:23 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28C971C82;
        Mon, 27 Jun 2022 15:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656336621;
        bh=zLlmoxf66qaWQT370p2CS4eQLa681tT2iL2yvsfFIa8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=GZ7c9yxkaqQlFds3EFrEa8od2JyxO3LDbtc8kNTm2VNWXkPw8ifck3OqYL70lW6dK
         pU8sVe32VBF6AJL+g+0AT0ZSv4GtJgsoOTyb3UeuXw16JuJZL2HxmbKtGfm+cYF0rO
         5KxMA/cuuKBgoaG9Z0LNjSgJ6+nUqKU7fn4t0r8o=
Message-ID: <b9c450b1-96d2-1ac5-0dec-04387903ebf2@ideasonboard.com>
Date:   Mon, 27 Jun 2022 16:30:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: stm32: dcmi: Switch to __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
 <4d5b5c59-f3d5-ad5a-ae61-73277b4adefa@denx.de>
 <5ee6c0c0-8ab0-561c-e1f6-b26e4ec438af@foss.st.com>
 <39657445-e5ac-bfd6-c122-b18088fa4b41@denx.de>
 <733f9689-b4d7-8f23-37d3-920aa6a5a7ea@foss.st.com>
 <c92f1a8d-6439-d494-5779-70619ec94760@denx.de>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <c92f1a8d-6439-d494-5779-70619ec94760@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/06/2022 16:01, Marek Vasut wrote:
> On 6/27/22 14:53, Hugues FRUCHET wrote:
>> Hi Marek,
> 
> Hi,
> 
>> Thanks for explanation, I understand now.
>>
>> Please note that dcmi is not atmel-isi.c has same code structure, 
>> hence same problem:
>>
>> static int isi_try_fmt(struct atmel_isi *isi, struct v4l2_format *f,
>>      struct v4l2_subdev_state pad_state = {
>>          .pads = &pad_cfg
>>          };
>> [...]
>>      ret = v4l2_subdev_call(isi->entity.subdev, pad, set_fmt,
>>
>>
>> Moreover, searching for __v4l2_subdev_state_alloc() I see those "FIXME":
>>
>> drivers/media/platform/renesas/vsp1/vsp1_entity.c
>>      /*
>>       * FIXME: Drop this call, drivers are not supposed to use
>>       * __v4l2_subdev_state_alloc().
>>       */
>>      entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
>>                             "vsp1:config->lock", &key);
>>
>>
>> drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
>>      /*
>>       * FIXME: Drop this call, drivers are not supposed to use
>>       * __v4l2_subdev_state_alloc().
>>       */
>>      sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
>>
>>
>> So I wonder about introducing this new change in dcmi while it is 
>> marked as "FIXME" in other camera interface drivers ?
> 
> This is probably something Tomi/Laurent can answer better. It should be 
> OK for this driver as far as I understand the discussion in this thread.

Yes and no. We shouldn't use __ funcs in the drivers. 
__v4l2_subdev_state_alloc() calls exist in the current drivers as it 
wasn't trivial to change the driver to do it otherwise while adding the 
subdev state feature.

If I recall right, the other users (at least some of them) were storing 
internal state in the state, not passing it forward. And, of course, the 
drivers were themselves interested in the state stored there.

Here, we only need to allocate the state so that the driver is able to 
call set_fmt on another subdev, so it's a bit different case.

Anyway, I think it's _not_ ok to add __v4l2_subdev_state_alloc() without 
a FIXME comment. However, I think it's ok to add a helper func, similar 
to v4l2_subdev_call_state_active(), which in turn uses 
__v4l2_subdev_state_alloc.

However, if we end up in a situation where we think it's "normal" for 
drivers to call __v4l2_subdev_state_alloc, we need to rename it and drop 
the two underscores. But I think we're not there yet (and hopefully never).

  Tomi
