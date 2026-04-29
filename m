Return-Path: <linux-media+bounces-59908-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJXJE/yO8WlIiAEAu9opvQ
	(envelope-from <linux-media+bounces-59908-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 06:54:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7477D48F4AE
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 06:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E79B5303ADC3
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 04:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10B52248A3;
	Wed, 29 Apr 2026 04:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lcnbkhit"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDEA3A1DB
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 04:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777438452; cv=none; b=PS3CZ66muznNlj72hRfwzzxqeR+jL094ppsyMwDoogLDxi6/2lxpoziLykfG6GutRfNMyFP6ayyE9UyIOwgyK70BNeWN5NQAgh9u+ahDUHDnQQgVifdnSChfXHCw7hCMG+fXyAQJQVlcvTcC2Tu0xngXmNuhhp6dWsS8VyhSBrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777438452; c=relaxed/simple;
	bh=Fvc8oMS+gC0jftv+TOyZWpGLYejfCf1DCdqfF+SOtt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n6RMnuZLsBl+vaPL75Yp4Z7Goq46tmA5Nt2u4zmTgdWNvvVmXIJcRTXbWwm8C3Y9/Nedxs/fSLswOcLie4BC0S8I/WvCSdjf8Rf2OblY1TVQ24xBQmmEdlwQKKbTUMAoFGFNViFtXGbSDjCn15ezYgtBSDQQkG2nPgL16yqRWFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lcnbkhit; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777438450; x=1808974450;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Fvc8oMS+gC0jftv+TOyZWpGLYejfCf1DCdqfF+SOtt8=;
  b=LcnbkhitWqWfVNMTRuoy4wMh5b4SxpsV1mgh6mlhBG7uOTyOD5zaRYpj
   lbLEQCd2UNspo2qiwu2LBiP4/2Wls+QTtGsfY4hmk9vKWBMZZjTMSmat6
   3TJ2GD1gdv62tURUp53LxiiNOBnzT05IwVKNo8Ldjqh/dk9lGs4M6E8N4
   +DuU1MIYIAdH3JMK3qgbiIcwOda2q53t28+mN84aRux1aLOf5pVanW36q
   hBNwT2VZYxJQioCGU9LQXUHmhEHqvoNp9R466bmPhb1rsNEgN2ulhTqMw
   1QERWv3SK0o/YCNch8o4Z10MQQJfKlYJU8+MCbsiPOlM0wjHrrF6MbrU1
   A==;
X-CSE-ConnectionGUID: ZvebjQKwQlChCL6MszddTg==
X-CSE-MsgGUID: iLMiJ7NpTTeMSi72Qudhgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="80933006"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="80933006"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 21:54:09 -0700
X-CSE-ConnectionGUID: E6RfXmPSQBSnGS6g1yFyKA==
X-CSE-MsgGUID: byFq7mmFQV2NrYX3ECvHNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="238127630"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Apr 2026 21:54:06 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHww0-00000000Acw-0tXK;
	Wed, 29 Apr 2026 04:54:04 +0000
Date: Wed, 29 Apr 2026 12:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 30/122]
 include/media/v4l2-subdev.h:1961:36: error: too few arguments to function
 '((const struct v4l2_subdev_pad_ops
 *)v4l2_subdev_call_wrappers.pad)->set_fmt'; expected 4, have 3
Message-ID: <202604291208.yqRwAWhO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7477D48F4AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.40 / 15.00];
	LONG_SUBJ(1.56)[208];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59908-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid,01.org:url]

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   489ab6e79288be8d219b68525a13699fde0248ae
commit: bdef7b84a4e74d1cef8cd5c1326c657cf4b86b3e [30/122] media: v4l2-subde=
v: Add struct v4l2_subdev_client_info pointer to pad ops
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/2026=
0429/202604291208.yqRwAWhO-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260429/202604291208.yqRwAWhO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604291208.yqRwAWhO-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from include/media/v4l2-device.h:13,
                    from drivers/media/platform/renesas/renesas-ceu.c:36:
   drivers/media/platform/renesas/renesas-ceu.c: In function '__ceu_try_fmt=
':
   drivers/media/platform/renesas/renesas-ceu.c:844:55: error: passing argu=
ment 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.p=
ad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |                                                       ^~~~~~~~~~
         |                                                       |
         |                                                       struct v4l=
