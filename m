Return-Path: <linux-media+bounces-28372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17336A656E1
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 17:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A980170A5F
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 15:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D03194C86;
	Mon, 17 Mar 2025 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbjHMKZS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD67191F6D;
	Mon, 17 Mar 2025 15:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742226769; cv=none; b=fWelHsCPR/Mgm5bohMjwU8dgWZ3vyPf0mshW2OCdKhutarPvyljAKrB+gc+WcP0h4zD+lEVu+wCXL+iax9PBoJAkC0UnKKRKOa7iDy9hRk7BMsNNjQ78flTukxjI0O/6wBx93EMmf1O7bibqoKDn0POq2OXW32m7Z1j60p2UvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742226769; c=relaxed/simple;
	bh=LQPXhVdsd27bls7Z9gs1cfAmX7yOsRJezTgCGdhIcJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEi43mUGOk9RDeHCwgY7dOUe+2Fic3Y86QZS7aHS5TjF4/ttMObF5glM7LvgE8ZkwpLfAVkCzoXlh18MyI8nqUpSckJo2i7509whYSSCXP4cANnU6i8ELA0upMQWQpgWMJp+wXC82m4C4M6dZk2FcnyVoEw5jC7kSN5NqZg8PVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbjHMKZS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30b83290b7bso46821611fa.1;
        Mon, 17 Mar 2025 08:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742226765; x=1742831565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wOrgpCesyo7K8PeHYtDUc+GcqoK6FTDWO+S3bjh5O+E=;
        b=UbjHMKZSSg8mPGC4WifIgB5wQTM2vTrbT08X0MR11V/yGcjR8uN0m6UzNe2xyTC4uY
         rrBC1kZC/cuMPMY5q0Tj9yRrZ1E3g6m5TulfVaxW4MVsNTS1U4fOKg4hasjpBQnZp8nY
         +rdSNHIdH1318tpmBa47NaozevV7wYtoYCn8CPEP131aiA/g3nEhgVqr24rRDNr/zqWM
         XmTGM2zSN3n1BXBpWWNBFzczFbz4dHv8nTkDesio6pZj00ReaAF/z5b9WjbbQhSPoYFe
         3sPuyQIyY5yUYzMJplyAW18g/fJudn82nLyh0mviKDKc0VeNU+Vh4tZE5x2vQ//5eUIO
         ycfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226765; x=1742831565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOrgpCesyo7K8PeHYtDUc+GcqoK6FTDWO+S3bjh5O+E=;
        b=JAHijT7LDgFH8o4msEp7ecPMTPMIRAY2kFaQ2llu5LDXT81+WN0w4MzXoOqeb7K2HT
         pAWVpb2+1luNzi9kAGlmhbhnuZqzBAmuDVRUBF8yTpzj3XI7A3ntw5dcfw0B3x2G/aKQ
         oQ0Ta9G+YQR3P3gbYxa4eQk8ghYG+ewET0eFqBc/DvLzvI87keHagPDcml8qdaLBbg2Q
         PDQzwoH+BoXElK4x8vqhsyfAkuX0fvyYntjJZunzqWlIhCwCoBEwQtwX/f9kqMh0yCM5
         ppK9LVK6KUnKtg3IxD4+ShYpGlMICMk14gJrH3TumSIQYvuqgIp64F8HNu7bVzuIK2TX
         QIMA==
X-Forwarded-Encrypted: i=1; AJvYcCVHLEBwr/v/YgrGNf8eYr33RJaIGp0/HjAALwmO1xQLsXofwwtE8iInj3z+1y0DucYjVJkmH8GUGAPXE84=@vger.kernel.org, AJvYcCVHa6jdK3r3v4vucVb9uwHksJZaJRtan4Tv4Dy2A8z0fcYOV3Gbu1XM2pIE4LfchX1zCza0zhorDIF872Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEeouLZUfPOLG5Q2psMLOJJZDW2W0zSklEmuQbiH+2uBvmlfst
	N1VVbQbj3X+y8+xgbJGCg+AkRg9JbW3dNDMjy/QTrBOCL5KHWU0b
