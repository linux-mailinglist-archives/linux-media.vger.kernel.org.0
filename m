Return-Path: <linux-media+bounces-1852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 506C7808C37
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 16:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A8F81C20AC0
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 15:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E8745C0D;
	Thu,  7 Dec 2023 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Stkh7Ehp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2EC1D54E;
	Thu,  7 Dec 2023 15:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9776AC433C7;
	Thu,  7 Dec 2023 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701964170;
	bh=/u5kEPo+v6kSj/0L0lrQuH79nm8Vys8QGHNxQV73pAk=;
	h=From:Subject:Date:To:Cc:From;
	b=Stkh7EhprDaD81vZluQUhrvMjIoSZjLcEtWo58nj1SXn42I1TIrLavuL9gJl05z3H
	 IIk7vVvhvzp96SgdMk1eN/iDUggeXM9ev4gOdaZohOSnwdcgEBXnusNhKgg9unHTbT
	 D1o+cY1WLFOF/81dNokOcGwBnZLO35RU17wqsysoJNrAkcihfqEDsmsmOxUMrtp5TN
	 MGorkNmTAZMtNfP7pLDaMs7ndEEHpo3mILCk+KPJjCwzyoulJTLQJB5A8uICaXNidv
	 HZPjJfzlEjYFd/P6gSGbSNPsuMRBPTHM71DUBvORUJpMJAMYAlxrkJK5KXzhqUA/mc
	 upKLU/GeBmiZw==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v5 00/44] drm/connector: Create HDMI Connector
 infrastructure
Date: Thu, 07 Dec 2023 16:49:23 +0100
Message-Id: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIPpcWUC/43MwWrDMBAE0F8JOldhdyVLck/9j5KDam1ikUYGy
 RhK8L9n6SEhBExOwzDMu6rGNXNTn7urqrzklqcipfvYqWGM5cQ6J+mKgAwEtPp8aXpMl6yHqRQ
 e5qnqNseZtUPng2fne/JK7mNuMv79ywtKfL+BLKhBgw3Q2XQ0rrNfZ66Ff/dTPamDqAs9pJ5gQ
 yKR0PeGUkwp+fQimbuEYHBDMiIZCj9wjGxN9C+SfUhIYUOyIg3eAWEXDDh+ktZ1vQE0dbE3jwE
 AAA==
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, Johan Jonker <jbx6244@gmail.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8681; i=mripard@kernel.org;
 h=from:subject:message-id; bh=/u5kEPo+v6kSj/0L0lrQuH79nm8Vys8QGHNxQV73pAk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL1u413FHb/h/7nzaF4e9D1RrJx23Yjrlfcr9xx+b2
 EObH5d86ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEPnsx/C/Ur3Es1UmTzVKO
 yHj8wthj2q2kJH2TIFM9Je1pj/beC2dk2DP7/NNlC9ed/JGet0nFd43m93gXi1u/G/t1Jqxg+n2
 SmQ8A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi,

Here's a series that creates some extra infrastructure specifically
targeted at HDMI controllers.

The idea behind this series came from a recent discussion on IRC during
which we discussed infoframes generation of i915 vs everything else.

Infoframes generation code still requires some decent boilerplate, with
each driver doing some variation of it.

In parallel, while working on vc4, we ended up converting a lot of i915
logic (mostly around format / bpc selection, and scrambler setup) to
apply on top of a driver that relies only on helpers.

While currently sitting in the vc4 driver, none of that logic actually
relies on any driver or hardware-specific behaviour.

The only missing piece to make it shareable are a bunch of extra
variables stored in a state (current bpc, format, RGB range selection,
etc.).

The initial implementation was relying on some generic subclass of
drm_connector to address HDMI connectors, with a bunch of helpers that
will take care of all the "HDMI Spec" related code. Scrambler setup is
missing at the moment but can easily be plugged in.

The feedback was that creating a connector subclass like was done for
writeback would prevent the adoption of those helpers since it couldn't
be used in all situations (like when the connector driver can implement
multiple output) and required more churn to cast between the
drm_connector and its subclass. The decision was thus to provide a set
of helper and to store the required variables in drm_connector and
drm_connector_state. This what has been implemented now.

Hans Verkuil also expressed interest in implementing a mechanism in v4l2
to retrieve infoframes from HDMI receiver and implementing a tool to
decode (and eventually check) infoframes. His current work on
edid-decode to enable that based on that series can be found here:
https://git.linuxtv.org/hverkuil/edid-decode.git/log/?h=hverkuil

And some more context here:
https://lore.kernel.org/dri-devel/50db7366-cd3d-4675-aaad-b857202234de@xs4all.nl/

This series thus leverages the infoframe generation code to expose it
through debugfs.

I also used the occasion to unit-test everything but the infoframe
generation, which can come later once I get a proper understanding of
what the infoframe are supposed to look like. This required to add some
extra kunit helpers and infrastructure to have multiple EDIDs and allow
each test to run with a particular set of capabilities.

This entire series has been tested on a Pi4, passes all its unittests
(125 new tests), and has only been build-tested for sunxi and rockchip.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v5:
- Dropped the connector init arg checking patch, and the related kunit
  tests
- Dropped HDMI Vendor infoframes in rockchip inno_hdmi
- Fixed the build warnings
- Link to v4: https://lore.kernel.org/r/20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org

