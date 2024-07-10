Return-Path: <linux-media+bounces-14881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7F292DC62
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 01:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AB80B25761
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 23:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21694155CB8;
	Wed, 10 Jul 2024 23:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JF/yIWfa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B7F143732;
	Wed, 10 Jul 2024 23:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720652955; cv=none; b=peNZQ+BJ3BZKhdK3EaIe25ej3dxMhooAYgpl274NK0SGlUKmSXm0FuUCUmEJgn0JDmGM+wFXqjzKcqCtfRC9zNisf65KnOwb4gFMq6/6x5qZPnmOmAbZyZzxiNZJukIn9D5w/uemygcqkFD40t9R+TixAFVXGkfMdHmDeIZpK1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720652955; c=relaxed/simple;
	bh=Cmjpd3UBqMGnmALQq0KMRUdneJYAdVb5qLYWbvhz/J0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TKY5AtFNqft7l/SRexmP2aLC7vUKNSZzYH9foFhhdLohSaHiLDHucLnizPXqBXoUl3Vt4IAZBTQzSOFkEElWN/yRJRoL4vD1KEippSuJ8tJ6F+WLaBblC4UczNAiJ7d6S3D9ChbFZ6FZzSkNb/fr4u+xirrISD1OGFjTVFgqiVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JF/yIWfa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E589C32781;
	Wed, 10 Jul 2024 23:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720652955;
	bh=Cmjpd3UBqMGnmALQq0KMRUdneJYAdVb5qLYWbvhz/J0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JF/yIWfaH19g/M5+bESbCWC/+ACvp4/8Vsnd1YVFPuiOucYB22O1dyVYR3lZs/siR
	 VO7hS7wOkxznnNya7wHfEOKpGFMWxdTug/4mIX2yqMpxijhqz6Ve23MBC/M22RvsUo
	 CMcweakO+l2+J/O1jjyCk6QbTH7epl/uI5hHX6Sov/9wfJf+wSdKQC4dyU3VF+375P
	 koZ8fw2Ea0jgYIzMUuJNFnTYCArKugHxVW+AYvcZAt0ku3hPJD8ptwDmUp4qEp8ruo
	 Nc1hmqafFxT9fm/Uc9zSGAvFZk8tBdCM0AOB7ppBB5JWgcYuJUjT5IIfS4bR6XnqhL
	 XrI//ct6GCXMg==
From: Kees Cook <kees@kernel.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: venus: hfi_cmds: struct hfi_session_release_buffer_pkt: Replace 1-element array with flexible array
Date: Wed, 10 Jul 2024 16:09:12 -0700
Message-Id: <20240710230914.3156277-1-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710230728.work.977-kees@kernel.org>
References: <20240710230728.work.977-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=kees@kernel.org; h=from:subject; bh=Cmjpd3UBqMGnmALQq0KMRUdneJYAdVb5qLYWbvhz/J0=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmjxSZJHfN+D7Or0gqhRKWCoE4jDekzwc41r+25 yWWx9CezLeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZo8UmQAKCRCJcvTf3G3A JlrBEACQ9GLgH1uh6oyt97dALDLvy+CJ5c1XPFJOMUA6rdN/sWkbL9J7DBTaM0YsYGjJTEHUJ1+ 9MMLSYpyFEOISWE2pCphkhCrddaY5FG0NvJtKYjYfkfTnuA0EPpavc0wimdaFKtgjGoqiW0EpSs 3hMFrP5D4q5Yfxg6TZU5t0JyUs9pKowCQ5OylEF6l38Nbu8EHZ1ATj2cuh/He5BSq1As3D0LR5B L08p7te1hvQAdXww/JIqL0BbaC9Tnks8woJw1WXNqRk/EFDDQWe0iv1Vl85ID2KO1k0COaO3pC8 5DruxjqyQTdYKg10qTmkf06XGkCi/ZVfYvxVCHGWnDz+8X/uQkfC7BLsIh+Nv+d+PQNJ388ijPa ag3atbD22Ok7Ddtj6ISFO2eBELGwSBPK2VopxhW2NApoYpkZIxt9W7lYQBfkylxDHHkkJ9kYfC9 d0f48hI+PQfI43dPx6KPXrFxaBJwXKDC3hABO/4r01kjt9+vZApne7/o6mF60doedgbw50GHjPx ESAx1tAhFD5lvT1pu/WYbT8dKaP56hnSDR3TJXcbH3u11/suO56bX+sMj1rq7TAwGVGdEboNlZ9 vPQVuVpXHn8uHKdx5ZjcvzPR670Y3zbLU0fuhy8KP0umtmwccfgw17rLmS4RDq9mzAxOj2fKYQ5 S0HuiiSHZz54GQA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Replace the deprecated[1] use of a 1-element array in
struct hfi_session_release_buffer_pkt with a modern flexible array.

No binary differences are present after this conversion.

Link: https://github.com/KSPP/linux/issues/79 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 20acd412ee7b..42825f07939d 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
 	u32 extradata_size;
 	u32 response_req;
 	u32 num_buffers;
-	u32 buffer_info[1];
+	u32 buffer_info[];
 };
 
 struct hfi_session_release_resources_pkt {
-- 
2.34.1


