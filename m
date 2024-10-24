Return-Path: <linux-media+bounces-20192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F069AE407
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 13:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 293711C20DAB
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 11:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9B21C4A35;
	Thu, 24 Oct 2024 11:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OoL4mmMF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EB114BF87
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769817; cv=none; b=pAYNIhcqoVUG6nGXVV8jx8aOjlr00yhJ69T7J+lY79damiiYJXApCpmqE0sKNovWzMtOd3aervxMeEU5Y3xg3lCr6UfkJZDa101oeNRDmKhRECAcSooRuCHiw4kfxZNL8I5PUn2ni+K10o1lKux+e0sSHIQNpMjsspNBpRnnji0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769817; c=relaxed/simple;
	bh=FkaVl/k0+c8qRoUecYusPfH2kqxtduXBV7bO4Ud8pd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdw0tkIWCgJo5ceox+MLouS9fITSJnvGN5R8uPkOHLfaGqfeUJowAXUafG42Qx2T2XyzCz52U4thpngyWSQvbDZ/rCxeTuDsLA5Qh6EHgyBqosdEyAPhFV1OriGUxd2g48+UCaNOIqnbA1rcWBpYpKy4DC+zSca+BZFCJGla0Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OoL4mmMF; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so543878a12.3
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 04:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729769814; x=1730374614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6QjZNN8Y/dlyMadVzDsLnC6i1Tit1DVIZzSNzuvMe5g=;
        b=OoL4mmMFJbGr6d3YEmpTX1/OJF7552kK4dJmfNFGPCogVQRW2zCViTdbratpKjHssW
         Fc39KAAU17wIk+OAWRPMcIGY7AFLIVW/dhRKI2fcFsVnITq02ecnnDzfvfoCcOx+R9pJ
         nH+8vHqpIxzpB9rez02FYSSEXe7GhsGXwvZiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769814; x=1730374614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QjZNN8Y/dlyMadVzDsLnC6i1Tit1DVIZzSNzuvMe5g=;
        b=WeQgo32TGIuF5pYPQwg+MK201iHTUcUFN0izc5zLL7yxjUa3kmNBc3N3h7Hpnn8VWk
         BW5651QzH1j8DnQZE3IcTPONAHsMClv32SzhWPsftoRuNgU4+GJgg8sFBhyNJXAUoekf
         kwe/B0y1YdJBcrhEUODNEuUoQBrerIpt89EkePRFlB2VWRBzNqibi5HGhuuealtoEjLu
         QHIh2OIU2ms3j+7r4bmXhCQI/xhiNY+DUWrWYCR2EVziNsF/+3YaOROY3jFFfCTfXfx2
         IrLA2y+M4FIFaFA2Su7IBMms3qw05+fBkc4sLeACP3v4hOwfKJP5xydhNHa7EYibvW8x
         j0gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbeVv249Ltix2WDyxsLqBQMYvsb/rnDEV1lU4O4UYoMlpib0OTroNaiVndo3SRd6oU++Wxj0H+DMJZkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkXvkr++gizVhU5LcJC3NsSTP+c9B1AWr5byVEjrtCSjk/c9sI
	vVoAKAYGOlU207t2DBcXq6WQuaAnzp347uJehb98pwXQrxmpNkMoia2iqyFSFw==
X-Google-Smtp-Source: AGHT+IGkSkBjx7F5NvNj+PYlhHAmjKTRo9I0s8gGTWtZvBLnRqPxIv+n5g2t5dRP3XhBREkSho74nA==
X-Received: by 2002:a05:6a21:a24b:b0:1d9:2bed:c7e7 with SMTP id adf61e73a8af0-1d978b9fed1mr6718362637.39.1729769814427;
        Thu, 24 Oct 2024 04:36:54 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c7f5:2aa6:333b:bb6d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13eaa0asm7790117b3a.156.2024.10.24.04.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:36:53 -0700 (PDT)
Date: Thu, 24 Oct 2024 20:36:49 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 2/2] media: venus: sync with threaded IRQ during inst
 destruction
Message-ID: <20241024113649.GO1279924@google.com>
References: <20241024061809.400260-1-senozhatsky@chromium.org>
 <20241024061809.400260-3-senozhatsky@chromium.org>
 <4b96f1f8-e084-4599-abe9-05039bfac569@linaro.org>
 <20241024093916.GM1279924@google.com>
 <b9a42abd-a078-4740-b070-ba5c86855e73@linaro.org>
 <20241024100857.GN1279924@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024100857.GN1279924@google.com>

