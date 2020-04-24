Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1231B7382
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 14:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgDXMAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 08:00:08 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:51307 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726698AbgDXMAI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 08:00:08 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RwzxjFXYSlKa1Rx01jNve4; Fri, 24 Apr 2020 14:00:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587729605; bh=zZ2wwpEgLHB6mj3CufEWcojnNhlvi8MfX/eIcPeqdK4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pBtIg+DzzHRsyafofhQX+9A86KpM9aZCg+76lbAFgQtPLS1/S23Fr8z8nmUlceSUM
         6SPgIMkQ/LBPoDhLKldROlD8kz6lSpnAjx6qAZwvTlgTacEZDQ9x1CrmEwcr6V9hk+
         PBkR2khhgxYwFqSQeAzPyXgBo0ceEyysHAejXGHwRMdV5qAkmpaLWNPL9wzLPeDiiR
         2eXECBY6YEN39vs/sYsLpWPxD/ZGbhSFRRBVnJOKauFEKEOznkkRrW/33dIB9b+YBA
         hTGGGHZcGrlhipI+9Dwz28qBjWU+HoG+K7DEUdmLn4xLK1Z77v+0VXqUU5Zhg2W3hu
         qAq5lIg8CtdNg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] Add Tegra210 Video input driver
Message-ID: <506a8f62-f56a-9974-b419-a27e653dca16@xs4all.nl>
Date:   Fri, 24 Apr 2020 14:00:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHV2g8kDTo2Oj5DLf5PCZKLGbVUU6jJN3GeN9E1213aypIN6oLKU3WLze98xrgNSPjCr72UCvJsK+oJPREIjaGfHEIE6W9e6FO5O2GBrWpdqEjss0cDs
 tGqAAqdUs5ST6Sqvlg8PoOfHwkrI2YUWTRMuoOqWc+0FcvKFyuyCqCIxyYh6anlE9sj7FvF/sd4xa7ofCe2jqxi/DvYwh49otpLSuwvee9EZvqorPZPl0WwU
 jIQQU+yp+G9KKnZpctTqrw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This adds the Tegra video input driver. It currently only supports the test
pattern generator, the next phase will add sensor support.

Sowjanya, thank you for all your hard work on this driver!

Regards,

	Hans

PS: The dt-bindings patch https://patchwork.linuxtv.org/patch/63331 will go through
Thierry, together with other non-media patches. The bindings for this device are a
bit unusual since they are under bindings/display due to the HW design.


The following changes since commit 4bdbff4da40584ec2225bb429b7c66ad54d19cda:

  media: tuners: Kconfig: add some missing VIDEO_V4L2 dependencies (2020-04-23 07:57:27 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-tegra

for you to fetch changes up to 81ac3132ed589757063d65928b13148bb32b0f08:

  MAINTAINERS: Add Tegra Video driver section (2020-04-24 13:15:18 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Sowjanya Komatineni (2):
      media: tegra: Add Tegra210 Video input driver
      MAINTAINERS: Add Tegra Video driver section

 MAINTAINERS                            |   10 +
 drivers/staging/media/Kconfig          |    2 +
 drivers/staging/media/Makefile         |    1 +
 drivers/staging/media/tegra/Kconfig    |   12 +
 drivers/staging/media/tegra/Makefile   |    8 +
 drivers/staging/media/tegra/TODO       |   10 +
 drivers/staging/media/tegra/common.h   |  259 ++++++++++++++
 drivers/staging/media/tegra/csi.c      |  604 +++++++++++++++++++++++++++++++++
 drivers/staging/media/tegra/csi.h      |  144 ++++++++
 drivers/staging/media/tegra/tegra210.c |  708 ++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/tegra/tegra210.h |  190 +++++++++++
 drivers/staging/media/tegra/vi.c       | 1127 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/tegra/vi.h       |   72 ++++
 drivers/staging/media/tegra/video.c    |  153 +++++++++
 drivers/staging/media/tegra/video.h    |   29 ++
 15 files changed, 3329 insertions(+)
 create mode 100644 drivers/staging/media/tegra/Kconfig
 create mode 100644 drivers/staging/media/tegra/Makefile
 create mode 100644 drivers/staging/media/tegra/TODO
 create mode 100644 drivers/staging/media/tegra/common.h
 create mode 100644 drivers/staging/media/tegra/csi.c
 create mode 100644 drivers/staging/media/tegra/csi.h
 create mode 100644 drivers/staging/media/tegra/tegra210.c
 create mode 100644 drivers/staging/media/tegra/tegra210.h
 create mode 100644 drivers/staging/media/tegra/vi.c
 create mode 100644 drivers/staging/media/tegra/vi.h
 create mode 100644 drivers/staging/media/tegra/video.c
 create mode 100644 drivers/staging/media/tegra/video.h
