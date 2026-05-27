Return-Path: <linux-media+bounces-62838-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GANVAxRhFmolmAcAu9opvQ
	(envelope-from <linux-media+bounces-62838-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 05:12:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECD25DECDF
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 05:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A0C3301E6FA
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 03:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878DE301486;
	Wed, 27 May 2026 03:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DodefmbI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF389283FCE
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 03:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779851534; cv=none; b=XbN1CRmfvQtFWMp56PAIqzcUjwZ/zlKEZUQiw9xY9hnXV+g8Dq9X56g4zr/n9cWeH/BYDo8G0JPg8qJ2gJV7JL4NlZghefSBx1qbCmIy/GFhVAa8A0fqmg6cBkNUluHU3Z5KRYN2p7BgiKaZsNiyudZY1JoYu43Evox/k5lL9Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779851534; c=relaxed/simple;
	bh=P4vkIvrBzmTA7kPSFNd+CotkJVjAY889iUu8NEn7Lq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ShRQixlOQ9lBFF9C2NVx7bu7LPZS+TdzzwwlDc7vJMTqsPwdAPQ7M+hJCxcZAjICMCSeqwBszP+lRHbXxlOV9a8RgaRtTblfUXm0BZRc2EmnUPe3dnNCDAZQ8q1wKGnQN1pwk//ByVqxJKcihgK7P9PWvxNcA/hRdsW/0OA56l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DodefmbI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779851531; x=1811387531;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P4vkIvrBzmTA7kPSFNd+CotkJVjAY889iUu8NEn7Lq0=;
  b=DodefmbI2k4XrLQ8No3djjDNqklNn0SxffJhL7rW/CmkDD4J6O2LNdiB
   hm3fh9rBLyQ48eP4uX5OpN3ydTcjwfF0pANQ2f5FgeM/uQBULakoJiIWa
   XijOUMA+l/wMmtwtX6FzB8I6EBs47G8M9nQO8Bqapg6FvVnTgQMHwp6BV
   kxiE1hL3f2rrb+96Hg7MQ5Rm/nOHhAQup7LBlBDI12KGDlEHR9r5qadja
   Hf4Dxofv3pzLFNdVpDlspe3Dhaq2Rjk3ZPA0DIQW5YvDaSijqcd9jJzQv
   IOXDpKgEuMvUzFUVpWeny9GtwRAjhOtVqdAQqcgO60CahWbLGzgsrF/kq
   A==;
X-CSE-ConnectionGUID: CMGu8T/2QLel29h8C2am6g==
X-CSE-MsgGUID: nxcLWksLT22KsOZeanDJKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80862952"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80862952"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 20:12:11 -0700
X-CSE-ConnectionGUID: p4YRKexHRqSNrB2O8OkmHA==
X-CSE-MsgGUID: lFl9NVlnTLqQBgoHS/SHFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="243929841"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 May 2026 20:12:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS4gh-000000003JQ-0cZh;
	Wed, 27 May 2026 03:12:07 +0000
Date: Wed, 27 May 2026 11:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 32/126]
 drivers/staging/media/max96712/max96712.c:267:20: error: initialization of
 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct
 v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer
 type 'int (*)(struct v4l2...
Message-ID: <202605271111.UVoTvlKX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [1.04 / 15.00];
	LONG_SUBJ(2.21)[294];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62838-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 5ECD25DECDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   5b470f2ed717705b51f4a799722dffb34a37f10a
commit: 38747564cf6a09584e01ef987657f2943733510a [32/126] media: v4l2-subde=
v: Add struct v4l2_subdev_client_info pointer to pad ops
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260527/=
202605271111.UVoTvlKX-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260527/202605271111.UVoTvlKX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271111.UVoTvlKX-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/max96712/max96712.c:267:20: error: initialization =
of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, s=
truct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible =
pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, str=
uct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
     267 |         .set_fmt =3D v4l2_subdev_get_fmt,
         |                    ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/max96712/max96712.c:267:20: note: (near initializa=
tion for 'max96712_pad_ops.set_fmt')
   In file included from drivers/staging/media/max96712/max96712.c:17:
   include/media/v4l2-subdev.h:1491:5: note: 'v4l2_subdev_get_fmt' declared=
 here
    1491 | int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subd=
