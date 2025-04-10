Return-Path: <linux-media+bounces-29988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F78A85021
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 01:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C07021B81351
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 23:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDB020E037;
	Thu, 10 Apr 2025 23:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axL+Ajwd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5E215E90
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 23:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744327844; cv=none; b=R++prRgJ36CwId3xS2x+kkb8DXG88a6KZEjxmqoMyY0vqnExQi3gJwY+H/TbP/f6S/XC9kXe73/eqiO8/4BVp40gX9+aNbzMLgoyuDLbyAhRbSTOa5OCfbE7pJ254ZlrfmMEjv4Z8D85g6SJ2v2vMff15uiBLN2gwh78LQUBF74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744327844; c=relaxed/simple;
	bh=bRN6Xlo0BU4NAPp93QKj/ExVQbAUYW2WvsYV2D8NMx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iM3lV0mRRq/LdesHcHhlnKo9Z+Bovwcvm/7QOZOlk3hccUaQg2sEl2r/dEqIhe7DV1T1rp++500hZpJ3I7i/PLtrZXjgDd9jlDZNtZT8FVU0LqM1r7M29YPzYCw4XhVmG9FQI+BzpI5JYfOwYU48BMgF8czMGcko0zWHPXtHAlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axL+Ajwd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4A2C4CEDD;
	Thu, 10 Apr 2025 23:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744327843;
	bh=bRN6Xlo0BU4NAPp93QKj/ExVQbAUYW2WvsYV2D8NMx0=;
	h=From:To:Cc:Subject:Date:From;
	b=axL+AjwdNrIT+VKx2seTCnS9YD5D/BaehcrPvPiuuzgf1NJtTphYb4wq1xPSet7u0
	 XEGq6LmlURXnPD4q79JU6hBd/+A4b5VzNtY32fEKqjKHjwwlAEi+d87p/GAQchVUR9
	 0bPHtFhTmDF5m3OQnz0CtXMOTCqVDg7FelI1C7iSc5RscPJJ0cS/Usxg2zjcfJoQ/H
	 DOvapt+q8oqboG6XafkG+iow4RSQBlHSUfPMZgYDIhrU01sNA2x6fxzDmOZxaoHxlD
	 FvQj9dpnqQojRD2aqQTluhVBi65dTPUdtiMnc+oso/UTLTH6VmRiGX2++l7YvxOo+i
	 xWLOKA449zdJA==
From: bod@kernel.org
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bod@kernel.org>
Subject: [GIT PULL FOR 6.16] Please pull platform-qcom-media-for-6.16
Date: Fri, 11 Apr 2025 00:29:47 +0100
Message-ID: <20250410233039.77093-1-bod@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 9ddc3d6c16ea2587898a315f20f7b8fbd791dc1b:

  media: mediatek: vcodec: Remove trailing space after \n newline (2025-04-08 07:21:21 +0000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-media-for-6.16

for you to fetch changes up to 803ad6d0a0e646c9f196c79d58f8aab90d1c84c3:

  media: venus: pm_helpers: add compatibility for dev_pm_genpd_set_hwmode on V4 (2025-04-10 11:27:10 +0100)

----------------------------------------------------------------
linux-media platform qcom for 6.16

- Qcom media platform
  Adds new +R and +M as appropriate

- CAMSS
  Adds new platform X1 Elite bindings and driver
  Fixes boot logj spam
  Prepares for CSIPHY C-PHY addition

- Venus
  Adds new platform QCS615 bindgs
  Adds ability to switch to hardware power rail control
  Fixes buffer management and probe error unwinding

- Iris
  Adds new SA8775p bindings definition
  Fixes error codes in firmware loading

----------------------------------------------------------------
Bryan O'Donoghue (10):
      media: MAINTAINERS: Amend venus Maintainers and Reviewers
      media: MAINTAINERS: Add myself to iris Reviewers
      dt-bindings: media: Add qcom,x1e80100-camss
      media: qcom: camss: Add an id property to struct resources
      media: qcom: camss: Use the CSIPHY id property to find clock names
      media: qcom: camss: Add CSID 680 support
      media: qcom: camss: Add VFE680 support
      media: qcom: camss: Add support for 3ph CSIPHY write settle delay
      media: qcom: camss: csiphy-3ph: Add 4nm CSIPHY 2ph 5Gbps DPHY v2.1.2 init sequence
      media: qcom: camss: Add x1e80100 specific support

Dan Carpenter (1):
      media: iris: fix error code in iris_load_fw_to_memory()

Johan Hovold (2):
      media: qcom: camss: csid: suppress CSID log spam
      media: qcom: camss: vfe: suppress VFE version log spam

Loic Poulain (1):
      media: venus: Fix probe error handling

Luca Weiss (2):
      dt-bindings: media: camss: Restrict bus-type property
      media: qcom: camss: Restrict endpoint bus-type to D-PHY

Renjiang Han (3):
      dt-bindings: media: add support for video hardware on QCS615 platform
      media: venus: vdec: queue dpb buffers to firmware for video seek
      media: venus: pm_helpers: add compatibility for dev_pm_genpd_set_hwmode on V4

Vikash Garodia (1):
      dt-bindings: media: qcom,sm8550-iris: document SA8775p IRIS accelerator

 .../bindings/media/qcom,msm8916-camss.yaml         |   8 +
 .../bindings/media/qcom,msm8953-camss.yaml         |  15 +
 .../bindings/media/qcom,msm8996-camss.yaml         |  20 +
 .../bindings/media/qcom,sc7180-venus.yaml          |   7 +-
 .../bindings/media/qcom,sc8280xp-camss.yaml        |  20 +
 .../bindings/media/qcom,sdm660-camss.yaml          |  20 +
 .../bindings/media/qcom,sdm845-camss.yaml          |  20 +
 .../bindings/media/qcom,sm8250-camss.yaml          |  30 ++
 .../bindings/media/qcom,sm8550-iris.yaml           |   7 +-
 .../bindings/media/qcom,x1e80100-camss.yaml        | 367 ++++++++++++++++++
 MAINTAINERS                                        |   3 +-
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 drivers/media/platform/qcom/camss/camss-csid-680.c | 422 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     |   4 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 131 ++++++-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  28 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-680.c  | 244 ++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   6 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 359 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |   4 +-
 drivers/media/platform/qcom/venus/core.c           |  16 +-
 drivers/media/platform/qcom/venus/core.h           |   2 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |  38 +-
 drivers/media/platform/qcom/venus/vdec.c           |  14 +-
 28 files changed, 1739 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-680.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-680.c

