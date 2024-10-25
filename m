Return-Path: <linux-media+bounces-20278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D7B9AF86D
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 05:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3B921C20CB8
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 03:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE1118CC00;
	Fri, 25 Oct 2024 03:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fSAgYMAN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1D318C935
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 03:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729828002; cv=none; b=Cbemu/DAshbhSdXj2qX7KDIzfHVA3gis1yzJ20zNtFtBAUHtgrrYhLw45whw+cDSPfMvhqyRUQWlM/4yKN1pxry83FaxXaJ5ltkZwkushnhP0BBfaxww44mcaknjloj1q2U4QOwVnE/warVIgrhCXpL44zOgE3IA2ZhP4KjHHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729828002; c=relaxed/simple;
	bh=uN+h/2QOVy21qT00CBb5lHlMvu4nek7Mn5Xk8HQsCAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzpYjNNHtRqIi661e0eLiqDHcqZz8FrG725NM56QgoVuwEqc8lAxWQxt0hu19D6vDxoopO0eQH1d1JVI96sQVYDmeqLrmhoIuB57GWxjX9lUe03+ei7OnETlvdxenGb9eTCqVeFjIc56tAQLNg4wPnL0Z7tvPvPAO6QBAry8/Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fSAgYMAN; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5ebc0dbc566so912046eaf.3
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 20:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729828000; x=1730432800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMGNMPKqK0lqYmlnV0QWsKywIGZPhuT56WcMR+va1mE=;
        b=fSAgYMANET+yodJMHRaxDtCYUc/ANWU08V6fOCK5eNzr3U3i6ZCab/8JmPhDPHj8Kf
         P7UiuBHeIEaVBTbqHQi+/v8oj5PPAXgeOGvsJh+wmLwaDRM5u4uNiYx3z7bx6pDQYMfy
         HCgkvajbVPznnHat5PHfiDB3gz2jfVdazlvIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729828000; x=1730432800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMGNMPKqK0lqYmlnV0QWsKywIGZPhuT56WcMR+va1mE=;
        b=FrK+3YdlmXGOX7g2rs9JZ0e7aGCmnlaCHR7CYXXJMuPkHP8E1RUMcllvJeXldjnSyh
         8jBjh8AEwrzw+vfyjMUdwQX2mW9jxTE0nt0QAEtnQwVZLTf30cISbWirl8IOC9zUKyDk
         Ed0P6EeKY3j2WPkL4l50DBlwVGgYtd0JyaRRaq1a8tRjhZWkRUyT6l35/1nf/hSWhieY
         MrhG0yqbycbQv6ALfK5mQfh+KaYMuVWzwk5J2aYEOe+C0JNrPMeE75zzcadz6Vig5MSd
         ucXAV3+MZRlkAWotqMm/h3A3bmLYKChW/rOnL/a/jXppXPzgKeYClOlPGKBZxiQIg0V3
         35Og==
X-Gm-Message-State: AOJu0YyHQDaDAfPamUk4Pp/sDmGhinDoFuP0ViU+0GQVRFQu62hw9MQC
	pLKaj5dmbvoh2/X6b8x3sQvswDqskmQKtuk1mcWpYcCC533sRhTBItE2/gU/WA==
X-Google-Smtp-Source: AGHT+IHDIYmYDbKr3TnetPaMtGRq8ardDGQ9JsK2iH5M3t/dOsDwaez9uiJIYdobzDxCAzmJmupW0A==
X-Received: by 2002:a05:6870:648c:b0:277:7147:26ff with SMTP id 586e51a60fabf-28ced448ademr4272377fac.35.1729827999827;
        Thu, 24 Oct 2024 20:46:39 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:c7f5:2aa6:333b:bb6d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8696bbbsm185197a12.49.2024.10.24.20.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 20:46:39 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 0/3] media: venus: close() fixes
Date: Fri, 25 Oct 2024 12:46:11 +0900
Message-ID: <20241025034629.660047-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of fixes for venus driver close() handling
(both enc and dec).

v2->v3:
-- factored out common close() code (Bryan)

Sergey Senozhatsky (3):
  media: venus: fix enc/dec destruction order
  media: venus: sync with threaded IRQ during inst destruction
  media: venus: factor out inst destruction routine

 drivers/media/platform/qcom/venus/core.c      | 25 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  2 ++
 drivers/media/platform/qcom/venus/vdec.c      | 11 +-------
 drivers/media/platform/qcom/venus/vdec.h      |  7 +++++-
 .../media/platform/qcom/venus/vdec_ctrls.c    |  6 -----
 drivers/media/platform/qcom/venus/venc.c      | 12 +--------
 6 files changed, 35 insertions(+), 28 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


