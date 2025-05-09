Return-Path: <linux-media+bounces-32081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDC4AB0C7E
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C14017AB4E3
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FE2270EB5;
	Fri,  9 May 2025 08:01:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB72A3595D;
	Fri,  9 May 2025 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777694; cv=none; b=C0qk5R9yWtF+x95bQg6oc5lhAtXOyzXJ2t1wiG5YLjNz1VuxWqTijA8QbR8+3NI4rP5Y9KxX+US3RsbOrakd0qOx7zO5/kpJGwmRDB/45jnG2tmXh+aOJGtyDcpePYL52n1wh3HPZCzEqV3IXCIfWJ/mBvLfAMoDLP264cBkF58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777694; c=relaxed/simple;
	bh=dej6BJ/BdNbyO9nEVexiAWQNIoCwvzx+mOSf+vwFstA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pjPUsBVqi5g6jrHzpMqSXgSmHHY+2F/M2hdLbOzratjnJyrtiTdgLZnVbHAx9Bk2cYA/V1YroCClizAtuN299xMSyWf1Qx1x+ClbOFzLTHCacQwNucXIYsKuWHBVweZj1Hfid8C4N26EUUxN148zfEnoUbKP+wJXu8S1kN+Yauk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 28A09C405A46;
	Fri,  9 May 2025 09:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 28A09C405A46
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Dafna Hirschfeld <dafna@fastmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jacopo
 Mondi <jacopo.mondi@ideasonboard.com>, Paul Elder
 <paul.elder@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] RKISP1: correct histogram window size
Sender: khalasa@piap.pl
Date: Fri, 09 May 2025 09:51:46 +0200
Message-ID: <m3tt5u9q7h.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Without the patch (i.MX8MP, all-white RGGB-12 full HD input from
the sensor, YUV NV12 output from ISP, full range, histogram Y mode).
HIST_STEPSIZE =3D 3 (lowest permitted):

isp_hist_h_size: 383 (=3D 1920 / 5 - 1)
isp_hist_v_size: 215 (=3D 1080 / 5 - 1)
histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 229401

Apparently the histogram is missing the last column (3-pixel wide,
though only single pixels count) and the last (same idea) row
of the input image: 1917 * 1077 / 3 / 3 =3D 229401

with the patch applied:
isp_hist_h_size: 384 (=3D 1920 / 5)
isp_hist_v_size: 216 (=3D 1080 / 5)
histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 230400

1920 * 1080 / 3 / 3 =3D 230400

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drive=
rs/media/platform/rockchip/rkisp1/rkisp1-params.c
index b28f4140c8a3..ca9b3e711e5f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -819,8 +819,8 @@ static void rkisp1_hst_config_v10(struct rkisp1_params =
*params,
 		     arg->meas_window.v_offs);
=20
 	block_hsize =3D arg->meas_window.h_size /
-		      RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10 - 1;
-	block_vsize =3D arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM_V10=
 - 1;
+		      RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10;
+	block_vsize =3D arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM_V10;
=20
 	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_H_SIZE_V10,
 		     block_hsize);

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

