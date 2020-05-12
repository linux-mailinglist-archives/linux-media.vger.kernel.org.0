Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF881CFB38
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 18:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbgELQpM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 12:45:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:42074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgELQpL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 12:45:11 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 859AB20722;
        Tue, 12 May 2020 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589301911;
        bh=KsnJ3Mt/qpKQdSl9UrFC2Z9oOS5Kx1O1ey9XFH0Yt2s=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=wrrkXcg8AntdueHPHgaqaJX9X8VI/WJcE6yb3/5lv7XacccuPPg7ewN14DB/X2wJa
         BcEIXHmrAqtqFCnnZtftHkvQp1Wa4xLRtoCfmKUEcJ/xAz5/Keydl0YQ/clhhEIt8e
         kONBjkTtjFWFsv+FFvpZFDWMhs4jeRqS+eMT68A4=
Date:   Tue, 12 May 2020 17:45:08 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
In-Reply-To: <20200511210134.1224532-2-lkundrak@v3.sk>
References: <20200511210134.1224532-1-lkundrak@v3.sk> <20200511210134.1224532-2-lkundrak@v3.sk>
Subject: Re: [PATCH 01/11] ASoC: mmp-sspa: Flip SNDRV_PCM_FMTBIT_S24_3LE on
Message-Id: <158930188456.55827.7679180677411632006.b4-ty@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 11 May 2020 23:01:24 +0200, Lubomir Rintel wrote:
> The hw_params() callback handles the 3-byte format, not
> SNDRV_PCM_FMTBIT_S24_LE.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/7] ASoC: mmp-sspa: A trivial typo fix
      commit: e0b9024d2c8851b18b953823204278602bf73086
[2/7] ASoC: mmp-sspa: Get rid of dma_params and phys_base
      commit: c9aeda1c94973f835b3d1b6c785a414caaf935c3
[3/7] ASoC: mmp-sspa: Add support for soc-generic-dmaengine-pcm
      commit: 724da05378ba7af6e273451a2c3f565a3315a9db
[4/7] ASoC: mmp-sspa: Remove the embedded struct ssp_device
      commit: 3c4e89df3b45348dc0ee01a2ef1be710f7424ff7
[5/7] ASoC: mmp-sspa: Prepare/unprepare the clocks
      commit: 8ecdcac8792b6787ecb2341d25cb82165cf0129d
[6/7] ASoC: mmp-sspa: Add support for the runtime power management
      commit: 7d98cc648253c362ebfc582b11095a0e3f001896
[7/7] ASoC: mmp-sspa: Set appropriate bus format for given bit width
      commit: 39ec7e9b699910792468cf41a179d9930052e8ff

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
