Return-Path: <linux-media+bounces-23848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED29F8CA4
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 07:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E60C188F09E
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 06:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B54A1C0DD3;
	Fri, 20 Dec 2024 06:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mOafRf8c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543FA1C07D5
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675683; cv=none; b=boVuCgGZmwC+mHvQWh0UYGp946k4OUSOKrxRwF0cb/eMnEpkkBAhCtC7d0dcEFX4RFPnmBErT3i5mWioubbiO7SGyXaA53zDG1kMAkQbqLmxkGBUcsNNR/KTcQSSzAO2o1BCIzs6KRGaDStSak76RUXj6A91UHsDDersT2BtTcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675683; c=relaxed/simple;
	bh=AUIpkjYlokg6+zWgmU+PFChYT2vUanC69W9X19gb9Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8BUpR0E+k1rJyEzt5LsEhqFWbg0WQGcVgEv6Syov0d7gXrSc1eOqsysWJOjgdQc369L1GcWXjAGql6Oy3qvKwCc3mbPSrzBs83oBLh5gIg3Fqk1306VbGKI05cow657OGjIvtMhvg9pLWqOb6PEPQxg4rTVnbe56Jq6L4gnw+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mOafRf8c; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-801c7e6518eso1021279a12.2
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 22:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734675680; x=1735280480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOGdsmjkf/ZsaDTg5QmeQIHE5bE9RT/o4cYwTbhD1UY=;
        b=mOafRf8cNpbJ9HOblwOAlEk/cEqDhzKn3FfP/a5ACPfjl07wQvGxr/5wcDEJHgfK5j
         iLgcMGhhVNAe+lj3DtdAKnJrU8KGmNll2PtCG7+MVi3xgIg3pj4JFhnB4v9nlJ93QqqM
         NrKLNzhw2SnrovEAOCdQhYD00aijNtidp9Cj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734675680; x=1735280480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOGdsmjkf/ZsaDTg5QmeQIHE5bE9RT/o4cYwTbhD1UY=;
        b=w2CxDwz1NpFIKCpqzUvlStv56IOzJ5nHow7Nj6HJN7q9qXgnT4SY2eNFbvfGfKApvB
         ddpBPJ6C+pgIFQ2zdxDQk9J2Ith0Vz6Q5ogI6G7ti5CAkL4vVGoAWJQPg/2RiecDvCof
         +oE9U0T/XfECxbV9gdwM00MhKp1UhHDuyD5bAL/c/paImJ7ZjF0eZqheVNOlfU+o5X+u
         Bn9y2n0QEd0Z0LPgwcQ1WQZe/WdHmY/zLKuA6ZK+UnhMdN69JmROvEuAlgiAdWpkb+Js
         YY6c0UnQ7580yzEm0sWzw2hczeRDyIQE28vsREgYslmv95Hs+7adZKS/CleSn0sZ+g//
         Rr8w==
X-Forwarded-Encrypted: i=1; AJvYcCXvppwxTLjtjnm+F7CpitmIeQ0fnnznh7RbBE6sWFJozMoYc+pXz4Grf0SoS93YJk4808xXK7VAgJShew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUkgMx525PIU0pvtp5yo5Vbi5tD+bjDtU9yzAz/3JBWkYBSWYx
	++z8hPojU3q4iviXRw2Pcjl/8Xlfi3hZ/PNLYv8fO+T5w1ZnVdUf0Ljt++hgig==
X-Gm-Gg: ASbGncsr6z4JRXLvY5Bj2IBiLr0UIhGGDm8w6iRlxsC479Pz66Pdhnt4JtF6iCcN95F
	Wl9kJGYy35q5rQqiA+uNOIb7CSTb5JIiZ0OcPBKog7huwHjjetCrh4Bnl1rRYj79GG8kC8I8O1C
	t9uclCOEZyOdKvuj48+xonyrFu1RJ+yn+dbYBKMiOkoBxPZ9V2GNEeGkX7oDvvNvPaREoGsZaA1
	wnZbdohLJ+sue6zZRzBjFIzvwHlQHMdKLyAzSILCK8BKCUJpbBERi0HB7Xj
X-Google-Smtp-Source: AGHT+IHmG4ABMEGyZD2Dg0KCz13DkbEKInc19TG97D4oO89Vky6w7HZ9nnlRXfw6AebtuVSxi6sUhw==
X-Received: by 2002:a05:6a21:3994:b0:1e1:afa9:d39b with SMTP id adf61e73a8af0-1e5e044fcbfmr3154550637.7.1734675680623;
        Thu, 19 Dec 2024 22:21:20 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:8e99:8969:ed54:b6c2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816540sm2426026b3a.22.2024.12.19.22.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:21:20 -0800 (PST)
Date: Fri, 20 Dec 2024 15:21:15 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCHv2] media: venc: destroy hfi session after m2m_ctx release
Message-ID: <ltiok5ryos2yh6bvd2md3p7k73rd6eu6fwagn2b4ij7tuljntn@dx6o5ralryui>
References: <20241219033345.559196-1-senozhatsky@chromium.org>
 <20241219053734.588145-1-senozhatsky@chromium.org>
 <1153ebfe-eb98-4b8c-8fd4-914e7a3e063b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1153ebfe-eb98-4b8c-8fd4-914e7a3e063b@linaro.org>

