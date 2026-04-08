Return-Path: <linux-media+bounces-58272-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBLcNSKH1mmwFwgAu9opvQ
	(envelope-from <linux-media+bounces-58272-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:49:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8F43BF150
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F3F13095F7B
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 16:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6F73D3009;
	Wed,  8 Apr 2026 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YnRheqO+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E23BAD8F
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666644; cv=none; b=jo+/k4ikKzwsG6gcZrCJIkA2f3+4rCmqW8AQqcp0yyqQrGTwvlQZfeXy1fDqPro9Uhveo4xR8FL3pax86s0MIdqlaCe4lJkTvW680ww0UZMjtXqvULe2OmsOXiFnFN3+l/JKU5+lZ0bnB1ZyG0XStzG55gyDBFVqpVRn/Hgu1sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666644; c=relaxed/simple;
	bh=pHKyPIFUSfQb0bp0ZKG3yIfhrCTjykMJRoh2sBNViH0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V2DYuVxtN4Y7ql88obd5Dfevl8OytOVXCJynzi/RcfqnTT8CsT6JzbCTIOEinXMOYlA8+tZnbsIgsMq61IOdVEXnzKF8JOFG7Cnt2UA2olP27dmTdV+wH0VQrc+VYuGkAygwqCM6kCGOTe47n4pacY+y9lE6oxc+/ff+KP3+VGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YnRheqO+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso219885e9.0
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775666641; x=1776271441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jEUkOqpmhVMv8LaBp7+L9Aw2hBHRX5x6gSJKztcEJsk=;
        b=YnRheqO+50QyxD/PjAfBjvq8p2SBmqWv2UIS2mp7zMoLWsOyoJgyimWr5WLtV2unPQ
         /3JkPouqcWVIsNXrVLOq9cXuFLJbbyuoaNcPGGJ36Z1wuxrr9uJ7dr7T6FxPhNdshBiQ
         0s8C2taOAlZmExIbZSwxYfNXOwU3ri4ZTYWGgBon8hEee7e+6ZzXEqE8peiEsB6YtIK2
         bmzT1jK1r4lrf0ejvVBRFqQqgJrOnOTsmkTyyRJ3Sbc9wVngavX1r7i9Ywu/94k+LZfl
         d6fWDy6OAassdzua4z7spKBt6EtE+6/D7oAVs6cjMQ+LCcD+z3GPfDR6Yda9ug9HP/O/
         SmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775666641; x=1776271441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEUkOqpmhVMv8LaBp7+L9Aw2hBHRX5x6gSJKztcEJsk=;
        b=o2GHBj00hsiIornTdPqNjDxSsvYKnV/9u5SnQ2pT0z2B+rcvMAaw/d6ivcOxigftlq
         g1BxavipRZ+OpQQiVxnV/C/uvD/AhSNDYSLP0PgaiRSTwAOM/nepc6nyeRfbQGGkYmZH
         u2x07IkD+AnPm9QYcbU1Q7PGMyjBVFpUaMgpQrYG4zoSP+3SD5y0Dw1SDzhBXoRmhIC5
         C5J3AoD2BFoa7dWtfRpDpZw2LNTv0suYUrUTosN2NqgHZ4irWUTMIHVSFEGbgSGpcmxm
         f/IVYeIJ5+HzHpE2fDtLe4Z8/20zNWguF03jwHN5Jtn1A8DFPfBy322fS9n2LolvUpmf
         O7kg==
X-Gm-Message-State: AOJu0Yyg+49OMY+ylrTuBU9qEXTrWGT3dwjGiVilZ2l73WLnsBIMu/V6
	c6xq+K8plt8nafYbI0crVR1nqY6C+2DA2qvKWL4ASiPCFQLcop+F2HGUnwq4kSYOMos=
X-Gm-Gg: AeBDievjM+omvxmJ/vzHagQlBFghDRQVLOnfiNh1hPz8f2NDmyuUK8RjQyfltVvsbEL
	TVtVkdJgBwXBeHAYpzOI/vJSUevTYVHQ3E7mKskZw5WI3kK4M3fJ7tqzjmaF8S+Hb7ShiHOK33P
	Uh/agC+qtpyoPCI4nGJ3TrUE1lZ0MSpBFSCcMr8NKWoaezbvQa5xbCW/KcbIJRmBIO+uBtIIBMc
	2OYx8icTqtmkGEOursujBeZbun7qSXoPE1ycuM3P9KDADzIf/js8R4yuwR4Urg/IuKznq/Omwc4
	AJ0AbHJl2Mm0En7dgKwh+GH7oD6PMoas5NsircqiatJ/654iorV/PqQOurYaCFFcPx8xtvuDHjb
	OxJyM+Af1ZS/05V+Sdmb8LU1u19Lm7Gs7sutOiZ5+kXVP7gVvjChUidw+zjzrGOFPVkPiNYPqEF
	+Bbl6DGajrPLR2Dkx9I5+8U+eVy4+yDbjjc1Wo8IK9ffsW
X-Received: by 2002:a05:600c:6cf:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-488a825003fmr116775895e9.22.1775666640603;
        Wed, 08 Apr 2026 09:44:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd17be0csm1388065e9.18.2026.04.08.09.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 09:44:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC 0/7] media: qcom: iris: add support for decoding 10bit
 formats
