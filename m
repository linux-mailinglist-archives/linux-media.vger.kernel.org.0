Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16C973BECE
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 23:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390094AbfFJVja (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 17:39:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389362AbfFJVj3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 17:39:29 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28E90212F5;
        Mon, 10 Jun 2019 21:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560202769;
        bh=YsHNPUuvWnZSTEVRx05DIIQWnpsv3R1kpTgSHE7wq0s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=u88KsF3RCV0d2tVPkny0hiTm2jwU8UGTXF3gW1z6LV5bP43rCrZh94mhKDDi2PnzI
         rRQak1X+mbPmfRhFMIokZfP/MbEqVYmZ0bNyBcoOzrlyzBXnSzf3s0tGYMsE/oIcJl
         SIWNhqIVS2M+kdosA1ohPWYivO/FDEmJz3yKtgtg=
Received: by mail-qt1-f175.google.com with SMTP id j19so12097991qtr.12;
        Mon, 10 Jun 2019 14:39:29 -0700 (PDT)
X-Gm-Message-State: APjAAAVWDae2PybnnSi7HHZ42rFslJWGYyzPPdilQnktIHXTfrQXvjdS
        eoVYd5uTYBWl7pDu2B8imAhrOjcEArnzJEHwfA==
X-Google-Smtp-Source: APXvYqyFDToPtXUMK42uZxV8rPSxPwT6GhM8hEXWzA+U4oqljMTWyMBU/M82mBtDF0Syat4/kQAlIeESh+umi768++4=
X-Received: by 2002:ac8:2ec3:: with SMTP id i3mr16235333qta.110.1560202768451;
 Mon, 10 Jun 2019 14:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190603113250.4115-1-maxime.ripard@bootlin.com>
In-Reply-To: <20190603113250.4115-1-maxime.ripard@bootlin.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 10 Jun 2019 15:39:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLiEv-buUNTTN8ZqZjHsLN3g=VwHvEBh+8c9D57Ro+A2A@mail.gmail.com>
Message-ID: <CAL_JsqLiEv-buUNTTN8ZqZjHsLN3g=VwHvEBh+8c9D57Ro+A2A@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: Fix vendor-prefixes YAML
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 3, 2019 at 5:32 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Commit 8df39e16877f ("media: dt-bindings: media: Add vendor prefix for
> allegro") introduced a new devicetree binding vendors, however with an
> improper syntax making the resulting YAML impossible to parse. Let's fix
> this.
>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Michael Tretter <m.tretter@pengutronix.de>
> Fixes: 8df39e16877f ("media: dt-bindings: media: Add vendor prefix for allegro")
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