2_subdev_state *
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/renesas/renesas-ceu.c:844:55: note: expected 'con=
st struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_s=
ubdev_state *'
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |                                                       ^~~~~~~~~~
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/renesas/renesas-ceu.c:844:67: error: passing argu=
ment 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.p=
ad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |                                                                 =
  ^~~~~~~~~~
         |                                                                 =
  |
         |                                                                 =
  struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/renesas/renesas-ceu.c:844:67: note: expected 'str=
uct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format=
 *'
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |                                                                 =
  ^~~~~~~~~~
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:1961:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    1961 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/renesas-ceu.c:844:15: note: in expansion =
of macro 'v4l2_subdev_call'
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/renesas/renesas-ceu.c:844:55: error: passing argu=
ment 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' f=
rom incompatible pointer type [-Wincompatible-pointer-types]
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |                                                       ^~~~~~~~~~
         |                                                       |
         |                                                       struct v4l=
2_subdev_state *
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:844:55: note: expected 'con=
st struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_s=
ubdev_state *'
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |                                                       ^~~~~~~~~~
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:844:67: error: passing argu=
ment 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' f=
rom incompatible pointer type [-Wincompatible-pointer-types]
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |                                                                 =
  ^~~~~~~~~~
         |                                                                 =
  |
         |                                                                 =
  struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:844:67: note: expected 'str=
uct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format=
 *'
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |                                                                 =
  ^~~~~~~~~~
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:1964:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:844:15: note: in expansion =
of macro 'v4l2_subdev_call'
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/renesas/renesas-ceu.c:850:48: error: passing argu=
ment 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.p=
ad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     850 |                                                &pad_state, &sd_f=
ormat);
         |                                                ^~~~~~~~~~
         |                                                |
         |                                                struct v4l2_subde=
v_state *
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/renesas/renesas-ceu.c:850:48: note: expected 'con=
st struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_s=
ubdev_state *'
     850 |                                                &pad_state, &sd_f=
ormat);
         |                                                ^~~~~~~~~~
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/renesas/renesas-ceu.c:850:60: error: passing argu=
ment 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.p=
ad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     850 |                                                &pad_state, &sd_f=
ormat);
         |                                                            ^~~~~=
~~~~~
         |                                                            |
         |                                                            struc=
t v4l2_subdev_format *
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/renesas/renesas-ceu.c:850:60: note: expected 'str=
uct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format=
 *'
     850 |                                                &pad_state, &sd_f=
ormat);
         |                                                            ^~~~~=
~~~~~
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:1961:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    1961 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/renesas-ceu.c:849:31: note: in expansion =
of macro 'v4l2_subdev_call'
     849 |                         ret =3D v4l2_subdev_call(v4l2_sd, pad, s=
et_fmt,
         |                               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/renesas/renesas-ceu.c:850:48: error: passing argu=
ment 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' f=
rom incompatible pointer type [-Wincompatible-pointer-types]
     850 |                                                &pad_state, &sd_f=
ormat);
         |                                                ^~~~~~~~~~
         |                                                |
         |                                                struct v4l2_subde=
v_state *
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:850:48: note: expected 'con=
st struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_s=
ubdev_state *'
     850 |                                                &pad_state, &sd_f=
ormat);
         |                                                ^~~~~~~~~~
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:850:60: error: passing argu=
ment 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' f=
rom incompatible pointer type [-Wincompatible-pointer-types]
     850 |                                                &pad_state, &sd_f=
ormat);
         |                                                            ^~~~~=
~~~~~
         |                                                            |
         |                                                            struc=
t v4l2_subdev_format *
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:850:60: note: expected 'str=
uct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format=
 *'
     850 |                                                &pad_state, &sd_f=
ormat);
         |                                                            ^~~~~=
~~~~~
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:1964:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:849:31: note: in expansion =
of macro 'v4l2_subdev_call'
     849 |                         ret =3D v4l2_subdev_call(v4l2_sd, pad, s=
et_fmt,
         |                               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/renesas/renesas-ceu.c: In function 'ceu_set_fmt':
   drivers/media/platform/renesas/renesas-ceu.c:903:61: error: passing argu=
ment 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.p=
ad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     903 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, NULL, &f=
ormat);
         |                                                             ^~~~=
