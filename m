Return-Path: <linux-media+bounces-32079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F90AB0C74
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 09:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 926DA3A7F5E
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 07:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418F1270569;
	Fri,  9 May 2025 07:58:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0C046B5;
	Fri,  9 May 2025 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777500; cv=none; b=D19i0kAujgPtaBqQkCNWxBE8O26mRKLldCme6DsmCtL0kRpxFuPioEo7mdSqUWCeivrIG27Q3nvjBkKUQW8IK21SkcBdcbWmPdaB+0FrpV2Xms+v9kvDQz/fuszR8EY7yhZrqljtNqhzHwQBd9HPY78r+emJFSVDQNZrO4pi93k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777500; c=relaxed/simple;
	bh=4/tFx454oaABPvxA1f08T02RNw8rZ7Py/jTaY/6o3pE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FcdMCEUSaxqYamQlp6zYnkPaHljTUAw8Vj8g9jmVJEZuu0Vo2Pt+YP8huyLVhl1gjlMLko0t7aaPY9Yr7NP3/eTQwJcILe++/JbN7+NHbnlETeP7mhdP/vMLZ4KGui3YTOvPijMRJNI4GfDuXvucXXaeHFQPtu1rINd1BiFv02M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 141B5C405A48;
	Fri,  9 May 2025 09:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 141B5C405A48
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i.MX8 ISI crossbar: simplify a couple of error messages
Sender: khalasa@piap.pl
Date: Fri, 09 May 2025 09:58:09 +0200
Message-ID: <m3plgi9pwu.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I guess these messages were split from a single function. Or was it
for saving memory? :-)

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/driv=
ers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 93a55c97cd17..b6c7f114f9ed 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -352,9 +352,8 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_=
subdev *sd,
 						 sink_streams);
 		if (ret) {
 			dev_err(xbar->isi->dev,
-				"failed to %s streams 0x%llx on '%s':%u: %d\n",
-				"enable", sink_streams, remote_sd->name,
-				remote_pad, ret);
+				"failed to enable streams 0x%llx on '%s':%u: %d\n",
+				sink_streams, remote_sd->name, remote_pad, ret);
 			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
 			return ret;
 		}
@@ -392,9 +391,8 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2=
_subdev *sd,
 						  sink_streams);
 		if (ret)
 			dev_err(xbar->isi->dev,
-				"failed to %s streams 0x%llx on '%s':%u: %d\n",
-				"disable", sink_streams, remote_sd->name,
-				remote_pad, ret);
+				"failed to disable streams 0x%llx on '%s':%u: %d\n",
+				sink_streams, remote_sd->name, remote_pad, ret);
=20
 		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
 	}

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

