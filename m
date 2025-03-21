Return-Path: <linux-media+bounces-28554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12287A6B682
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 10:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ED1C3AE855
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 08:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83971F03ED;
	Fri, 21 Mar 2025 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ck+t6MkN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01E32B9BC;
	Fri, 21 Mar 2025 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742547528; cv=none; b=UgMOlczhGpoMXh+ZM56mtMvty/vWlIj8ox/RJnfisU+81p3MgCRnfqG8ModUI/DZq4UV3XXLdi5PZa8Rp06yYPrQSWN6i+v8ejTVxrDK7HroopEBzzmD5gb9VWMSaAnoRFoy+6ZzKGOV0hjhzLqAYe2w4Q9FfOkcQzrAs+n1fec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742547528; c=relaxed/simple;
	bh=T1PvkW1tK5JReMqvH5nQyvYh9NGbhr3r9bOLr0LtqVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q7DYnyLrDTIt59PhOpfdIQ7Ajbl/aMNEsq4NetyOhmP/OaWfA+XXII8Fzy1lLHAxS7kNOg0BOZ1ZLbobLVFBmO2/TZrh2943b9+mFPGnNpmbTOf36nBtUSDbzOB8nK/dTuJFsAg78geE0LXWRJ6aIbhLJSPXTNc8z0/3izl9/9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ck+t6MkN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549963b5551so1895401e87.2;
        Fri, 21 Mar 2025 01:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742547524; x=1743152324; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VRxr/3yDierEJn4XMuzsB59m3HklSWHOO8B7tMnyABQ=;
        b=ck+t6MkNy3ZWAlASTgLZMgE/nyCglxwZ7UPq3yzQ3HkgPwM/sr3do5UrPKY2v1iToK
         oyXLU1P1AJR967imTe3gF5mRUiQsHZpS7xLvZun6UIjKeFf2qyXHkT4c8/BpMH0IFwAi
         JhXjIUm1tVcd+upmukcliTixflb4qIPCZb51MwvTe88sH2hmhm+VJRF9emKLwl+Axliy
         93OqTyy0lt5tzcdxarITnuwZEbe22pWtgAQpdc3gYiCZ1oDK2w1+1DEjfvMp0fG+GTUL
         6Jyd2kpLZg1Dl0S22GvqUYOPE4ShljwENMIl8dj2jadqfD0GH5Zi3dHCuK9B0fiqPg6K
         C5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742547524; x=1743152324;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VRxr/3yDierEJn4XMuzsB59m3HklSWHOO8B7tMnyABQ=;
        b=t6vCcJV7JwT5Ay/KZiQ6XL4wMhoa80RGRxsO+F3DpLgPQRq58UdJ/2qiKU+SVNsI5v
         z8pjvuS6LEA+s3XGpMNd9NWPRgAjvqBE69NboY4LWBm827e34m4eLdR4pfVBmWuIqIzY
         iUh7iqmUSEcsZjkhVd5aGj0ku/epu5EIbmBgW151crR0eQkW34QFRbr9GnmrP2NObs/u
         Vd+MvdoL8SHW4GDiU+2YICUSn5xI4xYq5klqggc/ZF/5f/cfe/+NhCnbAO5xNx+S4SH2
         AmfpnRxRfsI1xPKkBbh9yNql4b/0v8PGA0EGc20P4BpynyQnYe67fN285XSCmJeAfSud
         2WxA==
X-Forwarded-Encrypted: i=1; AJvYcCUt73J57kKop2BhqH/1UDxXYnaJI2JOk15Pkc70MI64Bk6kYOxeoEE1PWoHv1rz4F27wPQDZungr27fQWI=@vger.kernel.org, AJvYcCVRCygcb10ybZvgTiPHmh9GalCsuVRO2hdAX52kO2zRWfyeYPkk0+VMZhfQOxhGviVEbBWI9A2YoOq8pA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ5QAfuUmWnbPs+9FgbisgZmMpmigLVDAEvPjru1tLbvFEGmwh
	Uc485ObggJOgJHrr8ztUjWiS5VzIhR9WMcNK5DQIcl8jpo1LTBYa
