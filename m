Return-Path: <linux-media+bounces-20306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 409A09AFEC6
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 11:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD5F0B257F9
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 09:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A351D4153;
	Fri, 25 Oct 2024 09:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IlhpFzaG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F271B0F03
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729849676; cv=none; b=LU+cg736TwWuEFjpvMv6U0NY7reKYNbc3nIDOwycTDqV3Hk2lHZekFXZ/C4zvUQpXfI05jdHRwVjQ0sYhcO4QC5zF3P3+ttBpbMxadvwdXsfNbZvx20cLg1nwjpIbY7IfEojhHYLwWFb4AHtuOGfH7JjJ2N9W9NPjpizJOzo1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729849676; c=relaxed/simple;
	bh=3K1JtEatL0+Zhj+THwMINdq1rlHw71sDJ0gT1stxUMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSMaCHEO6UPtIpqCsQ1MhY9sg4/suq+5hD1x5o/wDEM36WaA1G7Pwrbcdaprs1h2k3kw9LNAOgpliLAjrM7b8oMwbd27D+f5/o0TS/WDpr4gIbVvKiB0bHpPWuuRwCwd2T/8fXmUVl+nKvuJyHMMYQR/z0m8vKht9MglPcO6nFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IlhpFzaG; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so1278094b3a.0
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 02:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729849674; x=1730454474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T9CKiFsRnmLBFfisM81QupOecDw4eaBPewamz//kmtQ=;
        b=IlhpFzaGWoWuXdRXxDiguf65+JN1U3NGGwivQLPDrYJYcsb+Bx83FZETddv5bTLi7s
         TNTbfy+dmLo7Ko6sDy+MvVUowb52nbRvV9Idqblg9nEnJubFQ2iRZQGZprFmwK8Qc0Gw
         CuNvqUg3Zi70qpZu05t6duEHmVOemJgHshVG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849674; x=1730454474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9CKiFsRnmLBFfisM81QupOecDw4eaBPewamz//kmtQ=;
        b=NRVJrfdcqCjN6zpf7Tmecx8XGyKQVGndUu8RoqvTeYfkeY1gtR0NtZc/p5G2r/9SmW
         PuF8RVyVgBY+YTqJEfzVFi8R5kExjZynPvY0CPNK5uyyY+FoKbwXR9PekIolkoANIWfV
         xp1zmFwW2n5fwry9fVkptoHCIjUy6142QlS8Qc9X2N9kjbml+UfMla3170Qa476fKv8q
         MLzgQt3UT+lV3sozO3YU6H+6bLx7c3IRr9hjA5bzBr6QHDM3/zfUdhQyYPdgBCEC8Vy6
         HiOWuR2jk8AbjnFHMxNsXiqBRa7+iahzlvyc/isyIIywvbiuIhiejn2UiKfEqSVLXi4e
         DJIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX2uMEovT3dU6NaN1Dk+x+0Wlii5u/h9iMetyTUhE9L2tgeKRf4EJMEfANz6ekg86rn8TG6L9M968tMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDuNrYLPt6KUKBZByRJZJjXiOjyTEXNLnl9mXaZQurpcek/y8D
	s2bVDJ3S1AsjHbS5Kpspk+uJCc0RjewaVEmHl6RBF16z9xD/eGRk5pIfACBUew==
X-Google-Smtp-Source: AGHT+IGklc15+6fOaZ6NemtX9ERYiKzi4tqLcYRx2aXPchXUlIePxq0pGrPQVMzExzUUN5qpA2VBLg==
X-Received: by 2002:a05:6a20:e605:b0:1d9:b78:2dd3 with SMTP id adf61e73a8af0-1d989b20e32mr6069327637.26.1729849673965;
        Fri, 25 Oct 2024 02:47:53 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:bd37:bccf:f3e:a9ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057932c62sm719185b3a.45.2024.10.25.02.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 02:47:53 -0700 (PDT)
Date: Fri, 25 Oct 2024 18:47:49 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tomasz Figa <tfiga@google.com>
Subject: Re: [PATCHv3 1/3] media: venus: fix enc/dec destruction order
Message-ID: <20241025094749.GP1279924@google.com>
References: <20241025034629.660047-1-senozhatsky@chromium.org>
 <20241025034629.660047-2-senozhatsky@chromium.org>
 <9a818584-3f14-ac6e-149d-901668956233@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a818584-3f14-ac6e-149d-901668956233@quicinc.com>

On (24/10/25 12:50), Dikshita Agarwal wrote:
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> > index 6252a6b3d4ba..0013c4704f03 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -1752,13 +1752,14 @@ static int vdec_close(struct file *file)
> >  	cancel_work_sync(&inst->delayed_process_work);
> >  	v4l2_m2m_ctx_release(inst->m2m_ctx);
> >  	v4l2_m2m_release(inst->m2m_dev);
> > -	vdec_ctrl_deinit(inst);
> >  	ida_destroy(&inst->dpb_ids);
> >  	hfi_session_destroy(inst);
> > -	mutex_destroy(&inst->lock);
> > -	mutex_destroy(&inst->ctx_q_lock);
> >  	v4l2_fh_del(&inst->fh);
> >  	v4l2_fh_exit(&inst->fh);
> > +	vdec_ctrl_deinit(inst);
> Why vdec_ctrl_deinit ->v4l2_ctrl_handler_free(&inst->ctrl_handler) needs to
> be called after v4l2_fh_exit?
> Ideally it should be before v4l2_fh_exit.

Because ->fh holds a pointer to ->ctrl_handler

	inst->fh.ctrl_handler = &inst->ctrl_handler

so after vdec_ctrl_deinit() fh holds stale (released) data.
In general destruction in reverse order of initialization is
safer.

init:
	init ctrl
	init fh     // using ctrl

de-init:
	release fh
	release ctrl

