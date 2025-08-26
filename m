Return-Path: <linux-media+bounces-41077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 577CAB35A42
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 12:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACB06360250
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 10:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9AA31CA74;
	Tue, 26 Aug 2025 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0EooqFz1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E8B30146D
	for <linux-media@vger.kernel.org>; Tue, 26 Aug 2025 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205065; cv=none; b=P1HaIMgQdeQdSnJ8s99l4DJvtBj/ZdMLz6ronYCDFdICt0ft7ayJWnrdGe0QtIuZdNpHcBY45teyEn+Ym4SlK+HfIzc75LraR2DT+cixebPfVvovAgI/0s3dilyVRlfG/xmCnOWWUD/KDZRgzjO2b7tWWFAmY7EtgaQ3kYTcbWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205065; c=relaxed/simple;
	bh=c8wF0BfUS/6aLlK2OzhDdVaTt4p9jK7w1ki1OorSBVc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZEn5CGwMWlKu1Fu3pQ6aED0w00AY7xoIt8zbU6E2Lj/TPh8AeNeFBTYPCqhfaZxNLux4pVK7XLV51PXE6v6xQAliPWu1P9XCjWfiycIG+ikrx5Z2VwNin1CPOPKORS7dwJm6t7vUrYe2Bwbb6P8olJBCYV0SWIoUHYiF2gnUPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0EooqFz1; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3c7d6923834so1810664f8f.2
        for <linux-media@vger.kernel.org>; Tue, 26 Aug 2025 03:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756205060; x=1756809860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nM+IWDSwhMGMT/7iluC0nDBG6i5pCWyvwSlxidh1Uow=;
        b=0EooqFz1wbEKHAPJ6rUGRG8xjB2VA9bCyzJJBEJeMoiK4EUEZrrsQ60h+AP9W8/r/X
         YxpxHiK4iHl906B7wnMPLfn4CQoX9npdOKAy7jPl27aDX7PL0cKQzlTcOSfN6YFXBIA9
         xe25oDldEU9DA5GocSENcdK5DTAluEQPFi/IK8WavAqozKzNZh8biyACYUtTTs0oP742
         eLGmm+vQ2n3G4rfacmTLzNCZujqykIV2AxKuiist7/LHfy+f5WFdnVHbGgQic/XjcVbN
         5uqmzsAS+xFUU37fbWoL/+WN32Q58wKV1O9+HCxLbFmK3HS2KS5U+T5dbuqnCXEDCG1M
         wu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756205060; x=1756809860;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nM+IWDSwhMGMT/7iluC0nDBG6i5pCWyvwSlxidh1Uow=;
        b=kgcAjLxR0feuI5vQHTvpdc5pWbFS2+3XOOIvKwcyg6eF9dH5EDz8igDJU33ZAF+W39
         Tg4nwfEG9SWKQW8WqIP2oe+nVTXGW2XqrizUCKOb/vlC5GZjNySRyawZ0Zb+VIfuK8E5
         t/Pt6/qnpRSm4pnjt7MglkQ0G2pF/9I3A+4sLzBCgp1i9l7AbL52FsuiqIWOB5zdVEqN
         9vEV/gP78RgFTOEI6yO3vACMUheQbXFVD4ZerJq3nbGaMGYxmMBBI9M0nnmdt/Q8HweE
         5klsAeFsY/sR5TkUPdcB9l2Q46IxgOldxfv/ak7gmiDch3nQhC8jzxLGDJjws1jA6DQA
         07yw==
X-Forwarded-Encrypted: i=1; AJvYcCU+IXnq0sbsdX4T6azVbevVsCk1681zulZO6AGzY51p+Rx8Cbqmib70ZI+1fEfi+cNJe+ZMaiHR0OWhCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ri5etIIOdMaR9SVAhUVrMDJiIcRfBqr37yaVQ5D2JtPvIyyQ
	lYLQcAxhzBprOwiFInA5PH04F4FgvuUFB0FPcKQu3hr08UweorWS0sh86gvD34JvXBZzyYkhgEH
	f8pIQ0KJzQA==
