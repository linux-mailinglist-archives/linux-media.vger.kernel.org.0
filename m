Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC3361FAAA
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 17:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbiKGQ4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 11:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbiKGQ4o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 11:56:44 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CE0220DD
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 08:56:43 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id d26so31755646eje.10
        for <linux-media@vger.kernel.org>; Mon, 07 Nov 2022 08:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iyMhELtxZmy7LysjRxs5koPIPiBWXacQeXByz4XAWq8=;
        b=SB/go7ORYqxZZfdBrbyfG2GmTEbMOWGqLEqoNc+0uv6nh8+5+mS4V9HIuuT8AmOZjz
         x6Vm6fxOhVnjXIOZEW/ue9mKhxe1sdm5EbBux0/CaioMil4IxpsOJJHjSM5F1PSBv5iF
         CoufIDf0RF0y52GBQt1USA8W9XhrTAedwNAvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyMhELtxZmy7LysjRxs5koPIPiBWXacQeXByz4XAWq8=;
        b=zIxquZCqxmVtaER4BvtRUaUSkJwhRh/TJvK08+Iyr5r5F9ejLLWzA6tIAlh+mf19S1
         JbS9nww3Tagqc46w0dXEWzpBW51FqGUC64+C6iQm3inRzhN4EcK3vK8eSd3AQ60VIKjs
         LbRBddEZaI8DPFQA5WLE+QMrdfOyYtPPGswkWAs7oQ5VisrNtgYgdpUWFMsKxLyhW9x0
         TAlwClaTb/hOUzIg+OtttW4s4ZEzgNBt2sGC96Mjq/627noKJPMIP4f3mfucUCy9oGbH
         yXHoYTRkX6mifYQ4Y4VKYo2BfblzgjXtQmDGCrZqFZTqUWQpmglPeT9waoBHyeaOF4RF
         8NMA==
X-Gm-Message-State: ACrzQf0Svge2Vh4+eB0jWngu1PrRigDN1CGE8K/rqJUHCp/LlAjQs8hz
        ommtjXsKyS65whnoWMjgqx9ktTPMmG7PCg==
X-Google-Smtp-Source: AMsMyM4jrXE5ZeNMAQaEgbs1N7W4ofKI73+C5sQPhaDvyKfemlaabGdRRZpJlb8T41jJoMGXwAsQIQ==
X-Received: by 2002:a17:907:7e81:b0:7ad:e144:19e5 with SMTP id qb1-20020a1709077e8100b007ade14419e5mr37704025ejc.51.1667840201634;
        Mon, 07 Nov 2022 08:56:41 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id m19-20020aa7c493000000b00458dc7e8ecasm4488172edq.72.2022.11.07.08.56.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 08:56:41 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id g12so17117546wrs.10
        for <linux-media@vger.kernel.org>; Mon, 07 Nov 2022 08:56:41 -0800 (PST)
X-Received: by 2002:adf:cd86:0:b0:236:6056:14d3 with SMTP id
 q6-20020adfcd86000000b00236605614d3mr33705613wrj.30.1667839852819; Mon, 07
 Nov 2022 08:50:52 -0800 (PST)
MIME-Version: 1.0
References: <20210114180738.1758707-1-helen.koike@collabora.com>
 <20210114180738.1758707-3-helen.koike@collabora.com> <d0d1f74f-7e77-1b18-0529-dbbec8889584@xs4all.nl>
 <577c56bf-146c-f34a-2028-075170076de7@collabora.com> <708221e8-a805-c394-6958-6c7ec24bfe66@synaptics.com>
 <b58e2678-8d2a-a323-07e4-12cc01c8c3c2@collabora.com>
In-Reply-To: <b58e2678-8d2a-a323-07e4-12cc01c8c3c2@collabora.com>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Mon, 7 Nov 2022 08:50:41 -0800
X-Gmail-Original-Message-ID: <CAMfZQbxxD8oAAKES5c-=2Zw-id20ac7kg4T5=7xrih2WeYbKhQ@mail.gmail.com>
Message-ID: <CAMfZQbxxD8oAAKES5c-=2Zw-id20ac7kg4T5=7xrih2WeYbKhQ@mail.gmail.com>
Subject: Re: [RFC PATCH v6 02/11] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Hsia-Jun Li <Randy.Li@synaptics.com>,
        Helen Koike <helen.koike@collabora.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi, boris.brezillon@collabora.com,
        hiroh@chromium.org, nicolas@ndufresne.ca, Brian.Starkey@arm.com,
        kernel@collabora.com, narmstrong@baylibre.com,
        linux-kernel@vger.kernel.org, frkoenig@chromium.org,
        stanimir.varbanov@linaro.org, tfiga@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 6, 2022 at 2:11 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 11/5/22 18:19, Hsia-Jun Li wrote:
> > Hello Helen
> >
> > I didn't see any updates from V6 and V7-WIP in your repo. That is what I
> > need to for our complex tile formats in our platform.
> >
> > Any future plane here?
> >
> > Besides I have some ideas on these patches.
>
> I was looking into updating this patchset few months ago and the biggest
> blocker was the absence of immediate upstream user for this new UAPI.
> What your platform is? Is the driver stack completely opensource?
>
ChromeOS had interest in this for enabling UBWC for the venus driver.
We have a workaround at the moment, but would be interested.  So not
immediate need, but would hopefully be a user at some point.

-Fritz
> --
> Best regards,
> Dmitry
>
