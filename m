Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42BD62DE6CD
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 16:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbgLRPk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 10:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgLRPk5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 10:40:57 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE0FC0617A7
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 07:40:17 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id c22so1526985pgg.13
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 07:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W5cfQDENYj1zC+KRdbpt/FRQhst5DqS6d/t7/4d8AoI=;
        b=HBLWGLLCMh5syteVxtlvY5g8nEDRSCtSgmJN9ZtoUn/wdddQNDZVx1iqPt33RUIa2g
         0Tj3fMQSX4HdzeLGey5ia0H/ObjRFDrTpr+0Mvz/rQPnDLVt2rfvRrGT1kUE9L5wOY3B
         m+Zop7mlbLTsrrsmS0AaIidQ3oQaWwhpbBGeZD5XHPwMptf6clqF5yb2MVvMXLQ8Lhy5
         YFCmmZL7Of5VDa12ELUvnKJIOUP6eFIQ6wvjdTwAQE7APhdC58SPVT7AydrjidtfwOtw
         ETz+2EYsIsFgSgg+8nNkmEixX3chqIdNLmDyY8rwXb2V2KbhnmQGaif0BZGvHwrFy05u
         SHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W5cfQDENYj1zC+KRdbpt/FRQhst5DqS6d/t7/4d8AoI=;
        b=V9DaG8DiYYIaFT2DoqJlZf6mAfhEHWrQjzLapkEwodhRhdY0Fwd3nSaLsIdxsiZEW4
         i2U4VHW2HiCeuQHz7jda9o9qkhM+IrbKGy38v9Wf8osqKhjEgCmlqNKrj75l7DqMyEIi
         WWfmexrcYcgMfMblNYOFYn8/v1CsgSbG2/JSCS+IUYTUrrTx6rYG5cdjVtZIP2tGKMGD
         hdGCvg2WRwpeK4dezCcruGb/unpjk9T+CAS/d39Yd/q6Diysy/5IAb7/EF0ryVN+T93w
         3UQSX2YAITGKuzpshtVSm+dVFqhhIXbiaYZe6aqbbRrS8/vD34TtPc2DufOVQVhgNMvd
         vkcQ==
X-Gm-Message-State: AOAM532XF9eLqdUAhHMmehCFBR9jgdSMOO2iN/q+HY/X8pHOxxjsp94K
        ohf51oBZBLsNf/mAN6PbZqRQmQbDI5QGPAVAuDr4/YKDQxU=
X-Google-Smtp-Source: ABdhPJyNEyXwCUqykaIFvktgHfjyBIgjvV60i8B2vrOtgrEoODDLE7d8SkgnS6gtvismnyeOEscqfumNtRq/OVOtAHk=
X-Received: by 2002:a63:b1e:: with SMTP id 30mr4624383pgl.203.1608306016875;
 Fri, 18 Dec 2020 07:40:16 -0800 (PST)
MIME-Version: 1.0
References: <CABJpdbjMNKKw55KjJH-61Dg4L1vAa1_J91tfkL_iFt6PGDboBA@mail.gmail.com>
 <CABJpdbhO=-icjEshgEeO3rid3dv8dPMsAq+S=zu1fsrQkxfi0A@mail.gmail.com>
In-Reply-To: <CABJpdbhO=-icjEshgEeO3rid3dv8dPMsAq+S=zu1fsrQkxfi0A@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 18 Dec 2020 17:40:00 +0200
Message-ID: <CAHp75VfwVx3fmsv1Mb14aXWQrjcAuXBQ92kC8+OxByxayCxP1Q@mail.gmail.com>
Subject: Re: Working UVC device
To:     Andrew Reed <nefarious.aurifier@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Cc Laurent

On Fri, Dec 18, 2020 at 5:00 PM Andrew Reed
<nefarious.aurifier@gmail.com> wrote:
>
> Good morning!
>
> I want to report a working UVC device not listed under Supported
> Devices <http://www.ideasonboard.org/uvc/#devices>.
>
> 046d:08e4 Logitech, Inc. C505e HD Webcam
>
> Thank you!
> -Drew



-- 
With Best Regards,
Andy Shevchenko
