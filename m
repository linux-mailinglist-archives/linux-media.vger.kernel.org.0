Return-Path: <linux-media+bounces-14034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636C69146C1
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FD10286E07
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A55313328E;
	Mon, 24 Jun 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2n0HL91"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7E112E1F6
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719222920; cv=none; b=ORbGF3nUddS8U5Cz5vNdzQVc7i9WrCbnzntlpI3RrlIxm3eUJJEtJDtskdbu7mOZAf6r9K+02ojMVuAr/hoIOc8KPExlVv02n9O4/SVNrUrcJG4qo/5lsRRJIOAaOdtZ4/zn8DqZaxn4cw1K+bFIRdMqwqqw9ffXPD5DwExjmo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719222920; c=relaxed/simple;
	bh=pFFsiyTMsJFwoweK6WIj5SyTkZYwx2mrHFXvTDZ5x3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fgBeXwIO6yJW0USApYiXtN1K4mRZZLwzyKqlFPyN+GU/PZFESr3JOq5cpTGUOS/C5QUJacvV8kW4KBuMD7mxXt2/hRB3oAkts5sIt30ONr53Dw8ABkDnVx/Ay7ypNb1cljLwlExdjkdXhtsOxz1Bd4M6bkPIegDEDQQ1wHayDIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2n0HL91; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4247f36f689so28724655e9.1
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 02:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719222917; x=1719827717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1+ccEk4s+CNZ58f0ojOOCaFbBcXQLr9fD7KFZ9QweU=;
        b=L2n0HL91qSVb24crI1ng0nAMssm5rdhfkQxMI5/+tJxneARslZtuVVqqfp2m70j1w4
         lh/yxMhdPJdD8GEmRV1xF68vBLNGv7tfKh9o1+jvQpv6sK8yDF1m4D9JGfLEMXXdBGmA
         mq9KYoxYq5dCmJDK5GPevnUx1Ny2UOlvWkQV5ZWgIGg9Yz890HwE+IidQykfr4HN8rIV
         2G337kggarHtB9sjKmJ06mZ0JPGaI/kPExxb3RHuC125I2a1/vlFUQXCQw1Ub0Mv3nLp
         bj9CVLJ3UZi55fljbW5RUdbyM0XiW6BB40DMwNGY8fhV1b0cVImYrUY6n4WVPDwXdZvD
         f1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222917; x=1719827717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1+ccEk4s+CNZ58f0ojOOCaFbBcXQLr9fD7KFZ9QweU=;
        b=VRPb17+Y9t3AZnNsCuV6Xzvty0iC3UBxyNaOWfnXWFQazo5NT8UbcdQvhDGvGx3XMC
         8z+Ksv6Dt7DOui45zY9ZJKEXAa+jjaHqre7E+XTltFyM5yXYATdCYEAADDEHybIZKLYV
         4ckVHK79AzbWcBr7p/7DVqDqIem6WpdjU1ON1UxMqBT3Ri9SwhaHXz8Xn4pVWnTYOSED
         J3Uf4mjBh5aaAY0baoH3Fi31u1pQd3QRpub0C6yEkmdJWIQFBeWSorbu5dFzyiHIVULv
         Yos2T46ZtX3wccbNTQ9/+b6DOqD3WP2T73k7nPBn2Won0Clq1qP71wT5aofIOg1W/Ohk
         Vj9Q==
X-Gm-Message-State: AOJu0YzEbwg0tqjwpiHvvoP0hXURKw33Nd6h1Fn3GCqv7YY4BE3n6bA5
	XV0qDjYZCyWALb+FoZQLlD6Uq223oGwMSRv49xShZQb9WTVqmD7omkMfj7U=
X-Google-Smtp-Source: AGHT+IGX96ADMzIxzr/Dw3X01RT3His87CPRoaxzLrXLZgvZHXcJy20hTg2pPzrUI9KpH5Ok1Vo8kA==
X-Received: by 2002:a05:600c:26d4:b0:422:aca:f887 with SMTP id 5b1f17b1804b1-4248b9cf993mr34928885e9.28.1719222916723;
        Mon, 24 Jun 2024 02:55:16 -0700 (PDT)
Received: from localhost.localdomain ([105.163.2.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5ca0sm128258475e9.24.2024.06.24.02.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:55:16 -0700 (PDT)
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
To: linux-media@vger.kernel.org
Cc: anonolitunya@gmail.com,
	jaffe1@gmail.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 02/10] media: Documentation: vivid.rst: drop "Video, VBI and RDS Looping"
Date: Mon, 24 Jun 2024 12:52:54 +0300
Message-Id: <20240624095300.745567-3-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624095300.745567-1-anonolitunya@gmail.com>
References: <20240624095300.745567-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Drop the "Video, VBI and RDS Looping" section, instead moving the
Video/VBI info to section "Video and Sliced VBI looping" and the
RDS info to section "Radio & RDS Looping".

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/admin-guide/media/vivid.rst | 32 ++++++++++++-----------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 04de7b69c817..d7d5a01f4e59 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -1130,26 +1130,19 @@ Metadata Capture Controls
 
         if set, then the generated metadata stream contains Source Clock information.
 
-Video, VBI and RDS Looping
---------------------------
 
-The vivid driver supports looping of video output to video input, VBI output
-to VBI input and RDS output to RDS input. For video/VBI looping this emulates
-as if a cable was hooked up between the output and input connector. So video
-and VBI looping is only supported between S-Video and HDMI inputs and outputs.
-VBI is only valid for S-Video as it makes no sense for HDMI.
+Video and Sliced VBI Looping
+----------------------------
 
-Since radio is wireless this looping always happens if the radio receiver
-frequency is close to the radio transmitter frequency. In that case the radio
-transmitter will 'override' the emulated radio stations.
+The vivid driver supports looping of video output to video input, and VBI
+output to VBI input. For video/VBI looping this emulates as if a cable was
+hooked up between the output and input connector. So video and VBI looping
+is only supported between S-Video and HDMI inputs and outputs.
+VBI is only valid for S-Video as it makes no sense for HDMI.
 
 Looping is currently supported only between devices created by the same
 vivid driver instance.
 
-
-Video and Sliced VBI looping
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
 The way to enable video/VBI looping is currently fairly crude. A 'Loop Video'
 control is available in the "Vivid" control class of the video
 capture and VBI capture devices. When checked the video looping will be enabled.
@@ -1198,7 +1191,16 @@ and WSS (50 Hz formats) VBI data is looped. Teletext VBI data is not looped.
 
 
 Radio & RDS Looping
-~~~~~~~~~~~~~~~~~~~
+-------------------
+
+The vivid driver supports looping of RDS output to RDS input.
+
+Since radio is wireless this looping always happens if the radio receiver
+frequency is close to the radio transmitter frequency. In that case the radio
+transmitter will 'override' the emulated radio stations.
+
+RDS looping is currently supported only between devices created by the same
+vivid driver instance.
 
 As mentioned in the "Radio Receiver" section, the radio receiver emulates
 stations at regular frequency intervals. Depending on the frequency of the
-- 
2.34.1


