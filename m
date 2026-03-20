Return-Path: <linux-media+bounces-56511-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGUNBe0pvWkG7QIAu9opvQ
	(envelope-from <linux-media+bounces-56511-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:05:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B82D9482
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A1E3301EBCD
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 11:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0954A3A1E7E;
	Fri, 20 Mar 2026 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKImQiLg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE08A37A492
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774004644; cv=none; b=D4fs768BKcg07ZNzDvDA6HVvQyNV0XNCk6u+1qUeLq4gX4rduaAljbjCYcROOZPBkVqlCKF2zqLfxnakwzF5Tb1AYYTCHc17UOnPWBng78Od8y40nxijGtDQW3HIVAgsQxe4+ksBlyty4jGfVvNyGl2qYe90Jdt89pMMXPuUUoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774004644; c=relaxed/simple;
	bh=G/fWOYvzruxDDwKAG2OKPGNXtxNQ2BvcvjhPi5+BnnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g0QV9RA+Mw4xWkfd3gFPj95MOE+wx+uFvGCOBOYJpf+ELaXRFBAQEli8mU4l+lnaLFfWcf4iuqPi5IdWpZ7WB0I8Bl3927s5drwogeRe0etx0NlFPGS/WPV34uo/TUd0uDnpumxSRi8y/bKDbDuo8NbZQB7GwpTJlyy2S94uL38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKImQiLg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774004640; x=1805540640;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G/fWOYvzruxDDwKAG2OKPGNXtxNQ2BvcvjhPi5+BnnQ=;
  b=kKImQiLgfjk9IOQqOfRHES0A3UsYG1PIwv38NkMG2Kb5G8Gw5JHRpCeZ
   H3VQdCOJOGpwu7exWMErc5BlggWW5qdj/UwIOqJ2HJnYHW2Li0/E78CE2
   P3AjPeKu02cZCzUxjRpwxGnd/3901eH5hOtg5eDPNYp4emXczYiJjaYbI
   f7VpyNupdAON9ZaHRqIssRVD4I2cYr6Js/bApc1GK1S2GpmyvbSqFJJ48
   fZ8Fq0iMOneaYIRUtdMgMAWi1A6ow+j2piyULAMLnN3zrVAV3WlNtcv/W
   0ZYsigl/fN4Ftw4+3RqNbHVDu0KTvH+TEpjc9s9R9E0GyfDX3wz/mRHy4
   w==;
X-CSE-ConnectionGUID: FZG5WD7DQ8+xARw+I7+mcg==
X-CSE-MsgGUID: FrV5rdlPSe6rU6L+7LsmyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74969336"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74969336"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 04:03:59 -0700
X-CSE-ConnectionGUID: JMKF+SziSiu3tc1Ay9jc/Q==
X-CSE-MsgGUID: q6u31vFES761TIxQvDAYzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="261154918"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Mar 2026 04:03:57 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Xdy-000000002Hw-2dG1;
	Fri, 20 Mar 2026 11:03:54 +0000
Date: Fri, 20 Mar 2026 19:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 19/106]
 include/media/v4l2-subdev.h:1930:36: error: too few arguments to function
 '((const struct v4l2_subdev_pad_ops
 *)v4l2_subdev_call_wrappers.pad)->set_fmt'; expected 4, have 3
Message-ID: <202603201843.dY5CTAVD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.40 / 15.00];
	LONG_SUBJ(1.56)[208];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56511-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 8F0B82D9482
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   7a108073e0c1f6e9035329a152d5835f9d4f9507
commit: bdc96b4bd0deb40af6350382e510ddfa0850d656 [19/106] media: v4l2-subde=
v: Add struct v4l2_subdev_client_info pointer to pad ops
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260320/2=
02603201843.dY5CTAVD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260320/202603201843.dY5CTAVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201843.dY5CTAVD-lkp@i=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/renesas/renesas-ceu.c:844:55: note: expected 'con=
st struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_s=
ubdev_state *'
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |                                                       ^~~~~~~~~~
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:1930:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    1930 |                         __result =3D v4l2_subdev_call_wrappers.o=
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
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:844:55: note: expected 'con=
st struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_s=
ubdev_state *'
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |                                                       ^~~~~~~~~~
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
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
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:844:67: note: expected 'str=
uct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format=
 *'
     844 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, &pad_sta=
