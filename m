Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A867A2C3548
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 01:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgKYAOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 19:14:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:56390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbgKYAOn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 19:14:43 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBB86206E5;
        Wed, 25 Nov 2020 00:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606263283;
        bh=yiZ84YEeFL0wWYezky6vF3yhpPWjHZ52uDhLhbMfJQM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eLU5QbBunDunzGLbn35O61lp48dnCiQcXoMj6ntVLrpCl3D2hSb7EzYMD9E7xCufo
         faLinbGoGYFCtqY3HR9mXHNu5faGJskKKN4nMkiF9Z0YrPcdbgRghR/v20re2SmSD7
         rf5xyq57yHsYQeoFrG1CdVXncecGIlRjpGaTHnF4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201115170950.304460-4-krzk@kernel.org>
References: <20201115170950.304460-1-krzk@kernel.org> <20201115170950.304460-4-krzk@kernel.org>
Subject: Re: [RFC 3/3] media: atomisp: do not select COMMON_CLK to fix builds
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
To:     Chen-Yu Tsai <wens@csie.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Date:   Tue, 24 Nov 2020 16:14:41 -0800
Message-ID: <160626328163.2717324.18098835445527872342@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-11-15 09:09:50)
> COMMON_CLK is a user-selectable option with its own dependencies.  The
> most important dependency is !HAVE_LEGACY_CLK.  User-selectable drivers
> should not select COMMON_CLK because they will create a dependency cycle
> and build failures.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

This is fallout from making the COMMON_CLK symbol selectable in commit
bbd7ffdbef68 ("clk: Allow the common clk framework to be selectable").
Before then we needed drivers to select the COMMON_CLK config so that
the framework was enabled. Now that isn't necessary and any
user-selectable options should be moved to depends syntax.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
