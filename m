Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF7AD11ECB2
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 22:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfLMVQX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 16:16:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:51300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbfLMVQW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 16:16:22 -0500
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04699206C3;
        Fri, 13 Dec 2019 21:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576271782;
        bh=jai15Z72z/o94nuRP3eB2l8cBu8i1br/bUFA9Yx9HFk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BkTiC9xybLo3MW/AJ0OMJVvj1dRCSSxYwiBmtp0+2UdzzcmBFh7LDLYfm432yUYMJ
         zFjzu5EmczhDr23Bz50HGOzmQv7paGRd/Jcx7uEhY3L+UD1lzdptWo3VVidmG+AxD6
         TwbdBdfmrtl6SzA9x5wz+LmBQyFe2KvR0xGO4Bew=
Received: by mail-pg1-f174.google.com with SMTP id k3so89800pgc.3;
        Fri, 13 Dec 2019 13:16:22 -0800 (PST)
X-Gm-Message-State: APjAAAWP9CPAC2uAB0bA/Ws7HLoLb5s3I6VGU41o9n3kU32ANYqY6ASI
        iIGAyw20ItBvBkFUGNUdqz3uIloyBtr1lukvRNM=
X-Google-Smtp-Source: APXvYqzL/zuv9na7RTUnc+WEI76bRQtaD2KXswqsZ3zbI4Xp1HjAVlOa2s6VJL4ANENtayAjVtUyjbjvvj97VcJA6V0=
X-Received: by 2002:ad4:4dc3:: with SMTP id cw3mr14415205qvb.130.1576257310506;
 Fri, 13 Dec 2019 09:15:10 -0800 (PST)
MIME-Version: 1.0
References: <06448242d336c3bd1dda8ca0a5aa232e@codeaurora.org>
In-Reply-To: <06448242d336c3bd1dda8ca0a5aa232e@codeaurora.org>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Fri, 13 Dec 2019 12:14:59 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4roUT3YF7wV4peQRCfGefsZCsrwD9J_SWpDoMy+sz4GQ@mail.gmail.com>
Message-ID: <CA+5PVA4roUT3YF7wV4peQRCfGefsZCsrwD9J_SWpDoMy+sz4GQ@mail.gmail.com>
Subject: Re: qcom: add firmware file for Venus on SC7180
To:     dikshita@codeaurora.org
Cc:     Linux Firmware <linux-firmware@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Alexandre Courbot <acourbot@google.com>,
        linux-media-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 11, 2019 at 3:37 AM <dikshita@codeaurora.org> wrote:
>
>
> This pull request adds firmware files for Venus h/w codec found on the
> Qualcomm SC7180 Chipset
>
> The following changes since commit
> e8a0f4c9314754d8b2cbe9840357d88a861c438a:
>
>    rtl_nic: add firmware rtl8168fp-3 (2019-11-18 16:16:01 -0500)
>
> are available in the git repository at:
>
>    https://github.com/dikshitaagarwal/video_firmware_5.4.git master
>
> for you to fetch changes up to e10ed2126e33582c6c9c5896ca7c16907980784c:
>
>    qcom: update venus firmware files for v5.4 (2019-12-11 13:53:22 +0530)
>
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>        qcom: update venus firmware files for v5.4
>
>   WHENCE                   |  10 ++++++++++
>   qcom/venus-5.4/venus.b00 | Bin 0 -> 212 bytes
>   qcom/venus-5.4/venus.b01 | Bin 0 -> 6808 bytes
>   qcom/venus-5.4/venus.b02 | Bin 0 -> 870812 bytes
>   qcom/venus-5.4/venus.b03 | Bin 0 -> 33792 bytes
>   qcom/venus-5.4/venus.b04 |   1 +
>   qcom/venus-5.4/venus.mbn | Bin 0 -> 916924 bytes
>   qcom/venus-5.4/venus.mdt | Bin 0 -> 7020 bytes
>   8 files changed, 11 insertions(+)
>   create mode 100644 qcom/venus-5.4/venus.b00
>   create mode 100644 qcom/venus-5.4/venus.b01
>   create mode 100644 qcom/venus-5.4/venus.b02
>   create mode 100644 qcom/venus-5.4/venus.b03
>   create mode 100644 qcom/venus-5.4/venus.b04
>   create mode 100644 qcom/venus-5.4/venus.mbn
>   create mode 100644 qcom/venus-5.4/venus.mdt

Pulled.  kernel.org is down right now but I'll push it out when it's back up.

josh