te, &sd_format);
         |                                                                 =
  ^~~~~~~~~~
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:1933:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/renesas/renesas-ceu.c:850:48: note: expected 'con=
st struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_s=
ubdev_state *'
     850 |                                                &pad_state, &sd_f=
ormat);
         |                                                ^~~~~~~~~~
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:1930:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    1930 |                         __result =3D v4l2_subdev_call_wrappers.o=
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
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:850:48: note: expected 'con=
st struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_s=
ubdev_state *'
     850 |                                                &pad_state, &sd_f=
ormat);
         |                                                ^~~~~~~~~~
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
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
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:850:60: note: expected 'str=
uct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format=
 *'
     850 |                                                &pad_state, &sd_f=
ormat);
         |                                                            ^~~~~=
~~~~~
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:1933:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:1930:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    1930 |                         __result =3D v4l2_subdev_call_wrappers.o=
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
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/renesas/renesas-ceu.c:903:61: note: expected 'str=
uct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format=
 *'
     903 |         ret =3D v4l2_subdev_call(v4l2_sd, pad, set_fmt, NULL, &f=
ormat);
         |                                                             ^~~~=
~~~
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:1933:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
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
>> drivers/media/platform/renesas/sh_vou.c:717:57: error: passing argument =
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
>> drivers/media/platform/renesas/sh_vou.c:977:57: error: passing argument =
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
>> drivers/media/platform/st/stm32/stm32-dcmi.c:741:68: error: passing argu=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:1930:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    1930 |                         __result =3D v4l2_subdev_call_wrappers.o=
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
>> drivers/media/platform/st/stm32/stm32-dcmi.c:741:68: error: passing argu=
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
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:741:68: note: expected 'str=
uct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format=
 *'
     741 |                 ret =3D v4l2_subdev_call(subdev, pad, set_fmt, N=
ULL, &fmt);
         |                                                                 =
   ^~~~
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:1933:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
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
>> include/media/v4l2-subdev.h:1998:63: error: passing argument 2 of '((con=
st struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' fr=
om incompatible pointer type [-Wincompatible-pointer-types]
    1998 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
         |                                                               |
         |                                                               st=
ruct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1998:63: note: expected 'const struct v4l2_s=
ubdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
    1998 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1930:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    1930 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1998:36: note: in expansion of macro 'v4l2_s=