X-Google-Smtp-Source: AGHT+IE1isPqF3++tJxagglaM72pafo0v2GIR5ZXviNWn5jETxcZB9Bf30btiNLYv/qeI2TYJF0Bs8H6mUbH
X-Received: from wmbjh6.prod.google.com ([2002:a05:600c:a086:b0:45b:520a:6656])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2c04:b0:3c9:469d:c092
 with SMTP id ffacd0b85a97d-3c9469dc2b7mr5563201f8f.16.1756205060524; Tue, 26
 Aug 2025 03:44:20 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:44:14 +0000
In-Reply-To: <20250826104414.2817514-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250826104414.2817514-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250826104414.2817514-4-abarnas@google.com>
Subject: [PATCH 4/4] staging: media: atomisp: Whitespaces style fixes
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Whitespaces cleanup only for fifo_monitor.c file. Adjust line breaks,
trim indents to opening parenthesis and replace tab with spaces when
necessary.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../hive_isp_css_common/host/fifo_monitor.c   | 760 +++++++++---------
 1 file changed, 398 insertions(+), 362 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fif=
o_monitor.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fi=
fo_monitor.c
index 3caef0f4eb217..5506da9bc7460 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
@@ -58,442 +58,478 @@ void fifo_channel_get_state(const fifo_monitor_ID_t I=
D,
=20
 	switch (channel_id) {
 	case FIFO_CHANNEL_ISP0_TO_SP0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_SND_SP); /* ISP_STR_MON_PORT_ISP2SP */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_SND_SP);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_RCV_ISP); /* ISP_STR_MON_PORT_SP2ISP */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_RCV_ISP);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_SND_SP);
+					      /* ISP_STR_MON_PORT_ISP2SP */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_SND_SP);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_RCV_ISP);
+					      /* ISP_STR_MON_PORT_SP2ISP */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_RCV_ISP);
 		break;
 	case FIFO_CHANNEL_SP0_TO_ISP0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_ISP); /* ISP_STR_MON_PORT_SP2ISP */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_ISP);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_SP); /* ISP_STR_MON_PORT_ISP2SP */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_SP);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_SND_ISP);
+					      /* ISP_STR_MON_PORT_SP2ISP */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_SND_ISP);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_RCV_SP);
+					      /* ISP_STR_MON_PORT_ISP2SP */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_RCV_SP);
 		break;
 	case FIFO_CHANNEL_ISP0_TO_IF0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_SND_PIF_A); /* ISP_STR_MON_PORT_ISP2PIFA */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_SND_PIF_A);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_PIF_A); /* MOD_STR_MON_PORT_CELLS2PIFA */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_PIF_A);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_SND_PIF_A);
+					      /* ISP_STR_MON_PORT_ISP2PIFA */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_SND_PIF_A);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_RCV_PIF_A);
+					      /* MOD_STR_MON_PORT_CELLS2PIFA */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_RCV_PIF_A);
 		break;
 	case FIFO_CHANNEL_IF0_TO_ISP0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_PIF_A); /* MOD_STR_MON_PORT_PIFA2CELLS */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_PIF_A);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_PIF_A); /* ISP_STR_MON_PORT_PIFA2ISP */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_PIF_A);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_SND_PIF_A);
+					      /* MOD_STR_MON_PORT_PIFA2CELLS */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_SND_PIF_A);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_RCV_PIF_A);
+					      /* ISP_STR_MON_PORT_PIFA2ISP */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_RCV_PIF_A);
 		break;
 	case FIFO_CHANNEL_ISP0_TO_IF1:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_SND_PIF_B); /* ISP_STR_MON_PORT_ISP2PIFA */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_SND_PIF_B);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_PIF_B); /* MOD_STR_MON_PORT_CELLS2PIFB */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_PIF_B);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_SND_PIF_B);
+					      /* ISP_STR_MON_PORT_ISP2PIFA */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_SND_PIF_B);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_RCV_PIF_B);
+					      /* MOD_STR_MON_PORT_CELLS2PIFB */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_RCV_PIF_B);
 		break;
 	case FIFO_CHANNEL_IF1_TO_ISP0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_PIF_B); /* MOD_STR_MON_PORT_PIFB2CELLS */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_PIF_B);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_PIF_B); /* ISP_STR_MON_PORT_PIFB2ISP */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_PIF_B);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_SND_PIF_B);
+					      /* MOD_STR_MON_PORT_PIFB2CELLS */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_SND_PIF_B);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_RCV_PIF_B);
+					      /* ISP_STR_MON_PORT_PIFB2ISP */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_RCV_PIF_B);
 		break;
 	case FIFO_CHANNEL_ISP0_TO_DMA0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_SND_DMA); /* ISP_STR_MON_PORT_ISP2DMA */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_SND_DMA);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_DMA_FR_ISP); /* MOD_STR_MON_PORT_ISP2DMA */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_DMA_FR_ISP);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_SND_DMA);
+					      /* ISP_STR_MON_PORT_ISP2DMA */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_SND_DMA);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_RCV_DMA_FR_ISP);
+					      /* MOD_STR_MON_PORT_ISP2DMA */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_RCV_DMA_FR_ISP);
 		break;
 	case FIFO_CHANNEL_DMA0_TO_ISP0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_DMA2ISP); /* MOD_STR_MON_PORT_DMA2ISP */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_DMA2ISP);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_DMA); /* ISP_STR_MON_PORT_DMA2ISP */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_DMA);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_SND_DMA2ISP);
+					      /* MOD_STR_MON_PORT_DMA2ISP */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_SND_DMA2ISP);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_RCV_DMA);
+					      /* ISP_STR_MON_PORT_DMA2ISP */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_RCV_DMA);
 		break;
 	case FIFO_CHANNEL_ISP0_TO_GDC0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_SND_GDC); /* ISP_STR_MON_PORT_ISP2GDC1 */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_SND_GDC);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_GDC); /* MOD_STR_MON_PORT_CELLS2GDC1 */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_GDC);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_SND_GDC);
+					      /* ISP_STR_MON_PORT_ISP2GDC1 */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_SND_GDC);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_RCV_GDC);
+					      /* MOD_STR_MON_PORT_CELLS2GDC1 */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_RCV_GDC);
 		break;
 	case FIFO_CHANNEL_GDC0_TO_ISP0:
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_GDC); /* MOD_STR_MON_PORT_GDC12CELLS */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_GDC);
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_GDC); /* ISP_STR_MON_PORT_GDC12ISP */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_GDC);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_SND_GDC);
+					      /* MOD_STR_MON_PORT_GDC12CELLS */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_SND_GDC);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_RCV_GDC);
+					      /* ISP_STR_MON_PORT_GDC12ISP */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_RCV_GDC);
 		break;
 	case FIFO_CHANNEL_ISP0_TO_GDC1:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_ISP2GDC2);
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_ISP2GDC2);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_CELLS2GDC2);
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_CELLS2GDC2);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_ISP2GDC2);
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_ISP2GDC2);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_CELLS2GDC2);
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_CELLS2GDC2);
 		break;
 	case FIFO_CHANNEL_GDC1_TO_ISP0:
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_GDC22CELLS);
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_GDC22CELLS);
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_GDC22ISP);
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_GDC22ISP);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_GDC22CELLS);
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_GDC22CELLS);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_GDC22ISP);
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_GDC22ISP);
 		break;
 	case FIFO_CHANNEL_ISP0_TO_HOST0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_SND_GPD); /* ISP_STR_MON_PORT_ISP2GPD */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_SND_GPD);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_SND_GPD);
+					      /* ISP_STR_MON_PORT_ISP2GPD */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_SND_GPD);
 		{
-			hrt_data	value =3D ia_css_device_load_uint32(0x0000000000380014ULL);
+			hrt_data value =3D ia_css_device_load_uint32(0x0000000000380014ULL);
=20
 			state->fifo_valid  =3D !_hrt_get_bit(value, 0);
 			state->sink_accept =3D false; /* no monitor connected */
 		}
 		break;
-	case FIFO_CHANNEL_HOST0_TO_ISP0: {
-		hrt_data	value =3D ia_css_device_load_uint32(0x000000000038001CULL);
+	case FIFO_CHANNEL_HOST0_TO_ISP0:
+		{
+			hrt_data value =3D ia_css_device_load_uint32(0x000000000038001CULL);
=20
-		state->fifo_valid  =3D false; /* no monitor connected */
-		state->sink_accept =3D !_hrt_get_bit(value, 0);
-	}
-	state->src_valid   =3D fifo_monitor_status_valid(ID,
-			     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_GPD); /* ISP_STR_MON_PORT_FA2ISP */
-	state->fifo_accept =3D fifo_monitor_status_accept(ID,
-			     HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
-			     ISP_STR_MON_PORT_RCV_GPD);
+			state->fifo_valid  =3D false; /* no monitor connected */
+			state->sink_accept =3D !_hrt_get_bit(value, 0);
+		}
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_RCV_GPD);
+					      /* ISP_STR_MON_PORT_FA2ISP */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_ISP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_RCV_GPD);
 	break;
 	case FIFO_CHANNEL_SP0_TO_IF0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_PIF_A); /* SP_STR_MON_PORT_SP2PIFA */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_PIF_A);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_PIF_A); /* MOD_STR_MON_PORT_CELLS2PIFA */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_PIF_A);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_SND_PIF_A);
+					      /* SP_STR_MON_PORT_SP2PIFA */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_SND_PIF_A);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_RCV_PIF_A);
+					      /* MOD_STR_MON_PORT_CELLS2PIFA */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_RCV_PIF_A);
 		break;
 	case FIFO_CHANNEL_IF0_TO_SP0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_PIF_A); /* MOD_STR_MON_PORT_PIFA2CELLS */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_PIF_A);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_RCV_PIF_A); /* SP_STR_MON_PORT_PIFA2SP */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_RCV_PIF_A);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_SND_PIF_A);
+					      /* MOD_STR_MON_PORT_PIFA2CELLS */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_SND_PIF_A);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_RCV_PIF_A);
+					      /* SP_STR_MON_PORT_PIFA2SP */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_RCV_PIF_A);
 		break;
 	case FIFO_CHANNEL_SP0_TO_IF1:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_PIF_B); /* SP_STR_MON_PORT_SP2PIFB */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_PIF_B);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_PIF_B); /* MOD_STR_MON_PORT_CELLS2PIFB */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_PIF_B);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_SND_PIF_B);
+					      /* SP_STR_MON_PORT_SP2PIFB */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_SND_PIF_B);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_RCV_PIF_B);
+					      /* MOD_STR_MON_PORT_CELLS2PIFB */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_RCV_PIF_B);
 		break;
 	case FIFO_CHANNEL_IF1_TO_SP0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_PIF_B); /* MOD_STR_MON_PORT_PIFB2CELLS */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_PIF_B);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_PIF_B); /* SP_STR_MON_PORT_PIFB2SP */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     ISP_STR_MON_PORT_RCV_PIF_B);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_SND_PIF_B);
+					      /* MOD_STR_MON_PORT_PIFB2CELLS */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_SND_PIF_B);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      ISP_STR_MON_PORT_RCV_PIF_B);
+					      /* SP_STR_MON_PORT_PIFB2SP */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       ISP_STR_MON_PORT_RCV_PIF_B);
 		break;
 	case FIFO_CHANNEL_SP0_TO_IF2:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_SIF); /* SP_STR_MON_PORT_SP2SIF */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_SIF);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_SIF); /* MOD_STR_MON_PORT_SP2SIF */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_SIF);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_SND_SIF); /* SP_STR_MON_PORT_SP2SIF */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_SND_SIF);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_RCV_SIF);