X-Gm-Gg: ASbGncuh34Z3vGblQzvL1ty17YDK/P43nxTR0/AYoFTV176ovdxo/jagZlfHIm79c5E
	haBitkIBOYk3S1LfKCvV2UttPZ+Vto4nA6aDWSXkOYGElmfG52RAwg2w1gMbegYQU47sKFczWSi
	LZqK9TqzRjhvvu3oW7q2a+stcnxi4hRgbYnFO0sufOF7btMVJiRZ77NbDdz7k70Qih6wJ5J3KI1
	mUjRpkI/6qOkYSGoa5xvwYg1qPmsJQt0X/RYXI760y7RwSM45Sn+jUSpVk4OxtzYMAKRrChtH2b
	0CUIqoi/p/GwA6Xv++ydT4EA7mZW44KGWX1+GvxejwM2CVwd90g=
X-Google-Smtp-Source: AGHT+IGRYCFC8hQbVstyD1wJakOvjN7IcgkwHKz76OTVUgOUkMwv6DHUAUr5Q3dOkgqL0JjlJYsV8A==
X-Received: by 2002:a05:6512:2345:b0:549:5c5f:c0c0 with SMTP id 2adb3069b0e04-54a03cf6b13mr284125e87.41.1742226765325;
        Mon, 17 Mar 2025 08:52:45 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a92f3sm1342796e87.237.2025.03.17.08.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:52:44 -0700 (PDT)
Date: Mon, 17 Mar 2025 17:52:39 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 10/10] media: thp7312: Use helper for iterating named
 child nodes
Message-ID: <ecb1a801749418c8b6e451b5bd4161057a3a3077.1742225817.git.mazziesaccount@gmail.com>
References: <cover.1742225817.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xMS6GVxvdFtwhp2p"
Content-Disposition: inline
In-Reply-To: <cover.1742225817.git.mazziesaccount@gmail.com>


--xMS6GVxvdFtwhp2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Slightly simplify code iterating the child nodes with specific names
using the new fwnode_for_each_available_named_child_node().

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Revision history:
v6 =3D>:
 - No changes
v5 =3D> v6:
 - New patch

NOTE: This patch depends on the patch:
[2/10] "property: Add functions to iterate named child"

Compile-tested only!
---
 drivers/media/i2c/thp7312.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index 8852c56431fe..104754b2ace2 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -2067,11 +2067,9 @@ static int thp7312_parse_dt(struct thp7312_device *t=
hp7312)
 		return -EINVAL;
 	}
=20
-	fwnode_for_each_available_child_node(sensors, node) {
-		if (fwnode_name_eq(node, "sensor")) {
-			if (!thp7312_sensor_parse_dt(thp7312, node))
-				num_sensors++;
-		}
+	fwnode_for_each_available_named_child_node(sensors, node, "sensor") {
+		if (!thp7312_sensor_parse_dt(thp7312, node))
+			num_sensors++;
 	}
=20
 	fwnode_handle_put(sensors);
--=20
2.48.1


--xMS6GVxvdFtwhp2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfYRUcACgkQeFA3/03a
ocWgSAgAnpPv8dWlx1uYpTGvnhRGyaLoVRhyW0lJ96uonnfocB4S9FpfSX4ptNMy
XUYuGNjknUR5rOzpBdnjYAWXHVgAoBiujIkB+t3ogxXsdHvw+p54wvsKYWG52USd
SbqosGTZRU1tC8+SG5zWcA/aYg5zn5n4rxH86UKLV1djkuH6V7BLIdS/xhX49jWQ
gq2TvftieqYIalhv8uSA+S9oTKB1dIkI6iYNH310+V8NKwVY8v8D9MJKH5CP15I8
1A+rIsbWThFEPpwGlrGAKaHQDjawS0rFbmuZAYCMuVvNNfHPjTbrnHsiZzUoy14F
+rBBhw3eqpdJ0AO0OZZ83LFxItR1pg==
=FnX6
-----END PGP SIGNATURE-----

--xMS6GVxvdFtwhp2p--

