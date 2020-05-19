Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28251DA164
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 21:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgESTxE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 15:53:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:56896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727854AbgESTxB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 15:53:01 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BCD3207E8;
        Tue, 19 May 2020 19:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589917981;
        bh=rdizb6054sUWQ6fZD+89J2wGwwMQkGnOG0/yiHK/LbE=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=ZKhevx5QN2OPN7XottC5bZLJlVfh5Rg8EfQxBPu3lxMvDVX6sXczyiVzISI71VjLL
         k1gSSXozLucDwKGyaSo4zyvh8jAmRxyTB9p8TSuGonDZnKCHl2NKFO4P5U1DuCHRqZ
         DNn+LI1kutOg3GO4GnQIaJA4Ody/rIKlZmAUjl1k=
Date:   Tue, 19 May 2020 20:52:58 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20200511210134.1224532-2-lkundrak@v3.sk>
References: <20200511210134.1224532-1-lkundrak@v3.sk> <20200511210134.1224532-2-lkundrak@v3.sk>
Subject: Re: [PATCH 01/11] ASoC: mmp-sspa: Flip SNDRV_PCM_FMTBIT_S24_3LE on
Message-Id: <158991797896.23137.453146749205778028.b4-ty@kernel.org>
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

[1/2] ASoC: Add Marvell MMP SSPA binding
      commit: d81bb8726c247c3e7719d21bf213c5400de29e03
[2/2] ASoC: mmp-sspa: Add Device Tree support
      commit: a97e384ba78fd8bf7ba8c32718424d8a7536416e

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
