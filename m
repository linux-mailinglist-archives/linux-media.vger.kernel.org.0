Return-Path: <linux-media+bounces-20153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C1D9ADB44
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 07:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BBFC1F22D82
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 05:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1EF1714CC;
	Thu, 24 Oct 2024 05:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OjJSTuuT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76497170822
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 05:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729746822; cv=none; b=bRbQU+ALFnpVp78YGSEMBdb24HKEQPGWwCSZ3P3E37yvuBgV/nRq3jFnHWANRD05H219bsWT+ykLS3yJGx+6gRp5h3bxzdZuJVvf2MxFU3/5sxcwuA7x61HVHSp+YZTHOnUYRSU/s9P3OLaR+qvsDJPjv/26YoWbidB+vlyj+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729746822; c=relaxed/simple;
	bh=KvIOBcsqTKCfgbFf8aguNHQ4cSK2bYqgnpbbG/lpy4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bww9fON7uY3JOM0OnXcNdgev6boiRDKEjdkePnm0wFk+1jHOE0cetATkk8lxyfVxknG3dxl91CPkADidz8Yi4buXFiO0rM6yOQ0010s5j6HH3EXIib7UVHVXyDLUjfqKzBgoyyTQPQEW+mJ1zFbPHrm29met/RPi5jMyAlHiHK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OjJSTuuT; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2e87153a3so388814a91.3
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 22:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729746820; x=1730351620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/4WbTxnzMcJJAIXdQb9GfxvzXKK8n8wAdqQlmugKoQI=;
        b=OjJSTuuTAlaQyaGEjto8QoogXfAW7N0EygNy9CIpZAGLcIodEqRRdObvWfZKYv6h4t
         zJBhdXlcZNB4Psd8jPlXrw1gK/kthZDM8jib8J3DQcoO6ySrDDukzBlm4MQ8udisfcQ8
         le6WGj5PNMxQC9UmgqabQO7O4lL7vNyCFL0iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729746820; x=1730351620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4WbTxnzMcJJAIXdQb9GfxvzXKK8n8wAdqQlmugKoQI=;
        b=JxfmNW8T0+r1BVN7Q6qWATJ7l7Ei1C7nNh4Ev6t/0BLjb663ZBbjvowg5jWuUAi9//
         ZVYIcsVC5jqxk+WjdA6yNuOy3+gZuUtx40sMZ2L7mVXRw4dLSuQb3SWNyh55WxaCPFSS
         FPws5MSIj0ku/eyDT6B/KxN9j+FUQXCmH66SORPLQrkIHL7A96OeOD8nsn/zkvv0LQVd
         xa+OoFS8hPbyWBZnPueJTlDL+L4l6E653uBDlPEeIZZ8gfg+IqiNe8VUJR3rlsZBT4iE
         b1Z8nZyN2/KnD6DA1Qyn6/SCB+QiIAwOoFGXtZIbRjL5mKooVbiuqCX7Tma9nhuur5o1
         sfhA==
X-Forwarded-Encrypted: i=1; AJvYcCW7lA2fSOq2Tk5GLyE/nCcttUd8rBGYuEO9oTr66aE8Lj39lCbt8+ky8zYqljsZFMPWKHzAYfvZOE9lgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAqWzmgc1EHfRSOJbs/x/0u60HPPLZKKtmq3oCr+s4cmhjCH/F
	U46osvoujdQSq/dJJXXJSGVY5tz6QFMWvUtC23DOwDdoEVRBP3FdsfcNDF95fw==
X-Google-Smtp-Source: AGHT+IGumwmCw1rV5PRu0lp/TGTbXVP7gkcRIhHfwPSr1Ig969clG6+LhD+f5d3PcaGae7/eS3Dmng==
X-Received: by 2002:a17:90a:6284:b0:2e2:b45f:53b4 with SMTP id 98e67ed59e1d1-2e76b6e4998mr4923514a91.25.1729746819780;
        Wed, 23 Oct 2024 22:13:39 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:9422:d958:f749:9a30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e48e4a2sm464162a91.2.2024.10.23.22.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 22:13:39 -0700 (PDT)
Date: Thu, 24 Oct 2024 14:13:35 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: venus: sync with threaded IRQ during inst
 destruction
Message-ID: <20241024051335.GK1279924@google.com>
References: <20241023052444.139356-1-senozhatsky@chromium.org>
 <20241023052444.139356-3-senozhatsky@chromium.org>
 <20241024045836.GJ1279924@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024045836.GJ1279924@google.com>

On (24/10/24 13:58), Sergey Senozhatsky wrote:
> Date: Thu, 24 Oct 2024 13:58:36 +0900
> From: Sergey Senozhatsky <senozhatsky@chromium.org>
> To: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia
>  <quic_vgarodia@quicinc.com>, Bryan O'Donoghue
>  <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
>  linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 2/2] media: venus: sync with threaded IRQ during inst
>  destruction
> Message-ID: <20241024045836.GJ1279924@google.com>
> 
> On (24/10/23 14:24), Sergey Senozhatsky wrote:
> > Guard inst destruction (both dec and enc) with hard and threaded
> > IRQ synchronization.
> 
> Folks, please ignore this patch.   Stand by for v2.

I think it probably should be something like this (both for dec and
enc).

---

@@ -1538,9 +1538,25 @@ static int venc_close(struct file *file)
 
        venc_pm_get(inst);
 
+       /*
+        * First, remove the inst from the ->instances list, so that
+        * to_instance() will return NULL.
+        */
+       hfi_session_destroy(inst);
+       /*
+        * Second, make sure we don't have IRQ/IRQ-thread currently running or
+        * pending execution (disable_irq() calls synchronize_irq()), which
+        * can race with the inst destruction.
+        */
+       disable_irq(inst->core->irq);
+       /*
+        * Lastly, inst is gone from the core->instances list and we don't
+        * have running/pending IRQ/IRQ-thread, proceed with the destruction
+        */
+       enable_irq(inst->core->irq);
+
        v4l2_m2m_ctx_release(inst->m2m_ctx);
        v4l2_m2m_release(inst->m2m_dev);
-       hfi_session_destroy(inst);
        v4l2_fh_del(&inst->fh);
        v4l2_fh_exit(&inst->fh);
        venc_ctrl_deinit(inst);

