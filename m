Return-Path: <linux-media+bounces-5678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6AD8600A0
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 19:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63FC91C2521F
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 18:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE017158D6C;
	Thu, 22 Feb 2024 18:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHRLaUE1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF001586E9;
	Thu, 22 Feb 2024 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708625668; cv=none; b=uJe2sDfWBAf53c9vC2p8AKbZ2SWeyQYibWtSDw/CvchwZ0IxNSw0u7AsC62OJSfwtuWnh08U0Q10rBmxsCzta1//75DQtpmkBfpMum0ChNnF9X0mTkbX4fALrMoR9n94MtAbD2rRmZQR/T899b7fuF2+9JZkoxj3Q0aisxSGvic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708625668; c=relaxed/simple;
	bh=iCFqgIxxRImjDlsxVjdWeSBRugMxQMzgQkdwDnPL2HA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YkxjABK4WiFpgizceHXHGwe02e6tPwFZ7+4WbM0Ogel75wGWxiwJCizrBr6dxw0c2hrsHO7sNPse0Pr6HrST5CaVxo6F66FdSIitq2X2Rz3Drr2awn7GPcBUpZ1wogxH02jUd84XotWGr6AKWpadyz9umVUNPuC17BT9mo8Fk7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHRLaUE1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A420C43390;
	Thu, 22 Feb 2024 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708625667;
	bh=iCFqgIxxRImjDlsxVjdWeSBRugMxQMzgQkdwDnPL2HA=;
	h=From:Subject:Date:To:Cc:From;
	b=PHRLaUE14Z/Q24wWaSLOhfMPg3UolThwsODM8EjLO0UvdYv5BvsEySyWxFoPdL/Qe
	 NBJYBbfZOHfRw9nPKMYmRxUhCi9VoHeZDT11KLeLiPu9jSS3BYXfdA7FWspl2fNTxH
	 x4uh9YMeBsQJeVarI3QnEUOydSJWrLkjtomPNr4PUtY24YALE2BfshEOwuDX/sFSjR
	 xI1Ga8xqq5sUevkL03ZtA8D3MDqb6LirFPlo7NU7hMJgaZSh/kBGjIli/Cqs/ivskK
	 uA1GZ+B8fvoIILrxdhe4lboy+cvfh+x+e3hwg/PJwwo2IlNwxCRkEcYOl3FcwrLkkD
	 87vGqYCuZ2A+g==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v7 00/36] drm/connector: Create HDMI Connector
 infrastructure
Date: Thu, 22 Feb 2024 19:13:46 +0100
Message-Id: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANuO12UC/43PTWrEMAwF4KsMXtdFlvzbVe9RusjYyoyZTgJxC
 JQhd68otKEEQlfiId4n9FCNp8pNvZweauKltjoOEsLTSeVrN1xY1yJZISBBNFbf7k1fy73qPA4
 D53mcdJu7mbU3PsTAPiQMSurX2mT5+S0vRsbbP5DFaNBgIzhbevLOvt54GvjjeZwu6l3UBTcpI
 RxIKJIJibB0pZRQdhL9SgbIHEgkEmE8Q9+xpS7sJLtJBuOBZEXKwQMaFwk87yS3SQjhQHIieUe
 RTSqe7P47/yNZuYYHkhept+dccgqJff9HWtf1C+Ghv90jAgAA
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8782; i=mripard@kernel.org;
 h=from:subject:message-id; bh=iCFqgIxxRImjDlsxVjdWeSBRugMxQMzgQkdwDnPL2HA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnX+15Ycnp7TPOxXvA0N/e+RVCvXRrPh/gfus7XymqaE
 mr/h3Z2lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCJ/lRgZ3rmGeusyzVqz9Mb0
 D2aPfrrJ9J5R5OJeV8ItsyVO5krDWkaGU40G+6RZ+U56FlitcJ8ZfunO3NImh7lGpZ+eWAtWzSz
 iAAA=
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
Changes in v7:
- Rebased on top of current next
- Only consider the Broadcast RGB property if the output format is RGB,
  and use a limited range otherwise
