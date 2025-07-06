Return-Path: <linux-media+bounces-36900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D2AFA58B
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 15:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28126164CEE
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 13:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061DA2116E9;
	Sun,  6 Jul 2025 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="eAhxoJ5B"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6A022B8D0
	for <linux-media@vger.kernel.org>; Sun,  6 Jul 2025 13:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751808923; cv=none; b=knReQhEKgCUiNvdfqQIX9y/dv7nmCNO3yhD+P+FpkABt7mBpXKRUd8VOl5Zn0hhVyeWolQsXbmSRBJwHeezNAf2Js/SpcI0JVo3q5TjgAJ5Vw6n9EWV/2KcJXWKCRs+jC3VW9gDDpUpouZjZrbxDjPFolQMSQLuiUgEH9HjJo2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751808923; c=relaxed/simple;
	bh=TPtzewwpQRtuvXLOeigd75rwTFDuv5pe8E9k+Q8F+lU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Dn0kvy9WE92pZPaS/TP9I+UEb8UW2oDWMdJ9MJy/ikdsRBKk3AfvegwHlkY3YWudvF79BeDwVYxpbNQg7dMGUiz8dDheTVqccWQ9Vls0R/vitH183X26/rIUpGeE5KdaHuuZwjQgofr4ZUDWFC9y6adjji8IIUUZNHxOvI0Xoak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=eAhxoJ5B; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: e57d4b99-5a6d-11f0-a9bf-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id e57d4b99-5a6d-11f0-a9bf-00505699b430;
	Sun, 06 Jul 2025 15:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:subject:from:to:mime-version:date:message-id;
	bh=WkFCzhVntnxq8zFba+I51NQGDjqigI8mA6D6S1qZ400=;
	b=eAhxoJ5B7ViwZS62Z9HQl1bve9Rs0TjpndUNWQAMdpL7gro5NGbUZWgB9Zu1RRM15wOtKGy3ndzsz
	 FV1mbzEdty5Bp5sGcNyc+Fgn1nhJlZ8X+u5ZlW0Nk+C3+rzAXNLRzPwU2T4eJ2VLd43UzugFVARSmK
	 vsOBfr/ODY8XTR/QSMKo/43U8qLxmb6I+BPOfZBBwHM2WOirPh7mId+eyb9m4h0WiYfhNC2tbcp2Nt
	 QR1fyZMzQui2P7jQNj1OIdPxFrHKHogtO2q6xKEpOkbfY0gay7gpxl48VKsoP1QQ2HwLvvteCIk9EO
	 sYroZHArCfTNz29OAaMGSSE4HD+eTQA==
X-KPN-MID: 33|lNWDDf1TIp7EjZD5Ns97nlsAwyOciJDxRZEtAxCO3CWJd5gnTZ9g1grYkCLmfG4
 zy+M3eS2uuLNOQ19rhPJjKhn/qHWHFRKAMIhYWGFzOio=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|89Z9JSQkeUGtgQvwE7XFAE1zwe4X625r78zXzkFqT2SlbB76gPOyJYzeIPsDMfU
 Ul223ULDiH7xMHhR8wC1NKQ==
Received: from [192.168.2.10] (unknown [178.74.16.2])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id e596f51a-5a6d-11f0-aff3-005056998788;
	Sun, 06 Jul 2025 15:34:10 +0200 (CEST)
Message-ID: <48da93b2-ff28-4b73-a462-4d03b4ae7ae1@xs4all.nl>
Date: Sun, 6 Jul 2025 15:34:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-compliance: fix pix_array control test
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The order of the dimensions was swapped (first height, then
width), and replace roundup by DIV_ROUND_UP.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
This patch is needed to make v4l2-compliance pass again after this kernel change:

https://patchwork.linuxtv.org/project/linux-media/patch/e91096cc-477f-4182-8bad-036f49534996@xs4all.nl/
---
 utils/v4l2-compliance/v4l2-test-input-output.cpp | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-input-output.cpp b/utils/v4l2-compliance/v4l2-test-input-output.cpp
index 50463c4b..93f07845 100644
--- a/utils/v4l2-compliance/v4l2-test-input-output.cpp
+++ b/utils/v4l2-compliance/v4l2-test-input-output.cpp
@@ -451,10 +451,7 @@ static int checkInput(struct node *node, const struct v4l2_input &descr, unsigne
 	return 0;
 }

-static unsigned roundup(unsigned v, unsigned mult)
-{
-	return mult * ((v + mult - 1) / mult);
-}
+#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))

 static int checkVividPixelArray(struct node *node)
 {
@@ -466,8 +463,8 @@ static int checkVividPixelArray(struct node *node)
 	fail_on_test(node->query_ext_ctrl(qextctrl));
 	fail_on_test(node->g_fmt(fmt));
 	fail_on_test(qextctrl.nr_of_dims != 2);
-	fail_on_test(qextctrl.dims[0] != roundup(fmt.g_width(), PIXEL_ARRAY_DIV));
-	fail_on_test(qextctrl.dims[1] != roundup(fmt.g_height(), PIXEL_ARRAY_DIV));
+	fail_on_test(qextctrl.dims[0] != DIV_ROUND_UP(fmt.g_height(), PIXEL_ARRAY_DIV));
+	fail_on_test(qextctrl.dims[1] != DIV_ROUND_UP(fmt.g_width(), PIXEL_ARRAY_DIV));
 	fail_on_test(qextctrl.minimum == qextctrl.default_value);

 	struct v4l2_ext_control ctrl = {
-- 
2.47.2


