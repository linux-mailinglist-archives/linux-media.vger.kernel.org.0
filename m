Return-Path: <linux-media+bounces-55395-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE3QAw5vsWlVvAIAu9opvQ
	(envelope-from <linux-media+bounces-55395-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:33:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6971226498E
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1E893032DFA
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F43232AAD6;
	Wed, 11 Mar 2026 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="RTBBNnwM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Kxfx4r5m"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC72731E838;
	Wed, 11 Mar 2026 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235869; cv=none; b=T2fv8MO9rmNWy9qKE4okESDvfkmcK4dobKBf/HHnOA7yaUhwO7Q582w7OSo2e1ly/eU5AC3/SE1rmYFt0f+hFz+e4jjLbMCSs+Ibl959GmMAilRml3eACTOqwLX7sPt6DFS4YAXK2IAlYGdWXtwzWY8fZqv4ilMLEFRcREYrZRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235869; c=relaxed/simple;
	bh=WtGx85zzN50kECEMyhs/v7fyzIOmi6sEIUpxX1xhC5A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B/fbWagY9nhAXKm5Ytos71mHRI4C2Bk+9acdpHvmV7DcrlwCdx37vgfW6kmtxVmDIO8bg/1BTPPjpKLDB9fqaAG3bZAf7MoC2Gws91/XQLO8Fid0oQObfT6DMbj8gVHmcRQaPWi/HeadMMyr36m3/RZDw9Ss9j6V9T3XZc7WO5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=RTBBNnwM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Kxfx4r5m; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 36320EC054B;
	Wed, 11 Mar 2026 09:31:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 11 Mar 2026 09:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1773235866; x=
	1773322266; bh=PxQb2V2Fou8rTkuux256Q0skxkrdbs4f3HHxTCCknzc=; b=R
	TBBNnwMzCrjdZ566HkIE7M5K2O0RbFftj0zf1Z3gY4OhGobjHbpkX/npDn9SEq9+
	mm7OHDMzN0xjouKEZJruz2QE4NJb2Y4pYwp9YtItSUx1inRTYYk9FsBqWMW5fO6+
	WSXscfj1jJCYcHb4thcAu3+Aprw44s8OQh/7p18WXHyIDiR7cRCf/2Ou4sT2M+TV
	nEuHqRzXpmQwY49155Fn3/A5nmG2TpryjTaiIJsGYtStwfcWigKcXC0oV4o/MdB9
	RawV83LEP3tPkZN/X08WbHvbmj5rnun0dJN0A6xcPSjwIzN8/P2aKg++VCwJTIro
	KkW1m8SOMppFvPqp5MqsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1773235866; x=1773322266; bh=PxQb2V2Fou8rTkuux256Q0skxkrd
	bs4f3HHxTCCknzc=; b=Kxfx4r5mXFTLC8K6SeOzroxXfbuFTjhzm6bv8dSCVBw9
	IkGbJspLLp/8zeqEn89bwdrx4r4BQn89HXIVh+dhWNTZbaBYsDY6CXCDjLMfTanm
	Lyj9GizksnURkZR9rEpBYirJhKwPtTtXi+rGlgwBLshTBN1P0XmmuOLRxWaLRE5e
	sDys8H9Hyqw3FIx38aJFB4nuaZZPMfUPf+WfrQLi2VXEm1TCzrlb59PLgfNHZAlb
	wN7nau2XDdZZG83OQkYV3yHP3ijxe7k4/ud0g1Ms/vI1E7YHyr//rSKqjMTji603
	fZAXlskzKJExEe7QFPpJJ7VVgMJH12nVuhGwYCKVbw==
X-ME-Sender: <xms:mW6xaQ4xtb2v8UmMNV64NkI3B0-D-61efzjB-pXgQh2EdUAArekHxg>
    <xme:mW6xaTe0zh9G0eW9UT8T7G54x8g2ds07RhTKaT8BJ3sF-AAYu03jlCOROVnS65MzJ
    3_wbyoHpccFlgscgxru7WwoRBRp5PyMUjxXbL-X9W8KiEoyVW1yvg>
X-ME-Received: <xmr:mW6xaeu7Klztg0JYd5BQYr9gnum4plGxlzHBHt8ixn1d5ADdXrTEnF6aGjqBTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeegtdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeghrghlthgvrhcu
    hggvrhhnvghrucfutghhnhgvihguvghruceotghonhhtrggtthesshgthhhnfigrlhhtvg
    hrrdgvuheqnecuggftrfgrthhtvghrnhepieetfeduudffvdefveeufeefhfdvhfejudev
    vdeileegieejhfeftefgfeffleevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhnthgr
    tghtsehstghhnhifrghlthgvrhdrvghupdhnsggprhgtphhtthhopeduuddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtghophho
    rdhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehkrhiikh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheptghonhhtrggtthesshgthhhnfigrlhhtvghrrdgvuh
X-ME-Proxy: <xmx:mW6xabn2qdSBWPb5ngost1HhZCMtqpt0V_fUBmnnTYzZoTVpe6mLRA>
    <xmx:mW6xaZRQLeoHi1ien0MKRBUbL2iXh4jL34jHP8_ZlsVpBLFu3g-21w>
    <xmx:mW6xaZLFil4J7fVePN795euKzapcz_QrskbgDIvsAmhy4q2lya-kbA>
    <xmx:mW6xabFsHyrCLcjTosqkkBZk_lGMXgtEFFZItGy4zkxIjWno15f8hw>
    <xmx:mm6xad4yzWULKfoOf5K8uLAQzp3SG9wCuDrTashq-huIOBh5EuXlMiGl>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Mar 2026 09:31:03 -0400 (EDT)
From: Walter Werner Schneider <contact@schnwalter.eu>
Subject: [PATCH v7 0/2] media: i2c: Add ov2732 image sensor driver
Date: Wed, 11 Mar 2026 15:30:45 +0200
Message-Id: <20260311-ov2732-driver-v7-0-2e036d7b679e@schnwalter.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVusWkC/33QwWrEIBCA4VdZPNeio6Oxp75H6SHRSSOUZNGtu
 2XJu9csLAQJZU7/wHyHubNMKVJmb6c7S1Rijstcw76cmJ/6+Yt4DLUZCEAJ0vKlgFXAQ4qFEgf
 qyAsMavDI6s050RhvD+/js/YU82VJvw++yG37lLpGKpILLjzR6MBrIc179tN87b8vlF7ph21ag
 X8FqMI4WKOM1sGAPxLUXnCtoKqA1gVpkRw4OhL0TgBoBV2FTiuDQOicE0cC7gXVClgFpXvcXgp
 OHgrmKRghBbaCqYJDLwdRp7dDK6zr+gdPLuQi+AEAAA==
X-Change-ID: 20251217-ov2732-driver-2e8ec05d3bc5
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Walter Werner Schneider <contact@schnwalter.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773235863; l=6595;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=WtGx85zzN50kECEMyhs/v7fyzIOmi6sEIUpxX1xhC5A=;
 b=ayZYGBQy13/xnR78Eqc87sdoiGyB3cvHv7Uw9pf5gGdD/tIDcpiM7klU0tGu1XnS6yX73SUzq
 PhPB4HwoL/uB9+VuJMNfjxm25qh2lsQNph+HGzeu1NqQKm4DgAVwepk
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=
X-Rspamd-Queue-Id: 6971226498E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[schnwalter.eu,quarantine];
	R_DKIM_ALLOW(-0.20)[schnwalter.eu:s=fm2,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[schnwalter.eu:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55395-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@schnwalter.eu,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,schnwalter.eu:dkim,schnwalter.eu:email,schnwalter.eu:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

This patch series introduces a new driver for the OmniVision OV2732 image
sensor.

The driver was written from scratch using modern V4L2 APIs, taking
inspiration from existing camera sensor drivers like the Sony IMX219 and
with help from the libcamera folks on IRC.

This initial version provides basic support for the sensor, future patches
will add additional features.

I'm new to all this, so feel free to point out anything that can be
improved.

$ v4l2-compliance -d /dev/v4l-subdev4
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev4:

Driver Info:
        Driver version   : 6.18.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000002
interval-uses-which 
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev4 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 14 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev4: 45, Succeeded: 45, Failed: 0, Warnings: 0

Dependencies:
- media: v4l2-fwnode: Return -EPROBE_DEFER on parsing NULL endpoints
  https://lore.kernel.org/linux-media/20260310141157.1186325-1-sakari.ailus@linux.intel.com/

P.S. I only tried this as an out-of-tree module against the 6.18.0 kernel in
a Yocto project, I'm not sure how to test it against 6.19-rc1. But I did
compile it with 6.19-rc1 and ran dt_binding_check and checkpatch.

P.S.2 Thank you for the reviews.

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
Changes in v7:
- Removed redundant parentheses.
- Removed endpoint check, see Dependencies for required patch set.
- Link to v6: https://lore.kernel.org/r/20260105-ov2732-driver-v6-0-95c1b0b0ba7b@schnwalter.eu

Changes in v6:
- Dropped clock name and OV2732_NUM_SUPPLIES.
- Added 4 more test patterns.
- Use fwnode_graph_get_endpoint_by_id.
- Use pm_runtime_set_suspended instead of pm_runtime_put_noidle.
- Removed redundant error message.
- Reduced max analogue gain value.
- Link to v5: https://lore.kernel.org/r/20251223-ov2732-driver-v5-0-34a53bc52910@schnwalter.eu

Changes in v5:
- Fixed register size for gains.
- Fixed digital gain max value.
- Fixed value set to the exposure register, fixes low brightness.
- Link to v4: https://lore.kernel.org/r/20251222-ov2732-driver-v4-0-843652e59990@schnwalter.eu

Changes in v4:
- Set the pixel rate ops to NULL.
- Link to v3: https://lore.kernel.org/r/20251219-ov2732-driver-v3-0-579d175e929e@schnwalter.eu

Changes in v3:
- Cleanup state of GPIO.
- Renamed pwdn GPIO to powerdown.
- Removed unused format variable from ov2732_set_fmt.
- Removed properties from DT bindings.
- Replaced the two 1ms delays with a doubling of the 8192 cycles delay.
- Link to v2: https://lore.kernel.org/r/20251218-ov2732-driver-v2-0-fb763644d62c@schnwalter.eu

Changes in v2:
- Adjusted delays in power up, power down and start of stream. Only a
  single 10ms sleep remains, looks like I've read the datasheet wrong.
- The intermittent communication errors are solved by a single 1ms sleep
  in the right place.
- Added missing format values in ov2732_init_state.
- Set default GPIO pin state in ov2732_probe.
- Other small changes: comments, name capitalization, removed unused.
  variables.
- Link to v1: https://lore.kernel.org/r/20251218-ov2732-driver-v1-0-0ceef92c4016@schnwalter.eu

---
Walter Werner Schneider (2):
      dt-bindings: media: i2c: Add ov2732 image sensor
      media: i2c: Add ov2732 image sensor driver

 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml | 103 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  13 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/ov2732.c                         | 790 +++++++++++++++++++++
 5 files changed, 914 insertions(+)
---
base-commit: f6390408a846aacc2171c17d88b062e202d84e86
change-id: 20251217-ov2732-driver-2e8ec05d3bc5

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>


