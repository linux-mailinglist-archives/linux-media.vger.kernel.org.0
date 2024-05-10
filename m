Return-Path: <linux-media+bounces-11306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E38C21BD
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 12:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA5A51C224C9
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB798165FC7;
	Fri, 10 May 2024 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="db7NsSpJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD7B15FA62;
	Fri, 10 May 2024 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715335863; cv=none; b=gytQz1fbsTAc8wso96mZpSGvjLNrDd08E5AtVcjJxpBHKUf/nfOlz7rm4FgM/iKakE0HFnMZCuyzbcSMYTRhuinmXnZoD63ryReFKV6YhhZopeqxrBBUTSPW8bMT/grudIiqSitTL7kmfpmKWMOjDLSmnxj3YBRR3tO58CXHuZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715335863; c=relaxed/simple;
	bh=ZMLWh8Qj4mJWhLapzw2DXD+cmGmkXcA9W7KIGpEo4lg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VG5u/0iiCRcdG3weNcgbDuc4IUcfWdTydbNPwR4pTOFe/LFYHU67GjyI6GiL4X7fmhqQusJNKfn7bR//YuoHjA68jye8fkIbPR0pUvCe6MumXPQ01vSLXiVOUWNH0+o/kVUNugW51BGOipnPdnIYqT1UwbPJrwh4ssEgs9W/k1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=db7NsSpJ; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-792b8ebc4eeso127652085a.1;
        Fri, 10 May 2024 03:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715335860; x=1715940660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qmNXjtQqInK2DrYq2plkekwqQKtx06eUbKR+MF8j63Q=;
        b=db7NsSpJH2tOG7yChlNBH/LBRRQep9N+MtF+GB/ZvweC1uzuuJtXi2JTYzzuGX6w7y
         S9fTNepUcVNoz2QJ5PYxnnPz0EKUV78Gn/PAn1nS9Lzdpjvd/SUwm7HlWT9BGUTg2enD
         8U8ro92siKdko6pPcYZdtMdizKfVSUjwUfBJp137azl24fDoIWq7hYq3i5X5kTX87imV
         KPey2j9OyM3QZDHuqEOgeMrUvWBaclY+1MEOWTVpEKpfgGxPz9DI72YwuupyV0VgMqrE
         1T3bU50HpknTkRXp1epMYw7Pzs/tfSvKOthk8BS1r5NRVbCT+fg4qMJYfztFSLL3FSkz
         wtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715335860; x=1715940660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmNXjtQqInK2DrYq2plkekwqQKtx06eUbKR+MF8j63Q=;
        b=F4TYCZtEQf7Zma0l1nCap99615ID0q8KhLwu2vQr+fzsd9RLPksl3IQStOUVPyBQQY
         8CiiSTRVwn884K6Iaq8DNE2vPKSBDq2FdnK/nX+bu+VHHf/5u1DC95BQ27T6izEwo4zF
         yGqX644K5A3kw0C2PStaqB3BiDnB4xB9Z1y6Iq7UcTceKQTPa29wP4nR7F7iZ36j1uWY
         T4Sgf5pI/XrX7eEPuu2qnx8BZLIEwtNRIygqh5Ih/F98X9LO1wcFu3cxrzE/USjJZTIG
         cB9m29FMwUuK9IKsi9381QJfXlf2B/v7aHb8Qn2Co4/OKyDs5cTcbKIC+R4Hq7Nr654Y
         lc4g==
X-Forwarded-Encrypted: i=1; AJvYcCWYITPveQXr1YvawrBfWERTK42wqGV5ITxCoEymCiBs95Y1+dGlTeqBkX31l3K2DaQIiJ8TtH/E4Hg8iZWJwEi/3kJG0oZGSOBZRV5jDNdMhGx8YrMWQSMIHtkzELe6FT0XD2EGsDH0yjY=
X-Gm-Message-State: AOJu0YxEtJKRZWTWm1ra5BiBmcbbUQUPM1O0/i4l1Ky/Dj9/0WfTdfN2
	zxATHLjL1hxd36bVca41GfP62H4GgX/WRViQWDXG3p4VzAmsXbaB
X-Google-Smtp-Source: AGHT+IHx6PD8MXyuK4ND+nNLwcCP8oPAW9GAQy4H7bRXw63mJxSR03olceHdYeSFseK083XTIGi4yQ==
X-Received: by 2002:a05:620a:a45:b0:790:e65f:915f with SMTP id af79cd13be357-792c75ac087mr225689585a.41.1715335860198;
        Fri, 10 May 2024 03:11:00 -0700 (PDT)
Received: from debug-VirtualBox.phub.net.cable.rogers.com (pool-174-114-162-125.cpe.net.cable.rogers.com. [174.114.162.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2fd1a6sm164060385a.91.2024.05.10.03.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 03:10:59 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
To: sakari.ailus@linux.intel.com,
	dave.stevenson@raspberrypi.com,
	jacopo@jmondi.org,
	mchehab@kernel.org,
	julia.lawall@inria.fr
Cc: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH] media: i2c: replacing of_node_put with __free(device_node)
Date: Fri, 10 May 2024 06:03:24 -0400
Message-Id: <20240510100324.5961-1-abdulrasaqolawani@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaced instance of of_node_put with __free(device_node)
to protect against any memory leaks due to future changes
in control flow.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
---
 drivers/media/i2c/ov5647.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 7e1ecdf2485f..d593dba092e3 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1360,23 +1360,19 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
-	struct device_node *ep;
+	struct device_node *ep __free(device_node) = of_graph_get_endpoint_by_regs(np, 0, -1);
 	int ret;
 
-	ep = of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!ep)
 		return -EINVAL;
 
 	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
 	if (ret)
-		goto out;
+		return ret;
 
 	sensor->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
 			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
 
-out:
-	of_node_put(ep);
-
 	return ret;
 }
 
-- 
2.34.1


