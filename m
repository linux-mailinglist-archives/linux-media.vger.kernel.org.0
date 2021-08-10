Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA64D3E7C6F
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 17:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243095AbhHJPh3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 11:37:29 -0400
Received: from mail.ispras.ru ([83.149.199.84]:45668 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242081AbhHJPh1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 11:37:27 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPSA id E6DBA40755F7;
        Tue, 10 Aug 2021 15:36:59 +0000 (UTC)
Subject: Re: [PATCH] media: atomisp: Fix error handling in probe
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
References: <20210810115303.9089-1-novikov@ispras.ru>
 <20210810151427.GY1931@kadam>
From:   Evgeny Novikov <novikov@ispras.ru>
Message-ID: <528319d8-59d8-d3fa-3fa4-57bf2c1464e8@ispras.ru>
Date:   Tue, 10 Aug 2021 18:36:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810151427.GY1931@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thank you for these suggestions. I will resend the patch.

Best regards,
Evgeny Novikov

On 10.08.2021 18:14, Dan Carpenter wrote:
> On Tue, Aug 10, 2021 at 02:53:03PM +0300, Evgeny Novikov wrote:
>> There were several issues with handling errors in lm3554_probe():
>> - Probe did not set the error code when v4l2_ctrl_handler_init() failed.
>> - It intermixed gotos for handling errors of v4l2_ctrl_handler_init()
>>    and media_entity_pads_init().
>> - Probe did not free resources in case of failures of
>>    atomisp_register_i2c_module().
>>
>> The patch fixes all these issues.
>>
>> Found by Linux Driver Verification project (linuxtesting.org).
> This patch is good, but two things:
>
> 1) Please can you rename all the labels to say what the goto does?
>
> err_uninit:
> 	lm3554_gpio_uninit(client);
> cleanup_media:
>   	media_entity_cleanup(&flash->sd.entity);
> free_handler:
>   	v4l2_ctrl_handler_free(&flash->ctrl_handler);
> unregister_subdev:
>   	v4l2_device_unregister_subdev(&flash->sd);
>
> 2) There is a missing error code still:
>
> drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
>     858          if (ret) {
>     859                  dev_err(&client->dev, "error initialize a ctrl_handler.\n");
>     860                  goto fail3;
>     861          }
>     862
>     863          for (i = 0; i < ARRAY_SIZE(lm3554_controls); i++)
>     864                  v4l2_ctrl_new_custom(&flash->ctrl_handler, &lm3554_controls[i],
>     865                                       NULL);
>     866
>     867          if (flash->ctrl_handler.error) {
>     868                  dev_err(&client->dev, "ctrl_handler error.\n");
>     869                  goto fail3;
>                          ^^^^^^^^^^
> 	err = flash->ctrl_handler.error;
>
>     870          }
>     871
>     872          flash->sd.ctrl_handler = &flash->ctrl_handler;
>     873          err = media_entity_pads_init(&flash->sd.entity, 0, NULL);
>     874          if (err) {
>     875                  dev_err(&client->dev, "error initialize a media entity.\n");
>     876                  goto fail2;
>     877          }
>
> regards,
> dan carpenter
>