Date: Wed, 08 Apr 2026 18:43:53 +0200
Message-Id: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMmF1mkC/yWNQQ6CQAwAv0J6tklBcNGriQ/wajxAt2JN3CVbN
 CSEv7vqceYws4BJUjE4FAskeatpDBnKTQF878IgqD4zVFTtqKYWpzgqoz3buSHUpIYl9TqhF45
 ew4Dkat527PauYciZMclN59/iAufTEa5/aa/+ITx947CuH9FzgMOJAAAA
X-Change-ID: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3361;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pHKyPIFUSfQb0bp0ZKG3yIfhrCTjykMJRoh2sBNViH0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp1oXLXzDI9w+7Jivak5yqOH8Ic9C/KNci2XOomH7R
 t0sBuEeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCadaFywAKCRB33NvayMhJ0XzYD/
 9hfLV1YuqUF/wjR2gH/3U7JBLRHyQvOkdVqJ3iH08VRezniCKAPNOAfVj1ZZfa+hOltsFcoqsssDRj
 MV3x6z+YpviDJXhdVoUlAoJX5Y5xAf1lJgUcyqoDxvxAIp7O54pHp+VXBcOHeHtlYK2LvxrvGBQs+W
 E9JUekwEJfjN3NND1QfOAuCROoX5y+//x5uNvnx/eoVM7rs4mfkE/FFXOHOcRN+61sRFwomvWnyICi
 gFbTTa02+/OOZo/RExpWUEFI8Z9XTEbjT1dIZx84+7gSaoBFETQ0ev+iTuFKk7jxo2AvpGceJgmI8l
 a1vzGjj7myCwV0QcZPKne9B0HIUR73usw2J0z6eAcypRH1oAcfclPDy7han4kCjhizniYIZ4FY0dtk
 oyIEloA0wM4Y+rbvcDYqlr/HWUfNnKmiDyqLwLb9ZZys4FfiiuR/XqeIh3/SPPCnSVI+eSLrYil25L
 ANArZrRqfbDBwDiMlcr5vCS+z3oWw55akGTM0w4SlT4lckF/ci56TAnrs6i94TJ2CS6eVaDFa3AK42
 qylxWJ8Z45aH2puGSiwtf8TVRgIe1F/epKyAkxgO1vhOh6i3O28n1apIS3Q7H9cidzWtSeLu+MBk6J
 wtHEY3wGqkclWEsA88yTVyt+rDsMxOWc9myb5FijBslui9MkloOh/Nv1vYaA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58272-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3B8F43BF150
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds the plumbing to support decoding HEVC and AV1
streams into 10bit pixel formats, linear and compressed.

This has only been tested on SM8650 with HEVC, and was inspired by
Venus and the downstream vidc driver for the buffer
calculations and HFI messages.

I was unable to get 10bit decoding working with Gstreamer
and ffmpeg, but v4l2-ctl works with:
v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10

The non-10bit decoding still works as before.

With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
and tranformed in v4l2 header format with [1]:
ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
/path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr

The frames correctness has been verified buy displaying them
via Vulkan DMA_BUF import, including QC10C and QC08C.

The support is probably incomplete for other platforms and
I'm unsure what's required to conform to the V4L2 M2M stateless
spec, especially since AFAIK the decoder doesn't support
decoding 10bit streams in 8bit pixel format, thus the RFC state.
Review is welcome !

[1] https://github.com/superna9999/pyv4l2compliance

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (7):
      media: qcom: iris: add QC10C & P010 buffer size calculations
      media: qcom: iris: gen2: add support for 10bit decoding
      media: qcom: iris: add helpers for 8bit and 10bit formats
      media: qcom: iris: vdec: update size and stride calculations for 10bit formats
      media: qcom: iris: vdec: forbid g_fmt while waiting for first source change
      media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
      media: qcom: iris: vdec: allow decoding into 10bit format

 drivers/media/platform/qcom/iris/iris_buffer.c     | 81 +++++++++++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71 ++++++++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 35 ++++++++--
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  3 +-
 drivers/media/platform/qcom/iris/iris_state.c      |  6 ++
 drivers/media/platform/qcom/iris/iris_state.h      |  1 +
 drivers/media/platform/qcom/iris/iris_utils.c      | 16 ++++-
 drivers/media/platform/qcom/iris/iris_utils.h      |  2 +
 drivers/media/platform/qcom/iris/iris_vdec.c       | 70 +++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_vidc.c       | 14 +++-
 13 files changed, 285 insertions(+), 18 deletions(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


