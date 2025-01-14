Return-Path: <linux-media+bounces-24709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C0DA0FDD6
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 02:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D04563A65FD
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 01:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77D03DBB6;
	Tue, 14 Jan 2025 01:13:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF2BB673;
	Tue, 14 Jan 2025 01:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736817192; cv=none; b=B9iT4jDl/4ovzstpjlruBwHg8wDOCZT48XHII7sg43R8PfUdpKmkWHTl1FDqFBYYRPJ8ktKVcKmcFVPEEH/Wgy8e1NuKBWt2PQHvLRjF2vnB6lhEUFzWFcttuk9ikC2NBBBg49Fqr1vv/WceSpJQ9gNh6Nfn1THwhqUK20s4k78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736817192; c=relaxed/simple;
	bh=HbHrVvZBnbr/i3q3nkvn2hSYq8SO0I+oKyoYDbLKgfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FHI79KYggBm6olmrIcUNruBl9jU2R+vKq3/Fm88cNKVwltTH7YJ/BLnNUbpEe3G04rC1N/ypq5WsLJXsL2vNMfODcl47OpzUxU6Rq2DqRsFZbb4VmKLtCYtw8EiRQl9Tb+oUGdA3VRW2OOHmot49OdBCrY4Uf3fdgKR2hdSCzxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b28359a2d21411efa216b1d71e6e1362-20250114
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:1d7d9fa7-5b65-4399-9124-e068c72c91c5,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:2ec8a3fe387ac3127568863c22facb71,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b28359a2d21411efa216b1d71e6e1362-20250114
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1370343438; Tue, 14 Jan 2025 09:13:00 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 88AFBE006100;
	Tue, 14 Jan 2025 09:13:00 +0800 (CST)
X-ns-mid: postfix-6785BA1C-2765994239
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id D6EC1E006100;
	Tue, 14 Jan 2025 09:12:59 +0800 (CST)
From: Zhang Heng <zhangheng@kylinos.cn>
To: mkrufky@linuxtv.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] media: usb: use kmalloc_array() to replace kmalloc()
Date: Tue, 14 Jan 2025 09:12:55 +0800
Message-ID: <20250114011255.871225-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use kmalloc_array() to replace kmalloc() with multiplication.
kmalloc_array() has multiply overflow check, which will be safer.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 drivers/media/usb/dvb-usb/cxusb-analog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb=
/dvb-usb/cxusb-analog.c
index 8253046cd6e6..3bbee1fcbc8d 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -817,8 +817,8 @@ static int cxusb_medion_v_start_streaming(struct vb2_=
queue *q,
 		 * doing a large continuous allocation when (if)
 		 * s-g isochronous USB transfers are supported
 		 */
-		streambuf =3D kmalloc(npackets * CXUSB_VIDEO_PKT_SIZE,
-				    GFP_KERNEL);
+		streambuf =3D kmalloc_array(npackets, CXUSB_VIDEO_PKT_SIZE,
+					  GFP_KERNEL);
 		if (!streambuf) {
 			if (i < 2) {
 				ret =3D -ENOMEM;
--=20
2.45.2


