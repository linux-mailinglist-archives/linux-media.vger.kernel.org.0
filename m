Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0686734C3B
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 09:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjFSHRl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 03:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjFSHRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 03:17:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 992201A8
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 00:17:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2518D6151C
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 07:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF94C433CA
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687159059;
        bh=k6yK8la4rYBlv69i0VKV/a+wDbod7RaHwGJX0ZYu/dg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=L2Ea18iWXASq9SXqxW8X1Lp0NmFfqIYnIEpgPcWWYHmmQl+h1DgMAW3EDDmvgj6iG
         4ceqKAYwPL4Vf0PeRDRDZ39UUofdeZoqnmt4s5ZoCMNL0AmQlKSpwLHiyIySfT93UE
         qKCa3tRtqZTsUFhpN20tYbbMv6hIxF/I5OLtcT2pIRKi0V1lApqq8+i+RwQ0TCoZjA
         s8BpR7YTbVKFnJwn1w+/Xfht+ZUBlZ/cdrEtq12F6iToAFFfVRX6+Le6IMfLrc6j5Y
         q39twJ0A2fWBZEn163UBAWVp1piG3UJy6/E/oGyz9j3/Yw7fTjWyUcBQKcieGmxhIa
         NVq+9kEH3Jdyw==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-bad0c4f6f50so4662253276.1
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 00:17:39 -0700 (PDT)
X-Gm-Message-State: AC+VfDzi8WwmN+bJ+0adojZmizSG1KtGvuQS5VkEpTCOpfzycJIXqumR
        fB5TENuFnAXD+veqbhjZdWgTIOlE3B4i/khmkIg=
X-Google-Smtp-Source: ACHHUZ5VNSh6EDNs3Xesrd6IYdsENJQ2NabLYlpsbKnEJj5xvUG2DUdArUiX0sSIGvHIer5zRPIpB7L626A55JlKBbs=
X-Received: by 2002:a25:ac9d:0:b0:bc4:f2e5:5343 with SMTP id
 x29-20020a25ac9d000000b00bc4f2e55343mr5827873ybi.28.1687159058632; Mon, 19
 Jun 2023 00:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230618181740.42432-1-hdegoede@redhat.com>
In-Reply-To: <20230618181740.42432-1-hdegoede@redhat.com>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Mon, 19 Jun 2023 09:17:22 +0200
X-Gmail-Original-Message-ID: <CAPybu_0kT0RNDCx1M8rWGN9WP39EXtopzbJYts1rWBTXH-F81g@mail.gmail.com>
Message-ID: <CAPybu_0kT0RNDCx1M8rWGN9WP39EXtopzbJYts1rWBTXH-F81g@mail.gmail.com>
Subject: Re: [PATCH] media: ad5820: Drop unsupported ad5823 from i2c_ and
 of_device_id tables
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Thanks for your patch.

When we added support for this  we had no access to the datasheet.

Regards

On Sun, Jun 18, 2023 at 8:17=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Fixes: b8bf73136bae ("media: ad5820: Add support for ad5821 and ad5823")
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
