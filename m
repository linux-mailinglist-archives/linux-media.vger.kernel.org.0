Return-Path: <linux-media+bounces-62839-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KPfOhBsFmoImQcAu9opvQ
	(envelope-from <linux-media+bounces-62839-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 05:59:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF95DF16B
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 05:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDD8A3030B13
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 03:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929762DB7B4;
	Wed, 27 May 2026 03:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2KJMioF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9EE280329
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 03:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779854299; cv=none; b=ensa61Kip+fIWB1DTd0+wy8r+Z3UCFwLgMBv4rTTm/kH2WA/AJx2horeHg1YRw+Pq7Cz24um7+qdNrR5L6Uk+J3GtB2IcjzWlUyZ8euQnWoYEB38wF7sRTOdurKjhgDJ2z71OEadosVGdoZXAKIKagRytoCwVBCNS6fsT/K2Bf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779854299; c=relaxed/simple;
	bh=ps52amL9pwI+spAbgc5vbCIurRT1jQt5ZiVwkoEtWx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LyEGKlITTypw2R9kB17YNuvUK2sdF0Cwv/v2gQ63r2luM+vpZAxURfcQ4AA0xl66llkb9h9Y2dTxJlPaxgJjmG+YVuexIy7D5HfDePA1mBIR4zPuZPTyc2QVfsXWEupKKaClQn3BjtKkdcQjXNWQwXnmr1kFMDE46fOEEBo6pTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2KJMioF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779854297; x=1811390297;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ps52amL9pwI+spAbgc5vbCIurRT1jQt5ZiVwkoEtWx0=;
  b=Q2KJMioFpoWNUUBsy+K6n/2INLbQHgBDpR4Ac8tATQj+6ifSwY2nb1la
   SKIGykOMB3jo7XSMbDSnvsx5ViRA3FRVHoihvio/xMqKncyz211bQ5Ckb
   cCWCZsYd9bizOoJDPYEYITlSvkjsmNS5QEEsv8HBROtEmsI6n3B35hLGO
   OtRtMwCMSfhE5N2odRfnGJ00fG49OCFvENqjS6/4tbXH2K3jtTP3Oz0q1
   mFxYP999dLOAJbVs3/tn28L8FK7zmjv23vCWh0txtz+9u7zHvpxXINoee
   hDmeJXiQBU8mcdSEQdJJrPPo9O9MzN6FRRoY8BUnjgGeOT08UeDSzSdMa
   w==;
X-CSE-ConnectionGUID: HSOx9vYoRsOn07mfBKYT4w==
X-CSE-MsgGUID: MUIaHheJQH6YqGP+lBtBmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80709337"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80709337"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 20:58:16 -0700
X-CSE-ConnectionGUID: +fn5H4C8QYGn/kwrTKzxKQ==
X-CSE-MsgGUID: mkgYWl9sQeGDZFhxQqpREw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="239501402"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 May 2026 20:58:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS5PH-000000003Mo-3zdN;
	Wed, 27 May 2026 03:58:11 +0000
Date: Wed, 27 May 2026 11:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 32/126]
 drivers/staging/media/max96712/max96712.c:267:13: error: incompatible
 function pointer types initializing 'int (*)(struct v4l2_subdev *, const
 struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct
 v4l2_subdev_format *)' with an expression o...
Message-ID: <202605271150.bla1wpwS-lkp@intel.com>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62839-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,xs4all.nl:email,01.org:url]
X-Rspamd-Queue-Id: 03FF95DF16B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   5b470f2ed717705b51f4a799722dffb34a37f10a
commit: 38747564cf6a09584e01ef987657f2943733510a [32/126] media: v4l2-subde=
v: Add struct v4l2_subdev_client_info pointer to pad ops
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/2026052=
7/202605271150.bla1wpwS-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260527/202605271150.bla1wpwS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271150.bla1wpwS-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/max96712/max96712.c:267:13: error: incompatible fu=
nction pointer types initializing 'int (*)(struct v4l2_subdev *, const stru=
ct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subde=
v_format *)' with an expression of type 'int (struct v4l2_subdev *, struct =
v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function=
-pointer-types]
     267 |         .set_fmt =3D v4l2_subdev_get_fmt,
         |                    ^~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/staging/media/tegra-video/vi.c:480:7: error: too few arguments t=