ev_state *state,
         |     ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/media/v4l2-device.h:13,
                    from drivers/staging/media/tegra-video/vi.h:19,
                    from drivers/staging/media/tegra-video/vi.c:30:
   drivers/staging/media/tegra-video/vi.c: In function '__tegra_channel_try=
_format':
>> drivers/staging/media/tegra-video/vi.c:480:72: error: passing argument 3=
 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->g=
et_selection' from incompatible pointer type [-Wincompatible-pointer-types]
     480 |                     v4l2_subdev_call(subdev, pad, get_selection,=
 NULL, &sdsel)) {
         |                                                                 =
       ^~~~~~
         |                                                                 =
       |
         |                                                                 =
       struct v4l2_subdev_selection *
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/staging/media/tegra-video/vi.c:480:72: note: expected 'struct v4=
l2_subdev_state *' but argument is of type 'struct v4l2_subdev_selection *'
     480 |                     v4l2_subdev_call(subdev, pad, get_selection,=
 NULL, &sdsel)) {
         |                                                                 =
       ^~~~~~
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:2021:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get=
_selection'; expected 4, have 3
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c:480:21: note: in expansion of mac=
ro 'v4l2_subdev_call'
     480 |                     v4l2_subdev_call(subdev, pad, get_selection,=
 NULL, &sdsel)) {
         |                     ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:874:15: note: declared here
     874 |         int (*get_selection)(struct v4l2_subdev *sd,
         |               ^~~~~~~~~~~~~
>> drivers/staging/media/tegra-video/vi.c:480:72: error: passing argument 3=
 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection' f=
rom incompatible pointer type [-Wincompatible-pointer-types]
     480 |                     v4l2_subdev_call(subdev, pad, get_selection,=
 NULL, &sdsel)) {
         |                                                                 =
       ^~~~~~
         |                                                                 =
       |
         |                                                                 =
       struct v4l2_subdev_selection *
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/staging/media/tegra-video/vi.c:480:72: note: expected 'struct v4=
l2_subdev_state *' but argument is of type 'struct v4l2_subdev_selection *'
     480 |                     v4l2_subdev_call(subdev, pad, get_selection,=
 NULL, &sdsel)) {
         |                                                                 =
       ^~~~~~
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:2024:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'; ex=
pected 4, have 3
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/staging/media/tegra-video/vi.c:480:21: note: in expansion of mac=
ro 'v4l2_subdev_call'
     480 |                     v4l2_subdev_call(subdev, pad, get_selection,=
 NULL, &sdsel)) {
         |                     ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:874:15: note: declared here
     874 |         int (*get_selection)(struct v4l2_subdev *sd,
         |               ^~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c:492:54: error: passing argument 2=
 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->s=
et_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     492 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, sd_state,=
 &fmt);
         |                                                      ^~~~~~~~
         |                                                      |
         |                                                      struct v4l2=
_subdev_state *
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/staging/media/tegra-video/vi.c:492:54: note: expected 'const str=
uct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_subdev_=
state *'
     492 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, sd_state,=
 &fmt);
         |                                                      ^~~~~~~~
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/staging/media/tegra-video/vi.c:492:64: error: passing argument 3=
 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->s=
et_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     492 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, sd_state,=
 &fmt);
         |                                                                ^=
~~~
         |                                                                |
         |                                                                s=
truct v4l2_subdev_format *
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/staging/media/tegra-video/vi.c:492:64: note: expected 'struct v4=
l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
     492 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, sd_state,=
 &fmt);
         |                                                                ^=
~~~
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:2021:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c:492:15: note: in expansion of mac=
ro 'v4l2_subdev_call'
     492 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, sd_state,=
 &fmt);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:870:15: note: declared here
     870 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/staging/media/tegra-video/vi.c:492:54: error: passing argument 2=
 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from in=
