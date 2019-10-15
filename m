Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 814F0D7AD3
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 18:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727501AbfJOQH7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 12:07:59 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32825 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727421AbfJOQH6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 12:07:58 -0400
Received: by mail-wr1-f65.google.com with SMTP id b9so24595759wrs.0
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+le0M9/4n5UhYnsCppOwr6SCGBhqAkxkpa4KhDbXJKc=;
        b=zEtgCIMhMBLZzPPtDCU68n+07tF4BtuaDTzhfoWMJA346BezexUsTA46QyPzQRqFCo
         +slxAyZOKmRFBepJOsvrfkFw6EQXBbj4SEHwdqZqNL+258a3liSCzryRxW6HL316BQTD
         016C4dIUnrl+BZMmRsZQNST7+s6+gf7k6xDZ+BtIhLt0Q13iUhrpJcfYRfMf7NkSmX0d
         Zb+TdocPfZKX4uC1AGxyPfUM+tfG5higXOM+0XQqjW4qg7Ob/2NmeZsFhQ2tyhN8X8zl
         PPwQ875fQwAfV+GvZc4/3Ht47APA8oglzVKruATktWiC/UpAZn2JHrshpt1dRA8309QS
         KHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+le0M9/4n5UhYnsCppOwr6SCGBhqAkxkpa4KhDbXJKc=;
        b=JT02wwOLx0RJga8cs2gq2sfumBLmTW+RnAlIVwNqJBeSpgwr3ILfosOdlhZ9XLfrEZ
         J6uvS3TFFBfAsRUBO912dkhyYqAo+ufMMsFjX/IUJ8ADqFcRlWhaOsnJeqgW+KtiJ/Pp
         S1vHWcPiSoOuRaTbDXNrMaC4RWNoGHwXlyx4JcHh8xEACYtsJAi6MqlWhmdZPJR3HS2h
         bDiXC/IjdbzKMPtFTfOwUUEPTPjWPFnr2g8bI4AcRb8FDKm1DOyGwM48OQuCOymJFU9M
         8TKYeWPn6WwI3zq7S+5VisBX8Y1rarqXJjDhQKqA9JHJnsb9Sm+OB8fwCXJDLO0CpcI6
         yI0g==
X-Gm-Message-State: APjAAAWteQfYTaelAQIFkY+lW1B+eG7EV+31pt1xzDF92PEh7T4hBbqE
        RnupRvV7iyi7uDQIHU5kWHED0VOQBSru8IcBPsRGRA==
X-Google-Smtp-Source: APXvYqyq+Ui0chwUTJb/RuOyaHQtvv22kGYhUhjjTxsZog8KlpfcNgC4OWQ5gO0GrhRlaDDaYePFei5bmDIoRfQwiCU=
X-Received: by 2002:adf:94e2:: with SMTP id 89mr680019wrr.259.1571155676687;
 Tue, 15 Oct 2019 09:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191010154417.9437-1-festevam@gmail.com> <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
 <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com> <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
 <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com> <CAOMZO5ABOV+Z7FenZykU82w-yUvae6zm6d6inN8SYrhViudYnA@mail.gmail.com>
In-Reply-To: <CAOMZO5ABOV+Z7FenZykU82w-yUvae6zm6d6inN8SYrhViudYnA@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 15 Oct 2019 09:07:42 -0700
Message-ID: <CAJ+vNU22JmDQ+tyRFSQgM_wp-pgfE7gOt2i3QbdOJp0KuDXfRQ@mail.gmail.com>
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180 instructions
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 15, 2019 at 8:53 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Tim,
>
> On Tue, Oct 15, 2019 at 12:49 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> > Fabio,
> >
> > I assume your seeing the same rolling video issue on capture unless
> > you discard the first few 'corrupt' frames? I'm still wondering how we
> > can address this properly upstream.
>
> On i.MX53 I still get the rolling video even if I discard the few
> corrupt frames.
>
> I tested the same i.MX53 hardware with a vendor 2.6.35 kernel and it
> captures correctly, no scrolling at all.

Right, I understand there is something else going on with the i.MX53
but what about the i.MX6 testing related to these patches?

Regarding the i.MX53 as you have a kernel that does work you could
start looking for i2c register differences and csi config differences
between the two kernels. I discovered an issue with the adv7280 by
comparing i2c register dumps.

Tim
