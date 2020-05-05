Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FB41C505D
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 10:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgEEIdH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 04:33:07 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56515 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725320AbgEEIdG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 04:33:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Vt0fjTQEWhEkrVt0ijwxcS; Tue, 05 May 2020 10:33:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588667584; bh=jMtgmaneONt36GPv7oDBDqosNRFCT7P3G65Wr3bG4HA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EkK4n+TmZMY9cDTUpzjBxm+khW73E6A34nt07LgRmdZaQYdiox03w4RjlnxPv8mg8
         AjnMrH90GR830ObU35wROV+zGH5zpgZXYSs96D31L+4O3OejvGRaJujO0OGT/sNzBs
         NaObCNQJ2OsGCKX9jE9SmeCHHMRxJAR2lOGeDkuDgrj9Z7NSeQu4xjOakOXiy79h9O
         gvHrclgvZLN0o7Z6PJVVOGg96tpQezHvnLLKZIKfDPil4oLtQyX4Vb6zae4hJ353R3
         5+e2/MV9ZF7GMg+5phypbQmZWMXVOdytX+uAeBRkRYpUd0pQwCq2x431lvGcTI6wyG
         3oyU7x8DgLZ5A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] Add Tegra210 Video input driver
Message-ID: <c95abf33-bfd4-489f-2c20-536e76b848ce@xs4all.nl>
Date:   Tue, 5 May 2020 10:33:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOLaaYrg6PFDYWPCzDqcpkj6yACw8KuOaKl0aNIPuNFPeCO1Bn6Ar4aAUj59J8bOP5c/rYlzbFkYkGUHoZjC9UtCaqeitaPLx8z8kB8//wH9eN9yhNlk
 TS2dE9JOz1r/eiAvbUnysSVirRnBx82qFH7MByywpQj2xq100kYNKGZO2freNzCPlXAjXe+xWDuC4sKICL91GGHufoXWE7//T0M=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit e51759f56d314d28c25be7606b03791f048e44c7:

  media: v4l2-ctrls.h: clarify the p_def argument of v4l2_ctrl_new_std_compound (2020-04-29 12:04:58 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-tegra

for you to fetch changes up to 0bba0154ded02babccd59e21c6a27c5ad7d50faf:

  MAINTAINERS: Add Tegra Video driver section (2020-05-05 10:26:05 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Sowjanya Komatineni (2):
      media: tegra: Add Tegra210 Video input driver
      MAINTAINERS: Add Tegra Video driver section

 MAINTAINERS                                  |   10 +
 drivers/staging/media/Kconfig                |    2 +
 drivers/staging/media/Makefile               |    1 +
 drivers/staging/media/tegra-video/Kconfig    |   12 +
 drivers/staging/media/tegra-video/Makefile   |    8 +
 drivers/staging/media/tegra-video/TODO       |   11 +
 drivers/staging/media/tegra-video/csi.c      |  539 ++++++++++++++++++++++++++++
 drivers/staging/media/tegra-video/csi.h      |  147 ++++++++
 drivers/staging/media/tegra-video/tegra210.c |  978 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.c       | 1074 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.h       |  257 +++++++++++++
 drivers/staging/media/tegra-video/video.c    |  155 ++++++++
 drivers/staging/media/tegra-video/video.h    |   29 ++
 13 files changed, 3223 insertions(+)
 create mode 100644 drivers/staging/media/tegra-video/Kconfig
 create mode 100644 drivers/staging/media/tegra-video/Makefile
 create mode 100644 drivers/staging/media/tegra-video/TODO
 create mode 100644 drivers/staging/media/tegra-video/csi.c
 create mode 100644 drivers/staging/media/tegra-video/csi.h
 create mode 100644 drivers/staging/media/tegra-video/tegra210.c
 create mode 100644 drivers/staging/media/tegra-video/vi.c
 create mode 100644 drivers/staging/media/tegra-video/vi.h
 create mode 100644 drivers/staging/media/tegra-video/video.c
 create mode 100644 drivers/staging/media/tegra-video/video.h
