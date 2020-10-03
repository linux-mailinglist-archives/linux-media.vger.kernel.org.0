Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0ED282033
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 03:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgJCBj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 21:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgJCBj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 21:39:58 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81601C0613E3
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 18:39:56 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g9so1496222pgh.8
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 18:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=1v3By7yU45Bmu0NIaU5QNcQkQvQCDjWaS3fjoaCGs4M=;
        b=X1Admulul8xwuETLmzkYaZmPKEcjCvBdCxOIAo6xYnj0918QidtP5lCCoCFYAOj6yW
         Yxn566dOAjKJ9iJx33fFAxQgsSab3CHx1Ry4FcwZCP8f6zhaqW0cCsNLqq+4wMPUKth9
         7dehe7jAXb2/HI7wlIvMLJmEkivR6hNmQnSNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=1v3By7yU45Bmu0NIaU5QNcQkQvQCDjWaS3fjoaCGs4M=;
        b=QYmhB2IMuuWMW5xh6yzSn0lFUbSIOscKbkPZ+bDvwq7A7bgAGwkiWkUDtrToSqA3Nu
         piV/fRCSWx3sgcoe6lzWGFwUp6MOYyY59OzLO5AxoWm3HPvoa/zOEyyIkg+kRi+4lbA+
         jomTeu2wk0TPeeOKoOrDEij1XVBHr4F1lA6Sza0hSZAZs3//CszmlvxJ9F+uJ5i4Sjud
         P5o5hqCCHCJj+leaDANtvHu682NradN2ZMQK5NTQD1GUY5VQnn/E7Hf77O6ET0KHtDV2
         NWgESofd1CW+jNCJG3+sb/20frIQ4PYahB5PE8CNMOGrzVHw8NlZZS+gtcinUdWLlk4V
         +3Iw==
X-Gm-Message-State: AOAM532oVsKu1eCuGg8sqh0kw74gAb2LaGwOqT9smCdG9jX+GqtJPZMu
        DaNCYmB1F+MmpsRPgq0p9WqWSQ==
X-Google-Smtp-Source: ABdhPJx3l+GbWwg/wKPqoJepbGG2OIbKFcguASZ6y5wTgqJgOe9scEIGjuqf7fADhsHj623SrG1WJg==
X-Received: by 2002:aa7:85d4:0:b029:142:4339:42ca with SMTP id z20-20020aa785d40000b0290142433942camr5460800pfn.5.1601689195794;
        Fri, 02 Oct 2020 18:39:55 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id z28sm3648837pfq.81.2020.10.02.18.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 18:39:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201001084425.23117-4-rojay@codeaurora.org>
References: <20201001084425.23117-1-rojay@codeaurora.org> <20201001084425.23117-4-rojay@codeaurora.org>
Subject: Re: [PATCH V5 3/3] i2c: i2c-qcom-geni: Add shutdown callback for i2c
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, vkaur@codeaurora.org,
        pyarlaga@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Date:   Fri, 02 Oct 2020 18:39:53 -0700
Message-ID: <160168919332.310579.15311671258384969025@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Roja Rani Yarubandi (2020-10-01 01:44:25)
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index aee2a1dd2c62..56d3fbfe7eb6 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -380,6 +380,36 @@ static void geni_i2c_tx_msg_cleanup(struct geni_i2c_=
dev *gi2c,
>         }
>  }
> =20
> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
> +{
> +       int ret;
> +       u32 geni_status;
> +       unsigned long flags;
> +       struct i2c_msg *cur;
> +
> +       /* Resume device, runtime suspend can happen anytime during trans=
fer */
> +       ret =3D pm_runtime_get_sync(gi2c->se.dev);
> +       if (ret < 0) {
> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", re=
t);
> +               return;
> +       }
> +
> +       spin_lock_irqsave(&gi2c->lock, flags);

We grab the lock here.

> +       geni_status =3D readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
> +       if (!(geni_status & M_GENI_CMD_ACTIVE))
> +               goto out;
> +
> +       cur =3D gi2c->cur;
> +       geni_i2c_abort_xfer(gi2c);

But it looks like this function takes the lock again? Did you test this
with lockdep enabled? It should hang even without lockdep, so it seems
like this path of code has not been tested.

> +       if (cur->flags & I2C_M_RD)
> +               geni_i2c_rx_msg_cleanup(gi2c, cur);
> +       else
> +               geni_i2c_tx_msg_cleanup(gi2c, cur);
> +       spin_unlock_irqrestore(&gi2c->lock, flags);
> +out:
> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
> +}
> +
>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg=
 *msg,
>                                 u32 m_param)
>  {
