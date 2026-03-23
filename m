Return-Path: <linux-media+bounces-56679-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEemFscNwWngQAQAu9opvQ
	(envelope-from <linux-media+bounces-56679-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:54:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DCA2EF6A4
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 030893013B43
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98E036DA10;
	Mon, 23 Mar 2026 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dn3jYl7y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99F32F6918
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259637; cv=none; b=rhyXJ78TYOXJMbaDQQtgL485Oc8pYUyc37dN5XMFcqMK9IPrU8DnfzDqf29XSkPj5Vnvgp8iUQPoH6PsFrF3tIT2BRRv2cE8rC0a3OMCJTu85b872Rxd2Xi/SDoRLv2ZQnt5wsrItyv9HKG4kY/bWmm/t/YcZidIXjDGOl+7pvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259637; c=relaxed/simple;
	bh=7nX3sTt/HHk78LCRHGp/T8MQmjxV+5Jspx16d02xISI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dFYEIKfYjlCvJojvrrBm8YuBks36hkQiHSl2QLdkSQlAD5bG9YyY7xa8idBtzp9iCsyAJv6ZRqR0+kpnngVYk5KWqSQ/qLaNt51oqubF3zP7Fp/xv3Um3u26QCRt1G8WvejB7vNO3oinUQAzVi7PZkim1typFPCwW8rLN3nE/Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dn3jYl7y; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59dcdf60427so4331114e87.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 02:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774259634; x=1774864434; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1wesxPwsa5G6ez/hsJiH6ntPa2AociaxpZkmVcnrrmU=;
        b=dn3jYl7y2Y7TV0qXrdPmpa5Q+Y/h85kHvwFL34755Kiqe0LtemSQZkwp4wPdRWwz1G
         zS8BImJ+D1q53i9Pw+FnrRcI9FLUOLYVWLsPIs/WdtzRceMVmzfW/hAjtFU0SD55TWAq
         UK2IFOqtzvKjcJ6bD4bw6/qRLmxDkTwSTGTd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259634; x=1774864434;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wesxPwsa5G6ez/hsJiH6ntPa2AociaxpZkmVcnrrmU=;
        b=PDa5l6oE/K9nV2hbrSWgaQbnQqIz8qggiQ9yqWwsWDCMQ1wYcs/9erLOUd0tUuokV/
         gp1pxTzeyiKHgsuOfyuIBWbNmX5IKoVmiLB/8FSTWFCJPEAiMD3BXjarr87IkWU2U9Fl
         ps0wOeAb5TA03WoR/VJqFM6eMk5i2mo40J3RxJTZyCH/hdf9lNQw/lM0T0Iv6W+ghotC
         Y9+xSEmC7gwWR7O1aQMpKYT8S/lnYUfPb6Rw69/P6xVip570md5yTlLagwi/5ld7cBuh
         lK6Ke1noPB0Vpj9mjXtEJItt9NO8IQUEwAQY5ehxlppYjcxcQyhWoktXw2ir7KgtxHJ3
         QEmA==
X-Gm-Message-State: AOJu0Yz1oaZF5u4al8xjgTBoWUnQIaQG7ZAOPM7e/PoJgew909bw52DA
	Bauy2iuGWI5HKF9vSPLWBpD7iBjgSLD5wTQAd/Io77CMqRpVY6GLB2NatIpU8kPU/g2weW5G8eZ
	JoCE=
X-Gm-Gg: ATEYQzzXmuY6c+4ZIV2EbPITLtp9qm9xMtJuwVwRVRikr57BTzsprUypepxiNdt/Kc6
	509Q13pA33rqzb6GEY3CxgkqWMuxaQKMn+i1y5CA6+Kiga+fHQemD6JVhxPtv1InWPpoZKaTQAC
	ERWpMYnL3ijY75MJCeMETzO1SwiOAQcqDXJCiCr2N9XQTO0ICZeaxXXEOH47qYtLMCfEGGxTrKp
	GQ13w7x7O5I5N6vM6bIjR9FQWALHstQ0qi0uZ/QdnDIHrXJ6Bi3tuVD+/ZfUaPZ2NJTo9qMgRKW
	piA8le9flRV+KLiXgNIkXEL75jzalEiOUflp11E0D8CaFQRXm87S6o/rZ0DWNSHIoL5VVlQEqG5
	h2bWIwnyx1wSYR0B3sr4opspTKglyOrz8QPOFontthasTH0o+dIWy7jqPeXIGPuxjC8CmVQegwd
	jY9GHVodEfN/8AzYHuyQj6xt+GYL4Vh49v5afPk8143/Rtzkyy8IPL69vySlx7awsueywFuaTpr
	4dJ98w=
X-Received: by 2002:a05:6512:108d:b0:5a2:8516:a53a with SMTP id 2adb3069b0e04-5a285b9b5b3mr4046943e87.45.1774259633988;
        Mon, 23 Mar 2026 02:53:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192e93sm2430001e87.13.2026.03.23.02.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:53:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 0/2] media: uvcvideo: Fixes for frame sequence number
