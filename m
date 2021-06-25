Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E042E3B3A72
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 03:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbhFYBWv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 21:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhFYBWu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 21:22:50 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF850C061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 18:20:29 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t17so13621344lfq.0
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 18:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NbH0cG9k8DN70HKRTAPZb2YtWpYCF6cBf+PiKRTySjw=;
        b=bnB+bnv3pZf56r3gvI/pLvZ2jcJ+eA3Fh/Tu/h5AU7Z5yYOGry62pVLw3bxAOXoQ6S
         4jp9+l7qxmyULf18iaLO8AaiEdtTvVIA7GoxCzQTZsHgbl4PryuiuibWsED3qONtNhIU
         oquT/sCjxEe5TaG1ymkQCnmzOAYnhry6ln+6ZHYbUOYT4NjLCNqo6FycynTrV/cao1cj
         xbOOVFgtfbo+g8lRfGLCIoTFKXBqW2ozNcaIzCHaY3hiem0Zb9to28AUNEPQkYJ1EhQF
         kWUU+gBZa7qzis4Ju67Ah1LprdVL3fWu9l0PV9Qnx131E/0YW9A+WUSxG271GAQHQrAd
         EuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NbH0cG9k8DN70HKRTAPZb2YtWpYCF6cBf+PiKRTySjw=;
        b=FF6wdloaU1GUUcVniilAVgO7ZNFRbs1H1VQ8IcdQpZ6S2sw2L8JAwCZd+Yp2FZJp3V
         w0q01gYek25SCnkMWx49AdK7q35Wi7+jwufsh9iiwqSg98GRYXXQwxgXxa1f7Y/EuQvz
         u6N2Nz+bMPIinajfEu/muvOg6+ZVQLAwUvFzfMASc3Uz3saiY4kBDXUZcebNpkOs+v9O
         R4KrPimqzHpdJIP1ZFAU8E7DBuOQFPGA1y/k2uErDpvaz1Q881lE5RZ/7GwX7VD7U5AU
         48xcLzfTIKld8WmGxYT43jUq6JlTgRCK4jUqU2cFq7XGzcL2QjSAtaRLjrFCv/W7HLAq
         OXww==
X-Gm-Message-State: AOAM530PE7aHOMWlW0ZRYZPHEcJfdbvlgrQZIethKRmK7S6i6mwSB1zS
        G6cVI/0Z67JL7XxcSHYv1YW5hiJO5acKnAL4dbM=
X-Google-Smtp-Source: ABdhPJx5hw9AYX5xdlFvltj0rkKKceag6/yeDzuIx1JvvovTlxF/NTmfgujnn0cO3d9iUWgfz8/6dINBsD1WC+ZnRV4=
X-Received: by 2002:ac2:43b4:: with SMTP id t20mr6094158lfl.539.1624584028110;
 Thu, 24 Jun 2021 18:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
 <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
 <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com>
 <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
 <CAOMZO5CxDtPa_WYEJf9dkLa8x1UthicBqB=RBJUgxKud+srsDQ@mail.gmail.com>
 <a6322fe86be905c028ede9ee2abee278266e1b35.camel@pengutronix.de> <fec3a57d-6b37-e5dd-4586-cdacf311159c@gmail.com>
In-Reply-To: <fec3a57d-6b37-e5dd-4586-cdacf311159c@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 24 Jun 2021 22:20:16 -0300
Message-ID: <CAOMZO5DFfqLnF-5rAMdWkShVipG+tpssTVxDU-SQe6FsPkZqcg@mail.gmail.com>
Subject: Re: Unable to capture adv7280-m on i.MX6Q
To:     Ian Arkver <ian.arkver.dev@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ian,

On Wed, Jun 9, 2021 at 2:28 PM Ian Arkver <ian.arkver.dev@gmail.com> wrote:

> Page 55 of the ADV7280-M HW Ref Manual shows how the CLK and DATA lanes
> can be (separately) forced into Ultra Low Power State. It mentions that
> when exiting ULPS it transmits the ULPS exit sequence, though it doesn't
> define what that sequence is. Perhaps this sequence includes
> transitioning through LP-11 enough to keep the CSI-2 RX happy?

I measured the CLK and DATA lines and they are stuck at 0.

LP-11 means CLK and DATA at 1, right?

So this is what I tried as per your suggestion:

--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -505,6 +505,8 @@ static int adv7180_s_power(struct v4l2_subdev *sd, int on)
        struct adv7180_state *state = to_state(sd);
        int ret;

        ret = mutex_lock_interruptible(&state->mutex);
        if (ret)
                return ret;
@@ -512,6 +514,20 @@ static int adv7180_s_power(struct v4l2_subdev *sd, int on)
        ret = adv7180_set_power(state, on);
        if (ret == 0)
                state->powered = on;
+
+       if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
+               pr_err("**** Put MIPI CSI in LP-11\n");
+               adv7180_csi_write(state, 0x26, 0x00);
+               msleep(100);
+               adv7180_csi_write(state, 0x26, 0x80);
+               msleep(100);
+               adv7180_csi_write(state, 0x26, 0xc0);
+               msleep(100);
+               adv7180_csi_write(state, 0x26, 0xe0);
+               msleep(100);
+               adv7180_csi_write(state, 0x26, 0xf0);
+               msleep(100);
+       }

        mutex_unlock(&state->mutex);
        return ret;

but still see CLK and DATA at 0.

Any ideas?

Thanks,

Fabio Estevam
