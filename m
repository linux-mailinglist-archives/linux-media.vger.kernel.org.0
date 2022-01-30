Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360A24A3501
	for <lists+linux-media@lfdr.de>; Sun, 30 Jan 2022 08:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbiA3HyI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jan 2022 02:54:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbiA3HyH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jan 2022 02:54:07 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 108CDC061714
        for <linux-media@vger.kernel.org>; Sat, 29 Jan 2022 23:54:07 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id n14so6406202vkk.6
        for <linux-media@vger.kernel.org>; Sat, 29 Jan 2022 23:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FkAU6lQdJCRyu533F2eKn1uziP+6Ns8dvi8qW+5P7Qk=;
        b=j/q7eCoBR+ffNuf8vE1efLzGFwjI4BoJW+EVdB2DzQH0ekq3t2OmYRGir4h9G522bp
         852tEOfxo6HXMI5XYisae4+E/OhkohUKBPD2lJ0w1FQDPku6cpfXnoDD+HLwIirsBdQ1
         x+sBl7n19tXs3gfihXcwwnYXb1uzdjCwrrCfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FkAU6lQdJCRyu533F2eKn1uziP+6Ns8dvi8qW+5P7Qk=;
        b=cNpQzqB65UV3DM6NqK/zjZHZdO+WsVuoB9bZI+wP3T9Iegy4fapB7lVyuqBxt/kQfP
         aYj2rN5USVrjOZd+DnUIyEUSZPH7fW8+9F92Mv1rt74ybuaMOU57M62whjowdrpVNu6k
         YTq4GU4HkFgg0pI7K8kNL3DvgjIsH1wXzt4k8+LB7A/1H2LDfKhJ84vHOhSBiFivgIPo
         NJXU3j+wbyvkGERxptzFA2E5O0gE2PYe4k123RJR2oOenc5Ve1pwww7NeCkwk7dAmwM3
         x2ojHpRVgtunqdkMHTswExOUuwztgrWHXQbK3t69xgxVKXx3FyKv7LZfex00DO/p6+8B
         qz7Q==
X-Gm-Message-State: AOAM532xZc2J4i/MPYz4ElVI99CEcY4pxZwi3vJrWuzIRjLKJOLL/Tx1
        JoS+WOfdakvbNU+M5/7nvsyS81PZaH6NR9gHDEfMjXzXurQo3utL
X-Google-Smtp-Source: ABdhPJz+IzI61n3Yy0Da1LFHV3LA/XY5p4F2zP1ZNbGqvC8bcfAR+k6jajf69nkBqbvR4s+2ctZNQnrMKGowC6uBwjs=
X-Received: by 2002:a05:6122:21a1:: with SMTP id j33mr6165329vkd.34.1643529245970;
 Sat, 29 Jan 2022 23:54:05 -0800 (PST)
MIME-Version: 1.0
References: <20211201175613.13710-1-dafna.hirschfeld@collabora.com>
 <20211201175613.13710-2-dafna.hirschfeld@collabora.com> <CAFr9PX=6Pd1Rg=wJvpuX6WX63L=iAnwPA24e59An3Kac5f_vzA@mail.gmail.com>
 <cdd9b485-364f-c6bd-776f-a0ca2d260762@collabora.com> <e9905774-a994-6311-7b53-b40588d4f6ec@collabora.com>
 <CAFr9PXnnGc1TUQBeW8JW9qGewhU99gmRbvzZEsZaDmr12jMg0A@mail.gmail.com>
 <25e7d6db-1cff-6fd5-1071-1f21c5ff7a8a@collabora.com> <CAFr9PXkppeU-M2Sm7EQv3pO-1PzaD-UEckFWX=B_U8CKbzP7RA@mail.gmail.com>
 <b06402c9-e27e-f6e0-abd5-688106a36ba6@collabora.com> <CAFr9PXnn5EnApGk7vYcFEF0+J6kojhNTMspNnM8asN512fkTew@mail.gmail.com>
 <1bda0f7f-94ee-e598-4b92-d46512cba491@collabora.com>
In-Reply-To: <1bda0f7f-94ee-e598-4b92-d46512cba491@collabora.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sun, 30 Jan 2022 16:53:55 +0900
Message-ID: <CAFr9PXneg5uchB33aTTSuz4-+T17QJDoDXZWN0D0VhNLNiqpGQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] staging: media: wave5: Add vpuapi layer
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Bob Beckett <bob.beckett@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Fri, 28 Jan 2022 at 04:49, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi

> > I have some messy notes here of what I found out so far, some dumps of
> > the vendor driver running etc:
> > https://github.com/linux-chenxing/linux-chenxing.org/blob/master/ip/vdec.md
>
> I see that you test the content of 0x1f344000 with 'devmem', what make you test this specific address?

In the binary module from the vendor instead of getting the address
from DT they have hardcoded it in the ioremap() call to map the device
registers.
Just after that they add 0x800 to the resulting address resulting in
0x1f344800. I think they are trying to ioremap() at page alignment or
something but the registers actually start at 0x800.

Cheers,

Daniel
