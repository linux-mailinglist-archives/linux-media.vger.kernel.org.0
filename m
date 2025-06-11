Return-Path: <linux-media+bounces-34502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA13AD53C6
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 13:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD69B1895B50
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 11:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF98325BEE6;
	Wed, 11 Jun 2025 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUPiRvxA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C57B2E6108;
	Wed, 11 Jun 2025 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641048; cv=none; b=fKqIiJISxMpMETyP4yoHegs1ZQmqAZ2ALd+hsy9aWvJapZaHXajtIvBNhZEc6zE49u9X1kjZobFsfhARJvtgyMDQeEc5SghkxGWO1+yG/71/olLoYpz80ElSYmJ8avCkYEQA0LfZTx84KsfZlNKI3PhpWz+V6ida1f/PPlKIOaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641048; c=relaxed/simple;
	bh=5KS/lErfQD5VWRKLSAT2yYlzVnBWfZp7ht/77UT5UiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACN0Zyn1jVHPzbND+Bwg1hrCe1f+cFTdrRU7CVesNthMGg2VcT0S5ZDiA/utvmhrw61FqeaLnTk/2R9nRFWsxS4VWHlY3KOuDTrPcWV0TA17LsgPJo51X19DC5sQnydlks8lfxbLnfXCkC73y8pTwH8ZOCbd5nW4elN7WhtFl48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUPiRvxA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60780d74bbaso1437161a12.0;
        Wed, 11 Jun 2025 04:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641045; x=1750245845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GX0h5zzuFMrhCPJNlMrj+EkVZX5HfBmvk6wYNS7UWyc=;
        b=SUPiRvxA/fzK8fKJ+7SOeg6VJDTWnS8Mz6QCw6MpkB0YQsZkTVpN54hQV9WKZD2fP3
         mi1+0inaDc6JrG8rSzyt5HpLJoZIuV10+PQyv8BphvedzYE0zbAYoLrhAiXbxavSFJPq
         NnaiqzUwwWTiplVXV4eIwYPTGw04LHXXViycuzXUGHZsr6cVmmpR7F4c8vKP5nnmInmC
         R/0THuR54/MSDng6Pz9WtLdTyuJD9bwNJgwYEjzQX9F4ZTOXMorgg+6CSnQASLz/Od0I
         pYNL8J5qdusCH7Mvlvwaj0rNrfygZtiV7oYefSLGW3mEbiIGP8qJZvt+c/ORJX1/5LWp
         dQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641045; x=1750245845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GX0h5zzuFMrhCPJNlMrj+EkVZX5HfBmvk6wYNS7UWyc=;
        b=SATtaIophgtByxqJ0HhhqBlpFYB2xlAnuRjOZvUMhqxu6SUiQN6QJ/54NfyuZxRAQC
         ybsmc3UoTiAIMF290aHu6iOo2PcwxEM73honAZaOTnPR5ifuNbWvpEoxdV28TTa/zDKm
         CEJbbfe6ZCL6MQW0IhBIuDWHrgOUWBXRgAVxtIUbGPjbljONMAnCg6DUDZYf8ytpLbCU
         552nSVBWt3ghBWwexOBKLz/UWayJuS6ND1a370oJMsziu8EyHcBKshTlVQzAUqU1EiWT
         EWSfO1zm+8j/rfzQlXfOLH/2cIUv26+9vlX42C7qjeNNuHnaUvi2vzB2yI3uZl3XuPX5
         iJmg==
X-Forwarded-Encrypted: i=1; AJvYcCWRDZtGk/lpT2FFPSekkemKBFNNi+3EsClcp+CI77eQ0Rd8sI9dvkq7vBlvu/MEnLJ/JgIiPNdNrv4qD9k=@vger.kernel.org, AJvYcCXut1FkSk9F5xDfly4K6Im/Quekwp6ytZagKwhUKw/VbWLtrzNgsNPZXcSZdYDub+R9suFy5zzTCFQ0aGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9vTdv9mjtTCeCiFadbwcG8tv3YHbBWDrpAG3rZda6+84EzndN
	cZHYPIGkoxe0Q3YyOCCQnec7WxCCiHPFXeqZNSKGtu5YxMCPZfovAj4j
X-Gm-Gg: ASbGncukfFK5ofKmL6XSIXiegZdwFF6yaO+biRMceGrQ6OFnPi2Tb+BkYiCQEU2x/r8
	h6UXB44BJpIQZ+rY/vGvpJhgWw7EId6OdfLutNxYnUrC01+9hth/Gi6Tjneo9pai987Q7Lbr1EA
	GP7864IVFE2aUgYIVd5e/+Zs2/S6YzHRT2ylgueoZmqoTNiO7n0M+YjyWLKDF8bZ3lDtjW8JJii
	QpwoD3P3u/hOzgrx9gZfbZq6jN0kxq2Lp2cO6gl0FrVr+16nFhl6DawBjm9G4Fw5s/oYGwXVBMx
	DDS+ErGLJItD4lXpWnBca8uds74uM2Kmrmw/ADWI8iqsrZe830RMGJgxFslF+QV8kY5ajKp9HwQ
	=
X-Google-Smtp-Source: AGHT+IFtO2fIKIBJy+XZGcbcBXQxKOs457TfxazYqvd9dytgNaObfYlh+T7RuV6LsIxUs8leN1XNYw==
X-Received: by 2002:a05:6402:280e:b0:604:efcc:bf5c with SMTP id 4fb4d7f45d1cf-60844e69e06mr2877020a12.1.1749641044727;
        Wed, 11 Jun 2025 04:24:04 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607fbbdaadbsm3739639a12.51.2025.06.11.04.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:24:04 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 0/2] media: rc: ir-spi: allocate buffer dynamically
Date: Wed, 11 Jun 2025 14:23:42 +0300
Message-ID: <20250611112348.3576093-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the static transmit buffer with a dynamically allocated one,
removing the limit imposed on the number of pulses to transmit.

Add a check to constrain the carrier frequency inside
ir_spi_set_tx_carrier().

V4:
 * add separate patch to constrain the carrier frequency

V3:
 * move the allocation to be done per-TX operation

V2:
 * use devm_krealloc_array

Cosmin Tanislav (2):
  media: rc: ir-spi: allocate buffer dynamically
  media: rc: ir-spi: constrain carrier frequency

 drivers/media/rc/ir-spi.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

-- 
2.49.0