- Document the fact that Broadcast RGB only applies if the output format
  is RGB
- Add some test to make sure we always get a limited range if we have a
  YCbCr output format.
- Link to v6: https://lore.kernel.org/r/20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org

Changes in v6:
- Rebased on top of current next
- Split the tests into separate patches
- Improve the Broadcast RGB documentation
- Link to v5: https://lore.kernel.org/r/20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org

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
Maxime Ripard (36):
      drm/tests: helpers: Include missing drm_drv header
      drm/tests: helpers: Add atomic helpers
      drm/tests: Add helper to create mock plane
      drm/tests: Add helper to create mock crtc
      drm/tests: connector: Add tests for drmm_connector_init
      drm/connector: Introduce an HDMI connector initialization function
      drm/tests: connector: Add tests for drmm_connector_hdmi_init
      drm/connector: hdmi: Create an HDMI sub-state
      drm/connector: hdmi: Add output BPC to the connector state
      drm/tests: Add output bpc tests
      drm/connector: hdmi: Add support for output format
      drm/tests: Add output formats tests
      drm/connector: hdmi: Add HDMI compute clock helper
      drm/tests: Add HDMI TDMS character rate tests
      drm/connector: hdmi: Calculate TMDS character rate
      drm/tests: Add TDMS character rate connector state tests
      drm/connector: hdmi: Add custom hook to filter TMDS character rate
      drm/tests: Add HDMI connector rate filter hook tests
      drm/connector: hdmi: Compute bpc and format automatically
      drm/tests: Add HDMI connector bpc and format tests
      drm/connector: hdmi: Add Broadcast RGB property
      drm/tests: Add tests for Broadcast RGB property
      drm/connector: hdmi: Add RGB Quantization Range to the connector state
      drm/tests: Add RGB Quantization tests
      drm/connector: hdmi: Add Infoframes generation
      drm/tests: Add infoframes test
      drm/connector: hdmi: Create Infoframe DebugFS entries
      drm/vc4: hdmi: Switch to HDMI connector
      drm/vc4: tests: Remove vc4_dummy_plane structure
      drm/vc4: tests: Convert to plane creation helper
      drm/rockchip: inno_hdmi: Switch to HDMI connector
      drm/sun4i: hdmi: Convert encoder to atomic
      drm/sun4i: hdmi: Move mode_set into enable
      drm/sun4i: hdmi: Switch to container_of_const
      drm/sun4i: hdmi: Consolidate atomic_check and mode_valid
      drm/sun4i: hdmi: Switch to HDMI connector

 Documentation/gpu/kms-properties.csv               |    1 -
 drivers/gpu/drm/Kconfig                            |    1 +
 drivers/gpu/drm/drm_atomic.c                       |   11 +
 drivers/gpu/drm/drm_atomic_state_helper.c          |  667 +++++++
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
 drivers/gpu/drm/drm_connector.c                    |  268 +++
 drivers/gpu/drm/drm_debugfs.c                      |  110 ++
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  123 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  203 +-
 drivers/gpu/drm/tests/Makefile                     |    1 +
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 1944 ++++++++++++++++++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 1227 +++++++++++-
 drivers/gpu/drm/tests/drm_kunit_edid.h             |  482 +++++
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  150 ++
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |    6 +-
 drivers/gpu/drm/vc4/tests/vc4_mock.h               |    9 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c         |   44 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  638 +------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   44 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |    6 +-
 include/drm/drm_atomic_state_helper.h              |   12 +
 include/drm/drm_connector.h                        |  257 +++
 include/drm/drm_kunit_helpers.h                    |   23 +
 23 files changed, 5414 insertions(+), 817 deletions(-)
---
base-commit: e31185ce00a96232308300008db193416ceb9769
change-id: 20230814-kms-hdmi-connector-state-616787e67927

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