~~~
         |                                                             |
         |                                                             stru=
ct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/renesas/renesas-ceu.c:903:61: note: expected 'str=
uct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format=
 *'
     903 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, NULL, &f=
ormat);
         |                                                             ^~~~=
~~~
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:1961:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    1961 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/renesas-ceu.c:903:15: note: in expansion =
of macro 'v4l2_subdev_call'
     903 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, NULL, &f=
ormat);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/renesas/renesas-ceu.c:903:61: error: passing argu=
ment 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' f=
rom incompatible pointer type [-Wincompatible-pointer-types]
     903 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, NULL, &f=
ormat);
         |                                                             ^~~~=
~~~
         |                                                             |
         |                                                             stru=
ct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:903:61: note: expected 'str=
uct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format=
 *'
     903 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, NULL, &f=
ormat);
         |                                                             ^~~~=
~~~
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:1964:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:903:15: note: in expansion =
of macro 'v4l2_subdev_call'
     903 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, NULL, &f=
ormat);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
--
   In file included from drivers/media/platform/renesas/sh_vou.c:24:
   drivers/media/platform/renesas/sh_vou.c: In function 'sh_vou_set_fmt_vid=
_out':
   drivers/media/platform/renesas/sh_vou.c:717:57: error: passing argument =
3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from i=
ncompatible pointer type [-Wincompatible-pointer-types]
     717 |                                          set_fmt, NULL, &format);
         |                                                         ^~~~~~~
         |                                                         |
         |                                                         struct v=
4l2_subdev_format *
   include/media/v4l2-device.h:356:58: note: in definition of macro '__v4l2=
_device_call_subdevs_until_err_p'
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                                          ^~~~
   drivers/media/platform/renesas/sh_vou.c:716:15: note: in expansion of ma=
cro 'v4l2_device_call_until_err'
     716 |         ret =3D v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0=
, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:717:57: note: expected 'struct v=
4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
     717 |                                          set_fmt, NULL, &format);
         |                                                         ^~~~~~~
   include/media/v4l2-device.h:356:58: note: in definition of macro '__v4l2=
_device_call_subdevs_until_err_p'
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                                          ^~~~
   drivers/media/platform/renesas/sh_vou.c:716:15: note: in expansion of ma=
cro 'v4l2_device_call_until_err'
     716 |         ret =3D v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0=
, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-device.h:356:33: error: too few arguments to function=
 '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected =
4, have 3
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                 ^
   include/media/v4l2-device.h:448:9: note: in expansion of macro '__v4l2_d=
evice_call_subdevs_until_err_p'
     448 |         __v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,  =
        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:716:15: note: in expansion of ma=
cro 'v4l2_device_call_until_err'
     716 |         ret =3D v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0=
, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/media/v4l2-device.h:13:
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/renesas/sh_vou.c: In function 'sh_vou_s_selection=
':
   drivers/media/platform/renesas/sh_vou.c:977:57: error: passing argument =
3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection' =
from incompatible pointer type [-Wincompatible-pointer-types]
     977 |                                    set_selection, NULL, &sd_sel);
         |                                                         ^~~~~~~
         |                                                         |
         |                                                         struct v=
4l2_subdev_selection *
   include/media/v4l2-device.h:356:58: note: in definition of macro '__v4l2=
_device_call_subdevs_until_err_p'
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                                          ^~~~
   drivers/media/platform/renesas/sh_vou.c:976:9: note: in expansion of mac=
ro 'v4l2_device_call_until_err'
     976 |         v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:977:57: note: expected 'struct v=
4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_selection *'
     977 |                                    set_selection, NULL, &sd_sel);
         |                                                         ^~~~~~~
   include/media/v4l2-device.h:356:58: note: in definition of macro '__v4l2=
_device_call_subdevs_until_err_p'
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                                          ^~~~
   drivers/media/platform/renesas/sh_vou.c:976:9: note: in expansion of mac=
ro 'v4l2_device_call_until_err'
     976 |         v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-device.h:356:33: error: too few arguments to function=
 '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection'; exp=
ected 4, have 3
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                 ^
   include/media/v4l2-device.h:448:9: note: in expansion of macro '__v4l2_d=
evice_call_subdevs_until_err_p'
     448 |         __v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,  =
        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:976:9: note: in expansion of mac=
