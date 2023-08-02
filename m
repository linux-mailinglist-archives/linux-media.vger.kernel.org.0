Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3869576C6C5
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 09:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbjHBH10 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 03:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232148AbjHBH1Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 03:27:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F02F1FCB
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 00:27:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 05062617A5
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 07:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81F2C433C7;
        Wed,  2 Aug 2023 07:27:18 +0000 (UTC)
Message-ID: <1f43956c-296a-b1ad-6a36-19a3f0ffeb6b@xs4all.nl>
Date:   Wed, 2 Aug 2023 09:27:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [bug report] [media] adv7511: add new video encoder
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-media@vger.kernel.org
References: <591910e0-15db-4055-85ef-d4ca99649120@moroto.mountain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <591910e0-15db-4055-85ef-d4ca99649120@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 31/07/2023 10:36, Dan Carpenter wrote:
> Hello Hans Verkuil,
> 
> The patch 5a544cce2177: "[media] adv7511: add new video encoder" from
> Aug 23, 2013 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	drivers/media/i2c/adv7511-v4l2.c:929 adv7511_isr()
> 	warn: sleeping in IRQ context
> 
> drivers/media/i2c/adv7511-v4l2.c
>     912 static int adv7511_isr(struct v4l2_subdev *sd, u32 status, bool *handled)
> 
> This is a new check so I'm not positive I understand everything
> correctly yet.  This looks at functions which are passed to
> request_irq() and assumes that they are not threaded.  Also the "_isr"
> here stands for Interrupt Service Routine.
> 
>     913 {
>     914         u8 irq_status;
>     915         u8 cec_irq;
>     916 
>     917         /* disable interrupts to prevent a race condition */
>     918         adv7511_set_isr(sd, false);
>     919         irq_status = adv7511_rd(sd, 0x96);
>     920         cec_irq = adv7511_rd(sd, 0x97);
>     921         /* clear detected interrupts */
>     922         adv7511_wr(sd, 0x96, irq_status);
>     923         adv7511_wr(sd, 0x97, cec_irq);
>     924 
>     925         v4l2_dbg(1, debug, sd, "%s: irq 0x%x, cec-irq 0x%x\n", __func__,
>     926                  irq_status, cec_irq);
>     927 
>     928         if (irq_status & (MASK_ADV7511_HPD_INT | MASK_ADV7511_MSEN_INT))
> --> 929                 adv7511_check_monitor_present_status(sd);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> v4l2_ctrl_s_ctrl() takes a mutex so this is a sleeping function.
> 
>     930         if (irq_status & MASK_ADV7511_EDID_RDY_INT)
>     931                 adv7511_check_edid_status(sd);
>     932 
>     933 #if IS_ENABLED(CONFIG_VIDEO_ADV7511_CEC)
>     934         if (cec_irq & 0x38)
>     935                 adv_cec_tx_raw_status(sd, cec_irq);
>     936 
>     937         if (cec_irq & 1) {
>     938                 struct adv7511_state *state = get_adv7511_state(sd);
>     939                 struct cec_msg msg;
>     940 
>     941                 msg.len = adv7511_cec_read(sd, 0x25) & 0x1f;
>  
> regards,
> dan carpenter

Hmm, this is old code and when digging into this I noticed inconsistencies
in how it is used and how it is documented.

It's used by the v4l2_subdev interrupt_service_routine callback. The header
include/media/v4l2-subdev.h claims that it is called from IRQ context, but this
isn't true in most cases. It's used primarily to pass on interrupts meant for
i2c video receivers/transmitters that arrive at the bridge chip to the actual
i2c device. And that happens in work handlers that allow the use of locking.

I found one exception where it is also used for an IR (infrared) receiver and
there it is actually called from IRQ context. It doesn't use i2c or sleeps/locking
in that case, so it is safe.

But what confuses me is that you state 'This looks at functions which are passed to
request_irq()', but adv7511_isr isn't passed to request_irq. So why is this warning
raised?

Regards,

	Hans
