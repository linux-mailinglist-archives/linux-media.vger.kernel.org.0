Return-Path: <linux-media+bounces-56722-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC6EMA88wWkZRwQAu9opvQ
	(envelope-from <linux-media+bounces-56722-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:11:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6362F292E
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 848CC30117EF
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75A73A6B88;
	Mon, 23 Mar 2026 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OLO94n08"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B143AA516
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271442; cv=none; b=DUk6/De78bfIK6gUW52r0RC7nnr9Ej3qpOWRZ+LcA1pZtYBTzVBa7GoyaQGdPK2i/dEk+7s1PZ8EQlCmDQ9gRojUX5RTxw+sUa2ymwfCDKVXi+l4OMt6I7cWdZG8cLwulo8mNRAZBDOH+MuJscc8//bXT8kVD/XbLQs7hLVRlck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271442; c=relaxed/simple;
	bh=vY4TcenAOFgGP74tpglPTaL2A4UIW1qGNpu9kH26VSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pNWPpz8yGS2gMhijbFPv1ESh8oyhzhgq15zq/A2dp0nWTJ8j6jPP/tnqyzeBb5yHIGnlYdFhb1ccqAk+LNifP4rJKBO5JvpJkYPD55fBDhqjm/tqzWgaLh2oiMkg6KEwHETtNKGEU/Uu+Qcg5bXJN3i50mBl22IDQwgGEHUi0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OLO94n08; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so3194744e87.0
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774271439; x=1774876239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzNp/JcL77myXdZwPsBD1eDno+MS1KWcO+UVbGYOu0k=;
        b=OLO94n08y70qU8jA9GyFN2o5tEp3oLLfqEKv/9xdr6ByaqSdZcgCw5YI+0Zb1IUYnX
         PmGY4V7uEZTqGtLV0kPZLDC/u9OLH7AW7UJSJ/Ve0wkqwKJDl09tVvGUualpnPFvl2MD
         ZfXXrao+0LoiAd+2eUlQv1AOYlm6HobwOQMYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271439; x=1774876239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WzNp/JcL77myXdZwPsBD1eDno+MS1KWcO+UVbGYOu0k=;
        b=Nqk4/A9QnBseEoF9Lvy99aJ1vgBXnlROhV3FnEErfaVleFHsVVB+BhKECB9rYtGqdw
         6a0+ZSBWfTG+PX4dot9Wm0ahPgyQU0bNXGQ6+SuapjfNqml0nICm45SlV7jlmVc+5uHq
         4HigMtM+eXDBZL22BAxBXls+DZXKitQdUBuec4JWtVeKPoeo6XpYsUd83OgX9ZrcRVMu
         l6q8ZaB2PCelZEAiXfVALi2E3SKflqfVq4NELm3nYUpt78fNpj5o45EnwPiMIQWX89q2
         SAQWw4XtDjTJbVPJM9VDm/q+SGrdpmGWYNYE38881ByllFdjAPOcBNebJz11XIe1czsn
         3NIg==
X-Forwarded-Encrypted: i=1; AJvYcCV8+TFhg69P4By5PYC8mbzlIjpXQGZ4CvzEZTsteRSOqg0lxEoW+RmSMqVho/zZi30/zBafYJ4JjetmZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvigv2s/yKRyGcdmvJFAcy/3RCbA7kBUiIH2pc+PTBb99uqyzQ
	PmxDGBwDm5r876wABeCJT8hJqV0kYcAjS3v+EJIxCd57140SnKG8O66K/59vNLDeMw==
X-Gm-Gg: ATEYQzxyyet1xzGkhNVkKCjSiT3e/ui7RPeeRQz2K9L3zNVSoIG6ykfKKGj7qNoj+tA
	lJNEgBLztZOAM7i5ZT2xaZio3YVfcR78npAL+Lm+BZMFWojw5+6vcOuYK+6nnnuHD+PlinOfI7D
	OGZ4HfdCyVONrfdRJd9LXn9H74PxlsrmBehMX2plXmzEOdJh+ui0SxfVqGdnQSlkDhhL8M94f95
	jtD8xXjX6E6U9fyAN0ozrw29LiBCPY3DT++LCNgMTpjfGCsEDAm6NM2JuIoxztxHDec72bbyhWG
	5m8BuPFCPSNXIbv/jstHpqKHckiwhq0c/IBCenAPOmLIxhUTnfHKnKf8Z3lgNw+1lKjT8DmdtOL
	E82wMs91jZe1ewlYEXeejj/l6rMwjs/f6K88Y4HG7XPXOebF2iU8F52YdI0PtltEcPa8qshTKUH
	JpfMLnQFjPucLgTFqwq5miwaK57Hv0b/uxBOXYQYhcf7lPogJU+YXpkzs5NMP8H5ZJ0+VC1e3Xf
	jqX2t0=
X-Received: by 2002:a05:6512:158a:b0:5a2:7eb8:2f90 with SMTP id 2adb3069b0e04-5a285b5d65fmr3764860e87.39.1774271439020;
        Mon, 23 Mar 2026 06:10:39 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305e07sm2515904e87.66.2026.03.23.06.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:10:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Mar 2026 13:10:29 +0000
Subject: [PATCH 2/4] media: uvcvideo: Use hw timestaming if the clock
 buffer is full
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-uvc-hwtimestamp-v1-2-aa42e3865204@chromium.org>
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
In-Reply-To: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56722-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D6362F292E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In some situations, even with a full clock buffer, it does not contain
250msec of data. This results in the driver jumping back from software
to hardware timestapsing creating a nasty artifact in the video.

If the clock buffer is full, use it to calculate the timestamp instead
of defaulting to software stamps, the reduced accuracy is less visible
than jumping from one timestamping mechanism to the other.

Fixes: 6243c83be6ee8 ("media: uvcvideo: Allow hw clock updates with buffers not full")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 6786ca38fe5e..c7ebedb3450f 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -842,7 +842,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
 	 * dev_sof runs at 1KHz, and we have a fixed point precision of
 	 * 16 bits.
 	 */
-	if ((y2 - y1) < ((1000 / 4) << 16))
+	if (clock->size != clock->count && (y2 - y1) < ((1000 / 4) << 16))
 		goto done;
 
 	y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2

-- 
2.53.0.959.g497ff81fa9-goog


