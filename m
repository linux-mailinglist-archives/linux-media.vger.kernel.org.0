Return-Path: <linux-media+bounces-327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6E67EAE2F
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 11:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 201F41F24386
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 10:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3ED9168D1;
	Tue, 14 Nov 2023 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="cRvvQagl"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38187C8C8
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 10:39:49 +0000 (UTC)
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.169])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540621A5
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 02:39:47 -0800 (PST)
X-KPN-MessageId: 160c2ff7-82da-11ee-a148-005056abad63
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 160c2ff7-82da-11ee-a148-005056abad63;
	Tue, 14 Nov 2023 11:39:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:subject:from:to:mime-version:date:message-id;
	bh=epPDGAYcMToAukmVt/FFgZV4Pqrp79/hkVQWDpfm/Fo=;
	b=cRvvQagl7jaH//Sfw3zGXf4Km6h+Ww/SEDcPE2100NfTVF9zpgJWTW7AKyMkGrJPpY3oD78m2yOye
	 YUrOVsK9hMV4LaSbXBw3YLG4V4oBd5VnuYQhSErwxeImAvhxF5Yav3UeQCaKrKiLrM4gFVQkN4OzOV
	 Pca73VIbkhlyxj35+Que28Rsla7jB3nVABhs33QxRPswUNuTNEQSQB6od3fFV5A2tFsFyl+yGq9kct
	 TKV3Mh2UNzsauNaBC4om82++IVFN5m8NMtjDDXT5IohdeMcRIxRqQ7Kaw2MmJkqTmBhLasdiwoD38V
	 jFJpnBXXf7fCwWISq1P9VCQhfStJ7Ow==
X-KPN-MID: 33|GXl6E+NtdkPBfIcVFrAytGR/gq+X7G+faegPsKO9rFoOTHwdwe/gDCStZwaeMhV
 R1Z7TA3TeL8P3EBQKSAYx6dQ3ONGkEOZ8cP5gVurT4kI=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|nNTfNiS3yZYzlVNrlQsWefNLuQUpv7gb5B3mSnh3oZafmZ70uULBkF6bzIucVCy
 ggjrvaxZCcFUbvbn6plXyIA==
X-Originating-IP: 173.38.220.48
Received: from [10.47.75.249] (unknown [173.38.220.48])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 1fd27983-82da-11ee-9f03-005056ab7584;
	Tue, 14 Nov 2023 11:39:44 +0100 (CET)
Message-ID: <057513c9-57b2-43fb-9a72-9ba64281b668@xs4all.nl>
Date: Tue, 14 Nov 2023 11:39:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: videodev2.h: add missing __user to p_h264_pps
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The p_h264_pps pointer in struct v4l2_ext_control was missing the
__user annotation. Add this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c3d4e490ce7c..6a285af11759 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1816,7 +1816,7 @@ struct v4l2_ext_control {
 		__s64 __user *p_s64;
 		struct v4l2_area __user *p_area;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
-		struct v4l2_ctrl_h264_pps *p_h264_pps;
+		struct v4l2_ctrl_h264_pps __user *p_h264_pps;
 		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
 		struct v4l2_ctrl_h264_pred_weights __user *p_h264_pred_weights;
 		struct v4l2_ctrl_h264_slice_params __user *p_h264_slice_params;