o function call, expected 4, have 3
     480 |                     v4l2_subdev_call(subdev, pad, get_selection,=
 NULL, &sdsel)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2022:20: note: expanded from macro 'v4l2_sub=
dev_call'
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
    ^
>> drivers/staging/media/tegra-video/vi.c:480:7: error: too few arguments t=
o function call, expected 4, have 3
     480 |                     v4l2_subdev_call(subdev, pad, get_selection,=
 NULL, &sdsel)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2024:43: note: expanded from macro 'v4l2_sub=
dev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   drivers/staging/media/tegra-video/vi.c:492:8: error: too few arguments t=
o function call, expected 4, have 3
     492 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, sd_state,=
 &fmt);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/media/v4l2-subdev.h:2022:20: note: expanded from macro 'v4l2_sub=
dev_call'
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
    ^
   drivers/staging/media/tegra-video/vi.c:492:8: error: too few arguments t=
o function call, expected 4, have 3
     492 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, sd_state,=
 &fmt);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/media/v4l2-subdev.h:2024:43: note: expanded from macro 'v4l2_sub=
dev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   drivers/staging/media/tegra-video/vi.c:546:8: error: too few arguments t=
o function call, expected 4, have 3
     546 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fm=
t);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2022:20: note: expanded from macro 'v4l2_sub=
dev_call'
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
    ^
   drivers/staging/media/tegra-video/vi.c:546:8: error: too few arguments t=
o function call, expected 4, have 3
     546 |         ret =3D v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fm=
t);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2024:43: note: expanded from macro 'v4l2_sub=
dev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   drivers/staging/media/tegra-video/vi.c:629:8: error: too few arguments t=
o function call, expected 4, have 3
     629 |         ret =3D v4l2_subdev_call(subdev, pad, get_selection, NUL=
L, &sdsel);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/media/v4l2-subdev.h:2022:20: note: expanded from macro 'v4l2_sub=
dev_call'
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
    ^
   drivers/staging/media/tegra-video/vi.c:629:8: error: too few arguments t=
o function call, expected 4, have 3
     629 |         ret =3D v4l2_subdev_call(subdev, pad, get_selection, NUL=
L, &sdsel);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/media/v4l2-subdev.h:2024:43: note: expanded from macro 'v4l2_sub=
dev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   drivers/staging/media/tegra-video/vi.c:670:8: error: too few arguments t=
o function call, expected 4, have 3
     670 |         ret =3D v4l2_subdev_call(subdev, pad, set_selection, NUL=
L, &sdsel);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/media/v4l2-subdev.h:2022:20: note: expanded from macro 'v4l2_sub=
dev_call'
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
    ^
   drivers/staging/media/tegra-video/vi.c:670:8: error: too few arguments t=
o function call, expected 4, have 3
     670 |         ret =3D v4l2_subdev_call(subdev, pad, set_selection, NUL=
L, &sdsel);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/media/v4l2-subdev.h:2024:43: note: expanded from macro 'v4l2_sub=
dev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   10 errors generated.
--
>> drivers/media/platform/renesas/sh_vou.c:716:8: error: too few arguments =
to function call, expected 4, have 3
     716 |         ret =3D v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0=
, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
     717 |                                          set_fmt, NULL, &format);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-device.h:448:2: note: expanded from macro 'v4l2_devic=
e_call_until_err'
     448 |         __v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,  =
        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
     449 |                         (grpid) =3D=3D 0 || __sd->grp_id =3D=3D =
(grpid), o, f , \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
     450 |                         ##args);                                =
        \
         |                         ~~~~~~~
   include/media/v4l2-device.h:356:41: note: expanded from macro '__v4l2_de=
vice_call_subdevs_until_err_p'
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                 ~~~~~~~~~~~~~~~              ^
   drivers/media/platform/renesas/sh_vou.c:976:2: error: too few arguments =
to function call, expected 4, have 3
     976 |         v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     977 |                                    set_selection, NULL, &sd_sel);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-device.h:448:2: note: expanded from macro 'v4l2_devic=
e_call_until_err'
     448 |         __v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,  =
        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
     449 |                         (grpid) =3D=3D 0 || __sd->grp_id =3D=3D =
