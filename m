Return-Path: <linux-media+bounces-60829-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EZoOBOt/GkNSgAAu9opvQ
	(envelope-from <linux-media+bounces-60829-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:17:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7174D4EAE17
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97AD4300B1DA
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 15:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB0343D4E0;
	Thu,  7 May 2026 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Y3m5vROw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0D22836A6
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167057; cv=none; b=K85VKojqHY58sX0iiixVljl+EZLJgiTzvVCQWBr++19jAlUDfj3JZCf33XkgKhC6H387lpOi0677EJRokfR26R/WtNZVWPezWP9d7XdoGC5wthHwm9mB/tEU9N+LF5gwUqM30q8Mq8zRKM9JvdH5mtnIgeNrEE+7PITBv+VkNmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167057; c=relaxed/simple;
	bh=s2Y6crHhQtbrRlKDgiV1zzNU5maBZtrtcgvCG9yW5cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsxlcvuNy2xjuZQIp6Ju37GUqZdVzPswLiSBsNOj3RmxPy4j4fH9gBXU/OTpw1ACVVXvaVL5AmQ49MTpcSCXuLjqMjDTXY1S9S38MvFSQuD8D/IMWKQ2jbjVxU2XZEt53WayEDReers7qRkmbFmIfxQ3yC0J5S3wcMIaoaarmYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Y3m5vROw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b150559bso7697845e9.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778167052; x=1778771852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4rlI5zRIoDjrlR29qqvXhURJNizOZ5M9DgcKCaVPG20=;
        b=Y3m5vROwBh2Eqtp0UUw0fK+NyIM7BrlJl1LnahhWIFn4BNg3sj9xscWp93xkaTZ4Qc
         Efn6HsuvEvrzoVNVLEwdaRSqh3Z9vWaNaftZcJcDXk2tqeiMoWriGBMFnbypfYl+EsSJ
         vZQpX+l3LJQ5IWZoytgwF0d+veWjz7qrNdUpKih/pBf+OGwSXO2mZopb9h/YpMwA51em
         75AeOlPL7FnW6jIePeyPETN9z8vz2iwryhGd/DS7tUn62k1AbOrP8CYmmA0vfZVe40Ga
         ANCl2lhOC4GZriScc6UfMlQzY7GRnq5/EY9YUuvDPY7+Tby9MScXQz+5F8AkDFDOJ2Ap
         4iAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167052; x=1778771852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rlI5zRIoDjrlR29qqvXhURJNizOZ5M9DgcKCaVPG20=;
        b=VsZ1KMtAqcl6IWxyNk3pWirgon1emtHCXNByBWtpJ0/6GWSs4kCHg825cihCZwsHgP
         I1LWG+czKajiJ37iuI+O/iOYpxqKxPNlqKUF23dOcPPQzNtWwjJSvCxdG0iHeiQWE9Oo
         B7wpC8XX//8xIRFwiF9WF3nceyPEOyjxuBrCChOrY1nPyUJHlFyumSBP7TqYxXM0PVwg
         /ct4yaQwx0NknMFw6c+w0/aEghRBJYbFICGR6x47OnJ0KIzhVKRo6ZLnjtTyW0nh3/Ox
         2X0bwkpAnHSaqhxDj975VekJKa85yRKp/IE7G0zf1t6/9cmqcUK4xq1anKvF99a6rlqw
         crGg==
X-Forwarded-Encrypted: i=1; AFNElJ9G3lldWtufnnLwPxwCeqxg4fJ6AWBZd5p8EfpFRSL08+c0Xh+HD+1dGUkgMv55gSp2CcB5MxrwAZ0BfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXWqlI5dXqGxdKH+6wf7mhk1DEtPZpSCOIsrt4bJoJ47uvAaOq
	pB8lzV4GxD0t7N0HAM8JwmH6p2wizi235KjBi2WC3vhoBB5JnA1dT1NoiTqhEjfcrVg=
X-Gm-Gg: AeBDieuqVifCkqJ3V6BtxvP7WEzFL6jrVr/RqJLsfp/DxLP7Njo5hUpo3gcODxY4Pj9
	hdsjYN2oJ3cnw8aHYOGZS5zbUIp6bsV+RrezElDIRpd7t19biOH6UvVVFvZxsjnoRYmxc2ikOyO
	d6IQiqIfEVjzgtm5wCIISe+jxKR9WAvBN6CJmmkkZ6vt6QTSMMnYxYnOqOsR7pwHzVil8kyUgvX
	WYakactBEL/D/nGiKBbdNewckpfLxYUca9pZf6h+o7bPkQkzp6z5yqvLFMep/LWg+gs25M+Nc/h
	F29AoRlZcbSyIO3N/F73yQBWT+PS3jC/IB+5NAejWBaN99gHQ1c6NvSP1plyZ8XGQSPOGZhWvzE
	l3J2vnrSUWDa0XqvGAnXmT2unwqE33vPOpf+Az0c0ueDpfaxWOlKZI9i1647zVjceWUy05hj7mE
	EJnJNjj6ruJCffFNPmKf8B0oSJT19m/3P1VcyiWJLmXUv6vbApZ4r5l73NSJi9vhxJGYC8I/Dh2
	4RTvzxIC95NEaQn+9uKo9/+jw==
X-Received: by 2002:a05:600c:3e8d:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-48e51f40b12mr145712015e9.22.1778167052008;
        Thu, 07 May 2026 08:17:32 -0700 (PDT)
Received: from localhost (p200300f65f114e08e9fd60f450b139aa.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:e9fd:60f4:50b1:39aa])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48e530c1d07sm41001755e9.9.2026.05.07.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:17:31 -0700 (PDT)
Date: Thu, 7 May 2026 17:17:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, 
	Andy Walls <awalls@md.metrocast.net>, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Yong Zhi <yong.zhi@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dan Scally <dan.scally@ideasonboard.com>, Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Abylay Ospan <aospan@amazon.com>, Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
	Ismael Luceno <ismael@iodev.co.uk>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Corentin Labbe <clabbe@baylibre.com>, Ingo Molnar <mingo@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jai Luthra <jai.luthra@linux.dev>, Kees Cook <kees@kernel.org>, 
	Bradford Love <brad@nextdimension.cc>, Atharv Dubey <atharvd440@gmail.com>, 
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, Sean Young <sean@mess.org>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Wang Jun <1742789905@qq.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH] media: pci: Use PCI_DEVICE macros and drop zeros from
 pci_device_id arrays
