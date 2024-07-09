Return-Path: <linux-media+bounces-14721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 799F092ADF9
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 04:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 345D4283446
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 02:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED57139FD8;
	Tue,  9 Jul 2024 02:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="Y+nPM+mx"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1121.securemx.jp [210.130.202.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13833620;
	Tue,  9 Jul 2024 02:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720490455; cv=none; b=Yhu+YNeV+Y7QzuIxr9IO4UKwUIjrfc8ScBQjk4v2FbD5PnsfeRD1G+qBi7o834Z0VrgY2l6TkgHdtbd30O4O3iFN/NBrXYqEvCxYiRmU4adaIwqnFw+ZXhos4Fw/lbVP2WrgDKNtr4aIAFdEoleRBIxXvha5f7C7tPwEyQ46O6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720490455; c=relaxed/simple;
	bh=7z7CdwVNvQ3yLS8tHQyMEa+5Hnm+3Wt56PFdhq3vkR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I1s29Guj7H0XADq6/Zy0K1Cs2+TdeoXZTfdgMZASZEtsdNMgWDsLN8T6/vjXNjbDPPFRlNK7tzOMcm50wKSZFAaqrwnIyT1DU+kVvlfZGk8jtN5pUOQ6EbTybcX/s1Dc7kvRH1KTHt9r5UKTbNbDR+3w4gRmLurXQ/4WKv8tXxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=Y+nPM+mx; arc=none smtp.client-ip=210.130.202.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1121) id 4690FGuK2760175; Tue, 9 Jul 2024 09:15:16 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=
	1720484072;x=1721693672;bh=7z7CdwVNvQ3yLS8tHQyMEa+5Hnm+3Wt56PFdhq3vkR4=;b=Y+n
	PM+mxgIKNOYnO3Slr7Ck04iLaZcqjuJZo5AxvTrF1Wv7/z3iSGnS3Vho03oked7Tk0Gv/9wU6176K
	NhdnJcNQBvHPNhYK+8xJQiSccvYC1sVFaSoGhuag1ItMXGxQwOJyHGj9X3iy17bCh5IBuMpYoPAEK
	82/j0bKdqqxvQtalWxrdCz856US048CsDKFyWlzIUKfky5YTbmqG/zwBBFJS1O5xsRRvOde5R1zt8
	57P+1Zd2l+x7CH2i9HiijtKVf5JKR3BOcx4DHquZqI2Yq+zEn9oetv1xz0f+244txy3cg4+coZnKA
	7NVu4ec7+lcZncYmzlnHAjk9LW83Lhg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 4690EW2h2854003; Tue, 9 Jul 2024 09:14:32 +0900
X-Iguazu-Qid: 2rWgK3ox5moeeUQHFF
X-Iguazu-QSIG: v=2; s=0; t=1720484071; q=2rWgK3ox5moeeUQHFF; m=zK74XrmOVBLS1OQZbqRAPgE1lIZgT0DJsvrsKvYKMg8=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1120) id 4690EUrO950994
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 09:14:30 +0900
X-SA-MID: 24614076
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 2/6] media: videodev2.h: add visconti viif meta buffer format
Date: Tue,  9 Jul 2024 09:08:44 +0900
X-TSB-HOP2: ON
Message-Id: <20240709000848.1108788-3-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the Toshiba Visconti VIIF specific metadata format

- V4L2_META_FMT_VISCONTI_VIIF_PARAMS for ISP parameters
- V4L2_META_FMT_VISCONTI_VIIF_STATS for ISP statistics

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v10:
- add entry for V4L2_META_FMT_VISCONTI_VIIF_PARAMS
- add entry for V4L2_META_FMT_VISCONTI_VIIF_STATS

Changelog v11:
- no change

 include/uapi/linux/videodev2.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4e91362da6..562038f144 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -858,6 +858,10 @@ struct v4l2_pix_format {
 /* Vendor specific - used for RaspberryPi PiSP */
 #define V4L2_META_FMT_RPI_BE_CFG	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
 
+/* Vendor specific - used for Visconti VIIF sub-system */
+#define V4L2_META_FMT_VISCONTI_VIIF_PARAMS	v4l2_fourcc('V', 'I', 'F', 'P') /* ISP Params */
+#define V4L2_META_FMT_VISCONTI_VIIF_STATS	v4l2_fourcc('V', 'I', 'F', 'S') /* ISP Stats */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
-- 
2.25.1



