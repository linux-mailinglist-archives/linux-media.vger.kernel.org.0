Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5011432D8
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 21:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgATUVO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 15:21:14 -0500
Received: from outgoing4.flk.host-h.net ([188.40.0.90]:34885 "EHLO
        outgoing4.flk.host-h.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgATUVO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 15:21:14 -0500
X-Greylist: delayed 2147 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Jan 2020 15:21:12 EST
Received: from www31.flk1.host-h.net ([188.40.1.173])
        by antispam1-flk1.host-h.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <justin.swartz@risingedge.co.za>)
        id 1itczB-0004Ot-OT; Mon, 20 Jan 2020 21:45:22 +0200
Received: from [130.255.73.16] (helo=v01.28459.vpscontrol.net)
        by www31.flk1.host-h.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <justin.swartz@risingedge.co.za>)
        id 1itcz9-0004Hk-Dw; Mon, 20 Jan 2020 21:45:19 +0200
From:   Justin Swartz <justin.swartz@risingedge.co.za>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Justin Swartz <justin.swartz@risingedge.co.za>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: rockchip/rga: add rk3228-rga to rockchip_rga_match[]
Date:   Mon, 20 Jan 2020 19:41:54 +0000
Message-Id: <20200120194158.25357-1-justin.swartz@risingedge.co.za>
X-Mailer: git-send-email 2.11.0
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0Xm17NJf4el5vffImWwWrhCpSDasLI4SayDByyq9LIhVc0MzHfOnMfVI
 AlgH8Xwbq0TNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3K7uDjV/sFUXQr+CDrNQuIHgQg
 mAX8Bxy/iUu0ThNZg0h/RxVysY5Ye6+GGw0VqdJD7ren9RtRNyYim5e3GD8LGfWrcbYvelpuN/Pk
 qhBpvAyWwieZyauFYqHkIbFa+ipFflSrcyn7M3A1M8P7YyCISF7Ax1jp5415hfbnHhmkWKwQ798N
 tjgwOHRNrKlsLSLsR2phe2H+VQ5drqtLHIQXdB2sPQC/ZXf7OFUBPjBV0jlRnibyCuwag8UEnjV9
 dfsBVFAo2VqRJ3PoUK3i2GylNtZWYK6FgocWFgIy83G1Ziw5PsG3ZK/CX16OekmbPreOnw2lIbsC
 g5hAk2rbw6y01wTJsjWw5+0eZIpQIcK9yrSpnIazZEQP7rhBhxNqNx7Ljd12v0hRQV2TuWFKPYIZ
 hSoXjZRXPZeF/ozRyNShALTpAuRsQ7f/A1SBbUaDAMpCdiFVwaP90eVaqnDphEW4xGx2bCpzxgBv
 RJlZffR315YiXq0P29rzRb3/fujGPSO0ZjPN6GBtX9ob7G66M73K7lEBopH59S/bhUmo0Kkx+QUC
 X/JlYVPK+a5jKpRW4VkG9koSZx4AE7ErDJQIhG9sWvIZWUifSNHSdOCLRQ7jpnXnmAJSLoHk+mB7
 rvqdepOw2titfOjo27VsmUXl5Dlu0Ez4hiPVrwbHSJw7Xp/7OsyH8g27Tr7mENICHJaR53upNsj0
 ZNx9ROADUXTdQZTyOamR3KMXZiZ/EdUuc9x8TOdIW6qv7Prfdfuh2V6P2IH+fu/1ze9XG6SFbqNq
 ARXGm2iH1Wgh6RAenBR+licROGZLSOPJ7pouDn/lmAaZNciLjY4Bum3Cz9zMKWDsCgJgzAyOo8uz
 gLvzPUQ4WO1VIxT90NysgdUUHBaOGnMZ3fVqqKS4K27k8O0AKLf9g2axxclWHXeuOCUCSaU4vgJw
 yjPlnmxH7Pd4xT6MyYGIdovMjseuwUIt8Ke1zYmTdImomsn9uPyWahCadieo4QRLnvbNjcvkOxlt
 YcJZ/YLv0cjthSk55ObUg7TpMbFmZ6g5Ky+1Stg9rJ7bhjXv2caQWgXrjuU3A3io6xJmD59iFVkb
 kXGPzFwfHhKt2wjdkKIWbyf+T8iepkOFBDDkCgKb9Tgwyo3k9+KsRmFMu5VQ9KBOovIJzflUDtG9
 b8caIarEvU/OX3xYChUDPsYuWEJtniNfuGO37qWHEu6DA1YYHSc7
X-Report-Abuse-To: spam@antispammaster.host-h.net
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an entry to the rockchip_rga_match array for "rockchip,rk3228-rga"

Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
---
 drivers/media/platform/rockchip/rga/rga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index e9ff12b6b..268116cd5 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -956,6 +956,9 @@ static const struct dev_pm_ops rga_pm = {
 
 static const struct of_device_id rockchip_rga_match[] = {
 	{
+		.compatible = "rockchip,rk3228-rga",
+	},
+	{
 		.compatible = "rockchip,rk3288-rga",
 	},
 	{
-- 
2.11.0

