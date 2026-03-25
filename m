Return-Path: <linux-media+bounces-56980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id weIONpXBw2n6twQAu9opvQ
	(envelope-from <linux-media+bounces-56980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:05:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE57323785
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA56A30F408D
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4C238D00F;
	Wed, 25 Mar 2026 10:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvlwH5k0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AB03C343A
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436321; cv=none; b=fcHPnYHsNug4xlNHCQFRaMgQvBLyDshufH54YDXV7R4akE0Pvf1uwOeiETYksKSmHIfjyq8og3fbj5urszt6gTb1Cz1JS550pQrJ8Ni+6tHzVX4kbbltflctiOFphQObYiZwqVIBZ/ulzxIWw2RBzua0hSoFdVgGVElUATzx53U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436321; c=relaxed/simple;
	bh=cp0o+veApI34kce4mfEtguYmTZDJNSDqtGDtcZA8NHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q4CsXwX3/aagJSiVTvRjK09NDdAmGASoNFhGxUM/I7SW5D1nME0k17n2l3+5HRAgcT0ETm7vDlmrv01qquwos9pkMALnQOf85nq/iM393EmufJbElLXZPsc/lZyH+4+x7mneJ1IkH+s6aYoeCdoe0XN+hJi7Dd/+py4xGtHcydU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvlwH5k0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436319; x=1805972319;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cp0o+veApI34kce4mfEtguYmTZDJNSDqtGDtcZA8NHE=;
  b=TvlwH5k053h+9ecLveYQP+XWLft4AlUADY/CqwQqfl804EaikRNXL+0w
   uHLzRD2x+dNi+wuHBQDCH5AbXK3NUDWa6D0vyrUfeQTQvG+q+7mEj7roz
   vU1tT/lF0SS2UyDDgO6tZ/9fFEk0fr9cQuWkrxauxWVbBMeGgNnL42R+X
   rJVbHza+s8DVbU+e8UlrP0W5w8vN/HWa6KYUTU1+MBuBzMPcQAG9M8keM
   cNQFl2dsb6IJIswPycMGQd9z5tFhMXy11MJGfKWOCQu70s+uZk+pYfHHL
   PgNjjm+yEyac1kmOgao9+kl953eymTsTlHTF2O4lYPih0BKyGM1J+gUL2
   A==;
X-CSE-ConnectionGUID: IMXFvPQVQV6lm9Sd+odSCg==
X-CSE-MsgGUID: rhsVsYVmRk2tT5DmkAG/jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75186783"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75186783"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:33 -0700
X-CSE-ConnectionGUID: ABEOUeigRBeGTOG68USqKA==
X-CSE-MsgGUID: 8reWeHdFT8uGN9g3UeFv5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="262568558"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:27 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7966C121CFF;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwI-00000004w9o-3WGZ;
	Wed, 25 Mar 2026 12:58:18 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 00/22] Metadata series preparation
Date: Wed, 25 Mar 2026 12:57:56 +0200
Message-ID: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Status: RO
Lines: 504
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56980-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BE57323785
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi folks,

This smallish set contains patches that prepare for merging the metadata
series.

There are simple cleanups but also two noteworthy changes: the addition of
the VALIDATE_LATE media link flag and the addition of the new struct
v4l2_subdev_client_info struct to the get_fmt, set_fmt, get_selection and
set_selection pad operation arguments.

The series now begins with a set of imx219 patches, fixes and cleanups
accrued during the conversion of the imx219 driver to use the common raw
sensor model. I wonder if all these should be backported.

The VALIDATE_LATE allows using the link_validate callback as the way to
validate the links connected to the sink pads of video nodes on pipelines
with multiple capture video nodes. Without this flag, the entire pipeline
will be validated at the time of the first streamon, with the V4L2 pixel
(or other) format set on the other capture video nodes at the time,
requiring all formats to be set before starting streaming anywhere. But
this does generally not match with what the userspace would do, hence the
new flag. The patches in the upcoming metadata series version adds the
support for the flag to the IPU6 driver.

