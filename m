Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59CEE33DB1D
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 18:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234786AbhCPRlb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 13:41:31 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:48303 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231851AbhCPRk5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 13:40:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id MDgZlIbbRjVXQMDgcl6A1G; Tue, 16 Mar 2021 18:40:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615916455; bh=HtIlquxEgA6oNOWE8YbBIdkTpengd4w6hPQhC9fAJMk=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rclJ+Zh4OKBceiCI3XUy9H1r3qUnxx6iDIjzaLlWWsPeLHUXLRCWWypNFKl4VKsqd
         1+eUDN0uEg9Erxhmd/LJjwnqf14Ej7i+pWRz5kq9cvP41k2qFLhueFjWCPURmReRkQ
         XNxIyiLGDhH5aMEUEX5KUIuis1BEmZaJdw0vwPn+fz+C0HCfDTHyDGnRTbbneGtIkw
         82ZTObGBP5Lww+OGBYYof6nUlzpkmw/ihuhp/bh4BT5j+ubbsQeRbfnZwCPKKzp1IF
         Bltn0VtKnJlCn6oNt4PNX3tmpdHHcFB3WJmkrL2lHXvJdNzUhsxdT7Nj6kvujNyqdf
         7UDKG3227PpFA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Robert Foss <robert.foss@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Add support for the SDM845 Camera Subsystem
Message-ID: <bf3510bc-5f42-2358-32c1-3ead7225cc74@xs4all.nl>
Date:   Tue, 16 Mar 2021 18:40:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPUDgs38gjmOv6uv6Ko6xsPxy0Xd4va7B8io/WyMlPV/VFoe3DPhEmiawnYVj/t/1D7E3cpfS4ktVYtyCCIhI3IEEiguQ4z7VjQRVStkEX+Q4ckUSiZR
 N1Ro3d2fw0kiKcbCu8r/MUjZv0OOsOdHduhd0M22OwHp3d94DHeBZ7B7qjOiBmtvwemB6ProGwjK3ocy2GY+vnmzE7036dS/E8jyWzqebXG29IPqjn1U7GSA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See the cover letter for more info:

https://patchwork.linuxtv.org/project/linux-media/cover/20210316171931.812748-1-robert.foss@linaro.org/

Regards,

	Hans

The following changes since commit 1c5ab1e2286f4ca6347744e9d4cace5fad5ffa39:

  Merge tag 'v5.12-rc2' into patchwork (2021-03-07 17:46:50 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13i

for you to fetch changes up to 32bfacd5437d0c4637f763c86b186f794ea09f09:

  media: dt-bindings: media: Remove qcom,camss documentation (2021-03-16 18:31:18 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Robert Foss (19):
      media: camss: Fix vfe_isr_comp_done() documentation
      media: camss: Fix vfe_isr comment typo
      media: camss: Replace trace_printk() with dev_dbg()
      media: camss: Add CAMSS_845 camss version
      media: camss: Make ISPIF subdevice optional
      media: camss: Refactor VFE HW version support
      media: camss: Add support for VFE hardware version Titan 170
      media: camss: Add missing format identifiers
      media: camss: Refactor CSID HW version support
      media: camss: Add support for CSID hardware version Titan 170
      media: camss: Add support for CSIPHY hardware version Titan 170
      media: camss: Refactor VFE power domain toggling
      media: camss: Enable SDM845
      dt-bindings: media: camss: Add qcom,msm8916-camss binding
      dt-bindings: media: camss: Add qcom,msm8996-camss binding
      dt-bindings: media: camss: Add qcom,sdm660-camss binding
      dt-bindings: media: camss: Add qcom,sdm845-camss binding
      MAINTAINERS: Change CAMSS documentation to use dtschema bindings
      media: dt-bindings: media: Remove qcom,camss documentation

 Documentation/devicetree/bindings/media/qcom,camss.txt          |  236 ------
 Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml |  256 ++++++
 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml |  387 ++++++++++
 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml  |  398 ++++++++++
 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml  |  371 +++++++++
 MAINTAINERS                                                     |    2 +-
 drivers/media/platform/qcom/camss/Makefile                      |    6 +
 drivers/media/platform/qcom/camss/camss-csid-170.c              |  599 +++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid-4-1.c              |  328 ++++++++
 drivers/media/platform/qcom/camss/camss-csid-4-7.c              |  404 ++++++++++
 drivers/media/platform/qcom/camss/camss-csid-gen1.h             |   27 +
 drivers/media/platform/qcom/camss/camss-csid-gen2.h             |   39 +
 drivers/media/platform/qcom/camss/camss-csid.c                  |  637 ++-------------
 drivers/media/platform/qcom/camss/camss-csid.h                  |  150 +++-
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c        |  179 ++++-
 drivers/media/platform/qcom/camss/camss-csiphy.c                |   66 +-
 drivers/media/platform/qcom/camss/camss-ispif.c                 |  119 +--
 drivers/media/platform/qcom/camss/camss-ispif.h                 |    3 +-
 drivers/media/platform/qcom/camss/camss-vfe-170.c               |  786 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c               |  144 ++--
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c               |  277 +++----
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c               | 1195 +++++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-gen1.c              |  742 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-gen1.h              |  117 +++
 drivers/media/platform/qcom/camss/camss-vfe.c                   |  847 ++------------------
 drivers/media/platform/qcom/camss/camss-vfe.h                   |  128 +--
 drivers/media/platform/qcom/camss/camss-video.c                 |   52 ++
 drivers/media/platform/qcom/camss/camss.c                       |  410 ++++++++--
 drivers/media/platform/qcom/camss/camss.h                       |   15 +-
 29 files changed, 6872 insertions(+), 2048 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/qcom,camss.txt
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-170.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-7.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen1.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen2.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-170.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-4-8.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.h