compatible pointer type [-Wincompatible-pointer-types]
     492 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, sd_state,=
 &fmt);
         |                                                      ^~~~~~~~
         |                                                      |
         |                                                      struct v4l2=
_subdev_state *
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/staging/media/tegra-video/vi.c:492:54: note: expected 'const str=
uct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_subdev_=
state *'
     492 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, sd_state,=
 &fmt);
         |                                                      ^~~~~~~~
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/staging/media/tegra-video/vi.c:492:64: error: passing argument 3=
 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from in=
compatible pointer type [-Wincompatible-pointer-types]
     492 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, sd_state,=
 &fmt);
         |                                                                ^=
~~~
         |                                                                |
         |                                                                s=
truct v4l2_subdev_format *
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/staging/media/tegra-video/vi.c:492:64: note: expected 'struct v4=
l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
     492 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, sd_state,=
 &fmt);
         |                                                                ^=
~~~
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:2024:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/staging/media/tegra-video/vi.c:492:15: note: in expansion of mac=
ro 'v4l2_subdev_call'
     492 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, sd_state,=
 &fmt);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:870:15: note: declared here
     870 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/staging/media/tegra-video/vi.c: In function 'tegra_channel_set_f=
ormat':
   drivers/staging/media/tegra-video/vi.c:546:60: error: passing argument 3=
 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->s=
et_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     546 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fm=
t);
         |                                                            ^~~~
         |                                                            |
         |                                                            struc=
t v4l2_subdev_format *
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/staging/media/tegra-video/vi.c:546:60: note: expected 'struct v4=
l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
     546 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fm=
t);
         |                                                            ^~~~
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:2021:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c:546:15: note: in expansion of mac=
ro 'v4l2_subdev_call'
     546 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fm=
t);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:870:15: note: declared here
     870 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/staging/media/tegra-video/vi.c:546:60: error: passing argument 3=
 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from in=
compatible pointer type [-Wincompatible-pointer-types]
     546 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fm=
t);
         |                                                            ^~~~
         |                                                            |
         |                                                            struc=
t v4l2_subdev_format *
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/staging/media/tegra-video/vi.c:546:60: note: expected 'struct v4=
l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
     546 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fm=
t);
         |                                                            ^~~~
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:2024:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/staging/media/tegra-video/vi.c:546:15: note: in expansion of mac=
ro 'v4l2_subdev_call'
     546 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fm=
t);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:870:15: note: declared here
     870 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/staging/media/tegra-video/vi.c: In function 'tegra_channel_g_sel=
ection':
   drivers/staging/media/tegra-video/vi.c:629:66: error: passing argument 3=
 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->g=