On (24/10/24 19:08), Sergey Senozhatsky wrote:
> So, we need to
> - export a couple of symbols
> - include vdec header in core
[..]
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -500,6 +500,31 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>  	return ret;
>  }
>  
> +void venus_close_common(struct venus_inst *inst)
> +{
> +	/*
> +	 * First, remove the inst from the ->instances list, so that
> +	 * to_instance() will return NULL.
> +	 */
> +	hfi_session_destroy(inst);
> +	/*
> +	 * Second, make sure we don't have IRQ/IRQ-thread currently running
> +	 * or pending execution, which would race with the inst destruction.
> +	 */
> +	synchronize_irq(inst->core->irq);
> +
> +	v4l2_m2m_ctx_release(inst->m2m_ctx);
> +	v4l2_m2m_release(inst->m2m_dev);
> +	ida_destroy(&inst->dpb_ids);
> +	v4l2_fh_del(&inst->fh);
> +	v4l2_fh_exit(&inst->fh);
> +	vdec_ctrl_deinit(inst);
> +
> +	mutex_destroy(&inst->lock);
> +	mutex_destroy(&inst->ctx_q_lock);
> +}
> +EXPORT_SYMBOL_GPL(venus_close_common);
[..]
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -17,6 +17,7 @@
>  #include "hfi.h"
>  #include "hfi_platform.h"
>  #include "hfi_helper.h"
> +#include "vdec.h"
>  
>  #define VDBGL	"VenusLow : "
>  #define VDBGM	"VenusMed : "
> @@ -569,4 +570,6 @@ is_fw_rev_or_older(struct venus_core *core, u32 vmajor, u32 vminor, u32 vrev)
>  		(core)->venus_ver.minor == vminor &&
>  		(core)->venus_ver.rev <= vrev);
>  }
> +
> +void venus_close_common(struct venus_inst *inst);
>  #endif
[..]
> +++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
> @@ -192,3 +192,4 @@ void vdec_ctrl_deinit(struct venus_inst *inst)
>  {
>  	v4l2_ctrl_handler_free(&inst->ctrl_handler);
>  }
> +EXPORT_SYMBOL_GPL(vdec_ctrl_deinit);

Would have been entirely too simple had I compile-tested
my patches, wouldn't it?

	depmod: ERROR: Cycle detected: venus_core -> venus_dec -> venus_core


vdec_ctrl_deinit() is a v4l2_ctrl_handler_free() wrapper, a one-liner,
so I turned into a static inline.

Compiles with the addition of:

---

diff --git a/drivers/media/platform/qcom/venus/vdec.h b/drivers/media/platform/qcom/venus/vdec.h
index 6b262d0bf561..2687255b1616 100644
--- a/drivers/media/platform/qcom/venus/vdec.h
+++ b/drivers/media/platform/qcom/venus/vdec.h
@@ -6,9 +6,14 @@
 #ifndef __VENUS_VDEC_H__
 #define __VENUS_VDEC_H__
 
+#include <media/v4l2-ctrls.h>
+
 struct venus_inst;
 
 int vdec_ctrl_init(struct venus_inst *inst);
-void vdec_ctrl_deinit(struct venus_inst *inst);
+static inline void vdec_ctrl_deinit(struct venus_inst *inst)
+{
+       v4l2_ctrl_handler_free(&inst->ctrl_handler);
+}
 
 #endif
diff --git a/drivers/media/platform/qcom/venus/vdec_ctrls.c b/drivers/media/platform/qcom/venus/vdec_ctrls.c
index 2b6b2eee619c..fa034a7fdbed 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -4,7 +4,6 @@
  * Copyright (C) 2017 Linaro Ltd.
  */
 #include <linux/types.h>
-#include <media/v4l2-ctrls.h>
 
 #include "core.h"
 #include "helpers.h"
@@ -187,9 +186,3 @@ int vdec_ctrl_init(struct venus_inst *inst)
 
        return 0;
 }
-
-void vdec_ctrl_deinit(struct venus_inst *inst)
-{
-       v4l2_ctrl_handler_free(&inst->ctrl_handler);
-}

