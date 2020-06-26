Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A3C20B79D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 19:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgFZRy4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 13:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgFZRyz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 13:54:55 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BA9C03E97A
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 10:54:55 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id m21so1106795vkp.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 10:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1qD3KVkXnYibTjsaAgmcZSdRbn2Y18NBXHjiQeEF9wg=;
        b=B6/awEVYKhJPTASGgXfO5UVrcQSDtOJ7jSnX+jkp7TlOwCf0cuVKPcSQpy8i8dy0RN
         nWhQYV6IokwDwZ/0j7j2lcUO+H77B+Y8eUWlDMmE8tZBZ20nHoPr7nSQ8uQvVl8eVZ38
         tvknxOPkNUJPIyPLQIrYqjyz8swc0blEH05n6lHQCsx+qO8475UWGDhmvtDtu2njfdlc
         BgkCOHhPMIqXRe5V56TjivnCXCE/NpZh/1+fXXHEjEb+7mVCKSNcEA7Dz6GWn2kOPLQV
         4NFGWtyVvaVDF2FCfSUhVi32y4OCqTqlGAtzrtWlyyLC+i6HO4azGd/ZINCVT1yLV+b8
         nKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1qD3KVkXnYibTjsaAgmcZSdRbn2Y18NBXHjiQeEF9wg=;
        b=kHAZxR98UnFg/sbCgzFzyfeGwW2m2PDOrsi657uVnNzE5LGBAt70kEF/Jj6+ZjMymV
         uB2Njd8p7g9p7PevCTqsJP2J1oKGMp9erlNlHI1GmkEgU+CPRvT3E0O2OYAGDQinuTj6
         U7uzJS0qeLAOsIwx1pXVD9dTDsWViUHtLSJnKMkzerXGL6aOGlSbFjUbSdL+Myj792So
         4yPY+RigaYAaVPYDDYFp1vkMqRWSPU9Y/tkJHrM22jCxeFbIURW8bUB7+7CmP4uzXFyz
         zVSRGsTBFXdmwc276v0q87rZx6hzkV364COudHEZ+3hD5Y9PdtFPN9KxJfGaqHIiqhps
         4MQQ==
X-Gm-Message-State: AOAM532V1NkfWdmcGi0TUSm/PaghotflP/YtUcjARssxBO1Pvw7aL0yQ
        sHw9SBCZvsLkvdR4/lNFw8vvU63YgKcTGYfNxe1x8M4OXys=
X-Google-Smtp-Source: ABdhPJwiOb/wLf1nowalZL6/pEFiffJALmi2srL2qqAqw5gcyvTLONOvTS1pulD+ut4ADIwMydLIXpECbzOvGIBVleE=
X-Received: by 2002:a1f:9445:: with SMTP id w66mr3055581vkd.22.1593194094727;
 Fri, 26 Jun 2020 10:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <11fbc112-c410-8c67-9bcb-9450924d12ef@free.fr> <4904d37d-1cd4-b8f3-9c3c-82eb4569bca7@free.fr>
 <778d08be-b606-018a-c2bc-164fbbc33615@free.fr> <71c3a7c3-0661-c4ac-6f72-8409fa38211b@free.fr>
In-Reply-To: <71c3a7c3-0661-c4ac-6f72-8409fa38211b@free.fr>
From:   Bradford Love <brad@nextdimension.cc>
Date:   Fri, 26 Jun 2020 12:54:43 -0500
Message-ID: <CAA0YaJRs-HHO8NnoiVBujmcYXtJ_5CzrwBqkJ3vLiy1zWK+ruA@mail.gmail.com>
Subject: Re: Scanning for TV channels over DVB-T and DVB-T2
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jan Pieter van Woerkom <jp@jpvw.nl>,
        Antti Palosaari <crope@iki.fi>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marc,


On Fri, Jun 19, 2020 at 3:15 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 10/06/2020 17:22, Marc Gonzalez wrote:
>
> > FTR, on IRC, Brad pointed out this patch of his:
> > https://patchwork.kernel.org/patch/10744999/
>
> I suggest the following patch on top of Brad's patch:
>
> Author: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Date:   Fri Jun 19 22:09:26 2020 +0200
>
>     si2168: wait for carrier lock before next step
>
> diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
> index 31d3dc0216c2..e127e842f671 100644
> --- a/drivers/media/dvb-frontends/si2168.c
> +++ b/drivers/media/dvb-frontends/si2168.c
> @@ -152,6 +152,11 @@ static int si2168_ts_bus_ctrl(struct dvb_frontend *fe, int acquire)
>         return ret;
>  }
>
> +static bool carrier_locked(struct si2168_cmd *cmd)
> +{
> +       return cmd->args[2] & BIT(1);
> +}
> +
>  static int si2168_read_status(struct dvb_frontend *fe, enum fe_status *status)
>  {
>         struct i2c_client *client = fe->demodulator_priv;
> @@ -180,6 +185,9 @@ static int si2168_read_status(struct dvb_frontend *fe, enum fe_status *status)
>                 if (ret)
>                         goto err;
>
> +               if (!carrier_locked(&cmd))
> +                       goto parse_response;
> +


My original patch has been well tested and is currently deployed in
many thousands of assorted systems across Europe. Unless you can
guarantee that the frontend switchover race condition will *never*
happen *ever* across any system, including a large amount of
architectures and array of cpu types and speeds, I don't think it's
beneficial to remove it.

Hence, I'm very hesitant to deploy your patch and break this auto plp
detection for someone, just to save <=10ms.

Regards,

Brad



>                 if ((cmd.args[3] & 0x0f) == 7)
>                         sys = SYS_DVBT2;
>         }
> @@ -206,27 +214,10 @@ static int si2168_read_status(struct dvb_frontend *fe, enum fe_status *status)
>         }
>
>         ret = si2168_cmd_execute(client, &cmd);
> -       if (dvbt_auto_plp && (ret == -EREMOTEIO)) {
> -               /* In auto-PLP mode it is possible to read 0x8701 while
> -                * the frontend is in switchover transition. This causes
> -                * a status read failure, due to incorrect system. Check
> -                * the other sys if we hit this race condition.
> -                */
> -               if (sys == SYS_DVBT) {
> -                       memcpy(cmd.args, "\x50\x01", 2); /* DVB-T2 */
> -                       cmd.wlen = 2;
> -                       cmd.rlen = 14;
> -                       ret = si2168_cmd_execute(client, &cmd);
> -               } else if (sys == SYS_DVBT2) {
> -                       memcpy(cmd.args, "\xa0\x01", 2); /* DVB-T */
> -                       cmd.wlen = 2;
> -                       cmd.rlen = 13;
> -                       ret = si2168_cmd_execute(client, &cmd);
> -               }
> -       }
>         if (ret)
>                 goto err;
>
> +parse_response:
>         switch ((cmd.args[2] >> 1) & 0x03) {
>         case 0x01:
>                 *status = FE_HAS_SIGNAL | FE_HAS_CARRIER;
>
