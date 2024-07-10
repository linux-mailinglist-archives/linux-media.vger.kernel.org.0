Return-Path: <linux-media+bounces-14883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E48DF92DC61
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 01:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E257280C94
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 23:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B986156993;
	Wed, 10 Jul 2024 23:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzkvWggb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C0C14BFA2;
	Wed, 10 Jul 2024 23:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720652955; cv=none; b=ik5hp8Ffopx28IAtikMpKmvoGjzIFlJDW9d9w4ALH5NerVlO6j7IPxjHKpuIoieMaqT1wyRPhP+8lUgS6rnKivVnA+DCkdpCaVwgSjp1O4f3UiLVWrzu31OtKKQWgwMeKPhExy4u/SLQNiu8MlAzyoecXAmEbF+wH5GtwT9uz2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720652955; c=relaxed/simple;
	bh=iJc/bf8te2V4HIoUt6truxqDC2AFjane+tEtVaHMpDY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JGcNY8lPZLEKSON7opmVk2hdjj2NaMHJtwghS+LHqmYx9KHF9vWHhAHC6Mdrhi0uz4S8bXfsNzgqzkSfIJ/ISXkrZH9qJW0+x/LW83+VTkfXOto1PCb31TLwstK72quFiT9eNpFNGppKij/6cI6xlSEkw5nVS6tBqMDudshmv4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzkvWggb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214FEC4AF09;
	Wed, 10 Jul 2024 23:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720652955;
	bh=iJc/bf8te2V4HIoUt6truxqDC2AFjane+tEtVaHMpDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzkvWggbyqNQ25bBkRuzsc7yRc5uuJeLcyoqJ7BH3XhNJARf1iN49ojgIgAJ3GUVb
	 1sxWUQe3AA0ggfN7mskBEmkZkHHj7gac+IUx9GCGZ6tgmsYafqkRvYZQ9g2TwsCCBc
	 4fvvVf/Vnv0b/D41kVfp7Y944+js1nX+e3fzah1A6EOOmUsIawWd/SKgE72SMTxAEV
	 i87wg7Zs8ynt1PmPGp7fkh8ggrGJoqXrZCcxN055x4ZnAzOcaTtEXmIkeW6Z+yvNCx
	 BjBcnsFFU4hC9eEJcEWS81EjCe7Czl1kjK5gx4UBlXgZ1Ix/CSJtiKI9NpVWN51OEb
	 cmvez/ieukZiQ==
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
Subject: [PATCH 2/2] media: venus: hfi_cmds: struct hfi_session_release_buffer_pkt: Add __counted_by annotation
Date: Wed, 10 Jul 2024 16:09:13 -0700
Message-Id: <20240710230914.3156277-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710230728.work.977-kees@kernel.org>
References: <20240710230728.work.977-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278; i=kees@kernel.org; h=from:subject; bh=iJc/bf8te2V4HIoUt6truxqDC2AFjane+tEtVaHMpDY=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmjxSZUawcA9Ew7IpbCfivm2IRppHC3x5DpA7ZX H5tgKkNgMGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZo8UmQAKCRCJcvTf3G3A Jq+FEACCCc+lCg8Q5cP7rKh6vLWy0J5PTf6zKb7XBrrU3GuPjXsCH5LD7ugkdRRrDQhX+bQ+6Jw 2omDkASy0fmKm30Pv8LFrK64HdQZaOUVuhLsf9iCSmY/bPiVKjycqNq+JD3a/QsbmBxVxYddqju VD+zSxn2ZYkJ/cweO3g5c15VFm8jSe0zErw7wy6hX7YPvXhoth9DqA59zrUM/Wi8VhiDY2Wl64T T7BZsLn8SaDntoVrJKi03adr7A3bMpK95J19BvEgx+L8CQme2Q35jppbE1FJ38WYKH3fgfKFcFt 65K4spkwsxXKeeNXRxO2fvmsgW9Nisq/3hcezwuiOk16ZHLPE6S5r9qa45gUNqSxMXfqc3u4VaZ NHrjOe52IGNolMbQErfkFpxAdVGSTmiTFvvKmlsF2wzZv346MmCXQyp74qx0f9p4K7SyDx/202A uM+5F+jUQsrqY4z0TKmZaWtWPXg5b11ot25DLCcltlYJ1WpKmjFOxT5o30z9gKv8jFA9O+dVrx5 vBux7ANwfQOaCmtvlvBLimsg+yrpA/rFjR/BsnJY5Vxr87s6FlMQy9Ho2Npsv2/B45ieWIoMWVU WN1WyiuKU5uX4TQHmLtVq6Nj5DYPpWvsSltg6c3a2+Hjnv3zwdKiXlCe0ZA0TRLsHSUefGLYzfv z1CAA4/gYxcrozw==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The only direct user of struct hfi_session_release_buffer_pkt is
pkt_session_unset_buffers() which sets "num_buffers" before using it
as a loop counter for accessing "buffer_info". Add the __counted_by
annotation to reflect the relationship.

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
index 42825f07939d..1adf2d2ae5f2 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
 	u32 extradata_size;
 	u32 response_req;
 	u32 num_buffers;
-	u32 buffer_info[];
+	u32 buffer_info[] __counted_by(num_buffers);
 };
 
 struct hfi_session_release_resources_pkt {
-- 
2.34.1