On (24/12/19 14:03), Bryan O'Donoghue wrote:
> On 19/12/2024 05:37, Sergey Senozhatsky wrote:
> > This partially reverts commit that made hfi_session_destroy()
> > the first step of vdec/venc close().  The reason being is a
> > regression report when, supposedly, encode/decoder is closed
> > with still active streaming (no ->stop_streaming() call before
> > close()) and pending pkts, so isr_thread cannot find instance
> > and fails to process those pending pkts.  This was the idea
> > behind the original patch - make it impossible to use instance
> > under destruction, because this is racy, but apparently there
> > are uses cases that depend on that unsafe pattern.  Return to
> > the old (unsafe) behaviour for the time being (until a better
> > fix is found).

[..]

> Two questions:
> 
> 1: Will this revert re-instantiate the original bug @

I'm afraid pretty much so, yes.  isr_thread runs concurrently
with close(), the instance is still in the streaming mode and
there are pending pkts.  As far as I understand it, stop_streaming()
is called from

close()
 v4l2_m2m_ctx_release()
  vb2_queue_release()        // ->cap_q_ctx.q  ->out_q_ctx.q
   vb2_core_queue_release()
    __vb2_cleanup_fileio()
	 vb2_core_streamoff()

At least this is how I understand the test that is failing.

I don't have a fix (nor even an idea) at this point.

> 2: Why not balanced out the ordering of calls by moving
>    hfi_session_create() in vdec_open_common() ? to match
>    the ordering in venus_close_common();


Something like this?

---

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 98c22b9f9372..9f82882b77bc 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1697,10 +1697,6 @@ static int vdec_open(struct file *file)
 	if (ret)
 		goto err_free;
 
-	ret = hfi_session_create(inst, &vdec_hfi_ops);
-	if (ret)
-		goto err_ctrl_deinit;
-
 	vdec_inst_init(inst);
 
 	ida_init(&inst->dpb_ids);
@@ -1712,15 +1708,19 @@ static int vdec_open(struct file *file)
 	inst->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
 	if (IS_ERR(inst->m2m_dev)) {
 		ret = PTR_ERR(inst->m2m_dev);
-		goto err_session_destroy;
+		goto err_ctrl_deinit;
 	}
 
 	inst->m2m_ctx = v4l2_m2m_ctx_init(inst->m2m_dev, inst, m2m_queue_init);
 	if (IS_ERR(inst->m2m_ctx)) {
 		ret = PTR_ERR(inst->m2m_ctx);
-		goto err_m2m_release;
+		goto err_m2m_dev_release;
 	}
 
+	ret = hfi_session_create(inst, &vdec_hfi_ops);
+	if (ret)
+		goto err_m2m_ctx_release;
+
 	v4l2_fh_init(&inst->fh, core->vdev_dec);
 
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
@@ -1730,10 +1730,10 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
-err_m2m_release:
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(inst->m2m_ctx);
+err_m2m_dev_release:
 	v4l2_m2m_release(inst->m2m_dev);
-err_session_destroy:
-	hfi_session_destroy(inst);
 err_ctrl_deinit:
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 err_free:
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index c1c543535aaf..c7f8e37dba9b 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1492,10 +1492,6 @@ static int venc_open(struct file *file)
 	if (ret)
 		goto err_free;
 
-	ret = hfi_session_create(inst, &venc_hfi_ops);
-	if (ret)
-		goto err_ctrl_deinit;
-
 	venc_inst_init(inst);
 
 	/*
@@ -1505,15 +1501,19 @@ static int venc_open(struct file *file)
 	inst->m2m_dev = v4l2_m2m_init(&venc_m2m_ops);
 	if (IS_ERR(inst->m2m_dev)) {
 		ret = PTR_ERR(inst->m2m_dev);
-		goto err_session_destroy;
+		goto err_ctrl_deinit;
 	}
 
 	inst->m2m_ctx = v4l2_m2m_ctx_init(inst->m2m_dev, inst, m2m_queue_init);
 	if (IS_ERR(inst->m2m_ctx)) {
 		ret = PTR_ERR(inst->m2m_ctx);
-		goto err_m2m_release;
+		goto err_m2m_dev_release;
 	}
 
+	ret = hfi_session_create(inst, &venc_hfi_ops);
+	if (ret)
+		goto err_m2m_ctx_release;
+
 	v4l2_fh_init(&inst->fh, core->vdev_enc);
 
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
@@ -1523,10 +1523,10 @@ static int venc_open(struct file *file)
 
 	return 0;
 
-err_m2m_release:
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(inst->m2m_ctx);
+err_m2m_dev_release:
 	v4l2_m2m_release(inst->m2m_dev);
-err_session_destroy:
-	hfi_session_destroy(inst);
 err_ctrl_deinit:
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 err_free:

