Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE19171495
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 11:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfGWJHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 05:07:09 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:46447 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbfGWJHI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 05:07:08 -0400
Received: by mail-ot1-f45.google.com with SMTP id z23so14952758ote.13
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 02:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cY8sjcGzkjGpYXy56oybS28z5LLtA4K6SCXXAvfRe2E=;
        b=uqkmjIbsogePtvYs9GO+N4/A8fJSW0Ek+lWmpCsvgjfP+0oG7BVYNTToxaj7anP/l9
         b7z2ddT/RpvDNCd4Iz07cEhxn11oTYirQqRd27CSVgFQGHRiXUezcEX4k6wLPtxwjbw1
         CGiy52l0mnkmKbj+Z1DMQM/mviJa15xeFyYo6DstuSXK2CCjyfZgiiAuZZUNkTqWi37O
         6INOvTEr97a7uT0mBbyo+1OUN57aj4O1vSi2/vmJEkq8fvVIbEY4NA3lYIe8oK8/WNEc
         8zoM/bMyO4jwVVwRt6LS1C1AouWO8Wn+JCqFaNEZvwbvyRnBf1TA9tVAta7mYjlncUsy
         tKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cY8sjcGzkjGpYXy56oybS28z5LLtA4K6SCXXAvfRe2E=;
        b=fXDoOACNtOn+phGBCJvALuphk4Ysook71BH8GJ4yriUI7fPJEEOLgQiyhsCDof82ZO
         P8zmWSmsgqaOMS5AC5Ld77piBzPqAZs6EJOha1heHalAR6vX9CgIZc6TPWLTAKHfwSrG
         kddCwvf6Py+C3CeC7B+WW4xsmT5v/G/V6slag5yi2Z0jpDImzFzt7l62gWpBf38XW/Mr
         8A+7SYQTPwz7CVX1wI5PsTNFab1Z7c1/mmGh6EPOnSnWDiitWG3/Tm05gMNAbYaiVpV/
         1i5xKHHECEnBk+X+jsJyFzMlmjOvwmlZ+KqmBpAsiZxA0ZQ4uCfGiBzNmIZnbLSgnObB
         VXUw==
X-Gm-Message-State: APjAAAVG/bIqqVaoUPF5hlKazLeebY9PJ/3KnX06ohmQ5uvmzGBlWJzl
        Mjuv6NzNUifkAONAogmOd4I5teHI2k6FplCxdoc=
X-Google-Smtp-Source: APXvYqw2fDyUj+VIWq+/wMSin7/ZcFvh1Bu7oPU2BVFAyvIbGrClk2D4QYiKyAtKmhPMb8eFT1dPIPe68w4NINMuOwg=
X-Received: by 2002:a05:6830:157:: with SMTP id j23mr31867144otp.198.1563872827723;
 Tue, 23 Jul 2019 02:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <93050d86-ec75-8394-4fdb-6a06ebb5ce6b@xs4all.nl> <cc1790b8-4199-e0ef-afb9-36eca9fd5c0a@xs4all.nl>
In-Reply-To: <cc1790b8-4199-e0ef-afb9-36eca9fd5c0a@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 23 Jul 2019 10:06:41 +0100
Message-ID: <CA+V-a8tK+YGf7ww27OzM6FuO_4hwbz0eOvqFKgGe2cdiULzb6A@mail.gmail.com>
Subject: Re: [RFC] Removal of drivers/staging/media/davinci_vpfe
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Jul 23, 2019 at 9:48 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> +Laurent Pinchart
>
> On 7/23/19 10:46 AM, Hans Verkuil wrote:
> > Hi Prabhakar,
> >
> > This staging driver is now almost 7 years old, but hasn't seen any real
> > development for a long time.
> >
> > I think it is time to remove it, unless you plan to do work on this.
> >
> > What do you think?
> >
I don=E2=80=99t have any plans to work on it anytime soon, and also referri=
ng
to Sekhar's email
on Arnd's patch he's OK too drop the driver from staging.

shall I create a patch doing this ?

Cheers,
--Prabhakar