Message-ID: <afysRvNhUCW75YiB@monoceros>
References: <20260506174412.2606010-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g75pm3ww6reiqzz7"
Content-Disposition: inline
In-Reply-To: <20260506174412.2606010-2-u.kleine-koenig@baylibre.com>
X-Rspamd-Queue-Id: 7174D4EAE17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-60829-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,md.metrocast.net,baylibre.com,intel.com,linux.intel.com,ideasonboard.com,digiteqautomotive.com,amazon.com,bluecherrydvr.com,iodev.co.uk,vanguardiasur.com.ar,linux.dev,nextdimension.cc,gmail.com,isrc.iscas.ac.cn,mess.org,foss.st.com,qq.com,vger.kernel.org,lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--g75pm3ww6reiqzz7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] media: pci: Use PCI_DEVICE macros and drop zeros from
 pci_device_id arrays
MIME-Version: 1.0

Hello,

On Wed, May 06, 2026 at 07:44:12PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Some pci_device_id arrays already used the PCI_DEVICE macros, others
> used named initializers or list initializers. Unify all to use the
> PCI_DEVICE macros and (if applicable) a named initializer for
> .driver_data. Also drop all zeros that the compiler can care for and
> unify indention and spacing.
>=20
> There are no changes introduced by this commit to the compiled arrays for
> ARCH=3Dx86 and ARCH=3Darm64 builds.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
>=20
> this is a preparing change for making struct pci_device_id::driver_data
> an anonymous union (similar to
> https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre=
=2Ecom/).
> This requires named initializers for .driver_data. Not all changes here
> are required for that, but I expanded the quest to unify a bit more than
> necessary.
>=20
> I put all changes in a single patch, if you prefer it being split I can d=
o that.

I just noticed I failed to put the following hunk into the patch:

diff --git a/include/media/drv-intf/saa7146.h b/include/media/drv-intf/saa7=
146.h
index 71ce63c99cb4..b8f2fe5680f0 100644
--- a/include/media/drv-intf/saa7146.h
+++ b/include/media/drv-intf/saa7146.h
@@ -77,13 +77,10 @@ struct saa7146_pci_extension_data {
 	void *ext_priv;			/* most likely a name string */
 };
=20
-#define MAKE_EXTENSION_PCI(x_var, x_vendor, x_device)		\
-	{							\
-		.vendor    =3D PCI_VENDOR_ID_PHILIPS,		\
-		.device	   =3D PCI_DEVICE_ID_PHILIPS_SAA7146,	\
-		.subvendor =3D x_vendor,				\
-		.subdevice =3D x_device,				\
-		.driver_data =3D (unsigned long)& x_var,		\
+#define MAKE_EXTENSION_PCI(x_var, x_vendor, x_device)						\
+	{											\
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7146, (x_vendor), (x_d=
evice)),\
+		.driver_data =3D (unsigned long)&(x_var),						\
 	}
=20
 struct saa7146_extension

but that's not urgent as the current definition of MAKE_EXTENSION_PCI()
is good enough to not block the next step of my quest. I'll address that
in a v2 (if it comes to that) or later together with the next step
making the driver_data line:

	.driver_data_ptr =3D &(x_var),

(or if you apply this version, feel free to squash the diff into the
commit).

Best regards
Uwe

--g75pm3ww6reiqzz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmn8rQcACgkQj4D7WH0S
/k4cbwf/XHootzTV2dhXqXjfIYmwScfZDuXhC38cQlxVyoIlhSgTqnzIftlcdZzB
ORcP5144p3lUqXTTPW8J8BJzmXJbC0W0ntqQjr796pGP13R8oSOScBfG4Cr93SH0
AIGPzXGluScUNpGnhZfsU0yKaE62n0J5CHPDanLIpG4o0PwnRscgK7gR1TbsIvP9
Ph3ao4z/ctecuaGBQUth0WbYzYwO7RUZSWdvqocIbgEq+RU5kPSEE9xwG4/ML+Za
EYlKuZwEQl2CnbM9pmT7eIcn9RmzVHCBL+KsO5wWKRRbRECKboQ4yEhFpRpT+CXh
2U0+ECHorGmEYceB/zv5vmVxpXYJfg==
=m8GL
-----END PGP SIGNATURE-----

--g75pm3ww6reiqzz7--

