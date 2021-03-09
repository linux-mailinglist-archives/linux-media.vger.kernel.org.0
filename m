Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D193328B3
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 15:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhCIOgM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 09:36:12 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:37613 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229799AbhCIOfw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 09:35:52 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id JdSdl8bf5OruFJdSglTasW; Tue, 09 Mar 2021 15:35:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615300550; bh=Zt19blzPczeaIWz3t+pYULLoQdEWit+l3kMMR5J5ufo=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=r3mbuLDlEWMn1RDR8GNkWfJv5UEvZRWpcH2uUNYsMdL6JG2cGV4uwgVNwgQRj3Xiv
         JR69cPmAuGn8juOP24UnXqF4oq6qhizTrvaWYYNwzQeyugH3D2SSBnrFSgvpJ0UUN6
         7tm+By373r+c7tCq+mryRoKiDhz7HigzB0a8B/e2OBHC5Yf2sYnixIvubo4mx1SlGD
         egHAANo+3U3QkgvuXGqEpNr3lZiSevUqRWFmWHyMPpO+Vnwy0/yJp/r2pXpg5UTupM
         EhKcmClbMn64cHmceLJas7SIVnPbLtBZ5a1eTgpJ6O0lqb5kSrGgvgm923ZLd/j+Vd
         w0fT6ku0HBQNQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] tegra-video/csi.h: fix kernel-doc mistake
Message-ID: <6b234436-bf55-1130-d626-a82b295f1204@xs4all.nl>
Date:   Tue, 9 Mar 2021 15:35:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBDhiH4R0NdU4zZZctkW4udCXrzyciN+wl1uQIA1b/m4CyiuZNjNwvKpdnAgT0R8YsEaAe2W93pAhUTE4LkBrEkRxyETdIK3MmZdolTStLxEW4Y7b82p
 88Z53m0iT1FECzVBwvD14vogSf7TCKHXf3MANGCxKWl2hrKzwMt1AETec5wKJYJhRy2h61DB+ZbmyGl69EgF058VEslCog8YJQGjaMELBO3hNSL+JS4uCATb
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this kernel-doc warning:

drivers/staging/media/tegra-video/csi.h:152: warning: Function parameter or member 'csi_chans' not described in 'tegra_csi'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 386f7c664259..4ee05a1785cf 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -139,7 +139,7 @@ struct tegra_csi_soc {
  * @clks: clock for CSI and CIL
  * @soc: pointer to SoC data structure
  * @ops: csi operations
- * @channels: list head for CSI channels
+ * @csi_chans: list head for CSI channels
  */
 struct tegra_csi {
 	struct device *dev;
