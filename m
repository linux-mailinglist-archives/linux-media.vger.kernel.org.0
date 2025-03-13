Return-Path: <linux-media+bounces-28113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEBAA5ECCC
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 08:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBDE1188B967
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 07:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B371FC7C8;
	Thu, 13 Mar 2025 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kg+Jg9VX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8A41FBCB1;
	Thu, 13 Mar 2025 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741850437; cv=none; b=nHYac/uSCot+31XtnYaWFcq9BQzLaaqN6bGkOgg+GLA/Y836MkWq0s8QtvZudhhj3Y/GTvDzPjnw+cgywkJrA1jyMjgmaU8I09kVmp8XmPHltxj4ALKC74eYQRJjDB+QYMAc6i1iZK7c8sn+naPiUz1WyncvuG0F/SvCmQuNjsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741850437; c=relaxed/simple;
	bh=hBkCxWmyE5jrvqncfe5e+qETgtqpE6ZBXbCZxNEtt7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjmccWd5jZWYWcIFVTstR/eBBGfc3qjFaq9hIBE17EQ2eYz1Jctc4xBUvkLtji0O2OKhoBxv/7HZ6eFa8rbIvfUWpCPEerI2mnJqVmdhtt1oAoNHi111uFVZFdxP/4SD5RH0fYQa4InUgVmwIW5EZSNpppBSFlnvTlQzUHTDxjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kg+Jg9VX; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30c2d427194so7097241fa.0;
        Thu, 13 Mar 2025 00:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741850434; x=1742455234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hsk7xMDgDeSHwgWQ5/loA236SbTMptIYDxPDvOeh6o0=;
        b=kg+Jg9VX8R5kwMgJIcfRfSzdDdtoUYWqMuFFnchJUxxP6qCdv9ueMYyUkndvCFzaKz
         +HBkqOClRllxLVXHsVEUTptxwKdWzjzFbYqLqLk4R6q45EoJ6f3rSPKPQS2tjzieZU2n
         Bj5zpBBtReM2mIYIq+UmmsM8sx4PB1UmGWO1tCUGy1/tQqFtiadycJrBtct98EwhzXJe
         OuPrGVQy88nMArgAao+5Vi4Zg/MkJjzXMHq16b6w2D4KezYmVFO2hXQSuSZjxgIWBUE8
         wM/y1O+9XVOZZIJcZdH7uvIbZei2tlooWKj57Zz4cohWjEMmiMA3z+F3bbsS3jB06Veq
         JfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741850434; x=1742455234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hsk7xMDgDeSHwgWQ5/loA236SbTMptIYDxPDvOeh6o0=;
        b=IEF/2WPwSlzRH0cecGoApHLzS8DcbGI8OgUO/7wSR3t43Pd9h1zDG1ijkdHOhuFH3B
         a+jmqWTFILGwBfYvBnAaCQuslzl3IZxEmHf+iuYLHZE+NIdxugQhrKHArq8SB6aqOkCE
         8IgV09pQQyy/QnspBgK9zo08xP2lDiqoEIofDKFQWdHjxQxQCjEA+LQNITxd50w6s9Og
         MHBjOW+rRy8aBFb5iLej2XTBx0ymtzCVqobqQ0cFzHQolkaqDbxe9BNG0P/59NSyKPVd
         VT0B8M+1eRzXZcV8TzZK6U0xqpqYtqf4g7PhVUcDb+idDfiQrGBbvw15a2q1Qyw/oD5q
         9/lA==
X-Forwarded-Encrypted: i=1; AJvYcCUv8+81XeA2X7J2g1QuQ+ny6DgEvwtniZXjqfCNLApFsqnBe9gjL4aO/IJ8+A9Lta8n3cja22fvYSU2f0Q=@vger.kernel.org, AJvYcCWVmFtda/Oi0AxfZZzIRreiwb3qPVpVxZhPGe4BxIxgoi7HOmjm66KG5Kz4Wb39/CCcNhrYAGzCpQmgAsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIb/Ti0JNObICxqbp4rRi68zuCVx4RaEMYLP0XKXN5veDbl9Yy
	xrp+6jVfnY1z8miEAR4dpgvQuroswO0JZkyHKK5Z5ywKyl6ic/2E
X-Gm-Gg: ASbGncvGrflw8SGtgq+5LnaZnT277+WLQhhfgmGlT6szDS97UG5ijnhG4N+IsTfXAcF
	3w/P96n8+hjZLm+MWoM4nC2/vUFLa5KSo1xza9g1zyo8EZZSiVMWujkMEO3cqxwZARGyf155KZy
	nOiLEmhXlNRekN5ak8pjJoL76envYfFdxId8R/jojTNMstMfVOlTTO4Ey0nYxWIL4jUhCVmLrru
	wmmMl21hwtaJ5mS5XaD3pkzUdV9CpMoOozy2AfLtSIGAPd/INTWNAI8fWZAjOsAhHcEfyC1Vcz+
	xEGQn/+QK8051FJTI5spJZhylix1DM9CJcEZ6Hq6Uz/0xeAagrU=
X-Google-Smtp-Source: AGHT+IH2dj+ZrlrxAYZT8l4XChj2QzXtanxNbBTinXDcuurWwv8gRgi9FcsL8czljgCZPKO1Bq7zmg==
X-Received: by 2002:a2e:be27:0:b0:30c:7a7:e872 with SMTP id 38308e7fff4ca-30c207543d8mr51158801fa.34.1741850434099;
        Thu, 13 Mar 2025 00:20:34 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f117461sm1212491fa.61.2025.03.13.00.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 00:20:32 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:20:27 +0200
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
Subject: [PATCH v7 10/10] media: thp7312: Use helper for iterating named
 child nodes
Message-ID: <63a94c96c90ae84754df38581637614695e61bb4.1741849323.git.mazziesaccount@gmail.com>
References: <cover.1741849323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rsWcXqNw98gn4nAG"
Content-Disposition: inline
In-Reply-To: <cover.1741849323.git.mazziesaccount@gmail.com>


--rsWcXqNw98gn4nAG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Slightly simplify code iterating the child nodes with specific names
using the new fwnode_for_each_available_named_child_node().

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
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


--rsWcXqNw98gn4nAG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfShzoACgkQeFA3/03a
ocVp0QgAz70TUjycfG2bZvH9TpvbsMRTqKkhAgDqH/sQVdLWEjZb27ytecvEyj4f
pSVP9emAhhH4bUmQS3ANr7GgYp6lH80dwGRZ0//RkPZ5U8Kwh1OtuZVKVzrn/Fy8
L0LaKjjAE7YihCKKhyF/mp5ImjOrRlQkuzWDOkr5QympIbn7qCqdYV5Q6mPQtoFf
xH/vcDtf3qG3yz6MYE2GRkRvwlU8LpCT2llQ7CxwSAbYswjfTlbtegZ3DWLs3vfh
eLAD3gTscCvBdNP4fB3KjTgt0UH/xYmR2ypk8sukg9Znzod/PxX5OZknkb8Gq2VT
ZNCo4zEwXgVq/I8kqqKdGj5vVM7Paw==
=ZHjG
-----END PGP SIGNATURE-----

--rsWcXqNw98gn4nAG--

