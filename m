Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050A47B31FC
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 14:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbjI2MFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 08:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjI2ME7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 08:04:59 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE6119F;
        Fri, 29 Sep 2023 05:04:58 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-69361132a60so193007b3a.1;
        Fri, 29 Sep 2023 05:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695989097; x=1696593897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GBhcGQqvqQZxAL13i6omJgdTZrHitfhltOh2mbQUr0=;
        b=hMHOTs1L4CHaclGHg2dp/MlzS1W492xzCtIN78NQw1rlpX3TCTqEt1KXDus+QlL9Jc
         u5nRlYscn5YbFBJEh6ANaVIGFaUWj0cMjZ6se01D+dkDQ2HTE/ejKY7hVk8AehwqU729
         YQQHRErUb4CRoTxBzf/2R9f4Kdc8yKFpYNRJHJ8gE1rpA8FxwPM6tGH1DlAZfEpOa+5k
         KWHAHuDraUaGov0jtebyjJCSimXLSetNLkqSEGWLsdDDvcLAtNPf4Iq9BpQMJKHWzBLX
         xMQ9XCWsb1A24QVCcNKsGVKXPxBAai3CfmYJqP6Ftv9I0LEqQVfUwQ8u+1UfF89Q7hza
         U29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695989097; x=1696593897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GBhcGQqvqQZxAL13i6omJgdTZrHitfhltOh2mbQUr0=;
        b=UibYNefC7pKWdb5zc1ZdB+v+jbzJFUA3sYG/zg5SMWYSEWs8LX2KILzo4rjD3hrA+9
         i3/AtUFmkKEtGNJ3j3cDVFDVGJxqqyf+Kgd3ZomIoc0o4/xJnQAYAd2YPLpdo9krR/uk
         qOXTfhN1KSL0Hd/1e+c/td+UCzavnu5t0eNy2qZ34edWvWd4xBAYo68hT44Fh7gQf+9i
         0t69GTXomdmR53sdKPUFFw0Qtf154Lb8a5sYyD3gNwaTWlx2e1COTnH1HeJCpRnEJZQL
         Lr52PLb4cVLmOv12g74rWija+t4vuP6ULjZ3GMvgM/idRW5YRJ7hLaql89QVYo7Nz9TW
         AFfw==
X-Gm-Message-State: AOJu0YwQ408vhVHwZOKRsxXDe7R7eX82ukW3EH9WfXGXo9jEutgso8FG
        uaRU1wtaEOyavvzJsqjnofCoB3jyt18d4fSxHvA=
X-Google-Smtp-Source: AGHT+IE7F4kUa6hw4bYKIDfQjIY+btq/zRykJ17s7vk9eAIhlG0NZv8n84ZA/EgQC4MFz6WqZZ+BbC008l/hOV6ZKQQ=
X-Received: by 2002:a05:6a20:3d87:b0:13d:fff1:c672 with SMTP id
 s7-20020a056a203d8700b0013dfff1c672mr4092741pzi.4.1695989097490; Fri, 29 Sep
 2023 05:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230928121424.388019-1-festevam@gmail.com> <avoixz5pqixr366cqks672akniv7h7ewix4edoyikg23dv24fd@bquxelr53t7t>
 <20230928155446.GA568091-robh@kernel.org> <orsrzyiaykfoqb5uritwbz5bgovxn4wviijinzlim2cy3qffhp@5zuy5ffp7kmo>
In-Reply-To: <orsrzyiaykfoqb5uritwbz5bgovxn4wviijinzlim2cy3qffhp@5zuy5ffp7kmo>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 29 Sep 2023 09:04:45 -0300
Message-ID: <CAOMZO5C53kGiCwoNSNe9-L0XgB_OsmQ9uwrFZBD+L==jc31-Kg@mail.gmail.com>
Subject: Re: [PATCH v2] media: dt-bindings: hynix,hi846: Document orientation
 and rotation
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Rob Herring <robh@kernel.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, martink@posteo.de,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Sep 29, 2023 at 3:30=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> Should I send a patch to or is Fabio interested in doing so as
> part of a new version of this patch ?

Feel free to send it, thanks.
