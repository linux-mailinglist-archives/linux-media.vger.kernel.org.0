Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0D6526630
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 17:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381432AbiEMPfp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 11:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381399AbiEMPfp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 11:35:45 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904D1101C4
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 08:35:43 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id q18so8271642pln.12
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cwEHROTwAWONW9LClMhxm8JAVtk6t0Q8QMuswvfpMFA=;
        b=F2xgswMAUMJnoWT2kgHwvwb7EA/MS5Gajp2D7DvfQFxBDqfagFm6uuiU3ENAPPnuW3
         ywUUwCVkvohIJe/URo9xZdNLMdvrB3jSiGl49mPgMXQAGUTwsi5KDaR8jqLTkVf1k+HD
         y6JrMQFc6VpMWkriDvhmKCByZI2z9sYvMtNXpVm/mHHzyNPC3UCup8WN3nQQeU1t6VEy
         cNWlGjS/phf5DRTbXUATM0q3f2COVZbh6GRNP4NHaIjeq9pBQP6r+kn0UArMQRPCYu/S
         dcivxAwEcnmTBWKjAIfj9X1HeMqPmrrweORk2ShDYYNTX+23U9q4zfwdCyo+oMmsRiDB
         VvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cwEHROTwAWONW9LClMhxm8JAVtk6t0Q8QMuswvfpMFA=;
        b=SQnqDSpNkpEC/sCnr3VdYEFzvYBrYSkVX0iCFwUsF0unwBKzV2Ntqe+OVMciu734j0
         g13Sdoo0Ny7/8I2fya2Ivav+mIIcGedP+RFG2CW3OXtEXErQlSDBczdY2CiEVbBzdw4J
         /A4hHBZGm8ECpRRW/pM1gceGwLV8JsvrP/hJ+N7cwdnM7uCMs5j3c0sFCUUh61Jpfzas
         bsOzSZBK6m5m0skxI/IUiaU/Uc7wHm9gnXQcRrx7pJza2QZi5nxfwHSzpVHxudk2FkZG
         6JQTU7AqCncfjRJ4z+EJfK2+60MuClk83rYl49kObLV41CkFtSHx7pz32+UXGUL57LdV
         5fCg==
X-Gm-Message-State: AOAM532FVo/s6awsi291eVNMMRjmBQH8hsTeRO03j74090VTr6ef39iA
        3wxLpdetx7ahr4CLfi1V25eNbZa8RDeAHqcluWShJg==
X-Google-Smtp-Source: ABdhPJxZfZuyOwpsIqij6nkirkYBtmy/5yc5wER0gD3/nwfYeCw5KwZEIqQ6IpZVyIvFiv9ncmdfM8gHOBQPXjxSHtk=
X-Received: by 2002:a17:902:ea0e:b0:15e:c0e4:cf15 with SMTP id
 s14-20020a170902ea0e00b0015ec0e4cf15mr5415797plg.63.1652456143031; Fri, 13
 May 2022 08:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220510134146.1727701-1-zheyuma97@gmail.com>
In-Reply-To: <20220510134146.1727701-1-zheyuma97@gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 13 May 2022 08:35:31 -0700
Message-ID: <CAJ+vNU3f6vxwwCjXTA8E8n8EjMFosKpXKRk1TOBz-Tifx15Ufg@mail.gmail.com>
Subject: Re: [PATCH] media: TDA1997x: Fix the error handling in tda1997x_probe()
To:     Zheyu Ma <zheyuma97@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 10, 2022 at 6:42 AM Zheyu Ma <zheyuma97@gmail.com> wrote:
>
> The driver should disable the regulator when failing to probe.
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>  drivers/media/i2c/tda1997x.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
> index 8fafce26d62f..0de7acdf58a7 100644
> --- a/drivers/media/i2c/tda1997x.c
> +++ b/drivers/media/i2c/tda1997x.c
> @@ -2798,6 +2798,7 @@ static int tda1997x_probe(struct i2c_client *client,
>         cancel_delayed_work(&state->delayed_work_enable_hpd);
>         mutex_destroy(&state->page_lock);
>         mutex_destroy(&state->lock);
> +       tda1997x_set_power(state, 0);
>  err_free_state:
>         kfree(state);
>         dev_err(&client->dev, "%s failed: %d\n", __func__, ret);
> --
> 2.25.1
>

Acked-By: Tim Harvey <tharvey@gateworks.com>

Best Regards,

Tim
