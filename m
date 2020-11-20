Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762D22BAB23
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 14:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbgKTNb0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 08:31:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgKTNbZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 08:31:25 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F5FC0613CF
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 05:31:25 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id w142so13446627lff.8
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 05:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kLH0OGgbTBQgr1BhqOOxL+SRFwucXklLFSza60U5gmw=;
        b=JKEUq0NEzlifFWaBA0D5lpOCB04lQlGFemaSKS3XzHa6RVCpvPxPOYXGJ7003oIDTI
         dMmWk6pBpkgepW/ySiTZemD8gvfPu4w6wimX0PYxJ20vLsk3gl41t2vYIqYJ56rTHzkK
         d8JZRqwCu6nxm4e/30FpGxqx+wiAOCDO1E9Qt22yKm9Shm9O3u3VdlJpBTT7HE5O/SK8
         yTrFPuK9h+rL1z5/UR80zns/AJcIB8M8HLavZRzmpJaEqBO5HrH8hKEPVRLVFM9dlZfu
         HnAH9MOd2N/ZjqcndFEklFUVo1V0haiHnnQ8xv3+54jY4sGe7j084GdI8DSRlLCTd+Fd
         4BrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kLH0OGgbTBQgr1BhqOOxL+SRFwucXklLFSza60U5gmw=;
        b=XwWE0/O3mNJpYYKSeIksbq++bkAteCQrebmSs9sgj4rWL136pTbxbmGhEwSQSKymIS
         FFsr78PJ26Q7wfgWuId0qVuNsfKvP1RatGq1ulss29A9iXXsYlZdJ2eqEqpXMUGLkSlk
         q81kAC7T1UzPh74kmfntK1aLdNMGjMNn5Ynh/B+j6U3q7ZFeziWhjW0Ts/qWUNuuQD+v
         kWID84Jk8C315zd25gPXaMpqswJk65tTOUnjjybE2iZ1sKypCNzlfcIfVDlUKnMpFN+F
         KvoloFz3BoOBUaOKqrHnMBfQfan75L/Pe+8qeKEIv4DWHf7rTuk5pW2EtlsjAIBej4Zc
         kJFQ==
X-Gm-Message-State: AOAM532CB+RPIMitvLLYeAGnSsJ9X9qcy5JDp0WJID/KcaovaJSHBat5
        FlPaFfQfbqj49gMoouoxTUqakDA+aVFUCR/IapI=
X-Google-Smtp-Source: ABdhPJy+LkcPERZsa7lbfU5qX6+D00AemKwTfYvzLQ8Krd9kR0rfrY7Qk4AvsVLPh5AlaJe2YaADA055SMDxj7jipqU=
X-Received: by 2002:a19:207:: with SMTP id 7mr8578863lfc.251.1605879083895;
 Fri, 20 Nov 2020 05:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20201120001509.15155-1-festevam@gmail.com> <87ima01r52.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ima01r52.fsf@mpe.ellerman.id.au>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 20 Nov 2020 10:31:11 -0300
Message-ID: <CAOMZO5CrtC627GJ=fM6Wruf765pfxAGboPJhfDrhYG5a2OjpRA@mail.gmail.com>
Subject: Re: [PATCH] media: fsl-viu: Use proper check for presence of {out, in}_be32()
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, paulus@samba.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linuxppc-dev@lists.ozlabs.org,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Fri, Nov 20, 2020 at 3:25 AM Michael Ellerman <mpe@ellerman.id.au> wrote:

> I'd rather not have to carry this in arch code just for one driver.

Fair enough.

> Can't the driver just use ioread/write32be() on all platforms?

Yes, this is a better approach. I have just a patch doing that.

Thanks
