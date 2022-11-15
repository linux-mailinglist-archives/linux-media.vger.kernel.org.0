Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 333CF629E3C
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 16:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbiKOP6G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 10:58:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbiKOP6E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 10:58:04 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262292CE19
        for <linux-media@vger.kernel.org>; Tue, 15 Nov 2022 07:58:02 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id c8so10014221qvn.10
        for <linux-media@vger.kernel.org>; Tue, 15 Nov 2022 07:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GB0zkWpp/PlqB/Ov6dqD17vH1h9Y0WhPVEzh/+cmbNo=;
        b=ln1JxjSmcHufgAhOOzn9PNMCe9Osxmt7iWviyOyMiQQOCNh4BkwkwHP2eRuHyh6oz3
         oBd+QpzgYT9ygDJH7EutZpwFEZ2muRNSTukQ5UqE6c5dTbalEZF/vMUYX0Pj9gx7c0qR
         5Asrei6jWEuCXEfn4jeINpFWTpQyEZqiiLfeXEJKkQyVNVpPRakn4p3ROCaFe2i9iAER
         LDUj/S5Klw0XhOxjS6rVxVi2STXymU6CVzG/OHSIflNonJmXqHmWrJLh1t5GI1we3m2p
         3yDsdUFEgkdEEncOIXVM6f/0HkT3ytwCUokCRy1Wf7Ey0h9htNmGJUyGF81EsvAg5SKG
         iCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GB0zkWpp/PlqB/Ov6dqD17vH1h9Y0WhPVEzh/+cmbNo=;
        b=yXWkucuGhai7fUJ83B5/d3/Py6DKCndWbdZUmaLK8Ggu6B/Uh+5i/QogukzpkNR1tZ
         VCuz9zDyD1jO8/eUegn7He8I9Po8pCoqyXc8DHfKLt5XSUnp6+hX1vRsxzH16GPpZkZK
         UhcVgH0o5/hAQc/VGexO5VqAOjyYlG9pNhamdxaVZYAJD59OhS0eqoeNWp5wKhTJO38K
         CZ9LkPl9Qg3Kn4F4rPnc2WXLzNhrQlB9P8ayHlAZ5/w8ThZm2gPavQ25N3NnyTYKDfKl
         wTvImjMaXMQjNGP5XNIYH3/vZILYpNqGFLgeCo/sDUyOzaVZ0ZpTXURv0rWSoTk78zmh
         nV5A==
X-Gm-Message-State: ANoB5pkQoruJSYjwmZD2vQXXmk6PI/TaZfBhSU2DxG2NT0kKpe5zxXGR
        6+xoEv4lzRcLL5qDGp+yf22HBQ==
X-Google-Smtp-Source: AA0mqf5NnbHZ11tNvETyKyrrChRh/4gzlJFXHiyf0zOv0LoHWaiDFE9qY4bZvf/abRFmkefFAcpTPA==
X-Received: by 2002:ad4:43ca:0:b0:4bb:6093:22c with SMTP id o10-20020ad443ca000000b004bb6093022cmr16971536qvs.118.1668527881196;
        Tue, 15 Nov 2022 07:58:01 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id y11-20020a05620a25cb00b006ef1a8f1b81sm8489995qko.5.2022.11.15.07.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 07:58:00 -0800 (PST)
Message-ID: <20fe0ea98988ddf4a03cf86ed9275b9d0691841d.camel@ndufresne.ca>
Subject: Re: [RFC PATCH v6 02/11] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hsia-Jun Li <Randy.Li@synaptics.com>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        boris.brezillon@collabora.com, hiroh@chromium.org,
        Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, stanimir.varbanov@linaro.org,
        tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media@vger.kernel.org
Date:   Tue, 15 Nov 2022 10:57:59 -0500
In-Reply-To: <3b1edf81-bcc0-0b56-7e55-93da55d7f747@synaptics.com>
References: <20210114180738.1758707-1-helen.koike@collabora.com>
         <20210114180738.1758707-3-helen.koike@collabora.com>
         <d0d1f74f-7e77-1b18-0529-dbbec8889584@xs4all.nl>
         <577c56bf-146c-f34a-2028-075170076de7@collabora.com>
         <708221e8-a805-c394-6958-6c7ec24bfe66@synaptics.com>
         <03f6fd9ff6a757f6d1cb6cc552efcb0b94327104.camel@ndufresne.ca>
         <3b1edf81-bcc0-0b56-7e55-93da55d7f747@synaptics.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 11 novembre 2022 =C3=A0 11:03 +0800, Hsia-Jun Li a =C3=A9crit=
=C2=A0:
> There are four modifiers in DRM while we would only one in these patches.
> =C2=A0From the EGL
> https://registry.khronos.org/EGL/extensions/EXT/EGL_EXT_image_dma_buf_imp=
ort_modifiers.txt
>=20
> The modifier for echo plane could be different. I wish it would be=20
> better to create a framebuffer being aware of which planes are graphics=
=20
> or metadata.

I was told that having different modifiers per plane is not supported and j=
ust
an historical artifact of an over-engineered API design.

Nicolas
