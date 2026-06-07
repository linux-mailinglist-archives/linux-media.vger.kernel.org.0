Return-Path: <linux-media+bounces-64087-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CDwjDJLoJWruNQIAu9opvQ
	(envelope-from <linux-media+bounces-64087-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:54:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B86651C38
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:54:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=LsA9WO8i;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64087-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64087-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D87E6300DDD3
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 21:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7C033A70E;
	Sun,  7 Jun 2026 21:54:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792CD2ED872
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:54:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869259; cv=none; b=HK+czRAevvSRmrQ3zoypjbziPOAokkNDs2jn1VI4FuiVdS6o9aWxNgc8oteZQ4rnBIXXUxC3b2Fc3LB7SgAB0DACGksXYTlvWFLyfDtiq4pPUPJ6NegEjXs1dRrjR5mpiGoP5HcKyKOAZCYtkM6R31IDnRifCoVXcfUKEzGd3AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869259; c=relaxed/simple;
	bh=OaAgyn6aWQ4bWDALV9nVcadzhi1OjFeX/uq6SGJhkrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qo2M/j+kDb2JRMsfiB60dIVsF0EkR/fssAtBaX3srnP3YnV9tRmOe+x8TUeEU+m5Fy1ml/6hmIX3qD9Plszz+FU6To45d+G9gg/jNSUVa9eSNDKqrowrlweFPZPoMyVsNO+OW1K+/9EaFaY0ZbSdfAk9Tu9erm/vn5Wd62IUvBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsA9WO8i; arc=none smtp.client-ip=192.198.163.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780869256; x=1812405256;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OaAgyn6aWQ4bWDALV9nVcadzhi1OjFeX/uq6SGJhkrM=;
  b=LsA9WO8iHZ/pCbRoiKd0juZefqa/l2gGv+xGM572KfiLzOlNBJUZEC84
   a9TwkJz9ik/zMzl7i8TQaGKkkpXWpclWzJtNuSg+e0CiPI/mvcSGvSJIT
   AR3WEAat9kTO4II7nP42eu/EKMzQajUqsWqIPd7OWaExx27D1L3L69oDb
   2GeAXKk8+jjwyeefDsvij7f5nAI+XWiMbQnTRVyEJ7Ug+PYT44GWTeb7b
   MooMCS8K/rtstBud1Jnfm8zYPtZ34XlQvZbbEHhVgRIWBkIukSPNlDv9b
   Fm+Cx/EZoG+AR/bFkIIzZeBjt3JR1C16XVvC4n3GmqP71XXlCprkXL9xy
   g==;
X-CSE-ConnectionGUID: xy9qA6hlRIKwISCrKdXoNg==
X-CSE-MsgGUID: 3fcLtfiOTeit2I+JZ4BspQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="107048241"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="107048241"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 14:54:15 -0700
X-CSE-ConnectionGUID: 1JmsewxpTIWjs2KQEsyGCQ==
X-CSE-MsgGUID: JdOWt9i3S9eD2j75bwYYcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245490479"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.101])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 14:54:09 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A80B7121C4C;
	Mon, 08 Jun 2026 00:54:07 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wWLRM-00000003XIC-0XGn;
	Mon, 08 Jun 2026 00:53:56 +0300
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
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v5 00/10] Metadata series preparation
Date: Mon,  8 Jun 2026 00:53:46 +0300
Message-ID: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-64087-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,linux.intel.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,mk-caps2.pl:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54B86651C38

Hi folks,

This smallish set contains patches that prepare for merging the metadata
series.

There are simple cleanups but also a noteworthy change: the addition of
the new struct v4l2_subdev_client_info struct to the set_fmt,
get_selection and set_selection pad operation arguments.

The series now begins with a set of imx219 patches, fixes and cleanups
accrued during the conversion of the imx219 driver to use the common raw
sensor model. I wonder if all these should be backported.