(grpid), o, f , \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
     450 |                         ##args);                                =
        \
         |                         ~~~~~~~
   include/media/v4l2-device.h:356:41: note: expanded from macro '__v4l2_de=
vice_call_subdevs_until_err_p'
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                 ~~~~~~~~~~~~~~~              ^
   drivers/media/platform/renesas/sh_vou.c:980:8: error: too few arguments =
to function call, expected 4, have 3
     980 |         ret =3D v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0=
, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
     981 |                                          set_fmt, NULL, &format);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-device.h:448:2: note: expanded from macro 'v4l2_devic=
e_call_until_err'
     448 |         __v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,  =
        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
     449 |                         (grpid) =3D=3D 0 || __sd->grp_id =3D=3D =
(grpid), o, f , \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
     450 |                         ##args);                                =
        \
         |                         ~~~~~~~
   include/media/v4l2-device.h:356:41: note: expanded from macro '__v4l2_de=
vice_call_subdevs_until_err_p'
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                 ~~~~~~~~~~~~~~~              ^
   3 errors generated.
--
>> drivers/media/platform/st/stm32/stm32-dcmi.c:741:9: error: too few argum=
ents to function call, expected 4, have 3
     741 |                 ret =3D v4l2_subdev_call(subdev, pad, set_fmt, N=
ULL, &fmt);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/media/v4l2-subdev.h:2022:20: note: expanded from macro 'v4l2_sub=
dev_call'
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
    ^
>> drivers/media/platform/st/stm32/stm32-dcmi.c:741:9: error: too few argum=
ents to function call, expected 4, have 3
     741 |                 ret =3D v4l2_subdev_call(subdev, pad, set_fmt, N=
ULL, &fmt);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/media/v4l2-subdev.h:2024:43: note: expanded from macro 'v4l2_sub=
dev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:8: error: too few argu=
ments to function call, expected 4, have 3
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2116:15: note: expanded from macro 'v4l2_sub=
dev_call_state_try'
    2116 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2022:20: note: expanded from macro 'v4l2_sub=
dev_call'
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
    ^
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:8: error: too few argu=
ments to function call, expected 4, have 3
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2116:15: note: expanded from macro 'v4l2_sub=
dev_call_state_try'
    2116 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2024:43: note: expanded from macro 'v4l2_sub=
dev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ~~~~~~~~~~~~~~~             ^
>> drivers/media/platform/st/stm32/stm32-dcmi.c:1227:8: error: incompatible=
 pointer types passing 'struct v4l2_subdev_state *' to parameter of type 'c=
onst struct v4l2_subdev_client_info *' [-Wincompatible-pointer-types]
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
    1228 |                                          &format);
         |                                          ~~~~~~~~
   include/media/v4l2-subdev.h:2116:42: note: expanded from macro 'v4l2_sub=
dev_call_state_try'
    2116 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
>> drivers/media/platform/st/stm32/stm32-dcmi.c:1227:8: error: incompatible=
 pointer types passing 'struct v4l2_subdev_state *' to parameter of type 'c=
onst struct v4l2_subdev_client_info *' [-Wincompatible-pointer-types]
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
    1228 |                                          &format);
         |                                          ~~~~~~~~
   include/media/v4l2-subdev.h:2116:42: note: expanded from macro 'v4l2_sub=
dev_call_state_try'
    2116 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1250:8: error: too few argu=
ments to function call, expected 4, have 3
    1250 |         ret =3D v4l2_subdev_call(dcmi->source, pad, get_selectio=
n,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1251 |                                NULL, &bounds);
         |                                ~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2022:20: note: expanded from macro 'v4l2_sub=
dev_call'
    2021 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2022 |                                                         __sd, ##=
args);  \
         |                                                                 =
    ^
   drivers/media/platform/st/stm32/stm32-dcmi.c:1250:8: error: too few argu=
ments to function call, expected 4, have 3
    1250 |         ret =3D v4l2_subdev_call(dcmi->source, pad, get_selectio=
n,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1251 |                                NULL, &bounds);
         |                                ~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2024:43: note: expanded from macro 'v4l2_sub=
dev_call'
    2024 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ~~~~~~~~~~~~~~~             ^
   8 errors generated.


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

