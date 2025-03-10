Return-Path: <linux-media+bounces-27961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAE7A59568
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64C90188F39D
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B653228CB0;
	Mon, 10 Mar 2025 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLRo86Oe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0206C2288F7;
	Mon, 10 Mar 2025 12:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741611467; cv=none; b=rRueNkm3jOLe4RgFYufefHsyMz8+8nwibhgwfiKXmYZHAKFQ+RWP2GbJdni/SiC7+9xdMor2AdRTZJDcNy3CK77b8Qkh4b/hrdQl4l5AFtwU0tMRZ6Em2Agi4MPyjjyCFYlZBUEipCHZ1BXkvsEEZDNUakF9qAvBA1qbC/7sY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741611467; c=relaxed/simple;
	bh=UyaCAKfCMMrCefjNsTMumvw1aIos6CrNNgDFYJ5l35w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mk3VXLZNrd8x+MS5NNSdH1iPDewElLteGkzo2O/ZAPoa+9olOLgCkGWDuYm3U/NJw1gIb33HKm12M0YR4Vdjc3whBv8PmbMZ+9bgfqEjeVZtjTOQ3c/l59bxwjTJ4iF0vxIDieRGdYVJqQM2AuH+WBygWZJ/3dpCBfoPMuA3wgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLRo86Oe; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30761be8fcfso46894011fa.0;
        Mon, 10 Mar 2025 05:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741611464; x=1742216264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d4dWGnQVLHbJxUebKPbAjVhauARoPSPiMDDtD7eG7EA=;
        b=VLRo86OekIJA5acCmeGAMKwO6Mb1ObjRI6bp9QLsG813/JBDZ+7zCCmKKvZtgLsait
         lvHDkx7egtf4O5r0eBn0yfQtvGnXM26hswr0PmYmYLBhkO/Ar/4mLXF+Zp/RRAJ36/z7
         cztQqwZQqza+r0SkxFjkW10hFZ1c/Vf9QQw+QK1cGYzwPLm2tbY0QgXVRyqUi9clSo+x
         VyENozIx8C/apunISf0fIKMpoA8JInCbm+DQ1hwabZpYqCMnc6zrua/WbEL1o9pLRote
         PHtwZPZQv777yqzHRfNwbPzQMKq15p5MKjsk98zMQ3vbAGblYVEB7YYt3iwHNNmwkc3j
         Edhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741611464; x=1742216264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4dWGnQVLHbJxUebKPbAjVhauARoPSPiMDDtD7eG7EA=;
        b=GE8HKWrZc8lBOVCpBOWJyw2mOTtfVQ8AfjwgypM8PToyvb6ehf5t/7HXBK3dZrlgdS
         walXHFVTfHQNyXPo7Xsjn58GoLJV2vF/UcGz+/teAFk3j3Xo98bDg5HZBZ/vxgp8imFQ
         OaC7NT3oBvwcjBhARiPdaxXXoe4zrkBPO2jREAuz+GYtBJEbvRSJhKs7hRSiYPV4goUX
         E5Dht6omN/5f/6ga904k39fSHahzugEs/uLLO7pYtKxym0RdcgZcTFRNOOETaNK7lasw
         gsa8lz0n1FfVrWWvrPZ7ZmFheWwU/tjoKdcxsAbPT4kqh4mD9gtLOxN9fbeW6NpDgRfA
         ACXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXmAV1pAf5nIIIygYrDjMcEMcWLAhLTFlAu58PUwwr/TDEXivrq+eqPjuxUfDB9KS0qFNXxBjA7OxF3Vo=@vger.kernel.org, AJvYcCWlxIllp+EC/RN5fDd57JIUcVC29jIY/erBxURxVVLTM0cyp9p7kC3Cdvg3UL3HXuSqxzQhwAx17xVorJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCimMD0N5zty2pGduk2zXPDX+hWY7EJrW8jWzYIeZzlB1UcWOU
	Zr+pgEAIxaB0isC046+KbIe01rLlgyjIbiNu+xEo8zqBqArQxc0A
X-Gm-Gg: ASbGnctzPu5MViORyTV0U17LjyQ67FYbpYatD+I6NbnFYSx8BbD1m0OaSXMfehXe529
	Unqx8eKG7N/LbdDAwiy5vnKR8iVcPa/lVgtGgpCaszPBq7Zy9AxiwZwBsZ0gqNsaKjgoH1Sl7k9
	PKqOLFa5pEIRdXpOLI6HuAwFvRnNB9xW3fMVoynXmwY6EX+4PDnly2g9SE07r85MtZmh7VUeZ+y
	UgA90NcXgLt1gqSQDA0fjfhiOUULIl7duZn8T7jHtAmv2M3hz76yx2+qW33PYF591MNNy2UeSFv
	foWTmZE2j3RJ8trR9/6eex3SbG4Bv6vjAHzXYwbBIioSXawpnTc=
X-Google-Smtp-Source: AGHT+IGAZbeMBLAJC0Vdh0OV4nkNu37fOrLqzyB5ixlLSqfQm2c9K89OHRKelU9GIG6YSGbs5ZZhPQ==
X-Received: by 2002:a2e:9d05:0:b0:309:23ea:5919 with SMTP id 38308e7fff4ca-30bf462423dmr37321361fa.31.1741611463763;
        Mon, 10 Mar 2025 05:57:43 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c0bb1a2c6sm6727671fa.55.2025.03.10.05.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:57:43 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:57:40 +0200
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
Subject: [PATCH v6 10/10] media: thp7312: Use helper for iterating named
 child nodes
Message-ID: <ab79cf4415d21ff2854fee4f4189fac555c30b7a.1741610847.git.mazziesaccount@gmail.com>
References: <cover.1741610847.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VjRA6cxeTefLKcJT"
Content-Disposition: inline
In-Reply-To: <cover.1741610847.git.mazziesaccount@gmail.com>


--VjRA6cxeTefLKcJT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Slightly simplify code iterating the child nodes with specific names
using the new fwnode_for_each_available_named_child_node().

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
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


--VjRA6cxeTefLKcJT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfO4cQACgkQeFA3/03a
ocXDLAf+P+Iq15aTkbiDb3BVspMtkOsxezdkEZ2ydqAgcUCRVy+6+1ilWuT7X2ir
7RXx/pOTGHEJ93OaPS5dBCTn4Q+0FuLSIoEfhKiQH1y4Wx8dO0ZB4JqPY21Cm2P/
AfQ3qG1O8R+RNpFo2LTI5ZhsnMSNhTz1iUA2hMaPAqhem8JQ8WzgNgbP5zg+rVXK
HtlS10GJj4jEeadHwcq3LxwC/xrh1LNrJ/b54Sm224YoximeBCWCsdZn+Uo5da/c
RDsOLMfl3QCKtU1lnayKOAAtImcb4i4hfrWumP015tUflNVb849ZfoH6qvdcM0Xy
R7dCKekiUlUPZBOTPJBIbklj9q3CQw==
=mHbi
-----END PGP SIGNATURE-----

--VjRA6cxeTefLKcJT--

