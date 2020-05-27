Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9691E510B
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 00:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgE0WNn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 18:13:43 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:43409 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgE0WNm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 18:13:42 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MZTa2-1jXvWm2V4I-00WYLm; Thu, 28 May 2020 00:13:30 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: tegra-video: fix V4L2 dependency
Date:   Thu, 28 May 2020 00:13:06 +0200
Message-Id: <20200527221327.3339232-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OkSCNXrxgq+QBC6VZibXnhg/MVMqw5QZ+B8NVtwOjOHdh8pK7KV
 oNEVVM4Oeri88gdj7u5OW8bijKaO6HHtbsrhzkmFFZmCUhd2m7Gd2ygmRgvRxVfHB/smmNN
 55R6GIMNzhZJYM3/igbihA7ZqXkAXDHxi8VVZpihLDblQ/StiZ+Y5GsvkNU2A8W3qVFeKqQ
 SaiD+hsn+mHITvEqJXKkw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8tSYDyvKwCo=:LVwvEWqO4zqtVa9oCHOyUR
 uNwRBjTb9L3mYUmVSjV7rIcFNmq+cDjGRFIlFNf9fwOnPvFfN/qYDMWpeILTUwBDiyoTcd7I6
 OtReLlFW8QOdfRy16htFKM/nXzZbMpbAMJFPvcwSreaTx/ZerqczDQHOU6iMPsOf3E3mgblF5
 hkfVSufRgbmScDBbPkPJRrdqEFfXab87hi226bAgMn0kAA+nFWszlvJIoUReNd223KDhHgPxS
 VIuo2Q2cLy6IGrflYwLwvwC+hFtKNSEuO7qGE+n7ZgVw1n919QXDKFkd/oDzRs/apKdPmEkoh
 gnMGAk/MxlU23oXo08ekP4butF4UORCC7O0P/nTtFohSgb8EEe2Tp4OLC18uYXoj+R6zHpLX8
 1/OA+BmFG8Lr7A5mwILNGm0FyyZ7CJr24xTwSlp7YM9gaWcr8DNFgftm9aFNYsuJCL2CLPQok
 g14eEiZEdb9YaRHtoJ0IhC9PbBrlue8IMbCSdgDAdFx80qg4wQji/lxBXDJii0+suFdWHahhl
 NRkqnAk7b6W5aKtXfd0CZoOWvegIVTl3WF13HIfkfyMg+io7U6igWGsCMJMXVrAaLXLl6QrDe
 cUL12Yat+ighNEMELCAiMZ1C7Dkj6x0+QmOu0bAwjry1MGcg1LfwqbS3E+oCK6m3hsWtakD+n
 rMkIGhi4Gt2of6tqBkzr0tuWqWTesMJqo0RrKXCkr5azyx23Qf3emsGUy90QePxLMPbRXyqvC
 XQ5tF84oR+SW97FBEQcbkFyWmLw/b6Y9rxvOB6Mohz4lStJqlTPtaiySH3ISw/thz+HCRnlGT
 9oJOh0yhDvRSfbkS231duc4zUWmAhFWvkEkPc1FpjEQKFo6cWU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rather than using a dependency on VIDEO_V4L2, this driver uses
"select", which fails when other dependencies are missing:

WARNING: unmet direct dependencies detected for VIDEO_V4L2
  Depends on [n]: MEDIA_SUPPORT [=y] && (I2C [=y] || I2C [=y]=n) && VIDEO_DEV [=n]
  Selected by [y]:
  - VIDEO_TEGRA [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && TEGRA_HOST1X [=y]
(plus an endless stream of link errors for other drivers that
depend on VIDEO_V4L2 but are now lacking their dependencies)

Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/tegra-video/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/staging/media/tegra-video/Kconfig
index 3f03b5b39e6c..f6c61ec74386 100644
--- a/drivers/staging/media/tegra-video/Kconfig
+++ b/drivers/staging/media/tegra-video/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_TEGRA
 	tristate "NVIDIA Tegra VI driver"
 	depends on TEGRA_HOST1X
-	select VIDEO_V4L2
+	depends on VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG
 	help
-- 
2.26.2

