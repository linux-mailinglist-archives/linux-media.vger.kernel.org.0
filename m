Return-Path: <linux-media+bounces-32120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B793AB0FDD
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 12:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C226E5029E4
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF9C28C2BE;
	Fri,  9 May 2025 10:07:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D731222576;
	Fri,  9 May 2025 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785226; cv=none; b=R80PFjwvVUDJrgEORDyZXRadCIGieDHBVIbdDfsWKvVw6JKIEDoKotF6U+GjphB/5O4Oiiraj1vfixrJKYK9CB0Ik5K+j3BNKx69+TBdl/yXgewqLK/Ei8HycipazgfjWmwtHM6AYtcCJ4pMnPckd43yJOs2wZEVbGskPv2eK2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785226; c=relaxed/simple;
	bh=pZd/znGo/jxzEhRwIHo1wRIwFkzcN7UFQTeOMVaIPRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rPyZLNrXhkUWMkzh/g4Cf+bmDnxPCvJ1w0UL3tbRJtD2fvfyo/IQLWS54Gah3y7ZJT6Sz99QA7HELlHBGSGjE/Xbe6eCEMLra6fJV+uEfgp/xU1UDDPzVCGv3lQtwPI82lOGBqbNKa+c9+4jT0anSSxebw1E9fRMjHvYF2gyFN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 5E851C405A46;
	Fri,  9 May 2025 12:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 5E851C405A46
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Martin Kepplinger <martink@posteo.de>
Cc: Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Enable MIPI filtering by DT on i.MX8M*
Sender: khalasa@piap.pl
Date: Fri, 09 May 2025 12:07:01 +0200
Message-ID: <m3h61u9jy2.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In addition to raw image data, certain MIPI sensors send additional
information like NULL packets or "embedded 8-bit non-image data".
Without DT (data type) filtering, these packets end up in the frame
buffer, corrupting it.

Tested on i.MX8MP with IMX290 sensor.

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/pla=
tform/nxp/imx-mipi-csis.c
index 29523bb84d95..d53a4262b63d 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -654,8 +654,7 @@ static void mipi_csis_set_params(struct mipi_csis_devic=
e *csis,
 	val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
 	val &=3D ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
 	val |=3D (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
-	if (csis->info->version =3D=3D MIPI_CSIS_V3_3)
-		val |=3D MIPI_CSIS_CMN_CTRL_INTER_MODE;
+	val |=3D MIPI_CSIS_CMN_CTRL_INTER_MODE; /* enable filtering by DT */
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
=20
 	__mipi_csis_set_format(csis, format, csis_fmt);

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

