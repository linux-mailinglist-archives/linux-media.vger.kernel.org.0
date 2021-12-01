Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEED4646B7
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 06:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346714AbhLAFfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 00:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233549AbhLAFfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 00:35:32 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F53C061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 21:32:12 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso33558386otf.12
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 21:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=UrDLkAV1j3P0AyMpFPS10kJPFVs1OgX4Hpc5GjTeyn8=;
        b=QLpafXGSvew/MmnR0ypa+4Nlt4IBPBxH+u/YG2TL1ACWDUYRV4f5wVwmiGERfVZ6ex
         uoUpNLM7NK4Zakf3/BnoDkStUlV53Dgo/AWLFq2IygFK6FlKVOWsoBV2i0lpR9sIcw5T
         g7eyTYUn5Yy0ZN7UP8mSU1WTAnThLGHWbkjwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=UrDLkAV1j3P0AyMpFPS10kJPFVs1OgX4Hpc5GjTeyn8=;
        b=zcOAdZfjp6st8fnCiDjgMWzfrD/dSwbxONNJkRRBv6gCTFYOwpuA+YZPu2d758Jepd
         WLcWXFPEtEa7dzbB/hYZNMSZmCnN/dRHTzky/dCBUP8HYpT7o7d1N11sir7yjFXDA8zt
         XkM81z1TNpzIfQpDgDkZOxgK1XF1oXnaKqYVFPYYJneb5aM3GYPK2Tcc0gJgIE4V/S35
         3mKE4YJlFNvhPdPqJ44cxDYku7A69NgYBfVXzXHkFIishzdKsePZlxrP9zP9zOHKfJlR
         1k6IzHmxe/dTAEc4vvrki1d30N5rk6RyNSEcR1rpdSgHBScv+sMnwmvulTsLyLS/Gl2T
         j5OQ==
X-Gm-Message-State: AOAM533InmG4E0WYDVtbRlTIVnQKg2bL5RjgmPAGg2nxfWXmTX1KeDuU
        iVVrCCZDVRPVkI1pzb9yuqz5dveDTRAXGLWr
X-Google-Smtp-Source: ABdhPJx0jSL80FnNgux9eS0O84lJMOpWxOgRP4vzcOLkYCz511RngqRSdyvN1Be+YD5nvn7fSLSR1A==
X-Received: by 2002:a05:6830:169a:: with SMTP id k26mr3915281otr.64.1638336730799;
        Tue, 30 Nov 2021 21:32:10 -0800 (PST)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id bi20sm4375979oib.29.2021.11.30.21.32.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 21:32:10 -0800 (PST)
Received: by mail-ot1-f52.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so12102771otu.10
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 21:32:10 -0800 (PST)
X-Received: by 2002:a9d:24c5:: with SMTP id z63mr3783947ota.321.1638336729502;
 Tue, 30 Nov 2021 21:32:09 -0800 (PST)
MIME-Version: 1.0
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 1 Dec 2021 06:31:58 +0100
X-Gmail-Original-Message-ID: <CANiDSCskY=HjJjf+0cfHfHgaxwn4TtcUC=e6JBU_EfvRuBq-ag@mail.gmail.com>
Message-ID: <CANiDSCskY=HjJjf+0cfHfHgaxwn4TtcUC=e6JBU_EfvRuBq-ag@mail.gmail.com>
Subject: Re: [GIT PULL FOR v5.17] uvcvideo fixes
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Could you also consider this patch?
https://patchwork.linuxtv.org/project/linux-media/patch/20211008120914.69175-1-ribalda@chromium.org/


Thanks!
-- 
Ricardo Ribalda
