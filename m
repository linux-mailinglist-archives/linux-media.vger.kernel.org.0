Return-Path: <linux-media+bounces-41948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AADB483B2
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 07:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5D3B3BC03F
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 05:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DDF22A4D6;
	Mon,  8 Sep 2025 05:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csC7uw00"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF121ABC1
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 05:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757310108; cv=none; b=aUCDqLYwywmMUAl7yQwk+ihWXBtbS2oHoiXoPsOFn74Rvhtkw2kx2K1aXLe3cFvvw03xFpoMrgDPdRRu9PNjjJRUcWlC8mBWr1bRMA4j97fWVA75qgQBs7DbrOapU615V0KREoxkY8EAPBac+S27DlfGgv9J/jnFE6vM7j70QpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757310108; c=relaxed/simple;
	bh=FRzQiojRB9+/6IhJ/XttIVhmHZvASqPAIu1UyOHwLSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UHQ+nsQzRD8Qgov0/t/9q6Q0lFStdr5571sYRz1OvoTLaxgBIH0aDqS1frsMaYBzkMl0Dlc4tgDr0L3f21va6VgHw7Bc7RacPPU5bKUAEI5K1Fh16UD6btnJ+dImI+OP0LW8VEwg+lL7Nc0CyX1x8udjIQUXi09vMnFs2RJ8+X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csC7uw00; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86460C4CEF5;
	Mon,  8 Sep 2025 05:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757310106;
	bh=FRzQiojRB9+/6IhJ/XttIVhmHZvASqPAIu1UyOHwLSs=;
	h=From:To:Cc:Subject:Date:From;
	b=csC7uw00gXoHVclG1A/bzhhIGcmDPCaZzE4EotpHqw6Qxhv8o2wYJvBHNFoaYTpov
	 oGYM9JtpIcxYxz3ewci4D0T2HAAdiJEIR0aTCVjAQXTWbHltjpFtM7m3BmoGDhwCnY
	 IcGqM8JRGAsxWd9qSHRR5EHAPL2DD0dVP3qIqK5YTN6BU7nBWWM3a5dqKeBvCj7Ke0
	 u/PNePabqmjxO1BPvCcfihTDTIwTTvpKnMGtqsFn2sVyJRwV36D+Anil+YH9CG+gVi
	 GxnE2OhNoLz60bZDY/74sA7SoXn3GBrzf2zTS4xnXYY98x3pgTRxIls3LN/ug9nNw5
	 /61mnt3RK7Shw==
From: bod@kernel.org
To: bod@kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org
Subject: [GIT PULL FOR 6.18] Please pull platform-qcom-iris-generic-fixes-updates-for-6.18
Date: Mon,  8 Sep 2025 06:41:38 +0100
Message-ID: <20250908054142.17487-1-bod@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 34837c444cd42236b2b43ce871f30d83776a3431:

  media: uapi: v4l2-controls: Cleanup codec definitions (2025-09-04 10:37:05 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-iris-generic-fixes-updates-for-6.18

for you to fetch changes up to 836378f67823641fb8a844c9d7ac91dbe3142ea2:

  media: iris: Fix firmware reference leak and unmap memory after load (2025-09-05 21:47:14 +0100)

----------------------------------------------------------------
This PR contains:

- MAINTAINERS updates for Dikshita, Vikash, Bryan
- dt-bindings additions for x1e80100 and sm8750
- dt-bindings fix from Krzysztof
- Fixes: from the community
  A number of memory leak and power-sequencing
  fixes.

----------------------------------------------------------------
Bryan O'Donoghue (1):
      MAINTAINERS: Add a media/platform/qcom MAINTAINERS entry

Dikshita Agarwal (3):
      MAINTAINERS: update Dikshita Agarwal's email addresses
      dt-bindings: media: qcom,sm8550-iris: Update Dikshita Agarwal's email address
      media: iris: vpu3x: Add MNoC low power handshake during hardware power-off

Krzysztof Kozlowski (4):
      dt-bindings: media: qcom,sm8550-iris: Add SM8750 video codec
      dt-bindings: media: qcom,sm8550-iris: Do not reference legacy venus properties
      media: iris: Call correct power off callback in cleanup path
      media: iris: Split power on per variants

Neil Armstrong (1):
      media: iris: fix module removal if firmware download failed

Stephan Gerhold (2):
      dt-bindings: media: qcom,sm8550-iris: Add X1E80100 compatible
      media: iris: Fix firmware reference leak and unmap memory after load

Vikash Garodia (1):
      MAINTAINERS: Update Vikash Garodia's email address

 .mailmap                                           |   3 +-
 .../bindings/media/qcom,sm8550-iris.yaml           |  16 +-
 .../bindings/media/qcom,sm8750-iris.yaml           | 186 +++++++++++++++++++++
 MAINTAINERS                                        |  21 ++-
 drivers/media/platform/qcom/iris/iris_core.c       |  10 +-
 drivers/media/platform/qcom/iris/iris_firmware.c   |  15 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   2 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  36 +++-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  10 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   4 +
 10 files changed, 274 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml

