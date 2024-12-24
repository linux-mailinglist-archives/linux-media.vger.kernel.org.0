Return-Path: <linux-media+bounces-24026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F739FBA2B
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 08:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84DF7164AA5
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 07:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D73418B47E;
	Tue, 24 Dec 2024 07:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RuMpON/n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4C014F9CF
	for <linux-media@vger.kernel.org>; Tue, 24 Dec 2024 07:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735025094; cv=none; b=K7TxQhg4Fi6k9p7x46CMU+TeJ69kmvqpaxqLCxgBEe09i9rUGyzb3BQzA9X2LdZX4/hlGRDh01vgnkMDlfxlW7zai1zOXqlJ/dVaJjLT7ivdSadvM3IM8vlfnZFFc9pRg4AaPC7KgY+Ne5329VAUWByCCqQjKigb19glElvAiLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735025094; c=relaxed/simple;
	bh=2fMBL8LergDUS72jw7d1JQe/XME08hAJyxHARm7NJZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bsascHKls6l9jmTlJgObtDtSUGiwBfuiNIIxcR1vspx2VPng5uqqItzkYGoOHcxXBmuktBExMk2nDaAu+o0wEqdD3s52oLGLqhVj8xY61zEIhVeta4Lx8hkiLi9nGRMdZaU9pkyRBTCEj4IeJLDk+NkYQKocsiuR06F9yJp8s1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RuMpON/n; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21675fd60feso62794935ad.2
        for <linux-media@vger.kernel.org>; Mon, 23 Dec 2024 23:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735025092; x=1735629892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rNiCxYDQlXG2RrHwqYY7HaFMfBfk//boKo42ckSc+Ks=;
        b=RuMpON/nVI+YH5ZB+VlF/Bhl18AgCa1ppYCd88Jc/k/bqWIzWEbJymfF/7zaBXLIhR
         ndnpOeIqm29FmqdxW2IOl1+9EUfDVO/lwief547O98KfYzAoaR2ypcG5HC2vf46EmleH
         LMA6KkA5WtCNBs6CZ/aTp9VbcT5DcHMRTiwnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735025092; x=1735629892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNiCxYDQlXG2RrHwqYY7HaFMfBfk//boKo42ckSc+Ks=;
        b=UIeIUN7rihGPK67bHLj32SKr2Zw1QDFmO3AdTlCOLLK3GXKzvEpUCEx7JnDq3LM0/K
         N5b9DpDJn4pQka9Mnta6uEb4eUBnPPioTpBfl/Hn+qhgpWFz1HG23GVjQ4wtSVVAjYv3
         B7fq/sEMm6NXXMSWn5g4uib6RL9X73v969rA8GixniMJZ0HqQG96qqfxUiZQvU3J56hW
         A1bFUwBqGjRed09uIi8yb7jU+WiHTFBaSWbBY4Pup3g4mqrzxayVPGk1aoEbecjybmFx
         EBCeGuNLE9V+T386L6pLSqYxhL1t4RdIFAKhkvA1UwtNg66eXtm67GtJjpQ/jHBadAsU
         Qg/g==
X-Forwarded-Encrypted: i=1; AJvYcCUz2gupl5zVzvp2XHkCdwiyxD754tsWpYvxmKbjKCo7XYp9sX7ChGfdDbTYDJwZ4KdZs0i3P69itMy/dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOhNhQBqiQvqZBvWQSsUwQoMo74jJtznegr16O0yXHmaqD87WY
	NrjlCg8xcrtw0Xak8UsTpBrIzzicq3o9TjCXwk/cX0QS1y8tm+4wOrAWMJbGOA==
X-Gm-Gg: ASbGncvJ15A5F4tcY7o4Wa4eGVpEIrQhY/O3IJdb0NMEZN2b0Hq0z8CZV8QyOWQ7jWW
	OaF9E9742XhXtu1GgP6khfg0Fwsj3f4u3sjneAzlzWhHTQK3XzPcQruOD6OSsdxuOuShPoxh1iv
	0ousTPdQbfektDq4vCpX/J28gLsoIH2sdtAFsr9TC1ulKo/4rYUEBL79GugCXARcoxVayDVlTp0
	UjWKm6uswfpaSOmJN9o8NKUsWwPbUgblp5pIsnlOs8jAZiabmf/2H98jbg=
X-Google-Smtp-Source: AGHT+IF3VSAg/jEAbHdgaJeQQunN76AODCbvrDpKXzcn0+KtDeJuP9aGKrPJk1J/J6tEesNxuZR/DQ==
X-Received: by 2002:a17:903:32cb:b0:216:7d7e:c010 with SMTP id d9443c01a7336-219e6f14898mr224820065ad.37.1735025091927;
        Mon, 23 Dec 2024 23:24:51 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:de21:da72:a349:25b2])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dca0256dsm84186865ad.258.2024.12.23.23.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 23:24:51 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 0/2] media: venus: partial revert of 45b1a1b348ec1
Date: Tue, 24 Dec 2024 16:24:04 +0900
Message-ID: <20241224072444.2044956-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts 45b1a1b348ec1 due to regression report [1].  We need
a better fix for the problem in question.

[1] https://lore.kernel.org/linux-media/ltiok5ryos2yh6bvd2md3p7k73rd6eu6fwagn2b4ij7tuljntn@dx6o5ralryui

v3:
-- added Reported-by (Dmitry)
-- added patch that re-shuffles instance creation order to match
   the destruction order (Bryan)

Sergey Senozhatsky (2):
  media: venus: destroy hfi session after m2m_ctx release
  media: venus: match instance creation and destruction order

 drivers/media/platform/qcom/venus/core.c |  8 ++------
 drivers/media/platform/qcom/venus/vdec.c | 18 +++++++++---------
 drivers/media/platform/qcom/venus/venc.c | 18 +++++++++---------
 3 files changed, 20 insertions(+), 24 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


