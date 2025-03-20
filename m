Return-Path: <linux-media+bounces-28518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAD1A6A179
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 09:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8E147B13A0
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 08:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DFF214227;
	Thu, 20 Mar 2025 08:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHtpiEKS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0326F20B7F9;
	Thu, 20 Mar 2025 08:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742459745; cv=none; b=u66ItgfOmLxHHNebhseH7sQZtgr+YePIdm1lfIP/SiwuqQy0vbxkxonSCebAHjx6TrjwQF5YeVffoBeXxsQ2ZuwiNMmifd6l/AFRrixYVJGCkrOZnWchRO76DjUvqaE4oSpNMh7AapbY/WliyrZw+pLDjGcO+8sD4zmQ1rASVBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742459745; c=relaxed/simple;
	bh=EvTSXjV2PH2lo2VSUvF6H5lgrytFBSojxUSi/IMN8p8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WkFjnoONmMl3HYPn8lqLJrMKEsVftsdHVUXZEGpSh+seNVBdR1qGMbaEvtuvTymAEGAWYbZ5gZ9RjXxIvTvo7zvWRN2n3DBpuWBAAvqx3fR6YFQhKwY3Ik/sq9fQDuuPHeCxCZ8iMY4q4+7VPV8Nrt6a+3p/k6tUV3SxtSMiP+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHtpiEKS; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so677216e87.1;
        Thu, 20 Mar 2025 01:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742459742; x=1743064542; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEfKYn13KxRvM+u9B1SPaZyxMNyyd7I0OweEjNJQ764=;
        b=lHtpiEKSaSaKE/9VS+1A5mlhxO086LmG8QihwLRhkimgYhESqS/jif5omG0KzEundd
         T6gmUUb/yB4P/TmLoFoRcUvr/7opHiLQjzioI8pN2BYaAwGGV+fD80kL742G1/YgP5G0
         zeFDYVHmjICD1S/R/SvM9y8FDkmzbbVX6Apu5Lbb65KXAlmbLolbc3zURHlyh8KMXSqs
         7jAattVN65Cdtw3ZPUXn3QYezx+2axj7jLun/QAp/pB5W3IIL5bYuxNG5IT7YmX0t5UE
         dNCR2KcOqHGsPmfPu+5Skdyw2efuZkYQgypn4NCUdpz6IumAFFaFaf+V5XWCmnH7b/1D
         bYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742459742; x=1743064542;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEfKYn13KxRvM+u9B1SPaZyxMNyyd7I0OweEjNJQ764=;
        b=laXygvlHvGqjmLzZ0QTs7YZjNC1MAoOXQlZNJJqZXr5h9kHTT3Urvzyb2S8kpbH1A4
         jZzbMkZCxix8DE8//NEfBTWNtJhCHNjj83coaHmkjaQbz7VlcmE215LF4niDOZyTyOoE
         tBQIj3CaCosqRcUjy0okbvUrspdqFpT+LxA+Nump9NIVuu5C6hZC8MI9oYrN3fdmv5Mc
         rfkZXcPWyj6BUoG4c9B+XQIF+LfGRzVNVZGGdUbVmMBAK1YGgDtvrM25nV0D7BImxRUQ
         cnutQGhNoCdZjbJS9PJd/obg6pshQP6b3DXYvXteaSbkiELJ9+BPwOwCkpl3Rr489t7E
         XrpA==
X-Forwarded-Encrypted: i=1; AJvYcCUOfv2tDR9aAYleCoHy3VM9dz04ourn8FfdAGG6ondXEaXCNYGI4owkSin87Hy47nPT156qpRwvbovPVlA=@vger.kernel.org, AJvYcCXDYwhtUPHeapDiBYG32Qn9GPifxGQ9Vck2MvHl3OWNKC1D3Tif7wrWf8RqZNzZK30y6vD3C/Ov/3MKh+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz59VcclH/kxVB3OT1ytTBn5Wt08tcLiPFRp5jOfoEDPfArku+A
	fi5g2KFFKAjM6zx890A0BKmcato+mnIKFGM98+5PXh4UfLCQRIhA
