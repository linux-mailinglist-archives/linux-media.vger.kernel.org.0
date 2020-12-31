Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADAB2E814B
	for <lists+linux-media@lfdr.de>; Thu, 31 Dec 2020 17:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgLaQtg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Dec 2020 11:49:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgLaQtf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Dec 2020 11:49:35 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CE9C061573
        for <linux-media@vger.kernel.org>; Thu, 31 Dec 2020 08:48:55 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id p22so18595959edu.11
        for <linux-media@vger.kernel.org>; Thu, 31 Dec 2020 08:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=0dnwt13b6AeyAA5whOQWUpEnmkLNup02Gu6w/U//wQA=;
        b=lFWx7e+Ju3GFuOGxZKs22Sy00jDaDXuWnHJl3tdr+GhsHBzpNw1P2UZRtDm8HuR86k
         25JdgqZawsGF1+J/uDXHZmJvvARyXW5RU+iAPGXR8mms/1WUKqrMONmOxJKHUCpJVNgr
         nvMYy88ZgMz4Jh7RoPhU+ebZBl5bJuszDh2B0rQ6/QN7AEF3mON/vTzE/ZWpj5Ao2AD4
         GGAd26XwSrGTTLVQo014cQyxuknEeu9fum/NkVT/RB80/0E5jRPexV6lvaB7hoOIFtat
         QPuxm759Ru+NXiqOOyZr3KXZw9XK9U1BnallbEbczhGz7PN0o1I/xe5OBKxRpwh9PEfi
         LfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=0dnwt13b6AeyAA5whOQWUpEnmkLNup02Gu6w/U//wQA=;
        b=nfZmJwWc/PlKwwQcG1prXgMH227+YQIMF/q48kiP799KqNCgnaNEvCKApit+jGjhww
         YIWyKO4JRSC2fDgFtZD7dH2A7ss/YLQNAG/PfL9yxDzKQHuBefzWYlnsPWrUeoqQTtZQ
         L7VRSDaz2RreYaRDy5n8aL3/KipnetmI91AJpZuVrkyIbnJ0FA2thK1bVTNwCgVjcGew
         ChxsOAQMtO8Lq2Zfa3zuB4CMvaoSPeqp/DStU+EVPZ32C3sHasjYCCuoJjtnhn586fnM
         IcDX27KTmUYfRWfQ6TKzkE0dAUgQK+JZnWzhN98QGSmNFIGcpRHjXFUuyrzvBKCqsQJc
         +HAA==
X-Gm-Message-State: AOAM533d3ohx8XHqlUsqCfsGu7Qf1q/ARf5mnHMaY8ZshVXtYRezGGCW
        EKmJRYaGmVrKZ6n4Wh7iRukz6FrHCX+/MTZEu6w46g==
X-Google-Smtp-Source: ABdhPJyVRMam8pcqoDp0FwuGnm6e+D8FB99VLv8zbQ6FE+DsTkZvYs5DAE4RIoYDUJVWUWv3QfgS/qnJjaZAOKV+0Bo=
X-Received: by 2002:aa7:dacf:: with SMTP id x15mr433351eds.134.1609433334111;
 Thu, 31 Dec 2020 08:48:54 -0800 (PST)
MIME-Version: 1.0
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 31 Dec 2020 08:48:43 -0800
Message-ID: <CAJ+vNU1Du8JpEMqGC+BMyD3D+wVAUP42PXqa=_unrD7L4YfDAA@mail.gmail.com>
Subject: IMX frame interval monitor (FIM) available on ipu{1,2}_ic_prp{enc,vf}
 capture nodes?
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Steve,

Some time ago you mentioned that adding FIM capability
(imx-media-fim.c) on the ipu{1,2}_ic_prp{enc,vf} capture nodes was on
your plate to fix as currently the controls are only available on the
ipu{1,2}_csi{0,1} capture nodes. Do you have any patches for that or
can you explain what needs to be done?

I have a user that wishes to use FIM to deal with a lossy analog
signal coming out of sync but they also wish to use the VDIC to
de-interlace.

Best regards,

Tim