The new struct v4l2_subdev_client_info enables passing around file handler
specific client capability information, which is used to differentiate
UAPI between existing users and those that are aware of the new common raw
sensor model. This is effectively required if we want to add support for
the new model to existing raw sensor drivers: the new model is in a direct
conflict with how things worked before the model. There still needs to be
a single driver internal state, the different UAPIs simply offer a
different view to that state. In-kernel users that do not deal with
capabilities just use NULL when calling these ops. This also means that
whatever client capabilities are being used, there may not be a change to
inter-driver interfaces such as get_fmt() when dealing with external pads.

I'm leaving the last Coccinelle-generated patch out this time as it's more
than 200 kiB. The patch can be found here
<URL:<https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata-pre>.
Patches 19--22 will be squashed together before merging.

The Coccinelle spatch used to generate the 22nd patch is below, as is a
Perl script to generate another Coccinelle patch doing the rest of the
job:

caps.cocci
------------------8<----------------------
@ fmt @
identifier a1, a2, a3;
identifier fn;

@@

  fn(struct v4l2_subdev *a1,
+ const struct v4l2_subdev_client_info *ci,
  struct v4l2_subdev_state *a2, struct v4l2_subdev_format *a3) {...}

@ sel @
identifier a1, a2, a3;
identifier fn2;

@@

  fn2(struct v4l2_subdev *a1,
+ const struct v4l2_subdev_client_info *ci,
  struct v4l2_subdev_state *a2, struct v4l2_subdev_selection *a3) {...}

@ fmt_call @
expression a1, a2, a3;
identifier fmt.fn;
@@

  fn(a1
+ , NULL
  , a2, a3);

@ fmt_call2 @
expression a1, a2, a3;
identifier fmt.fn;
@@

  return fn(a1
+ , NULL
  , a2, a3);


@ fmt_call3 @
expression ret, a1, a2, a3;
identifier fmt.fn;

@@

  ret = fn(a1
+ , NULL
  , a2, a3);

@ fmt_call4 @
expression a1, a2, a3;
identifier sel.fn2;
@@

  fn2(a1
+ , NULL
  , a2, a3);

@ fmt_call5 @
expression a1, a2, a3;
identifier sel.fn2;
@@

  return fn2(a1
+ , NULL
  , a2, a3);


@ fmt_call6 @
expression ret, a1, a2, a3;
identifier sel.fn2;

@@

  ret = fn2(a1
+ , NULL
  , a2, a3);

------------------8<----------------------

mk-caps2.pl
------------------8<----------------------
#!/usr/bin/perl -w

my @prefix = (
	"(void)",
	"",
	"ret = ",
	"return "
);

my $state_args = [
	[ "sd", "state", "fmt" ]
];

my $pad_active_args = [
	[ "sd", "pad", "get_fmt", "fmt" ],
	[ "sd", "pad", "set_fmt", "fmt" ],
	[ "sd", "pad", "get_selection", "fmt" ],
	[ "sd", "pad", "set_selection", "fmt" ],
];

my $pad_args = [
	[ "sd", "pad", "get_fmt", "state", "fmt" ],
	[ "sd", "pad", "set_fmt", "state", "fmt" ],
	[ "sd", "pad", "get_selection", "state", "fmt" ],
	[ "sd", "pad", "set_selection", "state", "fmt" ],
];

my $group_args = [
	[ "dev", "group", "pad", "get_fmt", "state", "fmt" ],
	[ "dev", "group", "pad", "set_fmt", "state", "fmt" ],
	[ "dev", "group", "pad", "get_selection", "state", "fmt" ],
	[ "dev", "group", "pad", "set_selection", "state", "fmt" ],
];

my %funcs = (
	# "function_name" => [ arg ref, new arg position from the end ],
	"v4l2_subdev_call" => { args => $pad_args, pos => 1 },
	"v4l2_device_call_all" => { args => $group_args, pos => 1 },
	"v4l2_subdev_get_fmt" => { args => $state_args, pos => 1 },
	"sensor_call" => { args => $pad_args, pos => 1 },
	"saa_call_all" => { args => $pad_args, pos => 1 },
	"call_all" => { args => $pad_args, pos => 1 },
	"v4l2_subdev_call_state_active" => { args => $pad_active_args, newname => "v4l2_subdev_call_ci_state_active" },
);