Date: Mon, 23 Mar 2026 09:53:51 +0000
Message-Id: <20260323-uvc-fid-v5-0-e2858b657aac@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK8NwWkC/23Oyw6CMBAF0F8hXVvTdvqwrvwP4wL6gC4AU6TRE
 P7dwgaiLO9kzs2d0OBicAO6FhOKLoUh9F0O4lQg05Rd7XCwOSNGmCRACR6TwT5Y7KgTgnNVSU9
 R/n5G58N7bbo/cm7C8OrjZy1OdLn+dySKKRYOlDVgFGH8ZprYt2Fsz32s0VKT2J7CRlmm4FWpt
 bSacHVAYU/lRgETbJQGyPulrsQB5TvKdoN5pp5xT+XFlMzrHzrP8xc75a7CUgEAAA==
X-Change-ID: 20260310-uvc-fid-e1e55447b6f1
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yunke Cao <yunkec@google.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@kernel.org
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56679-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Queue-Id: C8DCA2EF6A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes a couple of corner cases where the frame sequence
number is not properly handled.

Please note that the first patch has not been tested in a camera
without EOF. To emulate it I have used this:

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index b66d701f2582d..097bed2f7845f 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1360,6 +1360,8 @@ static void uvc_video_decode_end(struct uvc_streaming *stream,
 {
        /* Mark the buffer as done if the EOF marker is set. */
        if (data[1] & UVC_STREAM_EOF && buf->bytesused != 0) {
+               printk(KERN_ERR "Ignoring EOF\n");
+               return;
                uvc_dbg(stream->dev, FRAME, "Frame complete (EOF found)\n");
                if (data[0] == len)
                        uvc_dbg(stream->dev, FRAME, "EOF in empty payload\n");

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v5 (Thanks Hans):
- Swap order of patches
- Remove duplicated conditions.
- Link to v4: https://lore.kernel.org/r/20260320-uvc-fid-v4-0-f24f168ca2f9@chromium.org

Changes in v4 (Thanks Hans):
- Fix 2/2 logic.
- Link to v3: https://lore.kernel.org/r/20260316-uvc-fid-v3-0-c793354469b5@chromium.org

Changes in v3:
- Fix typo in commit message.
- Add new patch
- Link to v2: https://lore.kernel.org/r/20260313-uvc-fid-v2-1-3f7a996d9047@chromium.org

Changes in v2 (Thanks Laurent):
- Improve commit message.
- Remove original timestamp and sequence assignment. It is not neeed
- Link to v1: https://lore.kernel.org/r/20260310-uvc-fid-v1-1-5e37dc3c7024@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Fix sequence number when no EOF
      media: uvcvideo: Fix buffer sequence in frame gaps

 drivers/media/usb/uvc/uvc_video.c | 110 +++++++++++++++++++++-----------------
 1 file changed, 61 insertions(+), 49 deletions(-)
---
base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
change-id: 20260310-uvc-fid-e1e55447b6f1

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