Changes in v4:
- Create unit tests for everything but infoframes
- Fix a number of bugs identified by the unit tests
- Rename DRM (Dynamic Range and Mastering) infoframe file to HDR_DRM
- Drop RFC status
- Link to v3: https://lore.kernel.org/r/20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org

Changes in v3:
- Made sure the series work on the RaspberryPi4
- Handle YUV420 in the char clock rate computation
- Use the maximum bpc value the connector allows at reset
- Expose the RGB Limited vs Full Range value in the connector state
  instead of through a helper
- Fix Broadcast RGB documentation
- Add more debug logging
- Small fixes here and there
- Link to v2: https://lore.kernel.org/r/20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org

Changes in v2:
- Change from a subclass to a set of helpers for drm_connector and
  drm_connector state
- Don't assume that all drivers support RGB, YUV420 and YUV422 but make
  them provide a bitfield instead.
- Don't assume that all drivers support the Broadcast RGB property but
  make them call the registration helper.
- Document the Broacast RGB property
- Convert the inno_hdmi and sun4i_hdmi driver.
- Link to v1: https://lore.kernel.org/r/20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org

---
Maxime Ripard (44):
      drm/tests: helpers: Include missing drm_drv header
      drm/tests: helpers: Add atomic helpers
      drm/tests: Add helper to create mock plane
      drm/tests: Add helper to create mock crtc
      drm/tests: connector: Add tests for drmm_connector_init
      drm/connector: Introduce an HDMI connector initialization function
      drm/connector: hdmi: Create an HDMI sub-state
      drm/connector: hdmi: Add Broadcast RGB property
      drm/connector: hdmi: Add RGB Quantization Range to the connector state
      drm/connector: hdmi: Add output BPC to the connector state
      drm/connector: hdmi: Add support for output format
      drm/connector: hdmi: Add HDMI compute clock helper
      drm/connector: hdmi: Calculate TMDS character rate
      drm/connector: hdmi: Add custom hook to filter TMDS character rate
      drm/connector: hdmi: Compute bpc and format automatically
      drm/connector: hdmi: Add Infoframes generation
      drm/connector: hdmi: Create Infoframe DebugFS entries
      drm/vc4: hdmi: Create destroy state implementation
      drm/vc4: hdmi: Switch to HDMI connector
      drm/vc4: tests: Remove vc4_dummy_plane structure
      drm/vc4: tests: Convert to plane creation helper
      drm/rockchip: inno_hdmi: Remove useless mode_fixup
      drm/rockchip: inno_hdmi: Remove useless copy of drm_display_mode
      drm/rockchip: inno_hdmi: Switch encoder hooks to atomic
      drm/rockchip: inno_hdmi: Get rid of mode_set
      drm/rockchip: inno_hdmi: no need to store vic
      drm/rockchip: inno_hdmi: Remove unneeded has audio flag
      drm/rockchip: inno_hdmi: Remove useless input format
      drm/rockchip: inno_hdmi: Remove useless output format
      drm/rockchip: inno_hdmi: Remove useless colorimetry
      drm/rockchip: inno_hdmi: Remove useless enum
      drm/rockchip: inno_hdmi: Remove tmds rate from structure
      drm/rockchip: inno_hdmi: Remove useless coeff_csc matrix
      drm/rockchip: inno_hdmi: Remove useless mode_valid
      drm/rockchip: inno_hdmi: Drop HDMI Vendor Infoframe support
      drm/rockchip: inno_hdmi: Move infoframe disable to separate function
      drm/rockchip: inno_hdmi: Switch to infoframe type
      drm/rockchip: inno_hdmi: Remove unused drm device pointer
      drm/rockchip: inno_hdmi: Switch to HDMI connector
      drm/sun4i: hdmi: Convert encoder to atomic
      drm/sun4i: hdmi: Move mode_set into enable
      drm/sun4i: hdmi: Switch to container_of_const
      drm/sun4i: hdmi: Consolidate atomic_check and mode_valid
      drm/sun4i: hdmi: Switch to HDMI connector

 Documentation/gpu/kms-properties.csv               |    1 -
 drivers/gpu/drm/Kconfig                            |    1 +
 drivers/gpu/drm/drm_atomic.c                       |   11 +
 drivers/gpu/drm/drm_atomic_state_helper.c          |  659 ++++++++
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
 drivers/gpu/drm/drm_connector.c                    |  243 +++
 drivers/gpu/drm/drm_debugfs.c                      |  110 ++
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  346 +---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  203 ++-
 drivers/gpu/drm/tests/Makefile                     |    1 +
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 1728 ++++++++++++++++++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 1227 +++++++++++++-
 drivers/gpu/drm/tests/drm_kunit_edid.h             |  482 ++++++
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  150 ++
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |    6 +-
 drivers/gpu/drm/vc4/tests/vc4_mock.h               |    9 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c         |   44 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  626 +------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   44 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |    6 +-
 include/drm/drm_atomic_state_helper.h              |   12 +
 include/drm/drm_connector.h                        |  257 +++
 include/drm/drm_kunit_helpers.h                    |   23 +
 23 files changed, 5202 insertions(+), 991 deletions(-)
---
base-commit: 90d50b8d85834e73536fdccd5aa913b30494fef0
change-id: 20230814-kms-hdmi-connector-state-616787e67927

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


