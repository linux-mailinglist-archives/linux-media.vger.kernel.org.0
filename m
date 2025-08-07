Return-Path: <linux-media+bounces-39063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD1CB1DB31
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 18:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 683707A6F34
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 15:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6449D26CE2C;
	Thu,  7 Aug 2025 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yJIxa9Qp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC16267B92
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 16:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582461; cv=none; b=SCxgjcG6GThEzjA1vGiX+CWJZ8Ak3RttRd0S5fDOEt34iLNkPeLIcAYT8jsly9d/5qZ7VlPWXH52bv40kBl8Dh/RAgu2z2i1lhcN1vJKVS1t4GifYhtQnI5NyV05p6B3ZI+HYae7Zdf+BzS+iGt37Daf40J+Cu8l1GqHBK1aza8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582461; c=relaxed/simple;
	bh=Gt6+dbcB1q0rdTbsmYUiKvoHSE5Ym+HgPaUH2mA4NE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IwUZaTMzyE0q9CauYEiolKW+QBiTzOOaQDPfX3D+zgLxiZUKOtUC9StnlE0gqY7N3o6DfVS2LoKsmQ8zEDCE8qsVuDfJloCU9UiJk+IYRHlOKqnKlfcm9EMlDOvLlFadaPc3ltyc90Q4Z2pxlR5MkU28ZDsTnYI1BHmvGTuSpJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yJIxa9Qp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso8213345e9.2
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 09:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754582458; x=1755187258; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dr6FBHzwX3eTyKfHZchP63hrZQ6u8tw7ZAjbpylBYI0=;
        b=yJIxa9QpZs5O+auwMazCQDOb8bXuQHoqnXwSR/fj24IRwD0y3cSrkkCByr1PU6xcuv
         mPG7X1mZ5cNNLQVpzcSdoFex/oz7+fwbU3pftfeFv0nJEm+jP4aylRVzHxyetsjxU45w
         1lFVX7w7PmYgTHW/s4iznAN82f7nlBWX5Eew3SBEiHKLVOrTibgrZYdSCVzWtx8AQAI0
         gGIWcuAztvM35vhmj7lLWR2xbZ9WhTthSqy9QXHb4cFZr087rzyOGdQeAV3NBePgf7il
         x+4VMisQSfMVu++eOQZaNGwsfVczFU16BD68QSt1oJdFbRghdZUnXYLR4nxYZAaZirlI
         X1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582458; x=1755187258;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dr6FBHzwX3eTyKfHZchP63hrZQ6u8tw7ZAjbpylBYI0=;
        b=ZzqeK35VpfF7aOX9WUVz0U4r9P0j+xEHPav4rYmfsvW8sPlBW1Cyj0c/tqWNeLHtMA
         dKKCtl3Jq3oHEnh78zxy6HUkNU7n9HyIVuC0WG8ZxC5Fd/gJJP2NRL+BScj3WiXLxg8L
         N3T0fPyvrNeED2pQK1biyRO7VXO4Boz1s/NrYVvddV5bUCuONfdtDhCYFQZ5dT8ZdEss
         Bvw/Qf8yf7+h6AlOpPRc0LegQA+CQSh8Ia6ig+aaZem0B5jIAQw2iXl9IL5+SQEDGuJQ
         tzrUTaOGyXMV3g0wwRWcGE6iuOzujEmvSDjaxDhyNi24cmBh3yg9epEODzRWm6avVcHZ
         uDEQ==
X-Gm-Message-State: AOJu0Yzs1d8ST1bC940MzKad8cmqEmn8JmmH2sgud+WDLik7XRKqMuNj
	72vLz1gquC/zpnzlfaHCdTsE2Yny5o1akhTB8y8Ky5n3ocwCYXuiw2fX49bxNPvsZ00=
X-Gm-Gg: ASbGncvTv/WONV7ny+5ZQPS5/D5629C9AJQIaWRyS/l5HXRgCFpsx5xgt12v1qYN2RY
	jf6jQJTvtkGBMifBl0e4o+HsNP8cl6ghAf8x7RuVys1m1bwc6hft65yoJnD3YD1CpS1o22+saTc
	Mi6BkK6F9WeSQMtUKgftYsaa/riUocQtBEDd6y+DaWtdJ5f/TynQFfYv/mdc3Pi4RK9K1UJzoJM
	/PM4miOa0Aq2t3+XuwsIJRv/KZaK7SIAYLqe7XYj2BNGbYnRAi5j0XLePk11LXUtzi6/JLaO7aT
	KkMCb3fkrdu+U25QRUQ+rbY6QbP8M9vmu094KVBYBcn4t0qv/j+nswtMiXOUm0dIr/ZutRAgoks
	lOvnHszk1xA5P82mBHYt+HnGLGWs=
X-Google-Smtp-Source: AGHT+IHn1bzy9/wv9h73KG6SIwvZUbFU0uyciZGOD58bVmhqsJOtqDR/PG3xfbeBeTxpvUUB37AwHw==
X-Received: by 2002:a05:6000:258a:b0:3b7:9af4:9c93 with SMTP id ffacd0b85a97d-3b8f41c836cmr7155256f8f.35.1754582458154;
        Thu, 07 Aug 2025 09:00:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458b8aab8c0sm231753495e9.19.2025.08.07.09.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 09:00:57 -0700 (PDT)
Date: Thu, 7 Aug 2025 19:00:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [bug report] media: subdev: Add v4l2_subdev_call_state_try() macro
Message-ID: <aJTNtpDUbTz7eyJc@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Tomi Valkeinen,

Commit 982c0487185b ("media: subdev: Add v4l2_subdev_call_state_try()
macro") from Jul 1, 2022 (linux-next), leads to the following Smatch
static checker warning:

	drivers/media/platform/st/stm32/stm32-dcmi.c:995 dcmi_try_fmt()
	error: 'state' dereferencing possible ERR_PTR()

drivers/media/platform/st/stm32/stm32-dcmi.c
    993 
    994         v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
--> 995         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);

The problem is the v4l2_subdev_call_state_try() macro:

  1965  #define v4l2_subdev_call_state_try(sd, o, f, args...)                 \
  1966          ({                                                            \
  1967                  int __result;                                         \
  1968                  static struct lock_class_key __key;                   \
  1969                  const char *name = KBUILD_BASENAME                    \
  1970                          ":" __stringify(__LINE__) ":state->lock";     \
  1971                  struct v4l2_subdev_state *state =                     \
  1972                          __v4l2_subdev_state_alloc(sd, name, &__key);  \
                                ^^^^^^^^^^^^^^^^^^^^^^^^^
If this fails

  1973                  v4l2_subdev_lock_state(state);                        \
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
then it leads to a crash.

  1974                  __result = v4l2_subdev_call(sd, o, f, state, ##args); \
  1975                  v4l2_subdev_unlock_state(state);                      \
  1976                  __v4l2_subdev_state_free(state);                      \
  1977                  __result;                                             \
  1978          })


regards,
dan carpenter

