Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15E815BEE8
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 16:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbfGAO7z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 10:59:55 -0400
Received: from mail-yw1-f74.google.com ([209.85.161.74]:55480 "EHLO
        mail-yw1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729918AbfGAO7y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 10:59:54 -0400
Received: by mail-yw1-f74.google.com with SMTP id b129so76492ywe.22
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=IYUTK+aMKd5yMaHiSKlzzYZ1CrTE1Ni22YnWOCIhlEc=;
        b=C3SnCIZXUyp+/lczTJPoj38sboBSy2LwUFtHEltqPKCeDjSNrNtGL797mAvHEYVqnB
         P+AkSYRNmfM33sUFSH1hY9jIwLOUcexay65ix1239gkem7T/Yn1nNR/tQca225QO6c0T
         zHy2m4JfiL/keCLcCnrjOJp5owkSihj9qq3Y6R0+pQ+IVhfZp9a3EUJ7OWMSrT56Zhzt
         MGVhlRVzPQRgmXDyga4u/ogLzW75QAuVIivhyV01eeSK1DLcUmh10Uf2TjrItEhmWKes
         XMCB+t2qRNCUOmukk0q92G8WtBKra++5QY2+CPmSa6WK9YjHE2N12JpeQm27bTA3zv0F
         8Dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=IYUTK+aMKd5yMaHiSKlzzYZ1CrTE1Ni22YnWOCIhlEc=;
        b=GSOTrLJdqIWA26f8x6xRpL/GlDikekP6el7lX6MKF2/idbjfH+Ye7P682QPDVMI0oL
         sK4vGHEn5mRciaT54ZrB3BW/F03zK9yi8dRiC7VstAkkrfIARCNJZNJtMmogj00Nakz8
         vxPyLYn5ajn7knDBEXLCfIuQL9vgRsX8lc/9ss2Trit9wiyktcaCoQ6CS3HOpm+ertya
         2+RHM2S+7FZDHHXEBZPtOLKOwPI8IbNEe1zcLzHpDdWvNoOJPA/Sd2LhQ4qqnl+AthsA
         exGYmBMrqud1y94uihm7prb9v9XC+2W2TsG6jYVQcUNed8LO9zxU/qfskcWf2a6EPPDq
         G/2Q==
X-Gm-Message-State: APjAAAUubq6AP3+oO+zXySm6Lrq8+JZdDyrF1WWGAtq98hllPV4U4VIH
        I4KG0dr5ibxPreCNfuN1YshFPKGdXOV6SzL/ho5y0zWeYQl/VV0ZrL5bIONigVQuTNE/MfKeP+/
        QuMrIqWe/4bZ3NB3MbrDbV0cdC14a0O6qDUn5eVQQaaTJMvu1VeCnynsVy5iHMMicA+VQ
X-Google-Smtp-Source: APXvYqxMS+pq8YnvfmFrC3OLCuVxPwEpJSZb0LgVVpsUIguScByJ4UwV9J19cAMki367BJCZi6NW9IpELS4=
X-Received: by 2002:a81:ae5d:: with SMTP id g29mr14824674ywk.398.1561993193867;
 Mon, 01 Jul 2019 07:59:53 -0700 (PDT)
Date:   Mon,  1 Jul 2019 16:59:39 +0200
Message-Id: <20190701145944.214098-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v2 0/5] cec: convert remaining drivers to the new notifier API
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        hverkuil@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series updates remaining drivers in DRM to use new CEC notifier API.

Those complement the "cec: improve notifier support, add
connector info" patch series and also replace 2 following patches from
there:
- [PATCHv8 09/13] dw-hdmi: use cec_notifier_conn_(un)register
- [PATCHv9 12/13] tda998x: use cec_notifier_conn_(un)register

None of those changes were not tested on a real hardware.

Changes since v1:
	Those patches delay creation of notifiers until respective
	connectors are constructed. It seems that those patches, for a
	couple of drivers, by adding the delay, introduce a race between
	notifiers' creation and the IRQs handling threads - at least I
	don't see anything obvious in there that would explicitly forbid
	such races to occur. v2 adds a write barrier to make sure IRQ
	threads see the notifier once it is created (replacing the
	WRITE_ONCE I put in v1). The best thing to do here, I believe,
	would be not to have any synchronization and make sure that an IRQ
	only gets enabled after the notifier is created.


Dariusz Marcinkiewicz (5):
  drm: tda998x: use cec_notifier_conn_(un)register
  drm: sti: use cec_notifier_conn_(un)register
  drm: tegra: use cec_notifier_conn_(un)register
  drm: dw-hdmi: use cec_notifier_conn_(un)register
  drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 37 +++++++++++++++--------
 drivers/gpu/drm/exynos/exynos_hdmi.c      | 33 ++++++++++++--------
 drivers/gpu/drm/i2c/tda998x_drv.c         | 32 ++++++++++++++------
 drivers/gpu/drm/sti/sti_hdmi.c            | 20 +++++++-----
 drivers/gpu/drm/tegra/output.c            | 18 ++++++-----
 5 files changed, 91 insertions(+), 49 deletions(-)

-- 
2.22.0.410.gd8fdbe21b5-goog