ubdev_call'
    1998 |                         __result =3D v4l2_subdev_call(sd, o, f, =
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
>> include/media/v4l2-subdev.h:1998:63: error: passing argument 2 of '((con=
st struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible=
 pointer type [-Wincompatible-pointer-types]
    1998 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
         |                                                               |
         |                                                               st=
ruct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1998:63: note: expected 'const struct v4l2_s=
ubdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
    1998 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
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
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
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
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1933:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   include/media/v4l2-subdev.h:1998:36: note: in expansion of macro 'v4l2_s=
ubdev_call'
    1998 |                         __result =3D v4l2_subdev_call(sd, o, f, =
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
   drivers/media/platform/st/stm32/stm32-dcmi.c: In function 'dcmi_get_sens=
or_format':
   drivers/media/platform/st/stm32/stm32-dcmi.c:1199:66: error: passing arg=
ument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.=
pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    1199 |         ret =3D v4l2_subdev_call(dcmi->source, pad, get_fmt, NUL=
L, &fmt);
         |                                                                 =
 ^~~~
         |                                                                 =
 |
         |                                                                 =
 struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1199:66: note: expected 'st=
ruct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_forma=
t *'
    1199 |         ret =3D v4l2_subdev_call(dcmi->source, pad, get_fmt, NUL=
L, &fmt);
         |                                                                 =
 ^~~~
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
>> include/media/v4l2-subdev.h:1930:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get=
_fmt'; expected 4, have 3
    1930 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1199:15: note: in expansion=
 of macro 'v4l2_subdev_call'
    1199 |         ret =3D v4l2_subdev_call(dcmi->source, pad, get_fmt, NUL=
L, &fmt);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:852:15: note: declared here
     852 |         int (*get_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1199:66: error: passing arg=
ument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' =
from incompatible pointer type [-Wincompatible-pointer-types]
    1199 |         ret =3D v4l2_subdev_call(dcmi->source, pad, get_fmt, NUL=
L, &fmt);
         |                                                                 =
 ^~~~
         |                                                                 =
 |
         |                                                                 =
 struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1199:66: note: expected 'st=
ruct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_forma=
t *'
    1199 |         ret =3D v4l2_subdev_call(dcmi->source, pad, get_fmt, NUL=
L, &fmt);
         |                                                                 =
 ^~~~
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
>> include/media/v4l2-subdev.h:1933:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt'; expected=
 4, have 3
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1199:15: note: in expansion=
 of macro 'v4l2_subdev_call'
    1199 |         ret =3D v4l2_subdev_call(dcmi->source, pad, get_fmt, NUL=
L, &fmt);
         |               ^~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:852:15: note: declared here
     852 |         int (*get_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c: In function 'dcmi_set_sens=
or_format':
>> include/media/v4l2-subdev.h:1998:63: error: passing argument 2 of '((con=
st struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' fr=
om incompatible pointer type [-Wincompatible-pointer-types]
    1998 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
         |                                                               |
         |                                                               st=
ruct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1998:63: note: expected 'const struct v4l2_s=
ubdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
    1998 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1930:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set=
_fmt'; expected 4, have 3
    1930 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1998:36: note: in expansion of macro 'v4l2_s=
ubdev_call'
    1998 |                         __result =3D v4l2_subdev_call(sd, o, f, =
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
>> include/media/v4l2-subdev.h:1998:63: error: passing argument 2 of '((con=
st struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible=
 pointer type [-Wincompatible-pointer-types]
    1998 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
         |                                                               |
         |                                                               st=
ruct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1998:63: note: expected 'const struct v4l2_s=
ubdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
    1998 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
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
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
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
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion=
 of macro 'v4l2_subdev_call_state_try'
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1933:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected=
 4, have 3
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ^~~~
   include/media/v4l2-subdev.h:1998:36: note: in expansion of macro 'v4l2_s=
ubdev_call'
    1998 |                         __result =3D v4l2_subdev_call(sd, o, f, =
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
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1250:38: note: expected 'st=
ruct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_selec=
tion *'
    1250 |                                NULL, &bounds);
         |                                      ^~~~~~~
   include/media/v4l2-subdev.h:1931:65: note: in definition of macro 'v4l2_=
subdev_call'
    1931 |                                                         __sd, ##=
args);  \
         |                                                                 =
^~~~
   include/media/v4l2-subdev.h:1930:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get=
_selection'; expected 4, have 3
    1930 |                         __result =3D v4l2_subdev_call_wrappers.o=
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
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1250:38: note: expected 'st=
ruct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_selec=
tion *'
    1250 |                                NULL, &bounds);
         |                                      ^~~~~~~
   include/media/v4l2-subdev.h:1933:60: note: in definition of macro 'v4l2_=
subdev_call'
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                                            ^~~~
   include/media/v4l2-subdev.h:1933:36: error: too few arguments to functio=
n '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'; ex=
pected 4, have 3
    1933 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
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


vim +1930 include/media/v4l2-subdev.h

a8fa55078a7784 Janusz Krzysztofik    2019-05-20  1906 =20
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1907  /**
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1908   * v4l2_subdev_call =
- call an operation of a v4l2_subdev.
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1909   *
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1910   * @sd: pointer to t=
he &struct v4l2_subdev
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1911   * @o: name of the e=
lement at &struct v4l2_subdev_ops that contains @f.
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1912   *     Each element =
there groups a set of callbacks functions.
aab7b7d19d038c Wolfram Sang          2019-11-10  1913   * @f: callback func=
tion to be called.
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1914   *     The callback =
functions are defined in groups, according to
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1915   *     each element =
at &struct v4l2_subdev_ops.
60d70d75c12db7 Jonathan Neusch=C3=A4fer   2020-02-27  1916   * @args: argum=
ents for @f.
21c29de1d09048 Mauro Carvalho Chehab 2016-07-20  1917   *
21c29de1d09048 Mauro Carvalho Chehab 2016-07-20  1918   * Example: err =3D =
v4l2_subdev_call(sd, video, s_std, norm);
2a1fcdf0823052 Hans Verkuil          2008-11-29  1919   */
2a1fcdf0823052 Hans Verkuil          2008-11-29  1920  #define v4l2_subdev_=
call(sd, o, f, args...)				\
da48c948c263c9 Arnd Bergmann         2017-07-19  1921  	({								\
3d769df5fc32dc Hans Verkuil          2019-02-08  1922  		struct v4l2_subdev=
 *__sd =3D (sd);			\
da48c948c263c9 Arnd Bergmann         2017-07-19  1923  		int __result;					=
	\
3d769df5fc32dc Hans Verkuil          2019-02-08  1924  		if (!__sd)						\
da48c948c263c9 Arnd Bergmann         2017-07-19  1925  			__result =3D -ENO=
DEV;				\
3d769df5fc32dc Hans Verkuil          2019-02-08  1926  		else if (!(__sd->o=
ps->o && __sd->ops->o->f))		\
da48c948c263c9 Arnd Bergmann         2017-07-19  1927  			__result =3D -ENO=
IOCTLCMD;			\
a8fa55078a7784 Janusz Krzysztofik    2019-05-20  1928  		else if (v4l2_subd=
ev_call_wrappers.o &&			\
a8fa55078a7784 Janusz Krzysztofik    2019-05-20  1929  			 v4l2_subdev_call=
_wrappers.o->f)		\
a8fa55078a7784 Janusz Krzysztofik    2019-05-20 @1930  			__result =3D v4l2=
_subdev_call_wrappers.o->f(	\
a8fa55078a7784 Janusz Krzysztofik    2019-05-20 @1931  							__sd, ##args)=
;	\
da48c948c263c9 Arnd Bergmann         2017-07-19  1932  		else							\
3d769df5fc32dc Hans Verkuil          2019-02-08 @1933  			__result =3D __sd=
->ops->o->f(__sd, ##args);	\
da48c948c263c9 Arnd Bergmann         2017-07-19  1934  		__result;						\
da48c948c263c9 Arnd Bergmann         2017-07-19  1935  	})
2a1fcdf0823052 Hans Verkuil          2008-11-29  1936 =20
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1937  /**
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1938   * v4l2_subdev_call_=
state_active - call an operation of a v4l2_subdev which
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1939   *				   takes state=
 as a parameter, passing the
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1940   *				   subdev its =
active state.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1941   *
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1942   * @sd: pointer to t=
he &struct v4l2_subdev
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1943   * @o: name of the e=
lement at &struct v4l2_subdev_ops that contains @f.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1944   *     Each element =
there groups a set of callbacks functions.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1945   * @f: callback func=
tion to be called.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1946   *     The callback =
functions are defined in groups, according to
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1947   *     each element =
at &struct v4l2_subdev_ops.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1948   * @args: arguments =
for @f.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1949   *
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1950   * This is similar t=
o v4l2_subdev_call(), except that this version can only be
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1951   * used for ops that=
 take a subdev state as a parameter. The macro will get the
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1952   * active state, loc=
k it before calling the op and unlock it after the call.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1953   */
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1954  #define v4l2_subdev_=
call_state_active(sd, o, f, args...)		\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1955  	({								\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1956  		int __result;					=
	\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1957  		struct v4l2_subdev=
_state *state;			\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1958  		state =3D v4l2_sub=
dev_get_unlocked_active_state(sd);	\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1959  		if (state)						\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1960  			v4l2_subdev_lock_=
state(state);			\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1961  		__result =3D v4l2_=
subdev_call(sd, o, f, state, ##args);	\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1962  		if (state)						\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1963  			v4l2_subdev_unloc=
k_state(state);		\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1964  		__result;						\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1965  	})
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1966 =20
982c0487185bd4 Tomi Valkeinen        2022-07-01  1967  /**
982c0487185bd4 Tomi Valkeinen        2022-07-01  1968   * v4l2_subdev_call_=
state_try - call an operation of a v4l2_subdev which
982c0487185bd4 Tomi Valkeinen        2022-07-01  1969   *				takes state as=
 a parameter, passing the
982c0487185bd4 Tomi Valkeinen        2022-07-01  1970   *				subdev a newly=
 allocated try state.
982c0487185bd4 Tomi Valkeinen        2022-07-01  1971   *
982c0487185bd4 Tomi Valkeinen        2022-07-01  1972   * @sd: pointer to t=
he &struct v4l2_subdev
982c0487185bd4 Tomi Valkeinen        2022-07-01  1973   * @o: name of the e=
lement at &struct v4l2_subdev_ops that contains @f.
982c0487185bd4 Tomi Valkeinen        2022-07-01  1974   *     Each element =
there groups a set of callbacks functions.
982c0487185bd4 Tomi Valkeinen        2022-07-01  1975   * @f: callback func=
tion to be called.
982c0487185bd4 Tomi Valkeinen        2022-07-01  1976   *     The callback =
functions are defined in groups, according to
982c0487185bd4 Tomi Valkeinen        2022-07-01  1977   *     each element =
at &struct v4l2_subdev_ops.
982c0487185bd4 Tomi Valkeinen        2022-07-01  1978   * @args: arguments =
for @f.
982c0487185bd4 Tomi Valkeinen        2022-07-01  1979   *
982c0487185bd4 Tomi Valkeinen        2022-07-01  1980   * This is similar t=
o v4l2_subdev_call_state_active(), except that as this
982c0487185bd4 Tomi Valkeinen        2022-07-01  1981   * version allocates=
 a new state, this is only usable for
982c0487185bd4 Tomi Valkeinen        2022-07-01  1982   * V4L2_SUBDEV_FORMA=
T_TRY use cases.
982c0487185bd4 Tomi Valkeinen        2022-07-01  1983   *
982c0487185bd4 Tomi Valkeinen        2022-07-01  1984   * Note: only legacy=
 non-MC drivers may need this macro.
982c0487185bd4 Tomi Valkeinen        2022-07-01  1985   */
982c0487185bd4 Tomi Valkeinen        2022-07-01  1986  #define v4l2_subdev_=
call_state_try(sd, o, f, args...)                         \
982c0487185bd4 Tomi Valkeinen        2022-07-01  1987  	({                 =
                                                   \
982c0487185bd4 Tomi Valkeinen        2022-07-01  1988  		int __result;     =
                                            \
982c0487185bd4 Tomi Valkeinen        2022-07-01  1989  		static struct lock=
_class_key __key;                           \
982c0487185bd4 Tomi Valkeinen        2022-07-01  1990  		const char *name =
=3D KBUILD_BASENAME                            \
982c0487185bd4 Tomi Valkeinen        2022-07-01  1991  			":" __stringify(_=
_LINE__) ":state->lock";             \
982c0487185bd4 Tomi Valkeinen        2022-07-01  1992  		struct v4l2_subdev=
_state *state =3D                             \
982c0487185bd4 Tomi Valkeinen        2022-07-01  1993  			__v4l2_subdev_sta=
te_alloc(sd, name, &__key);          \
f37df9a0eb5e43 Tomi Valkeinen        2025-08-08  1994  		if (IS_ERR(state))=
 {                                          \
f37df9a0eb5e43 Tomi Valkeinen        2025-08-08  1995  			__result =3D PTR_=
ERR(state);                            \
f37df9a0eb5e43 Tomi Valkeinen        2025-08-08  1996  		} else {          =
                                            \
982c0487185bd4 Tomi Valkeinen        2022-07-01  1997  			v4l2_subdev_lock_=
state(state);                        \
982c0487185bd4 Tomi Valkeinen        2022-07-01 @1998  			__result =3D v4l2=
_subdev_call(sd, o, f, state, ##args); \
982c0487185bd4 Tomi Valkeinen        2022-07-01  1999  			v4l2_subdev_unloc=
k_state(state);                      \
982c0487185bd4 Tomi Valkeinen        2022-07-01  2000  			__v4l2_subdev_sta=
te_free(state);                      \
f37df9a0eb5e43 Tomi Valkeinen        2025-08-08  2001  		}                 =
                                            \
982c0487185bd4 Tomi Valkeinen        2022-07-01  2002  		__result;         =
                                            \
982c0487185bd4 Tomi Valkeinen        2022-07-01  2003  	})
982c0487185bd4 Tomi Valkeinen        2022-07-01  2004 =20

:::::: The code at line 1930 was first introduced by commit
:::::: a8fa55078a7784a99a2ce389b5d7456a3be9a941 media: v4l2-subdev: Verify =
arguments in v4l2_subdev_call()

:::::: TO: Janusz Krzysztofik <jmkrzyszt@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