my $rule;

foreach my $p (@prefix) {
	foreach my $f (keys %funcs) {
		my $aref = $funcs{$f};

		foreach my $i (@{$aref->{args}}) {
			my $newname = $aref->{newname};

			print "@ rule" . $rule++ . " @\n";
			print "symbol $f;\n";
			print map {
				((/_/ || /^pad$/) ?
				"symbol" : "expression") . " $_;\n";
			} @$i;
			my @pre = @$i;
			my @post = splice @pre, $#pre - ($aref->{pos} // 0);
			print "identifier ret;\n" if $p =~ "ret =";
			print "@@\n";
			if (! defined $newname) {
				print "  $p$f(" . join(", ", @pre) . "\n";
				print "+ , NULL\n";
				print "  , " . join(", ", @post) . ");\n";
			} else {
				print "  $p\n";
				print "- $f(\n";
				print "+ $newname(\n";
				print "  " . join(", ", (@pre, @post)) . ");\n";
			}
		}
	}
}
------------------8<----------------------

since v2:

- Include imx219 driver fixes accrued during imx219 Common Raw Sensor
  Model support implementation. This includes fixes to control ranges and
  the removal of the rate_factor, among other things.

- Reword documentation of the VALIDATE_LATE link flag.

- Require that VALIDATE_LATE links sink (origin entity in this case) may
  have a single pad only.

- Drop the pipe argument from __media_pipeline_validate_one() as the
  function doesn't use it.

- Fix MUST_CONNECT flag validation for links that also have VALIDATE_LATE
  flag.

- Rename the macros to create wrapper functions, define one for "! defined
  CONFIG_MEDIA_CONTROLLER" case as well.

- Call v4l2_subdev_call_waive_fourth() v4l2_subdev_call_drop_fourth() now.

- Comment the link validation code a little better.

- Fix copying the routes in the routing cleanup patch (copy the same
  number of routes as before), rename the function doing it well. Make the
  new function copy_routes_state_to_routing() to take just routing and
  state arguments, for all callers have this information.

- Add a patch bumping the STREAMS sub-device capability bit and document
  that bit 0x2 is reserved.

since v1:

- Address compilation issues. I had only tested on arm64 previously.

- Introduce v4l2_subdev_call_ci_state_active(), to call pad ops with
  client info argument with active state. Getting around needing a new
  function doesn't seem easy (probably requires one more layer of
  indirection I'd like to do without).

Sakari Ailus (22):
  media: imx219: Rename "PIXEL_ARRAY" as "VISIBLE"
  media: imx219: Fix maximum frame length in lines
  media: imx219: Set horizontal blanking on mode change
  media: imx219: Scale the vblank limits according to rate_factor
  media: imx219: Fix vertical blanking and exposure for analogue binning
  media: imx219: Don't update exposure limits while setting format
  media: imx219: Rename "binning" as "bin_hv" in imx219_set_pad_format
  media: Documentation: Improve LINK_FREQ documentation
  media: Documentation: Improve pixel rate calculation documentation
  media: v4l2-subdev: Refactor returning routes
  media: v4l2-subdev: Allow accessing routes with STREAMS client
    capability
  media: mc: Simplify link processing in __media_pipeline_start()
  media: mc: Separate single link validation into a new function
  media: uapi: Bump the STREAMS bit a little
  media: mc: Don't care about unsettable flags in MEDIA_IOC_LINK_SETUP
  media: mc: Add MEDIA_LNK_FL_VALIDATE_LATE
  media: Improve enable_streams and disable_streams documentation
  media: v4l2-subdev: Move subdev client capabilities into a new struct
  media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad
    ops
  media: v4l2-subdev: Add v4l2_subdev_call_ci_active_state
  media: v4l2-subdev: Perform client info changes to i2c drivers
  media: v4l2-subdev: Add struct v4l2_subdev_client_info argument to pad
    ops

 Documentation/driver-api/media/tx-rx.rst      |   9 +-
 .../media/mediactl/media-ioc-setup-link.rst   |   4 +
 .../media/mediactl/media-types.rst            |   5 +
 .../media/v4l/ext-ctrls-image-process.rst     |   4 +-
 drivers/media/i2c/adv7170.c                   |   2 +
 drivers/media/i2c/adv7175.c                   |   2 +
 drivers/media/i2c/adv7180.c                   |   4 +-
 drivers/media/i2c/adv7183.c                   |   4 +-
 drivers/media/i2c/adv748x/adv748x-afe.c       |   4 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      |   3 +-
 drivers/media/i2c/adv748x/adv748x-hdmi.c      |   4 +-
 drivers/media/i2c/adv7511-v4l2.c              |   2 +
 drivers/media/i2c/adv7604.c                   |   3 +
 drivers/media/i2c/adv7842.c                   |   4 +-
 drivers/media/i2c/ak881x.c                    |   2 +
 drivers/media/i2c/alvium-csi2.c               |   3 +
 drivers/media/i2c/ar0521.c                    |   2 +
 drivers/media/i2c/ccs/ccs-core.c              |  15 +-
 drivers/media/i2c/cx25840/cx25840-core.c      |   1 +
 drivers/media/i2c/ds90ub913.c                 |   3 +-
 drivers/media/i2c/ds90ub953.c                 |   3 +-
 drivers/media/i2c/ds90ub960.c                 |   3 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |   2 +
 drivers/media/i2c/gc0308.c                    |   1 +
 drivers/media/i2c/gc0310.c                    |   1 +
 drivers/media/i2c/gc05a2.c                    |   4 +-
 drivers/media/i2c/gc08a3.c                    |   4 +-
 drivers/media/i2c/gc2145.c                    |   2 +
 drivers/media/i2c/hi556.c                     |   3 +
 drivers/media/i2c/hi846.c                     |   3 +
 drivers/media/i2c/hi847.c                     |   2 +
 drivers/media/i2c/imx111.c                    |   1 +
 drivers/media/i2c/imx208.c                    |   2 +
 drivers/media/i2c/imx214.c                    |   4 +-
 drivers/media/i2c/imx219.c                    |  98 ++++-------
 drivers/media/i2c/imx258.c                    |   3 +
 drivers/media/i2c/imx274.c                    |   4 +
 drivers/media/i2c/imx283.c                    |   2 +
 drivers/media/i2c/imx290.c                    |   4 +-
 drivers/media/i2c/imx296.c                    |   7 +-
 drivers/media/i2c/imx319.c                    |   2 +
 drivers/media/i2c/imx334.c                    |   4 +-
 drivers/media/i2c/imx335.c                    |   4 +-
 drivers/media/i2c/imx355.c                    |   2 +
 drivers/media/i2c/imx412.c                    |   4 +-
 drivers/media/i2c/imx415.c                    |   4 +-
 drivers/media/i2c/isl7998x.c                  |   2 +
 drivers/media/i2c/lt6911uxe.c                 |   5 +-
 drivers/media/i2c/max9286.c                   |   3 +-
 drivers/media/i2c/max96714.c                  |   3 +-
 drivers/media/i2c/max96717.c                  |   3 +-
 drivers/media/i2c/ml86v7667.c                 |   1 +
 drivers/media/i2c/mt9m001.c                   |   6 +-
 drivers/media/i2c/mt9m111.c                   |   4 +
 drivers/media/i2c/mt9m114.c                   |   6 +
 drivers/media/i2c/mt9p031.c                   |   4 +
 drivers/media/i2c/mt9t112.c                   |   4 +
 drivers/media/i2c/mt9v011.c                   |   1 +
 drivers/media/i2c/mt9v032.c                   |   4 +
 drivers/media/i2c/mt9v111.c                   |   2 +
 drivers/media/i2c/og01a1b.c                   |   3 +-
 drivers/media/i2c/og0ve1b.c                   |   3 +-
 drivers/media/i2c/os05b10.c                   |   2 +
 drivers/media/i2c/ov01a10.c                   |   3 +
 drivers/media/i2c/ov02a10.c                   |   4 +-
 drivers/media/i2c/ov02c10.c                   |   1 +
 drivers/media/i2c/ov02e10.c                   |   2 +
 drivers/media/i2c/ov08d10.c                   |   2 +
 drivers/media/i2c/ov08x40.c                   |   2 +
 drivers/media/i2c/ov13858.c                   |   2 +
 drivers/media/i2c/ov13b10.c                   |   2 +
 drivers/media/i2c/ov2640.c                    |   3 +
 drivers/media/i2c/ov2659.c                    |   2 +
 drivers/media/i2c/ov2680.c                    |   4 +
 drivers/media/i2c/ov2685.c                    |   3 +
 drivers/media/i2c/ov2735.c                    |   4 +-
 drivers/media/i2c/ov2740.c                    |   1 +
 drivers/media/i2c/ov4689.c                    |   2 +
 drivers/media/i2c/ov5640.c                    |   3 +
 drivers/media/i2c/ov5645.c                    |   4 +-
 drivers/media/i2c/ov5647.c                    |   3 +
 drivers/media/i2c/ov5648.c                    |   2 +
 drivers/media/i2c/ov5670.c                    |   3 +
 drivers/media/i2c/ov5675.c                    |   3 +
 drivers/media/i2c/ov5693.c                    |   4 +
 drivers/media/i2c/ov5695.c                    |   2 +
 drivers/media/i2c/ov6211.c                    |   3 +-
 drivers/media/i2c/ov64a40.c                   |   2 +
 drivers/media/i2c/ov7251.c                    |   5 +-
 drivers/media/i2c/ov7670.c                    |   2 +
 drivers/media/i2c/ov772x.c                    |   3 +
 drivers/media/i2c/ov7740.c                    |   2 +
 drivers/media/i2c/ov8856.c                    |   2 +
 drivers/media/i2c/ov8858.c                    |   3 +-
 drivers/media/i2c/ov8865.c                    |   3 +
 drivers/media/i2c/ov9282.c                    |   5 +-
 drivers/media/i2c/ov9640.c                    |   2 +
 drivers/media/i2c/ov9650.c                    |   2 +
 drivers/media/i2c/ov9734.c                    |   2 +
 drivers/media/i2c/rdacm20.c                   |   1 +
 drivers/media/i2c/rdacm21.c                   |   1 +
 drivers/media/i2c/rj54n1cb0c.c                |   4 +
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |   4 +
 drivers/media/i2c/s5k3m5.c                    |   4 +-
 drivers/media/i2c/s5k5baf.c                   |   4 +
 drivers/media/i2c/s5k6a3.c                    |   2 +
 drivers/media/i2c/s5kjn1.c                    |   4 +-
 drivers/media/i2c/saa6752hs.c                 |   2 +
 drivers/media/i2c/saa7115.c                   |   1 +
 drivers/media/i2c/saa717x.c                   |   1 +
 drivers/media/i2c/st-mipid02.c                |   1 +
 drivers/media/i2c/tc358743.c                  |   4 +-
 drivers/media/i2c/tc358746.c                  |   3 +-
 drivers/media/i2c/tda1997x.c                  |   2 +
 drivers/media/i2c/thp7312.c                   |   1 +
 drivers/media/i2c/tvp514x.c                   |   2 +
 drivers/media/i2c/tvp5150.c                   |   3 +
 drivers/media/i2c/tvp7002.c                   |   4 +-
 drivers/media/i2c/tw9900.c                    |   2 +
 drivers/media/i2c/tw9910.c                    |   3 +
 drivers/media/i2c/vd55g1.c                    |   4 +-
 drivers/media/i2c/vd56g3.c                    |   4 +-
 drivers/media/i2c/vgxy61.c                    |   5 +-
 drivers/media/mc/mc-entity.c                  | 161 +++++++++++++-----
 drivers/media/pci/cobalt/cobalt-driver.c      |   8 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c        |  14 +-
 drivers/media/pci/cx18/cx18-av-core.c         |   1 +
 drivers/media/pci/cx18/cx18-controls.c        |   2 +-
 drivers/media/pci/cx18/cx18-ioctl.c           |   2 +-
 drivers/media/pci/cx23885/cx23885-video.c     |   4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |   5 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |   2 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |   3 +-
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   1 +
 drivers/media/pci/intel/ivsc/mei_csi.c        |   1 +
 drivers/media/pci/ivtv/ivtv-controls.c        |   2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c           |   2 +-
 drivers/media/pci/saa7134/saa7134-empress.c   |   6 +-
 .../platform/amlogic/c3/isp/c3-isp-capture.c  |   2 +-
 .../platform/amlogic/c3/isp/c3-isp-core.c     |   1 +
 .../platform/amlogic/c3/isp/c3-isp-resizer.c  |   3 +
 .../amlogic/c3/mipi-adapter/c3-mipi-adap.c    |   3 +-
 .../amlogic/c3/mipi-csi2/c3-mipi-csi2.c       |   3 +-
 .../platform/arm/mali-c55/mali-c55-capture.c  |   2 +-
 .../platform/arm/mali-c55/mali-c55-isp.c      |   5 +-
 .../platform/arm/mali-c55/mali-c55-resizer.c  |  15 +-
 .../platform/arm/mali-c55/mali-c55-tpg.c      |   1 +
 drivers/media/platform/atmel/atmel-isi.c      |   4 +-
 .../media/platform/broadcom/bcm2835-unicam.c  |   3 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |   7 +-
 drivers/media/platform/cadence/cdns-csi2tx.c  |   7 +-
 drivers/media/platform/intel/pxa_camera.c     |   6 +-
 drivers/media/platform/marvell/mcam-core.c    |   4 +-
 .../platform/microchip/microchip-csi2dc.c     |   2 +
 .../platform/microchip/microchip-isc-base.c   |   1 +
 .../platform/microchip/microchip-isc-scaler.c |   3 +
 drivers/media/platform/nxp/imx-mipi-csis.c    |   5 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |   3 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |   3 +-
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |   3 +
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c |   3 +-
 .../media/platform/qcom/camss/camss-csid.c    |   4 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   4 +-
 .../media/platform/qcom/camss/camss-ispif.c   |   4 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |  17 +-
 .../media/platform/qcom/camss/camss-video.c   |   2 +-
 .../media/platform/raspberrypi/rp1-cfe/csi2.c |   1 +
 .../platform/raspberrypi/rp1-cfe/pisp-fe.c    |   3 +-
 drivers/media/platform/renesas/rcar-csi2.c    |   3 +-
 .../media/platform/renesas/rcar-isp/csisp.c   |   3 +-
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |   2 +-
 drivers/media/platform/renesas/renesas-ceu.c  |   7 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |   3 +-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |   3 +-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |   2 +-
 .../renesas/rzv2h-ivc/rzv2h-ivc-subdev.c      |   3 +-
 .../media/platform/renesas/vsp1/vsp1_brx.c    |   3 +
 .../media/platform/renesas/vsp1/vsp1_clu.c    |   1 +
 .../media/platform/renesas/vsp1/vsp1_drm.c    |  26 +--
 .../media/platform/renesas/vsp1/vsp1_entity.c |   4 +-
 .../media/platform/renesas/vsp1/vsp1_histo.c  |   9 +-
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |   1 +
 .../media/platform/renesas/vsp1/vsp1_iif.c    |   1 +
 .../media/platform/renesas/vsp1/vsp1_lif.c    |   1 +
 .../media/platform/renesas/vsp1/vsp1_lut.c    |   1 +
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |   3 +
 .../media/platform/renesas/vsp1/vsp1_sru.c    |   1 +
 .../media/platform/renesas/vsp1/vsp1_uds.c    |   1 +
 .../media/platform/renesas/vsp1/vsp1_uif.c    |   3 +
 .../media/platform/renesas/vsp1/vsp1_video.c  |   2 +-
 .../media/platform/renesas/vsp1/vsp1_vspx.c   |   3 +-
 .../platform/rockchip/rkcif/rkcif-interface.c |   5 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |   2 +-
 .../platform/rockchip/rkisp1/rkisp1-csi.c     |   3 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |   3 +
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |   3 +
 .../samsung/exynos4-is/fimc-capture.c         |  13 +-
 .../samsung/exynos4-is/fimc-isp-video.c       |   5 +-
 .../platform/samsung/exynos4-is/fimc-isp.c    |   2 +
 .../platform/samsung/exynos4-is/fimc-lite.c   |   8 +-
 .../platform/samsung/exynos4-is/mipi-csis.c   |   2 +
 .../samsung/s3c-camif/camif-capture.c         |   7 +-
 .../platform/samsung/s3c-camif/camif-core.c   |   4 +-
 drivers/media/platform/st/stm32/stm32-csi.c   |   1 +
 drivers/media/platform/st/stm32/stm32-dcmi.c  |   6 +-
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c    |   3 +-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c   |   3 +
 .../st/stm32/stm32-dcmipp/dcmipp-input.c      |   1 +
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |   2 +
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   2 +
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |   2 +
 .../sun8i_a83t_mipi_csi2.c                    |   2 +
 .../media/platform/synopsys/dw-mipi-csi2rx.c  |   3 +-
 .../media/platform/ti/am437x/am437x-vpfe.c    |   4 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |   3 +-
 drivers/media/platform/ti/cal/cal-video.c     |   6 +-
 .../media/platform/ti/davinci/vpif_capture.c  |   2 +-
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   |   2 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c  |   6 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c  |   4 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c  |   4 +-
 .../media/platform/ti/omap3isp/isppreview.c   |   6 +-
 .../media/platform/ti/omap3isp/ispresizer.c   |   6 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c |  12 +-
 drivers/media/platform/ti/vpe/vip.c           |   7 +-
 drivers/media/platform/via/via-camera.c       |   4 +-
 drivers/media/platform/video-mux.c            |   1 +
 .../media/platform/xilinx/xilinx-csi2rxss.c   |   2 +
 drivers/media/platform/xilinx/xilinx-dma.c    |   2 +-
 drivers/media/platform/xilinx/xilinx-tpg.c    |   2 +
 drivers/media/test-drivers/vimc/vimc-common.c |   2 +-
 .../media/test-drivers/vimc/vimc-debayer.c    |   3 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c |   3 +
 drivers/media/test-drivers/vimc/vimc-sensor.c |   1 +
 drivers/media/usb/cx231xx/cx231xx-417.c       |   2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c     |   4 +-
 drivers/media/usb/dvb-usb/cxusb-analog.c      |   6 +-
 drivers/media/usb/em28xx/em28xx-camera.c      |   2 +-
 drivers/media/usb/go7007/go7007-v4l2.c        |   2 +-
 drivers/media/usb/go7007/s2250-board.c        |   1 +
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c       |   2 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 120 ++++++++-----
 .../media/atomisp/i2c/atomisp-gc2235.c        |   2 +
 .../media/atomisp/i2c/atomisp-ov2722.c        |   2 +
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  16 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |   2 +
 .../media/atomisp/pci/atomisp_subdev.c        |   4 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   8 +-
 .../media/deprecated/atmel/atmel-isc-base.c   |   4 +-
 drivers/staging/media/imx/imx-ic-prp.c        |   2 +
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   2 +
 drivers/staging/media/imx/imx-media-capture.c |  14 +-
 drivers/staging/media/imx/imx-media-csi.c     |   4 +
 drivers/staging/media/imx/imx-media-utils.c   |   2 +-
 drivers/staging/media/imx/imx-media-vdic.c    |   2 +
 drivers/staging/media/imx/imx6-mipi-csi2.c    |   2 +
 drivers/staging/media/ipu3/ipu3-v4l2.c        |   4 +
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   |   2 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.c |   3 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   2 +
 drivers/staging/media/tegra-video/csi.c       |   2 +
 drivers/staging/media/tegra-video/vi.c        |  12 +-
 include/media/v4l2-subdev.h                   |  77 +++++++--
 include/uapi/linux/media.h                    |   1 +
 include/uapi/linux/v4l2-subdev.h              |   5 +-
 265 files changed, 1001 insertions(+), 372 deletions(-)

-- 
2.47.3


