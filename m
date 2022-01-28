Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B1C4A0048
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 19:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350588AbiA1Sn6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 13:43:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237624AbiA1Sn6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 13:43:58 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AEB2C061714
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 10:43:58 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id h7so19013459ejf.1
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 10:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wu/ay4E9lFB1VmCBD6cJubfyqWluV+w+vRBH69p02yA=;
        b=Ok+safF4Upmjd1vL0B4NCCO/ozKiX6zXvMbObCCO4JmIx9aK+FVRZc1gAURsSyf7Uk
         vc7aQCTDb6bXXBxGJlrok4Z+PrMq9bXLf6ef239NuTDDXW6insGx9TwJyR+Hta7hyTjj
         r1qmOHH/0pWp76uHe9odoum1tdWBWDYoux2oghJZRm+ZM2039knmm2wrqScWUZDZYPfc
         6KCh6e0fJoL7XhYMfvdomTXuTdd8/XThhjm70qlxzAOcNxxGMXvieXSJ291DDb5nlYP4
         kx58HZ58Foptlyrp9WAe/ErEPqvcwcwZs3xgLoDlBD6n1FT6HnB/iBV16StwaH2EJkf2
         1Ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wu/ay4E9lFB1VmCBD6cJubfyqWluV+w+vRBH69p02yA=;
        b=WWZT6rP9TaWC4prkfvahHAjnPDBYzVSe1KxtpkIvGJPQvfNbn3Lt5McbC9w0nkcn8i
         Uk0Eq6mULRTt7zHUuy1Jqz3Mxvy8tEBRAKuIbsizIhZptkBmgUvva6Qd8g0F7cewr5f8
         AzvjvWirLZ2NEKk/aHuFYccvZnIO9i8tA3OSJM3KOFpo/8cvP+GQRqs68DJlji6J/5+W
         cCZKWvQ4U0YVs7hYcYYacFLUFG56cst+InE5DzL1Ez9o7CSr+H2x8WMacnjSIPd6QGMx
         /7luigv9tB8/b/tG4hl8B3XV1oXCyM07zQ4YT/Ry+cVswO6GtlrFosJJL7qxepknDNAV
         QVNA==
X-Gm-Message-State: AOAM532jom0qH5pZL/Kk3M/QDxbRjUHQlqPaWoEwXa07EaD8ii8BNxgK
        cokS8mRuu6jcOZK1656Lyz3WJ2DjK9+RnQ1HVHE=
X-Google-Smtp-Source: ABdhPJwK53LMunb/dyXhTv6Rf4kaqnI2Rc6miGxLkhBnFWzmGQGPEsm9lDfU3Q7Cul0EGJbF705c/UQOnJEd7mQk+pg=
X-Received: by 2002:a17:907:2ce4:: with SMTP id hz4mr7058443ejc.613.1643395436283;
 Fri, 28 Jan 2022 10:43:56 -0800 (PST)
MIME-Version: 1.0
References: <c86506596c9126da6f2df02eb6680759064774f2.camel@ndufresne.ca>
In-Reply-To: <c86506596c9126da6f2df02eb6680759064774f2.camel@ndufresne.ca>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 28 Jan 2022 12:43:45 -0600
Message-ID: <CAHCN7xKxyZGoQdQ=6uOHpd4COV2CV5b=bbCAhv5cyQCspPf8QQ@mail.gmail.com>
Subject: Re: hantro: g2: Does the postprocessor needs 32byte aligned width ?
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     "jernej.skrabec" <jernej.skrabec@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        kernel <kernel@collabora.com>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 28, 2022 at 12:35 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Hi Adam,
>
> Jernej and I had to deal with user report which show a stride issue with the G2
> on Allwinner H6.
>
> https://forum.libreelec.tv/thread/17565-nightly-images-for-a64-h3-h5-h6-and-r40-boards/?postID=166086#post166086
>
> We quickly found that the stride alignment set to 16 needs to be 32. Though we
> noticed that this is only needed when using the G2 postprocessor (NV12), while
> it worked fine with tiles (NV12_4L4).

Out of curiosity, would it hurt to make the G2 alignment to be 32 even
if it's not required?

>
> We were wondering if you, or anyone here on the list could test this on IMX8MQ
> and IMX8MM. We'd like know if this is specific to the older G2 on H6. To trigger
> this, you need a video with a resolution like 1552x1080 as used in the report.
> We can help you get one if needed.

If you have a video you want me to try and instructions on how you
want me to test it, I can give it a shot. The imx8mm doesn't have a
video display driver yet, but I think the imx8mq does.  I am not as
familiar with that board as I am with the 8mm.  The testing I have
done to date has only been done with fluster.

adam

>
> regards,
> Nicolas
