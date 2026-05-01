Return-Path: <linux-media+bounces-60127-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOdUCG+P9Gn/CAIAu9opvQ
	(envelope-from <linux-media+bounces-60127-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 13:33:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C3E4AC0B9
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 13:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ECAD03009CFC
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 11:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390AF37D12F;
	Fri,  1 May 2026 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VYe5xrNt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E59236C0AC
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 11:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635178; cv=none; b=EFXTKU5Z6qzwWxilVA/m4bP56X2mrgT+H8IP7lisidUUQd6JACssMVyoY7nOD+bCrkr70zax+BMO6Gtfn16BZ6hk1c0G91GZH5Xaj/NOxmv0gVyQ31y+srIuMCSr2ORYt/nIpzS9omuR+iPjqAK8wDXPe5pXz8ugnKoLksIb3Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635178; c=relaxed/simple;
	bh=ne42xYajKx8Kiea21amC61A8URblNNdzVSYQ5+DXQtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlcoKh5DNRmPlckk9cmE5V0AQR+wAks8bzfbFtztXYC12K+MhbAzHJr1fT6Dn3E+hQjZT15JhVLCtKlWVRbx9IjzkZbnl6mLMp+6pLA8N+hpDPbrgVbHIXfZI4q/Ta8LRVosyseIfk57tkGFAcUzNOJiUTesIdvpFv7wJfp4Iy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VYe5xrNt; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38ce8a5bc20so19339231fa.1
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635175; x=1778239975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgEZKNrl10DgxlH1xZQyC/yRD4psOac+PKsvu6TEYIs=;
        b=VYe5xrNt0XI9e//7P7x38cTiRrLOff/WLkVjcDQ0fxejZYn+SmFypCQl7Ef6PDEXEf
         nkO6+dQlvPnsXQ+5KFi6vIA6rA4Gf9CObBSx3hN9Rk3U4NrIZ39LEHbZCSGLX7KnmDG4
         SU2gsHnTXOWJiFJ7y/cQbHAvzTED07Ynnor68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635175; x=1778239975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgEZKNrl10DgxlH1xZQyC/yRD4psOac+PKsvu6TEYIs=;
        b=VOY4Tinmacu2UH1n0a+h7vGxnV4Dul5Z7pzeDezGIChjPeNfdmGLzfVXqFXv78bQbi
         a0DHBNj0oDoyMMJvQ+OSoq7m/2rKtGA/mruS07+f2w/+arFT1qSPsRCRRut63sIC+pLb
         TR0qhu9msdCJHAmx3xMqYzVgZmRn4tEFHychm9PTM8Vdfk9icqDw1YlEa0boArngwGk9
         mnbgjbwmUettAKhUV5QVpLTZ1J01t5Lfu1crdwsX0cnlGx0nPeLY5/qopiD71zExdDxy
         bx2bg1jcknZhm6JBJiF+0/ogqkhgECx1sKZLAiSPOE07Nlk7cRkx6SAepMXpv5zNmp3p
         P0ig==
X-Gm-Message-State: AOJu0YxsEs0LESCM+Hw/T0OXZ5bT1OunrP/NAFFUQI/lxpwD0aTSg+/B
	im25JI9I6Jq6KjvIHw5l4BzgV1DnyCrVeNsTuXZwSkPcGQi2RN9xwuSQg8m+pM/UrA==
X-Gm-Gg: AeBDievBB1k7+WhD1Z2oMUqkX2ICOMO8Hd0xiS752MBdSSUp9K+8nAQU+X2HAdwlIP6
	vC+hEG5Gl3x0PC/wXiKHtO59F0gJgsbzbQlz0WQZChpGf1Qe8b20C8KsqvoqCYJAfBT5Ta42PKA
	uaMCBoPotRcTXWM2lrifaj29Ijqy4MR6bWynY1yqa3JpGkT+E0Od2WBneLcZh85ipt3aMnKgI0Q
	wWl8Mbf6JB5NG6LGN5oiJM8yZXM62/a9Rk9GGulQv6TOXXf8BdYIFxbZh+S/4Z8Rmfw/4hlZCb/
	s5lZhE5uo/7o232A1sCbPyalEtyLGi9PvKpvgd22u1z8Dfo4sFVasJ1JvDCdQpzfG2DRHtrBRt3
	A1jHZjmCtVYPaw8KKNTiYvA4qppUdqi2NAsXWhersjozfW780jYQPoi/wzL6QJ+LcmwH/6d6gTN
	22J0LUX/Qxw13ZFVvsPTKCF1JTWnEmrMV7ZjmNhuyYhO3nL17kP5mE1UdB+uCFSj3Y0mDwKG3fE
	xQd2qhrge6r6mXRNsO5Vjip58QD
X-Received: by 2002:a05:6512:138e:b0:5a4:12db:d0f2 with SMTP id 2adb3069b0e04-5a8522d5ac0mr2843571e87.24.1777635175346;
        Fri, 01 May 2026 04:32:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:32:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 01 May 2026 11:32:46 +0000
Subject: [PATCH v2 1/6] media: v4l2-dev: Add range check for vdev->minor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-smatch-7-1-v2-1-a2fcfb2531ac@chromium.org>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
In-Reply-To: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 07C3E4AC0B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60127-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid]

If the fixed minor ranges are not properly set we could end up in a
situation where the calculated minor is invalid. Add a check for this in
the code to make it more robust.

This check also fixes the following false positive smatch warning:

drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..5516b2bbb08f 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1032,6 +1032,11 @@ int __video_register_device(struct video_device *vdev,
 	vdev->minor = i + minor_offset;
 	vdev->num = nr;
 
+	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
+		mutex_unlock(&videodev_lock);
+		return -EINVAL;
+	}
+
 	/* Should not happen since we thought this minor was free */
 	if (WARN_ON(video_devices[vdev->minor])) {
 		mutex_unlock(&videodev_lock);

-- 
2.54.0.545.g6539524ca2-goog