X-Gm-Gg: ASbGnctnV1sD5VFuz+ZakOeCIFAyYEQv40Nco3HjOpeHK+9dyN8z56jqJR2iBI5VxVl
	yMrhl48rONkva8slcGMJfQnlb7y4D5RyGN1pXKgI9G2HNflKcAwY06Un1HTBBDGEvxxr/ZAvgCh
	mlEn5nv85CHal0NLcuC/ABce37tE6jETxCarCiSdVeFNq05GPhUVdtb/DHbVDd4AxkZ8WyyYlwE
	XK6S3d17glxDO8xLd9benA9YwZko/+cxhaxWaZ2JrkqtjJlozzvAhO5oFOBv3h1a9wSUtLddN8j
	ll3jgYCsH4mzl/0natOyqkBroRuIRgn2wOB1HbWCTClQSxzYGJ4=
X-Google-Smtp-Source: AGHT+IE8unwcjobvTvkmOqQeY6Nvu8RMXa/0/x987i137LsUQ3tqwRNKz4WQRIRSnEi7iG6QfNbr5w==
X-Received: by 2002:a05:6512:3985:b0:545:2c2c:5802 with SMTP id 2adb3069b0e04-54ad6503700mr931235e87.48.1742547524113;
        Fri, 21 Mar 2025 01:58:44 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468745sm131050e87.51.2025.03.21.01.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 01:58:41 -0700 (PDT)
Date: Fri, 21 Mar 2025 10:58:27 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2] media: i2c: thp7312: use fwnode_for_each_child_node()
Message-ID: <Z90qM33DvkTMGg_x@mva-rohm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2t2NLr7q7HXOL/hy"
Content-Disposition: inline


--2t2NLr7q7HXOL/hy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When fwnode_for_each_available_child_node() is used on the device-tree
backed systems, it renders to same operation as the
fwnode_for_each_child_node(), because the fwnode_for_each_child_node()
does only iterate through those device-tree nodes which are available.

The thp7312 uses the fwnode_for_each_available_child_node() to look up
and handle nodes with specific names. This means the code is used only
on the device-tree backed systems because the node names have little
meaning on ACPI or swnode backed systems.

Use the fwnode_for_each_child_node() instead of the
fwnode_for_each_available_child_node() In order to make it clearly
visible that the 'availability' of the nodes does not need to be
explicitly considered here. This will also make it clearly visible that
the code in this driver is suitable candidate to be converted to use the
new fwnode_for_each_named_child_node()[2] when it gets merged.

[1]:
https://lore.kernel.org/all/Z9rhfJUlCbi7kA2m@kekkonen.localdomain/
[2]:
https://lore.kernel.org/all/9c3880f74476436f39d796b5c10c540ae50b722c.174222=
5817.git.mazziesaccount@gmail.com/

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v1 =3D> v2:
 - rephrase the commit message to not claim the 'availability' has no
   well defined meaning on the DT backed systems. Instead, explain that
   the fwnode_for_each_available_child_node() only iterates through the
   available nodes on the DT backed systems and is thus functionally
   equivalent to the fwnode_for_each_child_node().

NOTE: The change is compile tested only! Proper testing and reviewing is
highly appreciated (as always).
---
 drivers/media/i2c/thp7312.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index 8852c56431fe..4b66f64f8d65 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -2067,7 +2067,7 @@ static int thp7312_parse_dt(struct thp7312_device *th=
p7312)
 		return -EINVAL;
 	}
=20
-	fwnode_for_each_available_child_node(sensors, node) {
+	fwnode_for_each_child_node(sensors, node) {
 		if (fwnode_name_eq(node, "sensor")) {
 			if (!thp7312_sensor_parse_dt(thp7312, node))
 				num_sensors++;

base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
--=20
2.48.1


--2t2NLr7q7HXOL/hy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfdKjAACgkQeFA3/03a
ocV0rAf/dK/eKL5/DzjoxB77wHYFdZROYnEiIaVFsFXfV9SHL9bZhQym8Llova+w
PNxsI8Yyu5b3A9wib3zXBN3MmswmtmXzDg96DicKUadygv3j5bKDa/lyMHfpmBQ8
yu1Eg24bg1SSpTQN3v5JEGP90pFHd0qIwnevbQCOT2h22K6PyuG7wg3GUuBAQyQu
i3G+yJYS7Lh2YtOxDm8O2gvicPQ0RjWhUN08s80mXxDGZSI2wGG5hDW1Qnrk0NQK
4dwwkAgXZMx18OY583ssyjpNuHjvIZFIC2eJDHs8lsMyIoDvJnvUI1W8AA6dzPbw
ZKUeq1H5xyq0P2iswLQOIgl8ig4gdA==
=9nnn
-----END PGP SIGNATURE-----

--2t2NLr7q7HXOL/hy--

