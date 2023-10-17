Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8297CC7D3
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 17:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235140AbjJQPqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 11:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235188AbjJQPqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 11:46:38 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6C0D4B
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 08:46:30 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c9c3c51e01so3177235ad.0
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 08:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697557590; x=1698162390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWLSMFAooqQmoBLTKL8ELQL8/4o6CmwVfbhomvt//PQ=;
        b=dUNOb9x9qhF2G5KdjnjeqiNuUd0ZTsqx/a5sw3iI5OyA0+Lvw2s5v0oLOyHCUiuNGw
         rtJn+IVQoLjNPNw2LIBCEXySyiK2TnXpUm11Ru/sQQIjK81RKD3hirTeRaSWbovaXpW4
         AiwTwooZqbNPdv2UqCfUsmk/N1TM7m90HInPS63ye4lo8iChXheIi1h4T/1M+ODH0tid
         3fsglwAw2oiKkI28UKNdU/XEeqLxHpRdxV6lWYGHQCrV6HT4Z5FblwV+dj6YlxH6FHv2
         zCkIa1o+Vdlp3fXh2FQIgwEN+6LcmkkalSrc0UM9baTkQbzbv6a7V8db7+IA1x+jMZ9e
         qW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697557590; x=1698162390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWLSMFAooqQmoBLTKL8ELQL8/4o6CmwVfbhomvt//PQ=;
        b=JmM1s3yWL/TeGB98FpHIiQi+EmQnpAalSffhbPstHrhJ4xhHm/Mq6BvTtewy+B+WwU
         ARc9af4RgFJ2a0axd5Q9P1XVy2EvEUN2L0lxL6BmQ0oG2BySv8rjSaIZUJoDjdXOPfgg
         C8qTe5yFaMH5a9MfMEwrpprQG4pI9b7eaPh4nXwtvXfLUP/eHC+NYilhp3veApLrZnU4
         KPxHxvpkMVuK3cEv3KydFa0IMQb5/Vi38rp5RhMMbGVbZtLNE3qLfrT3tJSVlgjXSsGZ
         F3F+gQ79oXaRYQqPkeUq0utcASDksRoKfdpjZUiYUNCLsJf1RfODsiWpyuUI+GqVz5+l
         h8EA==
X-Gm-Message-State: AOJu0YxyQCqUBMJFe8pU5i7tDUjvvYibQQkO7f5sloHWKy4Gqeqs3YfY
        0lRQvwhPnmr71uCtwNxZcdmNmn7SedHUmmAUNWI=
X-Google-Smtp-Source: AGHT+IFVk1+V+spJjlJflhllQSGPK9cpBJeG87AghePoX6Wvk0YUNeFY1a9wBKrwvcfBB2l2TVL7Qc2zaEXB1LaTH2w=
X-Received: by 2002:a17:902:f30a:b0:1ca:2ec4:7f4d with SMTP id
 c10-20020a170902f30a00b001ca2ec47f4dmr2700486ple.3.1697557590074; Tue, 17 Oct
 2023 08:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231017150854.270003-1-s.riedmueller@phytec.de>
In-Reply-To: <20231017150854.270003-1-s.riedmueller@phytec.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 17 Oct 2023 12:46:18 -0300
Message-ID: <CAOMZO5CcseMy+JmBM2R=NZR0UfiLCdHwAsTv4_JqPqtaXf6Ypw@mail.gmail.com>
Subject: Re: [PATCH] media: imx: imx7-media-csi: Sync frames to start of frame
 for MIPI
To:     =?UTF-8?Q?Stefan_Riedm=C3=BCller?= <s.riedmueller@phytec.de>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Martin Kepplinger <martink@posteo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, upstream@phytec.de
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

Hi Stefan,

On Tue, Oct 17, 2023 at 12:09=E2=80=AFPM Stefan Riedm=C3=BCller
<s.riedmueller@phytec.de> wrote:
>
> The default behavior for a base address change is to do it automatically
> after a DMA completion. This can lead to the situation, were one
> corrupted frame, with less lines than configured, results in all
> following frames being corrupted as well, due to a missing
> re-synchronization to the beginning of the next frame.
>
> Fix this by configuring the base address switch to be synced with the
> start of frame event.
>
> Currently this is already implemented for the parallel interface. To
> have it with MIPI as well, simply configure it unconditionally.
>
> Tested on i.MX 8MM.

Should this contain a Fixes tag? Thanks
