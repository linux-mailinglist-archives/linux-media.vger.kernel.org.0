Return-Path: <linux-media+bounces-32780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 833F1ABBE86
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9FD23A64CF
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1670227978B;
	Mon, 19 May 2025 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoq5UkQm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D22A8D0;
	Mon, 19 May 2025 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659681; cv=none; b=E+nT0bhUgH5Y4aopDiBo77Q1U0tHOdtNdOCQPJlsYwTYNip3FOxwZ9/dIRZ2uvgaGTwTqSpJUZ3+2UAJPReKHx7sUSxA55Edtd47+TjzTQDof3gKLJnHRAG+aDRVFqY05+zUn8Y8DJAAXTSC5+VdLBClzlcl42J3XnDH+1naNsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659681; c=relaxed/simple;
	bh=XRtUzkmQDtQPNwDSMftAU2nE6DaqnPjL7qIzpbDhBas=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZRyK5oJ3NTgcmAsABTR2i11vuv4npqd3rfASueCqpNYneBpbLO9Iz1clT5NsGcTF3NYJ9yW7glyieK/3ehN8j8BYvMXSaAteN/iUNbTdYe2Q3BwijWRj58X/0EL0MBIHuyx48/7IGFQqJ54cbquwsYIRxP1m76ntZC9zkA5xYYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoq5UkQm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747659680; x=1779195680;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=XRtUzkmQDtQPNwDSMftAU2nE6DaqnPjL7qIzpbDhBas=;
  b=eoq5UkQmS/RqpPChxTQZVHRLyZNsToG+u1Y63l4oO0UOvSyoILxKGux0
   q9TQH5akMhrzUgdTr+XrwPnjMqZPWkNsMFwXHI9i2bQH580gqupTbghTJ
   P88+shVo8GNkpcYFoa8Q33LwL45kSZyqunpf3eu8Xa2lkFsE4XWl0OhRm
   cku7DdCB987gmTtunHdiwV7fRYyclrcY0oKCD08OwCeBwswJTK6Ib7iJH
   vM6auFhsjmUSXPHyb3rTRETI4ZK/GTiBqZ82Fem+o1X9CXprhBGwH6d41
   o8w2k7dhqZA7uqp3XdWMnQsedncvAeVRvRmOEoFDQFksCkZrdiCG4KE/7
   w==;
X-CSE-ConnectionGUID: HEpE5x6pS9qG8f66gQFhFw==
X-CSE-MsgGUID: qC+vYQk/QfmH8/tORHfB3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49460214"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49460214"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:01:19 -0700
X-CSE-ConnectionGUID: 51Hy0gzDRISduMGbZmn6lQ==
X-CSE-MsgGUID: bIrUf+McQpOR80Xft5FVxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="170393985"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:01:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 16:01:11 +0300 (EEST)
To: Bagas Sanjaya <bagasdotme@gmail.com>
cc: =?ISO-8859-15?Q?Hanne-Lotta_M=E4enp=E4=E4?= <hannelotta@gmail.com>, 
    mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl, 
    hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com, 
    Jonathan.Cameron@huawei.com, corbet@lwn.net, mario.limonciello@amd.com, 
    W_Armin@gmx.de, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/4] docs: Improve grammar in Userspace API/fwctl
In-Reply-To: <aCqKNg3p_VlGbce_@archie.me>
Message-ID: <264386b3-075d-ef1d-e3b2-9a2937ca05cb@linux.intel.com>
References: <20250517132711.117618-1-hannelotta@gmail.com> <20250517132711.117618-3-hannelotta@gmail.com> <aCqKNg3p_VlGbce_@archie.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-270692407-1747659638=:928"
Content-ID: <2c36173e-18f9-8455-1fc7-dcd2cf39c2ec@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-270692407-1747659638=:928
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <1c748645-ab50-4a76-09fa-ad537a9180a6@linux.intel.com>

On Mon, 19 May 2025, Bagas Sanjaya wrote:

> On Sat, May 17, 2025 at 04:27:10PM +0300, Hanne-Lotta M=E4enp=E4=E4 wrote=
:
> > Fix typos and improve grammar in the documentation for
> > fwctl subsystem.
> >=20
> > Use the word user space consistently, instead of having
> > two variants (user space vs. userspace).
> >=20
> > Change wording of denied behaviour to be disallowed
> > behaviour when describing the interface.
> >=20
> > Signed-off-by: Hanne-Lotta M=E4enp=E4=E4 <hannelotta@gmail.com>
> > ---
> >  Documentation/userspace-api/fwctl/fwctl.rst | 30 ++++++++++-----------
> >  1 file changed, 15 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/Documentation/userspace-api/fwctl/fwctl.rst b/Documentatio=
n/userspace-api/fwctl/fwctl.rst
> > index fdcfe418a83f..a74eab8d14c6 100644
> > --- a/Documentation/userspace-api/fwctl/fwctl.rst
> > +++ b/Documentation/userspace-api/fwctl/fwctl.rst
> > @@ -54,7 +54,7 @@ operated by the block layer but also comes with a set=
 of RPCs to administer the
> >  construction of drives within the HW RAID.
> > =20
> >  In the past when devices were more single function, individual subsyst=
ems would
>=20
> Do you mean that devices used to be singleton in its functionality? Or ha=
ving
> multiple functions?
>=20
> > -grow different approaches to solving some of these common problems. Fo=
r instance
> > +grow different approaches to solving some of these common problems. Fo=
r instance,
> >  monitoring device health, manipulating its FLASH, debugging the FW,
> >  provisioning, all have various unique interfaces across the kernel.
> > =20
> > <snipped>...
> >   3. Write access to function & child debug information strictly compat=
ible with
> >      the principles of kernel lockdown and kernel integrity protection.=
 Triggers
> > -    a kernel Taint.
> > +    a kernel taint.
>=20
> Improving grammar includes s/Taint/taint/?
>=20
> Confused...

To be fair, the changelog also said "Fix typos". So Bagas, do you mean=20
"Taint" should be always capitalized? At least this doesn't support=20
that position:

git grep -i  taint Documentation

--=20
 i.
--8323328-270692407-1747659638=:928--

