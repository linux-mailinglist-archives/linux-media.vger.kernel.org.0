Return-Path: <linux-media+bounces-51524-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB9aMk8nd2kUcwEAu9opvQ
	(envelope-from <linux-media+bounces-51524-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:35:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D74F8583B
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B656A3014535
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 08:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119B521D3F2;
	Mon, 26 Jan 2026 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7rOk2+W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A634F2D060B
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416501; cv=none; b=BOSOk0aUErLe1ssCsHnXfmbDRjhA4BPOlPM2tk/n6XdcWxWaMK2NX6/rM/MKsR0/fsueTAgfj4l9dOxTyqK57QOtj2u9XySA5uOrmnjqAFDCvw6sRHK29kXYlXLX4a7e/ob4NPuNdOqRWqqu9eGFhgPz5ZH/6rx491fU0jAuv3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416501; c=relaxed/simple;
	bh=WetwTv/gE9hDzyiDgeSR/dlD0Nq3TSfAShxuiBzoubA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQxEw9iEBIbWtFjWe7EuhLTpS/ulZn/ABp7RvIyE82XI37QceqGnHthEfmYf8PJd9KR32FPRrXoQh7y2FNZOpZYP4oJ2cY2nUSaNiO9Dn0eCDdZR+b2CWE4oy+gV+1kXeANgo6qU6JUYCq0iCQr7+g8TryI1CRVgPCnqDRqqSiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7rOk2+W; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so30451615e9.1
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 00:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769416497; x=1770021297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUhIFLt7fdh82+bznl5jQLR0CqJfuMYxPz0sWyNQXoQ=;
        b=S7rOk2+WBbYJ8ysojxZvKdi1puqhwDP5ElJIq/6eJP4V5UXfdyOhMh8jq6iBmB8ahy
         UkM6afVWe0cmsZhpPeg9dUuwhs/uOA4QW2pgKOQTjaMP2T81C0UDngJdFoXBcWxq6yxS
         TU18ZI4mN2iBYqWnSjun9ciJE6TcwC3goV1gt7XbeUxIGYmOsfFIHYPoUSZaqaVhCKEi
         LP2C6qIQ8QKfqrhZ7rUIMiWO7U7R1SS2wxz70incTRRE6UEFzNzVdJS/jm8Lg6csz3bF
         N3jvdNsvlpf9aht6jOPAgH8Q0qksP3Ntyp0KX166luwMc4xHCvOsqz2e+TF5svdU/3Ek
         Z3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769416497; x=1770021297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iUhIFLt7fdh82+bznl5jQLR0CqJfuMYxPz0sWyNQXoQ=;
        b=PKl91ECmKDMmkE9O8ncrpsVyk2q1AE08X8s3KBb/9PRuj8a36Bjq8o6r1agsm4Kpin
         SUcumOa4OmqNFXGLN3J/rXlyUUFVUEsr8x4zmvm4SHN8TVRbNPQxpWd2txjDUdPBiU+j
         cQUK6CU9W28tmvq8MMNR/k0XeLAKNPmPHt6LRFFlmi7ejkVGwNnRy6Q0Yt+SC3v51rmk
         H64eSU9N0nlua1SQO2w7OHbYFaHbfV5J4XhP06Wh2NyDwxQfP+6TsJo+56lc6x6so4gY
         XgN+QD4n50laVmQsTeWFmrErscUelxNem1FPMgb/hp+cVhAhvFjJV6HKRnu1cMqc4qqb
         qTIA==
X-Gm-Message-State: AOJu0Yw+t1wMIh6F4Dqu/+zTN7EC+dZFlBIPmJuFEM7zbznHOyEd+KQo
	qUNP+QiT/uCqhgL7KsGG2Wz4Wupn0rNyyep6Zprgxfv+Votc4cV8egkV
X-Gm-Gg: AZuq6aLBMhRozovAE7Vwjc7ZdMM2PTJsJKLgVsj3IXJNqgBOMRglnYyQHw5Q8BP4upF
	6dvuGNrVDCU5iOlDp1oXzM0q7kTfDeI68iwmg70KB//LFaWpirEXvgMfFBthbCNObR/RM/F8m1s
	XYiZB3DNx/znNKUuxiCWo9BIy5KVhk5JdHJ6au4k2xF7JWNQzfDT/sNEPpDHPol2Hi4Ed2PoGBM
	iFY1gFVd3crkGQSbFDEG7FVCv8IwmNqvfQOvLmJo7np6luXbniMeRwF6zqHhLps/xHIOKqYdWUK
	JLNW7nBltPEX7IiYIK5VXrr4aeGuz9Gz5vbV66r+ZtWHk6KHWo3oJ5eGui9i6cV2iR3ug38DyHi
	9+sWx9ObLXyOCtURCzpGkshXHZhL4ix2pUG7djhcWQ/SzSTET5nDBERkhdcXISGICDnKo6bhOKw
	0l
X-Received: by 2002:a05:600c:b8a:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-4805cf67f4amr61653695e9.25.1769416497395;
        Mon, 26 Jan 2026 00:34:57 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d3b4625sm102096275e9.0.2026.01.26.00.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 00:34:57 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: media: mt9m114: document MI1040 sensor
Date: Mon, 26 Jan 2026 10:34:29 +0200
Message-ID: <20260126083430.8247-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126083430.8247-1-clamor95@gmail.com>
References: <20260126083430.8247-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,linux.intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51524-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D74F8583B
X-Rspamd-Action: no action

The Aptina MI1040 is a slightly different version of the MT9M114 camera
module. It is used in several devices, such as the ASUS Nexus 7 (2012) and
the ASUS Transformer Prime TF201. The compatible "onnn,mt9m114" is placed
first in the enum, as it is considered the default compatible value.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
index a89f740214f7..7c0a50759f4d 100644
--- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -17,7 +17,9 @@ description: |-
 
 properties:
   compatible:
-    const: onnn,mt9m114
+    enum:
+      - onnn,mt9m114
+      - aptina,mi1040
 
   reg:
     description: I2C device address
-- 
2.51.0