The new struct v4l2_subdev_client_info enables passing around file handler
specific client capability information, which is used to differentiate
UAPI between existing users and those that are aware of the new common raw
sensor model. This is effectively required if we want to add support for
the new model to existing raw sensor drivers: the new model is in a direct
conflict with how the imx219 driver in particular worked before the common
raw sensor model.

There still needs to be a single driver internal state, the different
UAPIs simply offer a different view to that state. The get_fmt() pad op
does not have the client_info argument as the get_fmt() is called by other
drivers inside the kernel so there's no concept of "client info" there nor
the format returned by the callback should have depended on it.

The Coccinelle spatch used to generate most of the driver changes in the
last patch is below, as is a Perl script to generate another Coccinelle
patch doing the rest of the job:

caps.cocci
------------------8<----------------------
@ fmt @
identifier a1, a2, a3;
identifier fn =~ ".*_set.*";

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
	#[ "sd", "pad", "get_fmt", "fmt" ],
	[ "sd", "pad", "set_fmt", "fmt" ],
	[ "sd", "pad", "get_selection", "fmt" ],
	[ "sd", "pad", "set_selection", "fmt" ],
];

my $pad_args = [
	#[ "sd", "pad", "get_fmt", "state", "fmt" ],
	[ "sd", "pad", "set_fmt", "state", "fmt" ],
	[ "sd", "pad", "get_selection", "state", "fmt" ],
	[ "sd", "pad", "set_selection", "state", "fmt" ],
];

my $group_args = [
	#[ "dev", "group", "pad", "get_fmt", "state", "fmt" ],
	[ "dev", "group", "pad", "set_fmt", "state", "fmt" ],
	[ "dev", "group", "pad", "get_selection", "state", "fmt" ],
	[ "dev", "group", "pad", "set_selection", "state", "fmt" ],
];

my %funcs = (
	# "function_name" => [ arg ref, new arg position from the end ],
	"v4l2_subdev_call" => { args => $pad_args, pos => 1 },
	"v4l2_device_call_all" => { args => $group_args, pos => 1 },
	#"v4l2_subdev_get_fmt" => { args => $state_args, pos => 1 },
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

since v4:

- Merge mergeable patches that have received acks in time.

- Drop the VALIDATE_LATE MC link flag from this set.

- Move the frame descriptor patches out of the set.

- Do not add the client_info argument to the get_fmt() pad op.

- Introduce v4l2_subdev_get_fmt_ci() which returns the pad format but uses
  the same arguments (i.e. also the client info argument) as the set_fmt()
  pad op.

- Call the VISIBLE area in v4 as ACTIVE_AREA (imx219 driver; patch
  merged).

- Set the pixel_rate control's ops to NULL (the control is read-only and
  not applied on device).

- Fix imx219 driver's limits for VBLANK, HBLANK and EXPOSURE controls.

- Postpone the patch bumping the STREAMS capability bit.

- Fix stopping streams documentation in patch "media: Improve
  enable_streams and disable_streams documentation".

since v3:

- Include the patch adding v4l2_subdev_get_frame_desc(); compared to the
  version posted earlier, this one uses get_fmt() pad op.

- Removed kernel-doc documentation from sub-device ops in drivers. These
  comments are redundant.

- Include v4l2_subdev_client_info changes for ov2732 and t4ka3 drivers.

- Fix setting media link flags.

- Fix the condition for skipping early validation (and doing it later).
  The old condition sometimes caused the link being validated too early.

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

Sakari Ailus (10):
  media: Documentation: Improve pixel rate calculation documentation
  media: imx219: Scale the vblank limits according to rate_factor
  media: imx219: Account rate_factor in setting upper exposure limit
  media: imx219: Make control handler ops for PIXEL_RATE NULL
  media: imx219: Rename "binning" as "bin_hv" in imx219_set_pad_format
  media: imx219: Fix vertical blanking and exposure for analogue binning
  media: Improve enable_streams and disable_streams documentation
  media: v4l2-subdev: Move subdev client capabilities into a new struct
  media: v4l2-subdev: Add v4l2_subdev_get_fmt_ci()
  media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad
    ops

 Documentation/driver-api/media/tx-rx.rst      |  6 +-
 drivers/media/i2c/adv7170.c                   |  1 +
 drivers/media/i2c/adv7175.c                   |  1 +
 drivers/media/i2c/adv7180.c                   |  3 +-
 drivers/media/i2c/adv7183.c                   |  3 +-
 drivers/media/i2c/adv748x/adv748x-afe.c       |  1 +
 drivers/media/i2c/adv748x/adv748x-csi2.c      |  1 +
 drivers/media/i2c/adv748x/adv748x-hdmi.c      |  1 +
 drivers/media/i2c/adv7511-v4l2.c              |  1 +
 drivers/media/i2c/adv7604.c                   |  2 +
 drivers/media/i2c/adv7842.c                   |  1 +
 drivers/media/i2c/ak881x.c                    |  3 +-
 drivers/media/i2c/alvium-csi2.c               |  3 +
 drivers/media/i2c/ar0521.c                    |  1 +
 drivers/media/i2c/ccs/ccs-core.c              | 12 ++-
 drivers/media/i2c/cx25840/cx25840-core.c      |  1 +
 drivers/media/i2c/ds90ub913.c                 |  1 +
 drivers/media/i2c/ds90ub953.c                 |  1 +
 drivers/media/i2c/ds90ub960.c                 |  1 +
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  1 +
 drivers/media/i2c/gc0308.c                    |  1 +
 drivers/media/i2c/gc0310.c                    |  3 +-
 drivers/media/i2c/gc05a2.c                    |  4 +-
 drivers/media/i2c/gc08a3.c                    |  4 +-
 drivers/media/i2c/gc2145.c                    |  2 +
 drivers/media/i2c/hi556.c                     |  2 +
 drivers/media/i2c/hi846.c                     |  2 +
 drivers/media/i2c/hi847.c                     |  1 +
 drivers/media/i2c/imx111.c                    |  1 +
 drivers/media/i2c/imx208.c                    |  1 +
 drivers/media/i2c/imx214.c                    |  4 +-
 drivers/media/i2c/imx219.c                    | 48 ++++++------
 drivers/media/i2c/imx258.c                    |  2 +
 drivers/media/i2c/imx274.c                    |  3 +
 drivers/media/i2c/imx283.c                    |  2 +
 drivers/media/i2c/imx290.c                    |  4 +-
 drivers/media/i2c/imx296.c                    |  7 +-
 drivers/media/i2c/imx319.c                    |  1 +
 drivers/media/i2c/imx334.c                    |  3 +-
 drivers/media/i2c/imx335.c                    |  4 +-
 drivers/media/i2c/imx355.c                    |  1 +
 drivers/media/i2c/imx412.c                    |  3 +-
 drivers/media/i2c/imx415.c                    |  4 +-
 drivers/media/i2c/isl7998x.c                  |  1 +
 drivers/media/i2c/lt6911uxe.c                 |  5 +-
 drivers/media/i2c/max9286.c                   |  1 +
 drivers/media/i2c/max96714.c                  |  1 +
 drivers/media/i2c/max96717.c                  |  1 +
 drivers/media/i2c/ml86v7667.c                 |  2 +-
 drivers/media/i2c/mt9m001.c                   |  5 +-
 drivers/media/i2c/mt9m111.c                   |  3 +
 drivers/media/i2c/mt9m114.c                   |  6 ++
 drivers/media/i2c/mt9p031.c                   |  3 +
 drivers/media/i2c/mt9t112.c                   |  3 +
 drivers/media/i2c/mt9v011.c                   |  1 +
 drivers/media/i2c/mt9v032.c                   |  3 +
 drivers/media/i2c/mt9v111.c                   |  1 +
 drivers/media/i2c/og01a1b.c                   |  3 +-
 drivers/media/i2c/og0ve1b.c                   |  3 +-
 drivers/media/i2c/os05b10.c                   |  2 +
 drivers/media/i2c/ov01a10.c                   |  3 +
 drivers/media/i2c/ov02a10.c                   |  3 +-
 drivers/media/i2c/ov02c10.c                   |  1 +
 drivers/media/i2c/ov02e10.c                   |  1 +
 drivers/media/i2c/ov08d10.c                   |  1 +
 drivers/media/i2c/ov08x40.c                   |  1 +
 drivers/media/i2c/ov13858.c                   |  1 +
 drivers/media/i2c/ov13b10.c                   |  1 +
 drivers/media/i2c/ov2640.c                    |  2 +
 drivers/media/i2c/ov2659.c                    |  1 +
 drivers/media/i2c/ov2680.c                    |  3 +
 drivers/media/i2c/ov2685.c                    |  2 +
 drivers/media/i2c/ov2732.c                    |  4 +-
 drivers/media/i2c/ov2735.c                    |  4 +-
 drivers/media/i2c/ov2740.c                    |  1 +
 drivers/media/i2c/ov4689.c                    |  2 +
 drivers/media/i2c/ov5640.c                    |  2 +
 drivers/media/i2c/ov5645.c                    |  4 +-
 drivers/media/i2c/ov5647.c                    |  2 +
 drivers/media/i2c/ov5648.c                    |  1 +
 drivers/media/i2c/ov5670.c                    |  2 +
 drivers/media/i2c/ov5675.c                    |  2 +
 drivers/media/i2c/ov5693.c                    |  3 +
 drivers/media/i2c/ov5695.c                    |  1 +
 drivers/media/i2c/ov6211.c                    |  3 +-
 drivers/media/i2c/ov64a40.c                   |  2 +
 drivers/media/i2c/ov7251.c                    |  4 +-
 drivers/media/i2c/ov7670.c                    |  1 +
 drivers/media/i2c/ov772x.c                    |  2 +
 drivers/media/i2c/ov7740.c                    |  1 +
 drivers/media/i2c/ov8856.c                    |  1 +
 drivers/media/i2c/ov8858.c                    |  3 +-
 drivers/media/i2c/ov8865.c                    |  2 +
 drivers/media/i2c/ov9282.c                    |  4 +-
 drivers/media/i2c/ov9640.c                    |  2 +
 drivers/media/i2c/ov9650.c                    |  1 +
 drivers/media/i2c/ov9734.c                    |  1 +
 drivers/media/i2c/rdacm20.c                   |  2 +-
 drivers/media/i2c/rdacm21.c                   |  2 +-
 drivers/media/i2c/rj54n1cb0c.c                |  3 +
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  2 +
 drivers/media/i2c/s5k3m5.c                    |  4 +-
 drivers/media/i2c/s5k5baf.c                   |  3 +
 drivers/media/i2c/s5k6a3.c                    |  1 +
 drivers/media/i2c/s5kjn1.c                    |  4 +-
 drivers/media/i2c/saa6752hs.c                 |  1 +
 drivers/media/i2c/saa7115.c                   |  1 +
 drivers/media/i2c/saa717x.c                   |  1 +
 drivers/media/i2c/st-mipid02.c                |  1 +
 drivers/media/i2c/t4ka3.c                     |  3 +
 drivers/media/i2c/tc358743.c                  |  1 +
 drivers/media/i2c/tc358746.c                  |  1 +
 drivers/media/i2c/tda1997x.c                  |  1 +
 drivers/media/i2c/thp7312.c                   |  1 +
 drivers/media/i2c/tvp514x.c                   |  1 +
 drivers/media/i2c/tvp5150.c                   |  4 +-
 drivers/media/i2c/tvp7002.c                   |  1 +
 drivers/media/i2c/tw9900.c                    |  1 +
 drivers/media/i2c/tw9910.c                    |  2 +
 drivers/media/i2c/vd55g1.c                    |  4 +-
 drivers/media/i2c/vd56g3.c                    |  4 +-
 drivers/media/i2c/vgxy61.c                    |  4 +-
 drivers/media/pci/cobalt/cobalt-driver.c      |  8 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c        | 10 +--
 drivers/media/pci/cx18/cx18-av-core.c         |  1 +
 drivers/media/pci/cx18/cx18-controls.c        |  2 +-
 drivers/media/pci/cx18/cx18-ioctl.c           |  2 +-
 drivers/media/pci/cx23885/cx23885-video.c     |  4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  1 +
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  2 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  1 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  1 +
 drivers/media/pci/intel/ivsc/mei_csi.c        |  1 +
 drivers/media/pci/ivtv/ivtv-controls.c        |  2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c           |  2 +-
 drivers/media/pci/saa7134/saa7134-empress.c   |  4 +-
 drivers/media/platform/amd/isp4/isp4_subdev.c |  1 +
 drivers/media/platform/amd/isp4/isp4_video.c  |  2 +-
 .../platform/amlogic/c3/isp/c3-isp-core.c     |  1 +
 .../platform/amlogic/c3/isp/c3-isp-resizer.c  |  3 +
 .../amlogic/c3/mipi-adapter/c3-mipi-adap.c    |  1 +
 .../amlogic/c3/mipi-csi2/c3-mipi-csi2.c       |  1 +
 .../platform/arm/mali-c55/mali-c55-isp.c      |  3 +
 .../platform/arm/mali-c55/mali-c55-resizer.c  | 15 +++-
 .../platform/arm/mali-c55/mali-c55-tpg.c      |  1 +
 drivers/media/platform/atmel/atmel-isi.c      |  4 +-
 .../media/platform/broadcom/bcm2835-unicam.c  |  1 +
 drivers/media/platform/cadence/cdns-csi2rx.c  |  1 +
 drivers/media/platform/cadence/cdns-csi2tx.c  |  1 +
 drivers/media/platform/intel/pxa_camera.c     |  6 +-
 drivers/media/platform/marvell/mcam-core.c    |  4 +-
 .../platform/microchip/microchip-csi2dc.c     |  1 +
 .../platform/microchip/microchip-isc-scaler.c |  2 +
 drivers/media/platform/nxp/imx-mipi-csis.c    |  3 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |  1 +
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  1 +
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  3 +
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c |  1 +
 .../media/platform/qcom/camss/camss-csid.c    |  3 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |  3 +-
 .../media/platform/qcom/camss/camss-ispif.c   |  3 +-
 drivers/media/platform/qcom/camss/camss-tpg.c |  3 +-
 drivers/media/platform/qcom/camss/camss-vfe.c | 12 ++-
 .../media/platform/raspberrypi/rp1-cfe/csi2.c |  1 +
 .../platform/raspberrypi/rp1-cfe/pisp-fe.c    |  1 +
 drivers/media/platform/renesas/rcar-csi2.c    |  1 +
 .../media/platform/renesas/rcar-isp/csisp.c   |  1 +
 drivers/media/platform/renesas/renesas-ceu.c  |  7 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  3 +-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  3 +-
 .../renesas/rzv2h-ivc/rzv2h-ivc-subdev.c      |  1 +
 drivers/media/platform/renesas/sh_vou.c       |  4 +-
 .../media/platform/renesas/vsp1/vsp1_brx.c    |  3 +
 .../media/platform/renesas/vsp1/vsp1_drm.c    | 18 +++--
 .../media/platform/renesas/vsp1/vsp1_entity.c |  4 +-
 .../media/platform/renesas/vsp1/vsp1_entity.h |  1 +
 .../media/platform/renesas/vsp1/vsp1_histo.c  |  3 +
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  1 +
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  3 +
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  1 +
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  1 +
 .../media/platform/renesas/vsp1/vsp1_uif.c    |  2 +
 .../media/platform/renesas/vsp1/vsp1_vspx.c   |  3 +-
 .../platform/rockchip/rkcif/rkcif-interface.c |  3 +
 .../platform/rockchip/rkisp1/rkisp1-csi.c     |  1 +
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  3 +
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  3 +
 .../samsung/exynos4-is/fimc-capture.c         |  7 +-
 .../platform/samsung/exynos4-is/fimc-isp.c    |  1 +
 .../platform/samsung/exynos4-is/fimc-lite.c   |  3 +
 .../platform/samsung/exynos4-is/mipi-csis.c   |  1 +
 .../samsung/s3c-camif/camif-capture.c         |  3 +
 .../platform/samsung/s3c-camif/camif-core.c   |  2 +-
 drivers/media/platform/st/stm32/stm32-csi.c   |  1 +
 drivers/media/platform/st/stm32/stm32-dcmi.c  |  7 +-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c   |  3 +
 .../st/stm32/stm32-dcmipp/dcmipp-input.c      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  1 +
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |  1 +
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |  1 +
 .../sun8i_a83t_mipi_csi2.c                    |  1 +
 .../media/platform/synopsys/dw-mipi-csi2rx.c  |  1 +
 .../media/platform/ti/am437x/am437x-vpfe.c    |  2 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |  1 +
 drivers/media/platform/ti/cal/cal-video.c     |  4 +-
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   |  1 +
 drivers/media/platform/ti/omap3isp/ispccdc.c  |  5 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c  |  3 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c  |  3 +-
 .../media/platform/ti/omap3isp/isppreview.c   |  5 +-
 .../media/platform/ti/omap3isp/ispresizer.c   |  5 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c |  4 +-
 drivers/media/platform/ti/vpe/vip.c           |  4 +-
 drivers/media/platform/via/via-camera.c       |  4 +-
 drivers/media/platform/video-mux.c            |  1 +
 .../media/platform/xilinx/xilinx-csi2rxss.c   |  1 +
 drivers/media/platform/xilinx/xilinx-tpg.c    |  1 +
 .../media/test-drivers/vimc/vimc-debayer.c    |  1 +
 drivers/media/test-drivers/vimc/vimc-scaler.c |  3 +
 drivers/media/test-drivers/vimc/vimc-sensor.c |  1 +
 drivers/media/usb/cx231xx/cx231xx-417.c       |  2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c     |  4 +-
 drivers/media/usb/dvb-usb/cxusb-analog.c      |  6 +-
 drivers/media/usb/em28xx/em28xx-camera.c      |  2 +-
 drivers/media/usb/go7007/go7007-v4l2.c        |  2 +-
 drivers/media/usb/go7007/s2250-board.c        |  1 +
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c       |  2 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 78 ++++++++++++++-----
 .../media/atomisp/i2c/atomisp-gc2235.c        |  1 +
 .../media/atomisp/i2c/atomisp-ov2722.c        |  1 +
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 16 ++--
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  1 +
 .../media/atomisp/pci/atomisp_subdev.c        |  3 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  8 +-
 drivers/staging/media/imx/imx-ic-prp.c        |  1 +
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  1 +
 drivers/staging/media/imx/imx-media-csi.c     |  3 +
 drivers/staging/media/imx/imx-media-vdic.c    |  1 +
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  1 +
 drivers/staging/media/ipu3/ipu3-v4l2.c        |  3 +
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   |  2 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.c |  1 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.h |  1 +
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |  1 +
 drivers/staging/media/tegra-video/csi.c       |  1 +
 drivers/staging/media/tegra-video/vi.c        | 10 +--
 include/media/v4l2-subdev.h                   | 41 +++++++++-
 247 files changed, 612 insertions(+), 183 deletions(-)

-- 
2.47.3

