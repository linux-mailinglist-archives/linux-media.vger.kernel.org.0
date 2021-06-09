Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1BD3A0A16
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 04:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235194AbhFICiQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 22:38:16 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:33752 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbhFICiP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 22:38:15 -0400
Received: by mail-lf1-f41.google.com with SMTP id t7so28331015lff.0
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 19:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bLGU2KpjmAe/JtBE8yHGmbJwMTo/VzLsV905Rb8/7Ow=;
        b=mIpXPAWbc141SNboEMqLjBqfmwjOBESmzcduL+XPeOAM6pcXDCEigvQyLmKCAnmSfB
         4eKHzjXOT/STIza003Vx0w9aubj0i5vlF9jJ1fj57sgrScFke7yr5BbpWV+iKkcOfMOZ
         I/3Y2s4JifxKL/efTNfLccssp3A9vtqLF5MPJ4zq7rlSd2i6lclU50WR2oi4erDPH/Um
         yJlNXdr0OVk3P3JDt6T1djzc7z4D/m4D0UpPYRFgb44W5GcFbSncLGO4DhBlc9alHIo0
         hbM/yszokNHb3L3wbVL+lYxNmEahf32W3dJkl0uH0fe0mnPeJgMQ4Qfb39TteQCcivv1
         JDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bLGU2KpjmAe/JtBE8yHGmbJwMTo/VzLsV905Rb8/7Ow=;
        b=NnjF6mlBQHuOe3tCGIxOgauqLCFx9RtaiihPygIZvfaoLbzlfrhU7gO6I+Jly1+N7K
         YApwTNhQYLAm7M/1xF+fVXh15wGmNBtJs+HQfnUgGZSt+J5vlXRvnzkEiRyBTHSP5QJb
         iNrCNG4UIRN568PvuhoJKK3kZyxj9A5XnsgLNfgSHQzsEqsrwstFgCDsOZKed6Ubx8U/
         BIDnSoXtj/CUSNSMsfgumqmLRjPIxraBEMSdt7x3fX55Ja7+6MNw53cyKrYsuDtnj/EJ
         Kb9ucldfKmrvGDHDFt/SD+3C04h9KvjLaMduiEy1c+dSEyOf04nvU45c2/pWIAlpZr7X
         v8pQ==
X-Gm-Message-State: AOAM532AT3dAJI0D4+MBPahFB8NGcNe7OX23+GlJ458Ko6FrC9nPw6bi
        0n+9ckoJZRaXISCpP7TVxsIQ4UtebNNCRA+vHSc=
X-Google-Smtp-Source: ABdhPJzxZgtW+O6xRDxIL0BdEzVVC6g1A1uPyhYRxHd7HWQ6MDvKyZgPyMAeIHzrXLZe+TlkXgKftg2ZfLPS7v12aU4=
X-Received: by 2002:ac2:5ecc:: with SMTP id d12mr17912198lfq.539.1623206105826;
 Tue, 08 Jun 2021 19:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
 <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
 <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com> <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
In-Reply-To: <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 8 Jun 2021 23:34:54 -0300
Message-ID: <CAOMZO5CxDtPa_WYEJf9dkLa8x1UthicBqB=RBJUgxKud+srsDQ@mail.gmail.com>
Subject: Re: Unable to capture adv7280-m on i.MX6Q
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Tue, Jun 8, 2021 at 4:09 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:

> The i.MX6 CSI-2 RX needs to see the LP-11 low power state on the lanes
> during streamon (before it calls the ADV7280-M s_stream(1)). That's
> where the LP-11 timeout error occurs.
>
> According to the ADV7280(-M) datasheet, "after the ADV7280-M is
> programmed, the clock lanes exit low power mode and remain in high speed
> mode until the part is reset or powered down."
> So it appears the ADV7280-M has to be freshly powered on in s_power(1)

What do you mean by freshly powered on?

> for this to work. Is the ADV7280-M powerdown GPIO connected properly on
> your board? Moving the CSI-2 configuration from s_power to s_stream was
> exactly the right thing to do in my mind.
>
> Just as a test, if you remove the CSI-2 register writes from either
> s_power and s_stream from the adv7180 driver completely, do you still
> run into the LP-11 timeout? If the CSI-2 TX never leaves the low power
> state, I would expect seeing the clock lane timeout instead

If I do this test, the first time I run the pipeline I get LP-11, the
second time I get clock lane timeout.

Thanks,

Fabio Estevam