+					      /* MOD_STR_MON_PORT_SP2SIF */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_RCV_SIF);
 		break;
 	case FIFO_CHANNEL_IF2_TO_SP0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_SIF); /* MOD_STR_MON_PORT_SIF2SP */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_SIF);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_RCV_SIF); /* SP_STR_MON_PORT_SIF2SP */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_RCV_SIF);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_SND_SIF);
+					      /* MOD_STR_MON_PORT_SIF2SP */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_SND_SIF);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_RCV_SIF); /* SP_STR_MON_PORT_SIF2SP */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_RCV_SIF);
 		break;
 	case FIFO_CHANNEL_SP0_TO_DMA0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_DMA); /* SP_STR_MON_PORT_SP2DMA */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_DMA);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_DMA_FR_SP); /* MOD_STR_MON_PORT_SP2DMA */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_DMA_FR_SP);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_SND_DMA); /* SP_STR_MON_PORT_SP2DMA */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_SND_DMA);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_RCV_DMA_FR_SP);
+					      /* MOD_STR_MON_PORT_SP2DMA */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_RCV_DMA_FR_SP);
 		break;
 	case FIFO_CHANNEL_DMA0_TO_SP0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_DMA2SP); /* MOD_STR_MON_PORT_DMA2SP */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_DMA2SP);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_RCV_DMA); /* SP_STR_MON_PORT_DMA2SP */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_RCV_DMA);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_SND_DMA2SP);
+					      /* MOD_STR_MON_PORT_DMA2SP */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_SND_DMA2SP);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_RCV_DMA); /* SP_STR_MON_PORT_DMA2SP */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_RCV_DMA);
 		break;
 	case FIFO_CHANNEL_SP0_TO_GDC0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
-				     SP_STR_MON_PORT_B_SP2GDC1);
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
-				     SP_STR_MON_PORT_B_SP2GDC1);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_CELLS2GDC1);
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_CELLS2GDC1);
+		state->src_valid =3D
+		     fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
+					       SP_STR_MON_PORT_B_SP2GDC1);
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
+					       SP_STR_MON_PORT_B_SP2GDC1);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_CELLS2GDC1);
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_CELLS2GDC1);
 		break;
 	case FIFO_CHANNEL_GDC0_TO_SP0:
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_GDC12CELLS);
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_GDC12CELLS);
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
-				     SP_STR_MON_PORT_B_GDC12SP);
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
-				     SP_STR_MON_PORT_B_GDC12SP);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_GDC12CELLS);
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_GDC12CELLS);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
+					      SP_STR_MON_PORT_B_GDC12SP);
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
+					       SP_STR_MON_PORT_B_GDC12SP);
 		break;
 	case FIFO_CHANNEL_SP0_TO_GDC1:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
-				     SP_STR_MON_PORT_B_SP2GDC2);
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
-				     SP_STR_MON_PORT_B_SP2GDC2);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_CELLS2GDC2);
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_CELLS2GDC2);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
+					      SP_STR_MON_PORT_B_SP2GDC2);
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
+					       SP_STR_MON_PORT_B_SP2GDC2);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_CELLS2GDC2);
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_CELLS2GDC2);
 		break;
 	case FIFO_CHANNEL_GDC1_TO_SP0:
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_GDC22CELLS);
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_GDC22CELLS);
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
-				     SP_STR_MON_PORT_B_GDC22SP);
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
-				     SP_STR_MON_PORT_B_GDC22SP);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_GDC22CELLS);
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_GDC22CELLS);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
+					      SP_STR_MON_PORT_B_GDC22SP);
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_B_IDX,
+					       SP_STR_MON_PORT_B_GDC22SP);
 		break;
 	case FIFO_CHANNEL_SP0_TO_HOST0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_GPD); /* SP_STR_MON_PORT_SP2GPD */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_GPD);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_SND_GPD); /* SP_STR_MON_PORT_SP2GPD */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_SND_GPD);
 		{
-			hrt_data	value =3D ia_css_device_load_uint32(0x0000000000380010ULL);
+			hrt_data value =3D ia_css_device_load_uint32(0x0000000000380010ULL);
=20
 			state->fifo_valid  =3D !_hrt_get_bit(value, 0);
 			state->sink_accept =3D false; /* no monitor connected */
 		}
 		break;
