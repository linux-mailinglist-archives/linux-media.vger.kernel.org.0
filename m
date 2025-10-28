Return-Path: <linux-media+bounces-45733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B6EC13243
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A78013A5636
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 06:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1194D29CB4D;
	Tue, 28 Oct 2025 06:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8XoV0Ng"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289F41E9915
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 06:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632821; cv=none; b=pbzcZ0WZSti7Uyc/RMc5GsdP6+YHfcNnlrTGA1GdRoDO7FCnh4M7+Dwfv2+8G4BcbSNJe9iEC2rnnuz6lvkbPSLUQKJSaOKnyuTYam8jwvnyBzLFoBP5s6GFNlNFnmeCUjOg3hONwogIBuzv4TCvN1SeHS24N2XUWd2WtQ/1lvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632821; c=relaxed/simple;
	bh=4ypjvRC0xHu19Jpd1GKnjwPsnkIyQXnxSORET/7XTqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F8HRKcFia8nm9oXsxGoQRjVMiXVxwyYANncWmdDM8/++evo0QcWAp9VUap/7LiHyV1U/tl+IVMLXHx5P8ptKntQa1RUxiW0B3oX86V74VuifoVx3lC56WMAU3a4ayz/49lkYEoF9djonXaQXJmW2bI79EXekMARRcOAk5TNR1zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8XoV0Ng; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so5384094b3a.1
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 23:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761632819; x=1762237619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIFG7SISg1BvV10VAwPSSQgpAOVoBb9U2Xlupg6IcxY=;
        b=m8XoV0NgKa800qfd3y/+HWcUix3wM7Erx8wSYBUXBnWvKOsnf5hFsB7W8UqDOhR6W5
         8p4xEVE2TAeah+xd9jNJHpCdheGLW7EXdE1XiDS72CS9RgrO68rWAFvcKTZ4Bd/a/ks7
         TOpZ7736ZqqoSdIBPNipnBSr7YGhLVeWrU2iug+iv09FO3aXVSeCSfBEArMGGPDJz1K9
         XI5d+3v24mZnVM+GQQ1Bqg6jp98AVpF1HQ7HdogSgXM4SEHrr1ZLlq5Ug8TIxAA0/+8s
         E46e5WCNd+3BGS+E0EpPu8qFuI+ZDhfE2yYaBnmKnYbBljS2DCRWIzlW6JFgS+PL+Lh6
         QBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632819; x=1762237619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIFG7SISg1BvV10VAwPSSQgpAOVoBb9U2Xlupg6IcxY=;
        b=DF6Hj8z/LPE1OpRkJQ4tdsWBOHMNMe8OZY/dmLHTPDC4d15asjaZVxBjTdMaKUuuCH
         S6uG3CVKD9P4bAE+Pi3UmIO0qr9lF8Sbq1FDi4ttHCPm5zwaXDZgMhXJiwQFdKSYmh2l
         A2gkFUHWEZrvqpooA2J4YKMYqssX9U7fRh61zI6IJTbHoOJugcdAo0weK43ZteehbrhQ
         VhXZepbt654G5AAL0tUORqjxz6ozfEskEizhIMU2VeuF1ZPpHUs85RdjG8nMr1ldi2rA
         O/q7kr9mlYHZ++WFSvTn8KuZdTTFVFmDhBexkJB0KQOwcV82/uTw4ZWgAuSyLdZlPYvT
         cH9g==
X-Gm-Message-State: AOJu0YzprLNyY2KN5u3CpcAuWlEDbM7EAFwTuKrFtY4S58yDMee+OkcN
	wHbM3A/eU6qXggfavMv0enQx7pVJfTyKpSLgwVK8izQoW8mbTRILCWbg
X-Gm-Gg: ASbGncvgd2LOCGXr5ZZtK2t0wpdJDyMarqR1trealJgrjuJtY+qQefZAQoFChDct+A5
	fVPBlk9WWt+/t/CQKAvAynyHf6RD7sMdcuNOjtYFh9wYT4ND8UvX/e55wwJP97YKLUbsKwZluo0
	OqYx005B4XwF47lQJ40ddntANwGvbZpmSM0EkSCpDfxUqh/LZIas+MTQQuKeeXM+enYxQL95Hat
	E3Oa8sHV8btLZl/33JvAjLmpT0hfKbdFKn+qcp28oRWAMBRnkk6/UDUE0O7WpgrAKLB71VR6nAJ
	aZuZVU+9XSNwprj49IPZrXcjvBu0OKpkFkKs3srH+NB/zuHMOQYmsBMksXy1MZqaS3xnlR0OCHn
	6PNdumysWHX0nitGiRYh6xWdGdbzddT6FqsuroCYZSOqDeHjvR4t/qJ6SG+R5UopDKM5av2eivV
	1tUPo0HknfJoma4S8yjXBmXX07JdEJJ5hbenO/Um0l2GTgyXCHVflf2l6rwpb93SPm1W5PCnExJ
	5V3PlwfpSLXNI8=
X-Google-Smtp-Source: AGHT+IG/a6FlMLcmPODeVXqDq8p6icNpYlyWYcTFguHnLLVnGyybZ55aGvHzqPtQk3RDx0yn6bP7aA==
X-Received: by 2002:a05:6a00:6fd9:b0:7a1:6124:c470 with SMTP id d2e1a72fcca58-7a442e40712mr1809915b3a.8.1761632819336;
        Mon, 27 Oct 2025 23:26:59 -0700 (PDT)
Received: from opensource206.. ([106.222.235.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087587sm10293217b3a.58.2025.10.27.23.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:26:59 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org,
	ribalda@chromium.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	yunkec@google.com,
	sakari.ailus@linux.intel.com,
	james.cowgill@blaize.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH] media: v4l2-ctrls: set AV1 sequence flags for testing
Date: Tue, 28 Oct 2025 11:56:23 +0530
Message-ID: <20251028062623.12700-1-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize additional AV1 sequence parameters in std_init_compound()
to make the default AV1 sequence control compatible with compliance
and userspace testing tools.

Specifically, set:
 - enable both SUBSAMPLING_X and SUBSAMPLING_Y flags

These defaults help ensure that V4L2_CID_AV1_SEQUENCE behaves
consistently during validation and v4l2-compliance tests.

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index fa03341588e4..8809912797d2 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -160,7 +160,13 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		break;
 	case V4L2_CTRL_TYPE_AV1_SEQUENCE:
 		p_av1_sequence = p;
+		/*
+		 *setting below parameters to make AV1 sequence compatible
+		 *for the testing
+		 */
 		p_av1_sequence->bit_depth = 8;
+		p_av1_sequence->flags |= V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X |
+			V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y;
 		break;
 	case V4L2_CTRL_TYPE_FWHT_PARAMS:
 		p_fwht_params = p;
-- 
2.43.0


