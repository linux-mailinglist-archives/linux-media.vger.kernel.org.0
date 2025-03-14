Return-Path: <linux-media+bounces-28253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A657A614FE
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCB0D1796CD
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388272063C6;
	Fri, 14 Mar 2025 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hc4OwL9i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0191E205E06;
	Fri, 14 Mar 2025 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966215; cv=none; b=Zj9zEVxZ6f7ae4kWwabBR4uBZ2c71xLuw6MygxRmXHEEcPb04KT2niAxko4QLO+XMaTOujr2qd0I1oqKMQVlOdo1uiUEHigXaCEtVuKlnBr7YQXS34Cu5OmnC3lmApQoEXe69Lj0SMZal5PZ1uYPzT+rs7s3eqsrSLi8/Pc3ab0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966215; c=relaxed/simple;
	bh=zT/zsO6S/pvuNe7KF+I9+O2nxoGs4TW9kijvWr6XPRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WEdj7z4YqgdSNb2uloiBzOFMNihBJ0/3qUrLiwv831QkWtK7VpAFffwqndRh4CPnKOXBDHsRS2dLyf0etiZMrFtjXmLVDvkakjXUMmMyK2oZMB/6CEpusm9ymgCdcIIWJY5hLzkxomcJdX+oXu7VgDla09a3DMkeVgEvtF6zLIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hc4OwL9i; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30613802a04so24230881fa.2;
        Fri, 14 Mar 2025 08:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966212; x=1742571012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aus8alVfcXgy3DqFGnPFZeSY7UCOW1F3b7m6nzhuG6w=;
        b=Hc4OwL9i3zF0/xt/N0SZqn3IOFDMYzvBblnLw1Q6k6cWDuk5V0jFK7ydi1u3zjgAT/
         Y3DJnTFwMzF3q3ru7vrESCAiIK8QDk0md3th/NPtZstVMmEZyvP8/ZU4ClXQ6YMhKFzD
         Ny9CkLPGJ4cEzlNI6ZsHjnOVimIAqXLZqTg86cYVqnC42HoNrL+mosKmSQApdkIHbqRu
         EUew/dzGJmvin4SIVIdcCu/wKoZutftwpEza57J7nxL8UJpGgeavkfLjQdnYalfpJihf
         7MzBOZ7coJTVeERNHDw+DR604sfvmUpmLu9MM9B5EBwX4EGgZ5zI04U0xsAyOqn2eGVR
         dFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966212; x=1742571012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aus8alVfcXgy3DqFGnPFZeSY7UCOW1F3b7m6nzhuG6w=;
        b=D231zGmRf5X3/V9jbERQyQmHbZ7N4JCoRGPY9hEZtpKTWkYOR/s02PaDZ9+OVIj/hO
         OkMfc/FvJfus8+mFnWFMtUc8nxMSOGIWVCZnxVlodctg/Iiyyaz9C+4b7YaQYhJ/j4u7
         kDGeY1PSi40fTnIzlB55qMdukTsu21R1TbnbxGDe+Ryu6RC03rE12A/hdtet1mSqj5D+
         de5v2ncoh4dmQXUrppVhMVZ4T8bDCC/4X2d91UA+l8gwBhbva6OedBgSA2pkL7/ImzAH
         2ibIf0OMPph65XAo3CkdqgFyKCaDReqhr8U9TvbKxaM78u7a4EOk/aBJs/j/i/yLUxGq
         NYaw==
X-Forwarded-Encrypted: i=1; AJvYcCVhYaGCdfyU/ABRvvdHXKUqfgIYF7XBPNQ/UCBkwKFp1ce1J++o4KtAO6fTx1dkgKrZwdHY2JBfpG2+EPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxxkSND83K0ICRaShTe7AgQMB5PouplYtFNnUixl9qYNT6QEU1
	52LMM/IunTT9yRA+KghcdK8qPOihkCXsFHJLmn7b4xJCQQhJo8o+tB0S8gg2+EI=
X-Gm-Gg: ASbGncv4abFAcq16Yq+tOD2IRJdS7tmK1dLXWomCM27TyFjBQp85hdBe14h6RL/6vvg
	Jswd3QGw4SN/YiUe4ARG/cs4cm0ha/U7xi8DMLsJHQqpAf+VSz8nOzQWe4nBQ1sP2gbJHynO5LO
	QYiBMfOKhUe1jw/0dOugdf027XwhHmbnNqTK1gwUXjDbaC9+jPIb5/5mBX9wp3p8luVftAlSXfK
	hz3ne0mp5MZik5Q9qFFju4iyOmJ/OTNojmPjvKPyPglmbFtXqYAUbrEDllPKnQavEwvVOnEOGgP
	Z7l8mJ0ldU7/JZZLJHsqabHinLCeX/FSCJm6lGeua3w+Po96BchP1JrKn1lPCroLjZM+
X-Google-Smtp-Source: AGHT+IHDGA1iRf5cQswq6YP0aTuAv3KX4SeuG85fRkdGYV/K/6Lw+81yDy76NoPUfIAlDDyp9hZarA==
X-Received: by 2002:a2e:be8c:0:b0:30b:b9e4:13c5 with SMTP id 38308e7fff4ca-30c4a754748mr11155011fa.4.1741966211563;
        Fri, 14 Mar 2025 08:30:11 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:30:11 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 16/18] media: coda: Update default velues of QP for mpeg4 I/P
Date: Fri, 14 Mar 2025 18:29:37 +0300
Message-Id: <20250314152939.2759573-17-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Yakovlev <vovchkir@gmail.com>

Use average values of QP range for mpeg4 I/P frames.
In such case we get smaller size of output buffer
and average quality of image.

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 9ca459793050..3782219c8a2b 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2379,9 +2379,9 @@ static void coda_encode_ctrls(struct coda_ctx *ctx)
 			V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
 	}
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP, 1, 31, 1, 2);
+		V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP, 1, 31, 1, 15);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP, 1, 31, 1, 2);
+		V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP, 1, 31, 1, 15);
 	v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE,
 		V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE, 0x0,
-- 
2.30.2