ro 'v4l2_device_call_until_err'
     976 |         v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:864:15: note: declared here
     864 |         int (*set_selection)(struct v4l2_subdev *sd,
         |               ^~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:981:57: error: passing argument =
3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from i=
ncompatible pointer type [-Wincompatible-pointer-types]
     981 |                                          set_fmt, NULL, &format);
         |                                                         ^~~~~~~
         |                                                         |
         |                                                         struct v=
4l2_subdev_format *
   include/media/v4l2-device.h:356:58: note: in definition of macro '__v4l2=
_device_call_subdevs_until_err_p'
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                                          ^~~~
   drivers/media/platform/renesas/sh_vou.c:980:15: note: in expansion of ma=
cro 'v4l2_device_call_until_err'
     980 |         ret =3D v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0=
, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:981:57: note: expected 'struct v=
4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
     981 |                                          set_fmt, NULL, &format);
         |                                                         ^~~~~~~
   include/media/v4l2-device.h:356:58: note: in definition of macro '__v4l2=
_device_call_subdevs_until_err_p'
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                                          ^~~~
   drivers/media/platform/renesas/sh_vou.c:980:15: note: in expansion of ma=
cro 'v4l2_device_call_until_err'
     980 |         ret =3D v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0=
, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-device.h:356:33: error: too few arguments to function=
 '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected =
4, have 3
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                 ^
   include/media/v4l2-device.h:448:9: note: in expansion of macro '__v4l2_d=
evice_call_subdevs_until_err_p'
     448 |         __v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,  =
        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:980:15: note: in expansion of ma=
cro 'v4l2_device_call_until_err'
     980 |         ret =3D v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0=
, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
--
   In file included from include/media/v4l2-device.h:13,
                    from drivers/media/platform/st/stm32/stm32-dcmi.c:33:
   drivers/media/platform/st/stm32/stm32-dcmi.c: In function 'dcmi_pipeline=
_s_fmt':
   drivers/media/platform/st/stm32/stm32-dcmi.c:741:68: error: passing argu=
ment 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.p=
ad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     741 |                 ret =3D v4l2_subdev_call(subdev, pad, set_fmt, N=
ULL, &fmt);
         |                                                                 =
   ^~~~
         |                                                                 =
   |
         |                                                                 =
   struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:741:68: note: expected 'str=
uct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format=
 *'
     741 |                 ret =3D v4l2_subdev_call(subdev, pad, set_fmt, N=
ULL, &fmt);
         |                                                                 =
   ^~~~
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:1961:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    1961 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:741:23: note: in expansion =
of macro 'v4l2_subdev_call'
     741 |                 ret =3D v4l2_subdev_call(subdev, pad, set_fmt, N=
ULL, &fmt);
         |                       ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:741:68: error: passing argu=
ment 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' f=
rom incompatible pointer type [-Wincompatible-pointer-types]
     741 |                 ret =3D v4l2_subdev_call(subdev, pad, set_fmt, N=
ULL, &fmt);
         |                                                                 =
   ^~~~
         |                                                                 =
   |
         |                                                                 =
   struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:741:68: note: expected 'str=
uct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format=
 *'
     741 |                 ret =3D v4l2_subdev_call(subdev, pad, set_fmt, N=
ULL, &fmt);
         |                                                                 =
   ^~~~
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:1964:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:741:23: note: in expansion =
of macro 'v4l2_subdev_call'
     741 |                 ret =3D v4l2_subdev_call(subdev, pad, set_fmt, N=
ULL, &fmt);
         |                       ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c: In function 'dcmi_try_fmt':
   include/media/v4l2-subdev.h:2056:63: error: passing argument 2 of '((con=
st struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' fr=
om incompatible pointer type [-Wincompatible-pointer-types]
    2056 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
         |                                                               |
         |                                                               st=
ruct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2056:63: note: expected 'const struct v4l2_s=
ubdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
    2056 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing arg=
ument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.=
pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |                                                                 =
     ^~~~~~~
         |                                                                 =
     |
         |                                                                 =
     struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: note: expected 'st=
ruct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_forma=
t *'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |                                                                 =
     ^~~~~~~
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1961:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    1961 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2056:36: note: in expansion of macro 'v4l2_s=
ubdev_call'
    2056 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   include/media/v4l2-subdev.h:2056:63: error: passing argument 2 of '((con=
st struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible=
 pointer type [-Wincompatible-pointer-types]
    2056 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
         |                                                               |
         |                                                               st=
ruct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2056:63: note: expected 'const struct v4l2_s=
ubdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
    2056 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing arg=
ument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' =
from incompatible pointer type [-Wincompatible-pointer-types]
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |                                                                 =
     ^~~~~~~
         |                                                                 =
     |
         |                                                                 =
     struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: note: expected 'st=
ruct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_forma=
t *'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |                                                                 =
     ^~~~~~~
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1964:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   include/media/v4l2-subdev.h:2056:36: note: in expansion of macro 'v4l2_s=
ubdev_call'
    2056 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c: In function 'dcmi_set_sens=
or_format':
   include/media/v4l2-subdev.h:2056:63: error: passing argument 2 of '((con=
st struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' fr=
om incompatible pointer type [-Wincompatible-pointer-types]
    2056 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
         |                                                               |
         |                                                               st=
ruct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2056:63: note: expected 'const struct v4l2_s=
ubdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
    2056 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:70: error: passing arg=
ument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.=
pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |                                                                 =
     ^~~~~~~
         |                                                                 =
     |
         |                                                                 =
     struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:70: note: expected 'st=
ruct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_forma=
t *'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |                                                                 =
     ^~~~~~~
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1961:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    1961 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2056:36: note: in expansion of macro 'v4l2_s=
ubdev_call'
    2056 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   include/media/v4l2-subdev.h:2056:63: error: passing argument 2 of '((con=
st struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible=
 pointer type [-Wincompatible-pointer-types]
    2056 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
         |                                                               |
         |                                                               st=
ruct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2056:63: note: expected 'const struct v4l2_s=
ubdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
    2056 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:70: error: passing arg=
ument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' =
from incompatible pointer type [-Wincompatible-pointer-types]
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |                                                                 =
     ^~~~~~~
         |                                                                 =
     |
         |                                                                 =
     struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:70: note: expected 'st=
ruct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_forma=
t *'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |                                                                 =
     ^~~~~~~
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1964:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   include/media/v4l2-subdev.h:2056:36: note: in expansion of macro 'v4l2_s=
ubdev_call'
    2056 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c: In function 'dcmi_get_sens=
or_bounds':
   drivers/media/platform/st/stm32/stm32-dcmi.c:1250:38: error: passing arg=
ument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.=
pad)->get_selection' from incompatible pointer type [-Wincompatible-pointer=
-types]
    1250 |                                NULL, &bounds);
         |                                      ^~~~~~~
         |                                      |
         |                                      struct v4l2_subdev_selectio=
n *
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1250:38: note: expected 'st=
ruct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_selec=
tion *'
    1250 |                                NULL, &bounds);
         |                                      ^~~~~~~
   include/media/v4l2-subdev.h:1962:65: note: in definition of macro 'v4l2_=
subdev_call'
    1962 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   include/media/v4l2-subdev.h:1961:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get=
_selection'; expected 4, have 3
    1961 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1249:15: note: in expansion=
 of macro 'v4l2_subdev_call'
    1249 |         ret =3D v4l2_subdev_call(dcmi->source, pad, get_selectio=
n,
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:860:15: note: declared here
     860 |         int (*get_selection)(struct v4l2_subdev *sd,
         |               ^~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1250:38: error: passing arg=
ument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selec=
tion' from incompatible pointer type [-Wincompatible-pointer-types]
    1250 |                                NULL, &bounds);
         |                                      ^~~~~~~
         |                                      |
         |                                      struct v4l2_subdev_selectio=
n *
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1250:38: note: expected 'st=
ruct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_selec=
tion *'
    1250 |                                NULL, &bounds);
         |                                      ^~~~~~~
   include/media/v4l2-subdev.h:1964:60: note: in definition of macro 'v4l2_=
