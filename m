Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005BA37F3D5
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 10:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231829AbhEMIGb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 04:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbhEMIG3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 04:06:29 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE55C06174A
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 01:05:16 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s25so8125484ljo.11
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 01:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YGYhlEtHJ4cDIvOhyvkm1Ik0yqS7El9eC6BJ8CsVKBM=;
        b=R4HgB1qbhtCEbNxBfKElzO/lZ5CpsVCPCWNCWhThJU/+wTDVcDWWFQywbKGfht7LZF
         MKeaPQXJe61GjYKxoSZ6ZCNDqlfM261JYubKxvrFPfFDhARR0nX/CwaG6icsukv2EJPt
         WZ8HLr/Z2RlsnhLSq2SFo/ZWb2QBId1KIYw8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YGYhlEtHJ4cDIvOhyvkm1Ik0yqS7El9eC6BJ8CsVKBM=;
        b=ubH96uspfYSQZSnrP7+Zze15c0JRUIE4WIy3CpqgeNHUlGBAWtwmmVYKE5w8U8HQHz
         DXrqK2SQ7+a9qIZhYI2c3JYcccxBE02ShG4WV4nQBbREv8ruk7r0P+WSdDndJTnxUNRK
         aJM/uLZQnaMv4Q0JAga7nb+E9MYcWdyv74TjK7elolJMBbcDAVscBkV2nG3PirzeTWHi
         wTEXrzg/UEFI/IDpDNQ5c3AQ/F92NfN30h7b/gyrgK1etAXZA1iV+ilCBd8KaymkjDn+
         7AFHEHmhRiquWfhT4Wk2keZJBYttI3TER2HhjYv6kBZO2keYO3MOSO3ytIEUB1mu3tMj
         Di8A==
X-Gm-Message-State: AOAM533jSl5GanIz7vb57wOeKye+amogvRqScNO4KB7NtlDrefc2P71L
        0oBj+qQlzEi5hrv9kYuKjAjqdgSTj0n1nQ==
X-Google-Smtp-Source: ABdhPJzk4KekOdcbSJ7XmwVYYmE2SRdkeGFuhLl61uT+ycn88sLzG2aQR0rtqFgN+o/0PcHtLoswQQ==
X-Received: by 2002:a2e:a401:: with SMTP id p1mr33076830ljn.142.1620893115261;
        Thu, 13 May 2021 01:05:15 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id x12sm212538lfn.258.2021.05.13.01.05.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 01:05:14 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id w15so32768948ljo.10
        for <linux-media@vger.kernel.org>; Thu, 13 May 2021 01:05:14 -0700 (PDT)
X-Received: by 2002:a2e:5345:: with SMTP id t5mr33513099ljd.259.1620893114204;
 Thu, 13 May 2021 01:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-8-acourbot@chromium.org> <faa5553f-2ea5-27a5-7f85-e1418d2c7df1@xs4all.nl>
In-Reply-To: <faa5553f-2ea5-27a5-7f85-e1418d2c7df1@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 13 May 2021 17:05:02 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUKtxCS=JbtBmvwwEovrN8NCtLmMGcTkozo_gnDMRsqHw@mail.gmail.com>
Message-ID: <CAPBb6MUKtxCS=JbtBmvwwEovrN8NCtLmMGcTkozo_gnDMRsqHw@mail.gmail.com>
Subject: Re: [PATCH v4 07/15] media: mtk-vcodec: vdec: add media device if
 using stateless api
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, thanks for the review!

On Thu, Apr 29, 2021 at 4:28 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 27/04/2021 13:15, Alexandre Courbot wrote:
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > The stateless API requires a media device for issuing requests. Add one
> > if we are being instantiated as a stateless decoder.
>
> Why for the stateless decoder only? Why not create one for all?
>
> It's not a blocker, but I would recommend looking at this.

Would there be any use in creating a media device for a stateful
decoder that does not need to use requests?

Cheers,
Alex.
