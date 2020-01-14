Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B279E13AB2D
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 14:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgANNfC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jan 2020 08:35:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:48466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgANNfC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 08:35:02 -0500
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3ED932467A;
        Tue, 14 Jan 2020 13:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579008901;
        bh=0ghVVnTBZhNvg1AJ2oPToO73881dd/NHeITQTqTLWxI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=G/lFZEhdHe3ydclV+TmtrDs9QjTdwW6bZ31l3IhVdfAOwOCVu2AfDi94vmifvYmm1
         TXFehXUCRWmiGutK1ymNrnQtMUGERrIgLohMmfLFNu/px184/IyY6AmwqxILVhrygJ
         NZBCIjp3FRCbLPTESuVqZfBtOrfNLGNjTHthFOkU=
Received: by mail-qv1-f45.google.com with SMTP id x1so5636843qvr.8;
        Tue, 14 Jan 2020 05:35:01 -0800 (PST)
X-Gm-Message-State: APjAAAX3iZMikQme1ty+I5WM/+JNdqCxQT5z0fvp8630X2v06iUazYyO
        R0eExvz+Jn60hL7tD78h5isdFBPTwaOvkmZWdtg=
X-Google-Smtp-Source: APXvYqzOqlxC0uai1sE24Xuw2w8hBzEMT/71be1S1hw9KqGPL+bJoJZFBLpiVMGuBZvnEV9JeXw9j+9BEBZFKOwbSCs=
X-Received: by 2002:ad4:4dc3:: with SMTP id cw3mr20423625qvb.130.1579008900416;
 Tue, 14 Jan 2020 05:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20200114091836.19403-1-gtk_ruiwang@mediatek.com>
In-Reply-To: <20200114091836.19403-1-gtk_ruiwang@mediatek.com>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Tue, 14 Jan 2020 08:34:28 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5aD+8Zc-e39eUtE=vPA_Dm5Z5_iXhFoYwpKstUssUVWQ@mail.gmail.com>
Message-ID: <CA+5PVA5aD+8Zc-e39eUtE=vPA_Dm5Z5_iXhFoYwpKstUssUVWQ@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Update Mediatek MT8173 VPU firmware
To:     gtk_ruiwang@mediatek.com
Cc:     Linux Firmware <linux-firmware@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        PoChun.Lin@mediatek.com, Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 14, 2020 at 4:18 AM <gtk_ruiwang@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> The following changes since commit 67d4ff59bf3334895626cf165e508e9eb1846e24:
>
>   Mellanox: Add new mlxsw_spectrum firmware xx.2000.2714 (2020-01-07 09:08:25 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/ruiwang-mtk/linux_fw_vpu_v1.1.3.git
>
> for you to fetch changes up to 7f3177d224ee7afdd6e36ed01a13f499d671e167:
>
>   mediatek: update MT8173 VPU firmware to v1.1.3 (2020-01-14 15:33:19 +0800)
>
> ----------------------------------------------------------------
> gtk_ruiwang (1):
>       mediatek: update MT8173 VPU firmware to v1.1.3
>
>  vpu_d.bin | Bin 2977008 -> 2977136 bytes
>  vpu_p.bin | Bin 131180 -> 131180 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)

Pulled the v1.1.3 branch and pushed out.  I'm assuming the pull
request is sufficient since it looks like the patch you sent
separately is the only thing in the pull request.  Let me know if
there is something else needed with the patch.

josh