X-Gm-Gg: ASbGncskBPkHL4C8YVN5VQ6RRSAYrMkOeAlMZWs7hibX/VfFR00Z4bDcIQ46CQdJG/z
	hZy/cySVv4y4RCLnm2RzeR2WTLqr8AvZynYfHWmKzjEARRgvwsMSj5PKFSgjaMcHhnTtm5fyEOS
	nRi2dql8NI4QDThzGwjJD/rYC8AXcyTgJbhRns4D4s31omMuwMsF8ikUZHYojM6Pi2gG97PLyQM
	3Gs+TG7+XWWMia5qB/9aDt41DImGntK8zbFi3aNSS94kCEVt5dAD4iysLuAcdFgV8M7jcjoz4HJ
	zBFX4/l1il/iYSMXc+CYZt5w5ebTN8ap/cTl8YoYyAwXWQhJ574=
X-Google-Smtp-Source: AGHT+IF791WItLIRBkUjc+fCTpf0qnKptdqE4U51W+nqH+62csyxdekG4E1y9XZ8sbUYmllZ7CsAhw==
X-Received: by 2002:a05:6512:39c1:b0:549:91c6:96a8 with SMTP id 2adb3069b0e04-54acb1a47b6mr1891130e87.7.1742459741753;
        Thu, 20 Mar 2025 01:35:41 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7beceasm2204857e87.58.2025.03.20.01.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:35:40 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:35:35 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: thp7312: Don't require node availability
Message-ID: <Z9vTV7tS2ZI3tM6m@mva-rohm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CP6fkD5NC1QFM/F+"
Content-Disposition: inline


--CP6fkD5NC1QFM/F+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It appears that the concept of available firmware nodes is not really
applicable to the scenarios where a specific name is required from a
node.

As explained[1] by Sakari:
"OF only enumerates available nodes via the fwnode API, software nodes
don't have the concept but on ACPI I guess you could have a difference
in nodes where you have device sub-nodes that aren't available. Still,
these ACPI device nodes don't have meaningful names in this context
(they're 4-character object names) so you wouldn't use them like this
anyway."

Use the fwnode_for_each_child_node() instead of the
fwnode_for_each_available_child_node() In order to make it clearly
visible that the 'availability' of the nodes does not need to be
considered here. This will make it clearly visible that the code in
this driver is suitable candidate to be converted to use the new
fwnode_for_each_named_child_node()[2] when it gets merged.

[1]:
https://lore.kernel.org/all/Z9rhfJUlCbi7kA2m@kekkonen.localdomain/
[2]:
https://lore.kernel.org/all/9c3880f74476436f39d796b5c10c540ae50b722c.174222=
5817.git.mazziesaccount@gmail.com/

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
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


--CP6fkD5NC1QFM/F+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfb00UACgkQeFA3/03a
ocWAEQf/U7lkRbfDPOJF5SYxjXG7NOzTeTmwkU6tS7GAP+NISNu8vZhHzyHtXTbx
MNNN8PwiY/5K7owQjWZnbbhQmHImqFqxTMzeB485E2mJB4kJqkRoNQvgIitx9PMX
9FUvRbEw4bBZR2B00nx+NSYuGvNVQ86NLEI7KG0iDLa06btsBG1g/sczSiU86HKd
lL9Adok4pzrBzft/lTxgUbW7NC4tB7a1aNF+zGcZPT/7/xT0keDRIeUDCcNCOvZW
cvizB58MAXVLdKr6k1f4LvDiQytDUyDtMdTRnGLzGG3kafbc6AQXjBBhhKHteS4z
D2rk7aZvklRExczgLQe0sFMTQXgxoQ==
=UFOQ
-----END PGP SIGNATURE-----

--CP6fkD5NC1QFM/F+--

