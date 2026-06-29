Return-Path: <linux-media+bounces-65921-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7+H+OGBYQmqZ5AkAu9opvQ
	(envelope-from <linux-media+bounces-65921-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:34:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8967C6D97DF
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:34:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b="X+DX/Cd3";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65921-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65921-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23FB33048130
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37EB4014B1;
	Mon, 29 Jun 2026 11:30:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BC53FF1D5
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:30:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732657; cv=none; b=ilJOltUjH5qHTfC3Z364RIalTGwh60uh/lMRt4Zaawhstdj56GZDIACw+2PFGn6imFdre3rOvFW64fRQR0ig5dabtR+IQqe/p9okbZ26xq5nZMlHQMi4w3P7FJ9jGKLJ7+DaXkQfaqpwNpBGTGmte3r3yxLPRSTksX5s+5WanCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732657; c=relaxed/simple;
	bh=Sle5ow+4bP0fhUgqXuG9sN7s0Wj2a4MVyVS2vDV2kJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FRNBjRiMw2a9Tpx7Rchpi7gzEdi7+bj9i4wVBxU6YCmgR/jEcuEmog76QzyHJsp8UAIq8QndrcbGmZLTTy76CVO7jNUqv9MPkbCpYumVQziYT02JUQCa5mwkStRDOZhsz2uMBAh6xc2UMvx/5BUA4aYbpd4NPROjJabYFndfMVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X+DX/Cd3; arc=none smtp.client-ip=209.85.167.47
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aea9d606f0so2342808e87.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 04:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732654; x=1783337454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14OP//5hcfgr0Q2f08MlIGbZ3gTw8vfmRUmF+42IuXo=;
        b=X+DX/Cd3JH6ph9wvgAzoq+JIu3xkxBmeZ6Zcv18ULzqOb7wVYXSEA4XtMA+lUibqoi
         byrIdWwTr5HQRUtNRwUI0fftjbkCA4Met2uFqynjQsxlxgNC5xosce58UZhrCc2LSVAg
         7sZmGOMpqthZ1FpQ4/HijnaseHaNxDGgyuigk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732654; x=1783337454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=14OP//5hcfgr0Q2f08MlIGbZ3gTw8vfmRUmF+42IuXo=;
        b=p5tnXpvFA4gAgmWPB6WljPT/YKW5Vm8uXNbfXplC6YY0FLHXF2GVZ6VYyeI7gn/x0+
         HcVZ41W0mBwuoi1MHdcPXwZVfaMDlgO1Mxy1YFS8+4lt0yfLItoQRwUjdy6G+tUi03Tl
         WErfmxoTlWC4jxHfneDCnan02H3R7ssN1iOaLKJ4eFEsew7WxfGMO+4FbeiLUjVjaADP
         tcsY2PiKChOF47hDdKcOt9m6o7HT2fHCktNwS5qo48BBEx+L0tGMI4dZbjYB5pKLvK0A
         iimjLuO4X0hKvdATfqG7IutAU97kr6R5b7p2VSqF7J8otiVADd8/ti6GGrP+UoIzPeso
         L3/Q==
X-Gm-Message-State: AOJu0YyTTt9/QVW79Ns1o7SoMg5imaLXURgx1eANsgm5U7DUspuVWoNd
	pCWCUgEfAodin+9Ay9A49qU8xc8s+NWVi+x3tvW2dDzCdgh0gfF6O7j3Lrb9XGIgHg==
X-Gm-Gg: AfdE7cnVH9MWrfwy/6qYlrxfO0/bwBhbM9q5n/XrTNyuuhc3510P69LOTWIhsxmytPh
	YMLd6DA7MI90laOK9H2sY0i8QKU+dVzCnH5CvCSaRIDjvgy7G00cZ/CWrey0TE1DHEo7Hxtn2v4
	n0VugDA64bs5WDN685N6uDy14wtsJUUitTIttj7XIRcYjLpGWG9YbN/vHzPO2pKyIZ2awbWbq/G
	bWgNSvmnBEny/1Vy9gNashkzwL4JVRhazJSvlTCT8GXfathxA5vx+4YbwPfMYR7Q0FKiAjIv/Px
	PaYTCF0d3jU4OmJrtTOAhMrqxj11+/WCtEb0BIYvwbLqneQLi7f40tUhRx7RoPfnVdWyzZ+CSTL
	cU8CrV0EX7/+kA3nVlv0OE0bCWqk3W/mS6PTfs+ZtSslOonUOWzHo/uRyOsyvJTcOADNIxP+vom
	cx3RFnNHjizktJxdyxjhtcfZEnNpg5d4aDd2T+mcsgBd/a6gOeL2eM/UOl4za+hwSYLldQVYMF0
	RWc+pQ=
X-Received: by 2002:a05:6512:4502:b0:5ae:b8b7:6621 with SMTP id 2adb3069b0e04-5aeb8b7691amr773947e87.47.1782732654089;
        Mon, 29 Jun 2026 04:30:54 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:45 +0000
Subject: [PATCH 4/9] media: vimc: Ensure that pixel_rate fits in 32 bits
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-4-5884c80ee3b6@chromium.org>
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
In-Reply-To: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
 Nirujogi Pratap <pratap.nirujogi@amd.com>, 
 Sultan Alsawaf <sultan@kerneltoast.com>, 
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bin Du <Bin.Du@amd.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65921-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:bin.du@amd.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Bin.Du@amd.com,m:ribalda@chromium.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8967C6D97DF

pixel_rate is set to VIMC_PIXEL_RATE_FIXED, which the code expects to
fit in 32 bits. Make that constraint into a WARN_ON, so if we ever break
that constraint a kernel warning will be triggered.

It also fixes the following cocci warning:
./test-drivers/vimc/vimc-sensor.c:107:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vimc/vimc-sensor.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index d125a79fec8c..83dcc9d61ee0 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -103,8 +103,12 @@ static void vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
 	u64 total_pixels = (u64)hts * vts;
 	u64 frame_interval_ns;
 
+	/* Sanity check, pixel rate is fixed and fits in 32 bits. */
+	if (WARN_ON(pixel_rate >= 0x100000000))
+		return;
+
 	frame_interval_ns = total_pixels * NSEC_PER_SEC;
-	do_div(frame_interval_ns, pixel_rate);
+	do_div(frame_interval_ns, (u32)pixel_rate);
 	vsensor->hw.fps_jiffies = nsecs_to_jiffies(frame_interval_ns);
 	if (vsensor->hw.fps_jiffies == 0)
 		vsensor->hw.fps_jiffies = 1;

-- 
2.55.0.rc0.799.gd6f94ed593-goog


