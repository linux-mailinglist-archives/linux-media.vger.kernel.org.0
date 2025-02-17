Return-Path: <linux-media+bounces-26208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED167A37D40
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 09:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 565CB170B2E
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 08:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4F81A0731;
	Mon, 17 Feb 2025 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xLJqBp9L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88CA3D68
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739781358; cv=none; b=uo2KFLhf6qtfQHeBwKUK8H1SbyX4enjjnF+eIbO5WPT8j+gqPfw/rZwt0kWaZ6lLaA45scyKDlPSf3YyRxVh4UixR+ZJJ9/rNJjk4byi3sUytvfMZ8rZ7gpKZvnfbfXLkRGX60sPmmi3gIFaNOwuvRqMQof5L4yifaNZExhgXgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739781358; c=relaxed/simple;
	bh=S69ZZjfOdrPVFoBds/qQKeD/akuFE94j3oqY2yde2i4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksFBiCN33QRonyjuAIYpUL3S497mBEi4ZOTimOQQvT4PJ6EOzNhazGLFsKV90lE+wsbRZgrd+5oKkBQ6x33//NnQGkSuvzDho693H4a4EJ/sf2YkULw79FuLywqp2TXBRJ8JMiPBQJTbY+ZEajvfgyVWWWAbcPN6+/h0XTbPKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xLJqBp9L; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e050b1491eso1565903a12.0
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 00:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739781354; x=1740386154; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGLFRh6HhKMu0frbhB3hgYXlddihjUuZYjE2fiF8fD4=;
        b=xLJqBp9Ls95BwynMXpDTJwJeiLGzC/S9vyWjnY3REFwn9S4HpwpOykZhhJx+8DxCn0
         TrxSITxc0WN03d3BngVxCH47j57S2M6oWhdKiFZeW8fvsLoiMjSdOA7yCu3PUyn74L7P
         AMsW1gS94WdMe3w7QTq2uTqcVarw0EwHVJYDRcsC+g9n7l66v7/m7gehfd+2w0R6ryLA
         +pjNTBQZPmC58RlUOG/L49KNuTnF+kGVaQ8DO0Ic+U5rNsa/x/NxBXiticle70uFNwOL
         M/hu2oarx7bZMKsb7iR1A7ez60EwYqq0HF7w6Hxr1AGkYMPc8WIeE9VzXGnthmAEoGKX
         iwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739781354; x=1740386154;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGLFRh6HhKMu0frbhB3hgYXlddihjUuZYjE2fiF8fD4=;
        b=nrluFPWhK5ZxuWXNVfvCRBFHnvZDeb18tXJ7B06RcoJkzR9V+B81oJFnC7LhI/7z+K
         7QnSgOb2mxsACurLT26xq+5eX38QdSQI/1cCR6ET6Ev/2g81JItZyyeMF5/JDjw/uyBL
         DRKvFhGliuHvm4vNjeLpYcBhkUEQKzKA8swGY21D976auBJ69x1nEZynv8mM8hp1nHnP
         5OHYvSgrkGWKprS9TBFH9ZRTFzC+8ha9m0sfIAGVTAmw3dE7uccwz5DFypDKi8o0Z+wE
         I8AHkvpzJIYmVGiFRly2Gzct3gbNv9eteUER1vogZHg9L6nYUxjU268mpPjNsqj2DT7n
         ySdA==
X-Gm-Message-State: AOJu0YyHSCVnwZ0uZo9ih+wynf/8VBXvMMpdMj0fNhb0xiwRbBm0B9oG
	TjGlg8D9aJHGAuH8cKvF3JhGJB5XDHmyVXkEsIJdHN+/H2+HKkL+iEr3EgUfa7w=
X-Gm-Gg: ASbGncs4l5hhmFX9WXYcFSigouaSkaDbynxNjfSspVQS2jiCeyYkklNOclNxo0CIgsq
	oicGZblgXJ8kzTccQh4bzDcmusImlFBR00SzE+oHvm+qoWMmL3dekTJvwnpiqoKQGlZfC+fv9Md
	mA4cp2jyaNcok1t02aCS3i3JBROg/73LfNPSYq+Jjrl/neYE3faigJZlewnV9R2eDJVy199PwHD
	SGGGvADv7WdQeVhv1mKGhcLOz8SE9uYwweikGyZZvCUldZ8xYDbaFpcEX91sAY7NGM+ufTJd+6G
	pCEfGbHh5Kb0AyNhvO5U
X-Google-Smtp-Source: AGHT+IFrIzS3pH42quVkNiBVlNWEyDQvZU3//km3EdF4x1rnreJ6kPjz+jgmkGUiSrLSk/HvlqjhwQ==
X-Received: by 2002:a17:906:3ca9:b0:aba:6385:576e with SMTP id a640c23a62f3a-abb70700a44mr772403566b.3.1739781354057;
        Mon, 17 Feb 2025 00:35:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abbad297430sm7833566b.5.2025.02.17.00.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:35:53 -0800 (PST)
Date: Mon, 17 Feb 2025 11:35:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: iris: introduce host firmware interface with
 necessary hooks
Message-ID: <634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Dikshita Agarwal,

Commit fb583a214337 ("media: iris: introduce host firmware interface
with necessary hooks") from Feb 7, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c:878 iris_hfi_gen2_handle_response()
	error: NULL dereference inside function iris_hfi_gen2_handle_system_error()

drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
    871 static int iris_hfi_gen2_handle_response(struct iris_core *core, void *response)
    872 {
    873         struct iris_hfi_header *hdr = (struct iris_hfi_header *)response;
    874         int ret;
    875 
    876         ret = iris_hfi_gen2_validate_hdr_packet(core, hdr);
    877         if (ret)
--> 878                 return iris_hfi_gen2_handle_system_error(core, NULL);
                                                                       ^^^^
This will lead to a NULL dereference

    879 
    880         if (!hdr->session_id)
    881                 return iris_hfi_gen2_handle_system_response(core, hdr);
    882         else
    883                 return iris_hfi_gen2_handle_session_response(core, hdr);
    884 }

regards,
dan carpenter