et_selection' from incompatible pointer type [-Wincompatible-pointer-types]
     629 |         ret =3D v4l2_subdev_call(subdev, pad, get_selection, NUL=
L, &sdsel);
         |                                                                 =
 ^~~~~~
         |                                                                 =
 |
         |                                                                 =
 struct v4l2_subdev_selection *
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/staging/media/tegra-video/vi.c:629:66: note: expected 'struct v4=
l2_subdev_state *' but argument is of type 'struct v4l2_subdev_selection *'
     629 |         ret =3D v4l2_subdev_call(subdev, pad, get_selection, NUL=
L, &sdsel);
         |                                                                 =
 ^~~~~~
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:2021:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get=
_selection'; expected 4, have 3
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c:629:15: note: in expansion of mac=
ro 'v4l2_subdev_call'
     629 |         ret =3D v4l2_subdev_call(subdev, pad, get_selection, NUL=
L, &sdsel);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:874:15: note: declared here
     874 |         int (*get_selection)(struct v4l2_subdev *sd,
         |               ^~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c:629:66: error: passing argument 3=
 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection' f=
rom incompatible pointer type [-Wincompatible-pointer-types]
     629 |         ret =3D v4l2_subdev_call(subdev, pad, get_selection, NUL=
L, &sdsel);
         |                                                                 =
 ^~~~~~
         |                                                                 =
 |
         |                                                                 =
 struct v4l2_subdev_selection *
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/staging/media/tegra-video/vi.c:629:66: note: expected 'struct v4=
l2_subdev_state *' but argument is of type 'struct v4l2_subdev_selection *'
     629 |         ret =3D v4l2_subdev_call(subdev, pad, get_selection, NUL=
L, &sdsel);
         |                                                                 =
 ^~~~~~
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:2024:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'; ex=
pected 4, have 3
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/staging/media/tegra-video/vi.c:629:15: note: in expansion of mac=
ro 'v4l2_subdev_call'
     629 |         ret =3D v4l2_subdev_call(subdev, pad, get_selection, NUL=
L, &sdsel);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:874:15: note: declared here
     874 |         int (*get_selection)(struct v4l2_subdev *sd,
         |               ^~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c: In function 'tegra_channel_s_sel=
ection':
   drivers/staging/media/tegra-video/vi.c:670:66: error: passing argument 3=
 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->s=
et_selection' from incompatible pointer type [-Wincompatible-pointer-types]
     670 |         ret =3D v4l2_subdev_call(subdev, pad, set_selection, NUL=
L, &sdsel);
         |                                                                 =
 ^~~~~~
         |                                                                 =
 |
         |                                                                 =
 struct v4l2_subdev_selection *
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/staging/media/tegra-video/vi.c:670:66: note: expected 'struct v4=
l2_subdev_state *' but argument is of type 'struct v4l2_subdev_selection *'
     670 |         ret =3D v4l2_subdev_call(subdev, pad, set_selection, NUL=
L, &sdsel);
         |                                                                 =
 ^~~~~~
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   include/media/v4l2-subdev.h:2021:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_selection'; expected 4, have 3
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c:670:15: note: in expansion of mac=
ro 'v4l2_subdev_call'
     670 |         ret =3D v4l2_subdev_call(subdev, pad, set_selection, NUL=
L, &sdsel);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:878:15: note: declared here
     878 |         int (*set_selection)(struct v4l2_subdev *sd,
         |               ^~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c:670:66: error: passing argument 3=
 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection' f=
rom incompatible pointer type [-Wincompatible-pointer-types]
     670 |         ret =3D v4l2_subdev_call(subdev, pad, set_selection, NUL=
L, &sdsel);
         |                                                                 =
 ^~~~~~
         |                                                                 =
 |
         |                                                                 =
 struct v4l2_subdev_selection *
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/staging/media/tegra-video/vi.c:670:66: note: expected 'struct v4=
l2_subdev_state *' but argument is of type 'struct v4l2_subdev_selection *'
     670 |         ret =3D v4l2_subdev_call(subdev, pad, set_selection, NUL=
L, &sdsel);
         |                                                                 =
 ^~~~~~
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   include/media/v4l2-subdev.h:2024:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection'; ex=
pected 4, have 3
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/staging/media/tegra-video/vi.c:670:15: note: in expansion of mac=
ro 'v4l2_subdev_call'
     670 |         ret =3D v4l2_subdev_call(subdev, pad, set_selection, NUL=
L, &sdsel);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:878:15: note: declared here
     878 |         int (*set_selection)(struct v4l2_subdev *sd,
         |               ^~~~~~~~~~~~~
--
   In file included from include/media/v4l2-mc.h:15,
                    from include/media/tuner.h:14,
                    from drivers/media/usb/dvb-usb/cxusb-analog.c:31:
   drivers/media/usb/dvb-usb/cxusb-analog.c: In function 'cxusb_medion_try_=
s_fmt_vid_cap':
   drivers/media/usb/dvb-usb/cxusb-analog.c:1034:68: error: passing argumen=
t 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)=
->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    1034 |         ret =3D v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, N=
ULL, &subfmt);
         |                                                                 =
   ^~~~~~~
         |                                                                 =
   |
         |                                                                 =
   struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/usb/dvb-usb/cxusb-analog.c:1034:68: note: expected 'struct=
 v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
    1034 |         ret =3D v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, N=
ULL, &subfmt);
         |                                                                 =
   ^~~~~~~
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:2021:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/dvb-usb/cxusb-analog.c:1034:15: note: in expansion of =
macro 'v4l2_subdev_call'
    1034 |         ret =3D v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, N=
ULL, &subfmt);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:870:15: note: declared here
     870 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/usb/dvb-usb/cxusb-analog.c:1034:68: error: passing argumen=
