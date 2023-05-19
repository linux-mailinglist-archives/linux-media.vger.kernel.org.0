Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F04477094D5
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 12:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbjESKdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 May 2023 06:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjESKdG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 May 2023 06:33:06 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DDBDE66
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 03:33:05 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6238b15d298so19093476d6.0
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684492384; x=1687084384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3rL7BulhM5pWVN/MwQK8G26erANs0W0dCbfkg7a2gM=;
        b=E1cT5EhhC0et5CKM2hr7bE3qmcQxrxQXBHxcEE1vXJvWPl5f0PrbKXNIVW7vH2tmpN
         0oTcIZDHWvZZ3lBcAzItrC8/comMWGOM1h+2PihpAyo0k1pPqNZRHhrMR6+7BGPlTLKi
         5sSzd2odk1/wZrC76NHdpWu9w/bWWrNqAeikGYAIiQzUHMnauz1gz9JVViKrM8Jdwnez
         Okh+iKXMyPLDijeVohuBkiuoSm6J18/y7XTXkLfKxJg7M0mWKG5yXRqj33ZzntswOE1y
         YGYTgnURekbuOFXgpWO9hVB1orhnBcQRJbM2VHQIJZ+gJLrjoUb/fqWanQLYX3rze+pQ
         7vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684492384; x=1687084384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3rL7BulhM5pWVN/MwQK8G26erANs0W0dCbfkg7a2gM=;
        b=DWibFPNJ1Cd4tzqYQ/mDw9m2OizHV3UzaLrpgVyVDJQXin8ibbU8sTvpqh+gd7Dv5r
         c+rvd+co/wIfI+n4Ps6Z2r510AcadJf1T3ftEgNDV3i88an2PqWsDpy6GdCDCWU3mnCy
         0ZdaiKDeTqqEbAA3prbRQTacSR1h3pIqid8yck5Dlbg2BTV4lGDnk8a+cOIrd2wURKBl
         aLtTAsi5ngM6vMJP2ozyhP/sErGPHjYRQ0b9T8L0Z5LefrJBZXcIqCflYqfs+saX6vOe
         BlQ8ODr3Ryo5feXDaQpy5BDqyxYmHOUd1BANkCEtZpAPeC0VY8G7CZrJzrseGyRlZzRh
         VhYg==
X-Gm-Message-State: AC+VfDy9TdIxpLASVT/14vK+L9DDQpNA3FWvJRcj8yHafIJ7fUgdOISU
        yE8h/52nBUdGojbTuZJ9Erx7MGsKvLPA57gJZg1wFwPg1FZNRw==
X-Google-Smtp-Source: ACHHUZ79fk57WiN9IsKTbA5QWQYWE0tOwazGj1aGd3G1SO1So8vNiH+iKhRqGv/IkOWTOzTKHsThh8K2lne5W0rfosk=
X-Received: by 2002:ad4:5be5:0:b0:623:640d:2b30 with SMTP id
 k5-20020ad45be5000000b00623640d2b30mr3155718qvc.52.1684492384041; Fri, 19 May
 2023 03:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230518153214.194976-1-hdegoede@redhat.com> <20230518153214.194976-8-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-8-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 May 2023 13:32:27 +0300
Message-ID: <CAHp75VcnXs3wmE0waf6oQM2-sax83RaEh5ESi-jN9f7FpQ0HXQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] media: atomisp: gc0310: Remove gc0310_s_config() function
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 18, 2023 at 6:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> gc0310_s_config() used to call camera_sensor_platform_data.csi_cfg() back
> when the gc0310 driver was still using the atomisp_gmin_platform code
> for power-management.
>
> Now it is just a weirdly named wrapper around gc0310_detect(), drop
> gc0310_s_config() and make probe() call gc0310_detect() directly.

...

> -       ret =3D i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_I=
D_H);
> +       ret =3D pm_runtime_get_sync(&client->dev);
> +       if (ret >=3D 0)
> +               ret =3D i2c_smbus_read_word_swapped(client, GC0310_SC_CMM=
N_CHIP_ID_H);
> +       pm_runtime_put(&client->dev);
>         if (ret < 0) {
>                 dev_err(&client->dev, "read sensor_id failed: %d\n", ret)=
;
>                 return -ENODEV;

Not sure if it's good to have in this patch, but above can be cleaned up to

      pm_runtime_get_sync(&client->dev);
      ret =3D i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H)=
;
      pm_runtime_put(&client->dev);
      if (ret < 0) {
               dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
               return ret;
      }

But I don't know what will be the response on the I2C bus if the
device is powered off.

--=20
With Best Regards,
Andy Shevchenko
