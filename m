Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 438C28B42C
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 11:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfHMJdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 05:33:00 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:55129 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726282AbfHMJdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 05:33:00 -0400
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531] ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
        by smtp-cloud9.xs4all.net with ESMTPA
        id xTAghelkFAffAxTAkhTAWx; Tue, 13 Aug 2019 11:32:58 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
To:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sean Paul <seanpaul@chromium.org>
Message-ID: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
Date:   Tue, 13 Aug 2019 11:32:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPRY6eSbeJ04pdAM+ZonzBIN4mnfz0mHY7ST6uPv4vcZ0HClLhpgKoPpRZvizh7ibz2csXFFvW8hRzJ3Xt7XfVnSDsIxV5iCKJZaZMBysMlTl2jn8aBY
 tDd0rZN3/0roxe6nF3QaAFJMkx/sLVXcsaFTEEiezJz2dP4pPB1j6/lEnKshH+f/engBSs7ADI/J8MeF4cpvjSYZw3twxy6JHH9F7kkAq3tnFXFd0ShxJ/Qc
 0vakVPIn6VF3k2kwCv9SDD3FUEUxm4c0xlxd7/babgXduYbHorDgQKabTQ1CG+ORjFt3OjAQVSf4seBRFvliJaePVtNyhjenMJWCWDOP/20kwV6DlUTYGpfC
 ebdabU6hrfePnLV5E/oxWYHpmLsoMn/by4hnNj55uzOymiNckcedBIOOGC0W+NxlaNevD/sd4+zK4rxL10AHQhaaje46ZNtaK+l9jpG0rLztTYm2+POJETuX
 E0py9ths/wjLKukX
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When testing CEC on the AML-S905X-CC board I noticed that the CEC physical
address was not invalidated when the HDMI cable was unplugged. Some more
digging showed that meson uses meson_dw_hdmi.c to handle the HPD.

Both dw_hdmi_irq() and dw_hdmi_top_thread_irq() (in meson_dw_hdmi.c) call
the dw_hdmi_setup_rx_sense() function. So move the code to invalidate the
CEC physical address to that function, so that it is independent of where
the HPD interrupt happens.

Tested with both a AML-S905X-CC and a Khadas VIM2 board.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Note: an alternative would be to make a new dw-hdmi function such as
dw_hdmi_cec_phys_addr_invalidate() that is called from meson_dw_hdmi.c.
I decided not to do that since this patch is minimally invasive, but
that can obviously be changed if that approach is preferred.
---
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index c5a854af54f8..e899b31e1432 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2329,6 +2329,13 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
 		dw_hdmi_update_power(hdmi);
 		dw_hdmi_update_phy_mask(hdmi);
 	}
+	if (!hpd && !rx_sense) {
+		struct cec_notifier *notifier = READ_ONCE(hdmi->cec_notifier);
+
+		if (notifier)
+			cec_notifier_phys_addr_invalidate(notifier);
+	}
+
 	mutex_unlock(&hdmi->mutex);
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_setup_rx_sense);
@@ -2369,14 +2376,6 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 		dw_hdmi_setup_rx_sense(hdmi,
 				       phy_stat & HDMI_PHY_HPD,
 				       phy_stat & HDMI_PHY_RX_SENSE);
-
-		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
-			struct cec_notifier *notifier;
-
-			notifier = READ_ONCE(hdmi->cec_notifier);
-			if (notifier)
-				cec_notifier_phys_addr_invalidate(notifier);
-		}
 	}

 	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
