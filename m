Return-Path: <linux-media+bounces-56530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKbJLURNvWlr8gIAu9opvQ
	(envelope-from <linux-media+bounces-56530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:36:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E322DB0C4
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31C12300DCEA
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F113A2989B5;
	Fri, 20 Mar 2026 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I+3kGhFw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1578B28725A
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013755; cv=none; b=fO6f5Gz9qog2mYf4iaDOIHXvwDboZ48TTpnccBZqFDlILjbFSYcTjFrEpt/gM8F1CDm7y2jjT8P8SSOzAhPv0ZpKWBwhWtfkshP62k30zNGvvkWaao9RTNDHxMahBe9V8mH1IPJS6nYpw4mvFTCT9AnGme5Jrx8EXcnc1dTjvUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013755; c=relaxed/simple;
	bh=p/nfFc6jaqPmOl8LVm2o/szIl6PdJBQE6bZQXHDDaZ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iMhuzTpJ3P33dSMXUyfCj9pKYtlDdQa/GZ9BtcOvJOpHcFGXB26b55mZYg1XlIaSYGs7zcNzwhkiKBOjmcSinAX1TEMwLRo2sU3yoaUMQFljS1wW2lC066GpS/FVogHyRInPb5jCK1c4QTR0L5AP2GLOeo0q6lOkTKaZsHb1DYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I+3kGhFw; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso1931169e87.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 06:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774013749; x=1774618549; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcF1YPc4Y6f7tDQasAIKkm8P8aE5YGWgMsq6kp+KiU8=;
        b=I+3kGhFwr5dGJjOsWyWznNt+XCIaN+CHY0fEXcrah4GyadhX+d3czeKBj20/rYtLod
         ulwr2flvTGxX24sYUOPp5Q7E2o9YcNHK+oU6Rnp8vGAnER2QLmV2R6S6qwXUs8dvYDJN
         CYickovB5w71oWepZm1HYfBW16jPYanXI/bT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774013749; x=1774618549;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcF1YPc4Y6f7tDQasAIKkm8P8aE5YGWgMsq6kp+KiU8=;
        b=dBJqu5pBVvUl3OSEl+HOfrNbDzyWKkmYeooAKZGd3DE3ZaJf3Dki8NBwCno52ofa7X
         PFs1eHt0L1Us0KCDmHufUjRcQIIAA28TxsUez8LNCbgKMNNTBR9MMD/fvqB7dOwFvVj+
         Rs+4ZQf5sXccg88/9f1SvxWBWti6x7fKwq0p8Sm1mgfXQlsJ0tDpjudHN06+CJCmC0oL
         KLFk/gkh5vIn+s5RNbQQv6KqcK9ANMV5rsitya/PylqrjR+me4RJknEPjwgCI/O4l4MY
         58TtWkm1EPRWemZY/3Qyr2nGhvgw4JuTDTf4/19iIV7ZcNjZULdNpk6iq5IWJey2Lv8s
         /H5w==
X-Gm-Message-State: AOJu0YzDmxEPyBr987IbjANWHnSQX5+D0mQ/0f6w4qdq9e53auuu/zT8
	xLyz3qgydB4zM75i3fqHniUGPzAiqrMgsZU3pS+JlL1MpBDrucqhGEalQ6VXWA051GCaZSdXvUJ
	ZokdMO/Dz
X-Gm-Gg: ATEYQzxSoeG36N5TOM763tXmD1smPMgrlks9ZdzZrbVbVpfLkHoLDPMg0Jrvcgw0Lve
	+D08yTo+5Gkd5jBT9DonHs9l/HbFmlcIfB7PyPjvCaYneYa3iqGhH4FoUx7Tbi9mq+ct2DdFOEY
	YlB2sWsCWo+tP6Fzg3nw09f8xv/xv6lHBIOCNe3TGZHkYvOLR7TGOOBxfkJOU29zvsfDUjc2Tfp
	OZVx1FhVWSBc8H68rZQfKE+ANPx0fLX6pdbl2ESd7mgU03uU00S3S45Ln5RG5XCMesu9fPYEB+U
	rplXLzjfkBOcxUd3LjvM7LT2hAhVnjzzly6aWtoUQdhTB6feY2zRIDkG3ifeSNUUoCtdY5LTdYO
	mChoN3qBnHPo55LwPniLUO82ThlS3kADuiB6VbuhBi4zLiBX35jnLYX5Yx2QczfjF5uzOMz1pzw
	8MPVcpkM3OAZmxTwH/BFELESoXCZXj6+zPGHQPsQQgRg954ZPJZgfu1oL4S3rMaYt8LQtcVPY3z
	57t7P0=
X-Received: by 2002:a05:6512:10c6:b0:5a1:3f6b:f61f with SMTP id 2adb3069b0e04-5a285b4df0bmr1277183e87.28.1774013749524;
        Fri, 20 Mar 2026 06:35:49 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cb91sm553112e87.77.2026.03.20.06.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 06:35:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/2] media: uvcvideo: Fixes for frame sequence number
Date: Fri, 20 Mar 2026 13:35:44 +0000
Message-Id: <20260320-uvc-fid-v4-0-f24f168ca2f9@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBNvWkC/23OSw6DIBSF4a0YxqUBLo/QUffRdKA8lIHaQCVtj
 HsvOtG0HZ4bvj/MKLkYXEKXakbR5ZDCOJTBTxUyXT20DgdbNmKESQKU4Ckb7IPFjjohOFeN9BS
 V14/ofHhtpdu97C6k5xjfWzjT9frbyBRTLBwoa8AowvjVdHHsw9Sfx9iiNZPZkcJOWaHgVa21t
 Jpw9YfCkcqdAibYKA1Q/i91I77osiwfR+SzmxcBAAA=
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56530-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Queue-Id: 34E322DB0C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes a couple of corner cases where the frame sequence
number is not properly handled.

Please note that the second patch has not been tested in a camera
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
      media: uvcvideo: Fix buffer sequence in frame gaps
      media: uvcvideo: Fix sequence number when no EOF

 drivers/media/usb/uvc/uvc_video.c | 66 +++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 27 deletions(-)
---
base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
change-id: 20260310-uvc-fid-e1e55447b6f1

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


