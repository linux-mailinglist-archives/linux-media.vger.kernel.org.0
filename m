Return-Path: <linux-media+bounces-2977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965BD81DB1E
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 16:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34B04281F9E
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 15:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7B86FB3;
	Sun, 24 Dec 2023 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MnkQfLvX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE3A6AA4
	for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-554c84e027eso466381a12.2
        for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 07:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703432669; x=1704037469; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BpUTZ26BBJ2KtjvLpLotlMUkSiHY+YQV+aTAoUEXUm4=;
        b=MnkQfLvXwo2bwuc6KFbmlqtEyO3nJ3w/RAqtDoBehAU0LZLroaS7HuBGrm2ox11Rtb
         aC1+XEEqU3i/SUYcvCYeK54FjaepwlR56GrdqTuyUheW5iq1dnggJCBLI49fMwV+IGtE
         WV7YGNhkxCDamALk9R3McgRjA55zkxNetNILhftrm4bayBGweAqwoiLEFwdjhNYuXFZJ
         MfxoClPz+k4VzpOJR7n9UtWmC9F/ChjX9gLvN/9Aiolr5boB4NY0pVMfy1u3CBkLS9wc
         xFjvHE8SWUGfp4S5/RANvy0CFNaPMh/06FNA3IS13xj3GdbaN7y6Ajh19rJAWdgAoRue
         U5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703432669; x=1704037469;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpUTZ26BBJ2KtjvLpLotlMUkSiHY+YQV+aTAoUEXUm4=;
        b=KvdpUj1D5vsBOF5Q49Fy1I570u9Bbf2JPGnaOMWvsRrhaCtf5BtDe4uE02HkpR4cW9
         SE7cXzdpI4wNhzq/vvOO5/VHYIvAiNDpn9Mn3TI6wFNMWzkB2/7PUM3KZ1RMBP6oa42U
         WHd9S89S2X+oh6+J81lWm0c5vokpKrfZp2AdsviQT7Sjbs9pjV8h6T9Tukne0YU0Yx1Z
         HXC8VwVFepjAUgba1E1n+vwwjfAYL2F4aMGq+4W8zlDNuA0cvZ0M12esamA0cpIQ4KbZ
         JBzdnSArYYNKIE4a0cuOuyoS5L358lv3p/Yh50BYnEtIDpdv0lvKyCpOmKN5BmR3Mykn
         WN4A==
X-Gm-Message-State: AOJu0YxZjx9kpUmRv9qiRnogtAvYcn3wuCXMT3ok5xmYTcI6PJAK1E5E
	QtdQYlvpAEqbtceTJIoMncCmGjwNCTgOPw==
X-Google-Smtp-Source: AGHT+IEH24meZeNERftgsonqpzHQ1smIzL2b5etVzc+mcpJmixYWNdH0Kf56A3hoS0G1JwhK5+ks+g==
X-Received: by 2002:a17:907:6d0f:b0:a26:e014:1446 with SMTP id sa15-20020a1709076d0f00b00a26e0141446mr375731ejc.85.1703432669117;
        Sun, 24 Dec 2023 07:44:29 -0800 (PST)