-	case FIFO_CHANNEL_HOST0_TO_SP0: {
-		hrt_data	value =3D ia_css_device_load_uint32(0x0000000000380018ULL);
+	case FIFO_CHANNEL_HOST0_TO_SP0:
+		{
+			hrt_data value =3D ia_css_device_load_uint32(0x0000000000380018ULL);
=20
-		state->fifo_valid  =3D false; /* no monitor connected */
-		state->sink_accept =3D !_hrt_get_bit(value, 0);
-	}
-	state->src_valid   =3D fifo_monitor_status_valid(ID,
-			     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_RCV_GPD); /* SP_STR_MON_PORT_FA2SP */
-	state->fifo_accept =3D fifo_monitor_status_accept(ID,
-			     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-			     SP_STR_MON_PORT_RCV_GPD);
+			state->fifo_valid =3D false; /* no monitor connected */
+			state->sink_accept =3D !_hrt_get_bit(value, 0);
+		}
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_RCV_GPD); /* SP_STR_MON_PORT_FA2SP */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_RCV_GPD);
 	break;
 	case FIFO_CHANNEL_SP0_TO_STREAM2MEM0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_MC); /* SP_STR_MON_PORT_SP2MC */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SND_MC);
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_MC); /* MOD_STR_MON_PORT_SP2MC */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_RCV_MC);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_SND_MC); /* SP_STR_MON_PORT_SP2MC */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_SND_MC);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_RCV_MC); /* MOD_STR_MON_PORT_SP2MC */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_RCV_MC);
 		break;
 	case FIFO_CHANNEL_STREAM2MEM0_TO_SP0:
-		state->fifo_valid  =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_MC); /* SP_STR_MON_PORT_MC2SP */
-		state->sink_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
-				     MOD_STR_MON_PORT_SND_MC);
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_RCV_MC); /* MOD_STR_MON_PORT_MC2SP */
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_RCV_MC);
+		state->fifo_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					      MOD_STR_MON_PORT_SND_MC); /* SP_STR_MON_PORT_MC2SP */
+		state->sink_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_MOD_STREAM_STAT_IDX,
+					       MOD_STR_MON_PORT_SND_MC);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_RCV_MC); /* MOD_STR_MON_PORT_MC2SP */
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_RCV_MC);
 		break;
 	case FIFO_CHANNEL_SP0_TO_INPUT_SYSTEM0:
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SP2ISYS);
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_SP2ISYS);
-		state->fifo_valid  =3D false;
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_SP2ISYS);
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_SP2ISYS);
+		state->fifo_valid =3D false;
 		state->sink_accept =3D false;
 		break;
 	case FIFO_CHANNEL_INPUT_SYSTEM0_TO_SP0:
-		state->fifo_valid  =3D false;
+		state->fifo_valid =3D false;
 		state->sink_accept =3D false;
-		state->src_valid   =3D fifo_monitor_status_valid(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_ISYS2SP);
-		state->fifo_accept =3D fifo_monitor_status_accept(ID,
-				     HIVE_GP_REGS_SP_STREAM_STAT_IDX,
-				     SP_STR_MON_PORT_ISYS2SP);
+		state->src_valid =3D
+		    fifo_monitor_status_valid(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					      SP_STR_MON_PORT_ISYS2SP);
+		state->fifo_accept =3D
+		    fifo_monitor_status_accept(ID, HIVE_GP_REGS_SP_STREAM_STAT_IDX,
+					       SP_STR_MON_PORT_ISYS2SP);
 		break;
 	default:
 		assert(0);
--=20
2.51.0.261.g7ce5a0a67e-goog


