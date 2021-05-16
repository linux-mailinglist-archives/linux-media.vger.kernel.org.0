Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D477381F3D
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 16:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbhEPOXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 10:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhEPOXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 10:23:51 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF6CC061573
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 07:22:36 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id c15so4093217ljr.7
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=cpAv2x43cNAjs9HrTEx/UK9jgWecjBUgjFB/E6FSYUM=;
        b=HWr65ILW8lKvz76BwC+I15d1tUKOXVQuRwP4UhQvvH9uglGAvJdAd6WsE+6JdWwfId
         Qt4i3kkE9evk0c3th1+BR5s6hhrwqyhMGQAbGNjHD4N6MAXuDXxW6bSTzhnKzt9ft912
         2xwl6m8UpH+KSXwh+5A1N3rpiO57tkR+Py1PBjRaaZtZkhXA9s0Pr73Bxm8bsNMgJ5VR
         L7l2Pe3yjsIRnWB4fP3wojGhM3rRmsEJxiSBPwpxCM7v/RDiV1LlXDjXgh5hzB4FRtWb
         I+h92PyCEg2b0FCgqfN8d2XUlOfu1E0Dso+u4aBWrv4d6TgfDBlkJhcYEBFCzgA0F9FB
         WBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=cpAv2x43cNAjs9HrTEx/UK9jgWecjBUgjFB/E6FSYUM=;
        b=VnfbDhuEcvqKBxseGjrSB1FkgGhILco931SN+LdLiacM4rnH9w7IkoosKnbbVDuzYZ
         Rb1mvrZQex36nZRDne30UKKDPj5jhLibKvI8LgezMi2RcTvhVB/QtIKix443EDi1f7uQ
         80iItFuKfRzAa8OA8BSZsY8KmwnpvfC9x8d5fmWj89OdaEueJ2IU9UHkwvXGvpJvNYrP
         DclGzwZr0mY/PZ285nc3fdUgeMnN3ht7AenyBiRYOzUZUWu4xjcHBe02KGnplX3M0TKO
         6wTkeFxjdhJVoekPoryeA3uP9NWUi1aJMadzwYj5dMl7GubeFny6rGxW+pvGlwKflM3s
         mEEQ==
X-Gm-Message-State: AOAM530t656UiQrEKJOMCJinKw6Rf/gRC9x3rAjpf4hbBHCy+Ce3+Mp+
        dtVX/w5kgKJsL4Rlf+m9BNJ3+Iih7vejT5rREqW0fu7/fWC+PQ==
X-Google-Smtp-Source: ABdhPJz66za5sIArBwrWgQxxIRNAWr+fpWmnqEbzHK4YvcV4rCxiY+4Thkj9RJc48LVBTRuKNM6MUtH0JGYk59MTjU8=
X-Received: by 2002:a2e:8e23:: with SMTP id r3mr45404762ljk.444.1621174954388;
 Sun, 16 May 2021 07:22:34 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 16 May 2021 11:22:23 -0300
Message-ID: <CAOMZO5BDzjfMrg5Eh_esi=ixtP1g87nk5mu3i0zJZ2=aa08Uig@mail.gmail.com>
Subject: ADV7280-M probe failure
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        linux-media <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Matthew Michilot <matthew.michilot@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I am working on adding adv7280-m support on an imx6q based board and I
am facing two issues that prevent the adv7180 driver to be
successfully probed:

1. The write to the ADV7182_REG_INPUT_VIDSEL register inside
adv7182_set_std() fails.

2. The write to the ADV7180_REG_ICONF1 register (interrupt page
address space) inside init_device() fails.

If I force a hack by ignoring the adv7182_set_std() failure and remove
the interrupt description in the device tree then the probe succeeds.

A different board based on imx6dl with an adv7280 connected to the
parallel CSI works fine running the same 5.4 kernel.

I could not locate any in-tree user of the "adv7280-m" compatible and
I am trying to properly fix the probe issues.

Does anyone have any suggestions as to why these registers writes fail
only on the ADV7280-M connected to the MIPI CSI2 port case?

Thanks,

Fabio Estevam