subdev_call'
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   include/media/v4l2-subdev.h:1964:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'; ex=
pected 4, have 3
    1964 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1249:15: note: in expansion=
 of macro 'v4l2_subdev_call'
    1249 |         ret =3D v4l2_subdev_call(dcmi->source, pad, get_selectio=
n,
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:860:15: note: declared here
     860 |         int (*get_selection)(struct v4l2_subdev *sd,
         |               ^~~~~~~~~~~~~
..


vim +1961 include/media/v4l2-subdev.h

a8fa55078a7784a Janusz Krzysztofik    2019-05-20  1937 =20
02679876b74d26e Mauro Carvalho Chehab 2017-12-19  1938  /**
02679876b74d26e Mauro Carvalho Chehab 2017-12-19  1939   * v4l2_subdev_call=
 - call an operation of a v4l2_subdev.
02679876b74d26e Mauro Carvalho Chehab 2017-12-19  1940   *
02679876b74d26e Mauro Carvalho Chehab 2017-12-19  1941   * @sd: pointer to =
the &struct v4l2_subdev
02679876b74d26e Mauro Carvalho Chehab 2017-12-19  1942   * @o: name of the =
element at &struct v4l2_subdev_ops that contains @f.
02679876b74d26e Mauro Carvalho Chehab 2017-12-19  1943   *     Each element=
 there groups a set of callbacks functions.
aab7b7d19d038c1 Wolfram Sang          2019-11-10  1944   * @f: callback fun=
ction to be called.
02679876b74d26e Mauro Carvalho Chehab 2017-12-19  1945   *     The callback=
 functions are defined in groups, according to
02679876b74d26e Mauro Carvalho Chehab 2017-12-19  1946   *     each element=
 at &struct v4l2_subdev_ops.
60d70d75c12db79 Jonathan Neusch=C3=A4fer   2020-02-27  1947   * @args: argu=
ments for @f.
21c29de1d090488 Mauro Carvalho Chehab 2016-07-20  1948   *
21c29de1d090488 Mauro Carvalho Chehab 2016-07-20  1949   * Example: err =3D =
v4l2_subdev_call(sd, video, s_std, norm);
2a1fcdf08230522 Hans Verkuil          2008-11-29  1950   */
2a1fcdf08230522 Hans Verkuil          2008-11-29  1951  #define v4l2_subdev=
_call(sd, o, f, args...)				\
da48c948c263c9d Arnd Bergmann         2017-07-19  1952  	({								\
3d769df5fc32dc3 Hans Verkuil          2019-02-08  1953  		struct v4l2_subde=
v *__sd =3D (sd);			\
da48c948c263c9d Arnd Bergmann         2017-07-19  1954  		int __result;				=
		\
3d769df5fc32dc3 Hans Verkuil          2019-02-08  1955  		if (!__sd)						\
da48c948c263c9d Arnd Bergmann         2017-07-19  1956  			__result =3D -EN=
ODEV;				\
3d769df5fc32dc3 Hans Verkuil          2019-02-08  1957  		else if (!(__sd->=
ops->o && __sd->ops->o->f))		\
da48c948c263c9d Arnd Bergmann         2017-07-19  1958  			__result =3D -EN=
OIOCTLCMD;			\
a8fa55078a7784a Janusz Krzysztofik    2019-05-20  1959  		else if (v4l2_sub=
dev_call_wrappers.o &&			\
a8fa55078a7784a Janusz Krzysztofik    2019-05-20  1960  			 v4l2_subdev_cal=
l_wrappers.o->f)		\
a8fa55078a7784a Janusz Krzysztofik    2019-05-20 @1961  			__result =3D v4l=
2_subdev_call_wrappers.o->f(	\
a8fa55078a7784a Janusz Krzysztofik    2019-05-20  1962  							__sd, ##args=
);	\
da48c948c263c9d Arnd Bergmann         2017-07-19  1963  		else							\
3d769df5fc32dc3 Hans Verkuil          2019-02-08 @1964  			__result =3D __s=
d->ops->o->f(__sd, ##args);	\
da48c948c263c9d Arnd Bergmann         2017-07-19  1965  		__result;						\
da48c948c263c9d Arnd Bergmann         2017-07-19  1966  	})
2a1fcdf08230522 Hans Verkuil          2008-11-29  1967 =20

:::::: The code at line 1961 was first introduced by commit
:::::: a8fa55078a7784a99a2ce389b5d7456a3be9a941 media: v4l2-subdev: Verify =
arguments in v4l2_subdev_call()

:::::: TO: Janusz Krzysztofik <jmkrzyszt@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

