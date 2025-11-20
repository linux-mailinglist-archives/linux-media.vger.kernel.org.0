Return-Path: <linux-media+bounces-47425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B0BC71985
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 01:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C74E34D0EE
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 00:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778941F03C5;
	Thu, 20 Nov 2025 00:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gXxg7J3i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A371EF38E
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 00:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763599577; cv=none; b=uQNHR/Frld29N7Z0ki39DXmr+25WHH2jXI/Gh0xGLexQIuq6wio+fAGfzVoI0W1QR7C/Bmx8eZbLobzYcKm7Ib/zDBtC/sZinrqNR8EXAce8cHibrNnBzG0YcF/uy6i5q4pvI63HUIk8E56ADqsLi+eAVslFU0gCNZcoEK7f2RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763599577; c=relaxed/simple;
	bh=cfRYehKmIYEVCp2eb7c/iu9LL0ZbAiyq0M8tgp2yQLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aZf1I9K7z6UXwuF2P6YiDw18RpWXmp2GnlfOuuGrzq3yI6jKl32lLml0mDer01C1XTpU0qcVFFXNbb9aZchE26U4t7t3g/r5tetug9IrDq3U84Hk5ettiamaD9w+3g7ifigN+Kbu6wbwcmoYFcO4b6VlVWqAql/OUValiqOjti4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gXxg7J3i; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-594285eed50so32783e87.0
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 16:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763599574; x=1764204374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5e5nQefCPDRN0dJhI8HXjijaK923N3wC5GLZmrz9s8=;
        b=gXxg7J3irP45HSPNTEPqhWZjYAtD3Sy2g0T8Mq+RMGm6+QG3d4FvB492m+zcTxuZZr
         JxTnOfu06aVu7MCUbcZTqLUd5b9BggK3tGXnq0T3OZg2mcv6MqHf89wYj+iKnioVM3Li
         EvZFK+hFNNlMWSPtq7NMYxHy6EL+kQr+uGQ15g2Ff0dOwkOOkKDnRpsG0S0Ok3aILFSf
         3BREvxGttXgWsX/4G/6u2s+MDDXAJLgGmvo/JPQVBAsHokjLRNrE0nK6vTZheJOWuql1
         o49tCRn3x0jK/OutYYu3YWXc/UJlO/RnSxbokgldd0VTpaBARqJppWjJ25zXqQ2TmMZI
         KFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763599574; x=1764204374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5e5nQefCPDRN0dJhI8HXjijaK923N3wC5GLZmrz9s8=;
        b=IKn7r50VdQpJIQkUSDSzpujBLwm2sDoCvysPcheiz00dmLPDccfo1HJTDzbkQSmamk
         QkFi4oW13zliHFAQOJGIGUEG0DzObfsWe+98UbAEE3tdnEXf+rJOld1Kzzmf9IEjBTv4
         RfbLaFYrq1HeUhDVprzT52Biktf8rGRtugCTpnH2CndlizROEppbzNqelmGsYXKUAHhD
         G75ytbgiJai3o+NtGYXWg/PDqrecPJUDLzQ9Th4X2wutOmj7GQpoHq+/FfPDnnip+ERo
         bfcqeHRBNhmwJAi+hritCcLJJbGvocutL4+U8heouJwvoM/9/JS/2arqfXhOkkNroPgd
         KExw==
X-Forwarded-Encrypted: i=1; AJvYcCVL/t50arO3XKw/OjZpEL2WT/H3KtQwDZvKDocG3w9odp4RrY1ovGxDNTxk+LOi0TmQOAuC2XRl8HIUUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzziYDwbl30vJc3zS99hGLM0AWYjfZby13NN+5WJkE4KWejqAtB
	qfr77TYPO5SJyvTucRYAY5nZGXclfdI6MxAmovFDYHV+5CEsKeozObjV2UIYFmCCntM=
X-Gm-Gg: ASbGncuC8bFGVrvBCXaNqi7YsiROsJ+lJKn6NmlPhr3cpYzlAOQTkJ4/ADLN3KVRcJ5
	NyN/hwXaRoSWZAq38p556xpcINWnlVrqmsFcbzEz1IfKGDr2+i+O+alXFMpDTYVysRJs4GK8xEx
	dcHktTNdWu5SgJuIzYJWCABS3s/SMY2kWbTFFGxR2WhwFqmj5MQrBYstj47rj/+75trrguGOjp3
	v83e3LD3dVqwdjedlGMXzWjizisT9QNhldyEQjpeEd7UAMVOurH99YV5UxSUX/8yWCBmp8IDtNK
	6KCelbbbmY+/QyXOnTQTqAzTZRyeiZ2YR/iDJRWWqgcONzleXEr4OHYVT2uWVjKjGi+exnkuAcy
	bMb9aaJhkfw2SUZzTRZlLoy2JEwXRElaiCUeA9oBM2HFmDejvWxDpWl3IT+49bTGzPJuIK6cNZF
	I8QDsDwy4/DB1r97UXqG8ziUhg5oKUKiq7h7XpDu47EACft8BZrWVIfw==
X-Google-Smtp-Source: AGHT+IF0tBnQr3LZJWz9Y765jwY1r6Y8p+uKy+rRNcAVxWJTHaRd7ZfpFTD0aQ0FWs/nGcZqBFo4Jw==
X-Received: by 2002:a05:6512:3b99:b0:594:5582:f77e with SMTP id 2adb3069b0e04-5969f4901c4mr12357e87.4.1763599574149;
        Wed, 19 Nov 2025 16:46:14 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc59a9sm229479e87.71.2025.11.19.16.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 16:46:12 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/2] media: qcom: camss: simplify registration of sensors
Date: Thu, 20 Nov 2025 02:46:02 +0200
Message-ID: <20251120004604.2573803-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset simplifies asynchronous registration of sensors connected to
CAMSS CSIPHY IPs as linked media entities.

There is no difference between these patches and the unapplied patches
from v2, where the patch review discussion didn't progress further.

Link to v2:
- https://lore.kernel.org/all/20250903002255.346026-1-vladimir.zapolskiy@linaro.org/

Changes from v2 to v3:
* rebased on top of next-20251117, intended for v6.20 inclusion,
* added gained Tested-by tags by Loic,
* removed already applied patches from the series.

Link to v1:
- https://lore.kernel.org/all/20250513142353.2572563-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* added a gained Reviewed-by tag to patch 1/4 (Bryan),
* reworded commit message of patch 2/4 (Bryan),
* explained better a removal of port node availability check (Bryan, Neil),
* cosmetic and non-function clean-ups of lesser significance,
* removed already applied changes and rebased the rest on top of v6.17-rc2.

There is no any functional changes between v1 and v2 of the series.

Vladimir Zapolskiy (2):
  media: qcom: camss: change internals of endpoint parsing to fwnode handling
  media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function

 drivers/media/platform/qcom/camss/camss.c | 54 +++++++++--------------
 1 file changed, 21 insertions(+), 33 deletions(-)

-- 
2.49.0