t 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from=
 incompatible pointer type [-Wincompatible-pointer-types]
    1034 |         ret =3D v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, N=
ULL, &subfmt);
         |                                                                 =
   ^~~~~~~
         |                                                                 =
   |
         |                                                                 =
   struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/usb/dvb-usb/cxusb-analog.c:1034:68: note: expected 'struct=
 v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
    1034 |         ret =3D v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, N=
ULL, &subfmt);
         |                                                                 =
   ^~~~~~~
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:2024:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/media/usb/dvb-usb/cxusb-analog.c:1034:15: note: in expansion of =
macro 'v4l2_subdev_call'
    1034 |         ret =3D v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, N=
ULL, &subfmt);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:870:15: note: declared here
     870 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/usb/dvb-usb/cxusb-analog.c: In function 'cxusb_medion_anal=
og_init':
   drivers/media/usb/dvb-usb/cxusb-analog.c:1516:68: error: passing argumen=
t 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)=
->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    1516 |         ret =3D v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, N=
ULL, &subfmt);
         |                                                                 =
   ^~~~~~~
         |                                                                 =
   |
         |                                                                 =
   struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/usb/dvb-usb/cxusb-analog.c:1516:68: note: expected 'struct=
 v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
    1516 |         ret =3D v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, N=
ULL, &subfmt);
         |                                                                 =
   ^~~~~~~
   include/media/v4l2-subdev.h:2022:65: note: in definition of macro 'v4l2_=
subdev_call'
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:2021:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/dvb-usb/cxusb-analog.c:1516:15: note: in expansion of =
macro 'v4l2_subdev_call'
    1516 |         ret =3D v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, N=
ULL, &subfmt);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:870:15: note: declared here
     870 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/usb/dvb-usb/cxusb-analog.c:1516:68: error: passing argumen=
t 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from=
 incompatible pointer type [-Wincompatible-pointer-types]
    1516 |         ret =3D v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, N=
ULL, &subfmt);
         |                                                                 =
   ^~~~~~~
         |                                                                 =
   |
         |                                                                 =
   struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/usb/dvb-usb/cxusb-analog.c:1516:68: note: expected 'struct=
 v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
    1516 |         ret =3D v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, N=
ULL, &subfmt);
         |                                                                 =
   ^~~~~~~
   include/media/v4l2-subdev.h:2024:60: note: in definition of macro 'v4l2_=
subdev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:2024:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/media/usb/dvb-usb/cxusb-analog.c:1516:15: note: in expansion of =
macro 'v4l2_subdev_call'
    1516 |         ret =3D v4l2_subdev_call(cxdev->cx25840, pad, set_fmt, N=
ULL, &subfmt);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:870:15: note: declared here
     870 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
..


vim +267 drivers/staging/media/max96712/max96712.c

ce44dc1feab5f0 Niklas S=C3=B6derlund 2024-05-10  264 =20
5814f32fef137e Niklas S=C3=B6derlund 2021-09-12  265  static const struct v=
4l2_subdev_pad_ops max96712_pad_ops =3D {
ce44dc1feab5f0 Niklas S=C3=B6derlund 2024-05-10  266  	.get_fmt =3D v4l2_su=
bdev_get_fmt,
ce44dc1feab5f0 Niklas S=C3=B6derlund 2024-05-10 @267  	.set_fmt =3D v4l2_su=
bdev_get_fmt,
5814f32fef137e Niklas S=C3=B6derlund 2021-09-12  268  };
5814f32fef137e Niklas S=C3=B6derlund 2021-09-12  269 =20

:::::: The code at line 267 was first introduced by commit
:::::: ce44dc1feab5f038edb39dc443b32eae3ac1234d media: staging: max96712: S=
tore format in subdev active state

:::::: TO: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

