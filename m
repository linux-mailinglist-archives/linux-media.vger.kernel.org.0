Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616601D9142
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 09:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbgESHpA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 03:45:00 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:58833 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725996AbgESHo7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 03:44:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id awvmj0dyNtKAsawvqjPFlP; Tue, 19 May 2020 09:44:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589874298; bh=US7x2zFnszlTJLEyKr/sGvnjG56WYqkMaLAeyUrPh5s=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tDsR5GqDPjzyGpTv/4/oyi4L5uYPXnyjiJvDy8YTDfj0ajveLkPZJBVrDD7DBDbWL
         Ch1o/n2KNQBz34aA/i4t1QoekOo6T6vtBdSL/X/7EnZqtJF8+8uqPM0g7ZPUXkg00N
         O8nNWam/Rgw6lmIxL7YT5yfJO0UsCjYo8crdbGd/haXytfQiTBO2auev1Vv7zfI2tp
         cK/T7HTji8MEnyhMdJazikRX5+lmg6Zs5h9nqku/Y06SXJI18/BFoFohcN0GSmPniO
         SJRAT/AHLvrnPtq30bIexKXnrQ1W9KSc27mZBRAghf7MCu7UvBoZdxC8lFFCZSRVZm
         1c8n5rjXH/KuA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Helen Koike <helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] move rockchip dphy rx0 bindings out of staging
Message-ID: <8de4c526-ef2c-51db-ac5f-17a240612df7@xs4all.nl>
Date:   Tue, 19 May 2020 09:44:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNjG2RkaTuTG/YINdfevc09uKG8quNejl4Xdzrn2jzW1onvjHgabVLQtDEMdnM8rhgWB2vYYtmMeFYYwdpuj/5J2h2gJR+V2ym8VKS0Fcc63UUWix57t
 a++XFu424a0CO4ga02gHRg6Eflu4MoXzAOjbG/F7N3qfEuV4rhVE6ZfD4l8DmrvlG5HYWpC0ONLYk0Y3wtaDwrBoxPo+Lmgkt2NHJTS/h1xtsBygbnudNK3N
 VB5qPnxHubzw3M3EN9/vOA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As requested by Ezequiel.

Regards,

	Hans

The following changes since commit ad3a44cbd1b2e1559c6b93e80dc0c9c29632969a:

  media: i2c: imx219: Parse and register properties (2020-05-18 15:37:16 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8j

for you to fetch changes up to dd65421c7353b1d31804902630db88ada8eecff9:

  dt-bindings: phy: phy-rockchip-dphy-rx0: move rockchip dphy rx0 bindings out of staging (2020-05-18 18:48:00 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Helen Koike (2):
      media: staging: dt-bindings: phy-rockchip-dphy-rx0: remove non-used reg property
      dt-bindings: phy: phy-rockchip-dphy-rx0: move rockchip dphy rx0 bindings out of staging

 .../Documentation => Documentation}/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml                   | 3 ---
 1 file changed, 3 deletions(-)
 rename {drivers/staging/media/phy-rockchip-dphy-rx0/Documentation => Documentation}/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml (98%)
