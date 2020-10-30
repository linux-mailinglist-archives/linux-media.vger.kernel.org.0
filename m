Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B311A2A02AD
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 11:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgJ3KSz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 06:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgJ3KSz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 06:18:55 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F75CC0613D8
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:18:53 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 32so5115826otm.3
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qSrgT+Sq6ixZqGRM1ApDzYbdNLSfueKKt5jrYnIpTKg=;
        b=J/brQsIEXjkMtFsYYqBCMbN7+7Cmh0sjVyNHa6GCk49DXyvdvhr/CvjKzFrLjPezzh
         Ks4w2XDcjvzJb+PPrLEQgUhcZX1Jm9QbzrgXNMykyjrC8K2BKrEoWVHTDkLX1pQBkosi
         Ta+c14qVOgbtbcqoDC7k92+K9+TwjtNqNP4zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qSrgT+Sq6ixZqGRM1ApDzYbdNLSfueKKt5jrYnIpTKg=;
        b=LknCf5QhGl8DHISVteiashkog+nuSrvhpOYYwlv6TVy1lDMs7UAFJ7AtiOXKeXerZR
         ylTM5ZYM6+ggemPkB5YPWrKBM2akPQ6WFFhVkgMON3hMpGqYOw6u8PiljTUar0T+Vi9/
         qPDSZGzFbdYuJwtC/57b17vUBHg7QeL1LCIRH6hKQ7jQGpsAJnn9zXvO5AuHIfu79MGB
         KbMzI+lpM/icpOGO71wwvoBK6knkiPxsb0nYPH8davDNwOVQ75nAPpmuxwnXfXSWJV9u
         c4VyJHj0s9rLUwtmTClTbjEbxYYm251H0Ko0+ecyqvttPBIdY7d1F4Y8X298k/1RLuMg
         mGMg==
X-Gm-Message-State: AOAM531CmNjSX7Tfx6pJ9HHAW/LowVkoXbEUkrloUDFqdn89uIxo70Mz
        +UvXygeYnvBChSodMUe2rFw8KbtUhjDzjw==
X-Google-Smtp-Source: ABdhPJxRwbUBSuzt8GoXUoomyJNIeMg2VkR4vWYNDVNYXXF5IrfYTiYenzTCR2c7kxBLNEU4yGSVqw==
X-Received: by 2002:a05:6830:22c9:: with SMTP id q9mr1181688otc.48.1604053132575;
        Fri, 30 Oct 2020 03:18:52 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id a17sm1240346otl.77.2020.10.30.03.18.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 03:18:51 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id f97so5089568otb.7
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:18:51 -0700 (PDT)
X-Received: by 2002:a9d:eca:: with SMTP id 68mr1003531otj.141.1604053131232;
 Fri, 30 Oct 2020 03:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201013124428.783025-1-acourbot@chromium.org> <20201013124428.783025-3-acourbot@chromium.org>
In-Reply-To: <20201013124428.783025-3-acourbot@chromium.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 30 Oct 2020 19:18:40 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXpXEPsgkWXAo0p3u_zFyYk3kYqKx3=+G6XEcGcsKCEYQ@mail.gmail.com>
Message-ID: <CAPBb6MXpXEPsgkWXAo0p3u_zFyYk3kYqKx3=+G6XEcGcsKCEYQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: mtk-vcodec: fix build breakage when one of
 VPU or SCP is enabled
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 13, 2020 at 9:44 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> The addition of MT8183 support added a dependency on the SCP remoteproc
> module. However the initial patch used the "select" Kconfig directive,
> which may result in the SCP module to not be compiled if remoteproc was
> disabled. In such a case, mtk-vcodec would try to link against
> non-existent SCP symbols. "select" was clearly misused here as explained
> in kconfig-language.txt.
>
> Replace this by a "depends" directive on at least one of the VPU and
> SCP modules, to allow the driver to be compiled as long as one of these
> is enabled, and adapt the code to support this new scenario.
>
> Also adapt the Kconfig text to explain the extra requirements for MT8173
> and MT8183.
>
> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Fixes: bf1d556ad4e0 ("media: mtk-vcodec: abstract firmware interface")