Received: from [127.0.1.1] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id ge12-20020a170907908c00b00a26ac403032sm3325901ejb.65.2023.12.24.07.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 07:44:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/15] media: s5p-mfc: cleanups
Date: Sun, 24 Dec 2023 16:43:59 +0100
Message-Id: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9RiGUC/x3MPQqAMAxA4atIZgP9U9CriIO0qWawSiMiFO9uc
 fyG9woIZSaBsSmQ6WbhI1XotgG/LWkl5FANRhmrjXGYULoT9+jRH0kuDBR7NVivtHJQqzNT5Oc
 /TvP7fjuOIfphAAAA
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Aakarsh Jain <aakarsh.jain@samsung.com>, linux-fsd@tesla.coma, 
 linux-samsung-soc@vger.kernel.org, 
 Smitha T Murthy <smithatmurthy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ee4JhC14g4/ACR7zxqUCxgxhtO+fSgleMTyQadnTBww=;
 b=owEBfgKB/ZANAwAKAcE3ZuaGi4PXAcsmYgBliFHO7htaiBtZoW5FbkrOUmoArGwSMo2j8f1yq
 CG3GIJV+T6JAkQEAAEKAC4WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZYhRzhAca3J6a0BrZXJu
 ZWwub3JnAAoJEME3ZuaGi4PX6WYP/1tzDS8Pv2o9ZS5wshdo7hoqXec2csMH2zS3oLRybMa0X+u
 1iVG0GvLgweW8EgArfjYhu7co5RhCxN5q0AY0hc60Wd4h43i1s4+4PgvkMdjGrHgKW+cqm7y7yk
 buBz3ETYgotBFR4gxn5zSZSzQPBcpEoqcR+UsX1Z8zp2F+M7P6PYNoA8rk1qfF+7yXaiOg6qxf3
 Y3/O39OB/39z0mA5+dZY3Vzjmx/riSoSsoFSXjK9/mxDB7YaPzXt45SfBAjYhOSq3P5thGKXeko
 ZaqH2Mw02E155rYgb9gxQZ71BoNV4qNmbdZrvkaSw/coP1y3ty2ufyZGt8j7WtOf2nSJ3UVUPIC
 y0C+LwnWmONeWpwZPswxbD9Nu+DVlJR8F73NAms7EaPtXW9cDxl/ELA/9iNmgtcKVWe0DyiNCa3
 I7MKltXywbzCBdARWavM1UeHWICoWXIBFbKYyeesNz/aU7LtV8+B9LukxwLwYkv1txKbrMB0+P9
 ANq7/vDhVZdtGRQ6M2tESdnOQU/PQXeNv1tALfE3tDFXCcd73tbcwzJus0WNd4/J2Gm7+4BXtt3
 fzrhNGdajs+e4t3ytiHLaa3EV7KO7XbN3HYCP/j5Re8NwgPL3q4GpEP9GWEhV/OCCi7EUFJtbse
 fN4rd9lrNWvrGQpGsAu1o+l9boxBE7s0qNOSI
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Few simple cleanups for Samsung Exynos SoC S5P MFC drivers.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (15):
      media: s5p-mfc: drop unused static s5p_mfc_cmds
      media: s5p-mfc: drop unused static s5p_mfc_ops
      media: s5p-mfc: drop unused get_*_def_fmt declarations
      media: s5p-mfc: constify fw_name strings
      media: s5p-mfc: constify s5p_mfc_buf_size structures
      media: s5p-mfc: constify s5p_mfc_variant structures
      media: s5p-mfc: constify s5p_mfc_hw_cmds structures
      media: s5p-mfc: constify s5p_mfc_hw_ops structures
      media: s5p-mfc: constify s5p_mfc_fmt structures
      media: s5p-mfc: constify struct structures
      media: s5p-mfc: constify pointers to s5p_mfc_cmd_args
      media: s5p-mfc: constify local pointers to s5p_mfc_enc_params
      media: s5p-mfc: drop useless clock refcnt debugging
      media: s5p-mfc: drop useless static s5p_mfc_dev in s5p_mfc_pm.c
      media: s5p-mfc: drop static device variable in s5p_mfc_pm.c

 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   | 76 +++++++++++-----------
 .../media/platform/samsung/s5p-mfc/s5p_mfc_cmd.c   |  8 +--
 .../media/platform/samsung/s5p-mfc/s5p_mfc_cmd.h   |  2 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.c      |  6 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.h      |  2 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c      |  8 +--
 .../platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.h      |  2 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_common.h      | 14 ++--
 .../media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c  | 26 ++++----
 .../media/platform/samsung/s5p-mfc/s5p_mfc_dec.c   | 20 +++---
 .../media/platform/samsung/s5p-mfc/s5p_mfc_dec.h   |  3 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc_enc.c   | 12 ++--
 .../media/platform/samsung/s5p-mfc/s5p_mfc_enc.h   |  3 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc_opr.c   |  7 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c      | 28 ++++----
 .../platform/samsung/s5p-mfc/s5p_mfc_opr_v5.h      |  2 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c      | 36 +++++-----
 .../platform/samsung/s5p-mfc/s5p_mfc_opr_v6.h      |  2 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc_pm.c    | 51 ++++++---------
 .../media/platform/samsung/s5p-mfc/s5p_mfc_pm.h    |  8 +--
 20 files changed, 147 insertions(+), 169 deletions(-)
---
base-commit: ceb2fe0d438644e1de06b9a6468a1fb8e2199c70
change-id: 20231224-n-s5p-mfc-const-def6093c0104

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


